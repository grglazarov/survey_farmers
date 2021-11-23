<template>
  <div id="map">
     <!-- the map component -->
    <vue-gmap
      :center="center"
      map-type-id="hybrid"
      :zoom="15"
      style="width: 100%; height: 100%"
      @click="onMapClick"
      v-bind:options="options"
      >
      <cluster>
        <!-- the custom marker component *circle* -->
         <gmap-circle
          v-for="(marker, index) in markers"
          :key="marker._id"
          :center="marker.position"
          :radius="150"
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
    computed: {
      center () {
        return this.markerCenter
      }
  },
     props: {
      circleColor: {
        type: String},
      addMode: {
        type: Boolean,
        default: false
       
      },
       markerCenter:{
        type: Object,
        default () {
        return {  
          lat: 50.8882527,
          lng: 10.3254293
           }
       }}        
    },
    data () {
      return {
        
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
          //styles: -- at the bottom, can be changed
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