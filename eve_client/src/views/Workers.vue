<template>
  <div>
    <v-toolbar dense>
       <BtnBack/>
      <v-toolbar-title>Személyek</v-toolbar-title>
      <v-spacer></v-spacer>
      <ModalNewWorker />
    </v-toolbar>
    <v-container>
      <v-card v-for="worker in workers" v-bind:key="worker.id">
        <v-card-title>{{ worker.name }}</v-card-title>
        <v-card-subtitle>{{ worker.profession }}</v-card-subtitle>
        <v-container class="flex-row">
          <div>
            <v-btn icon color="black" @click="editWorker(worker)"
              ><v-icon>mdi-account-edit</v-icon></v-btn
            >
            <v-btn
              class="ic-remove"
              icon
              color="red"
              @click="removeWorker(worker)"
              ><v-icon>mdi-account-remove</v-icon></v-btn
            >
          </div>
          <v-btn text @click="openEquipments(worker)">Felszerelések</v-btn>
        </v-container>
      </v-card>
    </v-container>
  </div>
</template>
<script>
import ModalNewWorker from "../components/ModalNewWorker.vue";
import BtnBack from "../components/BtnBack.vue";

export default {
  name: "Workers",
  components: {
    ModalNewWorker,
    BtnBack
  },
  mounted() {
    this.$store.dispatch("getWorkers");
  },
  data() {
    return {};
  },
  computed: {
    workers() {
      return this.$store.state.workers;
    },
  },
  methods: {
    createWorker() {
      alert("Nincs implementálva");
    },
    editWorker(worker) {
      console.log(worker);
      return alert("Nincs implementálva");
    },
    removeWorker(worker) {
      console.log(worker);
      return alert("Nincs implementálva");
    },
    openEquipments(worker){
      this.$store.dispatch("selectWorker", worker);
      console.log(worker.name);
      this.$router.push("/equipments")
    }
  },
};
</script>
<style>
.v-card {
  margin-top: 12px;
}
.v-card:first-child {
  margin-top: 0px;
}
.flex-row {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}
.ic-remove {
  margin-left: 10px;
}
</style>
