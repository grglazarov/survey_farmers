<template>
<div class="heatmapbox">  <!-- style="width: 100%; height: 100%">  -->
    <div id="heatmap-map" style="position: relative; width: 100%; height: 550px; border: 10px solid black; border-style: inset"> 

   </div> 
   </div> 
</template>

<script>
import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css'

mapboxgl.accessToken = 'pk.eyJ1IjoidG9mZmkiLCJhIjoiY2lvMDBxMzR3MDB1eHZza2x4NGI2YjI5OSJ9.IEaNA05pWbT92nOu-lEOYw'


export default {
    name: 'heatmapbox',
    props: ["heatmapData", "selectedTechnique"],
    data () {
        return {
        featureCollection: [],
         geojson: {
                    'type': 'FeatureCollection',
                    'features': [
                    {
                    'type': 'Feature',
                    'properties': {
                    'message': 'Clauen',
                    'iconSize': [60, 60]
                    },
                    'geometry': {
                    'type': 'Point',
                    'coordinates': [ 52.247320, 10.026680]
                    }
                    },
                    {
                    'type': 'Feature',
                    'properties': {
                    'message': 'Nordstemmen',
                    'iconSize': [60, 60]
                    },
                    'geometry': {
                    'type': 'Point',
                    'coordinates': [52.160110, 9.782770]
                    }
                    },
                    {
                    'type': 'Feature',
                    'properties': {
                    'message': 'Schladen',
                    'iconSize': [60, 60]
                    },
                    'geometry': {
                    'type': 'Point',
                    'coordinates': [52.022751, 10.539730]
                    }
                    },
                    {
                    'type': 'Feature',
                    'properties': {
                    'message': 'Uelzen',
                    'iconSize': [60, 60]
                    },
                    'geometry': {
                    'type': 'Point',
                    'coordinates': [52.963020, 10.558220]
                    }
                    },
                    {
                    'type': 'Feature',
                    'properties': {
                    'message': 'Klein Wanzleben',
                    'iconSize': [60, 60]
                    },
                    'geometry': {
                    'type': 'Point',
                    'coordinates': [52.0689, 11.3661]
                    }
                    }
                    ,{
                    'type': 'Feature',
                    'properties': {
                    'message': 'Appeldorn',
                    'iconSize': [60, 60]
                    },
                    'geometry': {
                    'type': 'Point',
                    'coordinates': [51.7227, 6.3480]
                    }
                    }
                    ,{
                    'type': 'Feature',
                    'properties': {
                    'message': 'Euskirchen',
                    'iconSize': [60, 60]
                    },
                    'geometry': {
                    'type': 'Point',
                    'coordinates': [50.6574, 6.7900]
                    }
                    }
                    ,{
                    'type': 'Feature',
                    'properties': {
                    'message': 'Jülich',
                    'iconSize': [60, 60]
                    },
                    'geometry': {
                    'type': 'Point',
                    'coordinates': [50.9224, 6.3639]
                    }
                    }
                    ,{
                    'type': 'Feature',
                    'properties': {
                    'message': 'Könnern',
                    'iconSize': [60, 60]
                    },
                    'geometry': {
                    'type': 'Point',
                    'coordinates': [51.6706, 11.7706]
                    }
                    }
                    ,{
                    'type': 'Feature',
                    'properties': {
                    'message': 'Ochsenfurt',
                    'iconSize': [60, 60]
                    },
                    'geometry': {
                    'type': 'Point',
                    'coordinates': [49.6640, 10.0709]
                    }
                    }
                    ,{
                    'type': 'Feature',
                    'properties': {
                    'message': 'Offenau',
                    'iconSize': [60, 60]
                    },
                    'geometry': {
                    'type': 'Point',
                    'coordinates': [49.2448, 9.1653]
                    }
                    }
                    ,{
                    'type': 'Feature',
                    'properties': {
                    'message': 'Offstein',
                    'iconSize': [60, 60]
                    },
                    'geometry': {
                    'type': 'Point',
                    'coordinates': [49.6060, 8.2375]
                    }
                    }
                    ,{
                    'type': 'Feature',
                    'properties': {
                    'message': 'Plattling',
                    'iconSize': [60, 60]
                    },
                    'geometry': {
                    'type': 'Point',
                    'coordinates': [48.7806, 12.8690]
                    }
                    }
                    ,{
                    'type': 'Feature',
                    'properties': {
                    'message': 'Rain',
                    'iconSize': [60, 60]
                    },
                    'geometry': {
                    'type': 'Point',
                    'coordinates': [48.6902, 10.9209]
                    }
                    }
                    ,{
                    'type': 'Feature',
                    'properties': {
                    'message': 'Wabern',
                    'iconSize': [60, 60]
                    },
                    'geometry': {
                    'type': 'Point',
                    'coordinates': [51.1012, 9.3502]
                    }
                    }
                    ,{
                    'type': 'Feature',
                    'properties': {
                    'message': 'Zeitz',
                    'iconSize': [60, 60]
                    },
                    'geometry': {
                    'type': 'Point',
                    'coordinates': [51.0443, 12.1403]
                    }
                    }
                    ,{
                    'type': 'Feature',
                    'properties': {
                    'message': 'Anklam',
                    'iconSize': [60, 60]
                    },
                    'geometry': {
                    'type': 'Point',
                    'coordinates': [53.8503, 13.6960]
                    }
                    }
                ]
            }
        }
    },
     mounted () {
        this.map = null
        this.initMap()
    },
    computed: {
        markers: function() {
        var locations_all = []
        var locations_selected = []
        for (var i = 0; i < this.heatmapData.length; i++) {
            var technique = this.heatmapData[i].technique  
            var coords = this.heatmapData[i].coords
            for (var j = 0; j < coords.length; j++) {
                var single_location = coords[j]
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
    },
    watch: {
        markers: {
        deep: true,
        handler: function (newVal) {
        this.featureCollection = newVal
        this.addHeatmap()
            }
        },
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
        container: 'heatmap-map',
        style: 'mapbox://styles/mapbox/outdoors-v11',
        center: [10.3254293, 51.20],
        zoom: 4.9,
        interactive: false
      });

      // Add markers to the map.
        for (const marker of this.geojson.features) {
        // Create a DOM element for each marker.
        const el = document.createElement('div');
        const width = marker.properties.iconSize[0]-37;
        const height = marker.properties.iconSize[1]-37;
        el.className = 'marker';
        el.style.backgroundImage = `url(https://cdn-icons-png.flaticon.com/512/1037/1037422.png)`;
        el.style.width = `${width}px`;
        el.style.height = `${height}px`;
        el.style.backgroundSize = '100%';

        el.addEventListener('click', () => {
        window.alert(marker.properties.message);
        });
        // Add markers to the map
        let coords = marker.geometry.coordinates
        let coords_swapped = [coords[0], coords[1]] = [coords[1], coords[0]];
        new mapboxgl.Marker(el)
        .setLngLat(coords_swapped)
        .addTo(map);
        }
      map.on('load', () => {
        console.log('load')
        this.map = map
        let labels = [ 'country-label', 'state-label', 
        'settlement-label', 'settlement-subdivision-label', 
        'airport-label', 'poi-label', 'water-point-label', 
        'water-line-label', 'natural-point-label', 
        'natural-line-label', 'waterway-label', 'road-label' ];
        
        labels.forEach(label => {
          this.map.setLayoutProperty(label, 'text-field', ['get','name_de']);
        });
            
          })
    },

addHeatmap (){

    if (!this.map) return;
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

<style scoped>
.vue-map-container, .vue-map{
  height: 100%;  }

/* #map{
  position: absolute;
  width:100%;
  height:60%;
  left: 0;
  padding: 0px;
  margin: 0px;
} */
</style>

