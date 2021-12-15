<template>
  <div class="container">
     <div v-if="loading" style="z-index: 100;">
      <div class="loading" />
      <span style="position: absolute;margin-left: -10px">Lädt...</span>
    </div>
    <div id="plot-map" />
    <div class="footer">
      <div class="bubble-wrapper">
        {{this.featureCollection}}
      </div>
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
   data () {
    return {
      loading: true,
      markers: [],
      crops: [{
        color: '#F88353',
        name: 'Sugarbeet',
        area: 0
      }],
      selectedCrop: 'Sugarbeet',
      featureCollection: {
        type: 'FeatureCollection',
        features: []
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
  beforeCreate () {
    // reload the page early if no query parameters are attached
    const urlParams = new URLSearchParams(window.location.search)
    if (!urlParams.has('id')) {
      const sessionId = new Date().toISOString()
      urlParams.set('id', sessionId)
      document.location.search = urlParams.toString()
    }
  },
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
        container: 'plot-map',
        style: 'mapbox://styles/toffi/ckwz25stp0usy15k59cckn2sf',
        center: [8.3502733, 52.0887843],
        zoom: 13
      })

      this.map.addControl(
        new MapboxGeocoder({
        accessToken: mapboxgl.accessToken,
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
        this.map.addSource('plots', {
          type: 'geojson',
          data: this.featureCollection
        })

      this.map.addLayer({
      id: "plots",
      type: "fill",
      source: "plots",
      layout: {},
      paint: {
        "fill-color": "red",
        "fill-opacity": 0.4
      }
    });
    
    this.map.resize()
  })

    this.map.on("click", (event) => {
    if (
      event.originalEvent.srcElement &&
      event.originalEvent.srcElement.classList &&
      Array.from(event.originalEvent.srcElement.classList).indexOf("marker") >
        -1
    ) {
      console.log("return");
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
      // create the marker
      const marker = new mapboxgl.Marker(el);

      // create the popup container
      const popupDiv = document.createElement("div");
      popupDiv.className = "popup";
      popupDiv.innerText = "Klicken Sie zum Löschen: .. "
      popupDiv.fontSize = "18px"
      popupDiv.style.backgroundImage = `url(../assets/traktor.png)`;

      // create the trash icon
      const trash = document.createElement("i");
      trash.className = "gg-trash trash";
      trash.style.fontSize = "12px";
      popupDiv.append(trash);
      const popup = new mapboxgl.Popup({ offset: 25 }).setDOMContent(popupDiv);

      // handle click
      trash.addEventListener("click", (event) => {
      // stop the click event from propagating (aka also triggering other behaviour)
      event.stopPropagation();
      // once clicked, we remove the marker again
      marker.remove();
      // also remove from our placed markers array
      const index = this.markers.indexOf(marker);
      this.markers.splice(index, 1);
    });

    // add the marker to the map
      marker.setLngLat(e.lngLat).setPopup(popup).addTo(map).togglePopup();
      this.markers.push(e.lngLat);
      console.log(this.markers[0].lat, this.markers[1].lat, this.markers[2].lat)
        }
  }
}
</script>

<style>
body {
  margin: 0;
  padding: 0;
}
#plot-map {
  position: absolute;
  top: 100px;
  bottom: 84px;
  width: 100%;
}
#crop-summary {
  width: 100% !important;
}
.header {
  position: absolute;
  top: 0;
  width: 100%;
  background-color: white;
  /* height: 150px; */
  min-height: 100px;
  z-index: 10;
  display: inline-flex;
  flex-wrap: nowrap;
  justify-content: space-between;
  align-items: flex-end;
}

@media (min-width: 576px) {
  .header {
    padding: 10px 10px 0px 10px;
    align-items: center;
  }
}

.loading {
  position: absolute;
  background-color: white;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

.footer {
  display: flex;
  position: absolute;
  bottom: 0;
  width: 100%;
  height: 84px;
  overflow: scroll;
}
.footer::before, .footer::after {
  content: '';  /* Insert pseudo-element */
  margin: auto; /* Make it push flex items to the center */
}
.crop {
  display: flex;
  width: 50px;
  margin-right: 25px;
  font-size: 14px;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.container {
  position: absolute;
  width:100%;
  height:60%;
  left: 0;
  padding: 0px;
  margin: 0px;
  /*
  margin: 0 auto;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
  */
}
.input {
  width: 150px !important;
  margin-right: 15px;
}
.input:hover {
  cursor: grab;
}
.input:active {
  cursor: grabbing;
}

.trash {
  color: rgb(241, 22, 22);
}
.trash:hover {
  cursor: pointer;
  color: black;
}

.popup {
  display: inline-flex;
  margin-top: 15px;
  padding: 5px;
}

/* .marker {
  display: block;
  background: rgb(68, 226, 121);
  border: none;
  color: white;
  font-weight: bold;
  font-size: 14px;
  text-align: center;
  line-height: 50px;
  width: 50px;
  height: 50px;
  border-radius: 50%;
  cursor: pointer;
  padding: 0;
} */
</style>
