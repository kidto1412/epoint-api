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
    Route::post('logout/student', [\App\Http\Controllers\API\StudentController::class, 'logout']);
    Route::post('logout/teacher', [\App\Http\Controllers\API\TeacherController::class, 'logout']);
    Route::post('logout/parent', [\App\Http\Controllers\API\ParentsController::class, 'logout']);
    Route::resource('majors',\App\Http\Controllers\API\MajorController::class);
    Route::resource('class-room',\App\Http\Controllers\API\ClassRoomController::class);

    Route::post('add-student',[\App\Http\Controllers\API\StudentController::class, 'store']);
    Route::resource('parents', \App\Http\Controllers\API\ParentsController::class);

    Route::resource('foul',\App\Http\Controllers\API\FoulController::class);
    Route::post('/foul/{id}/approve', [\App\Http\Controllers\API\FoulController::class, 'approve']);
    Route::get('submitted-foul',[\App\Http\Controllers\API\FoulController::class, 'submittedList']);
     Route::get('report',[\App\Http\Controllers\API\FoulController::class, 'reportPdf']);
    Route::resource('student/all',\App\Http\Controllers\API\StudentController::class);
    Route::resource('teachers',\App\Http\Controllers\API\TeacherController::class);
    Route::get('student/{nis}',[\App\Http\Controllers\API\StudentController::class,'getStudentData']);
    Route::get('point/students',[\App\Http\Controllers\API\StudentController::class,'getDataStudents']);

//    update
    Route::post('student/photo', [\App\Http\Controllers\API\StudentController::class, 'updatePhoto']);
    Route::post('teacher/photo', [\App\Http\Controllers\API\TeacherController::class, 'updatePhoto']);
    Route::post('parent/photo', [\App\Http\Controllers\API\ParentsController::class, 'updatePhoto']);

    Route::post('student/update-profile', [\App\Http\Controllers\API\StudentController::class, 'updateProfile']);
    Route::post('change-password/student', [\App\Http\Controllers\API\StudentController::class, 'updatePassword']);
    Route::post('change-password/teacher', [\App\Http\Controllers\API\TeacherController::class, 'updatePassword']);
    Route::post('change-password/parent', [\App\Http\Controllers\API\ParentsController::class, 'updatePassword']);
    Route::post('teacher/update-profile', [\App\Http\Controllers\API\TeacherController::class, 'updateProfile']);
    Route::post('parent/update-profile', [\App\Http\Controllers\API\ParentsController::class, 'updateProfile']);


});

Route::resource('form-of-foul',\App\Http\Controllers\API\FormOfFoulController::class);
Route::resource('students',\App\Http\Controllers\API\StudentController::class);
Route::post('students/face-matching', [\App\Http\Controllers\API\StudentController::class, 'recognize']);
Route::get('class/point',[\App\Http\Controllers\API\ClassRoomController::class,'pointClass']);
Route::get('classrooms/report-list',[\App\Http\Controllers\API\ClassRoomController::class,'listForReport']);
Route::get('class/point2',[\App\Http\Controllers\API\ClassRoomController::class,'pointClass2']);
Route::get('class/point4',[\App\Http\Controllers\API\ClassRoomController::class,'pointClas4']);
Route::get('class/point/{classRoomCode}',[\App\Http\Controllers\API\ClassRoomController::class,'pointClass3']);
Route::get('my_childern/{id_parent}',[\App\Http\Controllers\API\StudentController::class,'studentByParent']);
Route::get('teacher/find/{nip}', [\App\Http\Controllers\API\TeacherController::class, 'show']);
Route::post('teacher/verification', [\App\Http\Controllers\API\TeacherController::class, 'matchFaces']);
Route::post('teacher/face-matching', [\App\Http\Controllers\API\TeacherController::class, 'recognize']);
Route::get('phone/parent/{nis}',[\App\Http\Controllers\API\StudentController::class, 'getMyParent']);
//Route::middleware(['auth:teacher-api'])->group(function () {
//    Route::get('point/students',[\App\Http\Controllers\API\StudentController::class,'getDataStudents']);
//});
//
//Route::middleware(['auth:sanctum','student-api'])->group(function () {
//    Route::get('student/{nis}',[\App\Http\Controllers\API\StudentController::class,'getStudentData']);
//    Route::get('point/students',[\App\Http\Controllers\API\StudentController::class,'getDataStudents']);
//});
//Route::middleware(['auth:parent-api'])->group(function () {
//    Route::get('student/{nis}',[\App\Http\Controllers\API\StudentController::class,'getStudentData']);
//    Route::get('point/students',[\App\Http\Controllers\API\StudentController::class,'getDataStudents']);
//});

Route::post('login', [\App\Http\Controllers\API\UserController::class, 'login']);
Route::post('register', [\App\Http\Controllers\API\UserController::class, 'register']);
Route::resource('foul-categories',\App\Http\Controllers\API\FoulCategoryController::class);

Route::post('login-student', [\App\Http\Controllers\API\StudentController::class, 'login']);
Route::post('register-student', [\App\Http\Controllers\API\StudentController::class, 'register']);

Route::post('login-teacher', [\App\Http\Controllers\API\TeacherController::class, 'login']);
Route::post('register-teacher', [\App\Http\Controllers\API\TeacherController::class, 'register']);
Route::post('point-class', [\App\Http\Controllers\API\ClassRoomController::class, 'pointClass']);
Route::post('point-class2', [\App\Http\Controllers\API\ClassRoomController::class, 'pointClass2']);

Route::post('login-parent', [\App\Http\Controllers\API\ParentsController::class, 'login']);
Route::post('register-parent', [\App\Http\Controllers\API\ParentsController::class, 'register']);





