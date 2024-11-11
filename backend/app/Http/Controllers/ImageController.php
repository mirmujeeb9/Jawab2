<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ImageController extends Controller
{
    public function store(Request $request)
    {
        // Validate the uploaded image file
        $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',  // Max file size 2MB
        ]);
    
        try {
            // Store the uploaded image
            $imageFile = $request->file('image');
    
            // Store the image in the 'public/images' directory
            $path = $imageFile->store('images', 'public'); // Specify 'public' disk
    
            // Return a success response with the file path
            return response()->json([
                'message' => 'Image uploaded successfully',
                'path' => $path,
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Error during image upload',
                'error' => $e->getMessage(),
            ], 500);
        }
    }

    public function index()
    {
        // Get all images from the 'public/images' directory
        $images = Storage::disk('public')->files('images');
    
        // Map the images to include full URLs
        $imageUrls = array_map(function ($path) {
            return Storage::url($path); // Generate URL for each image
        }, $images);
    
        // Return the list of image URLs
        return response()->json([
            'message' => 'Images retrieved successfully',
            'images' => $imageUrls,
        ], 200);
    }
    
    public function show($filename)
{
    // Check if the file exists in the storage
    if (Storage::disk('public')->exists("images/$filename")) {
        // Get the full URL for the image
        $url = Storage::url("images/$filename"); // This should work correctly if the link is set

        // Return a response with the image URL
        return response()->json([
            'message' => 'Image found',
            'url' => $url,
        ]);
    }

    // Return a 404 response if the image does not exist
    return response()->json([
        'message' => 'Image not found',
    ], 404);

}
}


