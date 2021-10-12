<template>
  <div id="map">

    <vue-gmap
      :center="markerCenter"
      map-type-id="roadmap"
      :zoom="5.8"
      @click="onMapClick"
      v-bind:options="options"
      style="height: 500px; width:700px; margin: auto; align: center; border: 20px solid grey; border-style: inset"
      > 
    <gmap-heatmap-layer
      :data = "markers"
      :options="{opacity: 0.6, gradient: colors, radius: 10, maxIntensity: 20, dissipating: true}"
    />
    </vue-gmap>
    <div>
    <span>{{ heatmapData }}</span>
    </div>
  </div>
</template>

<script>
  import {gmapApi, Map } from "gmap-vue";

  export default {
    computed: {
      colors() {
    if (this.selectedTechnique === 'alle Techniken') return [
        'rgba(204, 203, 245, 0)',
        'rgba(204, 203, 245, 1)',// 1
        'rgba(198, 197, 237, 1)',// 2 
        'rgba(198, 188, 253, 1)',// 3
        'rgba(176, 167, 235, 1)',// 4
        'rgba(168, 152, 249, 1)',// 5
        'rgba(125, 132, 224, 1)',// 6
        'rgba(101, 100, 222, 1)',// 7
        'rgba(62, 67, 181, 1)'   // 8
]
    if (this.selectedTechnique === 'Striegel') return [
        "rgba(0, 255, 255, 0)",
        "rgba(0, 255, 255, 1)",
        "rgba(0, 191, 255, 1)",
        "rgba(0, 127, 255, 1)",
        "rgba(0, 63, 255, 1)",
        "rgba(0, 0, 255, 1)",
        "rgba(0, 0, 223, 1)",
        "rgba(0, 0, 191, 1)",
        "rgba(0, 0, 159, 1)",
        "rgba(0, 0, 127, 1)",
        "rgba(63, 0, 91, 1)",
        "rgba(127, 0, 63, 1)",
        "rgba(191, 0, 31, 1)",
        "rgba(255, 0, 0, 1)",
  ]
    return null
    },
    google: gmapApi,
        markers() {
        if (this.google) {
          var locations_all = []
          var locations_selected = []
          for (var i = 0; i < this.heatmapData.length; i++) {
              var technique = this.heatmapData[i][0].technique  
              var coords = this.heatmapData[i].slice(1) 

              for (var j = 0; j < coords.length; j++) {
                var single_coords = coords[j].geoloc
                console.log(single_coords) 
                locations_all.push({location: new this.google.maps.LatLng(single_coords), weight: 30})   
                if (technique.includes(this.selectedTechnique)){
                    locations_selected.push({location: new this.google.maps.LatLng(single_coords), weight: 30})   
                }
          } 
          }
          if (this.selectedTechnique == "alle Techniken"){
            return locations_all
          }
          else {
            return locations_selected
          }
        }
        return [];
      },
    },
    name: "app",
    components: {
    "vue-gmap": Map
    },
     props: ["heatmapData", "selectedTechnique"]
    ,
    data () {
      return {
        markerCenter: {
          lat: 50.8882527,
          lng: 10.3254293
        },
        // addMode: false,
        tools: true,
        addmode: false,
        technique_colors: {"alle Techniken" : "#9B29F8"}[
                          {"Striegel" : ['white', 'blue']}, 
                          {"Scharhacke" : "#EAB90C"},  
                          {"Hackbürste" : "#06498B"}, 
                          {"Trennhacke" : "#909085"},  
                          {"Hackfräse" : "green"},
                          {"Rollhacke" : "#EAB90C"},  
                          {"Hackstriegelcolor" : "#06498B"}, 
                          {"Fingerhacke" : "#909085"},  
                          {"Häufelgerät" : "green"},
                          {"Reihenstriegel" : "#909085"},  
                          {"Rotorstriegel" : "green"}],
        options: {
          zoomControl: true,
          mapTypeControl: true,
          scaleControl: false,
          streetViewControl: false,
          rotateControl: false,
          fullscreenControl: false,
          disableDefaultUi: false,
 
     },
    
      };
    },
    methods: {
      displayTools (value) {
        this.tools = value
      },
      deleteMarker (index) {
        this.markers.splice(index, 1);
      },
      onMapClick (event) {
        if (this.addmode) {
          this.markers.push({
            color: this.circleColor,
            position: {
            lat: event.latLng.lat(),
            lng: event.latLng.lng()
            }
          });
          this.$emit('map_clicked', this.markers)
          this.addmode = false
        } 
      },
      setMode: function(value){
        this.addmode = value
      }
    }
  };
</script>

<style>
@import "https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css";

.vue-map-container, .vue-map{
  height: 100%;  
}
#map{
  position: absolute;
  width:100%;
  height:60%;
  left: 0;
  padding: 0px;
  margin: 0px;
}
.add-marker {
  padding: 8px;
  font-size: 1.3em;
}

</style>
