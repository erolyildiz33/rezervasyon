<?php

namespace App\Http\Controllers;

use App\Models\Appointment;
use Carbon\Carbon;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }

     public function rezervkontrol()
    {
        $all=Appointment::where('isActive',1)->where('date',Carbon::now()->format('Y-m-d'))->get();
        foreach ($all as $k=>$v){
           
            Appointment::where("app_id",$v['app_id'])->update(['isActive'=>2]);
        }
        
        
       
    }
 
}
