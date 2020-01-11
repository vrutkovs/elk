<template>
  <b-th
    :variant="success ? 'success' : 'danger'"
    :to="`/job/${jobid}/${runid}`"
  >{{ runid }}
  </b-th>
</template>
<script>
export default {
  name: 'JobRunButton',
  props: {
    runid: Number,
    jobid: String,
    success: Boolean
  }
}
</script>
