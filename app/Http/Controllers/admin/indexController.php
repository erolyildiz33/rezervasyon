<?php

namespace App\Http\Controllers\admin;

use App\Models\Table;
use App\Models\Appointment;
use Illuminate\Support\Facades\DB;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Support\Carbon as SupportCarbon;

class indexController extends Controller
{
    public function index()
    {
      

        return view('admin.index');
    }
   
    public function working()
    {
        return view('admin.working');
    }
    public function table()
    {
        return view('admin.table');
    }
    public function rezerv($id = null)
    {
        $kullanici = Table::where('id', $id)->get();

        return view('admin.form')->with('kullanici', $kullanici);
    }
    public function group($id = null)
    {

        $kullanici = Table::where('id', $id)->get();

        return view('admin.group')->with('kullanici', $kullanici);
    }
    public function updaterezerv($id = null)
    {
        $kullanici = Appointment::where('app_id', $id)->get();

        return view('admin.updaterezerv')->with('kullanici', $kullanici);
    }
    public function updategrouprezerv($id = null)
    {
        $kullanici = Appointment::where('app_id', $id)->get();

        return view('admin.updategroup')->with('kullanici', $kullanici);
    }
    public function event()
    {
        return view('admin.event');
    }
    public function durum()
    {
        return view('admin.durum');
    }
    public function profile($id)
    {

        $user = Table::where('id', $id)->get();

        return view('admin.profile')->with('user', $user[0]);
    }
    public function widget()
    {
        return view('admin.widget');
    }
    public function mesaj()
    {
        return view('admin.mesaj');
    }
    public function bugun()
    {
        $bugunrapor = DB::table("appointments")->select("tables.*", "appointments.*")
       ->join('tables', 'tables.id', '=', 'appointments.kisi_id')
        ->where('date', Carbon::now()->toDateString())
               
     
        ->orderBy('time', 'asc')->get();
    
        foreach ($bugunrapor as $key=>$item) {
        
            Carbon::setLocale('tr_TR');
            $bugunrapor[$key]->date = Carbon::createFromFormat('Y-m-d',$item->date)->format('d.m.Y l');
          
          
       };
    $bugun=json_encode($bugunrapor);


             return view('admin.bugun')->with('bugun',$bugun);
    }
    public function gecmis()
    {
        $gecmisrapor = DB::table("appointments")->select("tables.*", "appointments.*")
       ->join('tables', 'tables.id', '=', 'appointments.kisi_id')
        ->where('date','<', Carbon::now()->toDateString())
               
     
        ->orderBy('time', 'asc')->get();
    
        foreach ($gecmisrapor as $key=>$item) {
        
            Carbon::setLocale('tr_TR');
            $gecmisrapor[$key]->date = Carbon::createFromFormat('Y-m-d',$item->date)->format('d.m.Y l');
          
          
       };
    $gecmis=json_encode($gecmisrapor);


             return view('admin.gecmis')->with('gecmis',$gecmis);
    }
    public function geribildirim()
    {
        $gerirapor = DB::table("appointments")->select("tables.*", "appointments.*","notifications.*")
       ->join('tables', 'tables.id', '=', 'appointments.kisi_id')->join('notifications', 'notifications.app_id', '=', 'appointments.app_id')
       ->where('notifications.status','!=',2)
               
     
        ->orderBy('not_created_at', 'desc')->get();
    
        foreach ($gerirapor as $key=>$item) {
        
            Carbon::setLocale('tr_TR');
            $gerirapor[$key]->date = Carbon::createFromFormat('Y-m-d',$item->date)->format('d.m.Y l');
          
          
       };
    $geri=json_encode($gerirapor);


             return view('admin.geribildirim')->with('geri',$geri);
    }
    public function rapor()
    {   
        $hepsi = Appointment::join('tables', 'appointments.kisi_id', '=', 'tables.id')
            ->get(['appointments.*', 'tables.*']);

         
                foreach ($hepsi as $key=>$item) {
                if ($item["cinsiyet"] == 0)   $hepsi[$key]["cinsiyet"] = "Erkek";
                else   $hepsi[$key]["cinsiyet"] = "Kadın";
                
            };


            
            foreach ($hepsi as $key=>$item) {
               
                if ($item["misafir_id"] == 0)  $hepsi[$key]["misafir_id"] = "Otel";
                else   $hepsi[$key]["misafir_id"] = "Yerel";
               
            };
           
       
            foreach ($hepsi as $key=>$item) {
               
                if ($item["karaliste"] == 0)   $hepsi[$key]["karaliste"] = "Hayır";
                else   $hepsi[$key]["karaliste"] = "Evet";
            };
      
            foreach ($hepsi as $key=>$item) {
                Carbon::setLocale('tr_TR');
                $hepsi[$key]["date"] = Carbon::createFromFormat('Y-m-d',$item['date'])->format('d.m.Y l');
              
              
           };
        return view('admin.rapor')->with('hepsi', $hepsi);
    }
}
