<?php

namespace App\Http\Controllers\API;

use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\Foul;
use App\Models\Major;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class MajorController extends Controller
{
    //
    public function index(Request $request)
    {
        $major = Major::all();
        return response()->json([
            "success" => true,
            "message" => "Product List",
            "data" => $major
        ]);
    }
    public function store(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'id' => 'required',
            'name' => 'required'
        ]);
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }
        $major = Major::create($input);
        if ($major){
        return response()->json([
            "success" => true,
            "message" => "Product created successfully.",
            "data" => $major
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
        $major = Major::find($id);
        if (is_null($major)) {
            return $this->sendError('Major not found.');
        }
        return response()->json([
            "success" => true,
            "message" => "Major retrieved successfully.",
            "data" => $major
        ]);
    }
    public function update(Request $request, Major $major)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'name' => 'required'
        ]);
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }
        $major->name = $input['name'];
        $major->save();
        return response()->json([
            "success" => true,
            "message" => "Major updated successfully.",
            "data" => $major
        ]);
    }
    public function destroy(Major $major)
    {
        $major->delete();
        return response()->json([
            "success" => true,
            "message" => "Major deleted successfully.",
            "data" => $major
        ]);
    }
}
