<template>
  <b-tr variant="danger">
    <b-td>{{ infra_failure }}</b-td>
    <b-td
      v-for="n in this.total"
      :key="n">{{ n == index+1 ? "x" : "&nbsp;"}}</b-td>
  </b-tr>
</template>
<script>
export default {
  name: 'JobRunRCARow',
  props: {
    infra_failure: String,
    index: Number,
    total: Number,
    success: Boolean
  }
}
</script>
