<template>
  <div>
    <b-row>
      <b-button-group>
        <GroupButton
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
        <JobButton
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
import GroupButton from './GroupButton.vue'
import JobButton from './JobButton.vue'

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
    GroupButton,
    JobButton
  },
  methods: {
    onGroupSelected: function (id) {
      this.jobs = [
        {
          id: 'release-openshift-ocp-installer-e2e-aws-4.1',
          title: 'release-openshift-ocp-installer-e2e-aws-4.1'
        }
      ]
    },
    onJobSelected: function (id) {
      this.$emit('job-selected', id)
    }
  }
}
</script>
