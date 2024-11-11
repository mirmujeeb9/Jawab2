<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Smalot\PdfParser\Parser; // Ensure this is imported
use OpenAI\Laravel\Facades\OpenAI;

class PDFAnalyzerController extends Controller
{
    public function analyze(Request $request)
{
    // Validate the uploaded PDF file
    $request->validate([
        'pdf' => 'required|mimes:pdf|max:10000',  // Max file size 10MB
        'question' => 'required|string',           // User's question
    ]);

    try {
        // Store the uploaded PDF
        $pdfFile = $request->file('pdf');

        // Create the 'pdfs' directory if it doesn't exist
        $pdfsPath = storage_path('app' . DIRECTORY_SEPARATOR . 'pdfs');
        
        // Log the directory path for debugging
        \Log::info('PDFs directory path:', ['path' => $pdfsPath]);

        // Check if the directory exists, if not create it
        if (!file_exists($pdfsPath)) {
            mkdir($pdfsPath, 0755, true); // Creates the directory recursively
            \Log::info('Created PDFs directory.');
        }

        // Store the PDF file
        $path = $pdfFile->store('pdfs'); // This will now store it in storage/app/pdfs
        
        // Log the path where the file is stored
        \Log::info('Stored PDF path:', ['path' => $path]);

        // Construct the full path to the uploaded PDF
        $fullPath = storage_path('app\\private\\' . DIRECTORY_SEPARATOR . $path);

        // Log the full path for debugging
        \Log::info('Full path of the uploaded PDF:', ['full_path' => $fullPath]);

        // Check if the file exists after upload
        if (!file_exists($fullPath)) {
            return response()->json([
                'message' => 'File not found after upload',
                'full_path' => $fullPath,
            ], 404);
        }

        // Extract text from the PDF
        $pdfText = $this->extractTextFromPDF($fullPath);

        // Get the user's question
        $userQuestion = $request->input('question');

        // Call OpenAI GPT to answer the question based on the PDF content
        $response = $this->askGPT($pdfText, $userQuestion);

        // Return the response
        return response()->json([
            'message' => 'AI analysis complete',
            'pdf_text' => $pdfText,
            'ai_response' => $response,
        ]);

    } catch (\Exception $e) {
        return response()->json([
            'message' => 'Error during analysis',
            'error' => $e->getMessage(),
        ], 500);
    }
}


    // Function to extract text from PDF using Smalot PDF Parser
    protected function extractTextFromPDF($fullPath)
    {
        // Log the path being used for extraction
        \Log::info('Extracting text from PDF:', ['full_path' => $fullPath]);

        $parser = new Parser();
        $pdf = $parser->parseFile($fullPath);
        $text = $pdf->getText();
        
        return $text;
    }

    // Function to ask GPT based on extracted PDF text
    protected function askGPT($pdfText, $question)
    {
        // Combine the PDF content and the user's question for the prompt
        $prompt = "Here is the content of a PDF:\n\n\"$pdfText\"\n\nBased on this, answer the following question: $question";

        // Call the OpenAI API
        $response = OpenAI::chat()->create([
            'model' => 'gpt-3.5-turbo',
            'messages' => [
                ['role' => 'system', 'content' => 'You are an assistant that helps answer questions based on PDF documents.'],
                ['role' => 'user', 'content' => $prompt],
            ],
        ]);

        // Return the AI's response
        return $response['choices'][0]['message']['content'];
    }
}
