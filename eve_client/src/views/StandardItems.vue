<template>
  <div>
    <v-toolbar dense>
      <BtnBack />
      <v-toolbar-title>{{ categoryTitle }}</v-toolbar-title>
    </v-toolbar>
    <v-container>
      <v-card
        v-for="standardItem in standardItems"
        v-bind:key="standardItem.id"
        @click="selectStandardItem(standardItem)"
        :disabled="!standardItem.enabled"
      >
        <v-card-title>
          {{ standardItem.name }}
        </v-card-title>
        <v-card-subtitle>{{ standardItem.standard }}</v-card-subtitle>
      </v-card>
    </v-container>
  </div>
</template>
<script>
import BtnBack from "../components/BtnBack.vue";
export default {
  name: "StandardItems",
  components: {
    BtnBack,
  },
  data() {
    return {};
  },
  mounted() {
    this.$store.dispatch("getStandardItems");
  },
  computed: {
    categoryTitle() {
      return this.$store.state.selectedCategory.name;
    },
    standardItems() {
      return this.$store.state.standardItems;
    },
  },
  methods: {
    selectStandardItem(standardItem) {
      this.$store.commit("selectStandardItem", standardItem);
      if (this.$store.state.selectedStandardItem){
          this.$router.push("/standard_item")
      }
    },
  },
};
</script>
