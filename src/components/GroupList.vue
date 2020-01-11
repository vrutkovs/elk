<template>
  <div>
    <b-button-group>
      <Group
        v-for="(grp, idx) in groups"
        v-bind:key="idx"
        v-bind:id="grp.id"
        v-bind:title="grp.title"
        v-bind:pressed="grp.pressed"
        v-on:group-selected="onGroupSelected"/>
    </b-button-group>
  </div>
</template>
<script>
import Group from './Group.vue'

export default {
  name: 'GroupList',
  props: {
    groups: {
      type: Array,
      default: () => [
        {
          id: "group-4.1-jobs",
          title: "4.1 jobs"
        }, {
          id: "group-4.2-jobs",
          title: "4.2 jobs"
        }]
    }
  },
  components: {
    Group
  },
  methods: {
    onGroupSelected: function (id) {
      /* eslint no-console: ["error", { allow: ["warn", "error"] }] */
      console.warn("Group '" + id + "' selected")
    }
  }
}
</script>
