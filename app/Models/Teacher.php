<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Fortify\TwoFactorAuthenticatable;
use Laravel\Jetstream\HasProfilePhoto;
use Laravel\Jetstream\HasTeams;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Foundation\Auth\User as Authenticatable;
class Teacher extends Authenticatable
{
    use HasFactory;

    protected $fillable = [
      'id', 'nip','name','position', 'password','gender','phone_number','date_and_place_of_birth','address',
    ];

    protected $table = 'teachers';
//    protected $guard = 'teacher-api';

    use Notifiable;
    use HasFactory;
    use HasApiTokens;
    use HasFactory;
    use HasProfilePhoto;
    use HasTeams;
    use Notifiable;
    use TwoFactorAuthenticatable;

    protected $hidden = [
        'password',
        'remember_token',
    ];
    protected $appends = [
        'profile_photo_url',
    ];

    public function fouls(){
        return $this->hasMany(Foul::class);
    }


}

