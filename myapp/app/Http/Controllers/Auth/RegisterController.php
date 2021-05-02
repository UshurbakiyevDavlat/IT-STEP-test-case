<?php


namespace App\Http\Controllers\Auth;


use App\Http\Controllers\Controller;
use App\Models\User;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;

class RegisterController extends Controller
{

    use RegistersUsers;
    public function __construct()
    {
        $this->middleware('guest', [
            'except' => 'logout',
        ]);
    }

    public function register(Request $request): JsonResponse
    {

        $validator = Validator::make($request,[
            'email' => 'required|email',
        ],[
            'email.required'                => trans('auth.emailRequired'),
        ]);
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }

        $user = new User();

        $user = User::query()->create(
            [
                'email' =>strip_tags($request['email']),
                'token' =>$this->registered($request, $user)
            ]
        );

        $this->initiateEmailActivation($user);

//        $success['token'] =$user->token
//        $success['name'] =  $user->email;



        return $this->sendResponse($user, 'User register successfully.');


    }

    protected function registered(Request $request, $user): JsonResponse
    {
        $user->generateToken();

        return response()->json(['data' => $user->toArray()], 201);
    }

    private function sendError($error, $errorMessages = [], $code = 404): JsonResponse
    {
        $response = [
           'success' => false,
            'message' => $error,
        ];
        if(!empty($errorMessages)){
            $response['data'] = $errorMessages;
        }
        return response()->json($response, $code);
    }
    public function sendResponse($result, $message): JsonResponse
    {
        $response = [
            'success' => true,
            'data'    => $result,
            'message' => $message,
        ];
        return response()->json($response, 200);
    }


}
