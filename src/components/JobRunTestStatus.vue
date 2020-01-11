<template>
  <b-tr>
    <b-td>{{ message }}</b-td>
    <b-td
      v-for="n in this.total"
      :variant="n == index+1 ? 'danger' : 'success'"
      :key="n">&nbsp;</b-td>
  </b-tr>
</template>
<script>
export default {
  name: 'JobRunTestStatus',
  props: {
    message: String,
    index: Number,
    total: Number,
    success: Boolean
  }
}
</script>
