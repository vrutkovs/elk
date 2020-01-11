<template>
  <div>
    <b-button
      v-on:click="$emit('job-selected', id)"
      :pressed.sync="pressed"
      variant="success"
    >{{ title }}</b-button>
  </div>
</template>
<script>
export default {
  name: 'Job',
  props: {
    id: String,
    title: String,
    pressed: Boolean
  }
}
</script>
