<template>
  <div>
    <b-row>
      <b-button-group>
        <GroupButton
          v-for="(grp, idx) in groups"
          :key="idx"
          :id="grp.id"
          :title="grp.title"
          :pressed="groupid == grp.id ? true : false"/>
      </b-button-group>
    </b-row>
    <b-row>
      <b-button-group>
        <JobButton
          v-for="(jb, idx) in jobs"
          :key="idx"
          :id="jb.id"
          :title="jb.title"
          :pressed="jobid == jb.id ? true : false"/>
      </b-button-group>
    </b-row>
  </div>
</template>

<script>
import GroupButton from './GroupButton.vue'
import JobButton from './JobButton.vue'

const defaultGroups = [
  {
    id: "group-4.1-jobs",
    title: "4.1 jobs"
  }, {
    id: "group-4.2-jobs",
    title: "4.2 jobs"
  }, {
    id: "group-4.3-jobs",
    title: "4.3 jobs"
  }, {
    id: "group-4.4-jobs",
    title: "4.4 jobs"
  }
]

const realGroupJobs = [
  {
    "id": "release-openshift-origin-installer-e2e-aws-sdn-network-stress-4.4",
    "title": "release-openshift-origin-installer-e2e-aws-sdn-network-stress-4.4"
  }
]

export default {
  name: 'TopNavBar',
  components: {
    GroupButton,
    JobButton
  },
  computed: {
    groupid() {
      /* TODO: fetch groups from backend here */
      return this.$route.params.groupid
    },
    jobid() {
      /* TODO: fetch jobs from backend here */
      return this.$route.params.jobid
    }
  },
  data() {
    return {
      jobs: typeof(this.groupid) != 'undefined' ? [] : realGroupJobs,
      groups: defaultGroups
    }
  },
}
</script>
