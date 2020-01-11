<template>
  <div id="app">
    <b-container class="bv-example-row">
      <!-- TODO: make groups API in antelope -->
      <b-row>
        <GroupList/>
      </b-row>
      <!-- <b-row>
        <b-col>release-openshift-origin-installer-e2e-aws-upgrade-4.1</b-col>
        <b-col>release-openshift-ocp-installer-e2e-aws-upi-4.2</b-col>
        <b-col>release-openshift-ocp-installer-e2e-openstack-4.3</b-col>
      </b-row>
      <b-row>
        <b-col>release-openshift-origin-installer-e2e-aws-upgrade-4.1</b-col>
        <b-col>release-openshift-ocp-installer-e2e-aws-upi-4.2</b-col>
        <b-col>release-openshift-ocp-installer-e2e-openstack-4.3</b-col>
      </b-row> -->
    </b-container>
  </div>
</template>

<script>
import GroupList from './components/GroupList.vue'

export default {
  name: 'app',
  components: {
    GroupList
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
