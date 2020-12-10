<template>
    <div class="panel panel-default">
        <div class="panel-heading">
            {{ title }}
            <button class="btn btn-secondary" @click="showForm">+</button>
        </div>
        <div v-if="isShow" style="padding: 10px">
            <div class="row">
                <div class="col-md-4">
                    <date-picker
                        type="time"
                        v-model="time"
                        :minute-step="30"
                        format="HH:mm"
                        value-type="format"
                        placeholder="Saat seçiniz"
                    ></date-picker>
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
                            <input type="checkbox" :id="item.id"/>{{ item.tablename }}
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
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
            <div v-for="(index,item) in working" :key="item.id" class="card border-dark mb-3" style="max-width: 18rem;">
              <div class="card-header"> {{item}}</div>
                <div class="card-body text-dark">
                    <h5 class="card-title">Saatler</h5>
                    <p v-for="saat in index" class="card-text">{{saat}}</p>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import "vue2-datepicker/index.css";
    import "vue2-datepicker/locale/tr";

    export default {
        props: ["title", "data", "working"],
        data() {
            return {
                time: null,
                isShowButton: true,
                isShow: false,
                tables: [],

            };
        },
        created() {
            this.isShowButton = false;

            axios.get(`http://localhost/api/table-list`).then((res) => {
                this.tables = res.data;
            });

        },
        methods: {
            timeinput: function (e) {
                this.time = e.target.value;
                this.isShowButton = this.time !== "";
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

                let zaman = this.time;

                if (selectedTables.length !== 0 && zaman != null) {
                    axios
                        .post("http://localhost/api/working-store", {
                            day: this.title,
                            masalar: selectedTables,
                            time: this.time,
                        })
                        .then((res) => {

                            this.selectedTables = [];
                            this.$emit('add', {text: this.time, day: this.title, tables: selectedTables});
                        });
                } else alert('masa ve saat belirtin')


            },
        },
    };
</script>
