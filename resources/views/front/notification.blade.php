<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>
<script src="https://unpkg.com/vue-star-rating/dist/VueStarRating.umd.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<?php $appointment = \App\Models\Appointment::where('app_id', $id)->get()[0];
$kisi = \App\Models\Table::where('id', $appointment->kisi_id)->get()[0];

?>
<div class="container contact-form">
    <div class="contact-image">
        <img src="/img/logo.png" alt="rocket_contact" />
    </div>
    <div id="app">
        <form method="post">
            <h3 style="margin-bottom: 0;">Memnuniyet Formu</h3>
            <div class="row mt-3">
                <div class="col-md-12">
                    <div class="d-flex justify-content-center">


                        <star-rating text-class="custom-text" @rating-selected="setCurrentSelectedRating" :star-size="28" v-model="oyorani"></star-rating>

                    </div>
                </div>
                <div class="col-md-12">


                    <div class="d-flex justify-content-center">
                        <div class="row mt-3">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-control">Ad Soyad : {{$kisi->ad." ".$kisi->soyad}}</label>
                                </div>
                                <div class="form-group">
                                    <label class="form-control">Rezervasyon Tarihi : {{Illuminate\Support\Carbon::createFromFormat('Y-m-d', $appointment->date)->format('d.m.Y')}}</label>
                                </div>
                                <div class="form-group">
                                    <label class="form-control">Rezervasyon Saati : {{substr($appointment->time,0,5)}}</label>
                                </div>

                                <input type="hidden" name="app_id" id="app_id" value="<?= $id ?>">
                                <?= csrf_field(); ?>

                            </div>
                            <div class="col-md-6">

                                <div class="form-group">
                                    <textarea id="txtMsg" class="form-control" placeholder="Mesajınız" style="width: 100%; height: 150px;"></textarea>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <button type="button" id="btnSubmit" class="btnContact w-100">Gönder</button>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

        </form>
    </div>
</div>

<script>
    Vue.component('star-rating', VueStarRating.default);
    new Vue({
        el: '#app',
        methods: {


            setCurrentSelectedRating: function(rating) {
                this.oyorani = rating;
                console.log(this.oyorani);
            }
        },
        data: {
            oyorani: 0,
            rating: "No Rating Selected",
            currentRating: "No Rating",
            currentSelectedRating: "No Current Rating",
            boundRating: 3,
        },
        mounted() {
            var ref=this;
            $("#btnSubmit").on('click', function() {
                if (ref.oyorani != 0) {
                    
                    $.ajax({
                        url: "/notification-store",
                        type: "POST",
                        data: {
                            app_id: $("#app_id").val(),
                            text: $("#txtMsg").val(),
                            rate:ref.oyorani,
                            _token: $('[name=_token]').val()
                        }
                    }).then((res) => {
                        Swal.fire(
                            "Bildiriminiz Gönderildi!",
                            "Bizi tercih ettiğiniz için teşekkür ederiz.",
                            "success"
                        );
                        window.location.href = "https://www.divan.com.tr/";
                        
                    });
                } else {
                    Swal.fire(
                            "Bildirim Gönderilmedi!",
                            "Lütfen oy veriniz.",
                            "warning"
                        );
                }
            });
        }

    });
</script>




<style>
    body {
        background: -webkit-linear-gradient(left, #0072ff, #00c6ff);
    }

    .contact-form {
        background: #fff;
        margin-top: 10%;
        margin-bottom: 5%;
        width: 70%;
        border-radius: 20px;
    }

    .contact-form .form-control {
        border-radius: 1rem;
    }

    .contact-image {
        text-align: center;
    }

    .contact-image img {
        border-radius: 6rem;
        width: 11%;
        margin-top: -3%;
        transform: rotate(29deg);
    }

    .contact-form form {
        padding: 14%;
    }

    .contact-form form .row {
        margin-bottom: -7%;
    }

    .contact-form h3 {
        margin-bottom: 8%;
        margin-top: -10%;
        text-align: center;
        color: #0062cc;
    }

    .contact-form .btnContact {
        width: 50%;
        border: none;
        border-radius: 1rem;
        padding: 1.5%;
        background: #dc3545;
        font-weight: 600;
        color: #fff;
        cursor: pointer;
    }

    .btnContactSubmit {
        width: 50%;
        border-radius: 1rem;
        padding: 1.5%;
        color: #fff;
        background-color: #0062cc;
        border: none;
        cursor: pointer;
    }

    .custom-text {
        font-weight: bold;
        font-size: 1.2em;
        border: 1px solid #cfcfcf;
        padding-left: 10px;
        padding-right: 10px;
        border-radius: 5px;
        color: #999;
        background: #fff;
    }
</style>