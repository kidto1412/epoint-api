<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Foul extends Model
{
    protected $table = 'fouls';
    use HasFactory;
//    protected $keyType = 'string';
    protected $fillable = [
       'id','time', 'date','description','student_nis','teacher_nip','form_of_foul_id','status','photo',
    ];
    public function student()
    {
        return $this->belongsTo(Student::class, 'student_nis', 'nis');
    }

    public function form()
    {
        return $this->belongsTo(FormOfFoul::class, 'form_of_foul_id', 'id');
    }

    public function teacher()
    {
        return $this->belongsTo(Teacher::class, 'teacher_nip', 'nip');
    }
    public function category()
    {
        return $this->form()->belongsTo(FoulCategory::class, 'category_id');
    }

}
