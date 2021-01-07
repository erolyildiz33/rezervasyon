<?php

namespace App\Http\Controllers\admin;

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
    public function rezerv()
    {
        return view('admin.rezerv');
    }
}
