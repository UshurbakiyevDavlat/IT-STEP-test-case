<?php


namespace App\Http\Controllers;


use App\Http\Controllers\Controller;
use App\Mail\FeedbackMail;
use App\Models\User;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use OAuthProvider;

class RegisterController extends Controller
{


//    public function __construct()
//    {
//        $this->middleware('guest', [
//            'except' => 'logout',
//        ]);
//    }

    public function register(Request $request): JsonResponse
    {

        $validator = Validator::make($request->all(),[
            'email' => 'required|email',
        ]);
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }


        $input = $request->all();
        $user = User::query()->create($input);
        $input['api_token'] = $this->registered($request,$user);
//        $this->initiateEmailActivation($user);

        $success['token'] = $input['api_token'];
        $success['name'] =  $user->email;


            $mailBody = new FeedbackMail("Successfully registered!");
            $mailBody->build();

            $mail = new FeedbackController();
            $mail->send($mailBody);
        return $this->sendResponse($success, 'User register successfully.');


    }

    protected function registered(Request $request, $user): JsonResponse
    {


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
