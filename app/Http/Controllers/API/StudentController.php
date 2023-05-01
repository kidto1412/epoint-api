<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use App\Actions\Fortify\PasswordValidationRules;
use App\Helpers\ResponseFormatter;
use App\Models\Student;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
class StudentController extends Controller
{
    use PasswordValidationRules;


    public function fetch(Request $request)
    {
        return ResponseFormatter::success($request->Student::student(),'Data profile user berhasil diambil');
    }
    public function login(Request $request)
    {
        try {
            $request->validate([
                'nis' => 'required',
                'password' => 'required'
            ]);

            $credentials = $request->validate([
                'nis' => ['required', 'string'],
                'password' => ['required', 'string'],
            ]);

//            if (!Auth::attempt($credentials)) {
//                return ResponseFormatter::error([
//                    'message' => 'Unauthorized'
//                ],'Authentication Failed', 500);
//            }

            $student = Student::where('nis', $request->nis)->first();

            if (!$student || !Hash::check($request->password, $student->password, [])) {
                throw new \Exception('Invalid Credentials');
            }

            $tokenResult = $student->createToken('authToken')->plainTextToken;

            return ResponseFormatter::success([
                'access_token' => $tokenResult,
                'token_type' => 'Bearer',
                'student' => $student
            ],'Authenticated');
        } catch (Exception $error) {
            return ResponseFormatter::error([
                'message' => 'Something went wrong',
                'error' => $error,
            ],'Authentication Failed', 500);
        }
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \Exception
     */
    public function register(Request $request): \Illuminate\Http\JsonResponse
    {
        try {
            $request->validate([
                'nis' => ['required', 'string', 'max:255'],
                'name' => ['required', 'string', 'max:255'],
                'password' => $this->passwordRules()
            ]);

            Student::create([
                'nis' => $request->nis,
                'name' => $request->name,
                'password' => Hash::make($request->password),
            ]);

            $student = Student::where('nis', $request->nis)->first();

            $tokenResult = $student->createToken('authToken ')->plainTextToken;
            return ResponseFormatter::success([
                'access_token' => $tokenResult,
                'token_type' => 'Bearer',
                'student' => $student
            ],'Student Registered');
        } catch (Exception $error) {
            return ResponseFormatter::error([
                'message' => 'Something went wrong',
                'error' => $error,
            ],'Authentication Failed', 500);
        }
    }

    public function all(Request $request)
    {
        $nis = $request->input('nis');
        $limit = $request->input('limit', 6);
        $name = $request->input('name');


        if($nis)
        {
            $student = Student::find($nis);

            if($student)
                return ResponseFormatter::success(
                    $student,
                    'Data student berhasil diambil'
                );
            else
                return ResponseFormatter::error(
                    null,
                    'Data student tidak ada',
                    404
                );
        }

        $student = Student::query();

        if($name)
            $student->where('name', 'like', '%' . $name . '%');



        return ResponseFormatter::success(
            $student->paginate($limit),
            'Data list  jurusan berhasil diambil'
        );
    }

    public function logout(Request $request)
    {
        $token = $request->student()->currentAccessToken()->delete();

        return ResponseFormatter::success($token,'Token Revoked');
    }

}
