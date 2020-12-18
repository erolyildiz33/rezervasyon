require('./bootstrap');
import VueMask from  'v-mask';


window.Vue = require('vue');
Vue.use(VueMask);
window.$=window.Jquery=require('jquery');
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

Vue.component('appointment-item',require('./components/Admin/AdminListAppointment').default);
Vue.component('admin-appointment',require('./components/Admin/AdminComponent').default);
Vue.component('admin-working',require('./components/Admin/AdminWorkingComponent').default);
Vue.component('admin-working-item',require('./components/Admin/AdminWorkingItemComponent').default);
Vue.component('admin-table',require('./components/Admin/AdminTableComponent').default);
Vue.component('admin-table-item',require('./components/Admin/AdminTableItemComponent').default);
Vue.component('table-preview',require('./components/Admin/TablesPreview').default);
Vue.component('admin-rezerv',require('./components/Admin/RezervationComponent').default);










Vue.component('admin-appointment-modal',require('./components/Admin/AdminAppointmentModal').default);

Vue.component('appointment-form',require('./components/RandevuFormComponent').default);
Vue.component('appointment-detail',require('./components/RandevuDetailComponent').default);
Vue.component('pagination',require('laravel-vue-pagination'));




/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
});
