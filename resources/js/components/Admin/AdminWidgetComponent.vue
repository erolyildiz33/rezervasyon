<template>
<div>

<!--<div class="col-md-3 col-sm-6 col-12">
            <div class="info-box bg-{{renk}}">
              <span class="info-box-icon"><i class="fa fa-{{icon}}"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">{{baslik}}</span>
                <span class="info-box-number">{{deger}}</span>

                <div class="progress">
                  <div class="progress-bar" style="width: 70%"></div>
                </div>
                <span class="progress-description">
                  {{aciklama}}
                </span>
              </div>
          
            </div>
        
          </div>
 
</div>
-->
</div>
</template>
<script>

export default {
  props: ["renk","icon","baslik","deger","aciklama"],
}
</script>