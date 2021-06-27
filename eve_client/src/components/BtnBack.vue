<template>
    <v-btn icon @click="$router.go(-1)" color="black">
        <v-icon>mdi-arrow-left</v-icon>
      </v-btn>
</template>
<script>
export default {
    name: "BtnBack"
}
</script>