
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
      v-if="showModal"
      :modalId="showModalId"
      :kisi="modalveri"
      :secimsaat="secilisaat"
      :secimtarih="secilitarih"
      @close="showModal = false"
    ></admin-rezervation-update-modal>
    <admin-confirm-modal
      v-if="showConfirm"
      :kisi="confid"
      @close="showConfirm = false"
    ></admin-confirm-modal>
  </div>
</template>

<script>
require("bootstrap4-toggle");

var socket = io("http://localhost:3000");
export default {
  props: ["data"],

  data() {
    return {
      showModalId: 0,
      showModal: false,
      showConfirm: false,
      modalveri: [],
      secimtarih: null,
      secilitarih: null,
      secilisaat: null,
      date1: null,
      date2: null,
      kontrolDurum: null,
      kontrolId: null,
      confid: null,
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
            var yes = null;
            var geldi = null;
            var icerik;
            var dt = row.date.substring(0, 10).split(".");
            var nt1 = new Date().toLocaleString().split(" ");
            var nt2=nt1[0].split(".");
           
        
            if (new Date(dt[2],dt[1],dt[0]) > new Date(nt2[2],nt2[1],nt2[0])) 
            icerik="gelecek";
            else if (new Date(dt[2],dt[1],dt[0]) == new Date(nt2[2],nt2[1],nt2[0]))
           
            icerik="geçmiş";
            else {
              let isup = row.isUp;
              if (isup == 0) {
                if (row.isCame == 1) yes = "checked";
                else yes = "";
                if (new Date(dt[2],dt[1],dt[0]) < new Date(nt2[2],nt2[1],nt2[0]))
                  geldi = "disabled";
                
               
                else if (
                  new Date(dt[2],dt[1],dt[0]) > new Date(nt2[2],nt2[1],nt2[0])
                ) {
                  geldi = "";
                } else 
                {if(row.isActive==2)
                  geldi = "disabled";
                 else if (
                    new Date(dt[2],dt[1],dt[0]) ==
                       new Date(nt2[2],nt2[1],nt2[0]) &&
                    row.time < new Date().toTimeString()
                  )
                    geldi = "disabled";
                  else {
                    geldi = "";
                  }
                }
                icerik =
                  '<div class="durumum"><input ' +
                  yes +
                  " " +
                  geldi +
                  ' class="toggle-option durum" type="checkbox" data-toggle="toggle" data-durumId="' +
                  row.app_id +
                  '"></div>';
              } else {
                icerik = "Kalktı";
              }
            }
            return icerik;
          },
        },
        {
          title: "Adı Soyadı",
          footerFormatter: function (data) {
            return data.length;
          },
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
            footerFormatter: function (data) {
            var toplam = data
              .map(function (row) {
                return +row.body;
              })
              .reduce(function (sum, i) {
                return sum + i;
              }, 0);
            return toplam;
          },
        },
        {
          title: "Masa No",
          field: "title",
        },
{
          title: "Kodu",
          field: "code",
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
              var iskalk = "";
              row.isUp == 0 && row.isCame == 1
                ? (iskalk =
                    '<button data-kalkid="' +
                    row.app_id +
                    '"class="btn btn-default kalk"><i class="fa fa-hand-paper-o"></i></button>')
                : (iskalk = "");
              return (
                '<a class="btn btn-default iptal" data-iptalid="' +
                row.app_id +
                '"><i class="fa fa-undo"></i></a><a class="btn btn-default" href="http://localhost/admin/profile/' +
                row.kisi_id +
                '"><i class="fa fa-user"></i></a><button data-userid="' +
                row.app_id +
                '" class="btn btn-default rezervguncelle" ><i class="fa fa-pencil-square-o" alt="Güncelle"></i> </button><button data-confirmid="' +
                row.app_id +
                '"class="btn btn-default confirm"><i class="fa fa-check"></i></button>' +
                iskalk
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
        showFooter: true,
        pagination: true,
        detailView: true,
        sidePagination: "client",
        showFullscreen: true,
        showToggle: true,
        width: 200,
        pageList: "[10, 25, 50, 100, 200, All]",

        detailFormatter: function (index, row) {
          return (
            "<div class='text-center' style='text-align:center; margin-left:50px!important;'><table class='table table-bordered table-hover'><thead>" +
            "<th>Mail</th>" +
            "<th>Rezervasyon Notu</th>" +
            "<th>Müşteri Notu</th>" +
            "<th>Masa Süsleme</th>" +
            "<th>Confirm</th>" +
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
            (row.susleme == 1 ? row.susleme_notu : "yok") +
            "</td>" +
            "<td>" +
            (row.notification_type == 1 ? "Oldu" : "Olmadı") +
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
          // if (row.isCame == 0) {
          if (row.isGone == 1) {
            return {
              css: { color: "black", "background-color": "white" },
            };
          } else {
            if (row.color == 2) {
              return {
                css: { color: "black", "background-color": "orange" },
              };
            } else if (row.color == 1) {
              return {
                css: { color: "white", "background-color": "green" },
              };
            } else if (row.color == 3) {
              return {
                css: { color: "black", "background-color": "white" },
              };
            } else {
              return {
                css: { color: "black", "background-color": "white" },
              };
            }
          }
          //  }
        },
      },
    };
  },
  components: {
    BootstrapTable,
  },

  mounted() {
    var ref = this;
    socket.on("rowupdate", (cid) => {
      var id = $("#row" + cid).val();

      var mylength = 0;
      $("#row" + cid + ":first")
        .find("td,th")
        .each(function () {
          var colspan = $(this).attr("colspan");
          if (typeof colspan !== "undefined" && colspan > 0) {
            mylength += parseInt(colspan);
          } else {
            mylength += 1;
          }
        });

      $("#row" + cid).html(
        '<td colspan="' +
          mylength +
          '"><div class="alert alert-danger alert-dismissible">' +
          '<button type="button" class="close alertclose"' +
          ' data-cid="' +
          cid +
          '" data-dismiss="alert" aria-hidden="true">×</button>' +
          '<h5><i class="icon fa fa-exclamation-triangle"></i> Uyarı!</h5>' +
          "Rezervasyonun zamanı geçmiştir." +
          "</div></td>"
      );
      // $("#"+id).prepend('<button type="button" class="close" data-dismiss="alert" aria-label="Close">\n' +
      //     '  <span aria-hidden="true">&times;</span>\n' +
      //     '</button>');
    });

    $(document).on("click", ".alertclose", function () {
      var id = $(this).data("cid");
      var icerik = "";
      axios.get(`http://localhost/api/admin/all/` + id).then((res) => {
        icerik =
          '<td><a class="detail-icon" href="#"><i class="fa fa-plus"></i></a</td>' +
          '<td style="color: black; background-color: orange; ">1</td>' +
          '<td style="color: black; background-color: orange; ">' +
          '<div class="durumum"><div class="toggle btn btn-danger off btn-lg font-size: 10px disabled" data-toggle="toggle" role="button" disabled="disabled" style="width: 85px; height: 30px;"><input disabled="" class="toggle-option durum" type="checkbox" data-toggle="toggle" data-durumid="' +
          res.data[0].app_id +
          '"><div class="toggle-group"><label for="" class="btn btn-success btn-lg toggle-on" style="line-height: 27.0375px;">Evet</label><label for="" class="btn btn-danger btn-lg toggle-off" style="line-height: 27.0375px;">Hayır</label><span class="toggle-handle btn btn-light btn-lg"></span></div></div></div></td>' +
          '<td style="color: black; background-color: orange; ">' +
          res.data[0].fullName +
          "</td>" +
          '<td style="color: black; background-color: orange; ">' +
          res.data[0].phone +
          '</td><td style="color: black; background-color: orange; ">' +
          res.data[0].date +
          "</td>" +
          '</td><td style="color: black; background-color: orange; ">' +
          res.data[0].time +
          "</td>" +
          '<td style="color: black; background-color: orange; ">' +
          res.data[0].body +'</td><td style="color: black; background-color: orange; ">' +
          res.data[0].title +'</td><td style="color: black; background-color: orange; ">' +
          res.data[0].code +'</td><td style="color: black; background-color: orange; "><a class="btn btn-default iptal" data-iptalid="' +
          res.data[0].app_id +
          '"><i class="fa fa-undo"></i></a><a class="btn btn-default" href="http://localhost/admin/profile/' +
          res.data[0].kisi_id +
          '"><i class="fa fa-user"></i></a><button data-userid="' +
          res.data[0].app_id +
          '" class="btn btn-default rezervguncelle"><i class="fa fa-pencil-square-o" alt="Güncelle"></i> </button></td>';

        $("#row" + id).html(icerik);
      });
      $("#table").bootstrapTable();
    });

    $(document).on("click", ".rezervguncelle", function () {
      var id = $(this).data("userid");

      ref.getir(id);
    });
    $(document).on("click", ".kalk", function () {
      var id = $(this).data("kalkid");
      Swal.fire({
        title: "Müşteriyi kalktı olarak onaylıyor musunuz?",
        text:
          "Müşteri kalktı olarak işaretlenecek ve masa boş duruma getirelecektir.",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Evet, onaylıyorum!",
      }).then((result) => {
        if (result.isConfirmed) {
          axios.post(`http://localhost/api/admin/process`, {
            csrf_token: document
              .querySelector('meta[name="csrf-token"]')
              .getAttribute("content"),
            kalkan: 1,
            id: id,
            user_id: $("#logidUserid").text(),
          })  .then((res) => {
            ref.$emit("ustgonder");
             Swal.fire("Müşteri kalktı!", "Masa boş olarak ayarlandı.", "success");
          });

        
          
        }
      });
     
    });
    $(document).on("click", ".confirm", function () {
      ref.confid = $(this).data("confirmid");

      ref.showConfirm = true;
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
          axios.post(`http://localhost/api/admin/process`, {
            csrf_token: document
              .querySelector('meta[name="csrf-token"]')
              .getAttribute("content"),
            type: 1,
            id: geriid,
            user_id: $("#logidUserid").text(),
          })  .then((res) => {

          Swal.fire("Geri Alındı!", "Rezervasyon geri alındı.", "success");
          ref.$emit("ustgonder");
          })
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
                ref.$emit("ustgonder");
              });
            Swal.fire("İptal Edildi!", "Rezervasyon iptal edildi.", "success");
          }
        });
      });
  },

  methods: {
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
      $(".durumum").on("click", ".toggle", function (e) {
        let box = $(this).children(0);
        let durum = box.prop("checked") ? false : true;
        let durumid = box.data("durumid");

        e.preventDefault();
        e.stopPropagation();
        if ($(this).attr("disabled") != "disabled") {
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
              axios
                .post(`http://localhost/api/admin/process`, {
                  csrf_token: document
                    .querySelector('meta[name="csrf-token"]')
                    .getAttribute("content"),
                  came: 1,
                  id: durumid,
                  state: durum,
                  user_id: $("#logidUserid").text(),
                })
                .then((res) => {
                  Swal.fire(
                    "Müşteri Geldi!",
                    "Müşteri geldi olarak kayıt edildi.",
                    "success"
                  );
                  ref.$emit("ustgonder");
                });
            }
          });
        }
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
