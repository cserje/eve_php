<template>
      <v-dialog
        transition="dialog-top-transition"
        disabled
      >
        <template v-slot:activator="{ on, attrs }">
          <v-btn
            color="black"
            v-bind="attrs"
            v-on="on"
            icon
          ><v-icon>mdi-account-plus</v-icon></v-btn>
        </template>
        <template v-slot:default="dialog">
          <v-card>
            <v-toolbar
              color="primary"
              dark
            >Személy hozzáadása</v-toolbar>
            <v-card-text>
              <div class="text-h2 pa-12">Hello world!</div>
            </v-card-text>
            <v-card-actions class="justify-end">
              <v-btn
                text
                @click="dialog.value = false"
              >Mégsem</v-btn>
            </v-card-actions>
          </v-card>
        </template>
      </v-dialog>
</template>
<script>
export default {
    name : "NewWorker",
    // setup(){
    //     var modal = false;
    //     return{ modal }
    // },
    // methods: {
    //     toggleModal(){
    //         modal = !modal;
    //     }
    // },
}
</script>
<style scoped>

</style>