<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Foul;
use App\Models\Student;
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


        if ($id) {
            $classRoom = ClassRoom::find($id);

            if ($classRoom)
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

        if ($name)
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
        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors());
        }
        $classRoom = ClassRoom::create($input);
        if ($classRoom) {
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
        if ($validator->fails()) {
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

    public function pointClass(Request $request)
    {
        // Define the category weights
        $categoryWeights = [
            'Sikap dan Prilaku' => 0.5,
            'Kerapian' => 0.25,
            'Kerajinan' => 0.25,
        ];

        $classRooms = ClassRoom::with([
            'major',
            'students.violations' => function ($query) {
                $query->where('status', 'SUCCESS')
                    ->with('form.category');
            }
        ])->get();


        $allVectorS = [];

        $classRooms->each(function ($classRoom) use ($categoryWeights, &$allVectorS) {
            $totalPoints = [
                'Sikap dan Prilaku' => 0,
                'Kerapian' => 0,
                'Kerajinan' => 0,
            ];

            $classRoom->students->each(function ($student) use ($categoryWeights, &$totalPoints) {
                $student->violations->where('status','SUCCESS')->each(function ($violation) use ($categoryWeights, &$totalPoints) {
//

                        $category = $violation->form->category->name;
                        $pointValue = $violation->form->point;

                        if (isset($categoryWeights[$category])) {
                            $totalPoints[$category] += $pointValue; // Jumlahkan total point pada masing-masing kategori
                        } else {
                            // Handle if the category weight is not defined
                            // You can set a default weight or skip the point calculation for that category.
                        }

                });
            });

            // Calculate the vector S for the class
            $vectorS = 1;
            foreach ($totalPoints as $category => $point) {
                $vectorS *= pow($point, $categoryWeights[$category]);
            }
            $classRoom->vectorS = $vectorS;
            $allVectorS[] = $vectorS; // Store the class's vector S in the array
        });

        // Calculate the sum of all classes' vector S
        $sumVectorS = array_sum($allVectorS);

        // Calculate vector V for each class
        $classRooms->each(function ($classRoom) use ($sumVectorS) {

            if ($sumVectorS != 0){
            $classRoom->vectorV = $classRoom->vectorS / $sumVectorS;
            }
        });

        return ResponseFormatter::success(
            $classRooms,
            'Classrooms and total points retrieved successfully'
        );
    }



    public function pointClass2(Request $request)
    {
        $data = Foul::select([
            'majors.name AS major_name',
            'class_rooms.grade',
            \DB::raw('SUM(CASE WHEN foul_categories.name = "Sikap dan Perilaku" THEN form_of_fouls.point ELSE 0 END) AS category_1_points'),
            \DB::raw('SUM(CASE WHEN foul_categories.name = "Kerapian" THEN form_of_fouls.point ELSE 0 END) AS category_2_points'),
            \DB::raw('SUM(CASE WHEN foul_categories.name = "Kerajinan" THEN form_of_fouls.point ELSE 0 END) AS category_3_points')
        ])
            ->join('form_of_fouls', 'fouls.form_of_foul_id', '=', 'form_of_fouls.id')
            ->join('foul_categories', 'form_of_fouls.category_foul_id', '=', 'foul_categories.id')
            ->join('students', 'fouls.student_nis', '=', 'students.nis')
            ->join('class_rooms', 'students.id_class_room', '=', 'class_rooms.id')
            ->join('majors', 'class_rooms.major_id', '=', 'majors.id')
            ->groupBy('majors.name', 'class_rooms.grade')
            ->get();

        return $data;
    }
    public function pointClass3($classRoomCode)
    {
        $classRoom = ClassRoom::with('students.violations.form.category')
            ->where('id', $classRoomCode)
            ->first();

        if (!$classRoom) {
            return ResponseFormatter::error(
                null,
                'Classroom not found',
                404
            );
        }

        $classRoom->students->each(function ($student) {
            $totalPoint = $student->violations->reduce(function ($point, $violation) {
                $category = $violation->form->category->name;
                $pointValue = $violation->form->point;

                $categoryWeight = $this->getCategoryWeight($category);

                $point *= pow($pointValue, $categoryWeight);
                return $point;
            }, 1);

            $student->total_point = $totalPoint;
        });

        // Calculate the sum of all total points for the classroom
        $totalPointsSum = $classRoom->students->sum('total_point');

        // Calculate the vector V for the classroom
        $classRoom->V = $totalPointsSum;

        return ResponseFormatter::success(
            $classRoom,
            'Classroom and total points retrieved successfully'
        );
    }
    public function pointClas4(Request $request)
    {
        $classRooms = ClassRoom::with('students.violations.form.category')->get();

        $classRooms->each(function ($classRoom) {
            $categoryPoints = [
                'Sikap dan Prilaku' => 0,
                'Kerajinan' => 0,
                'Kerapian' => 0,
            ];



            $classRoom->students->each(function ($student) use (&$categoryPoints) {

                $student->violations->each(function ($violation) use (&$categoryPoints) {

                    $category = $violation->form->category->name;
                    $pointValue = $violation->form->point;
                    $categoryPoints[$category] += $pointValue;
                });
            });

            $classRoom->total_point = $this->calculateTotalPoint($categoryPoints);
        });

        // Calculate the sum of all total points for the classroom
        $totalPointsSum = $classRooms->sum('total_point');

        // Calculate the vector V for all classrooms
        $classRooms->each(function ($classRoom) use ($totalPointsSum) {
            $classRoom->V = $classRoom->total_point / $totalPointsSum;
        });

        return ResponseFormatter::success(
            $classRooms,
            'Classrooms and total points retrieved successfully'
        );
    }

    private function calculateTotalPoint($categoryPoints)
    {
        $categoryWeights = $this->getCategoryWeight();
        $totalPoint = 0;

        foreach ($categoryPoints as $category => $pointValue) {
            $categoryWeight = $categoryWeights[$category];
            $totalPoint *= pow($pointValue, $categoryWeight);
        }

        return $totalPoint;
    }


    private function getCategoryWeight($category)
    {
        $categoryWeights = [
            'Sikap dan Perilaku' => 0.5, // Sikap dan Perilaku
            'Kerajinan' => 0.25, // Kerajinan
            'Kerapian' => 0.25 // Kerapian
        ];

        return $categoryWeights[$category] ?? 0;
    }
    public function listForReport()
{
    $classRooms = ClassRoom::with('major')
        ->get()
        ->map(function ($classRoom) {
            return [
                'id' => $classRoom->id,
                'class_name' => $classRoom->grade . ' ' . $classRoom->major->name
            ];
        });

    return response()->json([
        'success' => true,
        'message' => 'List kelas untuk report',
        'data' => $classRooms
    ]);
}

}
