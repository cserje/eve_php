<template>
  <div>
    <v-toolbar>
      <BtnBack />
      <v-toolbar-title>Felszerelés</v-toolbar-title>
    </v-toolbar>
    <v-container>
      <div>
        <small>Kategória</small><br /><span class="header">{{ category }}</span
        ><br />
        <small>Alkategória</small><br /><span class="header">{{
          standardItem.name
        }}</span
        ><br />
        <small>Szabványszám</small><br /><span class="header">{{
          standardItem.standard
        }}</span
        ><br />
      </div>
    </v-container>
    <v-divider />
    <v-container>
      <v-form ref="standardItemForm" @submit.prevent="submit" v-model="isFormValid">
        <div v-for="field in getFields" :key="field.id">
          <v-select
            v-if="field.type === 'SELECT'"
            :name="field.id"
            :items="field.options"
            :label="field.name"
            :required="field.required"
            v-model="fields[field.id]"
            :rules="[(v) => !!v || !field.required || isInModel(field.id) || 'Kötelező kiválasztani!']"
          ></v-select>
          <v-text-field
            v-if="field.type === 'TEXT'"
            :name="field.id"
            :label="field.name"
            :required="field.required"
            v-model="fields[field.id]"
            :rules="[(v) => !!v || 'Kötelező kitölteni!']"
          ></v-text-field>
        </div>
        <v-select
          v-if='mode === "discover" && workers'
          name="worker"
          :items="workers"
          label="Felhasználó kiválasztása"
          v-model="worker"
          required
          :rules="[(v) => !!v || 'Kötelező kiválasztani!']"
        ></v-select>
        <v-btn elevation="2" outlined type="submit">Mentés</v-btn>
      </v-form>
    </v-container>
  </div>
</template>
<script>
import BtnBack from "../components/BtnBack.vue";
export default {
  name: "StandardItem",

  data() {
    // discover / create / update
    var mode = "";
    // var update = false;
    // var create = false;

    var isFormValid;
    var fields = {};
    var worker;
    return {
      mode,
      isFormValid,
      fields,
      worker,
    };
  },
  components: {
    BtnBack,
  },
  methods: {
    isInModel(fieldId) {
     return Object.keys(this.fields).indexOf(fieldId.toString()) >= 0;
    },
    submit() {
      this.$refs.standardItemForm.validate();
      if (this.isFormValid){
        var data = {standard:  this.$store.state.selectedStandardItem.id, mode: this.mode, fields: this.fields, worker: this.worker};
        console.log(JSON.stringify(data));
      }
    },
  },
  computed: {
    category() {
      return this.$store.state.selectedCategory.name;
    },
    standardItem() {
      return this.$store.state.selectedStandardItem;
    },
    getFields() {
      return this.$store.state.standardItemFields;
    },
    workers() {
      const temp = [];
      this.$store.state.workers.forEach((worker) =>
        temp.push({ text: worker.name, value: worker.id })
      );
      return temp;
    },
  },
  mounted() {
    this.$store.dispatch("getStandardItemFields");
    if (!this.$store.state.selectedWorker) {
      this.mode = "discover";
      this.$store.dispatch("getWorkers");
    } else {
      this.worker = this.$store.state.selectedWorker.id;
    }
  },
};
</script>
<style scoped>
span.header {
  font-weight: bold;
  font-size: 0.9rem;
}
</style>
