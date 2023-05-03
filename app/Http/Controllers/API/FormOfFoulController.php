<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\FormOfFoul;
use App\Models\FoulCategory;
use Illuminate\Http\Request;
use App\Helpers\ResponseFormatter;
use Illuminate\Support\Facades\Validator;

class FormOfFoulController extends Controller
{
    //
    public function all(Request $request)
    {
        $id = $request->input('id');
        $limit = $request->input('limit', 6);
        $name = $request->input('name');


        if($id)
        {
            $formOfFoul = FormOfFoul::find($id);

            if($formOfFoul)
                return ResponseFormatter::success(
                    $formOfFoul,
                    'Data bentuk pelanggaram berhasil diambil'
                );
            else
                return ResponseFormatter::error(
                    null,
                    'Data bentuk pelanggaran tidak ada',
                    404
                );
        }

        $formOfFoul = FormOfFoul::query();

        if($name)
            $formOfFoul->where('name', 'like', '%' . $name . '%');



        return ResponseFormatter::success(
            $formOfFoul->paginate($limit),
            'Data list bentuk pelanggara berhasil diambil'
        );
    }
    public function index(Request $request)
    {
        $formlOfFoul = FormOfFoul::all();
        return response()->json([
            "success" => true,
            "message" => "Foul List",
            "data" => $formlOfFoul
        ]);
    }
    public function store(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'id' => 'required',
            'name' => 'required',
            'point' => 'required',
            'category_foul_id'=> 'required'
        ]);
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }
        $formlOfFoul = FormOfFoul::create($input);
        if ($formlOfFoul){
            return response()->json([
                "success" => true,
                "message" => "Form of foul created successfully.",
                "data" => $formlOfFoul
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
        $formlOfFoul = FormOfFoul::find($id);
        if (is_null($formlOfFoul)) {
            return $this->sendError('Form of foul  not found.');
        }
        return response()->json([
            "success" => true,
            "message" => "Form of foul retrieved successfully.",
            "data" => $formlOfFoul
        ]);
    }
    public function update(Request $request, FormOfFoul $formlOfFoul)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'name' => 'required',
            'point' => 'required',
            'category_foul_id'=> 'required'
        ]);
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }
        $formlOfFoul->name = $input['name'];
        $formlOfFoul->point = $input['point'];
        $formlOfFoul->category_foul_id = $input['category_foul_id'];
        $formlOfFoul->save();
        return response()->json([
            "success" => true,
            "message" => "Form of foul  updated successfully.",
            "data" => $formlOfFoul
        ]);
    }
    public function destroy(FormOfFoul $formlOfFoul)
    {
        $formlOfFoul->delete();
        return response()->json([
            "success" => true,
            "message" => "Form of foul deleted successfully.",
            "data" => $formlOfFoul
        ]);
    }
}
