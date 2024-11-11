<?php

namespace App\Http\Controllers;

use App\Models\Document;
use Illuminate\Http\Request;
use OpenAI\Laravel\Facades\OpenAI; 

class GPTDictionaryController extends Controller
{
    public function explainSentence(Request $request)
    {
        $request->validate(['sentence' => 'required|string']);
        $sentence = $request->input('sentence');
        $language = $request->input('language');

        $prompt = "Explain this sentence and provide definitions for each word in $language (the response should be in $language): \"$sentence\". Format the response as follows:
        1. **Global explanation**: Provide a high-level explanation of the sentence.
        2. **Word-by-word explanation**: Explain each word in detail. Include translations if possible.";

        $response = OpenAI::chat()->create([
            'model' => 'gpt-4',
            'messages' => [
                ['role' => 'user', 'content' => $prompt],
            ],
            'max_tokens' => 400, 
        ]);

        $explanation = $response['choices'][0]['message']['content'];
 
        return response()->json([
            'explanation' => $explanation
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

    public function destroy($id)
    {
        // Find the dictionary entry by ID
        $dict = Document::find($id);

        // Check if the entry exists
        if (!$dict) {
            return response()->json(['error' => 'Document not found.'], 404);
        }

        // Delete the entry
        $dict->delete();

        // Return a success response
        return response()->json(['message' => 'Document deleted successfully.']);
    }
}