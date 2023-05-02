<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Fortify\TwoFactorAuthenticatable;
use Laravel\Jetstream\HasProfilePhoto;
use Laravel\Jetstream\HasTeams;
use Laravel\Sanctum\HasApiTokens;

class Teacher extends Model
{
    use HasFactory;
    protected $fillable = [
      'id',  'nip','name','position', 'password','gender',
    ];
    protected $table = 'teachers';
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
}

