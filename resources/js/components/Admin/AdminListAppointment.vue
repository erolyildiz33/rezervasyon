 
<template>
  <div>
    <div id="toolbar">
      <div class="form-inline" role="form">
        <div class="form-group">
          <input v-model="date1" class="form-control w70" type="date" />
          <span>tarihi ile </span>
        </div>
        <div class="form-group">
          <input v-model="date2" class="form-control w70" type="date" />
          <span>tarihi arası </span>
        </div>
        <button id="ok" @click="search()" class="btn btn-primary">
          Listele
        </button>
      </div>
    </div>

    <div class="row">
      <div id="table" class="col-md-12">
        <bootstrap-table
          ref="list"
          :columns="columns"
          :data="data"
          :options="options"
          @on-post-body="YuklemeSonrasi"
        >
        </bootstrap-table>
      </div>
    </div>

    <admin-rezervation-update-modal
      @kisiguncel="gelenguncel"
      v-if="showModal"
      :modalId="showModalId"
      :kisi="modalveri"
      :secilimi="false"
      :secimsaat="secilisaat"
      :secimtarih="secilitarih"
      @close="showModal = false"
    ></admin-rezervation-update-modal>
  </div>
</template>

<script>
require("bootstrap4-toggle");
export default {
  props: ["data"],

  data() {
    return {
      showModalId: 0,
      showModal: false,
      modalveri: [],
      secimtarih: null,
      secilitarih: null,
      secilisaat: null,
      date1: null,
      date2: null,
      kontrolDurum: null,
      kontrolId: null,
      columns: [
        {
          title: "Sıra No",
          formatter: function (value, row, index) {
            return index + 1;
          },
        },
        {
          title: "Geldi mi?",
          formatter: function (value, row, index) {
            console.log(row.date);
            console.log(new Date().toISOString().substring(0, 10));
            var yes = null;
            var geldi=null;
            if (row.isCame == 1) yes = "checked";
            else yes = "";
            if(row.date<new Date().toISOString().substring(0, 10)) geldi="disabled"
            else if(row.date>new Date().toISOString().substring(0, 10)){
            geldi=""
            }
            else{
              if(row.date==new Date().toISOString().substring(0, 10) && row.time<new Date().toTimeString()) geldi="disabled"
              else{
                geldi=""
              }
              
            }
            return (
              '<input type="checkbox"' +
              yes + " " + geldi +
              ' class="durum" data-durumId="' +
              row.app_id +
              '">'
            );
          },
        },
        {
          title: "Adı Soyadı",
          field: "fullName",
        },
        {
          title: "Telefon",
          field: "phone",
        },

        {
          title: "Tarih",
          field: "date",
        },
        {
          title: "Saat",
          field: "time",
        },
        {
          title: "Kişi",
          field: "body",
        },
        {
          title: "Masa No",
          field: "title",
        },

        {
          title: "İşlem",
          formatter: (value, row) => {
            if (row.isActive == 0) {
              return (
                '<a class="btn btn-default" href="http://localhost/api/admin/process/1/' +
                row.app_id +
                '"><i class="fa fa-check"></a><a class="btn btn-default" href="http://localhost/api/admin/process/2/' +
                row.app_id +
                '"><i class="fa fa-cancel"></i></a>'
              );
            } else if (row.isActive == 1) {
              return (
                '<a class="btn btn-default iptal" data-iptalid="' +
                row.app_id +
                '"><i class="fa fa-undo"></i></a><a class="btn btn-default" href="http://localhost/admin/profile/' +
                row.kisi_id +
                '"><i class="fa fa-user"></i></a><button data-userid="' +
                row.app_id +
                '" class="btn btn-default rezervguncelle" ><i class="fa fa-pencil-square-o" alt="Güncelle"></i> </button>'
              );
            } else if (row.isActive == 2) {
              return (
                '<span class="bg-danger">İptal Edilen</span><button class="btn btn-default rezervdengerial" data-gerial="' +
                row.app_id +
                '"><i class="fa fa-undo"></button>'
              );
            }

            if (row.isActive == 1) {
              return (
                '<a class="btn btn-default" href="http://localhost/api/admin/process/2/' +
                row.app_id +
                '">İptal Et</a>'
              );
            } else if (row.isActive == 1) {
              return '<span class="bg-green">Onaylı</span>';
            } else if (row.isActive == 2) {
              return '<span class="bg-danger">İptal Edilen</span>';
            }
          },
        },
      ],
      options: {
        search: true,
        showColumns: true,
        virtualScroll: true,
        showExport: true,
        pagination: true,
        detailView: true,
        sidePagination: "client",
        width: 200,
        pageList: "[10, 25, 50, 100, 200, All]",
        detailFormatter: function (index, row) {
          return (
            "<div class='text-center' style='text-align:center; margin-left:50px!important;'><table class='table table-bordered table-hover'><thead>" +
            "<th>Mail</th>" +
            "<th>Rezervasyon Notu</th>" +
            "<th>Müşteri Notu</th>" +
            "<th>Bildirim Türü</th>" +
            "<th>Müşteri Türü</th>" +
            "</thead><tbody><tr>" +
            "<td>" +
            row.email +
            "</td>" +
            "<td>" +
            row.text +
            "</td>" +
            "<td>" +
            row.notu +
            "</td>" +
            "<td>" +
            (row.notification_type == 1 ? "Email" : "SMS") +
            "</td>" +
            "<td>" +
            (row.misafir_id == 0 ? "Yerel" : "Otel") +
            "</td>" +
            "</tr></tbody></table></div>"
          );
        },
        rowStyle: function (row) {
          if (row.isGone == 2) {
            return {
              css: { color: "black", "background-color": "red" },
            };
          } else if (row.isGone == 1) {
            return {
              css: { color: "white", "background-color": "orange" },
            };
          } else if (row.isGone == 3) {
            return {
              css: { color: "white", "background-color": "green" },
            };
          } else {
            return {
              css: { color: "black", "background-color": "white" },
            };
          }
        },
      },
    };
  },
  components: {
    BootstrapTable,
  },

  created() {
    if (this.$session.has("secimmasa")) {
      this.showModalId = this.$session.get("secimmasa");
      this.modalveri = this.$session.get("kisi");
      this.secilitarih = this.$session.get("secimtarih");
      this.secilisaat = this.$session.get("secimsaat");
      this.showModal = true;
      this.$session.clear();
    }
  },
  mounted() {
    var ref = this;

    $(document).on("click", ".rezervguncelle", function () {
      var id = $(this).data("userid");

      ref.getir(id);
    });
 


    $(document).on("click", ".rezervdengerial", function () {
      var geriid = $(this).data("gerial");
      Swal.fire({
        title: "Rezervasyonu geri almak istiyor musunuz?",
        text:
          "Geri aldığınız rezervasyonu, Günü gelen veya Gelecek rezervasyonlar bölümünde görebilirsiniz!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Evet, istiyorum!",
      }).then((result) => {
        if (result.isConfirmed) {
          axios
            .post(`http://localhost/api/admin/process`, {
              csrf_token: document
                .querySelector('meta[name="csrf-token"]')
                .getAttribute("content"),
              type: 1,
              id: geriid,
              user_id: $("#logidUserid").text(),
            })
            .then((res) => {});

          Swal.fire("Geri Alındı!", "Rezervasyon geri alındı.", "success");
        }
      });
    }),
      $(document).on("click", ".iptal", function () {
        var iptalid = $(this).data("iptalid");
        Swal.fire({
          title: "Rezervasyonu iptal etmek istiyor musunuz?",
          text:
            "İptal ettiğiniz rezervasyonu, iptal edilen rezervasyonlar bölümünden geri alabilirsiniz!",
          icon: "warning",
          showCancelButton: true,
          confirmButtonColor: "#3085d6",
          cancelButtonColor: "#d33",
          confirmButtonText: "Evet, istiyorum!",
        }).then((result) => {
          if (result.isConfirmed) {
            axios
              .post(`http://localhost/api/admin/process`, {
                csrf_token: document
                  .querySelector('meta[name="csrf-token"]')
                  .getAttribute("content"),
                type: 2,
                id: iptalid,
                user_id: $("#logidUserid").text(),
              })
              .then((res) => {
                this.$emit("ustgonder", res);
              });

            Swal.fire("İptal Edildi!", "Rezervasyon iptal edildi.", "success");
          }
        });
      });
  },
  watch: {
    kontrolDurum: function (newValue, oldValue) {
      console.log(newValue+"-"+oldValue);
      axios
        .post(`http://localhost/api/admin/process`, {
          csrf_token: document
            .querySelector('meta[name="csrf-token"]')
            .getAttribute("content"),
          came: newValue == true ? 1 : 0,
          id: this.kontrolId,
          user_id: $("#logidUserid").text(),
        })
        .then((res) => {});
      this.$emit("ustgonder");
    },
  },
  methods: {
    bas: function (e) {
    
      Swal.fire({
        title: "Müşteri durumu Geldi olarak değiştirelecektir?",
        text:
          "Uyarı !!!Müşteri durumunu değiştirdiğinizde durumu tekrar değiştiremezsiniz!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Evet, istiyorum!",
      }).then((result) => {
        if (result.isConfirmed) {
          this.kontrolDurum = e.prop("checked");
          this.kontrolId = e.data("durumid");
         
        }
       else{
        this.gelenguncel();

       }

        /*    axios
          .post(`http://localhost/api/admin/process`, {
            csrf_token: document
              .querySelector('meta[name="csrf-token"]')
              .getAttribute("content"),
            gone: $(this).prop("checked")==true?1:2,
            id: $(this).data("durumid"),
            user_id: $("#logidUserid").text(),
          })
          .then((res) => {
       // ref.$emit("ustgonder",res.data);
         
          });
       ref.gelenguncel();
        Swal.fire("Geri Alındı!", "Rezervasyon geri alındı.", "success"); 
       */
      });
    },
    YuklemeSonrasi: function () {
      var ref = this;

      $(".durum").bootstrapToggle({
        on: "Evet",
        off: "Hayır",
        onstyle: "success",
        offstyle: "danger",
        size: "lg",
        width: "85",
        height: "30",
        style: "font-size: 10px",

      });
      $('.durum').on("change", function(e) {
      
         ref.bas($(this));
     
  
});
     
       
  
    },
    search() {
      this.$refs.list.filterBy({ date: this.getDates(this.date1, this.date2) });
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
    gelenguncel() {
      this.showModal = false;
      console.log("emit geldi");
      this.$emit("ustgonder");
    },
    getir: function (id) {
      axios.get(`http://localhost/api/admin/all/` + id).then((res) => {
        this.modalveri = res.data[0];

        this.showModal = true;
      });
    },
    detay: function (id) {},
    appointmentOkey: function (id) {
      axios
        .post(`http://localhost/api/admin/process`, {
          type: 1,
          id: id,
        })
        .then((res) => {});
    },
    appointmentCancel: function (id) {
      axios
        .post(`http://localhost/api/admin/process`, {
          type: 2,
          id: id,
        })
        .then((res) => {});
    },
    openModal: function (id) {
      this.showModalId = id;
      this.showModal = true;
    },
  },
};
</script>
