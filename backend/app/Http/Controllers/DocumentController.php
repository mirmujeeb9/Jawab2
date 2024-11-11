<?php

namespace App\Http\Controllers;

use App\Models\Document;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DocumentController extends Controller
{
    public function index()
    {
        // Retrieve all documents for the authenticated user
        $docs = Document::where('user_id', Auth::id())->get();

        // Return a JSON response with the user's documents
        return response()->json($docs);
    }

    public function getDoc($id)
    {
        // Find the document by ID and ensure it belongs to the authenticated user
        $document = Document::where('id', $id)
            ->where('user_id', Auth::id())
            ->first();

        if (!$document) {
            return response()->json(['error' => 'Document not found or access denied.'], 404);
        }

        return response()->json($document);
    }

    public function update(Request $request, $id)
    {
        // Validate the request
        $request->validate([
            'title' => 'sometimes|required|string|max:255',
            'content' => 'sometimes|required|string',
            'type' => 'sometimes|required|string',
        ]);

        // Find the document by ID and ensure it belongs to the authenticated user
        $document = Document::where('id', $id)
            ->where('user_id', Auth::id())
            ->first();

        if (!$document) {
            return response()->json(['error' => 'Document not found or access denied.'], 404);
        }

        // Update the fields with the request data
        $document->fill($request->only(['title', 'content', 'type']));
        $document->save();

        // Return a success response
        return response()->json(['message' => 'Document updated successfully.', 'document' => $document]);
    }
}
