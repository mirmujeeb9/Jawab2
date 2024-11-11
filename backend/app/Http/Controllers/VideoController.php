<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class VideoController extends Controller
{
    // Get all uploaded videos
    public function index()
    {
        // Get all videos from the 'public/videos' directory
        $videos = Storage::disk('public')->files('videos');

        // Map the videos to include full URLs
        $videoUrls = array_map(function ($path) {
            return Storage::url($path); // Generate URL for each video
        }, $videos);

        // Return the list of video URLs
        return response()->json([
            'message' => 'Videos retrieved successfully',
            'videos' => $videoUrls,
        ], 200);
    }

    // Store a new video
    public function store(Request $request)
    {
        // Validate the uploaded video file
        $request->validate([
            'video' => 'required|file|mimes:mp4,avi,mov,mkv|max:20480',  // Max file size 20MB
        ]);

        try {
            // Store the uploaded video
            $videoFile = $request->file('video');

            // Store the video in the 'public/videos' directory
            $path = $videoFile->store('videos', 'public'); // Specify 'public' disk

            // Return a success response with the file path
            return response()->json([
                'message' => 'Video uploaded successfully',
                'path' => Storage::url($path), // Include the full URL
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Error during video upload',
                'error' => $e->getMessage(),
            ], 500);
        }
    }

    // Get a specific video by filename
    public function show($filename)
    {
        // Check if the file exists in the storage
        if (Storage::disk('public')->exists("videos/$filename")) {
            // Get the full URL for the video
            $url = Storage::url("videos/$filename"); // This should work correctly if the link is set

            // Return a response with the video URL
            return response()->json([
                'message' => 'Video found',
                'url' => $url,
            ]);
        }

        // Return a 404 response if the video does not exist
        return response()->json([
            'message' => 'Video not found',
        ], 404);
    }
}
