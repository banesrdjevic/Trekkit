$(document).ready(function () {

  $('#puppet-field').hide();
  $('#tired-field').hide();

  var activeSwap = function(){
    var currentLocation = $('#current-location')
    if (currentLocation.attr('title') == "false"){
      currentLocation.attr('title', 'true');
    }
  }

  $('#current-location').on('click', function(e){
    e.preventDefault();
    // debugger;
    var originField = document.getElementById("origin");

    var showPosition = function(position) {
      var request = $.ajax({
        url: '/locations/street_address_from_lat_long',
        method: 'get',
        dataType: 'json',
        data: position
      });

      request.done(function(response){
        originField.value = response.street_address
      });
    };

    var getLocation = function() {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
      } else {
        originField.innerHTML = "Geolocation is not supported by this browser.";
      }
    };

    getLocation()

  $('#puppet-field').show();
  $('#origin').hide();
  $('#destination').focus();

  activeSwap();

  })


  $('#tired-field').on('click', function(e){
    // debugger;
    e.preventDefault();
    $('#tired-field').hide();
    $('#destination').show();
    var destinationField = document.getElementById("destination");
    destinationField.value = "";
    $('#current-location').attr('title', 'false');

  })


  $('#puppet-field').on('click', function(e){
    // debugger;
    e.preventDefault();
    $('#puppet-field').hide();
    $('#origin').show();
    var originField = document.getElementById("origin");
    originField.value = "";
    $('#current-location').attr('title', 'false');

  })
});
