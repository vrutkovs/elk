<template>
  <section v-if="errored">
    <p>Loading error</p>
  </section>

  <section v-else>
    <div v-if="loading">Loading...</div>
    <div v-else>
      <b-button
        :variant="success ? 'success' : 'danger'"
        :to="`/job/${jobid}/${runid}`"
      >{{ runid }}</b-button>
    </div>
  </section>
</template>
<script>
export default {
  name: 'JobRunButton',
  props: {
    runid: Number,
    jobid: String,
    success: Boolean
  },
  data(){
    return {
      rca: null,
      failed_tests: [],
      loading: true,
      errored: false
    }
  },
  mounted() {
    this.axios
      .get('http://localhost:3000/job/'+this.jobid+'/'+this.runid+'/rca')
      .then(response => {
        if (response.data.rca != null) {
          this.rca = response.data.rca.get(0)
        }
        if (response.data.failed_tests == null) {
          return
        }
        response.data.failed_tests.forEach(v => {
          this.failed_tests.push(v)
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
  }
}
</script>
