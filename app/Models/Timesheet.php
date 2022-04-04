<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Timesheet extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'start',
        'end',
        'start_ip_address',
        'end_ip_address',
        'start_user_agent',
        'end_user_agent'
    ];

    protected $casts = [
        'start' => 'datetime',
        'end' => 'datetime',
    ];
}
