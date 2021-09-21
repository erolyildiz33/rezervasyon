<template>
    <div>

<div class="container bootstrap snippets bootdey">
<div class="row">
  <div class="profile-nav col-md-3">
      <div class="panel">
          <div class="user-heading round">
              <a href="#">
                  <img src="https://www.pikpng.com/pngl/m/75-756814_login-user-imagen-user-png-clipart.png" alt="">
              </a>
              <h1>{{user.ad}}</h1>
              <p>{{user.email}}</p>
          </div>

          <ul class="nav nav-pills nav-stacked">
              <li class="active"><a href="#"> <i class="fa fa-user"></i> Profil</a></li>
              <li><a href="#"> <i class="fa fa-calendar"></i> Sevdikleri <span class="label label-warning pull-right r-activity">9</span></a></li>
              <li><a href="#"> <i class="fa fa-edit"></i> Güncelle</a></li>
          </ul>
      </div>
  </div>
  <div class="profile-info col-md-9">
      <div class="panel">
          <form>
              <textarea placeholder="Not eklemek için buraya yazınız" rows="2" class="form-control input-lg p-text-area" v-model="notss"></textarea>
          </form>
          <footer class="panel-footer">
              <button class="btn btn-warning pull-right" @click="store">Kaydet</button>
              <ul class="nav nav-pills">

              </ul>
          </footer>
      </div>
      <div class="panel">
          <div class="bio-graph-heading">

          </div>
          <div class="panel-body bio-graph-info">
              <h1>Kişisel Bilgiler</h1>
              <div class="row">
                  <div class="bio-row">
                      <p><span>Ad </span>: {{user.ad}}</p>
                  </div>
                  <div class="bio-row">
                      <p><span>Soyad </span>: {{user.soyad}}</p>
                  </div>

                  <div class="bio-row">
                      <p><span>Doğum Tarihi</span>: {{user.dogumtar}}</p>
                  </div>
                   <div class="bio-row">
                      <p><span>Evlilik Tarihi</span>: {{user.evliliktar}}</p>
                  </div>

                  <div class="bio-row">
                      <p><span>Email </span>: {{user.email}}</p>
                  </div>
                  <div class="bio-row">
                      <p><span>Telefon </span>: {{user.tel}}</p>
                  </div>

              </div>
          </div>
      </div>
      <div>
          <div class="row">
              <div class="col-md-12">
                  <div v-for="not in notlar">
      
                      <p>{{not.not_icerik}}</p>
                  </div>
              </div>

          </div>
      </div>
  </div>
</div>
</div>
    </div>
</template>
<script>
export default {
    props:['user'],
   data() {
    return {
        notlar:null,
        notss:null,
    }
    },
    created() {
         axios.get('http://localhost/api/not-list/'+this.user.id).then((res) => {
      this.notlar = res.data;
    });

    },
    methods:{
    store() {
         axios.post(`http://localhost/api/not-store`,{
              kisi_id:this.user.id,
         not_icerik:this.notss,
         user_id:$("#logidUserid").text(),
         }).then((res) => {
        this.notlar=res.data;

    });
}
    }
}
</script>
