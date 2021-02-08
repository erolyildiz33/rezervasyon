<template>
  <div class="col-lg-4 col-md-6 mix all house">
    <div class="property-item">
      <div data-setbg="/img/property/property-1.jpg" class="pi-pic set-bg">
        {{urun.id}}
        <div class="label">{{ urun.ad }}
             <button
          v-if="isDelete"
          @click="removeTable(urun.id, index)"
          class="btn btn-xs btn-danger"
        >
          <i class="fa fa-trash"></i>
          <i class="fa fa-plus"></i>
        </button>
        </div>
       
        <img
          :src="'/uploads/event/' + urun.image"
          style="max-height: 240px; cursor: default"
        />
        
        <div class="li">
        <ul>
          <li class="text">Adı : {{ urun.ad }} TL</li>
          <li class="text">Tarihi : {{ urun.tarih }} kişilik</li>
          <li class="text">Saati : {{ urun.saat }}</li>
        </ul>
        </div>
      </div>
    </div>
  </div>
</template>
<style>
.pi-pic ul li {
  display: inline;
}
.pi-pic .li{
display: flex;

}

.pi-pic ul {
    display: flex;
   width: 80%;
  list-style: none;
  position: absolute;
 bottom:0;
 justify-content: space-around;


color:lightyellow;



}
.fa .fa-minus{
position: static;

}
</style>
<script>
export default {
  data() {
    return {};
  },
  props: ["urun", "index", "isDelete"],
  methods: {
    removeTable: function (items, index) {
        
      this.$emit("eventlist", { id: items, index: this.index });
    },
  },
};
</script>
