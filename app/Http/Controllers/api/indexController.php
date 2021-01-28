<?php

namespace App\Http\Controllers\api;

use App\Models\Appointment;
use App\Models\AppointmentNote;
use App\Models\Table;
use App\Models\Event;
use App\Models\User;
use App\Models\WorkingHours;
use Illuminate\Http\Request;

use App\Http\Controllers\Controller;
use App\Models\Not;
use App\Models\Log;
use Illuminate\Support\Facades\Date;
use Illuminate\Support\Carbon;
use function GuzzleHttp\Promise\all;
use Symfony\Component\HttpFoundation\Session\Session;
class indexController extends Controller
{
    public function getWorkingHours($date = '')
    {
        echo  $date;
    }

    public function getAppointmentTable($datee = '')
    {
        // $all = $request->except('csrf_token');
        return  Appointment::where('isActive', 1)->where('date', $datee)->where('title', '!=', null)->get('title');
    }
    public function appointmentStore(Request $request)
    {
      $returnArray = [];
        $returnArray['status'] = false;
        $all = $request->except('csrf_token');

        $mydate = Carbon::createFromFormat('d.m.Y', $all['date'])->format('Y-m-d');

        $all['date'] = $mydate;
        $control = Appointment::where('time', $all['date'])->count();
        if ($control != 0) {
            $returnArray['message'] = "Bu Randevu tarihi doludur.";
            return response()->json($returnArray);
        }
        $all['code'] = substr(md5(uniqid()), 0, 6);
        $all['isActive'] = 1;

        $create = Appointment::create($all);
        if ($create) {
            $returnArray['status'] = true;
            $returnArray['message'] = "Randevunuz Başarı ile Alındı.";
        } else {
            $returnArray['message'] = "Veri Eklenemedi bizimle iletişime geçiniz";
        }
     
        return response()->json($returnArray);
    }
    public function getNotStore(Request $request)
    {
        $all = $request->except('_token');
        $veri = [
            'kisi_id' => $all['kisi_id'],
            'not_icerik' => $all['not_icerik'],
        ];
        $id = Not::create($veri);
        $tumlist = $this->getNotList($all['kisi_id']);
       
        return ($tumlist);
    }
    public function getNotList($id = null)
    {
        $returnArray = array();
        $data = Not::all()->where("kisi_id", $id);
        foreach ($data as $k => $v) {
            array_push($returnArray, array(
                'id' => $v->id,
                'kisi_id' => $v->kisi_id,
                'not_icerik' => $v->not_icerik,

            ));
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
      
        $query=Table::where('id', $all['id'])->delete();
       
    }
    public function getEventDelete(Request $request)
    {
        $all = $request->except('_token');
        $resim = Event::where('id', $all['id'])->get('image');
        $file = public_path('uploads/event/') . DIRECTORY_SEPARATOR . $resim[0]['image'];
        if (file_exists($file)) {
            unlink($file);
        }
        $query=Event::where('id', $all['id'])->delete();
       
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
        $veri = [
            'ad' => $all['ad'],
            'soyad' => $all['soyad'],
            'email' => $all['email'],
            'tel' => $all['tel'],

            'notu' => $all['notu'],
            'iptal' => $all['iptal'],
            'image' => $image,
            'karaliste' => ($all['karaliste'] ? 1 : 0),
            'misafir_id' => ($all['misafir_id'] ? 1 : 0),
            'karaliste_gerekce' => $all['karaliste_gerekce'],






        ];

        if (isset($all['dogumtar'])) {
            $veri['dogumtar'] = Carbon::createFromFormat('d.m.Y', $all['dogumtar'])->format('Y-m-d');
        }
        if (isset($all['evliliktar'])) {
            $veri['evliliktar'] = Carbon::createFromFormat('d.m.Y', $all['evliliktar'])->format('Y-m-d');
        }


        $id = Table::create($veri);
      $getir=Table::orderBy('created_at',"desc")->get();
        echo  json_encode($getir);
    }
    public function getEventStore(Request $request)
    {
        $all = $request->except('_token');

        $datetime = date("Y-m-d h:i:s");
        $timestamp = strtotime($datetime);
        $uri =  substr($all['image'], strpos($all['image'], ",") + 1);
        $filename = md5($timestamp) . ".jpg";
        $pathfile = public_path('uploads/event/') . DIRECTORY_SEPARATOR . $filename;
        file_put_contents($pathfile, base64_decode($uri));
        $image = $filename;
        $veri = [
            'ad' => $all['ad'],
            'tarih' => Carbon::createFromFormat('d.m.Y', $all['tarih'])->format('Y-m-d'),
            'saat' =>  $all['saat'],
            'image' => $image,
        ];
        $veri['id'] = Event::create($veri)->id;
       
        echo  json_encode($veri);
    }

    public function getWorkingList($id = null)
    {

        $returnArray = [];
        if ($id != null) {
            $data = WorkingHours::where('day', $id)->get();
        } else {
            $data = WorkingHours::all();
        }
        foreach ($data as $k => $v) {
            if ($v['day'] == "Pazartesi") {
                $gun = 'monday';
            } elseif ($v['day'] == "Salı") {
                $gun = 'tuesday';
            } elseif ($v['day'] == "Çarşamba") {
                $gun = 'wednesday';
            } elseif ($v['day'] == "Perşembe") {
                $gun = 'thursday';
            } elseif ($v['day'] == "Cuma") {
                $gun = 'friday';
            } elseif ($v['day'] == "Cumartesi") {
                $gun = 'saturday';
            } elseif ($v['day'] == "Pazar") {
                $gun = 'sunday';
            }
            Table::where('id', $v['table_id'])->get('tablename');
            $tb = (Table::where('id', $v['table_id'])->get('tablename')[0]->tablename);
            $table[$tb][] = $v['hours'];

            $returnArray[$gun] = $table;
        }
        $responsecode = 200;

        $header = array(
            'Content-Type' => 'application/json; charset=UTF-8',
            'charset' => 'utf-8'
        );
        return response()->json($returnArray, $responsecode, $header, JSON_UNESCAPED_UNICODE);
    }
    public function getTableUpdate(Request $request)
    {
        $arr = [];
        $all = $request->except('_token');
        $arr = [
             
            'ad' => $all['ad'],
            'soyad' => $all['soyad'],
            'email' => $all['email'],
            'tel' => $all['tel'],
            'notu' => $all['notu'],
            'iptal' => $all['iptal'],
            
            'image' => $all['image'],
            'karaliste' => $all['karaliste'],
            'cinsiyet' => $all['cinsiyet'],
            'misafir_id' => $all['misafir_id'],
        ];
        if ($all['dogumtar']!=""){
            $arr['dogumtar'] =Carbon::createFromFormat('d.m.Y', $all['dogumtar'])->format('Y-m-d');

            
        }
        if ($all['evliliktar']!=""){
$arr['evliliktar'] =Carbon::createFromFormat('d.m.Y', $all['evliliktar'])->format('Y-m-d');
        }
        
        $query=Table::find($all['id'])->update($arr);
       
        return response()->json(Table::all());
    }
    public function getAppointmentUpdate(Request $request)
    {
        $srr = [];
        $tum = $request->except('_token');
        $veritabani=Appointment::find($tum['id']);
        $degisenler=[];
        if ($veritabani->fullName!=$tum['fullName']&&$tum['fullName']!=null) array_push($degisenler,['fullName' => $tum['fullName']]);
        if ($veritabani->phone!=$tum['phone']&&$tum['phone']!=null) array_push($degisenler,['phone' => $tum['phone']]);
        if ($veritabani->email!=$tum['email']&&$tum['email']!=null) array_push($degisenler,['email' => $tum['email']]);
        if ($veritabani->text!=$tum['text']&&$tum['text']!=null) array_push($degisenler,['text' => $tum['text']]);
        if ($veritabani->body!=$tum['body']&&$tum['body']!=null) array_push($degisenler,['body' => $tum['body']]);
        if ($veritabani->date!=Carbon::createFromFormat('d.m.Y', $tum['date'])->format('Y-m-d')&&$tum['date']!=null) array_push($degisenler,['date' => $tum['date']]);
        if ($veritabani->time!=$tum['time']&&$tum['time']!=null) array_push($degisenler,['time' => $tum['time']]);
        if ($veritabani->title!=$tum['title']&&$tum['title']!=null) array_push($degisenler,['title' => $tum['title']]);
        
        $srr = [
            
            'fullName' => $tum['fullName'],
            'phone' => $tum['phone'],
            'email' => $tum['email'],
            'isSend'=>0,
            'text' => $tum['text'],
            'body' => $tum['body'],
        	'degisenler'=>json_encode($degisenler),
           
           'notification_type'=>$tum['notification_type'],
            'bildirim_notu' => $tum['bildirim_notu'],
           
        ];
        if($tum['time']!=null){
             $srr['time'] =Carbon::createFromFormat('H:i:s', $tum['time'])->format('H:i');
        }
        if($tum['date']!=null){
            $srr['date'] =Carbon::createFromFormat('d.m.Y', $tum['date'])->format('Y-m-d');
       }
        if($tum['title']!=null){
            $srr['title'] =$tum['title'];
       }
       
        $query=Appointment::find($tum['id'])->update($srr);
       
        return response()->json(Appointment::all());
    }
    public function getTableList($id = null)
    {
        $returnArray = array();
        if ($id) {
            $data = Table::all()->where('id', $id);
        } else {
            $data = Table::all();
        }

        foreach ($data as $k => $v) {
            array_push($returnArray, array(
                'id' => $v->id,
                'ad' => $v->ad,
                'soyad' => $v->soyad,
                'email' => $v->email,
                'tel' => $v->tel,
                'dogumtar' => $v->dogumtar,
                'evliliktar' => $v->evliliktar,
                'notu' => $v->notu,
                'iptal' => $v->iptal,
                'image' => $v->image,
                'karaliste' => $v->karaliste,
                'cinsiyet' => $v->cinsiyet,
                'misafir_id' => $v->misafir_id,
                'karaliste_gerekce' => $v->karaliste_gerekce,
            ));
        }
        return response()->json($returnArray);
    }
    public function getEventList()
    {
        $returnArray = array();
        $data = Event::all();
        foreach ($data as $k => $v) {
            array_push($returnArray, array(
                'id' => $v->id,
                'ad' => $v->ad,
                'tarih' => $v->tarih,
                'saat' => $v->saat,
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
