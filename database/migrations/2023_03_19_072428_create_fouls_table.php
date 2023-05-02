<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFoulsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('fouls', function (Blueprint $table) {
            $table->string('id')->primary();
            $table->time('time')->nullable();
            $table->date('date')->nullable();
            $table->string('description')->nullable();
            $table->string('student_nis');
            $table->foreign('student_nis')->references('nis')->on('students')->onDelete('cascade') ;
            $table->string('teacher_nip');
            $table->foreign('teacher_nip')->references('nip')->on('teachers')->onDelete('cascade');
            $table->string('form_of_foul_id');
            $table->foreign('form_of_foul_id')->references('id')->on('form_of_fouls');



            $table->softDeletes();
            $table->timestamps();
        });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('fouls');
    }
}
