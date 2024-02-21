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
        $parent->password = $request->get('password');
        $parent->date_and_place_of_birth = $request->get('date');
        $parent->phone_number = $request->get('phone');
        $parent->address = $request->get('address');

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

        $parent->password = \Hash::make($request->get('password'));

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
        $parent->password = \Hash::make($request->get('password'));
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
