<template>
  <div>
    <section v-if="errored">
      <p>Loading error</p>
    </section>

    <section v-else>
      <div v-if="loading">Loading...</div>

      <div v-else>
        <b-button-group vertical>
          <JobRunButton
            v-for="(jb, idx) in job_info"
            v-bind:key="idx"
            v-bind:id="jb.id"
            v-bind:success="jb.success"
          />
        </b-button-group>
      </div>
    </section>
  </div>
</template>
<script>
import JobRunButton from '../components/JobRunButton.vue'

export default {
  name: 'JobDetails',
  computed: {
    jobid() {
      return this.$route.params.jobid
    },
  },
  data(){
    return {
      job_info: [],
      loading: true,
      errored: false
    }
  },
  mounted() {
    this.axios
      .get('http://localhost:3000/job/'+this.jobid)
      .then(response => {
        response.data.forEach(v => {
          var url = 'http://localhost:3000/job/'+this.jobid+'/'+v
          this.axios
            .get(url)
            .then(response => {
              this.job_info.push(response.data)
          })
        }, this)
      })
      .catch(error => {
        /* eslint no-console: ["error", { allow: ["warn", "error"] }] */
        console.warn(error)
        this.errored = true
      })
      .finally(() => {
        this.loading = false
      })
  },
  components: {
    JobRunButton
  }
}
</script>
