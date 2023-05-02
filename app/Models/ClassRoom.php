<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ClassRoom extends Model
{
    use HasFactory;
    protected $keyType = 'string';
    protected $fillable = ['id','grade', 'major_id'
    ];
    protected $guarded = [];
}
