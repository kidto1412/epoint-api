<?php

namespace App\Http\Controllers;

use App\Models\Student;
use App\Models\Teacher;
use Illuminate\Http\Request;

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
        $teacher->password = \Hash::make($request->get('password'));
        $teacher->position = $request->get('position');
        $teacher->gender = $request->get('gender');
        $teacher->phone_number = $request->get('phone');
        $teacher->date_and_place_of_birth = $request->get('date');
        $teacher->address = $request->get('address');
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
        $teacher->password = Hash::make($request->get('password'));
        $teacher->position = $request->get('position');
        $teacher->gender = $request->get('gender');
        $teacher->phone_number = $request->get('phone');
        $teacher->date_and_place_of_birth = $request->get('date');
        $teacher->address = $request->get('address');
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
        $teacher->delete();

        return redirect()->route('teacher.index');
    }
}
