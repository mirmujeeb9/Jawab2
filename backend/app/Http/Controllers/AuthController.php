<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Laravel\Socialite\Facades\Socialite;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;


class AuthController extends Controller
{
    public function signup (Request $request){
        //validateing request
        $validator = Validator::make($request->all(),[
            'name' => 'required|string|max:255',
            'email'=> 'required|string|max:255|unique:users',
            'password' => 'required|string|min:8',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        $token = $user->createToken('authToken')->plainTextToken;


        return response()->json([
            'message' => 'User successfully registered',
            'user' => $user,
        ], 201);
    }
    

    public function getAllUsers()
    {
        //Getting all Users 
        $users = User::all();
        return response()->json($users);
    }

    public function login(Request $request)
    {
        $credentials = $request->only('email','password');

        if(Auth::attempt($credentials)){
            $user = Auth::user();
            $token = $user->createToken('userAuth')->plainTextToken;

            return response()->json([
                'message' => 'Login successful',
                'user' => $user,
                'token' => $token,
            ]);
        }

        return response()->json([
            'message' => 'Invalid credentials',
        ], 401);
    }

    public function logout(Request $request)
    {
        $user = Auth::user();
        $user->tokens()->delete();

        return response()->json([
            'message' => 'Successfully logged out',
        ]);
    }

    public function redirectGoogle(){
        return Socialite::driver('google')->redirect();
    }

    public function callbackGoogle(){
        try{
            $google_user = Socialite::driver('google')->user();
            $user = User::where('google_id',$google_user->getId())->first();

            if(!$user){
                $new_user = User::create([
                    'name'=> $google_user->GetName(),
                    'email'=> $google_user->getEmail(),
                    'google_id'=> $google_user->getId()
                ]);
                Auth::login($new_user);
                return redirect()->intended('dashboard');
            } 
            else {
                Auth::login($user);
                return redirect()->intended('dashboard');
            }

            

        } catch (\Throwable $th){
            dd('something went wrong '. $th->getMessage());
        }
    }

    public function redirectFacebook()
    {
        return Socialite::driver('facebook')->redirect();
    }

    // Handle the callback from Facebook
    public function callbackFacebook()
    {
        try {
            $facebookUser = Socialite::driver('facebook')->user();
            $user = User::where('facebook_id', $facebookUser->getId())->first();

            if (!$user) {
                // Create a new user if not found
                $user = User::create([
                    'name' => $facebookUser->getName(),
                    'email' => $facebookUser->getEmail(),
                    'facebook_id' => $facebookUser->getId(),
                ]);
            }

            // Log the user in
            Auth::login($user);

            // Redirect to the dashboard or intended page
            return redirect()->intended('dashboard');

        } catch (\Exception $e) {
            return redirect()->route('login')->withErrors(['message' => 'Something went wrong.']);
        }
    }
}
