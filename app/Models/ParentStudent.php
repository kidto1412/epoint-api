<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Fortify\TwoFactorAuthenticatable;
use Laravel\Jetstream\HasProfilePhoto;
use Laravel\Jetstream\HasTeams;
use Laravel\Sanctum\HasApiTokens;

class ParentStudent extends Model
{
    use HasFactory;
    use Notifiable;
    use HasFactory;
    use HasApiTokens;
    use HasFactory;
    use HasProfilePhoto;
    use HasTeams;
    use Notifiable;
    use TwoFactorAuthenticatable;
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
