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
                    'id_parent' => $request->id_parent,
                    'id_class_room' => $request->id_class_room
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

    public function getStudentData($nis)
    {

        // Bobot untuk kriteria Sikap dan Perilaku
        $bobot_sp = 0.5;

        // Bobot untuk kriteria Kerajinan
        $bobot_kj = 0.25;

        // Bobot untuk kriteria Kerapian
        $bobot_kp = 0.25;

        $totalPoint = 0;
        $spPoint = 0;
        $kjPoint = 0;
        $kpPoint = 0;

        $student = Student::where('nis', $nis)
            ->with('class.major','parent', 'violations.form.category', 'violations.teacher')
            ->first();

//        foreach ($student->violations as $violation) {
//            $point = $violation->form->point;
//
//            switch ($violation->form->category_foul_id) {
//                case 'FC01':
//                    if ($point == 100) {
//                        $spPoint += 100;
//                    } else if ($point == 50) {
//                        $spPoint += 50;
//                    } else if ($point == 30) {
//                        $spPoint += 30;
//                    } else if ($point == 15) {
//                        $spPoint += 15;
//                    } else if ($point == 10) {
//                        $spPoint += 10;
//                    } else if ($point == 5) {
//                        $spPoint += 5;
//                    }
//                    break;
//
//                case 'FC02':
//                    if ($point == 100) {
//                        $kjPoint += 100;
//                    } else if ($point == 50) {
//                        $kjPoint += 50;
//                    } else if ($point == 30) {
//                        $kjPoint += 30;
//                    } else if ($point == 15) {
//                        $kjPoint += 15;
//                    } else if ($point == 10) {
//                        $kjPoint += 10;
//                    } else if ($point == 5) {
//                        $kjPoint += 5;
//                    }
//                    break;
//
//                case 'FC03':
//                    if ($point == 100) {
//                        $kpPoint += 100;
//                    } else if ($point == 50) {
//                        $kpPoint += 50;
//                    } else if ($point == 30) {
//                        $kpPoint += 30;
//                    } else if ($point == 15) {
//                        $kpPoint += 15;
//                    } else if ($point == 10) {
//                        $kpPoint += 10;
//                    } else if ($point == 5) {
//                        $kpPoint += 5;
//                    }
//                    break;
//            }
//        }
//        $totalPoint = ($spPoint * 0.5) + ($kjPoint * 0.25) + ($kpPoint * 0.25);

//        $totalPoint += student->violations->point * $student->violationType->violationCategory->weight;
        foreach ($student->violations as $violation){
//            $weight = 0;
//            if ($violation->form->category_foul_id == 'FC01'){
//                $weight = $bobot_sp;
//            } elseif ($violation->form->category_foul_id == 'FC02'){
//                $weight = $bobot_kj;
//            } elseif ($violation->form->category_foul_id == 'FC03'){
//                $weight = $bobot_kp ;
//            }
            $point = $violation->form->point;
            $totalPoint +=  $point;
        }
        return response()->json([
            "success" => true,
            "message" => "Data Student",
            "data" => [
//                'violation' => $violation,
                'nis' => $student->nis,
                'name' => $student->name,
                'parent_name' => $student->parent->name,
                'class' => $student->class->grade,
                'major' => $student->class->major->name,
//                'time' => $student->violations->time,
//                'date' => $student->violations->date,
//                'description' =>$student->violations->description,
                'fouls' => $this->formatViolations($student->violations),
                "total_point" => $totalPoint
            ]
        ]);
    }

    public function getDataStudents()
    {
//
//        $students = Student::with('class.major','parent', 'violations.form.category', 'violations.teacher')
//            ->get();
//
//        $formatted_students = [];
//
//        foreach ($students as $student){
//            $totalPoint = 0;
//            foreach ($student->violations as $violation){
//                $point = $violation->form->point;
//                $totalPoint +=  $point;
//            }
//            $formatted_students[] = [
//                'nis' => $student->nis,
//                'name' => $student->name,
//                'parent_name' => $student->parent->name,
//                'class' => $student->class->grade,
//                'major' => $student->class->major->name,
//                'total_point' => $totalPoint,
//                'fouls' => $this->formatViolations($student->violations),
//            ];
//        }
//
//        return response()->json([
//            "success" => true,
//            "message" => "Data Student",
//            "data" => $formatted_students,
//        ]);

        // Verifikasi bahwa user autentikasi adalah siswa
        if (Auth::guard('students')->check()) {
            // Ambil data siswa yang sedang login
            $student = Auth::guard('students')->user();

            // Kirimkan data siswa dalam respons JSON
            return response()->json($student);
        } else {
            return response()->json(['error' => 'Unauthorized'], 401);
        }
    }

    private function formatViolations($violations)
    {
        $formatted = [];

        foreach ($violations as $violation) {
            $formatted[] = [
                'id' => $violation->id,
                'date' => $violation->date,
                'time' => $violation->time,
                'description' => $violation->description,
                'form_violation_name' => $violation->form->name,
                'point'=> $violation->form->point,
                'category' => $violation->form->category->name,
                'teacher_name' => $violation->teacher->name,
                'teacher_nip' => $violation->teacher->nip,
            ];
        }

        return $formatted;
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
        $student->id_class_room = $input['id_class_room'];
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
