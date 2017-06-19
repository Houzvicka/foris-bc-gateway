
%rebase("config/base.tpl", **locals())

<script src="https://cdnjs.cloudflare.com/ajax/libs/paho-mqtt/1.0.1/mqttws31.min.js" type="text/javascript"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/weather-icons/2.0.10/css/weather-icons.min.css" rel="stylesheet" type="text/css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/weather-icons/2.0.10/css/weather-icons-wind.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">

<div id="page-MQTT-plugin" class="config-page">

%include("_messages.tpl")

    <div class="wrapper">
        <ul class="tabs clearfix" data-tabgroup="first-tab-group">
            <li><a href="#tab1" class="active">Sensors</a></li>
            <li><a href="#tab2">Led Strip</a></li>
            <li><a href="#tab3">Display</a></li>
            <li><a href="#tab4">About</a></li>
        </ul>
        <section id="first-tab-group" class="tabgroup">
            <div id="tab1">
                <h2>Weather</h2>
                <div id="weather-plugin" class="div-center">
                    <div class="text-center row">
                        <i class="wi wi-thermometer lastrow"></i>
                        <div id="celD"><span id="tempC">--.--</span>
                        <i class="wi wi-celsius"></i></div>
                    </div>
                    <div class="text-center row"> 
                        <i class="wi wi-barometer lastrow"></i><h3><span id="pressure">-----.--</span> Pa</h3>
                        <i class="wi wi-humidity lastrow"></i><h3><span id="humidity">--.-</span> %</h3>
                        <i class="wi wi-horizon lastrow"></i><h3><spam id="illuminance">---.-</spam> lux</h3>
                        <i class="wi wi-smog lastrow"></i><h3><spam id="co2">---</spam> ppm</h3>
                    </div>
                </div>
            </div>
            <div id="tab2">
                <h2>Color Selector</h2>
                <div class="turquoise"><p>Turquoise</p><span>#1abc9c</span></div>
                <div class="emerland"><p>Emerland</p><span>#2ecc71</span></div>
                <div class="peterriver"><p>Peter River</p><span>#3498db</span></div>
                <div class="amethyst"><p>Amethyst</p><span>#9b59b6</span></div>
                <div class="wetasphalt"><p>Wet Asphalt</p><span>#34495e</span></div>
                <div class="greensea"><p>Green Sea</p><span>#16a085</span></div>
                <div class="nephritis"><p>Nephritis</p><span>#27ae60</span></div>
                <div class="belizehole"><p>BelizeHole</p><span>#2980b9</span></div>
                <div class="wisteria"><p>Wisteria</p><span>#8e44ad</span></div>
                <div class="midnightblue"><p>Midnight Blue</p><span>#2c3e50</span></div>
                <div class="sunflower"><p>Sun Flower</p><span>#f1c40f</span></div>
                <div class="carrot"><p>Carrot</p><span>#e67e22</span></div>
                <div class="alizarin"><p>Alizarin</p><span>#e74c3c</span></div>
                <div class="clouds"><p>Clouds</p><span>#ecf0f1</span></div>
                <div class="concrete"><p>Concrete</p><span>#95a5a6</span></div>
                <div class="orange"><p>Orange</p><span>#f39c12</span></div>
                <div class="pumpkin"><p>Pumpkin</p><span>#d35400</span></div>
                <div class="pomegranate"><p>Pomegranate</p><span>#c0392b</span></div>
                <div class="silver"><p>Silver</p><span>#bdc3c7</span></div>
                <div class="asbestos"><p>Asbestos</p><span>#7f8c8d</span></div>

                <div class="LGBT"><p>LGBT</p><span>LGBT</span></div>
            </div>
            <div id="tab3">
                <h2>Display</h2>
                <table>
                    <tbody>
                        <tr>
                            <td>X: </td>
                            <td><input type="text" id="xposition" value="0"></td>
                        </tr>
                        <tr>
                            <td>Y: </td>
                            <td><input type="text" id="yposition" value="0"></td>
                        </tr>
                        <tr>
                            <td>Text: </td>
                            <td><input type="text" id="textInput"></td>
                        </tr>
                        <tr>
                            <td>Font Size: </td>
                            <td>
                                <select id="fontSize" name="Font Size">
                                    <option>11</option>
                                    <option>13</option>
                                    <option>15</option>
                                    <option>24</option>
                                    <option>28</option>
                                    <option>33</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><input class="button" id="submitButton" type="submit" value="Submit"></td>
                        </tr>
                        <tr>
                            <td colspan="2"><input class="button grayed" id="clearButton" type="submit" value="Clear"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div id="tab4">
                <h2>About</h2>

                <div id="jiriImage">
                    <label id="main" class="first" for="check">
                        <div class="title">
                            <svg style="border-radius: 50%" viewBox="0 0 300 300" width="200" height="200">
                                <use x="30" y="50" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#logo"></use>
                            </svg>
                        </div>
                    </label>
                </div>

                <svg class="defs-only" xmlns="http://www.w3.org/2000/svg">
                    <symbol id="logo">
                        <polyline class="shade" points="85,20 85,115 84,125 83,130 82,135 81,140 79,145 77,150 73,155 68,160 57,165 45,167 45,166 25,165 12,159 380,400 560,400 195,165 195,90"></polyline>
                        <polyline class="shade" points="195,20 195,165 560,400 760,400"></polyline>

                        <polyline points="85,20 85,115 84,125 83,130 82,135 81,140 79,145 77,150 73,155 68,160 57,165 45,167 35,166 25,164 12,159"></polyline>
                        <polyline points="85,90 195,90"></polyline>
                        <polyline points="195,20 195,165"></polyline>
                    </symbol>
                </svg>

                <div id="bigClownImage"></div>
            </div>
        </section>
    </div>
</div>
