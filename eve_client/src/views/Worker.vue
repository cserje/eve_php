<template>
  <div>
    <v-toolbar>
      <BtnBack />
      <v-toolbar-title>{{ title }}</v-toolbar-title>
    </v-toolbar>
    <v-container>
      <v-form ref="workerForm" v-model="isValidForm" @submit.prevent="submit">
        <v-text-field
          label="Név"
          type="name"
          v-model="worker.name"
          :rules="[(v) => !!v || 'Név megadása kötelező!']"
          required
        ></v-text-field>
        <v-text-field
          label="Foglalkozás"
          type="text"
          v-model="worker.profession"
          :rules="[(v) => !!v || 'Foglalkozás megadása kötelező!']"
          required
        ></v-text-field>
        <v-btn type="submit" outlined elevation="2">Mentés</v-btn>
      </v-form>
    </v-container>
  </div></template
>
<script>
import BtnBack from "../components/BtnBack.vue";
export default {
  name: "Worker",
  components: {
    BtnBack,
  },
  data() {
    return {
      operation: "create",
      isValidForm: null,
      worker: {
        id: null,
        name: "",
        profession: "",
      },
    };
  },
  methods: {
    submit() {
      this.$refs.workerForm.validate();
      if (this.isValidForm) {
        console.log(this.operation, this.worker, this.$store.state.user.id);
        if (this.operation === "create") {
          const data = {
            user_id: this.$store.state.user.id,
            name: this.worker.name,
            profession: this.worker.profession,
          };
          this.$store
            .dispatch("createWorker", data)
            .then(() => {
              this.$router.go(-1);
            })
            .catch(() => {
              alert("Személy létrehozása sikertelen!");
            });
        } else if (this.operation === "update") {
          const data = {
            user_id: this.$store.state.user.id,
            worker_id: this.worker.id,
            name: this.worker.name,
            profession: this.worker.profession,
          };
          this.$store
            .dispatch("updateWorker", data)
            .then(() => {
              this.$router.go(-1);
            })
            .catch(() => {
              alert("Személy frissítése sikertelen!");
            });
        }
      }
    },
  },
  computed: {
    title() {
      switch (this.operation) {
        case "create":
          return "Személy hozzáadása";
        case "update":
          return "Személy szerkesztése";
        default:
          return "Személy";
      }
    },
  },
  created() {
    console.log("Params: ", this.$route.params);
    if (this.$route.params) {
      if (this.$route.params.operation) {
        this.operation = this.$route.params.operation;
      }
      if (this.$route.params.worker) {
        this.worker = this.$route.params.worker;
      }
    }
    console.log("asd", this.operation, this.worker);
  },
};
</script>
