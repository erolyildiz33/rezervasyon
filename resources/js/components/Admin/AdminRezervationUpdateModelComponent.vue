<template>
  <transition name="modal">
    <div class="modal-mask">
      <div class="modal-wrapper">
        <div class="modal-container">
          <div class="modal-header">
            <slot name="header">
              <h3 slot="header">
                <label>Masa No:</label>
                {{ modalId?modalId:title }}
              </h3>
              <div class="col-md-4">
  <div class="form-group">
     <label>Masa Süslemesi İstiyor mu?</label>
        <toggle-button
          :width="85"
          :height="30"
          style="font-size: 16px"
          v-model="secim"
          :labels="{ checked: 'Evet', unchecked: 'Hayır' }"
          :color="{
            checked: '#00FF00',
            unchecked: '#FF0000',
            disabled: '#CCCCCC',
          }"
        ></toggle-button>
  </div>
   <div v-if="secim">
          <textarea
            type="text"
            class="form-control"
            v-model="susleme_notu"
            placeholder="Masa Süsleme Notu"
          />
        </div>
</div>
              <button
                class="btn btn-success modal-default-button grupmu"
               :data-kisiid="kisi.app_id"
              >
                Tarih Değiştir
              </button>
              <button
                class="btn btn-danger modal-default-button"
                @click="$emit('close')"
              >
                X
              </button>
            </slot>
          </div>
          <div class="modal-body">
            <slot name="body">
              <div>
              
                <div v-if="!secilimi">
                  <div v-if="!completeForm">
                    <div class="container">
                      <div class="row">
                        <div class="col-md-12">
                          <ul>
                            <li class="errors" v-for="i in errors" :key="i.id">
                              {{ i }}
                            </li>
                          </ul>
                        </div>
                      </div>

                      <div class="row">
                         <div class="col-md-4" v-if="kisi.etkinlik==1">
                          <div class="form-group">
                            <input
                              type="text"
                              class="form-control"
                              v-model="kisi.etkinlikname"
                              placeholder="Etkinlik Adı Yazınız"
                            />
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="form-group">
                            <input
                              type="text"
                              class="form-control"
                              v-model="name"
                              placeholder="Adınızı-Soyadınızı Yazınız"
                            />
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="form-group">
                            <input
                              type="text"
                              class="form-control"
                              v-model="email"
                              placeholder="E-Posta Adresinizi Yazınız"
                            />
                          </div>
                        </div>

                        <div class="col-md-4">
                          <div class="form-group">
                            <input
                              type="text"
                              v-mask="'90-###-###-##-##'"
                              class="form-control"
                              v-model="phone"
                              placeholder="Telefon Numaranızı Yazınız"
                            />
                          </div>
                        </div>

                        <div class="col-md-4">
                          <date-picker
                            v-model="timevalue"
                            :placeholder="this.kisi.time"
                            :time-picker-options="{
                              start: simdikisaat,
                              step: '00:05',
                              end: '23:30',
                            }"
                            format="HH:mm"
                            type="time"
                          ></date-picker>
                        </div>
                        <div class="col-md-4">
                          <div class="form-group">
                            <input
                              type="text"
                              class="form-control"
                              v-model="body"
                              placeholder="Kaç kişi olacağınızı yazınız"
                            />
                          </div>
                        </div>
                            <div class="col-md-4" v-if="modalId!='bekliyor'">
                          <div class="form-group">
                            <input
                              type="text"
                              class="form-control"
                              v-model="hes"
                              placeholder="HES Kodu yazınız"
                            />
                          </div>
                        </div>
                      </div>

                      <div class="container">
                        <div class="row">
                          <div class="col-md-12">
                            <div class="form-group">
                              <textarea
                                v-model="text"
                                id=""
                                class="form-control"
                                cols="30"
                                rows="5"
                                placeholder="Notunuzu Giriniz"
                              ></textarea>
                            </div>
                          </div>
                        </div>
                        <div class="col-lg-12">
                          <div class="col-md-12 notification-area">
                            <div class="form-group">
                              <input
                                id="sms"
                                type="radio"
                                v-model="notification_type"
                                value="0"
                              />
                              <label for="sms">Sms</label>
                            </div>

                            <div class="form-group">
                              <input
                                id="email"
                                type="radio"
                                v-model="notification_type"
                                value="1"
                              />
                              <label for="email">Email</label>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-12">
                          <textarea
                            v-model="bildirim"
                            id=""
                            class="form-control"
                            cols="30"
                            rows="5"
                            placeholder="Bildirim metni giriniz"
                          ></textarea>
                        </div>
                        <div class="row">
                          <div class="col-md-12 text-center">
                            <button v-on:click="uptadeModal" class="hw-btn">
                              Rezervasyon Güncelle
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div v-if="completeForm">
                  <div class="complete-form">
                    <i class="fa fa-check-circle-o" aria-hidden="true"></i>
                    <span>Randevunuz Başarı ile Alınmıştır.</span>
                  </div>
                </div>
                <div v-if="secilimi">
                  <div class="complete-form">
                    <i
                      style="color: red !important"
                      class="fa fa-exclamation-triangle"
                      aria-hidden="true"
                    ></i>
                    <span>Bu masa rezerve edilmiştir.</span>
                  </div>
                </div>
              </div>
            </slot>
          </div>
        </div>
      </div>
    </div>
  </transition>
