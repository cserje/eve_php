import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

var baseUrl = "http://localhost/eve/eve_server/php";
// TODO: page refresh state mentés
export default new Vuex.Store({
  state: {
    user: {
      isAuthenticated: false,
      id: 0,
      name: "",
      email: "",
    },
    mode: "",
    workers: [],
    categories: [],
    standardItems: [],
    equipments: [],
    standardItemFields: [],
    selectedWorker: null,
    selectedCategory: null,
    selectedStandardItem: null,
    selectedEquipment: null,
    selectedEquipmentId: null,
    // selectedStandardItem: null,
    session: {},
  },
  mutations: {
    setMode(state, mode) {
      state.mode = mode;
    },
    setLoggedIn(state, payload) {
      state.user.isAuthenticated = true;
      state.user.id = payload.id;
      state.user.name = payload.name;
      state.user.email = payload.email;
      state.workers = [];
      state.session = {};
    },
    saveWorkers(state, workers) {
      state.workers = [];
      workers.forEach((worker) => {
        state.workers.push({
          id: worker.id,
          name: worker.name,
          profession: worker.profession,
        });
      });
    },
    saveCategories(state, categories) {
      state.categories = [];
      categories.forEach((category) => {
        state.categories.push({
          id: category.id,
          name: category.name,
          icon: category.icon,
          count: category.count,
        });
      });
    },
    saveStandardItems(state, standardItems) {
      state.standardItems = [];
      standardItems.forEach((standardItem) => {
        const { id, name, standard, icon, enabled } = standardItem;
        state.standardItems.push({ id, name, standard, icon, enabled });
      });
    },
    saveEquipments(state, equipments) {
      state.equipments = equipments;
    },
    selectWorker(state, worker) {
      state.selectedWorker = worker;
    },
    selectCategory(state, category) {
      state.selectedCategory = category;
    },
    selectStandardItem(state, standardItem) {
      state.selectedStandardItem = standardItem;
    },
    saveStandardItemFields(state, standardItemFields) {
      state.standardItemFields = standardItemFields;
    },
    selectEquipment(state, equipment) {
      state.selectedEquipment = equipment;
    },
  },
  getters: {},
  actions: {
    createWorker(store, data) {
      const url = `${baseUrl}/worker/create.php`;
      const payload = new FormData();
      payload.append("user_id", data.user_id);
      payload.append("name", data.name);
      payload.append("profession", data.profession);
      return new Promise((resolve, reject) => {
        const xhr = new XMLHttpRequest();
        xhr.open("POST", url, true);
        xhr.send(payload);
        xhr.onreadystatechange = function() {
          if (this.readyState === 4) {
            if (this.status === 200) {
              console.log("resolve");
              resolve();
            } else {
              console.log("reject");
              reject();
            }
          }
        };
      });
    },
    updateWorker(store, data) {
      const url = `${baseUrl}/worker/update.php`;
      const payload = new FormData();
      payload.append("user_id", data.user_id);
      payload.append("worker_id", data.worker_id);
      payload.append("name", data.name);
      payload.append("profession", data.profession);
      return new Promise((resolve, reject) => {
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
      });
    },
    deleteWorker(store, data) {
      const url = `${baseUrl}/worker/delete.php`;
      const payload = new FormData();
      payload.append("user_id", data.user_id);
      payload.append("worker_id", data.worker_id);
      return new Promise((resolve, reject) => {
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
      });
    },

    login(store, payload) {
      return new Promise((oResolve, oReject) => {
        new Promise((resolve, reject) => {
          const xhr = new XMLHttpRequest();
          xhr.onreadystatechange = function() {
            if (this.readyState === 4) {
              if (this.status === 200) {
                resolve(this.response);
              } else {
                reject();
              }
            }
          };
          const formData = new FormData();
          formData.append("email", payload.email);
          formData.append("password", payload.password);
          const url = `${baseUrl}/auth/login.php`;
          xhr.open("POST", url, true);
          xhr.send(formData);
        })
          .then((data) => {
            const payload = JSON.parse(data);
            store.commit("setLoggedIn", payload);
            oResolve();
          })
          .catch(() => {
            oReject();
          });
      });
    },
    getWorkers(store) {
      console.log(store.state.user);
      new Promise((resolve, reject) => {
        const formData = new FormData();
        formData.append("user_id", store.state.user.id);
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
          if (this.readyState === 4) {
            if (this.status === 200) {
              resolve(this.response);
            } else {
              reject();
            }
          }
        };
        const url = `${baseUrl}/worker/get_workers.php`;
        xhr.open("POST", url, true);
        xhr.send(formData);
      })
        .then((payload) => {
          var data = JSON.parse(payload);
          store.commit("saveWorkers", data);
        })
        .catch(() => {});
    },
    getCategories(store) {
      new Promise((resolve, reject) => {
        const xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
          if (this.readyState === 4) {
            if (this.status === 200) {
              resolve(this.response);
            } else {
              reject();
            }
          }
        };
        const url = `${baseUrl}/standard/get_categories.php`;
        xhr.open("POST", url, true);
        xhr.send();
      })
        .then((payload) => {
          var data = JSON.parse(payload);
          store.commit("saveCategories", data);
        })
        .catch(() => {});
    },
    getEquipments(store) {
      console.log("getEquipments");
      new Promise((resolve, reject) => {
        const payload = new FormData();
        payload.append("worker_id", store.state.selectedWorker.id);
        const xhr = new XMLHttpRequest();
        const url = `${baseUrl}/equipment/get.php`;
        xhr.open("POST", url, true);
        xhr.send(payload);
        xhr.onreadystatechange = function() {
          if (this.readyState === 4) {
            if (this.status === 200) {
              resolve(this.response);
            } else {
              reject();
            }
          }
        };
      })
        .then((payload) => {
          const data = JSON.parse(payload);
          store.commit("saveEquipments", data);
        })
        .catch(() => {});
    },
    selectWorker(store, worker) {
      store.commit("selectWorker", worker);
    },
    selectCategory(store, category) {
      console.log("selectCategory");
      store.commit("selectCategory", category);
    },
    getStandardItems(store) {
      const category = store.state.selectedCategory;
      new Promise((resolve, reject) => {
        const formData = new FormData();
        formData.append("category_id", category.id);
        var xhr = new XMLHttpRequest();
        const url = `${baseUrl}/standard/get_standard_items.php`;
        xhr.open("POST", url, true);
        xhr.send(formData);
        xhr.onreadystatechange = function() {
          if (this.readyState === 4) {
            if (this.status === 200) {
              resolve(this.response);
            } else {
              reject();
            }
          }
        };
      })
        .then((payload) => {
          const data = JSON.parse(payload);
          store.commit("saveStandardItems", data);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    getStandardItemFields(store) {
      console.log(store);
      new Promise((resolve, reject) => {
        const payload = new FormData();
        payload.append("standard_item_id", store.state.selectedStandardItem.id);
        const url = `${baseUrl}/standard/get_standard_item_fields.php`;
        const xhr = new XMLHttpRequest();
        xhr.open("POST", url, true);
        xhr.send(payload);
        xhr.onreadystatechange = function() {
          if (this.readyState === 4) {
            if (this.status === 200) {
              resolve(this.response);
            } else {
              reject();
            }
          }
        };
      })
        .then((payload) => {
          const data = JSON.parse(payload);
          this.commit("saveStandardItemFields", data);
        })
        .catch((error) => console.log(error));
    },
    createEquipment(store, data) {
      // standard, fields, worker
      const url = `${baseUrl}/equipment/create.php`;
      const payload = new FormData();
      payload.append("worker_id", data.worker);
      payload.append("user_id", store.state.user.id);
      payload.append("fields", JSON.stringify(data.fields));
      payload.append("standard_id", data.standard);

      return new Promise((resolve, reject) => {
        const xhr = new XMLHttpRequest();
        xhr.open("POST", url, true);
        xhr.send(payload);
        xhr.onreadystatechange = function() {
          if (this.readyState === 4) {
            if (this.status === 200) {
              resolve(this.response);
            } else {
              reject();
            }
          }
        };
      });
    },
    updateEquipment(store, data) {
      const url = `${baseUrl}/equipment/update.php`;
      const payload = new FormData();
      payload.append("equipment_id", data.equipment_id);
      payload.append("fields", JSON.stringify(data.fields));
      return new Promise((resolve, reject) => {
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
      });
    },
  },
});
