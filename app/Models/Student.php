<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
//use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Fortify\TwoFactorAuthenticatable;
use Laravel\Jetstream\HasProfilePhoto;
use Laravel\Jetstream\HasTeams;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Foundation\Auth\User as Authenticatable;
class Student extends Authenticatable
{
//    public function student()
//    {
//        return $this->belongsTo(Student::class, 'tokenable_id');
//    }

    use Notifiable;
    use HasFactory;
    use HasApiTokens;
    use HasFactory;
    use HasProfilePhoto;
    use HasTeams;
    use Notifiable;
    use TwoFactorAuthenticatable;

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $table = 'students';
    protected $guard = 'students';


    protected $fillable = [
       'id', 'nis', 'name', 'username','password','date_and_place_of_birth','gender','phone_number','address','profile_photo_path','id_parent','id_class_room'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array
     */


    /**
     * The accessors to append to the model's array form.
     *
     * @var array
     */
    protected $appends = [
        'profile_photo_url',
    ];

    public function parent(){
        return $this->belongsTo(Parents::class,'id_parent');
    }

    public function class(){
        return $this->belongsTo(ClassRoom::class,'id_class_room');
    }

    public function violations(){
        return $this->hasMany(Foul::class,'student_nis','nis');
    }


}
