<?php

namespace App\Http\Controllers\API;

use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\Major;
use App\Models\Parents;
use App\Models\Student;
use App\Models\Teacher;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Twilio\Rest\Client;

class ParentsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

    public function login(Request $request)
    {
        try {
            $request->validate([
                'username' => 'required',
                'password' => 'required'
            ]);

            $credentials = request(['username', 'password']);
//            if (!Auth::attempt($credentials)) {
//                return ResponseFormatter::error([
//                    'message' => 'Unauthorized'
//                ],'Authentication Failed', 500);
//            }

            $parent = Parents::where('username', $request->username)->first();
            if (!Hash::check($request->password, $parent->password, [])) {
                throw new \Exception('Invalid Credentials');
            }

            $tokenResult = $parent->createToken('authToken')->plainTextToken;
            return ResponseFormatter::success([
                'access_token' => $tokenResult,
                'role' => 'parent',
                'token_type' => 'Bearer',
                'data' => $parent

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
                'name' => ['required', 'string', 'max:255'],
                'username' => ['required', 'string', 'max:255'],
                'password' => $this->passwordRules()
            ]);

            Teacher::create([
                'name' => $request->name,
                'username' => $request->username,
                'password' => Hash::make($request->password),
            ]);

            $parent = Parents::where('username', $request->username)->first();

            $tokenResult = $parent->createToken('authToken')->plainTextToken;
            return ResponseFormatter::success([
                'access_token' => $tokenResult,
                'token_type' => 'Bearer',
                'parent' => $parent,
            ],'Parent Registered');
        } catch (Exception $error) {
            return ResponseFormatter::error([
                'message' => 'Something went wrong',
                'error' => $error,
            ],'Authentication Failed', 500);
        }
    }
    public function index(Request $request)
    {
        //
        $parents = Parents::paginate(5);
        return response()->json([
            "success" => true,
            "message" => "Parents List",
            "data" => $parents
        ]);
    }
    public function store(Request $request)
    {
        //
//        $input = $request->all();
        try{
//            $password = Str::random(8);

            $request->validate([
                'name' => 'required',
                'username' => 'required',
                'password' => 'required',
                'date_and_place_of_birth' => 'required',
                'phone_number'=> 'required',
                'address'=> 'required'
            ]);

            $parents = Parents::create([
                    'name' => $request->name,
                    'username' => $request->username,
//                    'password' => Hash::make($password),
                    'password' => Hash::make($request->password),
                    'date_and_place_of_birth' => $request->date_and_place_of_birth,
                    'phone_number' => $request->phone_number,
                    'address'=> $request->address,
                    'profile_photo_path' => $request->profile_photo_path
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
                "message" => "parents created successfully.",
                "data" => $parents
            ]);
        }catch (Exception $error) {
            return ResponseFormatter::error([
                'message' => 'Something went wrong',
                'error' => $error,
            ],'Authentication Failed', 500);
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
        $parent = Parents::find($id);
        if (is_null($parent)) {
            return $this->sendError('Major not found.');
        }
        return response()->json([
            "success" => true,
            "message" => "Parents retrieved successfully.",
            "data" => $parent
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Parents $parent)
    {
        //
        $input = $request->all();
//        $validator = Validator::make($input, [
//            'name' => 'required',
//            'username' => 'required',
//            'date_and_place_of_birth' => 'required',
//            'phone_number'=> 'required',
//            'address'=> 'required'
//        ]);
//        if($validator->fails()){
//            return $this->sendError('Validation Error.', $validator->errors());
//        }
        $parent->name = $input['name'];
        $parent->username = $input['username'];
        $parent->date_and_place_of_birth = $input['date_and_place_of_birth'];
        $parent->phone_number = $input['phone_number'];
        $parent->address = $input['address'];
        $parent->save();
        return response()->json([
            "success" => true,
            "message" => "Parent updated successfully.",
            "data" => $parent
        ]);
    }



    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Parents $parent)
    {
        //
        $parent->delete();
        return response()->json([
            "success" => true,
            "message" => "Parent deleted successfully.",
            "data" => $parent
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

    public function updatePhoto(Request $request, Parents $parent)
    {
        $validator = Validator::make($request->all(), [
            'file' => 'required|image|max:2048',
        ]);

        if ($validator->fails()) {
            return ResponseFormatter::error(['error'=>$validator->errors()], 'Update Photo Fails', 401);
        }

        if ($request->file('file')) {

            $file = $request->file->store('assets/images/parent', 'public');

            //store your file into database
            $parent->profile_photo_path = $file;
            $parent->update();

            return ResponseFormatter::success([$file],'File successfully uploaded');
        }
    }


    public function logout(Request $request, Student $student)
    {
        $token = $request->user()->currentAccessToken()->delete();
        return ResponseFormatter::success($token,'Token Revoked');
    }
}
