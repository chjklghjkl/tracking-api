<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Timesheet;
use Carbon\Carbon;
use Illuminate\Http\Request;

class TimesheetController extends Controller
{


    /**
     * TimesheetController constructor.
     */
    public function __construct()
    {
        $this->middleware('permission:products-list', ['only' => ['startTracking']]);
        $this->middleware('permission:products-list', ['only' => ['endTracking']]);
        $this->middleware('permission:products-list', ['only' => ['getTimeSheet']]);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    
    public function startTracking(Request $request)
    {
        //dd($request->All());
        $user = $request->user();
        //dd($user);
        $existing_user_timesheet = Timesheet::where('user_id',$user->id)->whereDate('start', Carbon::today())->whereNull('end')->exists();
        
        if($existing_user_timesheet)
        {
            return response()->json([
                'error'=>0,
                'message' => "Tracking already started.",
            ]);
        }

        Timesheet::create([
            'user_id' => $user->id,
            'start' => Carbon::now(),
            'start_ip_address' => $request->ip(),
            'start_user_agent' => $request->userAgent()
        ]);

        return response()->json([
            'success'=>'1',
            'message' => "Tracking started.",
        ]);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function endTracking(Request $request)
    {
        $user = $request->user();
        $existing_user_timesheet = Timesheet::where('user_id',$user->id)->whereDate('start', Carbon::today())->whereNull('end')->first();
        if(!$existing_user_timesheet)
        {
            return response()->json([
                'error'=>0,
                'message' => "No active tracking.",
            ]);
        }

        $existing_user_timesheet->update([
            'end' => Carbon::now(),
            'end_ip_address' => $request->ip(),
            'end_user_agent' => $request->userAgent()
        ]);

        return response()->json([
            'success'=>'1',
            'message' => "Tracking stopped.",
        ]);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function getTimeSheet(Request $request)
    {
        $user = $request->user();
        $range = $request->get('range', 'day');
        

        if(strtolower($range) == "month")
        {
            $dateS = Carbon::now()->startOfMonth();
            $dateE = Carbon::now()->toDate();

            $user_timesheets = Timesheet::where('user_id',$user->id)->whereBetween('start', [$dateS, $dateE])->select(['start','end'])->get()->toArray();
        }
        elseif(strtolower($range) == "week")
        {
            $dateS = Carbon::now()->startOfWeek();
            $dateE = Carbon::now()->toDate();

            $user_timesheets = Timesheet::where('user_id',$user->id)->whereBetween('start', [$dateS, $dateE])->select(['start','end'])->get()->toArray();
        }
        else
        {
            $user_timesheets = Timesheet::where('user_id',$user->id)->whereDate('start', Carbon::today())->select(['start','end'])->get()->toArray();
        }

        return response()->json([
            'status'=>'1',
            'message' => "Success",
            'data' => $user_timesheets
        ]);

    }
}
