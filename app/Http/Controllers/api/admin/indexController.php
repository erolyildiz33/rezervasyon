<?php

namespace App\Http\Controllers\api\admin;

use App\Models\Appointment;
use App\Models\AppointmentNote;
use App\Models\WorkingHours;
use App\Models\Table;
use App\Models\Log;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Mockery\Matcher\Type;
use Illuminate\Support\Facades\Mail;

class indexController extends Controller
{
  
    public function getAppointmentTable($datee = '')
    {
        // $all = $request->except('csrf_token');
        return Appointment::where('isActive', 1)->where('date', $datee)
        ->where(function ($query) {
        $query->where('title', '!=', null)->where('isUp',  0);})

        
        
       
        ->get('title');
    }

    public function detailStore(Request $request)
    {
        $returnArray = [];
        $all = $request->except('_token');
        $create = AppointmentNote::create([
            'appointmentId' => $all['id'],
            'text' => $all['text']
        ]);
        if ($create) {
            $returnArray['status'] = true;
        } else {
            $returnArray['status'] = false;
        }
        Log::create([
            'user_id' => session()->get('user_id'),
            "tablename" => "AppointmentNote",
            "description" => $create,
            "type" => "create"
        ]);
        return response()->json($returnArray);
    }

    public function detail($id)
    {
        $returnArray = [];
        $data = Appointment::where('id', $id)->get();
        $data[0]['working'] = WorkingHours::getString($data[0]['workingHour']);
        $data[0]['notification'] = ($data[0]['notification_type'] == NOTIFICATION_EMAIL) ? 'Email' : 'Sms';
        $returnArray['data'] = $data[0];
        $returnArray['comment'] = AppointmentNote::where('appointmentId', $id)->orderBy('id', 'desc')->get();
        return response()->json($returnArray);
    }

    public function process(Request $request)
    {

        $type = "";
        if ($request->type) {
            $data["isActive"] = $request->type;
            if ($request->type == 1) {
                $type = "iptal";
                $data['isCame'] = 0;
            } else {
                $type = "gerial";
                echo \json_encode(Appointment::where("app_id", $request->id)->get());
                $kisi = Table::where('id',Appointment::where("app_id", $request->id)->get()[0]->kisi_id)->get()[0];
                $fullname = $kisi->ad . " " . $kisi->soyad;

                $datamail = [
                    'name' => $fullname,
                    'email' => $kisi->email,
                    'status' => 'iptal',

                ];

                try {


                    Mail::send('email', $datamail, function ($message) use ($datamail) {
                        $message->to($datamail['email'], $datamail['name'])->subject('Rezervasyon İptali');
                        $message->from('uygarsarioglu@gmail.com', 'Mersin Roof14 Divan');
                    });
                } catch (\Exception $e) {
                }
            };
        }
        else if ($request->came) {

            $data["isCame"] = $request->came;
            if ($request->came == 0) {
                $type = "Gelmedi";
                $data['color'] = 2;
                $data['isCame'] = 0;
            } elseif ($request->came == 1) {
                if ($request->state == true) {
                    $kisi = Table::where('id',Appointment::where("app_id", $request->id)->get()[0]->kisi_id)->get()[0];
                    $fullname = $kisi->ad . " " . $kisi->soyad;
                  

                    $datamail = [
                        'name' => $fullname,
                        'email' => $kisi->email,
                        'status' => 'update',
                       

                    ];

                    try {


                        Mail::send('email', $datamail, function ($message) use ($datamail) {
                            $message->to($datamail['email'], $datamail['name'])->subject('Rezervasyon Güncelleme');
                            $message->from('uygarsarioglu@gmail.com', 'Mersin Roof14 Divan');
                        });
                    } catch (\Exception $e) {
                    }
                    $type = "Geldi";
                    $data['color'] = 3;
                    $data['isCame'] = 1;
                } else {
                    $type = "Gelmedi";
                    $data['color'] = 2;
                    $data['isCame'] = 0;
                }

            }
            $data['isCame'] = ($request->state == true) ? 1 : 0;
            $data['isSend'] = 0;
            echo $data['isCame'];
        }
        else if($request->kalkan==1){
            $data['isUp']=1;
            Appointment::where('app_id', $request->id)->update($data);
           
            $kisi = Table::where('id',Appointment::where("app_id", $request->id)->get()[0]->kisi_id)->get()[0];
            $fullname = $kisi->ad . " " . $kisi->soyad;
            $appid=$request->id;
            $datamail = [
                'name' => $fullname,
                'email' => $kisi->email,
                'id'=>$appid,
                'status' => 'up',

            ];

            try {


                Mail::send('email', $datamail, function ($message) use ($datamail) {
                    $message->to($datamail['email'], $datamail['name'])->subject('Rezervasyon Güncelleme');
                    $message->from('uygarsarioglu@gmail.com', 'Mersin Roof14 Divan');
                });
            } catch (\Exception $e) {
            }




        }

        $user_name = $request->user_id;

        (Appointment::where('app_id', $request->id)->update($data));
        Log::create([
            'user_name' => $user_name,
            "tablename" => "Appointment",
            "description" => json_encode($data),
            "related_id" => $request->app_id,
            "type" => $type,
        ]);
        //return $this->all();
    }


