<template>
  <div id="map">
      <div>
        <label for="zip">Postcode</label>
        <input 
        id="zip"
        name="zip" 
        minlength="5" 
        v-model="zipCode"
        maxlength="5" 
        size="5" 
        type="text" 
        inputmode="numeric" 
        required>
        {{this.zipCode}}
    </div>
    <button @click.prevent="this.markerCenter=loadZip()">Get location</button>
    <vue-gmap
      :center="markerCenter"
      map-type-id="roadmap"
      :zoom="5.8"
      v-bind:options="options"
      style="position: absolute; width: 480px; height: 550px; border: 10px solid black; border-style: inset"
      > 
    </vue-gmap>
  </div>
</template>

<script>
  import {gmapApi, Map } from "gmap-vue";

  export default {
   
    computed: {
    google: gmapApi
    },
    name: "app",
    components: {
    "vue-gmap": Map
    },
    data () {
      return {
        markerCenter: {
        lat: 51.20,
        lng: 10.3254293
            },
        zipCode: null,
        options: {
          zoomControl: false,
          mapTypeControl: true,
          scaleControl: false,
          streetViewControl: false,
          rotateControl: false,
          fullscreenControl: false,
          disableDefaultUi: false,
          keyboardShortcuts: false,
          gestureHandling: "none"
     },
    
      };
    },
    methods: {
        loadZip() {
            var zipcode = this.zipCode.toString()
            if (zipcode.length == 5 && !isNaN(zipcode)) {
                var geocoder = new this.google.maps.Geocoder();
                geocoder.geocode({ 'address': 'zipcode ' + zipcode }, function(results, status) {
                if (status == 'OK') {
                    var lat = results[0].geometry.location.lat();
                    var lng = results[0].geometry.location.lng();
                    console.log({lat: lat, lng: lng})
                    return {lat: lat, lng: lng}
                    }
                else {
                    alert('Geocode was not successful for the following reason: ' + status);
                    }
            });  
            }
    }
  }}
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


