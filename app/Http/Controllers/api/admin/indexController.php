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

class indexController extends Controller
{
    public function getAppointmentTable($datee = '')
    {
        // $all = $request->except('csrf_token');
        return  Appointment::where('isActive', 1)->where('date', $datee)->where('title', '!=', null)->get('title');
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
            if ($request->type = 1) $type = "iptal";
            else $type = "gerial";
        }
        if ($request->gone) {
            $data["isGone"] = $request->gone;
            if ($request->gone = 1) $type = "Geldi";
            else $type = "Gelmedi";
        }
        $data['isSend'] = 0;
        $user_name = $request->user_id;
        Appointment::where('app_id', $request->id)->update($data);
        Log::create([
            'user_name' => $user_name,
            "tablename" => "Appointment",
            "description" => json_encode($data),
            "related_id" => $request->app_id,
            "type" => $type,
        ]);
        return $this->all();
    }


    public function all($id = null)
    {
        if ($id == null) {

            $returnArray = [];
            /* Waiting */
            $returnArray['waiting'] = DB::table("appointments")->select("tables.notu", "appointments.*")->where('isActive', 0)->join('tables', 'tables.id', '=', 'appointments.kisi_id')->orderBy('date', 'asc')->paginate(100, ['*'], 'waiting_page');
            $returnArray['waiting']->getCollection()->transform(function ($value) {

                return $value;
            });
            /* Cancel */
            $returnArray['cancel'] = DB::table("appointments")->select("tables.notu", "appointments.*")->where('isActive', 2)->join('tables', 'tables.id', '=', 'appointments.kisi_id')->orderBy('date', 'asc')->paginate(100, ['*'], 'cancel_page');
            $returnArray['cancel']->getCollection()->transform(function ($value) {

                return $value;
            });
            /* List */
            $returnArray['list'] = DB::table("appointments")->select("tables.notu", "appointments.*")->where('isActive', 1)->join('tables', 'tables.id', '=', 'appointments.kisi_id')->where('date', '>', date("Y-m-d"))->orderBy('time', 'asc')->paginate(100, ['*'], 'list_page');
            $returnArray['list']->getCollection()->transform(function ($value) {

                return $value;
            });
            /* Last List */
            $returnArray['last_list'] = DB::table("appointments")->select("tables.notu", "appointments.*")->where('date', '<', date("Y-m-d"))->join('tables', 'tables.id', '=', 'appointments.kisi_id')->orderBy('time', 'asc')->paginate(100, ['*'], 'last_page');
            $returnArray['last_list']->getCollection()->transform(function ($value) {

                return $value;
            });
            /* Today List */
            $returnArray['today_list'] = DB::table("appointments")->select("tables.notu", "appointments.*")->where('isActive', 1)->join('tables', 'tables.id', '=', 'appointments.kisi_id')->where('date', date("Y-m-d"))->orderBy('time', 'asc')->paginate(100, ['*'], 'today_page');
            $returnArray['today_list']->getCollection()->transform(function ($value) {

                return $value;
            });
            return response()->json($returnArray);
        } else {
            return  response()->json(Appointment::where('app_id', $id)->get());
        }
    }


    public function getWaitingList()
    {
        $data = Appointment::where('isActive', 0)->orderBy('time', 'asc')->paginate(100);
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
