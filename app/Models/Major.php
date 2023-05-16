<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Major extends Model
{
    use HasFactory;
    protected $table = 'majors';
    protected $keyType = 'string';
    protected $fillable = [
       'id', 'name',
    ];
    protected $guarded = [];

    public function class(){
        return $this->hasMany(ClassRoom::class);
    }
}
