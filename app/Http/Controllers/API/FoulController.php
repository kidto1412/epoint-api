<?php

namespace App\Http\Controllers\API;

use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\FormOfFoul;
use App\Models\Foul;
use App\Models\FoulCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

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
    public function store(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
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
        $foul = Foul::create($input);
        if ($foul){
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
