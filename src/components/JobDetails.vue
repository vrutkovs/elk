<template>
  <div>
    <section v-if="errored">
      <p>Loading error</p>
    </section>

    <section v-else>
      <div v-if="loading">Loading...</div>

      <div
        v-else
      >
        Job ID {{ id }}

        {{ info }}
      </div>

    </section>
  </div>
</template>
<script>
export default {
  name: 'JobDetails',
  props: {
    id: String,
  },
  data(){
    return {
      info: null,
      loading: true,
      errored: false
    }
  },
  mounted() {
    this.axios
      /* .get('http://localhost:3000/job/'+this.id+'') */
      .get('http://localhost:3000/job/'+this.id+'/544')
      .then(response => {
        this.info = response.data
      })
      .catch(error => {
        /* eslint no-console: ["error", { allow: ["warn", "error"] }] */
        console.warn(error)
        this.errored = true
      })
      .finally(() => this.loading = false)
  }
}
</script>
