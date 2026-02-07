<?php

namespace App\Http\Controllers;

use App\Models\Student;
use App\Models\Teacher;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Hash;

class TeacherController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $teacher = Teacher::paginate(5);
        return view('teacher.index',['teacher' => $teacher]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        return view('teacher.create');

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
//        $data = $request->all();
        $teacher = new Teacher;

//        Teacher::create($data);
        $teacher->nip = $request->get('nip');
        $teacher->name = $request->get('name');
        $teacher->password = $request->get('password');
        $teacher->position = $request->get('position');
        $teacher->gender = $request->get('gender');
        $teacher->phone_number = $request->get('phone');
        $teacher->date_and_place_of_birth = $request->get('date');
        $teacher->address = $request->get('address');
        if ($request->hasFile('profile_photo_path')) {
            $file = $request->file('profile_photo_path');
            $filename = $request->get('nip') . '.' . $file->getClientOriginalExtension();
            $image_path = $request->file('profile_photo_path')->storeAs('assets/images/teacher', $filename ,'public');
            $teacher->profile_photo_path = $image_path;
        }

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
                'message' => 'NIP:' . ' ' .$request->get('nip'). 'Password:' . ' ' .$request->get('password'),
            ),
            CURLOPT_HTTPHEADER => array(
                "Authorization: 2rckSdktSzAJEWJzVPp8s"
            ),
        ));


        $response = curl_exec($curl);

        curl_close($curl);

        $teacher->password = Hash::make($request->get('password'));

        $teacher->save();
        return redirect()->route('teacher.index');
//        $data['picturePath'] = $request->file('picturePath')->store('assets/user', 'public');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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
        $teacher = Teacher::findOrFail($id);
        return view('teacher.edit', ['item' => $teacher]);
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
//        if($request->file('picturePath'))
//        {
//            $data['picturePath'] = $request->file('picturePath')->store('assets/teacher', 'public');
//        }
        $teacher = Teacher::findOrFail($id);
        $teacher->nip = $request->get('nip');
        $teacher->name = $request->get('name');
//        $teacher->password = Hash::make($request->get('password'));
        $teacher->position = $request->get('position');
        $teacher->gender = $request->get('gender');
        $teacher->phone_number = $request->get('phone');
        $teacher->date_and_place_of_birth = $request->get('date');
        $teacher->address = $request->get('address');

        if ($request->file('profile_photo_path')) {
            if($teacher->profile_photo_path && file_exists(storage_path('app/public/' .
                    $teacher->profile_photo_path))){
                \Storage::delete('public/' . $teacher->profile_photo_path);
            }
            $file = $request->file('profile_photo_path');
            $filename = $request->get('nip') . '.' . $file->getClientOriginalExtension();
            $image_path = $request->file('profile_photo_path')->storeAs('assets/images/teacher', $filename ,'public');
            $teacher->profile_photo_path = $image_path;
        }
        $teacher->save();
//        return redirect()->route('teacher.index');
        return redirect()->route('teacher.index')->with('status', 'Edit succesfully updated');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Teacher $teacher)
    {
        //
        Storage::delete('public/' . $teacher->profile_photo_path);
        $teacher->delete();

        return redirect()->route('teacher.index');
    }
}
