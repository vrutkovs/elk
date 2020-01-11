<template>
  <b-button
    v-on:click="$emit('job-run-selected', id)"
    :variant="success ? 'success' : 'danger'"
    disabled
  >{{ id }}</b-button>
</template>
<script>
export default {
  name: 'JobRunButton',
  props: {
    id: Number,
    title: String,
    success: Boolean
  }
}
</script>
