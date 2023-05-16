<?php

namespace App\Http\Controllers;

use App\Models\ClassRoom;
use App\Models\FormOfFoul;
use App\Models\Major;
use App\Models\Parents;
use App\Models\Student;
use App\Models\Teacher;
use Illuminate\Http\Request;

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
        $student->password = \Hash::make($request->get('password'));
        $student->date_and_place_of_birth = $request->get('date');
        $student->gender = $request->get('gender');
        $student->phone_number = $request->get('phone');
        $student->address = $request->get('address');
        $student->id_parent = $request->get('id_parent');
        $student->id_class_room = $request->get('id_class');
        $student->save();
        return redirect()->route('student.index');
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
        $student->password = Hash::make($request->get('password'));
        $student->date_and_place_of_birth = $request->get('date');
        $student->gender = $request->get('gender');
        $student->phone_number = $request->get('phone');
        $student->address = $request->get('address');
        $student->id_parent = $request->get('id_parent');
        $student->id_class_room = $request->get('id_class');
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
        $student->delete();

        return redirect()->route('student.index');
    }
}
