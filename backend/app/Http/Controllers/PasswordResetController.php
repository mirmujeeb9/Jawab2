<?php
namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Mail;
use App\Mail\Email;
use Illuminate\Auth\Events\PasswordReset;


class PasswordResetController extends Controller
{
    public function sendResetLinkEmail(Request $request)
    {
        // Validate the email input
    $request->validate(['email' => 'required|email|exists:users,email']);

    // Generate the password reset token
    $user = User::where('email', $request->email)->first();
    $token = Password::createToken($user); // Create a token for the user

    // Create the reset link URL
    $resetLink = url('password/reset', $token).'?email='.urlencode($request->email);

    // Send the email using Mail::raw
    Mail::raw("Click here to reset your password: {$resetLink}", function ($message) use ($request) {
        $message->to($request->email)
                ->subject('Password Reset Link');
    });

    // Return a success response
    return response()->json(['message' => 'Reset link sent to your email.']);

    }

    public function reset(Request $request)
{
    // Validate the incoming request data
    $request->validate([
        'token' => 'required',
        'email' => 'required|email|exists:users,email',
        'password' => 'required|confirmed|min:6',
    ]);

    // Attempt to reset the password
    $response = Password::reset(
        $request->only('email', 'password', 'password_confirmation', 'token'),
        function ($user, $password) {
            $user->password = bcrypt($password); // Hash the new password
            $user->save(); // Save the new password
        }
    );

    // Return appropriate response based on the outcome
    return $response == Password::PASSWORD_RESET
        ? response()->json(['message' => 'Password has been reset.'])
        : response()->json(['error' => 'Failed to reset password.'], 400);
}
}
