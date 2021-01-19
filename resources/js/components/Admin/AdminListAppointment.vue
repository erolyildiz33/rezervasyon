 
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

    <admin-appointment-modal
      :modalId="showModalId"
      v-if="showModal"
      @close="showModal = false"
    ></admin-appointment-modal>
  </div>
</template>

<script>
export default {
  props: ["data"],
 
  data() {
    return {
      showModalId: 0,
      showModal: false,
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
          title: "Notu",
          field: "text",
        },
        {
          title: "Bildirim Türü",
          formatter:function(value,row){ if (row.notification_type==1) return "Email"; else return "SMS"},
        },
         {
          title: "Müşteri Türü",
          formatter:function(value,row){ if (row.misafir_id==0) return "Yerel"; else return "Otel"},
        },

       {
          title: "İşlem",
          formatter: (value, row) => {
            if (row.isActive == 0) {
              return '<a class="btn btn-default" href="http://localhost/api/admin/process/1/'+row.id+'">Onayla</a><a class="btn btn-default" href="http://localhost/api/admin/process/2/'+row.id+'">İptal Et</a>'
              
            } else if (row.isActive == 1) {
              return '<a class="btn btn-default" href="http://localhost/api/admin/process/2/'+row.id+'">İptal Et</a>';
            } else if (row.isActive == 2) {
              return '<span class="bg-danger">İptal Edilen</span>';
            }
            
             if (row.isActive == 1) {
              return '<a class="btn btn-default" href="http://localhost/api/admin/process/2/'+row.id+'">İptal Et</a>';
             
           
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
        
      },
    };
  },
   components: {
    BootstrapTable,
  },

  created() {},
  methods: {
    detay:function(id){

    },
    appointmentOkey: function (id) {
      axios.post(`http://localhost/api/admin/process`,{
                    type:1,
                    id:id
                })
                    .then((res)=>{
                     
                    })
    },
    appointmentCancel: function (id) {
      axios.post(`http://localhost/api/admin/process`,{
                    type:2,
                    id:id
                })
                    .then((res)=>{
                     
                    })
    },
    openModal: function (id) {
      this.showModalId = id;
      this.showModal = true;
    },
  },
};
</script>
