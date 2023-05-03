<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FormOfFoul extends Model
{
    use HasFactory;
    protected $keyType = 'string';
    protected $fillable = [
       'id', 'name', 'point','category_foul_id'
    ];
}
