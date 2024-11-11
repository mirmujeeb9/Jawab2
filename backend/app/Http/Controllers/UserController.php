<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{

    public function getUserProfile(Request $request)
    {
        $user = $request->user();

        return response()->json([
            'id' => $user->id,
            'name' => $user->name,
            'email' => $user->email,
    
        ]);
    }

   public function updateUserProfile(Request $request)
{
    // Define validation rules
    $validator = Validator::make($request->all(), [
        'name' => 'required|string|max:255',
        'email' => 'required|email|unique:users,email,' . $request->user()->id,
        'password' => 'nullable|string|min:8|confirmed', // Optional password with confirmation
        'phone' => 'nullable|string|max:15',
        'address' => 'nullable|string|max:255',
        'avatar' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048', // Optional image upload
    ]);

    // Check for validation errors
    if ($validator->fails()) {
        return response()->json(['errors' => $validator->errors()], 400);
    }

    // Get the authenticated user
    $user = $request->user();

    // Update user fields
    $user->name = $request->name;
    $user->email = $request->email;
    $user->phone = $request->phone;
    $user->address = $request->address;

    // Update password if provided
    if ($request->filled('password')) {
        $user->password = Hash::make($request->password);
    }

    // Handle avatar upload if provided
    if ($request->hasFile('avatar')) {
        $avatarPath = $request->file('avatar')->store('avatars', 'public');
        $user->avatar = $avatarPath;
    }

    // Save user data
    $user->save();

    // Return success response
    return response()->json([
        'message' => 'Profile updated successfully.',
        'user' => $user
    ], 200);
}

    public function updatePassword(Request $request)
{
    $validator = Validator::make($request->all(), [
        'current_password' => 'required',
        'new_password' => 'required|min:8|confirmed', // 'confirmed' checks for new_password_confirmation field
    ]);

    if ($validator->fails()) {
        return response()->json(['errors' => $validator->errors()], 422);
    }

    $user = auth()->user();

    // Check if the provided current password is correct
    if (!Hash::check($request->current_password, $user->password)) {
        return response()->json(['message' => 'Current password is incorrect'], 403);
    }

    // Update the password
    $user->password = Hash::make($request->new_password);
    $user->save();

    return response()->json(['message' => 'Password updated successfully']);
}
}
