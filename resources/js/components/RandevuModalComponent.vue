<template>
  <transition name="modal">
    <div class="modal-mask">
      <div class="modal-wrapper">

        <div class="modal-container">

  <form-wizard>
        <tab-content title="Bilgileriniz">
                     <div class="modal-header">
            <slot name="header">

              <h3 slot="header">
                <label>Masa No:</label>
                {{ modalId }}
</h3>
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
                            v-mask="'##-###-###-##-##'"
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
                            start: '11:30',
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
                            Randevu Oluştur
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
                    <span>Randevunuz Başarı ile Alınmıştır.</span>
                  </div>
                </div>
                <div v-if="secilimi">
                  <div class="complete-form" >
                    <i style="color:red!important" class="fa fa-exclamation-triangle" aria-hidden="true"></i>
                    <span>Bu masa rezerve edilmiştir.</span>
                  </div>
                </div>
              </div>
            </slot>
          </div>
        </tab-content>

        <tab-content title="Aktivasyon">

        </tab-content>
    </form-wizard>
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
  props: ["modalId","secilimi","tarih"],
  name: "FixedTimeList",
  data() {
    return {
      data:[],
      completeForm: true,
      errors: [],
      notification_type: null,
      title:null,
      name: null,
      email: null,
      body: null,
      phone: null,
      text: null,

      timevalue: null,
    };
  },
  created() {

    socket.emit("hello");
  },
  mounted() {},
  methods: {

    store: function () {

      if (
        this.notification_type != null &&
        this.name != null &&
        this.validEmail(this.email) != false &&
        this.body != null &&
        this.phone != null &&

        this.getTime(this.timevalue) != null
      ) {


        axios
          .post(`http://localhost/api/appointment-store`, {
            csrf_token: document
              .querySelector('meta[name="csrf-token"]')
              .getAttribute("content"),
            fullName: this.name,
            phone: this.phone,
            email: this.email,
            body: this.body,

            title:this.modalId,
            date: this.tarih,
            text: this.text,
            time: this.getTime(this.timevalue),
 user_id:$("#logidUserid").text(),
            notification_type: this.notification_type,
          })
          .then((res) => {
            if (res.data.status) {
              socket.emit("new_appointment_create");

              this.completeForm = false;
            }
          });
      }

      this.errors = [];

      if (!this.notification_type) {
        this.errors.push("Bildirim Tipi Seçilmelidir");
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
