<?php

namespace App\Http\Controllers\API;

use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\FormOfFoul;
use App\Models\Foul;
use App\Models\ClassRoom;
use App\Models\FoulCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Response;
use Dompdf\Dompdf;
use Dompdf\Options;

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
    public function index(Request $request)
    {
        $limit = $request->input('limit',20);
        $fouls = FormOfFoul::all();
//        return response()->json([
//            "success" => true,
//            "message" => "Foul List",
//            "data" => $formlOfFoul->paginage($limit)
//        ]);
        return ResponseFormatter::success(
            $fouls,
            'Foul list get successed'
        );
    }
    public function store(Request $request)
    {
        $input = $request->all();
        $input['status'] = 'SUBMITTED';
//        dd($input);

        $validator = Validator::make($input, [
            'time' => 'required',
            'date' => 'required',
            'description'=> 'required',
            'student_nis'=> 'required',
            'teacher_nip'=> 'required',
            'form_of_foul_id'=> 'required',
            'status'=> 'required'
        ]);
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }
        if ($request->hasFile('photo')) {
            $image_path = $request->file('photo')->store('assets/images/fouls', 'public');
            $input['photo'] = $image_path;
        }

        $foul = Foul::create($input);

        if ($foul){
         
            return response()->json([
                "success" => true,
                "message" => "Foul created successfully.",
                "data" => $foul,
               
            ]);
        } else {
            return response()->json([
                    'message' => 'failed',
                ]
            );
        }
    }
    public function sendError($message, $data = [])
    {
        return response()->json([
            'success' => false,
            'message' => $message,
            'data' => $data,
        ], Response::HTTP_BAD_REQUEST);
    }
    public function show($id)
    {
        $foul = Foul::find($id);
        if (is_null($foul)) {
            return $this->sendError('Foul  not found.');
        }
        return response()->json([
            "success" => true,
            "message" => "Foul retrieved successfully.",
            "data" => $foul
        ]);
    }
    public function update(Request $request, Foul $foul)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'name' => 'required',
            'time' => 'required',
            'date' => 'required',
            'description'=> 'required',
            'student_nis'=> 'required',
            'teacher_nip'=> 'required',
            'form_of_foul_id'=> 'required'
        ]);
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }
        $foul->name = $input['name'];
        $foul->time = $input['time'];
        $foul->date = $input['date'];
        $foul->description = $input['description'];
        $foul->student_nis = $input['student_nis'];
        $foul->teacher_nip = $input['teacher_nip'];
        $foul->form_of_foul_id = $input['form_of_foul_id'];
        $foul->save();
        return response()->json([
            "success" => true,
            "message" => "Form of foul  updated successfully.",
            "data" => $foul
        ]);
    }

    public function destroy(Foul $foul)
    {
        $foul->delete();
        return response()->json([
            "success" => true,
            "message" => "Foul deleted successfully.",
            "data" => $foul
        ]);
    }
    public function submittedList() {
        $fouls = Foul::with([
            'student.class.major',
            'form.category',
            'teacher'
        ])->where('status', 'SUBMITTED')->orderBy('date', 'desc')->get();
        
         return response()->json([
            "success" => true,
            "message" => "Success",
            "data" => $fouls
        ]);
    }
    public function approve(Request $request, $id)
    {
    $validator = Validator::make($request->all(), [
        'status' => 'required|in:SUCCESS,REJECTED'
    ]);

    if ($validator->fails()) {
        return response()->json([
            'success' => false,
            'message' => 'Validation Error',
            'data' => $validator->errors()
        ], 400);
    }

    $foul = Foul::find($id);

    if (!$foul) {
        return response()->json([
            'success' => false,
            'message' => 'Data not found'
        ], 404);
    }

    // Optional: hanya boleh diubah kalau status masih SUBMITTED
    if ($foul->status !== 'SUBMITTED') {
        return response()->json([
            'success' => false,
            'message' => 'Status already processed'
        ], 400);
    }

    $foul->status = $request->status;
    $foul->save();

    if ($request->status === 'SUCCESS') {

        $studentWithParent = DB::table('students')
            ->join('parents', 'students.id_parent', '=', 'parents.id')
            ->select('students.*', 'parents.*')
            ->where('students.nis', $foul->student_nis)
            ->first();

        $formOfFoul = FormOfFoul::find($foul->form_of_foul_id);
        $photoUrl = null;

        if ($foul->photo) {
           $photoUrl = 'http://192.168.101.19:8000/storage/' . $foul->photo;
        //    dd($photoUrl);
        }
        if ($studentWithParent) {

            $curl = curl_init();

            curl_setopt_array($curl, array(
                CURLOPT_URL => 'https://api.fonnte.com/send',
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_POST => true,
                CURLOPT_POSTFIELDS => array(
                    'target' => $studentWithParent->phone_number,
                    'message' =>
                        'Pelanggaran: ' . $formOfFoul->name .
                        "\nPoint: " . $formOfFoul->point .
                        "\nStatus: DISETUJUI",
                    'url' => "http://192.168.101.19:8000/".$photoUrl, 
                ),
                CURLOPT_HTTPHEADER => array(
                    "Authorization: 2rckSdktSzAJEWJzVPp8"
                ),
            ));
            // dd("http://192.168.101.19:8000/".$photoUrl);
            curl_exec($curl);
            curl_close($curl);
        }
    }

    return response()->json([
        'success' => true,
        'message' => 'Status updated successfully',
        'data' => $foul
    ]);
}
public function reportPdf(Request $request)
{
    $startDate = $request->startDate;
    $endDate   = $request->endDate;
    $classId   = $request->class_id;

    $categoryWeights = [
        'Sikap dan Prilaku' => 0.5,
        'Kerapian' => 0.25,
        'Kerajinan' => 0.25,
    ];

    $query = ClassRoom::with([
        'major',
        'students' => function ($q) use ($startDate, $endDate) {
            $q->whereHas('violations', function ($qq) use ($startDate, $endDate) {
                $qq->where('status', 'SUCCESS')
                   ->when($startDate && $endDate, function ($q2) use ($startDate, $endDate) {
                       $q2->whereBetween('date', [$startDate, $endDate]);
                   });
            })
            ->with(['violations' => function ($qq) use ($startDate, $endDate) {
                $qq->where('status', 'SUCCESS')
                   ->when($startDate && $endDate, function ($q2) use ($startDate, $endDate) {
                       $q2->whereBetween('date', [$startDate, $endDate]);
                   })
                   ->with('form.category', 'teacher');
            }]);
        }
    ]);

    if ($classId) {
        $query->where('id', $classId);
    }

    $classRoom = $query->first(); // hanya satu kelas

    if (!$classRoom) {
        return response()->json(['message' => 'Class not found'], 404);
    }

    // ================= WP CALCULATION =================

    $totalPoints = [
        'Sikap dan Prilaku' => 0,
        'Kerapian' => 0,
        'Kerajinan' => 0,
    ];

    foreach ($classRoom->students as $student) {
        foreach ($student->violations as $violation) {
            $category = $violation->form->category->name;
            $point    = $violation->form->point;

            if (isset($categoryWeights[$category])) {
                $totalPoints[$category] += $point;
            }
        }
    }

    $epsilon = 0.0001;

$vectorS = 1;

foreach ($totalPoints as $category => $point) {
    // $value = $point > 0 ? $point : $epsilon;
    $vectorS *= pow($point, $categoryWeights[$category]);
}


    $vectorV = $vectorS; // karena hanya 1 kelas, V = S

    // ================= PDF =================

    $className = "Kelas {$classRoom->grade} {$classRoom->major->name}";

    $html = "<h2>Report Pelanggaran</h2>";
    $html .= "<p>Periode: $startDate - $endDate</p>";
    $html .= "<h3>$className</h3>";
    $html .= "<p>Vector S: $vectorS</p>";
    $html .= "<p>Vector V: $vectorV</p>";

    $html .= "<table border='1' width='100%' cellpadding='5' cellspacing='0'>
                <tr>
                    <th>Siswa</th>
                    <th>Pelanggaran</th>
                    <th>Kategori</th>
                    <th>Point</th>
                    <th>Guru</th>
                </tr>";

    foreach ($classRoom->students as $student) {
        foreach ($student->violations as $violation) {
            $html .= "<tr>
                        <td>{$student->name}</td>
                        <td>{$violation->form->name}</td>
                        <td>{$violation->form->category->name}</td>
                        <td>{$violation->form->point}</td>
                        <td>{$violation->teacher->name}</td>
                      </tr>";
        }
    }

    $html .= "</table>";

    $dompdf = new \Dompdf\Dompdf();
    $dompdf->loadHtml($html);
    $dompdf->setPaper('A4', 'portrait');
    $dompdf->render();

    return response($dompdf->output())
        ->header('Content-Type', 'application/pdf')
        ->header('Content-Disposition', 'attachment; filename="report-pelanggaran.pdf"');
}





}