    public function all($id = null)
    {
        if ($id == null) {

            $returnArray = [];
            /* Waiting */
            $returnArray['waiting'] = DB::table("appointments")->select("appointments.*")
                ->where('title', "bekliyor")
                ->orwhere(function ($query) {
                    $query->where('title', '!=', "bekliyor")
                        ->where('isActive', 0);
                       
                })
                ->paginate(100, ['*'], 'waiting_page');
            foreach ($returnArray['waiting'] as $key => $item) {
                $returnArray['waiting'][$key]->date = Carbon::createFromFormat('Y-m-d', $item->date)->format('d.m.Y l');
                $returnArray['waiting'][$key]->isGone = 1;
                $returnArray['waiting'][$key]->_id = "row" . $item->app_id;
            }
            $returnArray['waiting']->getCollection()->transform(function ($value) {

                return $value;
            });
            /* Cancel */
            $returnArray['cancel'] = DB::table("appointments")->select("tables.notu", "appointments.*")
                ->orwhere(function ($query) {
                    $query->where('title', '!=', "bekliyor")
                        ->where('isActive', 2);
                })
                ->join('tables', 'tables.id', '=', 'appointments.kisi_id')->orderBy('date', 'asc')->paginate(100, ['*'], 'cancel_page');

            /*AppointmentNote*/
            foreach ($returnArray['cancel'] as $key => $item) {
                $returnArray['cancel'][$key]->_id = "row" . $item->app_id;
                $returnArray['cancel'][$key]->date = Carbon::createFromFormat('Y-m-d', $item->date)->format('d.m.Y l');
                $returnArray['cancel'][$key]->_id = "row" . $item->app_id;
            }


            $returnArray['cancel']->getCollection()->transform(function ($value) {

                return $value;
            });
            /* List */
            $returnArray['list'] = DB::table("appointments")->select("tables.notu", "appointments.*")->where('isActive', 1)->join('tables', 'tables.id', '=', 'appointments.kisi_id')->where('date', '>', date("Y-m-d"))->orderBy('time', 'asc')->paginate(100, ['*'], 'list_page');
            foreach ($returnArray['list'] as $key => $item) {
                $returnArray['list'][$key]->date = Carbon::createFromFormat('Y-m-d', $item->date)->format('d.m.Y l');
                $returnArray['list'][$key]->_id = "row" . $item->app_id;
            }

            $returnArray['list']->getCollection()->transform(function ($value) {

                return $value;
            });
            /* Last List */


            $returnArray['last_list'] = DB::table("appointments")->select("tables.notu", "appointments.*")->where('isActive', 1)
                     
                ->where('date', '<', Carbon::now()->toDateString())
                ->orwhere(function ($query) {
                    $query->where('date', Carbon::now()->toDateString())
                        ->where('time', "<=", Carbon::createFromFormat('H:i:s', '02:00:00')->toTimeString());
                }) 
                ->join('tables', 'tables.id', '=', 'appointments.kisi_id')
                ->orderBy('time', 'asc')->paginate(100, ['*'], 'last_page');
            foreach ($returnArray['last_list'] as $key => $item) {
                $returnArray['last_list'][$key]->date = Carbon::createFromFormat('Y-m-d', $item->date)->format('d.m.Y l');
                $returnArray['last_list'][$key]->isGone = 2;
                $returnArray['last_list'][$key]->_id = "row" . $item->app_id;
            }
            $returnArray['last_list']->getCollection()->transform(function ($value) {

                return $value;
            });
            /* Today List */
            $returnArray['today_list'] = DB::table("appointments")->select("tables.notu", "appointments.*")
                ->where('isActive', 1)->where('isUp',0)->join('tables', 'tables.id', '=', 'appointments.kisi_id')
                ->where(function ($query) {
                    $query->where('date', Carbon::now()->toDateString())
                        ->where('time', ">=", Carbon::createFromFormat('H:i:s', '02:00:00')->toTimeString());
                })->orwhere(function ($query) {
                    $query->where('isUp', 1)->where('isCame',1)->where('date', Carbon::now()->toDateString())
                    ->where('time', ">=", Carbon::createFromFormat('H:i:s', '02:00:00')->toTimeString());
                        
                })
                ->orderBy('time', 'asc')->paginate(100, ['*'], 'today_page');
            foreach ($returnArray['today_list'] as $key => $item) {
                $returnArray['today_list'][$key]->date = Carbon::createFromFormat('Y-m-d', $item->date)->format('d.m.Y l');
                $returnArray['today_list'][$key]->_id = "row" . $item->app_id;
                if ($returnArray['today_list'][$key]->time < Carbon::now()) {
                    $returnArray['today_list'][$key]->isGone = 2;
                } else {
                    $returnArray['today_list'][$key]->isGone = 1;
                }
            }
            $returnArray['today_list']->getCollection()->transform(function ($value) {

                return $value;
            });
            return response()->json($returnArray);
        } else {
            return response()->json(Appointment::where('app_id', $id)->get());
        }
    }


