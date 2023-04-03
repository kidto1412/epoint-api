<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\FormOfFoul;
use Illuminate\Http\Request;
use App\Helpers\ResponseFormatter;

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
}
