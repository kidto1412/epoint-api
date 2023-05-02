<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ClassRoom;
use App\Helpers\ResponseFormatter;
use Illuminate\Support\Facades\Validator;

class ClassRoomController extends Controller
{
    //
    public function all(Request $request)
    {
        $id = $request->input('id');
        $limit = $request->input('limit', 6);
        $name = $request->input('name');


        if($id)
        {
            $classRoom = ClassRoom::find($id);

            if($classRoom)
                return ResponseFormatter::success(
                    $classRoom,
                    'Data produk berhasil diambil'
                );
            else
                return ResponseFormatter::error(
                    null,
                    'Data kelas tidak ada',
                    404
                );
        }

        $classRoom = ClassRoom::query();

        if($name)
            $classRoom->where('name', 'like', '%' . $name . '%');



        return ResponseFormatter::success(
            $classRoom->paginate($limit),
            'Data list kelas berhasil diambil'
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
