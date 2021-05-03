<?php

namespace App\Http\Controllers;
session_start();
use App\Models\User;
use Facade\FlareClient\Http\Response;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use OAuthProvider;
class LoginController extends Controller
{
    /**
     * Handle an authentication attempt.
     *
     * @param  \Illuminate\Http\Request $request
     *
     * @return Response|JsonResponse|\Illuminate\Http\RedirectResponse
     */

    public function logout(Request $request) {
            $user = Auth::guard('api')->user();
            if($user) {
                $user['api_token'] = null;
                $user->getRememberToken();
            }
            $_SESSION['u_id']=null;
        return response()->json(['data' => 'User logged out.'], 200);
    }
    public function authenticate(Request $request)
    {
        $credentials = $request->only('email', 'password');
        $user = auth()->user();
//        if (Auth::attempt($credentials)) {
//            // Authentication passed...
//            return redirect()->intended('dashboard');
//        } else {
//           return  404;
//        }


        print_r($user);

        $credentials = $request->only('id','email', 'password');


//        $arrE =  User::query()->get('email');
//        $arrP = User::query()->get('password');


        $arr = User::query()->get('*');


        $auth = false;
        $Email = '';
        $Password = '';
        $uid = '';
        foreach ($arr as $user) {
            if ($user['email'] == $credentials['email'] && $user['password'] == $credentials['password']) {
                $auth = true;
                $Email = $user['email'];
                $uid = $user['id'];
                break;
            }
        }
//        $authE = false;
//        $authP = false;



        if ($auth) {
            $_SESSION['u_id'] = $uid;

            User::query()->where('users.id','=',"$uid")->update([
                'api_token' =>md5("token".$uid)
            ]);

            return $this->sendResponse($Email, 'User Log in successfully.');
        } else {
            return $this->sendError('Validation Error.');
        }

//         foreach ($arrE as $email) {
//
//             if ($email['email'] == $credentials['email']){
//                 $authE = true;
//                 $Email = $email['email'];
//             }
//         }
//        foreach ($arrP as $pass) {
//            if ($pass['password'] == $credentials['password']){
//                $authP = true;
//                $Password = $pass['password'];
//            }
//        }
//


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
