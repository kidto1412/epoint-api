<?php

namespace App\Http\Controllers;

use App\Models\Foul;
use App\Models\FoulCategory;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Validator;

class FoulController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $fouls = Foul::with('student.class.major', 'student.parent', 'student.violations.form.category', 'student.violations.teacher')
            ->paginate(5);

        $fouls->getCollection()->transform(function ($foul) {
            $totalPoint = $foul->student->violations->sum(function ($violation) {
                if ($violation->status == 'SUCCESS') {
                    return $violation->form->point;
                }
            });

            $foul->total_point = $totalPoint;
            return $foul;
        });

//        dd($fouls);

        return view('foul.index', ['fouls' => $fouls]);
    }
    public function approveFoul(Request $request, $id)
    {
        $foul = Foul::findOrFail($id);
        $foul->status = 'SUCCESS';
        $foul->save();
        return redirect()->route('foul.index');
    }
    public function rejectFoul(Request $request, $id)
    {
        $foul = Foul::findOrFail($id);
        $foul->status = 'REJECTED';
        $foul->save();
        return redirect()->route('foul.index');
    }

    public function sendError($message, $data = [])
    {
        return response()->json([
            'success' => false,
            'message' => $message,
            'data' => $data,
        ], Response::HTTP_BAD_REQUEST);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
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
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
