function initMap() {
  // Create a map object and specify the DOM element for display.
  var map = new google.maps.Map(document.getElementById('active_admin_index_map'), {
  });

  var infowindow = new google.maps.InfoWindow();
  var bounds = new google.maps.LatLngBounds();

  $('.map-data').data('collection').forEach(function(element, index){
    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(element["latitude"], element["longitude"]),
      map: map
    });

    bounds.extend(marker.position);
    google.maps.event.addListener(marker, 'click', (function (marker, index) {
      debugger;
      return function () {
        infowindow.setContent(
          JSON.stringify(element, null, "<p>") + "<br><a href='" + window.location.href + "/" + element['id'] + "'>Show</a></br>");
        infowindow.open(map, marker);
      }
    })(marker, index));
  });

  map.fitBounds(bounds);
}

$(document).ready(function(){
  initMap();
});
