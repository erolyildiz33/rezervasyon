<template>
  <div>
    <div id="toolbar">
     
    </div>
    <div class="panel-body mt-3">
      
      <bootstrap-table
        :columns="columns"
        :data="data"
        id="table"
        :options="options"
        @on-pre-body="YuklemeSonrasi"
      ></bootstrap-table>
    </div>
  </div>
</template>
<script>
export default {

  props: ["data","bugun"],
   components: {
    BootstrapTable,
  },
  data() {
    return {
      showModalId: 0,
      showModal: false,
      modalveri: [],
      secimtarih: null,
      secilitarih: null,
      secilisaat: null,
      date1: new Date().toDateString(),
      date2: new Date().toDateString(),
      kontrolDurum: null,
      kontrolId: null,
      raporsecim: 0,

      columns: [
        {
          title: "Sıra No",
          formatter: function (value, row, index) {
            return index + 1;
          },
        },
        {
          title: "Adı Soyadı",
          filterControl: "input",
          field: "fullName",
          footerFormatter: function (data) {
            return data.length;
          },
        },
        {
          title: "Mail",
          filterControl: "input",
          field: "email",
        },
        {
          title: "Telefon No",
          filterControl: "input",
          width: "200",
          field: "tel",
        },
        {
          title: "Rezervasyon Tarihi",

          filterControl: "select",
          field: "date",
        },
        {
          title: "Masa No",
          filterControl: "select",
          field: "title",
        },
        
        {
          title: "Kaç Kişi",
          field: "body",
          footerFormatter: function (data) {
            var toplam = data
              .map(function (row) {
                return +row.body;
              })
              .reduce(function (sum, i) {
                return sum + i;
              }, 0);
            return toplam + " Kişi";
          },
        },
        

      ],
      options: {
        search: true,
        showColumns: true,
        showExport: true,
        pagination: true,
        showFooter: true,
        filterControl: true,
        searchClearButton: true,
        showFullscreen: true,
        showToggle: true,
        exportTypes: ["excel", "pdf"],
        paginationVAlign: "both",
        sidePagination: "client",
        pageList: "[10, 25, All]",

        excelStyles: [
          "background-color",
          "color",
          "border-bottom-color",
          "border-bottom-style",
          "border-bottom-width",
          "border-top-color",
          "border-top-style",
          "border-top-width",
          "border-left-color",
          "border-left-style",
          "border-left-width",
          "border-right-color",
          "border-right-style",
          "border-right-width",
          "font-family",
          "font-size",
          "font-weight",
        ],
          responseHandler(res) {
          res.rows.forEach((row) => {
            row._name = "deneme";
          });
          return res;
        },
      },
    };
  },
 
  created() {
    this.tumkayit();
    console.log(this.bugun);
  },

  methods: {
    YuklemeSonrasi: function () {
      var ref = this;
    
    },
    tumkayit: function () {
      axios.get(`http://localhost/api/table-rapor-list`).then((res) => {
        this.data1 = res.data;
        this.showModal = false;
      });
    },

    getir: function (id) {
      axios.get(`http://localhost/api/table-rapor-list/` + id).then((res) => {
        this.kisi = res.data;
        this.showModal = true;
      });
    },
    gelen(id) {
      this.removeTable(id["id"], id["index"]);
    },
    uploadImage(e) {
      const image = e.target.files[0];
      const reader = new FileReader();
      reader.readAsDataURL(image);
      reader.onload = (e) => {
        this.previewImage = e.target.result;
        this.SelectPhoto = false;
      };
    },
    showForm: function () {
      this.isShow = !this.isShow;
    },

    addTable: function () {
      axios
        .post(`http://localhost/api/table-store`, {
          ad: this.ad,
          soyad: this.soyad,
          email: this.email,
          tel: this.tel,
          notu: this.notu,
          image: this.previewImage,
          iptal: this.iptal,
          dogumtar:
            this.date != "" ? new Date(this.date).toLocaleDateString() : "",
          evliliktar:
            this.date1 != "" ? new Date(this.date1).toLocaleDateString() : "",
          misafir_id: this.secim,
          karaliste: this.secim1,
          cinsiyet: this.secim2,
          karaliste_gerekce: this.gerekce,
          user_id: $("#logidUserid").text(),
        })
        .then((res) => {
          this.data1 = res.data;
          this.inputTable = "";
        });
    },
    search() {
      if (this.date1)
        if (this.raporsecim == 0)
          this.$refs.list.filterBy({
            date: this.getDates(this.date1, this.date2),
          });
        else if (this.raporsecim == 1)
          this.$refs.list.filterBy({
            dogumtar: this.getDates(this.date1, this.date2),
          });
        else if (this.raporsecim == 2)
          this.$refs.list.filterBy({
            evliliktar: this.getDates(this.date1, this.date2),
          });
    },

    getDates: function (startDate, stopDate) {
      var dateArray = [];
      var currentDate = this.$moment(startDate);
      var stopDate = this.$moment(stopDate);
      while (currentDate <= stopDate) {
        dateArray.push(this.$moment(currentDate).format("YYYY-MM-DD"));
        currentDate = this.$moment(currentDate).add(1, "days");
      }
      return dateArray;
    },
    inputcheck: function () {
      var my = this.inputTable;
      if (my.length > 0) {
        var check = this.masalar.filter(function (elm) {
          if (elm.ad == my) {
            return elm;
          }
        });
        if (!check.length > 0) {
          this.isDisable = false;
        } else {
          this.isDisable = true;
        }
      } else {
        this.isDisable = true;
      }
    },
  },
};
</script>