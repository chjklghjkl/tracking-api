<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Teams;

class Userteam extends Model
{
    use HasFactory;
	protected $fillable = [
        'user_id',
        'team_id',
        
    ];
	public function users(){
		return $this->belongsTo(User::class,'user_id');
	}
	public function teams(){
		return $this->belongsTo(Teams::class,'team_id');
	}
	
}
