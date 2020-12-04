<template>
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading">{{ title }}
                <button class="btn btn-secondary" @click="showForm"><i class="fa fa-plus"> Yeni Masa Ekle</i></button>
            </div>
            <div v-if="isShow" style="padding:10px;">
                <input type="text" class="form-control" v-model="inputTable" @keyup="inputcheck"
                       placeholder="Masa Adı Yazınız">
                <input type="text" class="form-control" v-model="price" placeholder="Rezervasyon fiyatı ekleyiniz."
                />
                <input type="text" class="form-control" v-model="person"
                       placeholder="Masanın kaç kişilik olduğunu ekleyiniz."
                />
                <input type="text" class="form-control" v-model="map" placeholder="Masanın konumunu ekleyiniz."
                />
                <div v-if="SelectPhoto">
                    <label for="file-input">Resim Seç</label>
                    <input type="file" accept="image/*" @change="uploadImage($event)" id="file-input">
                </div>
                <img :src="previewImage" class="uploading-image picture" style="max-height: 200px"/>
                <button :disabled="isDisable" @click="addTable" style="margin-top:5px;" class="btn btn-primary">Ekle
                </button>
            </div>
            <div class="panel-body">
                <div v-for="(item,index) in masalar" :id="'masa'+item.id">
                    <table-preview :item="item" :index="index"  :isDelete="true"
                                   @tablelist="gelen($event)"></table-preview>
                                   
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                price: '',
                person: '',
                map: '',
                SelectPhoto: true,
                previewImage: null,
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

                axios.post(`http://localhost/api/table-store`, {
                    tablename: this.inputTable,
                    price: this.price,
                    person: this.person,
                    map: this.map,
                    image: this.previewImage,

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
                else {
                    this.isDisable = true
                }

            },

            removeTable: function (item, index) {

                axios.post(`http://localhost/api/table-delete`, {
                    id: item,

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
                                    'tablename': value.tablename,
                                    'price': value.price,
                                    'map': value.map,
                                    'person': value.person,
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
