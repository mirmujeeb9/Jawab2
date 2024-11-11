<?php

namespace App\Http\Controllers;

use App\Models\Document;
use Illuminate\Http\Request;
use OpenAI\Laravel\Facades\OpenAI; 


class TranslatorController extends Controller
{
    public function translateSentence(Request $request)
    {
        $request->validate(['sentence' => 'required|string']);
        $sentence = $request->input('sentence');
        $language = $request->input('language');

        $prompt = "translate this sentence to $language (the response should be in $language): \"$sentence\". Just give the translation";

        $response = OpenAI::chat()->create([
            'model' => 'gpt-4',
            'messages' => [
                ['role' => 'user', 'content' => $prompt],
            ],
            'max_tokens' => 400, 
        ]);

        $translation = $response['choices'][0]['message']['content'];
 
        return response()->json([
            'translation' => $translation
        ]);
    }

    public function saveDocument(Request $request)
    {
    
        $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required|string',
        ]);

        $document = new Document();
        $document->title = $request->title;
        $document->content = $request->content;
        $document->type = $request->type;
        $document->date_created = now()->toDateString(); 
        $document->save(); 

        return response()->json(['message' => 'Document saved successfully!', 'document' => $document], 201);
    }
}
