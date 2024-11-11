<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\PasswordResetController;
use Illuminate\Support\Facades\Mail;
use App\Http\Controllers\GoogleAuthController;
use Illuminate\Session\Middleware\StartSession;
use App\Http\Controllers\UserController;
use App\Http\Controllers\GPTDictionaryController;
use App\Http\Controllers\TranslatorController;
use App\Http\Controllers\DocumentController;
use App\Http\Controllers\AIChatController;
use App\Http\Controllers\ImageController;
use App\Http\Controllers\PDFAnalyzerController;
use App\Http\Controllers\VideoController;
use App\Http\Controllers\ImageTranscriptionController;
use App\Http\Controllers\VowelController;
use App\Http\Controllers\VerbConjugationController;
use App\Http\Controllers\VideoTranscriptionController;

//AUTHENTICATION
Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');
Route::put('/user/password', [UserController::class, 'updatePassword'])->middleware('auth:sanctum');
Route::post('/createUser', [AuthController::class, 'signup']);
Route::get('/users', [AuthController::class, 'getAllUsers']);
Route::post('/login', [AuthController::class, 'login']);
Route::middleware('auth:sanctum')->post('/logout', [AuthController::class, 'logout']);
Route::post('/password/email', [PasswordResetController::class, 'sendResetLinkEmail']);
Route::post('/password/reset', [PasswordResetController::class, 'reset']);
Route::group(['middleware' => [StartSession::class]], function () {
    Route::get('/auth/google', [AuthController::class, 'redirectGoogle']);
    Route::get('/auth/google/callback', [AuthController::class, 'callbackGoogle']);
});
Route::group(['middleware' => [StartSession::class]], function () {
    Route::get('auth/facebook', [AuthController::class, 'redirectFacebook']);
    Route::get('auth/facebook/callback', [AuthController::class, 'callbackFacebook']);
});

//USER AUTH
Route::middleware('auth:sanctum')->get('/user/profile', [UserController::class, 'getUserProfile']);
Route::middleware('auth:sanctum')->put('/user/profile', [UserController::class, 'updateUserProfile']);


//Advanced Dictionary
Route::post('/gpt/dict', [GPTDictionaryController::class, 'explainSentence']);
Route::post('/save/dict', [GPTDictionaryController::class, 'saveDocument']);
Route::delete('/delete/dict/{id}', [GPTDictionaryController::class, 'destroy']);

//Translate
Route::post('/gpt/translate', [TranslatorController::class, 'translateSentence']);
Route::post('/save/translate', [TranslatorController::class, 'saveDocument']);

//Documents
Route::middleware('auth:sanctum')->group(function () {
    Route::get('/documents', [DocumentController::class, 'index']);
    Route::get('/documents/{id}', [DocumentController::class, 'getDoc']);
    Route::put('/documents/{id}', [DocumentController::class, 'update']);
});

//AI assistant
Route::post('/ai-chat', [AIChatController::class, 'chat']);

//PDF Analyzer
Route::post('/pdf', [PDFAnalyzerController::class, 'analyze']);

//Images
Route::post('/upload-image', [ImageController::class, 'store']);
Route::get('/images', [ImageController::class, 'index']);
Route::get('/images/{filename}', [ImageController::class, 'show']);

// Video routes
Route::get('/videos', [VideoController::class, 'index']);            // Get all videos
Route::post('/videos', [VideoController::class, 'store']);           // Upload a new video
Route::get('/videos/{filename}', [VideoController::class, 'show']);  // Get a specific video

//Image Transcription API
Route::post('/transcribe-image', [ImageTranscriptionController::class, 'transcribe']); 

//Adding Tashkeel
Route::post('/vowels/add', [VowelController::class, 'addVowels']);

//Conjugate of verb
Route::post('/conjugate/verb', [VerbConjugationController::class, 'conjugate']);

//Transcribing videos
Route::post('/transcribe/video', [VideoTranscriptionController::class, 'transcribe']);