<template>
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading">{{ title }}
                <button class="btn btn-secondary" @click="showForm"><i class="fa fa-plus"> Yeni Event Ekle</i></button>
            </div>
            <div v-if="isShow" style="padding:10px;">
                <input type="text" class="form-control" v-model="inputTable" @keyup="inputcheck"
                       placeholder="Event Adı Yazınız">
                <date-picker

                          v-model="date"


                          format="DD-MM-YYYY dddd"

                          type="date"
                          ></date-picker>


                <date-picker
                          v-model="timevalue"
                          :time-picker-options="{
                            start: '11:30',
                            step: '00:05',
                            end: '23:30',
                          }"
                          format="H:mm"
                          type="time"
                          placeholder="Event Saati belirleyiniz"
                        ></date-picker>

                <div v-if="SelectPhoto">
                    <label for="file-input">Resim Seç</label>
                    <input type="file" accept="image/*" @change="uploadImage($event)" id="file-input">
                </div>
                <img :src="previewImage" class="uploading-image picture" style="max-height: 200px"/>
                <button :disabled="isDisable" @click="addTable" style="margin-top:5px;" class="btn btn-primary">Ekle
                </button>
            </div>
            <div class="panel-body">

                <div v-for="(Item,index) in masalar" :id="'masa'+Item.id">
                    <admin-event-preview :urun="Item" :index="index"  :isDelete="true"
                                   @eventlist="gelen($event)"></admin-event-preview>

                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                date: new Date(),

                timevalue: null,
                SelectPhoto: true,
                previewImage: null,
                isDisable: true,
                isShow: false,
                inputTable: '',
                masalar: [],
            }
        },
        created() {
            axios.get(`http://localhost/api/event-list`).then((res) => {
                this.masalar = res.data;
            })
        },
        props: ['title','eventlist'],
        watch: {
        },
        methods: {
            gelen(id) {

               this.removeTable(id['id'],id['index'])
            },
            uploadImage(e) {
                const image = e.target.files[0];
                const reader = new FileReader();
                reader.readAsDataURL(image);
                reader.onload = e => {
                    this.previewImage = e.target.result;
                    this.SelectPhoto = false;
                };
            },
            showForm: function () {
                this.isShow = !this.isShow;
            },
            addTable: function () {
                axios.post(`http://localhost/api/event-store`, {
                    ad: this.inputTable,
                    tarih:this.date.toLocaleDateString(),
                    saat: this.timevalue.toLocaleTimeString(),
                    image: this.previewImage,
                     user_id:$("#logidUserid").text(),
                })
                    .then((res) => {
                        this.masalar.push(res.data)
                        this.SelectPhoto=true;
                        this.previewImage=null;
                        this.inputTable = ''
                    })
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
                        this.isDisable = true
                    }
                }
                else {
                    this.isDisable = true
                }
            },
            removeTable: function (item, index) {

                axios.post(`http://localhost/api/event-delete`, {
                    id: item,
                     user_id:$("#logidUserid").text(),
                })
                    .then((res) => {
                        var tmp = this.masalar
                        var tmp2 = []
                        delete tmp[index]
                        this.masalar = []
                        $.each(tmp, function (key, value) {
                            if (value)
                                tmp2.push({
                                    'id': value.id,
                                    'ad': value.ad,
                                    'tarih': value.tarih,
                                    'saat': value.timevalue,
                                    'image': value.image,
                                });
                        });
                        this.masalar = tmp2
                    })
            }
        }
    }
</script>
<style>
    .uploading-image {
        display: flex;
    }
</style>
