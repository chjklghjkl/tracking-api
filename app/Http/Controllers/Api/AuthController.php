<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{

    /**
     * AuthController constructor.
     */
    public function __construct()
    {

    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
	 public function hello(){
		return response()->json(['error'=>'failure','status'=>'401']);
	 }
    public function register(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
        ]);

        $user = User::create([
            'name' => $validatedData['name'],
            'email' => $validatedData['email'],
            'password' => Hash::make($validatedData['password']),
        ]);

        $token = $user->createToken('auth_token')->plainTextToken;
        $token = explode("|", $token);
        if(isset($token[1]) && $token[1] != "")
        {
            return response()->json([
                'success'=>'1',
                'message'=>'registration Sucessfully',
                'result'=>[
                'access_token' => $token[1],
                'token_type' => 'Bearer',
                ],
            ]);
        }
        return response()->json([
            'error'=>'0',
            'message' => "Something went wrong.",
        ]);
    }


    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    
    public function login(Request $request)
    {
        if (!Auth::attempt($request->only('email', 'password'))) {
            return response()->json([
                'message' => 'Invalid login details'
            ], 401);
        }

        $user = User::where('email', $request['email'])->firstOrFail();
          
        $token = $user->createToken('auth_token')->plainTextToken;

        $token = explode("|", $token);
        if(isset($token[1]) && $token[1] != "")
        {
            return response()->json([
                'success'=>'1',
                'message'=>'login successfully',
                'result'=>[
                'access_token' => $token[1],
                'token_type' => 'Bearer',
                ],
            ]);
        }
        return response()->json([
            'error'=>'0',
            'message' => "Something went wrong.",
        ]);
    }
}
