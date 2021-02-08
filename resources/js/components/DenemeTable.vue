<template>
<div>
    <bootstrap-table
          :columns="columns"
          :data="tabledata"
          :options="options"
        ></bootstrap-table>
</div>
</template>
<script>
export default {
    data(){
        return {
            tabledata:[],
            columns: [
        {
          title: "Sıra No",
          formatter: function (value, row, index) {
            return index + 1;
          },
        },
        {
          title: "Adı Soyadı",
          field: "ad",
        }, {
          title: "Adı Soyadı",
          field: "soyad",
        },

      ],
      options: {

        search: true,
        showColumns: true,
         showExport:true

      },


        }
    },
     components: {
    BootstrapTable,
  },
    created(){
  axios.get('http://localhost/api/table-list/').then((res) => {
      this.tabledata=res.data;


  })
},
}
</script>