</template>
<script>
import io from "socket.io-client";
var socket = io("http://localhost:3000");
import datepicker from "vue2-datepicker";

export default {
  props: ["modalId", "kisi","secimtarih","secimmasa","secimsaat","secilimi"],
  
  data() {
    return {
      simdikisaat:this.timesec(),
      data: [],
      completeForm: false,
    kayitno:this.kisi.app_id,
      errors: [],
      notification_type: null,
      title: this.kisi.title,
      name: this.kisi.fullName,
      email: this.kisi.email,
      body: this.kisi.body,
      phone: this.kisi.phone,
      text: this.kisi.text,
      bildirim: this.kisi.bildirim_notu,
      timevalue: this.secimsaat?this.secimsaat:null,
      date: this.secimtarih?this.secimtarih:this.kisi.date,
       secim:this.kisi.secim,
      susleme_notu:this.kisi.susleme_notu,
      hes:this.kisi.hes_kodu,
    };
  },
  created() {
    socket.emit("hello");
  },
  mounted() {
      $(document).on("click", ".grupmu", function () {
       
      var geriid = $(this).data("kisiid");
      Swal.fire({
        title: "Rezervasyon Tipi",
       
        icon: "warning",
        showCancelButton: true,
        showDenyButton: true,
        confirmButtonColor: "#3085d6",
        denyButtonColor: "#51ad4c",

        cancelButtonColor: "#d33",
         cancelButtonText:"İptal",
        confirmButtonText: "Kişi Rezervasyonu",
        denyButtonText: "Grup Rezervasyonu",
      }).then((result) => {
        if (result.isConfirmed) {
         window.location.href="http://localhost/admin/updaterezerv/"+geriid
        }
        else if(result.isDenied)
        {

          window.location.href="http://localhost/admin/updategrouprezerv/"+geriid
        }
      });
       $(".swal2-container").css("z-index", "99999")
    })
  },
  methods: {
    rezerv: function(){
      


    
     window.location.href="http://localhost/admin/updaterezerv/"+this.kisi.app_id
    },
    
    uptadeModal: function () {
      axios
        .post("http://localhost/api/appointment-update", {
          _token: document
            .querySelector('meta[name="csrf-token"]')
            .getAttribute("content"),
          app_id: this.kayitno,

          fullName: this.name,
          email: this.email,
          phone: this.phone,
          title: this.modalId?this.modalId:null,
          text: this.text,
          notification_type: this.notification_type,
          time:this.timevalue?new Date(this.timevalue).toLocaleTimeString():null,
          date:this.date?new Date(this.date).toLocaleDateString():null,
          body: this.body,
          bildirim_notu: this.bildirim,
            susleme:this.secim,
            susleme_notu:this.susleme_notu,
            hes_kodu:this.hes,
           user_id:$("#logidUserid").text(),
        })
        .then((res) => {
          this.$emit("kisiguncel",res.data);
           window.location.href = "http://localhost/admin";
        });
    },
  timesec(){
      let saat=Math.ceil(new Date().toTimeString().split(":")[0]);
 
return  saat+1+':00';
},
    notBeforeToday(date) {
      return date < new Date(new Date().setHours(0, 0, 0, 0));
    },
    getTime: function (e) {
      var c = new Date(e);
      var curr_hour = c.getHours();
      var curr_min = c.getMinutes();
      return curr_hour + ":" + curr_min;
    },

    /*selectDate: function () {
      axios
        .get(`http://localhost/api/working-hours/${this.date}`)
        .then((res) => {
          this.workingHours = res.data;
          this.workingHour = 0;
        });
    },*/
    validEmail: function (email) {
      var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      return re.test(email);
    },
  },
};
</script>
