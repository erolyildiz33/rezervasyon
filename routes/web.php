<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use App\Events\NotificationEvent;
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

Route::group(['prefix' => 'cron'], function () {
    Route::get('/reminder', function () {
        Artisan::call('Reminder:Start');
    });
});



Route::get('add-notification', function () {
    broadcast(new \App\Events\NotificationEvent);
    return 'Bildirim Gönderildi.';
});



Route::get('/', 'front\indexController@index')->name("anasayfa");
Route::get('/detail', 'front\indexController@detail')->name('detail');
Route::get('/working', 'front\indexController@deneme')->name('working');
Route::get('/rezervkontrol', 'front\indexController@rezervkontrol')->name('rezervkontrol');
Route::get('/notification/{id}', 'front\indexController@notification')->name('notification');
Route::post('/notification-store', 'front\indexController@getNotificationStore')->name('notification_store');
Route::post('/notification-update', 'front\indexController@getNotificationUpdate')->name('notification-update');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');




Route::group(['namespace' => 'admin', 'prefix' => 'admin', 'as' => 'admin.', 'middleware' => ['auth']], function () {
    Route::get('/', 'indexController@index')->name('index');

    Route::get('/working', 'indexController@working')->name('working');
    Route::get('/table', 'indexController@table')->name('table');
    Route::get('/rezerv/{id}', 'indexController@rezerv')->name('rezerv');
    Route::get('/group/{id}', 'indexController@group')->name('group');
    Route::get('/updaterezerv/{id}', 'indexController@updaterezerv')->name('updaterezerv');
    Route::get('/updategrouprezerv/{id}', 'indexController@updategrouprezerv')->name('updategrouprezerv');
    Route::get('/mesaj', 'indexController@mesaj')->name('mesaj');

    Route::get('/event', 'indexController@event')->name('event');
    Route::get('/durum', 'indexController@durum')->name('durum');

    Route::get('/profile/{id}', 'indexController@profile')->name('profile');
    Route::get('/rapor', 'indexController@rapor')->name('rapor');
   
    Route::get('/widget', 'indexController@widget')->name('widget');
    Route::get('/bugun', 'indexController@bugun')->name('bugun');
    Route::get('/gecmis', 'indexController@gecmis')->name('gecmis');
    Route::get('/geribildirim', 'indexController@geribildirim')->name('geribildirim');

});
