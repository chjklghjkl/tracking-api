<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Department;

class Teams extends Model
{
    use HasFactory;
	protected $fillable = [
        
     'created_by', 'user_id','teamname','phoneno','staffid','captchaid','deptid'
    ];
	public function dept()
    {

        return $this->belongsTo(Department::class,'deptid');

    }
	public function staff()
    {

        return $this->belongsTo(Staff::class,'staffid');

    }
	public function createdby(){
		 return $this->belongsTo(User::class,'created_by');

	}
}
