<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ClassRoom;
use App\Helpers\ResponseFormatter;

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
}
