<?php if (isset($degisenler)) {


echo $degisenler." Değerli " . $name . " , Talebiniz üzerine " . $date . " tarihinde, saat " . $time . "da " . $body . " kişi olarak güncellenmiştir.Herhangi bir iptal veya değişiklik tarafınızdan belirtilmediği takdirde rezervasyonunuz belirttiğiniz saatten 30 dakika sonra otomatik olarak iptal olacaktır.  <br>
Rezervasyon kodunuz: " . $code . " olarak size tanımlanmıştır.";
} else {
    if(isset($status)){
        if($status=="iptal")echo "Değerli " . $name . " , rezervasyonunuz iptal edilmiştir.";
        elseif($status=="update") echo "Değerli " . $name . " , bizi tercih ettiğiniz için teşekkür ederiz.";
        

    }else
    echo "Değerli " . $name . " , Rezervasyonunuz " . $date . " tarihinde, saat " . $time . "'de " . $body . " kişi için oluşturulmuştur.Herhangi bir iptal veya değişiklik tarafınızdan belirtilmediği takdirde rezervasyonunuz belirttiğiniz saatten 30 dakika sonra otomatik olarak iptal olacaktır.  <br>
Rezervasyon kodunuz: " . $code . " olarak size tanımlanmıştır.";
}
