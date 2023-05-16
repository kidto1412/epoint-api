<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
Route::get('/debug-sentry', function () {
    throw new Exception('My first Sentry error!');
});

//Route::middleware([
//    'auth:sanctum',
//    config('jetstream.auth_session'),
//    'verified'
//])->group(function () {
//    Route::get('/dashboard', function () {
//        return view('dashboard');
//    })->name('dashboard');
//
//});

Route::prefix('dashboard')
    ->middleware(['auth:sanctum',config('jetstream.auth_session'),
        'verified'])
    ->group(function() {
        Route::get('/', function () {
            return view('dashboard');
        })->name('dashboard');
//        Route::get('/', [DashboardController::class, 'index'])
//            ->name('admin-dashboard');
        Route::resource('major',\App\Http\Controllers\MajorController::class);
        Route::resource('class',\App\Http\Controllers\ClassController::class);
        Route::resource('category',\App\Http\Controllers\FoulCategoryController::class);
        Route::resource('parent', \App\Http\Controllers\ParentController::class);
        Route::resource('form',\App\Http\Controllers\FormOfFoulController::class);
        Route::resource('foul',\App\Http\Controllers\FoulController::class);
        Route::resource('student',\App\Http\Controllers\StudentController::class);
        Route::resource('teacher',\App\Http\Controllers\TeacherController::class);
    });


