<template>
  <div>
    <v-toolbar dense>
      <BtnBack/>
      <v-toolbar-title>Felszerelések</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn icon color="black">
        <v-icon>mdi-printer</v-icon>
      </v-btn>
    </v-toolbar>
    <v-container class="wrapper-worker">
      <v-icon size="60px" color="black">mdi-account-circle</v-icon>
      <h2>{{ worker.name }}</h2>
      <h3>{{ worker.profession }}</h3> </v-container
    ><v-divider></v-divider>
  </div>
</template>
<script>
import BtnBack from "../components/BtnBack.vue";

export default {
  name: "Equipments",
  components :{
    BtnBack
  },
  data() {
    return {};
  },
  computed: {
    worker() {
      return this.$store.state.selectedWorker;
    },
  },
  methods: {
  },
};
</script>
<style scoped>
.wrapper-worker {
  width: 100%;
  text-align: center;
}
</style>
