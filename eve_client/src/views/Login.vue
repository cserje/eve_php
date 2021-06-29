<template>
  <div>
    <v-toolbar>
      <v-toolbar-title>Hitelesítés</v-toolbar-title>
    </v-toolbar>
    <v-container>
      <v-form ref="loginForm" v-model="isValidForm" @submit.prevent="submit">
        <v-alert v-if="error" outlined type="error">
          Sikertelen hitelesítés, kérem ellenőrizze az adatait!
        </v-alert>
        <v-text-field
          label="E-mail cím"
          type="email"
          v-model="email"
          :rules="[(v) => !!v || 'E-mail cím megadása kötelező!']"
          required
        ></v-text-field>
        <v-text-field
          label="Jelszó"
          type="password"
          v-model="password"
          :rules="[(v) => !!v || 'Jelszó megadása kötelező!']"
          required
        ></v-text-field>
        <v-btn type="submit" elevation="2" outlined>Bejelentkezés</v-btn>
      </v-form>
    </v-container>
  </div>
</template>
<script>
export default {
  name: "Login",
  data() {
    var email = "";
    var password = "";
    var isValidForm = false;
    var error = false;
    return {
      isValidForm,
      error,
      email,
      password,
    };
  },
  methods: {
    submit() {
      this.$refs.loginForm.validate();
      if (this.isValidForm) {
        this.$store
          .dispatch("login", {
            email: this.email,
            password: this.password,
          })
          .then(() => {
            this.$router.replace("/");
          })
          .catch(() => {
            this.error = true;
          });
      }
    },
  },
};
</script>
<style scoped></style>
