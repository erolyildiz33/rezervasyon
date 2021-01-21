<template>
  <div class="col-md-12">
    <div class="panel panel-default">
      <div class="panel-heading">
        {{ title }}
        <button class="btn btn-secondary" @click="showForm">
          <i class="fa fa-plus"> Yeni Müşteri Ekle</i>
        </button>
      </div>
      <div v-if="isShow" style="padding: 10px">
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
          @click="addTable"
          style="margin-top: 5px"
          class="btn btn-primary"
        >
          Ekle
        </button>
      </div>
      <div class="panel-body">
        <div id="table">
          <bootstrap-table
            :columns="columns"
            :data="data1"
            :options="options"
          ></bootstrap-table>
          <admin-update-modal
            :kisi="kisi[0]"
            v-if="showModal"
            @close="showModal = false"
          ></admin-update-modal>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ["data"],
  data() {
    return {
      showModalId: 0,
      showModal: false,
      kisi: [],
      ad: "",
      soyad: "",
      email: "",
      tel: "",
      notu: "",
      iptal: "",
      gerekce: "",
      SelectPhoto: true,
      previewImage: null,
      isDisable: true,
      isShow: false,
      inputTable: "",
      masalar: [],
      minDate: "",

      date: "",
      minDate1: "",
      date1: "",
      data1: [],
      secim: false,
      secim1: false,
      secim2: false,
      columns: [
        {
          title: "Sıra No",
          formatter: function (value, row, index) {
            return index + 1;
          },
        },
        {
          title: "Adı",
          field: "ad",
        },
        {
          title: "Soyad",
          field: "soyad",
        },
        {
          title: "Cinsiyet",
          formatter: function (value, row) {
            if (row.cinsiyet == 0) return "Erkek";
            else return "Kadın";
          },
        },
        {
          title: "Mail",
          field: "email",
        },
        {
          title: "Tel",
          field: "tel",
        },
        {
          title: "Doğum Tarihi",
          field: "dogumtar",
        },
        {
          title: "Evlilik Tarihi",
          field: "evliliktar",
        },
        {
          title: "Müşteri Notu",
          field: "notu",
        },
        {
          title: "İptal",
          field: "iptal",
        },
        {
          title: "Misafir Tipi",
          formatter: function (value, row) {
            if (row.misafir_id == 0) return "Otel";
            else return "Yerel";
          },
        },
        {
          title: "Karaliste",
          formatter: function (value, row) {
            if (row.karaliste == 0) return "Hayır";
            else return "Evet";
          },
        },
        {
          title: "Karaliste Gerekçesi",
          field: "karaliste_gerekce",
        },
        {
          title: "İşlem",
          formatter: (value, row) => {
            if (row.id != 0) {
              return (
                '<a class="btn btn-success" href="http://localhost/admin/rezerv/' +
                row.id +
                '">Rezervasyon Yap</a><a class="btn btn-info" href="http://localhost/admin/profile/' +
                row.id +
                '">Profil</a><button data-userid="' +
                row.id +
                '" class="btn btn-warning kisiguncelle">Kisi Güncelle</button>'
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
        pagination:true,
        sidePagination:"client",
        pageList:"[10, 25, 50, 100, 200, All]",
      },
    };
  },
  components: {
    BootstrapTable,
  },
  created() {
    axios.get(`http://localhost/api/table-list`).then((res) => {
      this.data1 = res.data;
    });
  },
  props: ["title"],
  watch: {},
  mounted() {
    var ref = this;
    $(document).on("click", ".kisiguncelle", function () {
      var id = $(this).data("userid");

      ref.getir(id);
    });
  },
  methods: {
    
    getir: function (id) {
      axios.get(`http://localhost/api/table-list/` + id).then((res) => {
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
          
        })
        .then((res) => {
          this.data1=res.data;
          this.inputTable = "";
        });
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
<style>
.uploading-image {
  display: flex;
}
</style>
