<template>
  <b-button
    :variant="success ? 'success' : 'danger'"
    :to="`/job/${jobid}/${runid}`"
  >{{ runid }}</b-button>
</template>
<script>
export default {
  name: 'JobRunButton',
  props: {
    runid: Number,
    jobid: Number,
    success: Boolean
  }
}
</script>
