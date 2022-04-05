<?php

namespace App\Http\Controllers\Api;
use App\Models\Teams;
use App\Http\Controllers\Controller;
Use App\Models\Department;
Use App\Models\Userteam;
use App\Models\User;
use App\Models\Capture;
Use App\Models\Staff;
Use App\Models\attendance;
use Illuminate\Http\Request;
use Validator;
use Carbon\Carbon;

class TeamController extends Controller
{
    //
    
    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * 
     */
	  function __construct()

    {

        $this->middleware('permission:products-list', ['only' => ['addstaff']]);
        $this->middleware('permission:products-list', ['only' => ['getstaff']]);
        $this->middleware('permission:products-list', ['only' => ['staffdelete']]);
        $this->middleware('permission:products-list', ['only' => ['editstaff']]);
        $this->middleware('permission:products-list', ['only' => ['fetchteam']]);
        $this->middleware('permission:products-list', ['only' => ['fetchteammembers']]);
        $this->middleware('permission:products-list', ['only' => ['editteam']]);
        $this->middleware('permission:products-list', ['only' => ['getcapture']]);
        $this->middleware('permission:products-list', ['only' => ['getdepartment']]);
        $this->middleware('permission:products-list', ['only' => ['deleteteam']]);
        $this->middleware('permission:products-list', ['only' => ['editteammembers']]);
        $this->middleware('permission:products-list', ['only' => ['addattendance']]);
        $this->middleware('permission:products-list', ['only' => ['checkattendance']]);
        $this->middleware('permission:products-list', ['only' => ['deleteattendance']]);
        $this->middleware('permission:products-list', ['only' => ['editattendance']]);
        $this->middleware('permission:products-list', ['only' => ['editcapture']]);
        $this->middleware('permission:products-list', ['only' => ['deletecapture']]);
        $this->middleware('permission:products-list', ['only' => ['adddepartment']]);
        $this->middleware('permission:products-list', ['only' => ['departmentdelete']]);
        $this->middleware('permission:products-list', ['only' => ['addcapture']]);
        $this->middleware('permission:products-list', ['only' => ['editdepartment']]);
        $this->middleware('permission:products-list', ['only' => ['getdepartment']]);
        $this->middleware('permission:products-list', ['only' => ['addteammembers']]);
        $this->middleware('permission:products-list', ['only' => ['singlecapture']]);
        $this->middleware('permission:products-list', ['only' => ['singledepartment']]);
        $this->middleware('permission:products-list', ['only' => ['singlestaff']]);
        $this->middleware('permission:products-list', ['only' => ['singleteam']]);
        $this->middleware('permission:products-list', ['only' => ['singleteammembers']]);
        $this->middleware('permission:products-list', ['only' => ['singleattendance']]);
 
        
       
    
        
        
        

        


    }
    public function checkattendance( Request $request){
        $user = $request->user();
        $data =[];
        if($user->hasRole('user')){
            $attendance = Attendance::with('users')->where('employee_id',$user->id)->first();
            //$no_of_hours = Attendance::whereDate('attendance_date',Carbon::now())
            //->selectRaw('time(sum(TIMEDIFF( in_time,out_time ))) as total')
           // ->get();
           
            
        array_push($data,['attendance'=>$attendance]);
        return response()->json([
            'status'=> 1,
            'message' => "Success",
            'result' => $data,
        ]);

       
         if((isset($attendance))){
                return response()->json([
                    'status'=> 1,
                    'message' => "Success",
                    'result' => $data,
                ]);
               }
               else{
                return response()->json([
                    'status'=> 0,
                    'message' => "No Data found",
                    'error' => $data,
                ]);
               }
            
        }
        else{
            $attendance = Attendance::with('users')->whereDate('attendance_date',Carbon::now())->first();
            $data =[];
           // $no_of_hours = Attendance::whereDate('attendance_date',Carbon::now())
        //->selectRaw('time(sum(TIMEDIFF( in_time,out_time ))) as total')
        //->get();
        array_push($data,['attendance'=>$attendance]);
        
            if((isset($attendance))){
                return response()->json([
                    'status'=> 1,
                    'message' => "Success",
                    
                    
                    'result' => $data,
                    
                ]);
               }
               else{
                return response()->json([
                    'status'=> 0,
                    'message' => "No Data found",
                    'error' => $data,
                ]);
               }
            

        }
    }
    public function singleattendance( Request $request,$id){
        $user = $request->user();
        $data =[];
        if($user->hasRole('user')){
            $attendance = Attendance::where('id',$id)->with('users')->whereDate('attendance_date',Carbon::now())->where('employee_id',$user->id)->get();
            //$no_of_hours = Attendance::whereDate('attendance_date',Carbon::now())
            //->selectRaw('time(sum(TIMEDIFF( in_time,out_time ))) as total')
           // ->get();
           
            
        array_push($data,['attendance'=>$attendance]);
        return response()->json([
            'status'=> 1,
            'message' => "Success",
            'result' => $data,
        ]);

       
         if((isset($attendance))){
                return response()->json([
                    'status'=> 1,
                    'message' => "Success",
                    'result' => $data,
                ]);
               }
               else{
                return response()->json([
                    'status'=> 0,
                    'message' => "No Data found",
                    'error' => $data,
                ]);
               }
            
        }
        else{
            $attendance = Attendance::where('id',$id)->with('users')->get();
            $data =[];
           // $no_of_hours = Attendance::whereDate('attendance_date',Carbon::now())
        //->selectRaw('time(sum(TIMEDIFF( in_time,out_time ))) as total')
        //->get();
        array_push($data,['attendance'=>$attendance]);
        
            if($attendance){
                return response()->json([
                    'status'=> 1,
                    'message' => "Success",
                    
                    
                    'result' => $data,
                    
                ]);
               }
               else{
                return response()->json([
                    'status'=> 0,
                    'message' => "No Data found",
                    'error' => $data,
                ]);
               }
            

        }
    }
    public function deleteattendance($id,Request $request){
      
        $user = $request->user();
        
        $attendance = Attendance::where('id', $id)->first();
        
       if($attendance){
        $attendance->delete();
        return response()->json(['status'=>1,'success'=>'attendance deleted succcessfully']);                        
       }
       else{
        return response()->json(['status'=>0,'message'=>'error','error'=>'attendance  id not found']);                      
       }
    }
    public function addattendance(Request $request){

        if ($request->isMethod('post')) {
        
          
            $user = $request->user();
            if($user->hasRole('admin')){
               
                $validator = Validator::make($request->all(), [ 
                    'employee_id'=> 'required',
                     'in_time'=>'required',
                     'out_time'=>'required'
            
                 ]);  
                
                if ($validator->fails()) {          
                  return response()->json(['status'=>0,'message'=>'error','error'=>$validator->errors()], 401);                        
                }  
            
                
                $existing_user=Attendance::where('employee_id',$request->employee_id)->whereDate('attendance_date', Carbon::today())->first();
    
                if(isset($existing_user)){
                   
                    return response()->json(['status'=>0,'message'=>'error','error'=>'User attandance Already exist']);                        
                }
               
                     
                    $attendance = new Attendance;
                    $attendance->employee_id = $request->employee_id;
                   $attendance->attendance_date = Carbon::now();
                   $attendance->in_time = $request->in_time;
                   $attendance->out_time =$request->out_time;
                   $attendance->save();
                    return response()->json(['status'=>1,'success'=>'Added user attendance']);                        
                }
           
           if($user->hasRole('user')){
               
            $validator = Validator::make($request->all(), [ 
                 'in_time'=>'required',
                 'out_time'=>'required'
        
             ]);  
            
            if ($validator->fails()) {          
              return response()->json(['status'=>0,'message'=>'error','error'=>$validator->errors()], 401);                        
            }  
        
            
            $existing_user=Attendance::where('employee_id',$request->user()->id)->whereDate('attendance_date', Carbon::today())->first();

            if(isset($existing_user)){
               
                return response()->json(['status'=>0,'message'=>'error','error'=>'User attandance Already exist']);                        
            }
           
                 
                $attendance = new Attendance;
                $attendance->employee_id = $request->user()->id;
               $attendance->attendance_date = Carbon::now();
               $attendance->in_time = $request->in_time;
               $attendance->out_time =$request->out_time;
               $attendance->save();
                return response()->json(['status'=>1,'success'=>'Added user attendance']);                        
            }
    }
}
public function editattendance(Request $request){
    

    if ($request->isMethod('post')) {
    
      
        $user = $request->user();
        
          
            $attendance = Attendance::where('id', $request->id)->first();
            if($user->hasRole('admin')){
                $employee_id = $request->employee_id;

            }
            if($user->hasRole('user')){
                $employee_id = $request->user()->id;
                
                
            }
            if($user->hasRole('user')){
               
                $validator = Validator::make($request->all(), [ 
                    'id'=> 'required',
                     'in_time'=>'required',
                     'out_time'=>'required'
                     
            
                 ]); 
                 if ($validator->fails()) {          
                    return response()->json(['status'=>0,'message'=>'error','error'=>$validator->errors()], 401);                        
                  }   
             }
             if($user->hasRole('admin')){
            $validator = Validator::make($request->all(), [ 
                'id'=> 'required',
                'employee_id'=>'required',
                 'in_time'=>'required',
                 'out_time'=>'required'
        
             ]);  
            
            if ($validator->fails()) {          
              return response()->json(['status'=>0,'message'=>'error','error'=>$validator->errors()], 401);                        
            }  
        }
        
            if($attendance){
               
                $attendance->id = $attendance->id;
                $attendance->employee_id = $employee_id;
                $attendance->attendance_date = Carbon::now();
                $attendance->in_time = $request->in_time;
                $attendance->out_time =$request->out_time;
                $attendance->save();
                return response()->json(['status'=>1,'success'=>'Updated user attendance']);                        
            }
        }
    
}  
    public function addstaff(Request $request){

        if ($request->isMethod('post')) {
        
          
            $user = $request->user();

            $validator = Validator::make($request->all(), [ 
        
                 'staff' => 'required',
        
             ]);  
            if ($validator->fails()) {          
              return response()->json(['status'=>0,'message'=>'error','error'=>$validator->errors()], 401);                        
            }  
            
            $staff=Staff::where('staff',$request->staff)->first();

            if(isset($staff)){
               
                return response()->json(['status'=>0,'message'=>'error','error'=>'Staff already exist']);                        
            }
            
           else{
                 
                $staff = new Staff;
                $staff->staff = $request->staff;
               $staff->save();
                return response()->json(['status'=>1,'success'=>'Added Staff']);                        
            }
    }

}
    public function editteammembers(Request $request){
    $user = $request->user();
 $userteams = Userteam::where('id', $request->id)->first();
    
 $validator = Validator::make($request->all(), 
    [ 
    'id'=>'required',
    'team_id'=>'required',
    'user_id' => 'required',
    
   ]);  
    if($userteams){
        $userteams->id = $request->id;
        $userteams->user_id =$request->user_id;
        $userteams->team_id = $request->team_id;
        $userteams->save();
    
       return response()->json([
        "status"=>1,
        'message' => "Teammember Updated.",
         ]);
    }
    if ($validator->fails()) {          
        return response()->json(['status'=>0,'message'=>'error','error'=>$validator->errors()], 401);                        
    }  
    else{
        return response()->json([
            "error"=>0,
            'message' => "Team id Not Found.",
             ]); 
    }



}
public function singlecapture( Request $request, $id){
    $user = $request->user();
        $capture = Capture::where('id',$id)->first();
        if($capture){
        return response()->json([
            'status'=> 1,
            'message' => "Success",
            'result' => $capture,
        ]);
       }
       else{
        return response()->json([
            'status'=> 0,
            'message' => "No Data found",
            'error' => $capture,
        ]);
       }

}
    public function getcapture(Request $request){
        $user = $request->user();
        $capture = Capture::get();
        if($capture){
        return response()->json([
            'status'=> 1,
            'message' => "Success",
            'result' => $capture,
        ]);
       }
       else{
        return response()->json([
            'status'=> 0,
            'message' => "No Data found",
            'error' => $capture,
        ]);
       }
    }
    
