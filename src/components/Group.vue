<template>
  <div>
    <b-button
      v-on:click="$emit('group-selected', id)"
      :pressed.sync="pressed"
      variant="primary"
    >{{ title }}</b-button>
  </div>
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
