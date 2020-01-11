<template>
  <div>
    <b-row>
      <b-button-group>
        <Group
          v-for="(grp, idx) in groups"
          v-bind:key="idx"
          v-bind:id="grp.id"
          v-bind:title="grp.title"
          v-bind:pressed="grp.pressed"
          v-on:group-selected="onGroupSelected"/>
      </b-button-group>
    </b-row>
    <b-row>
      <b-button-group>
        <Job
          v-for="(jb, idx) in jobs"
          v-bind:key="idx"
          v-bind:id="jb.id"
          v-bind:title="jb.title"
          v-bind:pressed="jb.pressed"
          v-on:job-selected="onJobSelected"
        />
      </b-button-group>
    </b-row>
  </div>
</template>
<script>
import Group from './Group.vue'
import Job from './Job.vue'

export default {
  name: 'GroupJobSelector',
  props: {
    /* TODO: make groups API in antelope */
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
  data() {
    return {
      jobs: []
    }
  },
  components: {
    Group,
    Job
  },
  methods: {
    onGroupSelected: function (id) {
      /* eslint no-console: ["error", { allow: ["warn", "error"] }] */
      console.warn("Group '" + id + "' selected")
      this.jobs = [
        {
          id: 'job-1',
          title: 'Job 1'
        }
      ]
    },
    onJobSelected: function (id) {
      /* eslint no-console: ["error", { allow: ["warn", "error"] }] */
      console.warn("selector: job '" + id + "' selected")
      this.$emit('job-selected', id)
    }
  }
}
</script>
