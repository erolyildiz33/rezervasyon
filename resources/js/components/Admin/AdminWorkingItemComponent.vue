<template>
    <div class="panel panel-default">
        <div class="panel-heading">
            {{ title }}
            <button class="btn btn-secondary" @click="showForm">+</button>
        </div>
        <div v-if="isShow" style="padding: 10px">
            <select class="form-control" @change="masa">
                <option disabled selected hidden>Masa Seçiniz</option>
                <option v-for="item in tables" :key="item.id" :value="item.id">
                    {{ item.tablename }}
                </option>
            </select>
            <div v-if="isShowTime">
                <table-preview :item="selecteditem" :index="selectedindex" :isDelete="false"></table-preview>
                <input
                    type="text"
                    @input="timeinput($event)"
                    class="form-control"
                    v-model="time"
                    placeholder="Masa Çalışma Saati Ekleyiniz.">

            </div>

            <div v-if="isShowButton">
                <button
                    @click="addTime"
                    style="margin-top: 5px"
                    class="btn btn-primary"
                >
                    Ekle
                </button>
            </div>


        </div>
        <div class="panel-body">
            <div v-for="item in data" :key="item.id">{{ item }}</div>
        </div>
    </div>
</template>

<script>
    export default {
        props: ["title", "data"],
        data() {
            return {
                isShowTime: false,
                isShowButton: false,
                selected: null,
                tables: [],
                isShow: false,
                time: "",
                view: [],
                view2: [],
                price: [],
                selecteditem: null,
                selectedindex: null,

            }
        },
        created() {

            this.isShowButton = false;
            this.isShowTime = false;
            axios.get(`http://localhost/api/table-list`).then((res) => {
                this.tables = res.data;
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
            masa: function (e) {

                this.selected = e.target.value;
                var tmp = null
                var tmp2=null
                $.each(this.tables, function (i, val) {

                    if (e.target.value == val.id.toString()) {

                        tmp=val
                         tmp2= i
                    }
                })
                this.selecteditem=tmp
                this.selectedindex=tmp2

              this.isShowTime = true;
                this.view = [];
            },
            showForm: function () {
                this.isShow = !this.isShow;
            },
            addTime: function () {
                this.view.push(this.time);
                this.view2[this.selected] = this.view;
                this.$emit("add", {text: this.time, text: this.view2});
                this.time = "";
                this.isShow = false;
                this.isShowTime = false;
                this.isShowButton = false;
            },
        },
    };
</script>
