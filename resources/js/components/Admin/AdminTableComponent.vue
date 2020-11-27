<template>
    <div class="container">
        <div class="row">

            <div class="col-md-12">

                <admin-table-item tableid="table1" @add="add" title="Masa Listesi" :data="tables" ></admin-table-item>



                <button class="btn btn-success" @click="store">Kaydet</button>

            </div>
        </div>
    </div>




</template>

<script>
export default
{

    data()
    {
        return {
            tables:[],

        }
    },
    created(){
        axios.get(`http://localhost/api/table-list`).then((res)=>{
            var myvar=[];
            $.each(res.data,function (index,value){
                myvar.push(value[0]);
                //this.tables.push({index:value
                });
this.tables=myvar;
        })
        //console.log(this.tables);
    },
    methods:{
        add:function (data) {

            this.tables.push(data.text);

        },

        store:function(){
            axios.post(`http://localhost/api/table-store`,{
                tablename:this.tables,

            })
                .then((res)=>{
                    console.log(res);
                })
        }
    }
}


</script>
