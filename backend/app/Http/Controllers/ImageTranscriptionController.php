<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use thiagoalessio\TesseractOCR\TesseractOCR;


class ImageTranscriptionController extends Controller
{
    public function transcribe(Request $request)
    {
        // Validate the uploaded file
        $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg|max:2048',
        ]);

        // Store the uploaded image
        $imagePath = $request->file('image')->store('uploads', 'public');

        // Perform OCR on the image
        $text = (new TesseractOCR(public_path('storage/' . $imagePath)))->run();

        // Return the extracted text as a JSON response
        return response()->json([
            'text' => $text,
        ]);
    }
}
