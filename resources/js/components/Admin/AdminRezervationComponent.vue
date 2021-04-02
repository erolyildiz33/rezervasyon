<template>
  <div>
    <div class="container">
      <div class="row">
      
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

       <img src="/renkli.jpg" usemap="#image-map">

<map name="image-map">
    <area data-key=""
            @click="modalShow" alt="b-kb-1" title="b-kb-1" href="" coords="216,468,233,486" shape="rect">
    <area data-key=""
         @click="modalShow" alt="b-kb-2" title="b-kb-2" href="" coords="177,447,193,453,183,482,167,474,167,472,167,473,167,472" shape="poly">
    <area data-key=""
            @click="modalShow" alt="b-kb-3" title="b-kb-3" href="" coords="133,429,148,440,138,453,124,442" shape="poly">
    <area data-key=""
            @click="modalShow" alt="b-kb-4" title="b-kb-4" href="" coords="117,381,147,399" shape="rect">
    <area data-key=""
            @click="modalShow" alt="b-kb-5" title="b-kb-5" href="" coords="115,325,144,340" shape="rect">
    <area data-key=""
            @click="modalShow" alt="b-kb-6" title="b-kb-6" href="" coords="147,270,161,261,177,282,163,293" shape="poly">
    <area data-key=""
            @click="modalShow" alt="b-kb-7" title="b-kb-7" href="" coords="210,244,228,274" shape="rect">
    <area data-key=""
            @click="modalShow" alt="b-kb-8" title="b-kb-8" href="" coords="200,292,244,311" shape="rect">
    <area data-key=""
            @click="modalShow" alt="b-kb-9" title="b-kb-9" href="" coords="198,342,244,359" shape="rect">
    <area data-key=""
            @click="modalShow" alt="b-kb-10" title="b-kb-10" href="" coords="159,379,189,398" shape="rect">
    <area data-key=""
            @click="modalShow" alt="b-kb-11" title="b-kb-11" href="" coords="159,319,189,342" shape="rect">
    <area data-key=""
            @click="modalShow" alt="m-ö-i-13" title="m-ö-i-13" href="" coords="296,401,316,444" shape="rect">
    <area data-key=""
            @click="modalShow" alt="m-ö-i-14" title="m-ö-i-14" href="" coords="345,415,362,442" shape="rect">
    <area data-key=""
            @click="modalShow" alt="m-ö-i-15" title="m-ö-i-15" href="" coords="394,415,412,442" shape="rect">
    <area data-key=""
            @click="modalShow" alt="m-ö-s-16" title="m-ö-s-16" href="" coords="266,458,283,479" shape="rect">
    <area data-key=""
            @click="modalShow" alt="m-ö-s-17" title="m-ö-s-17" href="" coords="308,458,326,481" shape="rect">
    <area data-key=""
            @click="modalShow" alt="m-ö-s-18" title="m-ö-s-18" href="" coords="351,458,368,482" shape="rect">
    <area data-key=""
            @click="modalShow" alt="m-ö-s-19" title="m-ö-s-19" href="" coords="396,458,413,479" shape="rect">
    <area data-key=""
            @click="modalShow" alt="s-b-i-20" title="s-b-i-20" href="" coords="453,458,470,487" shape="rect">
    <area data-key=""
            @click="modalShow" alt="s-b-i-21" title="s-b-i-21" href="" coords="453,420,473,435" shape="rect">
    <area data-key=""
            @click="modalShow" alt="s-b-i-22" title="s-b-i-22" href="" coords="453,387,472,403" shape="rect">
    <area data-key=""
            @click="modalShow" alt="s-b-i-30" title="s-b-i-30" href="" coords="503,457,521,487" shape="rect">
    <area data-key=""
            @click="modalShow" alt="s-b-i-31" title="s-b-i-31" href="" coords="502,420,523,435" shape="rect">
    <area data-key=""
            @click="modalShow" alt="s-b-i-32" title="s-b-i-32" href="" coords="502,387,521,403" shape="rect">
    <area data-key=""
            @click="modalShow" alt="s-b-i-40" title="s-b-i-40" href="" coords="551,458,569,486" shape="rect">
    <area data-key=""
            @click="modalShow" alt="s-b-i-41" title="s-b-i-41" href="" coords="549,419,570,435" shape="rect">
    <area data-key=""
            @click="modalShow" alt="s-b-i-42" title="s-b-i-42" href="" coords="549,387,569,404" shape="rect">
    <area data-key=""
            @click="modalShow" alt="s-b-i-50" title="s-b-i-50" href="" coords="599,457,618,485" shape="rect">
    <area data-key=""
            @click="modalShow" alt="s-b-i-51" title="s-b-i-51" href="" coords="599,419,617,433" shape="rect">
    <area data-key=""
            @click="modalShow" alt="s-b-i-52" title="s-b-i-52" href="" coords="598,388,620,403" shape="rect">
    <area data-key=""
            @click="modalShow" alt="s-ö-i-60" title="s-ö-i-60" href="" coords="646,454,665,486" shape="rect">
    <area data-key=""
            @click="modalShow" alt="s-ö-i-61" title="s-ö-i-61" href="" coords="647,417,668,435" shape="rect">
    <area data-key=""
            @click="modalShow" alt="s-ö-i-62" title="s-ö-i-62" href="" coords="646,386,668,402" shape="rect">
    <area data-key=""
            @click="modalShow" alt="s-ö-i-70" title="s-ö-i-70" href="" coords="697,458,713,486" shape="rect">
    <area data-key=""
            @click="modalShow" alt="s-ö-i-71" title="s-ö-i-71" href="" coords="695,419,718,436" shape="rect">
    <area data-key=""
            @click="modalShow" alt="s-ö-i-72" title="s-ö-i-72" href="" coords="694,387,714,402" shape="rect">
    <area data-key=""
            @click="modalShow" alt="s-ö-i-80" title="s-ö-i-80" href="" coords="742,470,764,487" shape="rect">
    <area data-key=""
            @click="modalShow" alt="s-ö-i-81" title="s-ö-i-81" href="" coords="747,421,768,446" shape="rect">
    <area data-key=""
            @click="modalShow" alt="s-ö-i-82" title="s-ö-i-82" href="" coords="746,387,768,402" shape="rect">
    <area data-key=""
            @click="modalShow" alt="s-ö-i-90" title="s-ö-i-90" href="" coords="791,468,813,486" shape="rect">
    <area data-key=""
            @click="modalShow" alt="s-ö-i-91" title="s-ö-i-91" href="" coords="795,421,818,451" shape="rect">
    <area data-key=""
            @click="modalShow" alt="s-ö-i-92" title="s-ö-i-92" href="" coords="795,388,816,403" shape="rect">
    <area data-key=""
            @click="modalShow" alt="s-ö-i-100" title="s-ö-i-100" href="" coords="834,469,854,485" shape="rect">
    <area data-key=""
            @click="modalShow" alt="m-ö-i-110" title="m-ö-i-110" href="" coords="889,417,908,446" shape="rect">
    <area data-key=""
            @click="modalShow" alt="m-ö-i-111" title="m-ö-i-111" href="" coords="889,384,908,413" shape="rect">
    <area data-key=""
            @click="modalShow" alt="m-ö-i-112" title="m-ö-i-112" href="" coords="889,347,910,361" shape="rect">
    <area data-key=""
            @click="modalShow" alt="m-ö-i-120" title="m-ö-i-120" href="" coords="936,419,957,444" shape="rect">
    <area data-key=""
            @click="modalShow" alt="m-ö-i-121" title="m-ö-i-121" href="" coords="937,387,956,415" shape="rect">
    <area data-key=""
            @click="modalShow" alt="m-ö-i-122" title="m-ö-i-122" href="" coords="936,348,955,359" shape="rect">
    <area data-key=""
            @click="modalShow" alt="m-ö-i-130" title="m-ö-i-130" href="" coords="984,418,1006,443" shape="rect">
    <area data-key=""
            @click="modalShow" alt="m-ö-i-131" title="m-ö-i-131" href="" coords="985,384,1003,412" shape="rect">
    <area data-key=""
            @click="modalShow" alt="m-ö-i-132" title="m-ö-i-132" href="" coords="984,347,1007,360" shape="rect">
    <area data-key=""
            @click="modalShow" alt="m-ö-s-133" title="m-ö-s-133" href="" coords="885,460,904,483" shape="rect">
    <area data-key=""
            @click="modalShow" alt="m-ö-s-134" title="m-ö-s-134" href="" coords="927,462,945,483" shape="rect">
    <area data-key=""
            @click="modalShow" alt="m-ö-s-135" title="m-ö-s-135" href="" coords="971,462,990,483" shape="rect">
    <area data-key=""
            @click="modalShow" alt="m-ö-s-136" title="m-ö-s-136" href="" coords="1015,461,1034,482" shape="rect">
    <area data-key=""
            @click="modalShow" alt="d-kb-150" title="d-kb-150" href="" coords="1069,333,1098,353" shape="rect">
    <area data-key=""
            @click="modalShow" alt="d-kb-151" title="d-kb-151" href="" coords="1107,332,1136,353" shape="rect">
    <area data-key=""
            @click="modalShow" alt="d-kb-152" title="d-kb-152" href="" coords="1147,332,1175,354" shape="rect">
    <area data-key=""
            @click="modalShow" alt="d-kb-153" title="d-kb-153" href="" coords="1069,391,1096,413" shape="rect">
    <area data-key=""
            @click="modalShow" alt="d-kb-154" title="d-kb-154" href="" coords="1107,392,1136,411" shape="rect">
    <area data-key=""
            @click="modalShow" alt="d-kb-155" title="d-kb-155" href="" coords="1148,392,1176,414" shape="rect">
    <area data-key=""
            @click="modalShow" alt="d-kb-156" title="d-kb-156" href="" coords="1116,447,1135,434,1151,458,1134,469" shape="poly">
    <area data-key=""
            @click="modalShow" alt="d-kb-157" title="d-kb-157" href="" coords="1070,467,1090,482" shape="rect">
    <area data-key=""
            @click="modalShow" alt="d-kb-158" title="d-kb-158" href="" coords="1069,443,1089,458" shape="rect">
</map>

         <admin-rezervation-update-modal
     
      v-if="showModal"
      :modalId="showModalId"
      :kisi="kisiback"
     
      :secimsaat="secilisaat"
      :secimtarih="secilitarih"
      @close="showModal = false"
    ></admin-rezervation-update-modal>
      </div>
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
      secilitarih:null,
      secilisaat:null,
      user: null,
      date: new Date(),
      gettar: new Date(),
    };
  },

 created() {
   console.log()

    this.getirtarih(this.selectDate());
  },

  mounted() {



    $("img").mapster({
      mapKey: "title",
      singleSelect: false,
      fillColor: "00ffee",
      fillOpacity: 1,
      stroke: false,
      isSelectable: false,
    });



  },
  methods: {
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
    modalShow: function (e) {
      var item = this.secilimasalar.find(
        (item) => item.title == e.currentTarget.title
      );
      if (item) {
      } else {
     this.showModalId=e.currentTarget.title
    this.kisiback=this.userid[0]
     
      this.secilisaat=this.userid[0].time
      this.secilitarih=this.date
    this.showModal=true
      
      }
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
