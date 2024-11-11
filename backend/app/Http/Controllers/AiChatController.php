<?php 

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use OpenAI;

class AIChatController extends Controller
{
    public function chat(Request $request)
    {
        // Validate the input
        $request->validate([
            'message' => 'required|string',
        ]);

        // Get the user message from the request
        $userMessage = $request->input('message');

        try {
            // Create an OpenAI client instance
            $openai = OpenAI::client(env('OPENAI_API_KEY'));

            // Send the message to OpenAI's API and get the response
            $response = $openai->chat()->create([
                'model' => 'gpt-3.5-turbo', // or 'gpt-4', depending on the model you want to use
                'messages' => [
                    ['role' => 'system', 'content' => 'You are a helpful assistant.'],
                    ['role' => 'user', 'content' => $userMessage],
                ],
            ]);

            // Extract the reply from OpenAI's response
            $reply = $response['choices'][0]['message']['content'];

            // Return the response as JSON
            return response()->json([
                'message' => 'success',
                'reply' => $reply,
            ]);

        } catch (\Exception $e) {
            // Handle errors
            return response()->json([
                'message' => 'error',
                'error' => $e->getMessage(),
            ], 500);
        }
    }
}
