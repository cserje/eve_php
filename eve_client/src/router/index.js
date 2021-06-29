import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home.vue";
import Login from "../views/Login.vue";
import Categories from "../views/Categories.vue";
import Workers from "../views/Workers.vue";
import Equipments from "../views/Equipments.vue";
import StandardItems from "../views/StandardItems.vue";
import StandardItem from "../views/StandardItem.vue";
import Worker from "../views/Worker.vue";
import store from "../store/index.js";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
  },
  {
    path: "/login",
    name: "Login",
    component: Login,
  },
  {
    path: "/categories",
    name: "Categories",
    component: Categories,
  },
  {
    path: "/workers",
    name: "Workers",
    component: Workers,
  },
  {
    path: "/equipments",
    name: "Equipments",
    component: Equipments,
  },
  {
    path: "/standard_items",
    name: "StandardItems",
    component: StandardItems,
  },
  {
    path: "/standard_item",
    name: "StandardItem",
    component: StandardItem,
  },
  {
    path: "/worker",
    name: "Worker",
    component: Worker,
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});
router.beforeEach((to, from, next) => {
  const isAuthenticated = store.state.user.isAuthenticated;
  if (to.name !== "Login" && !isAuthenticated) next({ name: "Login" });
  // else if (to.name == "Equipments" && !store.state.worker) {
  //     next({ name: "Workers" });
  // }
  else next();
});

export default router;
