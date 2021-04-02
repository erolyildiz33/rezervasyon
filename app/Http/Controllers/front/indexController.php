<?php

namespace App\Http\Controllers\front;

use App\Events\NotificationEvent;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Appointment;
use Illuminate\Support\Carbon;
use App\Events\SendMessage;

class indexController extends Controller
{
    public function index()
    {

        return view('auth.login');
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


        $all = Appointment::all()->where('isActive', 1);
        $simdi = Carbon::now();
        $bugun = Carbon::now()->toDateString();
        foreach ($all as $key => $value) {
            Appointment::where("app_id", $value['app_id'])->update(["isGone" => 2]);
            $dbsaat = Carbon::create($value['time']);



            if ($value['date'] < $bugun) {

                Appointment::where("app_id", $value['app_id'])->update(["color" => 2]);
            } elseif ($value['date'] == $bugun) {

                if ($dbsaat->format('H') == $simdi->format('H')) {

                    if ($dbsaat->format('i') < $simdi->format('i')) {

                        Appointment::where("app_id", $value['app_id'])->update(["color" => 2]);
                        $baslik = "rowupdate";
                        $mesaj = array("rowid" => $value['app_id']);

                        event(new NotificationEvent($baslik, $mesaj));
                    } else {

                        Appointment::where("app_id", $value['app_id'])->update(["color" => 3]);
                    }
                } elseif ($dbsaat->format('H') < $simdi->format('H')) {

                    if ($dbsaat->format('i') < $simdi->format('i')) {

                        Appointment::where("app_id", $value['app_id'])->update(["color" => 2]);
                    } else {

                        Appointment::where("app_id", $value['app_id'])->update(["color" => 3]);
                    }
                } else {
                    Appointment::where("app_id", $value['app_id'])->update(["color" => 3]);
                }
            } else {

                Appointment::where("app_id", $value['app_id'])->update(["color" => 3]);
                // Appointment::where("app_id", $value['app_id'])->update(["isGone" => 0]);
            }
        }
        // dd($time);
        /* foreach ($all as $k=>$v){
           
            Appointment::find($v['id'])->update(['isActive'=>2]);
        }*/
    }
}
