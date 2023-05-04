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
use Illuminate\Support\Facades\Validator;

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
    public function store(Request $request)
    {
        //
//        $input = $request->all();
        try{
//            $password = Str::random(8);

            $request->validate([
                'nip' => 'required',
                'name' => 'required',
                'password' => 'required',
                'position' => 'required',
                'date_and_place_of_birth'=> 'required',
                'gender'=> 'required',
                'phone_number'=> 'required',
                'address'=> 'required',

            ]);

            $teacher = Teacher::create([
                    'nip' => $request->nip,
                    'password' => $request->password,
//                    'password' => Hash::make($password),
                    'name' => $request->name,
                    'position' => $request->position,
                    'gender' => $request->gender,
                    'phone_number'=> $request->phone_number,
                    'date_and_place_of_birth' => $request->date_and_place_of_birth,
                    'address' => $request->address,

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
                "message" => "Teacher created successfully.",
                "data" => $teacher
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
        $teacher = Teacher::find($id);
        if (is_null($teacher)) {
            return $this->sendError('Student not found.');
        }
        return response()->json([
            "success" => true,
            "message" => "Teacher retrieved successfully.",
            "data" => $teacher
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Teacher $teacher)
    {
        //
        $input = $request->all();
        $validator = Validator::make($input, [
            'nip' => 'required',
            'name' => 'required',
            'password' => 'required',
            'position' => 'required',
            'date_and_place_of_birth'=> 'required',
            'gender'=> 'required',
            'phone_number'=> 'required',
            'address'=> 'required',

        ]);
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }
        $teacher->nip = $input['nip'];
        $teacher->password = $input['password'];
        $teacher->name = $input['name'];
        $teacher->position = $input['position'];
        $teacher->gender = $input['gender'];
        $teacher->phone_number = $input['phone_number'];
        $teacher->date_and_place_of_birth = $input['date_and_place_of_birth'];
        $teacher->address = $input['address'];
//        $teacher->profile_photo_path = $input['profile_photo_path'];
        $teacher->save();
        return response()->json([
            "success" => true,
            "message" => "Teacher updated successfully.",
            "data" => $teacher
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Teacher $teacher)
    {
        //
        $teacher->delete();
        return response()->json([
            "success" => true,
            "message" => "Teacher deleted successfully.",
            "data" => $teacher
        ]);
    }
}
