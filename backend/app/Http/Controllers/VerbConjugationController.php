<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class VerbConjugationController extends Controller
{
    public function conjugate(Request $request)
    {
        // Validate the request input
        $request->validate([
            'verb' => 'required|string',
            'tense' => 'required|string', // e.g., past, present, future
        ]);

        $verb = $request->input('verb');
        $tense = $request->input('tense');

        // Here you would integrate with a conjugation library or API
        // For demonstration, let's assume you have a function to get the conjugated form.
        $conjugatedVerb = $this->getConjugatedVerb($verb, $tense);

        return response()->json([
            'original_verb' => $verb,
            'tense' => $tense,
            'conjugated_verb' => $conjugatedVerb,
        ]);
    }

    private function getConjugatedVerb($verb, $tense)
    {
        // Replace this with actual conjugation logic or library call
        // Example: return some library's conjugation method
        // For now, let's assume a simple transformation for demonstration
        return $verb . " (conjugated in $tense form)"; // Placeholder logic
    }
}
