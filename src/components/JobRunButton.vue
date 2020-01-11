<template>
  <div>
    <b-button
      v-on:click="$emit('job-run-selected', id)"
      :variant="success ? 'success' : 'danger'"
    >{{ id }}</b-button>
  </div>
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
