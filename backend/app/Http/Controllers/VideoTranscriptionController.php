<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class VideoTranscriptionController extends Controller
{
    public function transcribe(Request $request)
    {
        // Validate the request
        $request->validate([
            'video_file' => 'required|file|mimes:mp4,mov,avi,wmv,flv|max:51200', // Limit to 50MB
        ]);

        $videoFile = $request->file('video_file');

        // Store the uploaded file
        $filePath = $videoFile->store('videos', 'public'); // Store in public/videos

        // Get the full path to the video file
        $fullFilePath = storage_path('app/public/' . $filePath);

        // Transcribe the audio from the video file
        $transcribedText = $this->transcribeAudioWithWhisper($fullFilePath);

        // Clean up the uploaded file if necessary
        // unlink($fullFilePath);

        // Return the transcribed text
        return response()->json([
            'transcribed_text' => $transcribedText,
        ]);
    }

    private function transcribeAudioWithWhisper($audioFilePath)
{
    $apiKey = env('OPENAI_API_KEY');

    // Create a multipart request for the audio transcription
    $response = Http::withHeaders([
        'Authorization' => 'Bearer ' . $apiKey,
    ])->attach('file', fopen($audioFilePath, 'r'), basename($audioFilePath)) // Attach the file
      ->post('https://api.openai.com/v1/audio/transcriptions', [
          'model' => 'whisper-1', // Specify the Whisper model
          'language' => 'en', // Set the language
      ]);

    // Check if the response is successful
    if ($response->successful()) {
        $data = $response->json();

        // Check if 'text' is present in the response
        if (isset($data['text']) && is_string($data['text'])) {
            return $data['text']; // Return the transcribed text
        } else {
            return 'Transcription error: No valid text returned.';
        }
    } else {
        // Log or display the error from the API response
        return 'Error transcribing audio: ' . $response->body();
    }
}

    
}
