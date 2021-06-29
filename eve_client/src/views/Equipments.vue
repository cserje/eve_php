<template>
  <div>
    <v-toolbar>
      <BtnBack />
      <v-toolbar-title>Felszerelések</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn icon color="black" disabled>
        <v-icon>mdi-printer</v-icon>
      </v-btn>
      <v-btn icon color="black" @click="createEquipment"
        ><v-icon>mdi-plus</v-icon></v-btn
      >
    </v-toolbar>
    <v-container class="wrapper-worker">
      <v-icon size="60px" color="black">mdi-account-circle</v-icon>
      <h2>{{ worker.name }}</h2>
      <p>{{ worker.profession }}</p>
    </v-container>
    <v-divider></v-divider>
    <v-subheader>FELSZERELÉSEK</v-subheader>
    <v-container>
      <v-card v-for="equipment in equipments" :key="equipment.equipment_id">
        <v-card-title>{{ equipment.standard_item.name }}</v-card-title>
        <v-card-subtitle>{{ equipment.category.name }}</v-card-subtitle>
        <v-card-text>
          <v-chip color="primary">{{
            standardNumber(equipment.standard_item)
          }}</v-chip>
        </v-card-text>
        <v-card-actions>
          <v-btn color="red" text @click="removeEquipment(equipment)"
            >Törlés</v-btn
          ><v-btn text @click="editEquipment(equipment)"
            >Módosítás</v-btn
          ></v-card-actions
        >
      </v-card>
    </v-container>
  </div>
</template>
<script>
import BtnBack from "../components/BtnBack.vue";

export default {
  name: "Equipments",
  components: {
    BtnBack,
  },
  data() {
    return {};
  },
  computed: {
    worker() {
      return this.$store.state.selectedWorker;
    },
    equipments() {
      return this.$store.state.equipments;
    },
  },
  mounted() {
    this.$store.dispatch("getEquipments");
  },
  beforeDestroy() {
    this.$store.state.equipments = [];
  },
  methods: {
    standardNumber(standard_item) {
      console.log(standard_item);
      // return "1";
      var number = "";
      standard_item.values.forEach((field) => {
        if (field.in_standard) {
          number += field.value;
        }
      });
      return number;
    },
    editEquipment(equipment) {
      var fieldRecord = {};
      equipment.standard_item.values.forEach((field) => {
        fieldRecord[field["field_id"]] = field["value"];
      });
      this.$store.commit("selectStandardItem", equipment.standard_item);
      this.$store.commit("selectEquipment", fieldRecord);
      this.$store.commit("setMode", "update");
      this.$store.commit("selectCategory", equipment.category);
      this.$store.state.selectedEquipmentId = equipment.equipment_id;
      this.$router.push("/standard_item");
      console.log(equipment);
    },
    createEquipment() {
      console.log("createEquipment");
      this.$store.commit("selectEquipment", null);
      this.$store.commit("setMode", "create");
      this.$router.push("/categories");
    },
    removeEquipment(equipment) {
      const url = "http://localhost/eve/eve_server/php/equipment/remove.php";
      const payload = new FormData();
      payload.append("equipment_id", equipment.equipment_id);
      new Promise((resolve, reject) => {
        const xhr = new XMLHttpRequest();
        xhr.open("POST", url, true);
        xhr.send(payload);
        xhr.onreadystatechange = function() {
          if (this.readyState === 4) {
            if (this.status === 200) {
              resolve();
            } else {
              reject();
            }
          }
        };
      })
        .then(() => {
          this.$store.dispatch("getEquipments");
        })
        .catch((error) => console.log(error));
    },
  },
};
</script>
<style scoped>
.wrapper-worker {
  width: 100%;
  text-align: center;
}
.v-card__actions {
  display: flex;
  justify-content: flex-end;
}
</style>
