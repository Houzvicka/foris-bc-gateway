$(function(){

client = new Paho.MQTT.Client(location.hostname, 1884, "clientId");

// called when the client connects
function onConnect() {
  // Once a connection has been made, make a subscription and send a message.
  console.log("onConnect");
  client.subscribe("#");
  //message = new Paho.MQTT.Message("Hello");
  //message.destinationName = "World";
  //client.send(message);
}

// called when the client loses its connection
function onConnectionLost(responseObject) {
  if (responseObject.errorCode !== 0) {
    console.log("onConnectionLost:" + responseObject.errorMessage);
  }
}

// called when a message arrives
function onMessageArrived(message) {
    //console.log("onMessageArrived:", message.destinationName, message.payloadString);
    temperature = "temperature";
    concentration = "concentration";
    pressure = "pressure";
    relativehumidity = "relative-humidity";
    illuminance = "illuminance";

    if(message.destinationName.includes(temperature)){
      document.getElementById('tempC').innerHTML = message.payloadString.substring(0,10);
      //document.getElementById('tempC').innerHTML = message.payloadString;
    }
    else if(message.destinationName.includes(pressure)){
      document.getElementById('pressure').innerHTML = message.payloadString.substring(0,10);
      //document.getElementById('pressure').innerHTML = message.payloadString;
    }
    else if(message.destinationName.includes(relativehumidity)){
      document.getElementById('humidity').innerHTML = message.payloadString.substring(0,10);
      //document.getElementById('humidity').innerHTML = message.payloadString;
    }
    else if(message.destinationName.includes(illuminance)){
      document.getElementById('illuminance').innerHTML = message.payloadString.substring(0,10);
      //document.getElementById('illuminance').innerHTML = message.payloadString;
    }
    else if(message.destinationName.includes(concentration)){
      document.getElementById('co2').innerHTML = message.payloadString.substring(0,10);
      //document.getElementById('co2').innerHTML = message.payloadString;
    }
}

// set callback handlers
client.onConnectionLost = onConnectionLost;
client.onMessageArrived = onMessageArrived;

// connect the client
client.connect({onSuccess:onConnect});

$('.tabgroup > div').hide();
$('.tabgroup > div:first-of-type').show();
$('.tabs a').click(function(e){
  e.preventDefault();
    var $this = $(this),
        tabgroup = '#'+$this.parents('.tabs').data('tabgroup'),
        others = $this.closest('li').siblings().children('a'),
        target = $this.attr('href');
    others.removeClass('active');
    $this.addClass('active');
    $(tabgroup).children('div').hide();
    $(target).show();
})

function initClickAndChangeColor() {
  document.querySelector('body').addEventListener('click', function(event) {
    var node = event.target;
    if (node.nodeName === 'DIV') {
      if(node.querySelector('span').innerText.startsWith("#")){
          message = new Paho.MQTT.Message('"'+node.querySelector('span').innerText+'"');
          message.destinationName = "node/836d19832d6e/led-strip/-/color/set";
          client.send(message);
      }
      else if(node.querySelector('span').innerText.startsWith("LGBT")){
          message = new Paho.MQTT.Message('[20, "#ff0000", 20, "#ff7f00", 20, "#ffff00", 20, "#00ff00", 20, "#0000ff", 20, "#960082", 21, "#D500ff"]');
          message.destinationName = "node/836d19832d6e/led-strip/-/compound/set";
          client.send(message);
      }
    }
    return true;
  }, false);
}

if (window.addEventListener) {
  window.addEventListener("load", initClickAndChangeColor, false);
} else if (window.attachEvent) {
  window.attachEvent("onload", initClickAndChangeColor);
} else {
  window.onload = initClickAndChangeColor;
}

$( "#submitButton" ).click(function() {
  message = new Paho.MQTT.Message('{"x": ' + $('#xposition').val() + ', "y": ' + $('#yposition').val() + ', "text": "' + $('#textInput').val() + '", "font": ' + $('#fontSize').val() + '}');
  message.destinationName = "node/836d19835354/lcd/-/text/set";
  client.send(message);
  return false;
});

$( "#clearButton" ).click(function() {
  message = new Paho.MQTT.Message('true');
  message.destinationName = "node/836d19835354/lcd/-/screen/clear";
  client.send(message);
  return false;
});

});
