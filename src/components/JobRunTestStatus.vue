<template>
  <b-tr>
    <b-td>{{ message }}</b-td>
    <b-td
      v-for="n in this.total"
      :variant="index.includes(n-1) ? 'danger' : 'success'"
      :key="n">&nbsp;</b-td>
  </b-tr>
</template>
<script>
export default {
  name: 'JobRunTestStatus',
  props: {
    message: String,
    index: Array,
    total: Number
  }
}
</script>
