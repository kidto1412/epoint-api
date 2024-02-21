<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;

use App\Models\Parents;
use Illuminate\Http\Request;
use App\Actions\Fortify\PasswordValidationRules;
use App\Helpers\ResponseFormatter;
use App\Models\Student;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
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

            $student = Student::where('nis', $request->nis)
                ->with('class.major','parent', 'violations.form.category', 'violations.teacher')
                ->first();

            if (!$student || !Hash::check($request->password, $student->password, [])) {
                throw new \Exception('Invalid Credentials');
            }
            $totalPoint = 0;
            foreach ($student->violations as $violation){
//
                $point = $violation->form->point;
                $totalPoint +=  $point;
            }

            $tokenResult = $student->createToken('authToken')->plainTextToken;
            return ResponseFormatter::success([
                'access_token' => $tokenResult,
                'role' => 'student',
                'token_type' => 'Bearer',
                'student' => [
                    'nis' => $student->nis,
                    'name' => $student->name,
                    'parent_name' => $student->parent->name,
                    'gender' => $student->gender,
                    'address' => $student->address,
                    'class' => $student->class->grade,
                    'major' => $student->class->major->name,
                    'profile_photo_path' => $student->profile_photo_path,
                    'fouls' => $this->formatViolations($student->violations),
                    "total_point" => $totalPoint
                ]
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

    public function logout(Request $request, Student $student)
    {
        $token = $request->user()->currentAccessToken()->delete();
        return ResponseFormatter::success($token,'Token Revoked');
    }
    public function index(Request $request)
    {
        $student = Student::query()->with(['class.major','parent',  'violations' => function ($query) {
        $query->where('status', 'SUCCESS');},'violations.form.category', 'violations.teacher']);

        $studentsData = $student->paginate(20);
//        dd($studentsData);

        $studentsData->getCollection()->transform(function ($student) {
//            dd($student->violations);
            $totalPoint = $student->violations->sum(function ($violation) {

                if ($violation->status =='SUCCESS'){
                    return $violation->form->point;
                }
            });
            $student->total_point = $totalPoint;
            return $student;
        });

        return ResponseFormatter::success(
            $studentsData,
            'Foul list get successed'
        );
    }
    public function studentByParent($id_parent)
    {
        $student = Student::query()
            ->where('id_parent', $id_parent)
            ->with('class.major','parent', 'violations.form.category', 'violations.teacher')->get();
//        $studentsData = $student->paginate(5);

        $student->transform(function ($student) {
            $totalPoint = $student->violations->sum(function ($violation) {
                return $violation->form->point;
            });

            $student->total_point = $totalPoint;
            return $student;
        });
        return ResponseFormatter::success(
            $student,
            'student list get successed'
        );
    }
    public function top(Request $request)
    {
        //
        $student = Student::query()->with('class.major','parent', 'violations.form.category', 'violations.teacher');
        $studentsData = $student->paginate(5);

        $studentsData->getCollection()->transform(function ($student) {
            $totalPoint = $student->violations->sum(function ($violation) {
                return $violation->form->point;
            });

            $student->total_point = $totalPoint;
            return $student;
        });
        return ResponseFormatter::success(
            $studentsData,
            'Foul list get successed'
        );
    }

    public function pointClass(Request $request)
    {
        //
        $student = Student::query()->with('class.major','parent', 'violations.form.category', 'violations.teacher');
        $studentsData = $student->paginate(5);

        $studentsData->getCollection()->transform(function ($student) {
            $totalPoint = $student->violations->sum(function ($violation) {
                return $violation->form->point;
            });

            $student->total_point = $totalPoint;
            return $student;
        });
        return ResponseFormatter::success(
            $studentsData,
            'Foul list get successed'
        );
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
        foreach ($student->violations as $violation){
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
            if ($violation->status =='SUCCESS'){


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
                'status' => $violation->status
            ];
            }
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
        $student->update($request->all());
        return response()->json([
            "success" => true,
            "message" => "Student updated successfully.",
            "data" => $student
        ]);
    }
    public function updatePassword(Request $request)
    {
        $user = Auth::user();

        $this->validate($request, [
            'current_password' => 'required',
            'new_password' => 'required|min:8|different:current_password',
            'confirm_password' => 'required|same:new_password',
        ]);

        // Memeriksa apakah password saat ini benar
        if (!Hash::check($request->current_password, $user->password)) {
            throw ValidationException::withMessages([
                'current_password' => ['Current password is wrong.'],
            ])->status(401);
        }

        // Mengubah password pengguna
        $user->password = Hash::make($request->new_password);
        $token = $request->user()->currentAccessToken()->delete();
        $user->save();
//        "status" => 'success',
//                'message_token' => $token,
//                'message' => 'Update Password Success.',
//                'data'=> $user
        return response()->json(
            [
                'meta' => [
                    'code' => 200,
                    'status' => 'success',
                    'message' => 'Update Password Success',
                ],
                'data' =>  $user,
            ],200
        );


    }
    public function updateProfile(Request $request)
    {
        $data = $request->all();

        $user = Auth::user();
        $user->update($data);

        return ResponseFormatter::success($user,'Profile Updated');
    }


    public function updatePhoto(Request $request, Student $student)
    {
        $validator = Validator::make($request->all(), [
            'file' => 'required|image|max:2048',
        ]);

        if ($validator->fails()) {
            return ResponseFormatter::error(['error'=>$validator->errors()], 'Update Photo Fails', 401);
        }

        if ($request->file('file')) {

            $file = $request->file->store('assets/images/student', 'public');

            //store your file into database
            $student->profile_photo_path = $file;
            $student->update();

            return ResponseFormatter::success([$file],'File successfully uploaded');
        }
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

    public function getMyParent($nis){
        $studentWithParent = DB::table('students')
            ->join('parents', 'students.id_parent', '=', 'parents.id')
            ->select('students.*', 'parents.*')
            ->where('students.nis', $nis)
            ->first();

//        return $studentWithParent;
        return ResponseFormatter::success(
            $studentWithParent,
            'my parents',
        );
    }



}
