var infoTemplate = "<div class='panel'>" +
"  <div class='panel_contents'>" +
"    <div class='attributes_table'>" +
"      <table border='0' cellspacing='0' cellpadding='0'>" +
"        <tbody>" +
"          {{#each attributes}}" +
"            <tr class='row row-user'>" +
"              <th>{{@key}}</th>" +
"              <td>{{this}}</td>" +
"            </tr>" +
"          {{/each}}" +
"        </tbody>" +
"      </table>" +
"    </div>" +
"  </div>" +
"</div>" +
"<div class='actions'>" +
"  {{#each actions}}" +
"    {{{this}}}" +
"  {{/each}}" +
"</div>"


function getContent(element) {
  template = Handlebars.compile(infoTemplate);
  return template(element)
}

function initMap() {
  var map = new google.maps.Map(document.getElementById('active_admin_index_map'));

  var infowindow = new google.maps.InfoWindow();
  var bounds = new google.maps.LatLngBounds();

  $('.map-data').data('collection').forEach(function(element, index) {
    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(element["attributes"]["latitude"], element["attributes"]["longitude"]),
      map: map
    });

    bounds.extend(marker.position);
    google.maps.event.addListener(marker, 'click', (function (marker, index) {
      return function () {
        infowindow.setContent(getContent(element));
        infowindow.open(map, marker);
      }
    })(marker, index));
  });

  map.fitBounds(bounds);
}

$(document).ready(function(){
  initMap();
});
