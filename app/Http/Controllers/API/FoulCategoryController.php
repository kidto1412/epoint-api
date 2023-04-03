<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;

use App\Models\FoulCategory;
use Illuminate\Http\Request;
use App\Helpers\ResponseFormatter;
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
}
