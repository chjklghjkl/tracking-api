<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use App\Models\user;
use Validator;

class UserController extends Controller
{

    /**
     * UserController constructor.
     */
    public function __construct()
    {
        $this->middleware('permission:products-list', ['only' => ['me']]);
        $this->middleware('permission:products-list', ['only' => ['singlefetchuser']]);
        $this->middleware('permission:products-list', ['only' => ['editprofile']]);
    }
    public function roledetails(Request $request ){
        $user = $request->user();
	
        $roles = Role::all();
        $users = User::with('roles')->get();
         $permission = $user->getAllPermissions();
		 
        // Check if user has the role This check will depend on how your roles are set up
        
        return response()->json(['message'=>'roledetails',
        'success'=>'1','role' =>$users,'permission'=>$permission]);
       
    }
   
    public function logout(){
        
        auth()->user()->currentAccessToken()->delete();
        return response([
            'message'=>'successfully log out',
            'success'=>'1',

        ]);

    }
    public function editprofile(Request $request){
        $user = $request->user();
     $users = User::where('id', $request->user()->id)->first();
        
		$user_email=user::where('email',$request->user()->email)->first();

            
     $validator = Validator::make($request->all(), 
        [ 
        
        'name'=>'required',
        'email' => 'required',
        
       ]);  
        if($users){
            $users->id = $request->user()->id;
            $users->name =$request->name;
            $users->email = $request->email;
            $users->save();
        
           return response()->json([
            "status"=>1,
            'message' => "User Updated.",
             ]);
        }
        if ($validator->fails()) {          
            return response()->json(['status'=>0,'message'=>'error','error'=>$validator->errors()], 401);                        
        }  
        else{
            return response()->json([
                "error"=>0,
                'message' => "User id Not Found.",
                 ]); 
        }
    
    
    
    }
    public function singlefetchuser(Request $request,$id)
    {
        $user = $request->user();
        $users = User::where('id',$id)->first();
       if($users){
        return response()->json([
            'success'=>'1',
            'message'=>'sucessfully fetch',
            'result'=> $user
        
           
            
        ]);
    }
    else{
        return response()->json([
            'error'=>'0',
            'message'=>'sucessfully Not fetch',
            
        
           
            
        ]);
    }
    }
    public function me(Request $request)
    {
        $user = $request->user();
       if($user){
        return response()->json([
            'success'=>'1',
            'message'=>'sucessfully fetch',
            'result'=> $user
        
           
            
        ]);
    }
    else{
        return response()->json([
            'error'=>'0',
            'message'=>'sucessfully Not fetch',
            
        
            
            
        ]);
    }
    }

}
