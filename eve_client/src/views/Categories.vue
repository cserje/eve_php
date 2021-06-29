<template>
  <div>
    <v-toolbar>
      <BtnBack />
      <v-toolbar-title>Kategóriák</v-toolbar-title>
    </v-toolbar>
    <v-container>
      <v-card
        v-for="category in categories"
        v-bind:key="category.id"
        @click="selectCategory(category)"
        :disabled="!category.count"
      >
        <v-card-title>
          {{ category.name }}
        </v-card-title>
      </v-card>
    </v-container>
  </div>
</template>
<script>
import BtnBack from "../components/BtnBack.vue";
export default {
  name: "Categories",
  setup() {},
  mounted() {
    this.$store.dispatch("getCategories");
  },
  computed: {
    categories() {
      return this.$store.state.categories;
    },
  },
  components: {
    BtnBack,
  },
  methods: {
    selectCategory(category) {
      this.$store.dispatch("selectCategory", category);
      if (this.$store.state.selectedCategory) {
        this.$router.push("/standard_items");
      }
      console.log(this.$store.state.selectedCategory);
    },
  },
};
</script>
