<?php

namespace App\Http\Controllers\api;

use App\Models\Appointment;
use App\Models\AppointmentNote;
use App\Models\Table;
use App\Models\WorkingHours;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use function GuzzleHttp\Promise\all;

class indexController extends Controller
{
    public function getWorkingHours($date = '')
    {
        $date = ($date == '') ? date("Y-m-d") : $date;
        $day = date("l", strtotime($date));
        $returnArray = [];
        $hours = WorkingHours::where('day', $day)->get();
        foreach ($hours as $k => $v) {
            $control = Appointment::where('date', $date)
                ->where('workingHour', $v['id'])
                ->where(function ($control) {
                    $control->orWhere('isActive', APPOINTMENT_DEFAULT);
                    $control->orWhere('isActive', APPOINTMENT_SUCCESS);
                })
                ->count();
            // 11.00 - 12.00
            //   0    -   1
            $exp = explode('-', $v['hours']);
            $suanZaman = date('H.i');
            $suanTarih = date('Y-m-d');
            if ($control == 0) {
                if ($suanZaman > $exp[0] and $suanTarih == $date)
                    $v['isActive'] = false;
                else
                    $v['isActive'] = true;
            } else {
                $v['isActive'] = false;
            }
            $returnArray[] = $v;
        }
        return response()->json($returnArray);
    }


    public function appointmentStore(Request $request)
    {
        $returnArray = [];
        $returnArray['status'] = false;
        $all = $request->except('_token');
        $mydate=date('Y-m-d',strtotime($all['date']));
       
       $all['date']=$mydate;
        $control = Appointment::where('date', $all['date'])->count();
        if ($control != 0) {
            $returnArray['message'] = "Bu Randevu tarihi doludur.";
            return response()->json($returnArray);
        }
        $all['code'] = substr(md5(uniqid()), 0, 6);
        $create = Appointment::create($all);
        if ($create) {
            $returnArray['status'] = true;
            $returnArray['message'] = "Randevunuz Başarı ile Alındı.";
        } else {
            $returnArray['message'] = "Veri Eklenemedi bizimle iletişime geçiniz";
        }
        return response()->json($returnArray);
    }

    public function getWorkingStore(Request $request)
    {
        $all = $request->except('_token');

        foreach ($all['masalar'] as $k => $v) {

            if (!WorkingHours::where('day', $all['day'])->where('hours', $all['time'])->where('table_id', $v)->count() > 0) {
                WorkingHours::create([
                    'day' => $all['day'],
                    'hours' => $all['time'],
                    'table_id' => $v,
                ]);
            }
        }
    }

    public function getTableDelete(Request $request)
    {
        $all = $request->except('_token');
        $resim = Table::where('id', $all['id'])->get('image');
        $file = public_path('uploads') . DIRECTORY_SEPARATOR . $resim[0]['image'];
        if (file_exists($file)) {
            unlink($file);
        }
        Table::where('id', $all['id'])->delete();
    }

    public function getTableStore(Request $request)
    {
        $all = $request->except('_token');
        $datetime = date("Y-m-d h:i:s");
        $timestamp = strtotime($datetime);
        $uri =  substr($all['image'], strpos($all['image'], ",") + 1);
        $filename = md5($timestamp) . ".jpg";
        $pathfile = public_path('uploads') . DIRECTORY_SEPARATOR . $filename;
        file_put_contents($pathfile, base64_decode($uri));
        $image = $filename;
        $id = Table::create([
            'tablename' => $all['tablename'],
            'price' => $all['price'],
            'person' => $all['person'],
            'map' => $all['map'],
            'image' => $image,
        ]);
        echo  $id;
    }

    public function getWorkingList($id=null)
    {

        $returnArray = [];
        if($id!=null)
        {$data = WorkingHours::where('day', $id)->get();}
        else{
            $data=WorkingHours::all();
        }
        foreach ($data as $k => $v) {
            if($v['day']=="Pazartesi")
            {
                $gun='monday';
            }
            elseif($v['day']=="Salı")
            {
                $gun='tuesday';
            }
            elseif($v['day']=="Çarşamba")
            {
                $gun='wednesday';
            }
            elseif($v['day']=="Perşembe")
            {
                $gun='thursday';
            }
            elseif($v['day']=="Cuma")
            {
                $gun='friday';
            }
            elseif($v['day']=="Cumartesi")
            {
                $gun='saturday';
            }
            elseif($v['day']=="Pazar")
            {
                $gun='sunday';
            }
            Table::where('id',$v['table_id'])->get('tablename');
            $tb=(Table::where('id',$v['table_id'])->get('tablename')[0]->tablename);
            $table[$tb][] = $v['hours'];

            $returnArray[$gun] = $table;

        }
        $responsecode = 200;

        $header = array (
                'Content-Type' => 'application/json; charset=UTF-8',
                'charset' => 'utf-8'
            );
        return response()->json($returnArray, $responsecode, $header,JSON_UNESCAPED_UNICODE);
    }

    public function getTableList()
    {
        $returnArray = array();
        $data = Table::all();
        foreach ($data as $k => $v) {
            array_push($returnArray, array(
                'id' => $v->id,
                'tablename' => $v->tablename,
                'price' => $v->price,
                'map' => $v->map,
                'person' => $v->person,
                'image' => $v->image,
            ));
        }

        return response()->json($returnArray);
    }

    public function appointmentDetail(Request $request)
    {
        $returnArray = [];
        $returnArray['status'] = false;
        $all = $request->except('_token');
        $c = Appointment::where('code', $all['code'])->count();
        if ($all['code'] == "") {
            $returnArray['message'] = "Lütfen kodu boş bırakmayınız";
            return response()->json($returnArray);
        }


        if ($c == 0) {
            $returnArray['message'] = "Bu Kodla eşleşen randevu bulunmadı !";
            return response()->json($returnArray);
        }

        $info = Appointment::where('code', $all['code'])->get();
        $info[0]['working'] = WorkingHours::getString($info[0]['workingHour']);
        $info[0]['notification'] = ($info[0]['notification_type'] == NOTIFICATION_EMAIL) ? 'Email' : 'Sms';
        $returnArray['status'] = true;
        $returnArray['info'] = $info[0];
        $returnArray['note'] = AppointmentNote::where('appointmentId', $info[0]['id'])->orderBy('id', 'desc')->get();
        return response()->json($returnArray);
    }
}
