<template>
    <div class="col-md-4">
        <div class="panel panel-default">
            <div class="panel-heading">{{ title }}
                <button class="btn btn-secondary" @click="showForm"><i class="fa fa-plus"> Yeni Masa Ekle</i></button>
            </div>
            <div v-if="isShow" style="padding:10px;">
                <input type="text" class="form-control" v-model="inputTable" @keyup="inputcheck"
                       placeholder="Masa Adı Yazınız">
                <button :disabled="isDisable" @click="addTable" style="margin-top:5px;" class="btn btn-primary">Ekle
                </button>
            </div>
            <div class="panel-body">
                <div v-for="(item,index) in masalar" :id="'masa'+item.id">
                    <div class="col-md-6">{{item.tablename}}</div>
                    <div class="col-md-6 ">
                        <button @click="removeTable(item.id,index)" class="btn btn-xs btn-danger"><i
                            class="fa fa-minus"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                isDisable: true,
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
        watch: {},
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
                        this.inputTable = ''

                    })


            },
            inputcheck: function () {
                var my = this.inputTable;
                if (my.length > 0) {

                    var check = this.masalar.filter(function (elm) {
                        if (elm.tablename == my) {
                            return elm;
                        }
                    });
                    if (!check.length > 0) {
                        this.isDisable = false;
                    } else {
                        this.isDisable = true
                    }
                }

            },

            removeTable: function (item, index) {

                axios.post(`http://localhost/api/table-delete`, {
                    id: item,

                })
                    .then((res) => {
                        var tmp = this.masalar
                        var tmp2=[]
                        delete tmp[index]
                        $("#masa" + item).remove();
                        this.masalar=[]
                        console.log(tmp)
                        $.each(tmp, function(key, value) {
                            if(value)
                            tmp2.push({'id':value.id,'tablename':value.tablename});
                        });

                        this.masalar=tmp2
                    })


            }
        }
    }
</script>
