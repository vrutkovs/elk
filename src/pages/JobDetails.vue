<template>
  <div>
    <section v-if="errored">
      <p>Loading error</p>
    </section>

    <section v-else>
      <section v-if="loading">
        <div class="text-center text-danger my-2">
          <b-spinner class="align-middle"></b-spinner>
          <strong>Loading...</strong>
        </div>
      </section>

      <section v-else>
        <b-table-simple>
          <b-thead>
            <b-tr>
              <b-th>Infra failures</b-th>
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
            <JobRunTestStatus
              v-for="(err, idx) in infraErrors"
              :key="idx"
              :index="err.idx"
              :total="job_info.length"
              :message="err.infra_failure"
              success=false
             />
            <b-tr>
              <b-td><b>Failed tests</b></b-td>
              <b-td colspan="job_info.length - 1">&nbsp;</b-td>
            </b-tr>
            <JobRunTestStatus
              v-for="(err, idx) in failedTests"
              :key="idx"
              :index="err.idx"
              :total="job_info.length"
              :message="err.message"
              success=false
             />
          </b-tbody>
        </b-table-simple>
      </section>
    </section>
  </div>
</template>
<script>
import JobRunButton from '../components/JobRunButton.vue'
import JobRunTestStatus from '../components/JobRunTestStatus.vue'

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
    JobRunTestStatus
  }
}
</script>
