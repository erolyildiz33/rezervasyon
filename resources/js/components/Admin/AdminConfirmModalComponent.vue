

<template>
<div>
  <transition name="modal">
    <div class="modal-mask">
      <div class="modal-wrapper">
        <div class="modal-container">
          <div class="modal-header">
            <slot name="header">
              <h3 slot="header">
                <label>Rezervasyon Confirm</label>
                
              </h3>

            </slot>
             <button
                class="btn btn-danger modal-default-button"
                @click="$emit('close')"
              >
                X
              </button>
          </div>
          <div class="modal-body">
            <slot name="body">
              <div>
       

       <appointment-detail :conf="kisi">

       </appointment-detail>
              </div>
            </slot>
          </div>
        </div>
      </div>
    </div>
  </transition>
  </div>
</template>










<script>
  export default {
  props: ["kisi"],

  
  }
</script>
