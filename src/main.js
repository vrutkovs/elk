import Vue from 'vue'

/* Bootstrap */
import { BootstrapVue, BootstrapVueIcons } from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

Vue.use(BootstrapVue)
Vue.use(BootstrapVueIcons)

/* Axios */
import axios from 'axios'
import VueAxios from 'vue-axios'
Vue.use(VueAxios, axios)

/* Vue settings */
Vue.config.productionTip = false

/* Vue Router */
import VueRouter from 'vue-router'
Vue.use(VueRouter)

import App from "./App.vue";

const router = new VueRouter({
  mode: 'history',
  routes: [
    {
      path: '/',
    }, {
      path: '/group/:groupid',
    }, {
      path: '/job/:jobid',
      component: () => import("@/pages/JobDetails.vue"),
    }, {
      path: '/job/:jobid/:runid',
      component: () => import("@/pages/JobRunDetails.vue"),
    }
  ]
})

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
