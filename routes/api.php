<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\TimesheetController;
use App\Http\Controllers\Api\TeamController;
use App\Http\Controllers\Api\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

/* Auth Routes */


   
    
Route::prefix('user')->group(function () {
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/login', [AuthController::class, 'login']);
   
});

/* Auth Routes */



/* User Routes */

Route::prefix('user')->middleware('auth:sanctum')->group(function () {

    Route::get('/me', [UserController::class, 'me']);
    Route::get('/roledetails', [UserController::class, 'roledetails']);
    Route::post('/logout',[UserController::class,'logout']);
    Route::get('/singlefetchuser/{id}',[UserController::class,'singlefetchuser']);
    Route::post('/editprofile',[UserController::class,'editprofile']);
  

});

Route::prefix('timesheet')->middleware('auth:sanctum')->group(function () {

    Route::get('/', [TimesheetController::class, 'getTimeSheet']);
    Route::post('/start', [TimesheetController::class, 'startTracking']);
    Route::post('/stop', [TimesheetController::class, 'endTracking']);


});

Route::prefix('team')->middleware('auth:sanctum')->group(function(){
   
    Route::post('/addattendance',[TeamController::class,'addattendance']);
    Route::get('/deleteattendance/{id}',[TeamController::class,'deleteattendance']);
    Route::get('/checkattendance',[TeamController::class,'checkattendance']);
    Route::Post('/editattendance',[TeamController::class,'editattendance']);
    Route::post('/addteam',[TeamController::class,'addteam']);
    Route::post('/editteam',[TeamController::class,'editteam']);
	Route::post('/addteammembers',[TeamController::class,'addteammembers']);
    Route::post('/addcapture',[TeamController::class,'addcapture']);
    Route::post('/editcapture',[TeamController::class,'editcapture']);
    Route::get('/getcapture',[TeamController::class,'getcapture']);
    Route::get('/singlecapture/{id}',[TeamController::class,'singlecapture']);
    Route::get('/deletecapture/{id}',[TeamController::class,'deletecapture']);
    Route::post('/adddepartment',[TeamController::class, 'adddepartment']);
    Route::get('/singledepartment/{id}',[TeamController::class,'singledepartment']);
    Route::get('/singlestaff/{id}',[TeamController::class,'singlestaff']);
    Route::get('/singleattendance/{id}',[TeamController::class,'singleattendance']);
    
    Route::get('/getdepartment',[TeamController::class, 'getdepartment']);
    Route::Post('/editdepartment',[TeamController::class, 'editdepartment']);
    Route::get('/departmentdelete/{id}',[TeamController::class, 'departmentdelete']);
    Route::post('/addstaff', [TeamController::class, 'addstaff']);
    Route::get('/getstaff',[TeamController::class,'getstaff']);
    Route::get('/staffdelete/{id}',[TeamController::class, 'staffdelete']);
    Route::Post('/editstaff',[TeamController::class, 'editstaff']);
    Route::Post('/editteam',[TeamController::class, 'editteam']);
    Route::get('/fetchteam',[TeamController::class,'fetchteam']);
    Route::get('/singleteam/{id}',[TeamController::class,'singleteam']);
    Route::get('/singleteammembers/{id}',[TeamController::class,'singleteammembers']);
    Route::get('/deleteteam/{id}',[TeamController::class,'deleteteam']);
    Route::get('/fetchteammembers',[TeamController::class,'fetchteammembers']);
    Route::Post('/editteammembers',[TeamController::class,'editteammembers']);
    Route::get('/deleteteammembers/{id}',[TeamController::class,'deleteteammembers']);
   


});


/* User Routes */

