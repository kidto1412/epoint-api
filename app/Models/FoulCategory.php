<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FoulCategory extends Model
{
    use HasFactory;
    protected $table = 'foul_categories';
    protected $keyType = 'string';
    protected $fillable = [
        'id','name'
    ];
    public function forms(){
        return $this->hasMany(FormOfFoul::class);
    }
}
