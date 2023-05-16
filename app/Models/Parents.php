<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Fortify\TwoFactorAuthenticatable;
use Laravel\Jetstream\HasProfilePhoto;
use Laravel\Jetstream\HasTeams;
use Laravel\Sanctum\HasApiTokens;

class Parents extends Authenticatable
{
    use HasFactory;
    use HasFactory;
    use Notifiable;
    use HasFactory;
    use HasApiTokens;
    use HasFactory;
    use HasProfilePhoto;
    use HasTeams;
    use Notifiable;
    use TwoFactorAuthenticatable;

    protected $table = 'parents';
    protected $fillable = [
        'id', 'name','username', 'password','remember_token','date_and_place_of_birth','phone_number','address','profile_photo_path'
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

//    protected $appends = [
//        'profile_photo_url',
//    ];
    public function students(){
        return $this->hasMany(Student::class,'id_parent');
    }
}
