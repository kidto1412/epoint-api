<?php

namespace App\Http\Controllers\API;

use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\Parents;
use App\Models\Student;
use App\Models\Teacher;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

use App\Actions\Fortify\PasswordValidationRules;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use Symfony\Component\Process\Exception\ProcessFailedException;
use Symfony\Component\Process\Process;

//use App\Helpers\ResponseFormatter;

class TeacherController extends Controller
{
    use PasswordValidationRules;
    //
    public function index(Request $request)
    {
        //
        $teacher = Teacher::paginate(5);
        return response()->json([
            "success" => true,
            "message" => "Teacher List",
            "data" => $teacher
        ]);
    }
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
                'role' => 'teacher',
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
                    'password' => Hash::make($request->password),
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


    public function show($nip)
    {
        //
        $teacher = Teacher::where('nip',$nip)->first();
        if (is_null($teacher)) {
            return $this->sendError('Student not found.');
        }
        $tokenResult = $teacher->createToken('authToken')->plainTextToken;
        return ResponseFormatter::success([
            'access_token' => $tokenResult,
            'role' => 'teacher',
            'token_type' => 'Bearer',
            'teacher' => $teacher
        ],'Authenticated');
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
//        $validator = Validator::make($input, [
//            'nip' => 'required',
//            'name' => 'required',
//            'password' => 'required',
//            'position' => 'required',
//            'date_and_place_of_birth'=> 'required',
//            'gender'=> 'required',
//            'phone_number'=> 'required',
//            'address'=> 'required',
//
//        ]);
//        if($validator->fails()){
//            return $this->sendError('Validation Error.', $validator->errors());
//        }
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

    public function updateProfile(Request $request)
    {
        $data = $request->all();

        $user = Auth::user();
        $user->update($data);

        return ResponseFormatter::success($user,'Profile Updated');
    }

    public function updatePhoto(Request $request, Teacher $teacher)
    {
        $validator = Validator::make($request->all(), [
            'file' => 'required|image|max:2048',
        ]);

        if ($validator->fails()) {
            return ResponseFormatter::error(['error'=>$validator->errors()], 'Update Photo Fails', 401);
        }

        if ($request->file('file')) {

            $file = $request->file->store('assets/images/parent', 'public');

            //store your file into database;
            $teacher->profile_photo_path = $file;
            $teacher->update();

            return ResponseFormatter::success([$file],'File successfully uploaded');
        }
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
    public function logout(Request $request, Student $student)
    {
        $token = $request->user()->currentAccessToken()->delete();
        return ResponseFormatter::success($token,'Token Revoked');
    }
    public function recognize (Request $request){
        // Menyimpan gambar dari permintaan ke penyimpanan sementara
//        $request->validate([
//            'image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048', // Sesuaikan dengan jenis gambar yang diizinkan dan batasan ukuran
//        ]);

        $image = $request->file('image');
        $imagePath = $image->store('temp');
      
       

        $scriptPython = base_path('match_face.py');

       
        $fullImagePath = storage_path('app/' . $imagePath);
        $python = base_path('venv/bin/python3');

      
        $role = 'teacher';
        $command = $python . " " .
           escapeshellarg($scriptPython) . " " .
           escapeshellarg($fullImagePath). " ".
           escapeshellarg($role);
           

      
        $output = shell_exec($command);
        $result = json_decode($output, true);
         Storage::delete($imagePath);
   
        return response()->json(['result' => $result]);
    }


    public function matchFaces(Request $request)
    {
        // Simpan gambar yang diterima dari Flutter
        $image = $request->file('image');
        $imagePath = $image->store('temp');
        $pythonScript = base_path('cnn.py');
        $fullImagePath = storage_path('app/' . $imagePath);

//        putenv("MPLCONFIGDIR=" . storage_path('app/matplotlib_config'));

        $process = new Process(['python', $pythonScript , str_replace('/' , '\\', $fullImagePath )]);
//        dd($process);

        $process->run();
//        dd($process->run());
        // Tangani hasil output yang diberikan oleh script Python

        if (!$process->isSuccessful()) {
            throw new ProcessFailedException($process);
        }


        $output = $process->getOutput();
//        dd($output);
        $result = json_decode($output, true);
//        dd($result);
//        unlink(storage_path('app/'.$imagePath));

        // Mengembalikan respons JSON
        return response()->json(['output' => $output]);
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
}
