<?php

namespace App\Http\Controllers\front;

use App\Events\NotificationEvent;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Appointment;
use Illuminate\Support\Carbon;
use App\Events\SendMessage;
use App\Models\Log;
use App\Models\Notification;
use DateTime;
use Illuminate\Notifications\Notification as NotificationsNotification;

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
    public function notification($id)
    {

        return view('front.notification')->with('id', $id);
    }
    public function getNotificationStore(Request $request)
    {
        $all = $request->except('_token');
        $rez = Appointment::where('app_id', $all['app_id'])->get();
        if ($rez) {
            $veri = [
                'app_id' => $rez[0]->app_id,
                'not_text' => $all['text'],
                'rate' => $all['rate'],
            ];
            Notification::insert($veri);
            // event(new NotificationEvent("bildirim",1));
        }
    }
    public function getNotificationUpdate(Request $request)
    {
        $arr = [];
        $user_name = $request->user_id;
        $all = $request->except('_token', 'user_id');

        $tarih = date("Y-m-d H:i:s");
        $arr = [

         
            'status' => $all['status'],
            'read_at' => $tarih,

        ];




        Notification::where('not_id', $all['id'])->update($arr);
        Log::create([
            'user_name' => $user_name,
            "tablename" => "Notification",
            "description" => json_encode($arr),
            "related_id" => $all['id'],
            "type" => "update"
        ]);

        return response()->json(Notification::all());
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
                        if($value['isUp']==0 && $value['isCame']==0)
                        {
                        $baslik = "rowupdate";
                        $mesaj = array("rowid" => $value['app_id']);

                        event(new NotificationEvent($baslik, $mesaj));}
                    } else {

                        Appointment::where("app_id", $value['app_id'])->update(["color" => 3]);
                    }
                } elseif ($dbsaat->format('H') < $simdi->format('H')) {

                    if ($dbsaat->format('i') < $simdi->format('i')) {
                       
                        Appointment::where("app_id", $value['app_id'])->update(["color" => 2]);
                    } else {

                        Appointment::where("app_id", $value['app_id'])->update(["color" => 3]);
                    }
                    if($value['isUp']==0 && $value['isCame']==0)
                   { $baslik = "rowupdate";
                    $mesaj = array("rowid" => $value['app_id']);

                    event(new NotificationEvent($baslik, $mesaj));}
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
