<template>
  <div>
    <v-toolbar>
      <v-toolbar-title>Főoldal</v-toolbar-title>
    </v-toolbar>
    <v-container>
      <v-card @click="openCategories">
        <v-card-title>Böngészés</v-card-title>
      </v-card>
      <v-card @click="openWorkers">
        <v-card-title>Személyek</v-card-title>
      </v-card>
    </v-container>
  </div>
</template>

<script>
export default {
  name: "Home",
  computed: {},
  methods: {
    openCategories() {
      this.$store.dispatch("selectWorker", null);
      this.$store.commit("setMode", "discover");
      this.$router.push("/categories");
    },
    openWorkers() {
      this.$store.dispatch("selectWorker", null);
      this.$router.push("/workers");
    },
  },
};
</script>
<style scoped>
.v-card {
  margin-top: 12px;
}
.v-card:first-child {
  margin-top: 0px;
}
</style>