    public function fetchteam(Request $request){
        $user = $request->user();
        //dd($user->getAllPermissions());
       // dd($user->getRoleNames());
      // dd($user->can('role-delet'));
        
        $team = Teams:: with('dept')->with('staff')->with('createdby')->get();
        //dd($team);
        $data=[];
        foreach($team as $val){
            $item =[];
            $vals = json_decode(json_decode($val->captchaid,true));
            // return response()->json([
            //     'status'=> 1,
            //     'message' => "Success",
            //     'result' => $vals,
                
            // ]);
            foreach($vals as $capid){
               $vald= $capid;
               $capture =Capture::where('id',$vald)->get();
            foreach($capture as $name){
                $name->name;
               
                $cap = $name->name;
                array_push($item,$cap);
                
            }
               
            }
            array_push($data,['dept'=>$val,'captcha'=>$item]);
          
           
            // $capture =Capture::whereIn('id',$val)->get();
            // foreach($capture as $name){
            //     $name->name;
               
            //     $cap = $name->name;
            //     array_push($item,$cap);
                
            // }
            
            
        }
       
        
        if($data){
        return response()->json([
            'status'=> 1,
            'message' => "Success",
            'result' => $data,
            //'captchaname'=>$item,
        ]);
       }
       else{
        return response()->json([
            'status'=> 0,
            'message' => "No Data found",
            'error' => $team,
        ]);
       }
    }
    public function singleteam(Request $request,$id){
        $user = $request->user();
        //dd($user->getAllPermissions());
       // dd($user->getRoleNames());
      // dd($user->can('role-delet'));
        
        $team = Teams:: where('id',$id)->with('dept')->with('staff')->with('createdby')->get();
        //dd($team);
        $data=[];
        foreach($team as $val){
            $item =[];
            $vals = json_decode(json_decode($val->captchaid,true));
            // return response()->json([
            //     'status'=> 1,
            //     'message' => "Success",
            //     'result' => $vals,
                
            // ]);
            foreach($vals as $capid){
               $vald= $capid;
               $capture =Capture::where('id',$vald)->get();
            foreach($capture as $name){
                $name->name;
               
                $cap = $name->name;
                array_push($item,$cap);
                
            }
               
            }
            array_push($data,['dept'=>$val,'captcha'=>$item]);
          
           
            // $capture =Capture::whereIn('id',$val)->get();
            // foreach($capture as $name){
            //     $name->name;
               
            //     $cap = $name->name;
            //     array_push($item,$cap);
                
            // }
            
            
        }
       
        
        if($data){
        return response()->json([
            'status'=> 1,
            'message' => "Success",
            'result' => $data,
            //'captchaname'=>$item,
        ]);
       }
       else{
        return response()->json([
            'status'=> 0,
            'message' => "No Data found",
            'error' => $team,
        ]);
       }
    }
    public function deleteteam($id,Request $request){
      
        $user = $request->user();
        
        $team = Teams::where('id', $id)->first();
        
       if($team){
        $team->delete();
        return response()->json(['status'=>1,'success'=>'Team deleted succcessfully']);                        
       }
       else{
        return response()->json(['status'=>0,'message'=>'error','error'=>'Team not deleted']);                      
       }
    }
    public function deleteteammembers($id,Request $request){
      
        $user = $request->user();
        
        $userteam = Userteam::where('id', $id)->first();
        
       if($userteam){
        $userteam->delete();
        return response()->json(['status'=>1,'success'=>'Teammember deleted succcessfully']);                        
       }
       else{
        return response()->json(['status'=>0,'message'=>'error','error'=>'Teammember  id not found']);                      
       }
    }
    public function fetchteammembers(Request $request){
        $user = $request->user();
        $team = Userteam:: with('users')->with('teams')->get();
        $alldata=[];
        foreach ($team as $key => $t) {
            if(isset($t->teams->deptid)){
                $dept=Department::where('id',$t->teams->deptid)->first();
            }else{
                $dept=[];
            }
            if(isset($t->teams->staffid)){
                $staff= Staff::where('id',$t->teams->staffid)->first();
            }
            else{
                $staff =[];
            }
            if(isset($t->teams->created_by)){
                $createdat = User::where('id',$t->teams->created_by)->first();

            }
            else{
                $createdat = [];
            }

            $allcaptures=[];
           if(isset($t->teams->captchaid)){
            $captures=json_decode(json_decode($t->teams->captchaid));
            
            foreach ($captures as $key => $value) {
                # code...
                $capture=Capture::where('id',$value)->first();
                array_push($allcaptures,$capture);
            }
        }
            
            array_push($alldata,['team'=>$t,'dept'=>$dept,'captures'=>$allcaptures,'staff'=>$staff,'createdat'=>$createdat]);

            
                # code...
                
        }
        if($alldata){
        return response()->json([
            'status'=> 1,
            'message' => "Success",
            'result' => $alldata,
        ]);
       }
       else{
        return response()->json([
            'status'=> 0,
            'message' => "No Data found",
            'error' => $alldata,
        ]);
       }
    }
    public function singleteammembers(Request $request,$id){
        $user = $request->user();
        $team = Userteam::where('id',$id)->with('users')->with('teams')->get();
        $alldata=[];
        foreach ($team as $key => $t) {
            if(isset($t->teams->deptid)){
                $dept=Department::where('id',$t->teams->deptid)->first();
            }else{
                $dept=[];
            }
            if(isset($t->teams->staffid)){
                $staff= Staff::where('id',$t->teams->staffid)->first();
            }
            else{
                $staff =[];
            }
            if(isset($t->teams->created_by)){
                $createdat = User::where('id',$t->teams->created_by)->first();

            }
            else{
                $createdat = [];
            }

            $allcaptures=[];
           if(isset($t->teams->captchaid)){
            $captures=json_decode(json_decode($t->teams->captchaid));
            
            foreach ($captures as $key => $value) {
                # code...
                $capture=Capture::where('id',$value)->first();
                array_push($allcaptures,$capture);
            }
        }
            
            array_push($alldata,['team'=>$t,'dept'=>$dept,'captures'=>$allcaptures,'staff'=>$staff,'createdat'=>$createdat]);

            
                # code...
                
        }
        if($alldata){
        return response()->json([
            'status'=> 1,
            'message' => "Success",
            'result' => $alldata,
        ]);
       }
       else{
        return response()->json([
            'status'=> 0,
            'message' => "No Data found",
            'error' => $alldata,
        ]);
       }
    }
    public function singlestaff(Request $request,$id){
        $user = $request->user();
        $staff = Staff::where('id',$id)->first();
        if($staff){
        return response()->json([
            'status'=> 1,
            'message' => "Success",
            'result' => $staff,
        ]);
       }
       else{
        return response()->json([
            'status'=> 0,
            'message' => "No Data found",
            'error' => $staff,
        ]);
       }
    }
    public function getstaff(Request $request){
        $user = $request->user();
        $staff = Staff::get();
        if($staff){
        return response()->json([
            'status'=> 1,
            'message' => "Success",
            'result' => $staff,
        ]);
       }
       else{
        return response()->json([
            'status'=> 0,
            'message' => "No Data found",
            'error' => $staff,
        ]);
       }

    }
    public function getdepartment(Request $request){
        $user = $request->user();
        $department = Department::get();
        if($department){
        return response()->json([
            'status'=> 1,
            'message' => "Success",
            'result' => $department,
        ]);
       }
       else{
        return response()->json([
            'status'=> 0,
            'message' => "No Data found",
            'error' => $department,
        ]);
       }
    }
    public function editstaff(Request $request){
        $user = $request->user();
        $staff = staff::where('id', $request->id)->first();
        
        $validator = Validator::make($request->all(), 
        [ 
        'id'=>'required',
        'staff' => 'required',
        
       ]);  
        if($staff){
            $staff->id = $request->id;
            $staff->staff =$request->staff;
            $staff->save();
        
           return response()->json([
            "status"=>1,
            'message' => "Staff Updated.",
             ]);
        }
        if ($validator->fails()) {          
            return response()->json(['status'=>0,'message'=>'error','error'=>$validator->errors()], 401);                        
        }  
        else{
            return response()->json([
                "error"=>0,
                'message' => "Staff id Not Found.",
                 ]); 
        }



    }
    public function editdepartment(Request $request){
        $user = $request->user();
        $department = department::where('id', $request->id)->first();
        
        $validator = Validator::make($request->all(), 
        [ 
        'id'=>'required',
        'department' => 'required',
        
       ]);  
        if($department){
            $department->id = $department->id;
            $department->department =$request->department;
            $department->save();
        
           return response()->json([
            "status"=>1,
            'message' => "Department Updated.",
             ]);
        }
        if ($validator->fails()) {          
            return response()->json(['status'=>0,'message'=>'error','error'=>$validator->errors()], 401);                        
        }  
        else{
            return response()->json([
                "error"=>0,
                'message' => "Department id Not Found.",
                 ]); 
        }



    }
    public function editteam(Request $request){
        $user = $request->user();
        $team = teams::where('id', $request->id)->first();
        
        $validator = Validator::make($request->all(), 
        [ 
        'id'=>'required',
        'phoneno' => 'required',
        'captchaid'=> 'required',
        'deptid'=>'required',
        'teamname'=>'required',
        'staffid'=>'required'
        
       ]);  
        if($team){
            $team->id = $request->id;
            $team->created_by = $user->id;
            $team->phoneno=$request->phoneno;
            $team->captchaid = json_encode($request->captchaid);
            $team->deptid = $request->deptid;
            $team->teamname = $request->teamname;
            $team->staffid = $request->staffid;
            $team->save();
        
           return response()->json([
            "status"=>1,
            'message' => "Teammember Updated.",
             ]);
        }
        if ($validator->fails()) {          
            return response()->json(['status'=>0,'message'=>'error','error'=>$validator->errors()], 401);                        
        }  
        else{
            return response()->json([
                "error"=>0,
                'message' => "Team id Not Found.",
                 ]); 
        }



    }
    public function adddepartment(Request $request){

        if ($request->isMethod('post')) {
        
          
            $user = $request->user();

            $validator = Validator::make($request->all(), [ 
        
                 'department' => 'required',
        
             ]);  
            if ($validator->fails()) {          
              return response()->json(['status'=>0,'message'=>'error','error'=>$validator->errors()], 401);                        
            }  
            
            $department=Department::where('department',$request->department)->first();

            if(isset($department)){
               
                return response()->json(['status'=>0,'message'=>'error','error'=>'Department already exist']);                        
            }
            
           else{
                 
                $department = new Department;
                $department->department = $request->department;
               $department->save();
                return response()->json(['status'=>1,'success'=>'Added Department']);                        
            }
    }
}
    public function deletecapture($id,Request $request){
      
        $user = $request->user();
        
        $capture = Capture::where('id', $id)->first();
        
       if($capture){
        $capture->delete();
        return response()->json(['status'=>1,'success'=>'capture deleted succcessfully']);                        
       }
       else{
        return response()->json(['status'=>0,'message'=>'error','error'=>'capture not deleted']);                      
       }
    }
    
