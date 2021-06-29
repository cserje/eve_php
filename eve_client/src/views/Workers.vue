<template>
  <div>
    <v-toolbar>
      <BtnBack />
      <v-toolbar-title>Személyek</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn color="black" @click="createWorker" icon
        ><v-icon>mdi-account-plus</v-icon></v-btn
      >
    </v-toolbar>
    <v-container>
      <v-card v-for="worker in workers" v-bind:key="worker.id">
        <v-card-title>{{ worker.name }}</v-card-title>
        <v-card-subtitle>{{ worker.profession }}</v-card-subtitle>
        <v-card-actions>
          <v-btn
            class="ic-remove"
            icon
            color="red"
            @click="removeWorker(worker)"
            ><v-icon>mdi-account-remove</v-icon></v-btn
          >
          <v-btn icon color="black" @click="editWorker(worker)"
            ><v-icon>mdi-account-edit</v-icon></v-btn
          >
          <v-btn text @click="openEquipments(worker)">Felszerelések</v-btn>
        </v-card-actions>
        <!-- <v-container class="flex-row">
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
        </v-container> -->
      </v-card>
    </v-container>
  </div>
</template>
<script>
import BtnBack from "../components/BtnBack.vue";

export default {
  name: "Workers",
  components: {
    BtnBack,
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
      this.$router.push({
        name: "Worker",
        params: { operation: "create" },
      });
    },
    editWorker(worker) {
      console.log(worker);
      this.$router.push({
        name: "Worker",
        params: { operation: "update", worker: worker },
      });
      // return alert("Nincs implementálva");
    },
    removeWorker(worker) {
      const data = {
        user_id: this.$store.state.user.id,
        worker_id: worker.id,
      };
      this.$store
        .dispatch("deleteWorker", data)
        .then(() => this.$store.dispatch("getWorkers"))
        .catch(() => alert("Személy törlése sikertelen!"));
    },
    openEquipments(worker) {
      this.$store.dispatch("selectWorker", worker);
      console.log(worker.name);
      this.$router.push("/equipments");
    },
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
.v-card__actions {
  display: flex;
  justify-content: flex-end;
  flex-wrap: wrap;
}
</style>
