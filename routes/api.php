<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::middleware(['auth:sanctum'])->group(function () {
    Route::get('user', [\App\Http\Controllers\API\UserController::class, 'fetch']);
    Route::post('user', [\App\Http\Controllers\API\UserController::class, 'updateProfile']);
    Route::post('logout', [\App\Http\Controllers\API\UserController::class, 'logout']);
    Route::resource('majors',\App\Http\Controllers\API\MajorController::class);
    Route::resource('class-room',\App\Http\Controllers\API\ClassRoomController::class);
    Route::resource('foul-categories',\App\Http\Controllers\API\FoulCategoryController::class);
    Route::post('add-student',[\App\Http\Controllers\API\StudentController::class, 'store']);
    Route::resource('parents', \App\Http\Controllers\API\ParentsController::class);
    Route::resource('form-of-foul',\App\Http\Controllers\API\FormOfFoulController::class);
    Route::resource('foul',\App\Http\Controllers\API\FoulController::class);
    Route::resource('students',\App\Http\Controllers\API\StudentController::class);
    Route::resource('teachers',\App\Http\Controllers\API\TeacherController::class);
});

//Route::middleware(['teachers'])->group(function () {
//    Route::resource('foul',\App\Http\Controllers\API\FormOfFoulController::class);
//    Route::resource('students',\App\Http\Controllers\API\StudentController::class);
//    Route::resource('teachers',\App\Http\Controllers\API\TeacherController::class);
//});

Route::post('login', [\App\Http\Controllers\API\UserController::class, 'login']);
Route::post('register', [\App\Http\Controllers\API\UserController::class, 'register']);

Route::post('login-student', [\App\Http\Controllers\API\StudentController::class, 'login']);
Route::post('register-student', [\App\Http\Controllers\API\StudentController::class, 'register']);

Route::post('login-teacher', [\App\Http\Controllers\API\TeacherController::class, 'login']);
Route::post('register-teacher', [\App\Http\Controllers\API\TeacherController::class, 'register']);


Route::get('students',[\App\Http\Controllers\API\StudentController::class,'all']);





