<template>
  <div>
    <b-button
      :pressed.sync="pressed"
      :to="`/job/${id}`"
      variant="secondary"
    >{{ title }}</b-button>
  </div>
</template>
<script>
export default {
  name: 'Job',
  props: {
    id: String,
    title: String,
    groupid: String,
    pressed: Boolean
  }
}
</script>
