<template>
  <b-button
    :pressed="pressed"
    :to="`/group/${id}`"
    variant="primary"
  >{{ title }}</b-button>
</template>
<script>
export default {
  name: 'Group',
  props: {
    id: String,
    title: String,
    pressed: Boolean
  }
}
</script>
