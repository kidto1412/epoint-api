<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ClassRoom extends Model
{
    use HasFactory;
    protected $table = 'class_rooms';

    protected $keyType = 'string';
    protected $fillable = ['id','grade', 'major_id'];
    protected $guarded = [];

//    relasi
    public function students(){
        return $this->hasMany(Student::class,'id_class_room');
    }
    public function major(){
        return $this->belongsTo(Major::class,'major_id');
    }
}
