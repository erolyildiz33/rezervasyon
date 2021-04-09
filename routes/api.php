<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['namespace'=>'api'],function (){
   Route::get('/working-hours/{date?}','indexController@getWorkingHours');
   Route::post('/appointment-detail','indexController@appointmentDetail');
   Route::post('/appointment-store','indexController@appointmentStore');
   Route::post('/working-store','indexController@getWorkingStore');
   Route::get('/working-list/{id?}','indexController@getWorkingList');
   Route::post('/table-store','indexController@getTableStore');
   Route::post('/table-delete','indexController@getTableDelete');
   Route::get('/table-list/{id?}','indexController@getTableList');
   Route::get('/table-rapor-list/{id?}','indexController@getRaporTableList');
   
   Route::get('/appointment-table/{date?}','indexController@getAppointmentTable');
   Route::post('/event-store','indexController@getEventStore');
   Route::post('/event-delete','indexController@getEventDelete');
   Route::get('/event-list','indexController@getEventList');
   Route::get('/not-list/{id?}','indexController@getNotList');
   Route::post('/not-store','indexController@getNotStore');
   Route::post('/table-update','indexController@getTableUpdate');
   Route::post('/appointment-update','indexController@getAppointmentUpdate');


   
   

   Route::group(['namespace'=>'admin','prefix'=>'admin'],function (){
       Route::post('/process/{isActive?}/{id?}','indexController@process');
       Route::get('/all/{id?}','indexController@all');
       Route::get('/detail/{id}','indexController@detail');
       Route::post('/detail','indexController@detailStore');
      
      

      


       Route::get('/list','indexController@getList');
       Route::get('/today-list','indexController@getTodayList');
       Route::get('/last-list','indexController@getLastList');
       Route::get('/waiting-list','indexController@getWaitingList');
       Route::get('/cancel-list','indexController@getCancelList');
       Route::get('/appointment-table/{date?}','indexController@getAppointmentTable');
   });

});
