<?php

namespace App\Http\Controllers\API;

use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\FormOfFoul;
use App\Models\Foul;
use App\Models\FoulCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Response;
class FoulController extends Controller
{
    //
    public function all(Request $request)
    {
        $id = $request->input('id');
        $limit = $request->input('limit', 6);
        $name = $request->input('name');


        if($id)
        {
            $foul = Foul::find($id);

            if($foul)
                return ResponseFormatter::success(
                    $foul,
                    'Data pelanggaran berhasil diambil'
                );
            else
                return ResponseFormatter::error(
                    null,
                    'Data pelanggaran tidak ada',
                    404
                );
        }

        $foul = Foul::query();

        if($name)
            $foul->where('name', 'like', '%' . $name . '%');



        return ResponseFormatter::success(
            $foul->paginate($limit),
            'Data list  pelanggara berhasil diambil'
        );
    }
    public function index(Request $request)
    {
        $limit = $request->input('limit',20);
        $fouls = FormOfFoul::all();
//        return response()->json([
//            "success" => true,
//            "message" => "Foul List",
//            "data" => $formlOfFoul->paginage($limit)
//        ]);
        return ResponseFormatter::success(
            $fouls,
            'Foul list get successed'
        );
    }
    public function store(Request $request)
    {
        $input = $request->all();
//        dd($input);

        $validator = Validator::make($input, [
            'time' => 'required',
            'date' => 'required',
            'description'=> 'required',
            'student_nis'=> 'required',
            'teacher_nip'=> 'required',
            'form_of_foul_id'=> 'required',
            'status'=> 'required'
        ]);
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }
        if ($request->hasFile('photo')) {
            $image_path = $request->file('photo')->store('assets/images/student', 'public');
            $input['photo'] = $image_path;
        }
        $studentWithParent = DB::table('students')
            ->join('parents', 'students.id_parent', '=', 'parents.id')
            ->select('students.*', 'parents.*')
            ->where('students.nis', $input['student_nis'])
            ->first();

        $formlOfFoul = FormOfFoul::find($input['form_of_foul_id']);


        $foul = Foul::create($input);



        if ($foul){
            $curl = curl_init();

            $fullImagePath = public_path('storage/' . $image_path);

            $target = $studentWithParent->phone_number;

            curl_setopt_array($curl, array(
                CURLOPT_URL => 'https://api.fonnte.com/send',
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => '',
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => 'POST',
                CURLOPT_POSTFIELDS => array(
                    'target' => $target,
                    'message' => 'Pelanggaran:' . ' ' .$formlOfFoul->name.' '.'Point:'.' '.$formlOfFoul->point,
                    'url' =>'https://static.vecteezy.com/system/resources/thumbnails/023/654/784/small/golden-logo-template-free-png.png',
                ),
                CURLOPT_HTTPHEADER => array(
                    "Authorization: fgopvgfewg_NYkr2HyFF"
                ),
            ));


            $response = curl_exec($curl);

            curl_close($curl);
            return response()->json([
                "success" => true,
                "message" => "Foul created successfully.",
                "data" => $foul
            ]);
        } else {
            return response()->json([
                    'message' => 'failed',
                ]
            );
        }
    }
    public function sendError($message, $data = [])
    {
        return response()->json([
            'success' => false,
            'message' => $message,
            'data' => $data,
        ], Response::HTTP_BAD_REQUEST);
    }
    public function show($id)
    {
        $foul = Foul::find($id);
        if (is_null($foul)) {
            return $this->sendError('Foul  not found.');
        }
        return response()->json([
            "success" => true,
            "message" => "Foul retrieved successfully.",
            "data" => $foul
        ]);
    }
    public function update(Request $request, Foul $foul)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'name' => 'required',
            'time' => 'required',
            'date' => 'required',
            'description'=> 'required',
            'student_nis'=> 'required',
            'teacher_nip'=> 'required',
            'form_of_foul_id'=> 'required'
        ]);
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }
        $foul->name = $input['name'];
        $foul->time = $input['time'];
        $foul->date = $input['date'];
        $foul->description = $input['description'];
        $foul->student_nis = $input['student_nis'];
        $foul->teacher_nip = $input['teacher_nip'];
        $foul->form_of_foul_id = $input['form_of_foul_id'];
        $foul->save();
        return response()->json([
            "success" => true,
            "message" => "Form of foul  updated successfully.",
            "data" => $foul
        ]);
    }

    public function destroy(Foul $foul)
    {
        $foul->delete();
        return response()->json([
            "success" => true,
            "message" => "Foul deleted successfully.",
            "data" => $foul
        ]);
    }
}
