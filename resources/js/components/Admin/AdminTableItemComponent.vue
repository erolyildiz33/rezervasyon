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
          class="form-control mt-2"
          v-model="ad"
          placeholder="Adı"
        />
        <input
          type="text"
          class="form-control mt-2"
          v-model="soyad"
          placeholder="Soyadı"
        />
        <input
          type="text"
          class="form-control mt-2"
          v-model="email"
          placeholder="Mail"
        />
        <input
          type="text"
          class="form-control mt-2"
          v-model="tel"
          placeholder="Telefon"
          v-mask="'###########'"
        />
        <textarea
          type="text"
          class="form-control mt-2"
          v-model="notu"
          placeholder="Müşteri Tanımı"
        />
       
        <div>
          <label class="mt-2">Özel Gün Bilgileri:</label>
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
            class="mt-2"
          />
        </div>
        <img
          :src="previewImage"
          class="uploading-image picture mt-2"
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
            @kisiguncelle="tumkayit"
           
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
          title: "İşlem",
          formatter: (value, row) => {
            if (row.id != 0) {
              return (
                '<a class="btn btn-default grupmu" data-kisiid="'+row.id+'"><i class="fa fa-phone"></i></a><a class="btn btn-default" href="http://localhost/admin/profile/' +
                row.id +
                '"><i class="fa fa-user"></i></a><button data-userid="' +
                row.id +
                '" class="btn btn-default kisiguncelle"><i class="fa fa-edit"></i></button>'
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
        detailView: true,
         showFullscreen:true,
        showToggle:true,
       
        sidePagination:"client",
        pageList:"[10, 25, 50, 100, 200, All]",
        detailFormatter: function (index, row) {
          return (
            "<div class='text-center' style='text-align:center; margin-left:50px!important;'><table class='table table-bordered table-hover'><thead>" +
           
            "<th>Müşteri Tipi</th>" +
            "<th>Müşteri Notu</th>" +
            "<th>Doğum Tarihi</th>" +
            "<th>Evlilik Tarihi</th>" +
             "<th>Karaliste mi?</th>" +
              "<th>Karaliste Gerekçe</th>" +
           
           
            "</thead><tbody><tr>" +
           
            "<td>" +
            (row.misafir_id==1?"Yerel":"Otel") +
            "</td>" +
            "<td>" +
            row.notu +
            "</td>" +
            "<td>" +
           (row.dogumtar != null ? row.dogumtar:"-") +
            "</td>" +
            "<td>" +
           ( row.evliliktar!= null ? row.evliliktar:"-") +
            "</td>" +
            "<td>" +
            (row.karaliste == 1 ? "Evet" : "Hayır") +
            "</td>" +
            "<td>" +
           (row.karaliste_gerekce!= null ? row.karaliste_gerekce:"-") +
            "</td>" +
            "</tr></tbody></table></div>"
          );
        },
        
      },
    };
  },
  components: {
    BootstrapTable,
  },
  created() {
   this.tumkayit();
  },
  props: ["title"],
  watch: {},
  mounted() {
    var ref = this;
    $(document).on("click", ".kisiguncelle", function () {
      var id = $(this).data("userid");

      ref.getir(id);
    });
     $(document).on("click", ".grupmu", function () {
      var geriid = $(this).data("kisiid");
      Swal.fire({
        title: "Rezervasyon Tipi",
       
        icon: "warning",
        showCancelButton: true,
        showDenyButton: true,
        confirmButtonColor: "#3085d6",
        denyButtonColor: "#51ad4c",

        cancelButtonColor: "#d33",
         cancelButtonText:"İptal",
        confirmButtonText: "Kişi Rezervasyonu",
        denyButtonText: "Grup Rezervasyonu",
      }).then((result) => {
        if (result.isConfirmed) {
         window.location.href="http://localhost/admin/rezerv/"+geriid
        }
        else if(result.isDenied)
        {

          window.location.href="http://localhost/admin/group/"+geriid
        }
      });
    })
  },
  methods: {
  tumkayit: function(){
 axios.get(`http://localhost/api/table-list`).then((res) => {
      this.data1 = res.data;
      this.showModal=false;
    });
  },
    
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
           user_id:$("#logidUserid").text(),
          
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
