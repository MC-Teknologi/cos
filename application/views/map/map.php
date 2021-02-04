<?php 

$data = $this->db->query("SELECT * FROM gps WHERE ID_PENGGUNA = '$idp' ORDER BY IDGPS DESC LIMIT 1")->result();
foreach ($data as $dt) {
	echo $lat = $dt->LATITUDE;
	echo $long = $dt->LONGTITUDE;
}
?>
<!--<script src="https://api.mapbox.com/mapbox-gl-js/v2.0.1/mapbox-gl.js"></script>-->
<!--<link href="https://api.mapbox.com/mapbox-gl-js/v2.0.1/mapbox-gl.css" rel="stylesheet" />-->
<style>
	/*body { margin: 0; padding: 0; }*/
	#map { position: absolute; top: 0; bottom: 0; width: 97%; height:550px;}
</style>
<style>
/*#menu {*/
/*position: absolute;*/
/*background: #fff;*/
/*padding: 10px;*/
/*font-family: 'Open Sans', sans-serif;*/
/*}*/
</style>
<div id="map"></div>
<!--<div id="menu">-->
<!--<input id="streets-v11" type="radio" name="rtoggle" value="streets" checked="checked"/>-->
<!--<label for="streets-v11">streets</label>-->
<!--<input id="light-v10" type="radio" name="rtoggle" value="light" />-->
<!--<label for="light-v10">light</label>-->
<!--<input id="dark-v10" type="radio" name="rtoggle" value="dark" />-->
<!--<label for="dark-v10">dark</label>-->
<!--<input id="outdoors-v11" type="radio" name="rtoggle" value="outdoors" />-->
<!--<label for="outdoors-v11">outdoors</label>-->
<!--<input id="satellite-v9" type="radio" name="rtoggle" value="satellite" />-->
<!--<label for="satellite-v9">satellite</label>-->
<!--</div>-->
<script src="https://unpkg.com/es6-promise@4.2.4/dist/es6-promise.auto.min.js"></script>
<script src="https://unpkg.com/@mapbox/mapbox-sdk/umd/mapbox-sdk.min.js"></script>

<script>
mapboxgl.accessToken = 'pk.eyJ1IjoicGlqYXJkd2kiLCJhIjoiY2s4cXljenF2MDJxYzNmcXpwejB3ZnB3eCJ9.2wIDYehxqp_mJbtp83ISLg';
var map = new mapboxgl.Map({
container: 'map',
// style: 'mapbox://styles/mapbox/satellite-v9',
style: 'mapbox://styles/pijardwi/ckkljgfyt3u8j17nssbdnamhj',
zoom: 16,
center: [<?php echo $long;?>, <?php echo $lat;?>]
});
 
var marker = new mapboxgl.Marker({
color: "red",
draggable: true
}).setLngLat([<?php echo $long;?>, <?php echo $lat;?>])
.addTo(map);  
 
var layerList = document.getElementById('menu');
// var inputs = layerList.getElementsByTagName('input');
 
function switchLayer(layer) {
var layerId = layer.target.id;
map.setStyle('mapbox://styles/mapbox/' + layerId);
}
 
// for (var i = 0; i < inputs.length; i++) {
// inputs[i].onclick = switchLayer;
// }
</script>
