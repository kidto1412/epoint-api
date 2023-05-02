<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;

use App\Models\ClassRoom;
use App\Models\FoulCategory;
use Illuminate\Http\Request;
use App\Helpers\ResponseFormatter;
use Illuminate\Support\Facades\Validator;

class FoulCategoryController extends Controller
{
    //
    public function all(Request $request)
    {
        $id = $request->input('id');
        $limit = $request->input('limit', 6);
        $name = $request->input('name');


        if($id)
        {
            $foulCategory = FoulCategory::find($id);

            if($foulCategory)
                return ResponseFormatter::success(
                    $foulCategory,
                    'Data kategori pelanggaran berhasil diambil'
                );
            else
                return ResponseFormatter::error(
                    null,
                    'Data kategori pelanggaran tidak ada',
                    404
                );
        }

        $foulCategory = FoulCategory::query();

        if($name)
            $foulCategory->where('name', 'like', '%' . $name . '%');



        return ResponseFormatter::success(
            $foulCategory->paginate($limit),
            'Data list kategori pelanggara berhasil diambil'
        );
    }
    public function index(Request $request)
    {
        $classRoom = ClassRoom::all();
        return response()->json([
            "success" => true,
            "message" => "Product List",
            "data" => $classRoom
        ]);
    }
    public function store(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'id' => 'required',
            'grade' => 'required',
            'major_id' => 'required'
        ]);
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }
        $classRoom = ClassRoom::create($input);
        if ($classRoom){
            return response()->json([
                "success" => true,
                "message" => "Class room created successfully.",
                "data" => $classRoom
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
        $classRoom = ClassRoom::find($id);
        if (is_null($classRoom)) {
            return $this->sendError('Class Room not found.');
        }
        return response()->json([
            "success" => true,
            "message" => "Class Room retrieved successfully.",
            "data" => $classRoom
        ]);
    }
    public function update(Request $request, ClassRoom $classRoom)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'grade' => 'required',
            'major_id' => 'required'
        ]);
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }
        $classRoom->grade = $input['grade'];
        $classRoom->major_id = $input['major_id'];
        $classRoom->save();
        return response()->json([
            "success" => true,
            "message" => "Class room updated successfully.",
            "data" => $classRoom
        ]);
    }
    public function destroy(ClassRoom $classRoom)
    {
        $classRoom->delete();
        return response()->json([
            "success" => true,
            "message" => "Major deleted successfully.",
            "data" => $classRoom
        ]);
    }
}