    public function departmentdelete($id,Request $request){
        $user = $request->user();
        
        $department = Department::where('id', $id)->first();
        
       if($department){
        $department->delete();
        return response()->json(['status'=>1,'success'=>'Department deleted succcessfully']);                        
       }
       else{
        return response()->json(['status'=>0,'message'=>'error','error'=>'Department not deleted']);                      
       }


    }
    public function singledepartment( Request $request, $id){
        $user = $request->user();
            $department = Department::where('id',$id)->first();
            
            if($department){
            return response()->json([
                'status'=> 1,
                'message' => "Success",
                'result' => $department,
            ]);
           }
           else{
            return response()->json([
                'status'=> 0,
                'message' => "No Data found",
                'error' => $department,
            ]);
           }
    
    }
    public function staffdelete($id,Request $request){
        $user = $request->user();
        $staff = Staff::where('id', $id)->first();
       if($staff){
        $staff->delete();
        return response()->json(['status'=>1,'success'=>'Staff deleted succcessfully']);                        
       }
       else{
        return response()->json(['status'=>0,'message'=>'error','error'=>'Staff not deleted']);                      
       }
        
       
    }
    public function editcapture(Request $request){
        $user = $request->user();
        $capture = Capture::where('id', $request->id)->first();
        
        $validator = Validator::make($request->all(), 
        [ 
        'id'=>'required',
        'name' => 'required',
        
       ]);  
        if($capture){
            $capture->id = $request->id;
            $capture->name =$request->name;
            $capture->save();
        
           return response()->json([
            "status"=>1,
            'message' => "Capture Updated.",
             ]);
        }
        if ($validator->fails()) {          
            return response()->json(['status'=>0,'message'=>'error','error'=>$validator->errors()], 401);                        
        }  
        else{
            return response()->json([
                "error"=>0,
                'message' => "Capture id Not Found.",
                 ]); 
        }



    }
    public function addcapture(Request $request){
        if ($request->isMethod('post')) {
        
            $user = $request->user();
            $validator = Validator::make($request->all(), 
            [ 
            'name' => 'required',
            
           ]);  
            
           if ($validator->fails()) {          
            return response()->json(['status'=>0,'message'=>'error','error'=>$validator->errors()], 401);                        
         }  
           
            
            $capture=Capture::where('name',$request->name)->first();

            if(isset($capture)){
                return response()->json(['status'=>0,'message'=>'error','error'=>"capture Already Added"], 401);                        
                
            }
            
           else{
                 
                $capture = new Capture;
                
                
                $capture->name = $request->name;
               
				
                $capture->save();
				return response()->json([
                    "status"=>1,
                    'message' => "Capture Added.",
                ]);
            }
        }
    }
    
