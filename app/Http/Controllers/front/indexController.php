<?php

namespace App\Http\Controllers\front;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Appointment;

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
  
    
}
