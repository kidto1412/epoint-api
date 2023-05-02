<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ParentStudent extends Model
{
    use HasFactory;
    protected $keyType = 'string';
    protected $fillable = [
        'id', 'name','username','date_and_place_of_birth','date_and_place_of_birth','profile_photo_path'
    ];
    protected $hidden = [
        'password',
        'remember_token',
    ];
    protected $appends = [
        'profile_photo_url',
    ];
}
