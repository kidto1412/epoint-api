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
            $table->string('student_nis')->nullable();
            $table->string('teacher_nip')->nullable();


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
