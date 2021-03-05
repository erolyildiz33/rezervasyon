<?php

namespace App\Http\Controllers\admin;

use App\Models\Table;
use App\Models\Appointment;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

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
       
     
        return view('admin.rapor')->with('hepsi', $hepsi);
    }
}
