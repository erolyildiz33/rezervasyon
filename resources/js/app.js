
require('./bootstrap');
import VueMask from 'v-mask';
import Button from 'vue-js-toggle-button';
import NotificationBell from 'vue-notification-bell'
import VueStepWizard from 'vue-step-wizard';
import 'vue-step-wizard/dist/vue-step-wizard.css';
import VueSession from 'vue-session';

import { DropdownPlugin } from 'bootstrap-vue'


window.Vue = require('vue');
Vue.use(DropdownPlugin)
Vue.use(VueStepWizard);
Vue.use(Button);
Vue.use(VueMask);
Vue.use(NotificationBell);



Vue.use(VueSession);
window.$ = window.Jquery = require('jquery');
Vue.use(require('vue-moment'));
Vue.use(require('vue-resource'));
Vue.use(require('vue2-datepicker'));
Vue.use(require('jquery-imagemapster'));
/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i);
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default));

Vue.component('appointment-item', require('./components/Admin/AdminListAppointment').default);
Vue.component('admin-appointment', require('./components/Admin/AdminComponent').default);
Vue.component('admin-working', require('./components/Admin/AdminWorkingComponent').default);
Vue.component('admin-working-item', require('./components/Admin/AdminWorkingItemComponent').default);
Vue.component('admin-table', require('./components/Admin/AdminTableComponent').default);
Vue.component('admin-table-item', require('./components/Admin/AdminTableItemComponent').default);
Vue.component('table-preview', require('./components/Admin/TablesPreview').default);
Vue.component('admin-rezerv', require('./components/Admin/RezervationComponent').default);
Vue.component('appointment-modal', require('./components/RandevuModalComponent').default);
Vue.component('admin-event', require('./components/Admin/AdminEventComponent').default);
Vue.component('admin-event-preview', require('./components/Admin/AdminEventPreview').default);
Vue.component('admin-profile', require('./components/Admin/AdminProfileComponent').default);
Vue.component('deneme-table', require('./components/DenemeTable.vue').default);
Vue.component('admin-durum', require('./components/Admin/AdminDurumComponent.vue').default);
Vue.component('admin-group', require('./components/Admin/AdminGroupComponent.vue').default);
Vue.component('admin-rapor', require('./components/Admin/AdminRaporComponent.vue').default);




















Vue.component('admin-appointment-modal', require('./components/Admin/AdminAppointmentModal').default);
Vue.component('admin-form', require('./components/Admin/AdminFormComponent').default);
Vue.component('admin-modal', require('./components/Admin/AdminModalComponent').default);
Vue.component('admin-group-modal', require('./components/Admin/AdminGroupModalComponent').default);
Vue.component('admin-group-update', require('./components/Admin/AdminGroupUpdateComponent').default);



Vue.component('admin-update-modal', require('./components/Admin/AdminUpdateModalComponent').default);
Vue.component('admin-rezervation-update-modal', require('./components/Admin/AdminRezervationUpdateModelComponent').default);
Vue.component('admin-mesaj', require('./components/Admin/AdminMesajComponent').default);
Vue.component('admin-rezervation', require('./components/Admin/AdminRezervationComponent').default);
Vue.component('admin-confirm-modal', require('./components/Admin/AdminConfirmModalComponent').default);
Vue.component('admin-bell', require('./components/Admin/AdminBellComponent').default);

Vue.component('appointment-form', require('./components/RandevuFormComponent').default);
Vue.component('appointment-detail', require('./components/RandevuDetailComponent').default);


Vue.component('pagination', require('laravel-vue-pagination'));





 const app = new Vue({
    el: '#app',
  
})
