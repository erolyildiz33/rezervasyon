<template>
    <div class="col-md-4">
        <div class="panel panel-default">
            <div class="panel-heading">{{ title }}
                <button class="btn btn-secondary" @click="showForm"><i class="fa fa-plus"> Yeni Masa Ekle</i></button>
            </div>
            <div v-if="isShow" style="padding:10px;">
                <input type="text" class="form-control" v-model="inputTable" placeholder="Masa Adı Yazınız">
                <button @click="addTable" style="margin-top:5px;" class="btn btn-primary">Ekle</button>
            </div>
            <div class="panel-body">
                <div v-for="(item,index) in masalar" :id="'masa'+item.id"><div class="col-md-6">{{item.tablename}}</div>
                    <div class="col-md-6 "><button @click="removeTable(item.id,index)" class="btn btn-xs btn-danger"><i class="fa fa-minus"></i></button></div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                isShow: false,
                inputTable: '',
                masalar: [],
            }
        },
        created() {
            axios.get(`http://localhost/api/table-list`).then((res) => {

                this.masalar = res.data;
            })
        },
        props: ['title'],

        methods: {
            showForm: function () {
                this.isShow = !this.isShow;
            },
            addTable: function () {

                axios.post(`http://localhost/api/table-store`, {
                    tablename: this.inputTable,

                })
                    .then((res) => {

                        this.masalar.push(res.data)

                    })
            },

            removeTable: function (item, index) {

                axios.post(`http://localhost/api/table-delete`, {
                    id: item,

                })
                    .then((res) => {

                        delete this.masalar[index]
                        $("#masa" + item).remove();

                    })


            }
        }
    }
</script>
