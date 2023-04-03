<?php

namespace App\Http\Controllers\API;

use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\Foul;
use App\Models\Major;
use Illuminate\Http\Request;

class MajorController extends Controller
{
    //
    public function all(Request $request)
    {
        $id = $request->input('id');
        $limit = $request->input('limit', 6);
        $name = $request->input('name');


        if($id)
        {
            $major = Major::find($id);

            if($major)
                return ResponseFormatter::success(
                    $major,
                    'Data jurusan berhasil diambil'
                );
            else
                return ResponseFormatter::error(
                    null,
                    'Data jurusan tidak ada',
                    404
                );
        }

        $major = Major::query();

        if($name)
            $major->where('name', 'like', '%' . $name . '%');



        return ResponseFormatter::success(
            $major->paginate($limit),
            'Data list  jurusan berhasil diambil'
        );
    }
}
