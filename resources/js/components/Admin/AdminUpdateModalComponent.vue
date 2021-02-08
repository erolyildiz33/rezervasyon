<template>
  <transition name="modal">
    <div class="modal-mask">
      <div class="modal-wrapper">
        
        <div class="modal-container">
             <div class="modal-header">
                        <slot name="header">
                            <h3 slot="header">{{data.fullName}}

                                <button class="btn btn-danger modal-default-button" @click="$emit('close')">
                                    X
                                </button>
                            </h3>

                        </slot>
                    </div>
            <div class="panel panel-default">
             
              <div style="padding: 10px">
                <label>Müşteri Tipi</label>
                <toggle-button
                  :width="85"
                  :height="30"
                  style="font-size: 16px"
                  v-model="secim"
                  :labels="{ checked: 'Yerel', unchecked: 'Otel' }"
                  :color="{
                    checked: '#00FF00',
                    unchecked: '#FF0000',
                    disabled: '#CCCCCC',
                  }"
                ></toggle-button>
                <label>Cinsiyet</label>
                <toggle-button
                  :width="85"
                  :height="30"
                  style="font-size: 16px"
                  v-model="secim2"
                  :labels="{ checked: 'Kadın', unchecked: 'Erkek' }"
                  :color="{
                    checked: '#00FF00',
                    unchecked: '#FF0000',
                    disabled: '#CCCCCC',
                  }"
                ></toggle-button>
                <label>Karaliste mi?</label>
                <toggle-button
                  :width="85"
                  :height="30"
                  style="font-size: 16px"
                  v-model="secim1"
                  :labels="{ checked: 'Evet', unchecked: 'Hayır' }"
                  :color="{
                    checked: '#00FF00',
                    unchecked: '#FF0000',
                    disabled: '#CCCCCC',
                  }"
                ></toggle-button>
                <div v-if="secim1">
                  <textarea
                    type="text"
                    class="form-control"
                    v-model="gerekce"
                    placeholder="Karaliste Gerekçesi?"
                  />
                </div>
                <div>
                  <label>Kişisel Bilgiler:</label>
                </div>
                <input
                  type="text"
                  class="form-control"
                  v-model="ad"
                  placeholder="Adı"
                />
                <input
                  type="text"
                  class="form-control"
                  v-model="soyad"
                  placeholder="Soyadı"
                />
                <input
                  type="text"
                  class="form-control"
                  v-model="email"
                  placeholder="Mail"
                />
                <input
                  type="text"
                  class="form-control"
                  v-model="tel"
                  placeholder="Telefon"
                  v-mask="'90-###-###-##-##'"
                />
                <textarea
                  type="text"
                  class="form-control"
                  v-model="notu"
                  placeholder="Notu"
                />
                <input
                  type="text"
                  class="form-control"
                  v-model="iptal"
                  placeholder="iptal ettiği rezervasyon"
                />
                <div>
                  <label>Özel Gün Bilgileri:</label>
                </div>
                <span>Doğum Tarihi</span>
                <date-picker
                  :min="minDate"
                  v-model="date"
                  data="data1"
                  format="DD-MM-YYYY"
                  type="date"
                ></date-picker>
                <span>Evlilik Tarihi</span>
                <date-picker
                  :min="minDate1"
                  v-model="date1"
                  format="DD-MM-YYYY"
                  type="date"
                ></date-picker>

                <div v-if="SelectPhoto">
                  <label for="file-input">Resim Seç</label>
                  <input
                    type="file"
                    accept="image/*"
                    @change="uploadImage($event)"
                    id="file-input"
                  />
                </div>
                <img
                  :src="previewImage"
                  class="uploading-image picture"
                  style="max-height: 200px"
                />
                <button
                  @click="uptadeModal"
                  style="margin-top: 5px"
                  class="btn btn-primary"
                >
                  Güncelle
                </button>
              </div>
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
  props: ["modalId","tarih", "kisi"],
  name: "FixedTimeList",
  data() {
    return {
      data: [],
      completeForm: true,
      errors: [],
      notification_type: null,
      isShow: false,
      ad: this.kisi.ad,
      soyad: this.kisi.soyad,
      email: this.kisi.email,
      tel: this.kisi.tel,
      notu: this.kisi.notu,
      iptal: this.kisi.iptal,
      gerekce: this.kisi.karaliste_gerekce,
      SelectPhoto: true,
      previewImage: null,
      isDisable: true,
      isShow: false,
      inputTable: "",
      masalar: [],
      minDate: "",
      image:this.kisi.image,
      date:this.kisi.dogumtar?new Date (this.kisi.dogumtar):"",
      minDate1: "",
      date1:this.kisi.evliliktar? new Date(this.kisi.evliliktar):"",
      data1: [],
      secim: this.kisi.misafir_id?true:false,
      secim1: this.kisi.cinsiyet?true:false,
      secim2: this.kisi.karaliste?true:false,

      title: null,
      timevalue: null,
    };
  },
  created() {
    socket.emit("hello");
    console.log(this.kisi)
  },
  mounted() {},
  methods: {
     kisiguncelleme: function (res) {
      this.showModal = false;
      this.kisi = res.data;
    },
   
    uptadeModal: function () {
      axios
        .post(`http://localhost/api/table-update`, {
           _token: document
            .querySelector('meta[name="csrf-token"]')
            .getAttribute("content"),
         id:this.kisi.id,
          ad: this.ad,
          soyad: this.soyad,
          email: this.email,
          tel: this.tel,
          notu: this.notu,
          image: this.previewImage,
          iptal: this.iptal,
          dogumtar:
            this.date != "" ?this.date.toLocaleDateString() : "",
          evliliktar:
            this.date1 != "" ?this.date1.toLocaleDateString() : "",
          misafir_id: this.secim,
          karaliste: this.secim1,
          cinsiyet: this.secim2,
          karaliste_gerekce: this.gerekce,
           user_id:$("#logidUserid").text(),
        })
        .then((res) => {
           this.$emit("kisiguncelle") ;
        
        
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
