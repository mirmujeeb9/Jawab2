<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use GuzzleHttp\Client;

class VowelController extends Controller
{
    public function addVowels(Request $request)
    {
        // Validate the request input
        $request->validate([
            'text' => 'required|string'
        ]);

        $arabicText = $request->input('text');

        // Optional: Use a third-party API (e.g., Tashkeel or another service) to add vowels
        // Assuming a third-party service here, for illustration purposes
        $client = new Client();
        $response = $client->post('https://tashkeel-api-url.com/vowels', [
            'form_params' => [
                'text' => $arabicText
            ]
        ]);

        $voweledText = json_decode($response->getBody()->getContents(), true)['voweledText'];

        // Return the voweled text as a JSON response
        return response()->json([
            'original_text' => $arabicText,
            'voweled_text' => $voweledText,
        ]);
    }
}
