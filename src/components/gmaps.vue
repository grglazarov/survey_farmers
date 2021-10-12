<template>
  <div id="map">
    <!-- <div
      class="card-tools"
      v-if="tools">
      <center>
        <button
          class="button add-marker"
          :style="{'background-color': addMode ? '#66f13d' : '#3d66f1'}"
          @click="addMode = true"
        >{{ addMode ? 'Click on the map' : 'Add field' }}</button>
        <br />
      </center>
      <hr />
      <center>
        <button
          class="hide-tool"
          @click="displayTools(false)"
        >hide tools</button>
      </center>
    </div>
    <button
      v-else
      class="show-tool"
      @click="displayTools(true)"
    >show tools</button> -->

     <!-- the map component -->
    <vue-gmap
      :center="markerCenter"
      map-type-id="hybrid"
      :zoom="13"
      style="width: 100%  "
      @click="onMapClick"
      v-bind:options="options"
      >
      <cluster>
        <!-- the custom marker component -->
         <gmap-circle
          v-for="(marker, index) in markers"
          :key="marker._id"
          :center="marker.position"
          :radius="800"
          :clickable="true"
          :editable="true"
          :draggable="true"
          :visible="true"
          :options="{fillColor: marker.color ,fillOpacity:0.5, strokeColor: '#123456', strokeWeight: 0.5}"
          :marker="marker.position"
          @click="deleteMarker(index)"
          >
        </gmap-circle>
      </cluster>
    </vue-gmap>
  </div>
</template>

<script>
  import { Map } from "gmap-vue";
  export default {
    name: "app",
    components: {
    "vue-gmap": Map
    },
     props: {
      circleColor: {
        type: String},
      addMode: {
        type: Boolean,
        default: false
      }
    },
    data () {
      return {
        markerCenter: {
          lat: 50.8882527,
          lng: 10.3254293
        },
        // addMode: false,
        markers: [],
        tools: true,
        addmode: false,
        
        options: {
          zoomControl: true,
          mapTypeControl: true,
          scaleControl: false,
          streetViewControl: false,
          rotateControl: false,
          fullscreenControl: false,
          disableDefaultUi: false,
          //styles are at the bottom, can be changed
     },
    
      };
    },
    computed: {
      src () {
        return "https://w7.pngwing.com/pngs/788/138/png-transparent-farm-agriculture-tractor-agriculture-leaf-label-logo.png";
      }
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


.live-html {
  padding: 5px;
  border: 1px solid #aaa;
  border-radius: 4px;
  box-shadow: 3px 3px 3px grey;
  min-height: 200px;
  min-width: 200px;
  background-color: #fafafa;
}
.input-group {
  float: right;
  margin-top: 25px;
  margin-right: 25px;
}
.icon {
  margin-left: 15px;
}

.button {
  left: 50%;
  top: 15px;
  z-index: 100;
  color: rgb(255, 255, 255);
  padding: 5px;
  border-radius: 5px;
  margin-left: -12px;
}

.icon-sm {
  padding: 3px;
  border-radius: 4px;
}
.add-marker {
  padding: 8px;
  font-size: 1.3em;
}
.card-tools {
  right: 5px;
  top: 5px;
  padding: 8px;
  background-color: #f5eded;
  border: 1px solid #bbb;
  width: 150px;
  z-index: 100;
  position: absolute;
  box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px;
}
.hide-tool {
  background-color: #126dc2;
  border: 1px solid #bbb;
  font-size: 14px;
}

.show-tool {
  position: absolute;
  top: 5px;
  right: 5px;
  background-color: #126dc2;
  border: 1px solid #bbb;
  font-size: 14px;
  z-index: 100;
}
</style>







// styles: [ { elementType: "geometry", stylers: [{ color: "#242f3e" }] },
//       { elementType: "labels.text.stroke", stylers: [{ color: "#242f3e" }] },
//       { elementType: "labels.text.fill", stylers: [{ color: "#746855" }] },
//       {
//         featureType: "administrative.locality",
//         elementType: "labels.text.fill",
//         stylers: [{ color: "#d59563" }],
//       },
//       {
//         featureType: "poi",
//         elementType: "labels.text.fill",
//         stylers: [{ color: "#d59563" }],
//       },
//       {
//         featureType: "poi.park",
//         elementType: "geometry",
//         stylers: [{ color: "#263c3f" }],
//       },
//       {
//         featureType: "poi.park",
//         elementType: "labels.text.fill",
//         stylers: [{ color: "#6b9a76" }],
//       },
//       {
//         featureType: "road",
//         elementType: "geometry",
//         stylers: [{ color: "#38414e" }],
//       },
//       {
//         featureType: "road",
//         elementType: "geometry.stroke",
//         stylers: [{ color: "#212a37" }],
//       },
//       {
//         featureType: "road",
//         elementType: "labels.text.fill",
//         stylers: [{ color: "#9ca5b3" }],
//       },
//       {
//         featureType: "road.highway",
//         elementType: "geometry",
//         stylers: [{ color: "#746855" }],
//       },
//       {
//         featureType: "road.highway",
//         elementType: "geometry.stroke",
//         stylers: [{ color: "#1f2835" }],
//       },
//       {
//         featureType: "road.highway",
//         elementType: "labels.text.fill",
//         stylers: [{ color: "#f3d19c" }],
//       },
//       {
//         featureType: "transit",
//         elementType: "geometry",
//         stylers: [{ color: "#2f3948" }],
//       },
//       {
//         featureType: "transit.station",
//         elementType: "labels.text.fill",
//         stylers: [{ color: "#d59563" }],
//       },
//       {
//         featureType: "water",
//         elementType: "geometry",
//         stylers: [{ color: "#17263c" }],
//       },
//       {
//         featureType: "water",
//         elementType: "labels.text.fill",
//         stylers: [{ color: "#515c6d" }],
//       },
//       {
//         featureType: "water",
//         elementType: "labels.text.stroke",
//         stylers: [{ color: "#17263c" }],
//       },
// ]