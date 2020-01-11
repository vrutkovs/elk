<template>
  <div>
    <section v-if="errored">
      <p>Loading error</p>
    </section>

    <section v-else>
      <div v-if="loading">...</div>

      <b-table-simple v-else>
        <b-thead>
          <b-tr>
            <b-th>Root Cause</b-th>
            <JobRunButton
              v-for="(jb, idx) in job_info"
              :key="idx"
              :runid="jb.id"
              :jobid="jobid"
              :success="jb.success"
            />
          </b-tr>
        </b-thead>
        <b-tbody>
          <JobRunRCARow
            v-for="(err, idx) in infraErrors"
            :key="idx"
            :index="err.idx"
            :total="job_info.length"
            :infra_failure="err.infra_failure"
            success=false
           />
        </b-tbody>
      </b-table-simple>
    </section>
  </div>
</template>
<script>
import JobRunButton from '../components/JobRunButton.vue'
import JobRunRCARow from '../components/JobRunRCARow.vue'

export default {
  name: 'JobDetails',
  computed: {
    jobid() {
      return this.$route.params.jobid
    },
    infraErrors() {
      var result = []
      this.job_info.map(function(v, idx){
        if (v.success == false) {
          result.push({
            idx: idx,
            infra_failure: v.infra_failure
          })
        }
      })
      return result
    }
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
    JobRunButton,
    JobRunRCARow
  }
}
</script>
