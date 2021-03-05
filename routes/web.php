<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
use Illuminate\Support\Facades\Artisan;
Route::group(['prefix'=>'cron'],function (){
    Route::get('/reminder',function (){
        Artisan::call('Reminder:Start');
    });
});





Route::get('/', 'front\indexController@index')->name("anasayfa");
Route::get('/detail', 'front\indexController@detail')->name('detail');
Route::get('/working', 'front\indexController@deneme')->name('working');
Route::get('/rezervkontrol', 'front\indexController@rezervkontrol')->name('rezervkontrol');



Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');




Route::group(['namespace'=>'admin','prefix'=>'admin','as'=>'admin.','middleware'=>['auth']],function (){
    Route::get('/','indexController@index')->name('index');
    Route::get('/working','indexController@working')->name('working');
    Route::get('/table','indexController@table')->name('table');
    Route::get('/rezerv/{id}','indexController@rezerv')->name('rezerv');
    Route::get('/group/{id}','indexController@group')->name('group');
    Route::get('/updaterezerv/{id}','indexController@updaterezerv')->name('updaterezerv');

    Route::get('/event','indexController@event')->name('event');
    Route::get('/durum','indexController@durum')->name('durum');

    Route::get('/profile/{id}','indexController@profile')->name('profile');



});
