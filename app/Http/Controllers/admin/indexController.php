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
    public function rezerv($id=null)
    {
        $kullanici=Table::where('id',$id)->get();
      
        return view('admin.form')->with('kullanici',$kullanici);
    }
    public function event()
    {
        return view('admin.event');
    }
    public function profile($id)
    {
        
        $user=Table::where('id',$id)->get();
      
        return view('admin.profile')->with('user', $user[0]);
    }
}
