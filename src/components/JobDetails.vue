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
            v-on:job-run-selected="onJobRunSelected"
          />
        </b-button-group>
      </div>
    </section>
  </div>
</template>
<script>
import JobRunButton from './JobRunButton.vue'

export default {
  name: 'JobDetails',
  props: {
    id: String,
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
      .get('http://localhost:3000/job/'+this.id)
      .then(response => {
        response.data.forEach(v => {
          var url = 'http://localhost:3000/job/'+this.id+'/'+v
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
  methods: {
    onJobRunSelected: function (id) {
      /* eslint no-console: ["error", { allow: ["warn", "error"] }] */
      console.warn("jobdetails: job '" + this.id + "#" + id + "' selected")
    },
  },
  components: {
    JobRunButton
  }
}
</script>
