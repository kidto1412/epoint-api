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
        $foulCategory = FoulCategory::all();
        return response()->json([
            "success" => true,
            "message" => "Foul List",
            "data" => $foulCategory
        ]);
    }
    public function store(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'id' => 'required',
            'name' => 'required',

        ]);
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }
        $foulCategory = FoulCategory::create($input);
        if ($foulCategory){
            return response()->json([
                "success" => true,
                "message" => "Foul category created successfully.",
                "data" => $foulCategory
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
        $foulCategory = FoulCategory::find($id);
        if (is_null($foulCategory)) {
            return $this->sendError('Foul category not found.');
        }
        return response()->json([
            "success" => true,
            "message" => "Foul category retrieved successfully.",
            "data" => $foulCategory
        ]);
    }
    public function update(Request $request, FoulCategory $foulCategory)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'name' => 'required'
        ]);
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }
        $foulCategory->name = $input['name'];
        $foulCategory->save();
        return response()->json([
            "success" => true,
            "message" => "Foul Category room updated successfully.",
            "data" => $foulCategory
        ]);
    }
    public function destroy(FoulCategory $foulCategory)
    {
        $foulCategory->delete();
        return response()->json([
            "success" => true,
            "message" => "Foul category deleted successfully.",
            "data" => $foulCategory
        ]);
    }
}
