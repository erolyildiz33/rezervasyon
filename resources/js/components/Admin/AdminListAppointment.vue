 
<template>
  <div>
    <div class="row">
      <div id="table">
        <bootstrap-table
          :columns="columns"
          :data="data"
          :options="options"
        ></bootstrap-table>
      </div>
    </div>

    <admin-rezervation-update-modal
      @kisiguncel="gelenguncel(data)"
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

      columns: [
        {
          title: "Sıra No",
          formatter: function (value, row, index) {
            return index + 1;
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
          title: "Mail",
          field: "email",
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
          title: "Rezervasyon Notu",
          field: "text",
        },
        {
          title: "Kişi Notu",
          field: "notu",
        },
        {
          title: "Bildirim Türü",
          formatter: function (value, row) {
            if (row.notification_type == 1) return "Email";
            else return "SMS";
          },
        },
        {
          title: "Müşteri Türü",
          formatter: function (value, row) {
            if (row.misafir_id == 0) return "Yerel";
            else return "Otel";
          },
        },

        {
          title: "İşlem",
          formatter: (value, row) => {
            if (row.isActive == 0) {
              return (
                '<a class="btn btn-default" href="http://localhost/api/admin/process/1/' +
                row.id +
                '">Onayla</a><a class="btn btn-default" href="http://localhost/api/admin/process/2/' +
                row.id +
                '">İptal Et</a>'
              );
            } else if (row.isActive == 1) {
              return (
                '<a class="btn btn-danger iptal" data-iptalid="' +
                row.id +
                '">İptal Et</a><a class="btn btn-info" href="http://localhost/admin/profile/' +
                row.kisi_id +
                '">Profil</a><button data-userid="' +
                row.id +
                '" class="btn btn-success rezervguncelle">Rezervasyon Güncelle</button>'
              );
            } else if (row.isActive == 2) {
              return (
                '<span class="bg-danger">İptal Edilen</span><button class="btn btn-warning rezervdengerial" data-gerial="' +
                row.id +
                '">Geri Al</button>'
              );
            }

            if (row.isActive == 1) {
              return (
                '<a class="btn btn-default" href="http://localhost/api/admin/process/2/' +
                row.id +
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
        showExport: true,
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
            })
            .then((res) => {
              //this.data=res.data
            });

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
              })
              .then((res) => {
                //this.data=res.data
              });

            Swal.fire("İptal Edildi!", "Rezervasyon iptal edildi.", "success");
          }
        });
      });
  },

  methods: {
    gelenguncel(data) {
        this.showModal = false;
    this.$emit("ustgonder");
    
    },
    getir: function (id) {
      axios.get(`http://localhost/api/admin/all/` + id).then((res) => {
        this.modalveri = res.data;

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
