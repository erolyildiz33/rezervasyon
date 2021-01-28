<?php

namespace App\Console\Commands;

use App\Models\Appointment;
use App\Models\WorkingHours;
use Illuminate\Console\Command;
use App\Mail\MailNotification;
use Illuminate\Support\Facades\Mail;
use Illuminate\Contracts\Mail\Mailer;
use SebastianBergmann\Environment\Console;

class ReminderTask extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'Reminder:Start';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $date = date("Y-m-d");
        $nextDate = date("Y-m-d", strtotime("+1 Day", time()));

        $list = Appointment::where('date', '>=', date('Y-m-d'))
            // ->where('isActive',APPOINTMENT_SUCCESS)
            ->where('isSend', REMINDER_DEFAULT)
            ->get();

        foreach ($list as $k => $v) {
            if ($v['notification_type'] == NOTIFICATION_EMAIL) {
                $degisenStr = "";
if(isset($v['degisenler'])){
                foreach (json_decode($v['degisenler']) as $k => $value) {
                  
                    foreach ($value as $key => $valu) {
                        $remind=null;
                        switch ($key) {
                            case 'fullName':
                                $remind= "Adı Soyadı";
                                break;
                            case 'email':
                                $remind= "E-Posta";
                                break;
                            case 'date':
                                $remind= "Tarih";
                                break;
                            case 'time':
                               
                                $remind= "Saat";
                                break;
                          
                            case 'body':
                                $remind= "Kişi";
                                break;
                        }
                        $degisenStr .= strval(strval($remind) . "=" . strval($valu) . ", ");
                    }
                }

                //$data['degisenler'] =  "Değişen alanlar: " . substr($degisenStr, 0, -2);
}
                $data  = [
                    'name' => $v['fullName'],
                    'email' => $v['email'],
                    'date' => $v['date'],
                    'time' => $v['time'],
                    'code' => $v['code'],
                    'title' => $v['title'],
                    'body' => $v['body'],
                ];

                try {
                    Mail::send('email', $data, function ($message) use ($data) {
                        $message->to($data['email'], $data['name'])->subject('Rezervasyon Hatırlatma');
                        $message->from('uygarsarioglu@gmail.com', 'Mersin Roof14 Divan');
                    });
                    Appointment::where('id', $v['id'])->update(['isSend' => REMINDER_SUCCESS, 'degisenler' => null]);
                } catch (\Exception $e) {

                    Appointment::where('id', $v['id'])->update(['isSend' => REMINDER_FAILED]);
                }
            }
            if ($v['notification_type'] == NOTIFICATION_SMS) {
                $username = '05552846584';
                $password = 'gy741852';
                $origin_name = 'muratyener';
                $message = 'Merhaba ' . $v['fullName'] . ' , Randevunuz ' . $v['date'] . ' tarihinde ' . WorkingHours::getString($v['workingHour']) . '  saatleri arasındadır.Takip Kod:' . $v['code'];
                $number = str_replace('-', '', $v['phone']);

                $xml = '<request>
                         <authentication>
                             <username>' . $username . '</username>
                             <password>' . $password . '</password>
                         </authentication>
                         <order>
                             <sender>' . $origin_name . '</sender>
                             <sendDateTime>' . date("d/m/Y H:i") . '</sendDateTime>
                             <message>
                                 <text>' . $message . '</text>
                                 <receipents>
                                     <number>' . $number . '</number>
                                 </receipents>
                             </message>
                         </order>
                     </request>';
                $result = self::sendRequest('http://api.iletimerkezi.com/v1/send-sms', $xml, array('Content-Type: text/xml'));
                try {
                    $xml = new \SimpleXMLElement($result);

                    if ($xml->status->code == '200') {
                        Appointment::where('id', $v['id'])->update(['isSend' => REMINDER_SUCCESS]);
                    } else {
                        Appointment::where('id', $v['id'])->update(['isSend' => REMINDER_FAILED]);
                    }
                } catch (\Exception $e) {
                }
            }
        }
    }

    static function sendRequest($site_name, $send_xml, $header_type)
    {

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $site_name);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $send_xml);
        //curl_setopt($ch, CURLOPT_SSL_VERIFYHOST,1);
        //curl_setopt($ch, CURLOPT_SSL_VERIFYPEER,0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $header_type);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
        curl_setopt($ch, CURLOPT_TIMEOUT, 120);

        $result = curl_exec($ch);

        return $result;
    }
}
