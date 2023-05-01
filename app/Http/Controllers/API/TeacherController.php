<?php

namespace App\Http\Controllers\API;

use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\Student;
use App\Models\Teacher;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

use App\Actions\Fortify\PasswordValidationRules;
//use App\Helpers\ResponseFormatter;

class TeacherController extends Controller
{
    use PasswordValidationRules;
    //
    public function login(Request $request)
    {
        try {
            $request->validate([
                'nip' => 'required',
                'password' => 'required'
            ]);

            $credentials = request(['nip', 'password']);
//            if (!Auth::attempt($credentials)) {
//                return ResponseFormatter::error([
//                    'message' => 'Unauthorized'
//                ],'Authentication Failed', 500);
//            }

            $teacher = Teacher::where('nip', $request->nip)->first();
            if (!Hash::check($request->password, $teacher->password, [])) {
                throw new \Exception('Invalid Credentials');
            }

            $tokenResult = $teacher->createToken('authToken')->plainTextToken;
            return ResponseFormatter::success([
                'access_token' => $tokenResult,
                'token_type' => 'Bearer',
                'teacher' => $teacher
            ],'Authenticated');
        } catch (Exception $error) {
            return ResponseFormatter::error([
                'message' => 'Something went wrong',
                'error' => $error,
            ],'Authentication Failed', 500);
        }
    }
    public function register(Request $request): \Illuminate\Http\JsonResponse
    {
        try {
            $request->validate([
                'nip' => ['required', 'string', 'max:255'],
                'name' => ['required', 'string', 'max:255'],
                'password' => $this->passwordRules()
            ]);

            Teacher::create([
                'nip' => $request->nip,
                'name' => $request->name,
                'password' => Hash::make($request->password),
            ]);

            $teacher = Teacher::where('nip', $request->nip)->first();

            $tokenResult = $teacher->createToken('authToken')->plainTextToken;
            return ResponseFormatter::success([
                'access_token' => $tokenResult,
                'token_type' => 'Bearer',
                'teacher' => $teacher
            ],'Teacher Registered');
        } catch (Exception $error) {
            return ResponseFormatter::error([
                'message' => 'Something went wrong',
                'error' => $error,
            ],'Authentication Failed', 500);
        }
    }
}
