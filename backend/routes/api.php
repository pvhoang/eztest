<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::get('/migrate', function () {
    \Artisan::call('migrate');
    // return \Artisan::output();
    return response()->json([
        "message" => "Migrate OK"
    ], 201);
});

Route::get('/seed', function () {
    \App\Models\User::factory(5)->create();
    \App\Models\User::factory()->create([
        'name' => 'Test User',
        'email' => 'test@example.com',
        'password' => '12345',
    ]);
    return response()->json([
        "message" => "Seed OK"
    ], 201);
});

// Route::middleware(['cors'])->post('insert', [UserController::class, 'insert']);
// Route::middleware(['cors'])->group(function () {
//     // Route::post('/hogehoge', 'Controller@hogehoge');
//     Route::post('insert', [UserController::class, 'insert']);
// });

Log::warning("api.php");

Route::get('viewAll', [UserController::class, 'viewAll']);
Route::get('view/{id}', [UserController::class, 'view']);
Route::post('insert', [UserController::class, 'insert']);
Route::put('update/{id}', [UserController::class, 'update']);
Route::delete('delete/{id}', [UserController::class, 'delete']);