     public function addteammembers(Request $request){
        
        $user = $request->user();
        $validator = Validator::make($request->all(), 
        [ 
        'team_id' => 'required',
        'user_id' => 'required',
       ]);  
       $userteam = Userteam::where('team_id',$request->team_id)->first();
       if($userteam){
        return response()->json([
            "status"=>'0',
            'message'=>'error',
            'error' => "Teamid Already add.",
        ]);
       }

    if ($validator->fails()) {          
       return response()->json(['status'=>0,'message'=>'error','error'=>$validator->errors()], 401);                        
    }  
        Userteam::create([
            'team_id'=>$request->team_id,
            
            'user_id'=>$request->user_id,
            
        ]);
        return response()->json([
            "status"=>1,
            'message' => "Teammember Added.",
        ]);
     }
    public function addteam(Request $request)
    {
        //dd($request->All());
        $user = $request->user();
        $validator = Validator::make($request->all(), 
        [ 
        
        'phoneno' => 'required',
        'captchaid'=> 'required',
        'deptid'=>'required',
        'teamname'=>'required',
        'staffid'=>'required'
       ]);  
       if ($validator->fails()) {          
        return response()->json(['status'=>0,'message'=>'error','error'=>$validator->errors()]);                        
     }  
        //dd($user);
        $existing_team = Teams::where('teamname',$request->teamname)->first();
        
        if($existing_team)
        {
            return response()->json([
                "status"=>'0',
                'message'=>'error',
                'message' => "Team Already add.",
            ]);
        }
        if($request->phoneno){
        Teams::create([
            'created_by' => $user->id,
            'phoneno'=>$request->phoneno,
            'captchaid' => json_encode($request->captchaid),
            'deptid' => $request->deptid,
            'teamname' => $request->teamname,
            'staffid'=>$request->staffid,

        ]);

        return response()->json([
            'status'=>1,
            'message' => "Team Added.",
        ]);
    }
        if(!$user){ 
            return response()->json(['error'=>'Unauthorised','status'=>'0'], 401); 
        } 
    }

}
