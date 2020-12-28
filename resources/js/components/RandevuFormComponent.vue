<template>
  <div>
    
      <div class="container">
       
       

        <div class="row">
          <appointment-modal
            :modalId="showModalId"
            v-if="showModal"
            @close="showModal = false"
          ></appointment-modal>
          <img id="image" src="img/im2.jpeg" usemap="#image-map" />

          <map name="image-map">
            <area
              data-key="bk1,bkall"
              @click="modalShow"
              alt="b-bk-1"
              title="b-bk-1"
              href=""
              coords="76,469,101,501"
              shape="rect"
            />
            <area
              data-key="bk2,bkall"
              alt="b-bk-2"
              title="b-bk-2"
              href=""
              coords="23,469,46,501"
              shape="rect"
            />
            <area
              data-key="bk3,bkall"
              alt="b-bk-3"
              title="b-bk-3"
              href=""
              coords="103,370,78,336"
              shape="rect"
            />
            <area
              data-key="bk4,bkall"
              alt="b-bk-4"
              title="b-bk-4"
              href=""
              coords="26,335,49,366"
              shape="rect"
            />
            <area
              data-key="bkall"
              alt="b-bk-all"
              title="b-bk-all"
              href=""
              coords="138,668,225,701"
              shape="rect"
            />
            <area
              data-key="ibo1,iboall"
              alt="i-bo-1"
              title="i-bo-1"
              href=""
              coords="161,486,185,518"
              shape="rect"
            />
            <area
              data-key="ibo2,iboall"
              alt="i-bo-2"
              title="i-bo-2"
              href=""
              coords="244,465,271,519"
              shape="rect"
            />
            <area
              data-key="itbo51,iboall"
              alt="i-tbo-51"
              title="i-tbo-51"
              href=""
              coords="291,596,311,624"
              shape="rect"
            />
            <area
              data-key="itbo52,iboall"
              alt="i-tbo-52"
              title="i-tbo-52"
              href=""
              coords="240,595,264,623"
              shape="rect"
            />
            <area
              data-key="itbo53,iboall"
              alt="i-tbo-53"
              title="i-tbo-53"
              href=""
              coords="196,595,215,624"
              shape="rect"
            />
            <area
              data-key="iboall"
              alt="i-bo-all"
              title="i-bo-all"
              href=""
              coords="353,668,448,702"
              shape="rect"
            />
            <area
              data-key="bkt54,bktall"
              alt="b-bkt-54"
              title="b-bkt-54"
              href=""
              coords="150,593,170,620"
              shape="rect"
            />
            <area
              data-key="bkt55,bktall"
              alt="b-bkt-55"
              title="b-bkt-55"
              href=""
              coords="101,583,123,611"
              shape="rect"
            />
            <area
              data-key="bkt56,bktall"
              alt="b-bkt-56"
              title="b-bkt-56"
              href=""
              coords="54,560,73,587"
              shape="rect"
            />
            <area
              data-key="bktall"
              alt="b-bkt-all"
              title="b-bkt-all"
              href=""
              coords="248,669,332,702"
              shape="rect"
            />
            <area
              data-key="sst5,sstall"
              alt="s-st-5"
              title="s-st-5"
              href=""
              coords="341,493,365,518"
              shape="rect"
            />
            <area
              data-key="sst6,sstall"
              alt="s-st-6"
              title="s-st-6"
              href=""
              coords="402,494,424,519"
              shape="rect"
            />
            <area
              data-key="sst7,sstall"
              alt="s-st-7"
              title="s-st-7"
              href=""
              coords="465,492,490,520"
              shape="rect"
            />
            <area
              data-key="sst8,sstall"
              alt="s-st-8"
              title="s-st-8"
              href=""
              coords="536,496,561,521"
              shape="rect"
            />
            <area
              data-key="sst9,sstall"
              alt="s-st-9"
              title="s-st-9"
              href=""
              coords="597,494,621,522"
              shape="rect"
            />
            <area
              data-key="sstt44,sstall"
              alt="s-stt-44"
              title="s-stt-44"
              href=""
              coords="652,576,674,629"
              shape="rect"
            />
            <area
              data-key="sstt45,sstall"
              alt="s-stt-45"
              title="s-stt-45"
              href=""
              coords="596,575,619,626"
              shape="rect"
            />
            <area
              data-key="sstt46,sstall"
              alt="s-stt-46"
              title="s-stt-46"
              href=""
              coords="538,575,561,629"
              shape="rect"
            />
            <area
              data-key="sstt47,sstall"
              alt="s-stt-47"
              title="s-stt-47"
              href=""
              coords="489,577,512,628"
              shape="rect"
            />
            <area
              data-key="sstt48,sstall"
              alt="s-stt-48"
              title="s-stt-48"
              href=""
              coords="438,586,463,624"
              shape="rect"
            />
            <area
              data-key="sstt49,sstall"
              alt="s-stt-49"
              title="s-stt-49"
              href=""
              coords="388,581,408,624"
              shape="rect"
            />
            <area
              data-key="sstt50,sstall"
              alt="s-stt-50"
              title="s-stt-50"
              href=""
              coords="337,597,361,625"
              shape="rect"
            />
            <area
              data-key="sstall"
              alt="s-st-all"
              title="s-st-all"
              href=""
              coords="562,700,469,668"
              shape="rect"
            />
            <area
              data-key="ssoi10,ssoall"
              alt="s-soi-10"
              title="s-soi-10"
              href=""
              coords="660,496,682,519"
              shape="rect"
            />
            <area
              data-key="ssoi11,ssoall"
              alt="s-soi-11"
              title="s-soi-11"
              href=""
              coords="729,496,752,521"
              shape="rect"
            />
            <area
              data-key="ssoi12,ssoall"
              alt="s-soi-12"
              title="s-soi-12"
              href=""
              coords="784,496,810,522"
              shape="rect"
            />
            <area
              data-key="ssoi13,ssoall"
              alt="s-soi-13"
              title="s-soi-13"
              href=""
              coords="836,494,860,520"
              shape="rect"
            />
            <area
              data-key="ssot41,ssoall"
              alt="s-sot-41"
              title="s-sot-41"
              href=""
              coords="820,572,847,628"
              shape="rect"
            />
            <area
              data-key="ssot42,ssoall"
              alt="s-sot-42"
              title="s-sot-42"
              href=""
              coords="765,565,787,628"
              shape="rect"
            />
            <area
              data-key="ssot43,ssoall"
              alt="s-sot-43"
              title="s-sot-43"
              href=""
              coords="711,575,733,627"
              shape="rect"
            />
            <area
              data-key="ssoall"
              alt="s-so-all"
              title="s-so-all"
              href=""
              coords="588,667,682,701"
              shape="rect"
            />
            <area
              data-key="mmoi14,mmoall"
              alt="m-moi-14"
              title="m-moi-14"
              href=""
              coords="865,413,890,460"
              shape="rect"
            />
            <area
              data-key="mmoi15,mmoall"
              alt="m-moi-15"
              title="m-moi-15"
              href=""
              coords="913,460,945,518"
              shape="rect"
            />
            <area
              data-key="mmoi16,mmoall"
              alt="m-moi-16"
              title="m-moi-16"
              href=""
              coords="990,457,1020,519"
              shape="rect"
            />
            <area
              data-key="mmoi17,mmoall"
              alt="m-moi-17"
              title="m-moi-17"
              href=""
              coords="1062,463,1098,523"
              shape="rect"
            />
            <area
              data-key="mmoi36,mmoall"
              alt="m-moi-36"
              title="m-moi-36"
              href=""
              coords="1094,589,1113,629"
              shape="rect"
            />
            <area
              data-key="mmoi37,mmoall"
              alt="m-moi-37"
              title="m-moi-37"
              href=""
              coords="1038,585,1060,624"
              shape="rect"
            />
            <area
              data-key="mmoi38,mmoall"
              alt="m-moi-38"
              title="m-moi-38"
              href=""
              coords="986,585,1009,624"
              shape="rect"
            />
            <area
              data-key="mmoi39,mmoall"
              alt="m-moi-39"
              title="m-moi-39"
              href=""
              coords="933,584,954,624"
              shape="rect"
            />
            <area
              data-key="mmoi40,mmoall"
              alt="m-moi-40"
              title="m-moi-40"
              href=""
              coords="877,574,901,628"
              shape="rect"
            />
            <area
              data-key="mmoall"
              alt="m-mo-all"
              title="m-mo-all"
              href=""
              coords="705,665,798,699"
              shape="rect"
            />
            <area
              data-key="ddk110,ddkall"
              alt="d-dk-110"
              title="d-dk-110"
              href=""
              coords="1133,342,1171,370"
              shape="rect"
            />
            <area
              data-key="ddk111,ddkall"
              alt="d-dk-111"
              title="d-dk-111"
              href=""
              coords="1181,342,1217,370"
              shape="rect"
            />
            <area
              data-key="ddk112,ddkall"
              alt="d-dk-112"
              title="d-dk-112"
              href=""
              coords="1234,344,1268,371"
              shape="rect"
            />
            <area
              data-key="ddk113,ddkall"
              alt="d-dk-113"
              title="d-dk-113"
              href=""
              coords="1144,425,1179,451"
              shape="rect"
            />
            <area
              data-key="ddk114,ddkall"
              alt="d-dk-114"
              title="d-dk-114"
              href=""
              coords="1190,427,1223,453"
              shape="rect"
            />
            <area
              data-key="ddk115,ddkall"
              alt="d-dk-115"
              title="d-dk-115"
              href=""
              coords="1234,427,1270,452"
              shape="rect"
            />
            <area
              data-key="ddkall"
              alt="d-dk-all"
              title="d-dk-all"
              href=""
              coords="940,668,1036,699"
              shape="rect"
            />
            <area
              data-key="ddkt33,ddktall"
              alt="d-dkt-33"
              title="d-dkt-33"
              href=""
              coords="1230,551,1248,537,1260,553,1243,567"
              shape="poly"
            />
            <area
              data-key="ddkt34,ddktall"
              alt="d-dkt-34"
              title="d-dkt-34"
              href=""
              coords="1188,582,1202,569,1219,590,1205,603"
              shape="poly"
            />
            <area
              data-key="ddkt35,ddktall"
              alt="d-dkt-35"
              title="d-dkt-35"
              href=""
              coords="1147,593,1165,621"
              shape="rect"
            />
            <area
              data-key="ddktall"
              alt="d-dkt-all"
              title="d-dkt-all"
              href=""
              coords="826,668,919,701"
              shape="rect"
            />
            <area
              data-key="iiky3,iikyall"
              alt="i-iky-3"
              title="i-iky-3"
              href=""
              coords="398,280,424,312"
              shape="rect"
            />
            <area
              data-key="iiky4,iikyall"
              alt="i-iky-4"
              title="i-iky-4"
              href=""
              coords="462,279,486,311"
              shape="rect"
            />
            <area
              data-key="iikyall"
              alt="i-iky-all"
              title="i-iky-all"
              href=""
              coords="1062,665,1158,698"
              shape="rect"
            />
          </map>
          <toggle-button
            v-model="secim"
            key="bkall"
            :labels="{ checked: 'Aç', unchecked: 'Kapa' }"
            @change="addimgAll"
          ></toggle-button>
          <input
            type="checkbox"
            v-model="secim1"
            title="iboall"
            @change="addimgAll"
          /><span>İçeri Teras Bar Önü</span>
          <input
            type="checkbox"
            v-model="secim2"
            title="bktall"
            @change="addimgAll"
          /><span>Batı Kulakçık Teras</span>
          <input
            type="checkbox"
            v-model="secim3"
            title="sstall"
            @change="addimgAll"
          /><span>Sahne Sağ Taraf</span>
          <input
            type="checkbox"
            v-model="secim4"
            title="ssoall"
            @change="addimgAll"
          /><span>Sahne Önü İçeri - Teras</span>
          <input
            type="checkbox"
            v-model="secim5"
            title="mmoall"
            @change="addimgAll"
          /><span>Mutfak Önü İçeri - Teras</span>
          <input
            type="checkbox"
            v-model="secim6"
            title="ddkall"
            @change="addimgAll"
          /><span>Doğu Kulaçık İçeri</span>
          <input
            type="checkbox"
            v-model="secim7"
            title="ddktall"
            @change="addimgAll"
          /><span>Doğu Kulaçık Teras</span>
          <input
            type="checkbox"
            v-model="secim8"
            title="iikyall"
            @change="addimgAll"
          /><span>İçeri Kapı Yanı</span>
        </div>

      
      </div>
    </div>
   
 
