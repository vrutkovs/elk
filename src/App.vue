<template>
  <div id="app">
    <b-container class="bv-example-row">
      <b-row>
        <GroupJobSelector
          v-on:job-selected="onJobSelected"/>
      </b-row>
      <b-row>
        <JobDetails
          v-bind:id="id"
          v-if="id"/>
      </b-row>
    </b-container>
  </div>
</template>

<script>
import GroupJobSelector from './components/GroupJobSelector.vue'
import JobDetails from './components/JobDetails.vue'

export default {
  name: 'app',
  components: {
    GroupJobSelector,
    JobDetails
  },
  data() {
    return {
      id: null
    }
  },
  methods: {
    onJobSelected: function (id) {
      /* eslint no-console: ["error", { allow: ["warn", "error"] }] */
      console.warn("app: job '" + id + "' selected")
      this.id = id
    }
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  margin-top: 10px;
}
</style>
