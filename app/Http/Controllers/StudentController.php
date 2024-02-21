<?php

namespace App\Http\Controllers;

use App\Models\ClassRoom;
use App\Models\FormOfFoul;
use App\Models\Major;
use App\Models\Parents;
use App\Models\Student;
use App\Models\Teacher;
use http\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Http;
class StudentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $student = Student::paginate(5);
        return view('student.index',['student' => $student]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        $parent = Parents::all();
        $class = ClassRoom::all();
        return view('student.create',['parent' => $parent,'class' => $class,]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $student = new Student();

//        Teacher::create($data);
        $student->nis = $request->get('nis');
        $student->name = $request->get('name');
        $student->password = $request->get('password');
        $student->date_and_place_of_birth = $request->get('date');
        $student->gender = $request->get('gender');
        $student->phone_number = $request->get('phone');
        $student->address = $request->get('address');
        $student->id_parent = $request->get('id_parent');
        $student->id_class_room = $request->get('id_class');
        if ($request->hasFile('profile_photo_path')) {
            $image_path = $request->file('profile_photo_path')->store('assets/images/student', 'public');
            $student->profile_photo_path = $image_path;
        }


//        message via whatsapp
        $curl = curl_init();
        $target = $request->get('phone');

        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://api.fonnte.com/send',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => array(
                'target' => $target,
                'message' => 'Password:' . ' ' .$request->get('password'),
            ),
            CURLOPT_HTTPHEADER => array(
                "Authorization: fgopvgfewg_NYkr2HyFF"
            ),
        ));

        $response = curl_exec($curl);

        curl_close($curl);


        $student->password = Hash::make($request->get('password'));

        $student->save();
        return redirect()->route('student.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($nis)
    {
        //
        $detail = DB::table('fouls')
            ->join('form_of_fouls', 'fouls.form_of_foul_id', '=', 'form_of_fouls.id')
            ->select('fouls.*', 'form_of_fouls.*')
            ->where('student_nis',$nis)
            ->get();
        return view('student.detail', ['detail' => $detail]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        $student= Student::findOrFail($id);
        $class = ClassRoom::all();
        $parent = Parents::all();
        return view('student.edit', [
            'student' => $student,'class' => $class,'parent' => $parent
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $student= Student::findOrFail($id);
        $student->nis = $request->get('nis');
        $student->name = $request->get('name');
//        $student->password = Hash::make($request->get('password'));
        $student->date_and_place_of_birth = $request->get('date');
        $student->gender = $request->get('gender');
        $student->phone_number = $request->get('phone');
        $student->address = $request->get('address');
        $student->id_parent = $request->get('id_parent');
        $student->id_class_room = $request->get('id_class');
        if ($request->file('profile_photo_path')) {
            if($student->profile_photo_path && file_exists(storage_path('app/public/' .
                    $student->profile_photo_path))){
                \Storage::delete('public/' . $student->profile_photo_path);
            }
            $image_path = $request->file('profile_photo_path')->store('assets/images/student', 'public');
            $student->profile_photo_path = $image_path;
        }
        $student->save();
        return redirect()->route('student.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Student $student)
    {
        //
        Storage::delete('public/' . $student->profile_photo_path);
        $student->delete();

        return redirect()->route('student.index');
    }
}
