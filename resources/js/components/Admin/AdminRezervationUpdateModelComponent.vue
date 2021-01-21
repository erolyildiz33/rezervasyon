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
                {{ kisi.title }}
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
                          :time-picker-options="{
                            start: '11:30',
                            step: '00:05',
                            end: '23:30',
                          }"
                          format="HH:mm:ss"
                         
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
 props: ["modalId","kisi"],
  name: "FixedTimeList",
  data() {
    return {
      data:[],
      completeForm: false,
      secilimi:false,
      errors: [],
      notification_type: null,
      title:this.kisi.title,
      name:this.kisi.fullName,
      email: this.kisi.email,
      body:this.kisi.body,
      phone:this.kisi.phone,
      text: this.kisi.text,
      bildirim:this.kisi.bildirim_notu,
      timevalue: this.kisi.time,
     
    };
  },
  created() {
  
    socket.emit("hello");
  },
  mounted() {},
  methods: {
     rezervguncelleme: function (res) {
      this.showModal = false;
      this.kisi = res.data;
    },
   uptadeModal: function () {
      axios
        .post('http://localhost/api/appointment-update/', {
           _token: document
              .querySelector('meta[name="csrf-token"]')
              .getAttribute("content"),
          fullName: this.name,
          email: this.email,
          phone: this.phone,
         title:this.title,
          text: this.text,
          notification_type: this.notification_type,
          time: this.timevalue,
         
          body: this.body,
          bildirim_notu: this.bildirim,
          
        })
        .then((res) => {
         this.rezervguncelleme();
        
        });
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