</template>

<script>
import $ from "jquery";

require("jquery-imagemapster");
import io from "socket.io-client";
var socket = io("http://localhost:3000");
export default {
  name: "FixedTimeList",

  data() {
    return {
     
      secim: null,
      secim1: null,
      secim2: null,
      secim3: null,
      secim4: null,
      secim5: null,
      secim6: null,
      secim7: null,
      secim8: null,
      showModalId: null,
      showModal: false,
      
    };
  },

  created() {
    socket.emit("hello");
  },
  mounted() {
    axios.get(`http://localhost/api/working-hours`).then((res) => {
      console.log(res.data);
      this.workingHours = res.data;
    });

    $("#image").mapster({
      mapKey: "data-key",
      fillColor: "ff0000",
      fillOpacity: 1,
    });
  },
  methods: {
    modalShow: function (e) {
      console.log(e.currentTarget.title);
      this.showModalId = e.currentTarget.title;
      this.showModal = true;
    },
    addimgAll: function (e) {
      console.log(e.currentTarget.key);
      if (
        this.secim == true ||
        this.secim1 == true ||
        this.secim2 == true ||
        this.secim3 == true ||
        this.secim4 == true ||
        this.secim5 == true ||
        this.secim6 == true ||
        this.secim7 == true ||
        this.secim8 == true
      ) {
        // $("#image").mapster("set", true, e.currentTarget.data - title);
      } else {
        //$("#image").mapster("set", false, e.currentTarget.data - title);
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
    store: function () {
      if (
        this.notification_type != null &&
        this.name != null &&
        this.validEmail(this.email) != false &&
        this.body != null &&
        this.phone != null &&
        this.getTime(this.timevalue) != null
      ) {
        console.log(this.getTime(this.timevalue));

        axios
          .post(`http://localhost/api/appointment-store`, {
            csrf_token: document
              .querySelector('meta[name="csrf-token"]')
              .getAttribute("content"),
            fullName: this.name,
            phone: this.phone,
            email: this.email,
            body: this.body,
            date: new Date(this.date).toLocaleDateString(),
            text: this.text,
            time: this.getTime(this.timevalue),

            notification_type: this.notification_type,
          })
          .then((res) => {
            if (res.status) {
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
