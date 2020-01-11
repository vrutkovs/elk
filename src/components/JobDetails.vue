<template>
  <div>
    Job ID {{ id }}
  </div>
</template>
<script>
export default {
  name: 'JobDetails',
  props: {
    id: String,
  }
}
</script>
