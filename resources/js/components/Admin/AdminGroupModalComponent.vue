
<template>
  <transition name="modal">
    <div class="modal-mask">
      <div class="modal-wrapper">
        <div class="modal-container">
          <div class="modal-header">
            <slot name="header">
              <h3 slot="header">
                <label>Masa No:</label>
                {{modalId }}
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
            </slot>
             <button
                class="btn btn-danger modal-default-button"
                @click="$emit('close')"
              >
                X
              </button>
          </div>
          <div class="modal-body">
            <slot name="body">
              <div>
                <div v-if="!secilimi">
                  <div v-if="completeForm">
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
                         <div class="col-md-4">
                          <div class="form-group">
                            <input
                              type="text"
                              class="form-control"
                              v-model="etkinlikname"
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
                              v-mask="'###########'"
                              class="form-control"
                              v-model="phone"
                              placeholder="Telefon Numaranızı Yazınız"
                            />
                          </div>
                        </div>

                        <div class="col-md-4">
                          <date-picker
                            v-model="timevalue"
                            :time-picker-options="{
                              start:simdikisaat,
                              step: '00:05',
                              end: '23:30',
                            }"
                          
                            format="H:mm"
                            type="time"
                            placeholder="Geliş Saatinizi belirleyiniz"
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
                        <div class="row">
                          <div class="col-md-12 text-center">
                            <button v-on:click="store" class="hw-btn">
                              Grup Rezervasyonu Oluştur
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div v-if="!completeForm">
                  <div class="complete-form">
                    <i class="fa fa-check-circle-o" aria-hidden="true"></i>
                    <span>Grup Rezervasyonu Başarı ile Alınmıştır.</span>
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
  props: ["modalId", "secilimi", "tarih", "kisi"],
  name: "FixedTimeList",
  data() {
    return {
      simdikisaat:this.timesec(),
      data: [],
      completeForm: true,
      errors: [],
      notification_type: null,
      title: null,
      etkinlikname:this.kisi.etkinlikname,
      name: this.kisi.ad + " " + this.kisi.soyad,
      email: this.kisi.email,
      body: null,
      phone: this.kisi.tel,
      text: "",
      bildirim_notu:this.bildirim_notu,
      timevalue: null,
      secim:this.kisi.secim,
      susleme_notu:this.kisi.susleme_notu,
    };
  },
  created() {
    socket.emit("hello");
   
  },
  mounted() {},
  methods: {
    store: function () {
      if (
        this.etkinlikname != null &&
        this.notification_type != null &&
        this.name != null &&
        this.validEmail(this.email) != false &&
        this.body != null &&
        this.phone != null &&
        this.getTime(this.timevalue) != null
      ) {

        axios
          .post("http://localhost/api/appointment-store", {
            csrf_token: document
              .querySelector('meta[name="csrf-token"]')
              .getAttribute("content"),
              etkinlikname:this.etkinlikname,
            fullName: this.name,
            phone: this.phone,
            email: this.email,
            body: this.body,
            kisi_id: this.kisi.id,
            title: this.modalId,
            date: new Date(this.tarih).toLocaleDateString(),
            text: this.text,
            time: this.getTime(this.timevalue),
            notification_type: this.notification_type,
            bildirim_notu:this.bildirim_notu,
            user_id:$("#logidUserid").text(),
            susleme:this.secim,
            susleme_notu:this.susleme_notu,
          })
           .then((res) => {
            if (res.data.status) {
              socket.emit("new_appointment_create");

              this.completeForm = false;
               window.location.href="http://localhost/admin"
            }
          });
      }
      this.errors = [];
      if (!this.notification_type) {
        this.errors.push("Bildirim Tipi Seçilmelidir");
      }
       if (!this.etkinlikname) {
        this.errors.push("Etkinlik Adı Seçilmelidir");
      }
      if (!this.name) {
        this.errors.push("İsim Soyisim Girilmelidir");
      }
      if (!this.email || !this.validEmail(this.email)) {
        this.errors.push("Email Girilmelidir ve Formatı Doğru olmalıdır");
      }
      if (!this.body) {
        this.errors.push("Kişi sayısı girilmelidir");
      }
      if (!this.phone) {
        this.errors.push("Telefon numarası Girilmelidir");
      }
      if (!this.getTime(this.timevalue)) {
        this.errors.push("Çalışma saati seçilmelidir");
      }
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

