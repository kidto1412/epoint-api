<?php

namespace App\Http\Controllers\API;

use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\Foul;
use App\Models\FoulCategory;
use Illuminate\Http\Request;

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
}
