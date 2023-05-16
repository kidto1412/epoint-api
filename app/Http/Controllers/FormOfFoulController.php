<?php

namespace App\Http\Controllers;

use App\Models\ClassRoom;
use App\Models\FormOfFoul;
use App\Models\FoulCategory;
use App\Models\Major;
use Illuminate\Http\Request;

class FormOfFoulController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $formOf = FormOfFoul::paginate(5);
        return view('form_foul.index',['formOf' => $formOf]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        $category = FoulCategory::all();
        return view('form_foul.create',['category' => $category]);
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
        $data = $request->all();
        FormOfFoul::create($data);
        return redirect()->route('form.index');
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
        $formOf = FormOfFoul::findOrFail($id);
        $category = FoulCategory::all();

        return view('form_foul.edit',
            ['formOf' => $formOf, 'category'=>$category]
        );
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, FormOfFoul $formOf)
    {
        //
        $data = $request->all();

        $formOf->update($data);

        return redirect()->route('form.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(FormOfFoul $formOf)
    {
        //
        $formOf->delete();

        return redirect()->route('form.index');
    }
}
