<template>
  <div class="surveymapbox">
      <div id="survey-map" style="position: relative; width: 100%; height: 560px"> 
      </div>  
  </div>

</template>

<script>
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import mapboxgl from 'mapbox-gl'
var PouchDB = require('pouchdb');
let pouchDb = PouchDB.default.defaults();
const db = new pouchDb('https://fruchtfolge.agp.uni-bonn.de/db/fields', { skip_setup: true })
import 'mapbox-gl/dist/mapbox-gl.css'
import { union } from 'polygon-clipping'


export default {
  name: 'surveymapbox',
  props: ["markedFarm"],
   data () {
    return {
      markers: [],
      selectedCrop: 'Sugarbeet',
      featureCollection: {
        type: 'FeatureCollection',
        features: [],
      }
    }
  },
  watch: {
    crops: {
      deep: true,
      handler () {
        return this.updateData()
      }
    }
  },
  // beforeCreate () {
  //   // reload the page early if no query parameters are attached
  //   const urlParams = new URLSearchParams(window.location.search)
  //   if (!urlParams.has('id')) {
  //     const sessionId = new Date().toISOString()
  //     urlParams.set('id', sessionId)
  //     document.location.search = urlParams.toString()
  //   }
  // },
  async mounted () {
    // get or create session id
    const urlParams = new URLSearchParams(window.location.search)
    this.sessionId = urlParams.get('id')
    try {
      const data = await db.get(this.sessionId)
      this._rev = data._rev
      this.featureCollection = data.featureCollection
    } catch (e) {
      // no data yet
    }
    this.createMap()
    this.loading = false
  },
  methods: {
    async updateData () {
      let data = {
        _id: this.sessionId,
        _rev: this._rev
      }

      try {
        data = await db.get(this.sessionId)
      } catch (e) {
        // no data yet
      }
      data.featureCollection = this.featureCollection
    },
    merge (inputs) {
      const output = {
        id: inputs[0].id,
        type: inputs[0].type,
        geometry: {
          coordinates: union(...inputs.map(i => i.geometry.coordinates)),
          type: 'MultiPolygon'
        },
        properties: inputs[0].properties
      }
      return output
    },
    createMap () {
      mapboxgl.accessToken = 'pk.eyJ1IjoidG9mZmkiLCJhIjoiY2t3ejJwN3R4MHR2MzJvbGF4bHljejNhdCJ9.uKgZYyMZoCjn2wQSD_vaUw'

      this.map = new mapboxgl.Map({
        container: 'survey-map',
        style: 'mapbox://styles/toffi/ckyn0rxbi8kj414qpssdlx2zt', //mapbox://styles/toffi/ckwz25stp0usy15k59cckn2sf'
        center: [8.3502733, 52.0887843],
        zoom: 13
      })

      this.map.addControl(
        new MapboxGeocoder({
        accessToken: mapboxgl.accessToken,
        language: 'de-DE',
        mapboxgl: mapboxgl
        })
      );

      this.map.addControl(
        new mapboxgl.GeolocateControl({
          positionOptions: {
            enableHighAccuracy: true
          },
          trackUserLocation: true
        }), 'bottom-right'
      )

      this.map.on('load', () => {
        this.map.resize()
        this.map.addSource('plots', {
          type: 'geojson',
          data: this.featureCollection
        })

    let labels = [ 'country-label', 'state-label', 
    'settlement-subdivision-label', 
    'airport-label', 'poi-label', 'water-point-label', 
    'water-line-label', 'natural-point-label', 
    'natural-line-label', 'waterway-label', 'road-label' ];
    
    labels.forEach(label => {
      this.map.setLayoutProperty(label, 'text-field', ['get','name_de']);
    });
      
      this.map.addLayer({
      id: "plots",
      type: "fill",
      source: "plots",
      layout: {},
      filter: ['==', 'farm', "own"],   
      paint: {
                'fill-color': "#FF7F50",
                "fill-opacity": 0.8
      }
    });
      this.map.addLayer({
      id: "plots2",
      type: "fill",
      source: "plots",
      layout: {},
      filter: ['!=', 'farm', "own"],
      paint: {'fill-color': "#1E90FF"
                ,"fill-opacity": 0.8
      }
    });
  })

    this.map.on("click", (event) => {
    if (
      event.originalEvent.srcElement &&
      event.originalEvent.srcElement.classList &&
      Array.from(event.originalEvent.srcElement.classList).indexOf("marker") >
        -1
    ) {
      return;
    }
    // check if user clicked on a pre-drawn field
    const features = this.map.queryRenderedFeatures(event.point);
    let feature;

    if (features[0]) {
      try {
        // for performance reasons, Mapbox splits the fields into smaller triangles (tesselation)
        // in order to recover the acutal field, we need to merge the triangles again
        const featureData = this.map.querySourceFeatures("composite", {
          sourceLayer: "plots_germany",
          filter: ["==", "area", features[0].properties.area]
        });
        if (Array.isArray(featureData)) {
          feature = this.merge(featureData);
        } else {
          feature = featureData;
        }
        // add id to the feature
        feature.properties.farm = this.markedFarm;
        feature.properties.ID = featureData[0].id;
        // if the plot hasn't been selected before, we add it to our feature collection
        // otherwise we remove it
        const fieldIndex = this.featureCollection.features.findIndex(
          (f) => f.properties.ID === feature.properties.ID
        );
        if (fieldIndex > -1) {
          // field already selected => de-select
          this.featureCollection.features.splice(fieldIndex, 1);
        } else {
          // field not selected yet! add it to our collection
          this.featureCollection.features.push(feature);
        }
        //this.featureCollection = this.featureCollection;
        // now update the plot layer
        this.map.getSource("plots").setData(this.featureCollection);
        this.$emit('map_clicked', this.markers, this.featureCollection)
      } catch (error) {
        console.error(error);
        this.addMarker(event, this.map);
      }
    } else {
      this.addMarker(event, this.map);
    }
  });
    },
      addMarker(e, map) {
      // create a new DIV element that contains our marker
     
      const el = document.createElement("div");
      el.className = "marker";
      // el.innerText = "Hallo"
      el.style.backgroundImage = `url(https://cdn-icons-png.flaticon.com/512/146/146748.png)`;
      el.style.width = `40px`;
      el.style.height = `40px`;
      el.style.backgroundSize = '100%';
      if (this.markedFarm == 'own') {
        el.style.backgroundColor = '#FF7F50'
      }
      else {
        el.style.backgroundColor = '#1E90FF'
      } 
      el.style.borderRadius = `50%`;
      el.style.opacity = "0.8"
      // create the marker
      const marker = new mapboxgl.Marker(el);

    // add the marker to the map
      marker.setLngLat(e.lngLat).addTo(map).togglePopup();
      if (this.markedFarm == 'own') {
        this.markers.push({"own": e.lngLat});
      }
      else {
       this.markers.push({"others": e.lngLat});
      }
            // handle click
      el.addEventListener("click", (event) => {
      // stop the click event from propagating (aka also triggering other behaviour)
      event.stopPropagation();
      // once clicked, we remove the marker again
      marker.remove();
        var index = this.markers - 1
      // also remove from our placed markers array
        this.markers.splice(index, 1);
        this.$emit('map_clicked', this.markers, this.featureCollection)
    });
   this.$emit('map_clicked', this.markers, this.featureCollection)
    }
  }
}
</script>

<style scoped>
.vue-map-container, .vue-map{
  height: 100%;  }
</style>
