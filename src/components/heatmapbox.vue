<template>
<div class="heatmapbox" style="width: 100%; height: 100%"> 
    <div id="map" style="position: absolute; width: 480px; height: 550px; border: 10px solid black; border-style: inset">
   </div> 
   </div> 
</template>

<script>
import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css'

// Add this draw object to the map when map loads
mapboxgl.accessToken = 'pk.eyJ1IjoidG9mZmkiLCJhIjoiY2lvMDBxMzR3MDB1eHZza2x4NGI2YjI5OSJ9.IEaNA05pWbT92nOu-lEOYw'


export default {
    name: 'heatmapbox',
    props: ["heatmapData", "selectedTechnique", "compareTechniques"],
    data () {
        return {
        featureCollection: [] 
        }
    },
     mounted () {
        const urlParams = new URLSearchParams(window.location.search)
        this.sessionId = urlParams.get('id')
        this.map = null
        this.initMap()
    },
    computed: {
        markers: function() {
        var locations_all = []
        var locations_selected = []
        for (var i = 0; i < this.heatmapData.length; i++) {
            var technique = this.heatmapData[i][0].technique  
            var coords = this.heatmapData[i].slice(2)
            for (var j = 0; j < coords.length; j++) {
                var single_location = coords[j].geoloc
                locations_all.push(single_location)   
                if (technique.includes(this.selectedTechnique)){
                    locations_selected.push(single_location)   
                }
            } 
        }
        if (this.selectedTechnique == "Alle Techniken"){
            return locations_all
        }
        else {
            return locations_selected
        }                 
      },
      compared_methods() {
        var locations_same = []
        var locations_different = []

        for (var i = 0; i < this.heatmapData.length; i++) {
            var comparisons = this.heatmapData[i][1].comparison
            var coords = this.heatmapData[i].slice(2)
            console.log("here", comparisons[0],comparisons[1])
            for (var j = 0; j < coords.length; j++) {
                var single_location = coords[j].geoloc
                if ((comparisons[0] == "Ja" && comparisons[1] == "Ja") ||
                    (comparisons[0] == "Nein" && comparisons[1] == "Nein")){
                    locations_same.push(single_location)
                    console.log("inside", "yes")
                }
                else {
                    locations_different.push(single_location)
                    console.log("inside", "No")
                }
            }
        }
        if (this.compareTechniques == "same"){
            return locations_same
        }
        else {
            return locations_different
        } 
    }
    },
    watch: {
        markers: {
        deep: true,
        handler: function (newVal) {
        this.featureCollection = newVal
        this.addHeatmap()
            }
        },
        compared_methods: {
        deep: true,
        handler: function (newVal) {
        this.featureCollection = newVal
        this.addHeatmap()
            }
        }
    },
   methods: {
    makeGeoJSON (data) {
    return {
    "type": "GeometryCollection",
    "geometries": data.map(feature => {
      return {
          "type": "Point",
          "coordinates": [feature.lng, feature.lat]
        }
      }
    )
    };
   },
    initMap () {
      const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/dark-v10',
        center: [10.3254293, 51.20],
        zoom: 4.9
      });
      map.on('load', () => {
        console.log('load')
        this.map = map
        
      })
    },

addHeatmap (){

    if (this.map.getSource("earthquakes")) {
    this.map.removeLayer('earthquakes-heat')
    this.map.removeSource('earthquakes')  
    }
    
    var data = this.makeGeoJSON(this.featureCollection)
    //alert(JSON.stringify(data, null, 4));
    this.map.addSource('earthquakes', {
    'type': 'geojson',
    'data': {
    "type": "GeometryCollection",
    "geometries": []
    }
    });
    this.map.getSource('earthquakes').setData(data)
    this.map.addLayer(
{
'id': 'earthquakes-heat',
'type': 'heatmap',
'source': 'earthquakes',
'maxzoom': 9,
'paint': {
// Increase the heatmap weight based on frequency and property magnitude
'heatmap-weight': [
'interpolate',
['linear'],
['get', 'mag'],
0,
0,
6,
1
],
// Increase the heatmap color weight weight by zoom level
// heatmap-intensity is a multiplier on top of heatmap-weight
'heatmap-intensity': [
'interpolate',
['linear'],
['zoom'],
0,
1,
9,
3
],
// Color ramp for heatmap.  Domain is 0 (low) to 1 (high).
// Begin color ramp at 0-stop with a 0-transparancy color
// to create a blur-like effect.
'heatmap-color': [
'interpolate',
['linear'],
['heatmap-density'],
0,
'rgba(33,102,172,0)',
0.2,
'rgb(103,169,207)',
0.4,
'rgb(209,229,240)',
0.6,
'rgb(253,219,199)',
0.8,
'rgb(239,138,98)',
1,
'rgb(178,24,43)'
],
// Adjust the heatmap radius by zoom level
'heatmap-radius': [
'interpolate',
['linear'],
['zoom'],
0,
2,
9,
20
],
// Transition from heatmap to circle layer by zoom level
'heatmap-opacity': [
'interpolate',
['linear'],
['zoom'],
7,
1,
9,
0
]
}
},
'waterway-label'
)
},
}
}


</script>

<style>
.vue-map-container, .vue-map{
  height: 100%;  }

#map{
  position: absolute;
  width:100%;
  height:60%;
  left: 0;
  padding: 0px;
  margin: 0px;
}
</style>