    public function getWaitingList()
    {
        $data = Appointment::where('isActive', 0)
            ->orderBy('time', 'asc')->paginate(100);
        $data->getCollection()->transform(function ($value) {

            return $value;
        });
        return response()->json($data);
    }

    public function getCancelList()
    {
        $data = Appointment::where('isActive', 2)->orderBy('time', 'asc')->get();
        $data->getCollection()->transform(function ($value) {

            return $value;
        });
        return response()->json($data);
    }

    public function getList()
    {
        // $data = Appointment::where('isActive',1)->where('date','>',date("Y-m-d"))->orderBy('workingHour','asc')->paginate(9);
        $data = Appointment::where('isActive', 1)->where('date', '>', date("Y-m-d"))->orderBy('time', 'asc');

        $data->getCollection()->transform(function ($value) {

            return $value;
        });
        return response()->json($data['cancel']['data']);
    }

    public function getLastList()
    {
        $data = Appointment::where('date', '<', date("Y-m-d"))->orderBy('time', 'asc')->paginate(100);
        $data->getCollection()->transform(function ($value) {

            return $value;
        });
        return response()->json($data);
    }

    public function getTodayList()
    {
        $data = Appointment::where('isActive', 1)->where('date', date("Y-m-d"))->orderBy('time', 'asc')->paginate(100);
        $data->getCollection()->transform(function ($value) {

            return $value;
        });
        return response()->json($data);
    }
}
