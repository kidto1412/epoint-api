<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LoginController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('student/login',[\App\Http\Controllers\API\UserController::class, 'studentLogin'])->name('studentLogin');
Route::group( ['prefix' => 'student','middleware' => ['auth:student-api','scopes:student'] ],function(){
    // authenticated staff routes here
    Route::get('dashboard',[LoginController::class, 'adminDashboard']);
});
