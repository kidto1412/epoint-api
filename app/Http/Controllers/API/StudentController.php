<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;

use App\Models\Parents;
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
    public function index(Request $request)
    {
        //
        $student = Student::paginate(5);
        return response()->json([
            "success" => true,
            "message" => "Student List",
            "data" => $student
        ]);
    }
    public function store(Request $request)
    {
        //
//        $input = $request->all();
        try{
//            $password = Str::random(8);

            $request->validate([
                'nis' => 'required',
                'name' => 'required',
                'password' => 'required',
                'date_and_place_of_birth'=> 'required',
                'gender'=> 'required',
                'phone_number'=> 'required',
                'address'=> 'required',

            ]);

            $student = Student::create([
                    'nis' => $request->nis,
                    'name' => $request->name,
//                    'password' => Hash::make($password),
                    'password' => Hash::make($request->password),
                    'date_and_place_of_birth' => $request->date_and_place_of_birth,
                    'gender' => $request->gender,
                    'phone_number'=> $request->phone_number,
                    'address' => $request->address,
                    'profile_photo_path' => $request->profile_photo_path,
                    'id_parent' => $request->id_parent
                ]
            );
//            $parents = Parents::where('id', $request->id)->first();

            // Kirim SMS menggunakan Twilio
//            $account_sid = env('TWILIO_ACCOUNT_SID');
//            $auth_token = env('TWILIO_AUTH_TOKEN');
//            $twilio_number = env('TWILIO_FROM');
//            $client = new Client($account_sid, $auth_token);
//            $message = $client->messages->create(
//                $parents->phone_number,
//                array(
//                    'from' => $twilio_number,
//                    'body' => 'Username: ' . $parents->username . ', Password: ' . $password
//                )
//            );


            return response()->json([
                "success" => true,
                "message" => "Student created successfully.",
                "data" => $student
            ]);
        }catch (Exception $error) {
            return ResponseFormatter::error([
                'message' => 'Something went wrong',
                'error' => $error,
            ],'Eror Validation', 500);
        }

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */


    public function show($id)
    {
        //
        $student = Student::find($id);
        if (is_null($student)) {
            return $this->sendError('Student not found.');
        }
        return response()->json([
            "success" => true,
            "message" => "Parents retrieved successfully.",
            "data" => $student
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Student $student)
    {
        //
        $input = $request->all();
        $validator = Validator::make($input, [
            'nis' => 'required',
            'name' => 'required',
            'password' => 'required',
            'date_and_place_of_birth'=> 'required',
            'gender'=> 'required',
            'phone_number'=> 'required',
            'address'=> 'required',

        ]);
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }
        $student->nis = $input['nis'];
        $student->name = $input['name'];
        $student->password = $input['password'];
        $student->date_and_place_of_birth = $input['date_and_place_of_birth'];
        $student->gender = $input['gender'];
        $student->phone_number = $input['phone_number'];
        $student->address = $input['address'];
        $student->profile_photo_path = $input['profile_photo_path'];
        $student->id_parent = $input['id_parent'];
        $student->save();
        return response()->json([
            "success" => true,
            "message" => "Student updated successfully.",
            "data" => $student
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Student $student)
    {
        //
        $student->delete();
        return response()->json([
            "success" => true,
            "message" => "Student deleted successfully.",
            "data" => $student
        ]);
    }



}
