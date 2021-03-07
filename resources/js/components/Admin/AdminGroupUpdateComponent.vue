<template>
  <div>
    <div class="container">
      <div class="row">
        <admin-rezervation-update-modal
          :secilimi="sonuc"
          :modalId="showModalId"
          v-if="showModal"
          :tarih="date"
          :kisi="userid[0]"
          @close="showModal = false"
        ></admin-rezervation-update-modal>
        <div class="col-md-12">
          <date-picker
            v-model="date"
            @pick="selectDate"
            format="DD-MM-YYYY dddd"
            :disabled-date="notBeforeToday"
            type="date"
            ><span> Tarihi</span></date-picker
          >
        </div>
        <img src="/img/yeni.jpeg" usemap="#image-map" />

        <map name="image-map">
          <area
            data-key=""
            @click="secimekle"
            alt="52"
            title="b-k-i-52"
            href=""
            coords="24,522,4,487"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="60"
            title="b-k-i-60"
            href=""
            coords="65,522,43,487"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="59"
            title="b-k-i-59"
            href=""
            coords="85,485,107,524"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="53"
            title="b-k-i-53"
            href=""
            coords="0,404,36,435"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="54"
            title="b-k-i-54"
            href=""
            coords="2,320,36,352"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="61"
            title="b-k-i-61"
            href=""
            coords="66,401,85,437"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="62"
            title="b-k-i-62"
            href=""
            coords="64,318,86,352"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="58"
            title="b-k-i-58"
            href=""
            coords="107,361,152,397"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="57"
            title="b-k-i-57"
            href=""
            coords="110,275,151,307"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="56"
            title="b-k-i-56"
            href=""
            coords="116,199,134,244"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="55"
            title="b-k-i-55"
            href=""
            coords="32,253,55,234,88,270,65,291"
            shape="poly"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="51"
            title="b-k-i-51"
            href=""
            coords="36,546,60,560,45,589,22,576"
            shape="poly"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="50"
            title="b-k-i-50"
            href=""
            coords="92,572,116,579,103,629,81,620"
            shape="poly"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="B2"
            title="b-ö-s-B2"
            href=""
            coords="194,587,215,620"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="B1"
            title="b-ö-s-B1"
            href=""
            coords="272,585,293,623"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="1"
            title="b-ö-i-1"
            href=""
            coords="176,466,203,519"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="2"
            title="b-ö-i-2"
            href=""
            coords="245,463,270,520"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="3"
            title="s-s-i-3"
            href=""
            coords="359,492,388,527"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="4"
            title="s-s-i-4"
            href=""
            coords="360,439,388,474"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="5"
            title="s-s-i-5"
            href=""
            coords="424,493,453,527"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="6"
            title="s-s-i-6"
            href=""
            coords="424,439,454,475"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="7"
            title="s-s-i-7"
            href=""
            coords="488,493,518,527"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="8"
            title="s-s-i-8"
            href=""
            coords="488,440,519,476"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="9"
            title="s-s-i-9"
            href=""
            coords="558,493,587,527"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="10"
            title="s-s-i-10"
            href=""
            coords="558,441,587,474"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="11"
            title="s-ö-i-11"
            href=""
            coords="616,496,644,529"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="12"
            title="s-ö-i-12"
            href=""
            coords="614,439,643,473"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="13"
            title="s-ö-i-13"
            href=""
            coords="669,494,699,528"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="14"
            title="s-ö-i-14"
            href=""
            coords="670,441,699,474"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="15"
            title="s-ö-i-15"
            href=""
            coords="746,492,774,539"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="16"
            title="s-ö-i-16"
            href=""
            coords="746,440,774,474"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="17"
            title="s-ö-i-17"
            href=""
            coords="811,493,842,542"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="18"
            title="s-ö-i-18"
            href=""
            coords="812,440,845,474"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="19"
            title="m-ö-i-19"
            href=""
            coords="913,460,945,527"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="20"
            title="m-ö-i-20"
            href=""
            coords="922,351,950,377"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="21"
            title="m-ö-i-21"
            href=""
            coords="990,458,1020,526"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="22"
            title="m-ö-i-22"
            href=""
            coords="977,350,1006,377"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="23"
            title="m-ö-i-23"
            href=""
            coords="1066,460,1100,527"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="24"
            title="m-ö-i-24"
            href=""
            coords="1033,353,1061,379"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="25"
            title="25"
            href=""
            coords="523,324,542,363"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="26"
            title="26"
            href=""
            coords="471,327,491,362"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="30"
            title="s-ö-b-30"
            href=""
            coords="813,584,844,615"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="31"
            title="s-ö-b-31"
            href=""
            coords="748,582,777,615"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="32"
            title="s-ö-b-32"
            href=""
            coords="679,576,709,624"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="33"
            title="s-ö-b-33"
            href=""
            coords="622,575,653,622"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="34"
            title="s-s-b-34"
            href=""
            coords="560,575,590,625"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="35"
            title="s-s-b-35"
            href=""
            coords="500,584,527,620"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="36"
            title="s-s-b-36"
            href=""
            coords="421,588,449,621"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="37"
            title="s-s-b-37"
            href=""
            coords="353,588,385,624"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="D1"
            title="m-ö-s-D1"
            href=""
            coords="1037,583,1066,624"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="D2"
            title="m-ö-s-D2"
            href=""
            coords="933,584,960,623"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="46"
            title="d-k-i-46"
            href=""
            coords="1136,540,1161,576"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="47"
            title="d-k-i-47"
            href=""
            coords="1132,592,1158,628"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="48"
            title="d-k-i-48"
            href=""
            coords="1182,553,1204,537,1235,582,1216,600"
            shape="poly"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="43"
            title="d-k-i-43"
            href=""
            coords="1135,477,1169,505"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="44"
            title="d-k-i-44"
            href=""
            coords="1184,477,1216,505"
            shape="rect"
          />
          <area
            data-key=""
            @click="secimekle"
            alt="45"
            title="d-k-i-45"
            href=""
            coords="1228,474,1260,505"
            shape="rect"
          />
        </map>
      </div>
      <button class="btn btn-success" @click="masa">Seçimi Tamamla</button>
    </div>
  </div>
