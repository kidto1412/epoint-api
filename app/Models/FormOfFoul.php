<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FormOfFoul extends Model
{
    use HasFactory;
    protected $table = 'form_of_fouls';
    protected $keyType = 'string';
    protected $fillable = [
       'id', 'name', 'point','category_foul_id'
    ];
    public function category(){
        return $this->belongsTo(FoulCategory::class,'category_foul_id','id');
    }
    public function violations(){
        return $this->hasMany(Foul::class,'form_of_foul_id','id');
    }
}
