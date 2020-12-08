<template>
    <div class="panel panel-default">
        <div class="panel-heading">
            {{ title }}
            <button class="btn btn-secondary" @click="showForm">+</button>
        </div>
        <div v-if="isShow" style="padding: 10px">
            <div class="row">
                <div class="col-md-4">

                    <date-picker type="time" v-model="time" :minute-step="30"
                                 format="HH:mm"
                                 value-type="format" placeholder="Saat seçiniz"></date-picker>
                    <!--
                    <input
                        type="text"
                        @keyup="timeinput($event)"
                        class="form-control"
                        v-model="time"
                        placeholder="Masa Çalışma Saati Ekleyiniz."
                    />
!-->
                <div class="col-md-4">
                    <div v-for="item in tables" :key="item.id">
                        <input type="checkbox" :id="item.id">{{item.tablename}}
                    </div>
                </div>
                    <div class="row">
                        <div  class="col-md-12">
                            <button
                                @click="addTime"
                                style="margin-top: 5px"
                                class="btn btn-primary"
                            >
                                Ekle
                            </button>
                        </div>
                    </div>

                </div>
            </div>


        </div>
        <div class="panel-body">
                 <div v-for="item in working" :key="item.id">{{ item }}</div>
        </div>
    </div>
</template>

<script>
    import 'vue2-datepicker/index.css';
    import 'vue2-datepicker/locale/tr';
    export default {

        props: ["title", "data"],
        data() {
            return {

                time: null,
                isShowButton: true,
                isShow: false,
                tables: [],
                working:[],

            };
        },
        created() {
            this.isShowButton = false;

            axios.get(`http://localhost/api/table-list`).then((res) => {
                this.tables = res.data;
            });
             axios.get(`http://localhost/api/working-list`).then((res) => {
                this.working = res.data;
            });


        },
        methods: {
            timeinput: function (e) {
                this.time = e.target.value;
                if (this.time != "") {
                    this.isShowButton = true;
                } else {
                    this.isShowButton = false;
                }
            },

            showForm: function () {
                this.isShow = !this.isShow;
            },
            addTime: function () {
                let selectedTables = $("input:checkbox:checked")
                    .map(function () {
                        return $(this).prop("id");
                    })
                    .get();

                let zaman=this.time
               console.log(zaman);
               // this.isShow = false;

               // this.isShowButton = false;
            },
        },
    };
</script>