</template>

<script>
import $ from "jquery";
require("jquery-imagemapster");
import datepicker from "vue2-datepicker";
export default {
  props: ["userid"],

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
      secilimasalar: null,
      showModalId: 0,
      showModal: false,
      masaekle: [],
      date: new Date(),
      gettar: new Date(),
      sonuc: null,
    };
  },
  created() {
    this.getirtarih(this.selectDate());
    var saat=new Date().toLocaleTimeString().split(":")
     console.log(saat[0]+":"+saat[1]);
  },
  mounted() {
    $("img").mapster({
      mapKey: "title",
      singleSelect: false,
      fillColor: "00ffee",
      fillOpacity: 1,
      stroke: false,
      isSelectable: false,
      clickNavigate: true,
      showToolTip: true,
      onMouseover: function (e) {
        $(this).mapster("set", false).mapster("set", true);
      },
      onMouseout: function (e) {
        $(this).mapster("set", false);
      },
    });
  },
  methods: {
    masa: function () {
      if (this.masaekle.length > 0) {
        this.sonuc = false;
      } else {
        this.sonuc = true;
      }
      if (this.sonuc==false) {

        this.showModalId = this.masaekle.join(", ");
        this.showModal = true;
      }else{
        Swal.fire({
        title: "Bu masa rezervayonludur",
        text:
          "Lütfen başka masa seçiniz.",
        icon: "warning",
        
       
        })
       
      }
    },

    getirtarih: function (tarih) {
      $("area").mapster("deselect");
      axios
        .get(`http://localhost/api/appointment-table/${tarih}`)
        .then((res) => {
          this.secilimasalar = res.data;
          res.data.map(function (value, index) {
            $("img").mapster("set", true, value.title);
          });
        });
    },

    secimekle: function (e) {
      let chech = true;
      jQuery.map(this.secilimasalar, function (n, i) {
        jQuery.map(n.title.split(","), function (x, i) {
          if (e.currentTarget.title.trim() == x.trim()) chech = false;
        });
      });
      if (chech) {
        var bulmasa1 = jQuery.inArray(e.currentTarget.title, this.masaekle);

        if (bulmasa1 < 0) {
          this.masaekle.push(e.currentTarget.title);
        } else {
          var index = this.masaekle.indexOf(e.currentTarget.title);
          if (index > -1) {
            this.masaekle.splice(index, 1);
          }
        }
      }
      else{
         this.sonuc = true;
      }
      $("area").mapster("deselect");
      this.selectDate();

      $("img").mapster("set", true, this.masaekle.toString());
    },

    modalShow: function (e) {
      this.showModalId = this.masaekle;
      this.showModal = true;
    },
    notBeforeToday(date) {
      return date < new Date(new Date().setHours(0, 0, 0, 0));
    },
    addimgAll: function (e) {
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
        $("#image").mapster("set", true, e.currentTarget.title);
      } else {
        $("#image").mapster("set", false, e.currentTarget.title);
      }
    },
    openModal: function (id) {
      this.showModalId = id;
      this.showModal = true;
    },
    selectDate: function () {
      var gelentarih = this.date.toLocaleDateString();
      var gidentarih = gelentarih.split(".");
      var gonder = gidentarih[2] + "-" + gidentarih[1] + "-" + gidentarih[0];

      this.getirtarih(gonder);
    },
  },
};
</script>
