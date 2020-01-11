<template>
  <div id="app">
    <b-container>
      <TopNavBar />
      <router-view/>
    </b-container>
  </div>
</template>

<script>
import TopNavBar from './components/TopNavBar.vue'
export default {
  name: 'App',
  components:{
    TopNavBar
  }
}
</script>
