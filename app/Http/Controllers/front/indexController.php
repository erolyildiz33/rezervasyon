<?php

namespace App\Http\Controllers\front;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Appointment;
use Illuminate\Support\Carbon;

class indexController extends Controller
{
    public function index()
    {
       
        return view('front.index');
    }
    public function detail()
    {
        return view('front.detail');
    } 
    public function deneme()
    {
        return view('front.working');
    } 
    public function rezervkontrol()
    {
        $all=Appointment::all()->where('isActive',1)->where('date',Carbon::now()->format('Y-m-d'))->where('isGone',0);
        $onbes=Carbon::now()->addMinutes(15)->toTimeString();
        $simdi=Carbon::now()->toTimeString();
        foreach ($all as $key=>$value){
      
      if($value['time']<=$onbes && $value['time']>=$simdi){
            Appointment::find($value['id'])->update(["isGone"=>1]);

      }
      elseif($value['time']<$simdi){
        Appointment::find($value['id'])->update(["isGone"=>2]);
      }
    }
       // dd($time);
       /* foreach ($all as $k=>$v){
           
            Appointment::find($v['id'])->update(['isActive'=>2]);
        }*/
        
        
       
    }
    
}
