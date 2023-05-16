<?php

namespace App\Http\Controllers;

use App\Models\Parents;
use App\Models\Teacher;
use Illuminate\Http\Request;

class ParentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $parent = Parents::paginate(5);
        return view('parent.index',['parent' => $parent]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        return view('parent.create');
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
        //
//        $data = $request->all();
        $parent = new Parents();

//        Teacher::create($data);

        $parent->name = $request->get('name');
        $parent->username = $request->get('username');
        $parent->password = \Hash::make($request->get('password'));
        $parent->date_and_place_of_birth = $request->get('date');
        $parent->phone_number = $request->get('phone');
        $parent->address = $request->get('address');
        $parent->save();
        return redirect()->route('parent.index');
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
        $parent = Parents::findOrFail($id);
        return view('parent.edit', ['item' => $parent]);
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
        $parent = Parents::findOrFail($id);

//        Teacher::create($data);

        $parent->name = $request->get('name');
        $parent->username = $request->get('username');
        $parent->password = Hash::make($request->get('password'));
        $parent->date_and_place_of_birth = $request->get('date');
        $parent->phone_number = $request->get('phone');
        $parent->address = $request->get('address');
        $parent->save();
        return redirect()->route('parent.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Parents $parent)
    {
        //
        $parent->delete();

        return redirect()->route('parent.index');
    }
}
