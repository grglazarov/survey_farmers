import GmapCluster from "gmap-vue/dist/components/cluster";
import * as VueGoogleMaps from "gmap-vue";
import Vue from "vue";
import App from "./App.vue";

// Using Cluster requires marker-clusterer-plus to be installed.


Vue.component("cluster", GmapCluster);
Vue.use(VueGoogleMaps, {
  load: {
    region: 'DE',
    language: 'de',
    key: "AIzaSyDf7WjX0VyTmL9c7j33kYka7z7pR1yoTBg",
    v: "weekly",
    libraries: ['places', 'visualization']
  },
  autobindAllEvents: true,
  installComponents: true
});

Vue.config.productionTip = false;

new Vue({
  render: h => h(App)
}).$mount("#app");
