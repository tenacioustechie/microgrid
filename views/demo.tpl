<html>

<head>
  <title>Demo MicroGrid</title>
  <meta name="veiwport" content="width:device-width; initial-scale:1;" />
  <link rel="stylesheet" href="styles2.css">
</head>

<body>
  <div class="container">

    <div class="house-display-box">
      <div class="house-heading">My House 1</div>
      <div class="house-display" id="house1-display"></div>
      <div class="house-subtext">battery level</div>
      <div class="house-buttons">
        <button onclick="house1LightsOn(); return false;">My Lights on</button>
        <button onclick="house1LightsOff(); return false;">My Lights off</button>
      </div>
    </div>

    <div class="house-display-box">
      <div class="house-heading">House 2</div>
      <div class="house-display" id="house2-display"></div>
      <div class="house-subtext">battery level</div>
      <div class="house-buttons">
        <button onclick="house2LightsOn(); return false;">Lights on</button>
        <button onclick="house2LightsOff(); return false;">Lights off</button>
      </div>
    </div>

    <div class="house-display-box">
      <div class="house-heading">House 3</div>
      <div class="house-display" id="house3-display"></div>
      <div class="house-subtext">battery level</div>
      <div class="house-buttons">
        <button onclick="house3LightsOn(); return false;">Lights on</button>
        <button onclick="house3LightsOff(); return false;">Lights off</button>
      </div>
    </div>

    <div class="house-display-box">
      <div class="house-heading">Community Centre</div>
      <div class="house-display" id="house4-display"></div>
      <div class="house-subtext">battery level</div>
      <div class="house-buttons">
        <button onclick="house4LightsOn(); return false;">Lights on</button>
        <button onclick="house4LightsOff(); return false;">Lights off</button>
      </div>
    </div>

    <div class="control-options">
      <div class="option"><button onclick="return false;">Sell to House 2</button></div>
      <div class="option"><button onclick="return false;">Sell to House 3</button></div>
      <div class="option"><button onclick="return false;">Donate to Community Centre</button></div>
      <div class="option"><button onclick="return false;">Buy from House 2</button></div>
      <div class="option"><button onclick="return false;">Buy from House 3</button></div>
    </div>

  </div>

  <script>
    function post(url) {
      var xhr = new XMLHttpRequest();
      xhr.open("POST", url, true);
      xhr.setRequestHeader('Content-Type', 'application/json');
      xhr.send(JSON.stringify({
        value: "nothing"
      }));
    }
    house1lightson = false;
    house1hassolar = true;
    house1power = 80;

    house2lightson = false;
    house2hassolar = false;
    house2power = 20;

    house3lightson = false;
    house3hassolar = true;
    house3power = 40;

    house4lightson = false;
    house4hassolar = false;
    house4power = 0;

    function onTick() {
      console.log("updating power...");
      house1power = updateHouseValue(house1lightson, house1hassolar, house1power);
      if (house1power == 0) { house1lightson = false; }
      document.querySelector('#house1-display').textContent = house1power + "%";
      console.log("house1 power", house1power);

      house2power = updateHouseValue(house2lightson, house2hassolar, house2power);
      if (house2power == 0) { house2lightson = false; }
      document.querySelector('#house2-display').textContent = house2power + "%";
      console.log("house2 power", house2power);

      house3power = updateHouseValue(house3lightson, house3hassolar, house3power);
      if (house3power == 0) { house3lightson = false; }
      document.querySelector('#house3-display').textContent = house3power + "%";
      console.log("house3 power", house3power);

      house4power = updateHouseValue(house4lightson, house4hassolar, house4power);
      if (house4power == 0) { house4lightson = false; }
      document.querySelector('#house4-display').textContent = house4power + "%";
      console.log("house4 power", house4power);
    }
    function updateHouseValue(lightOn, solar, power) {
      let p = power;
      console.log("updating power... solar", solar, " lightsOn ", lightOn, "power", power)
      if (lightOn) {
        p = p - 2;
      }
      if (solar) {
        p = p + 1;
      }
      if (p <= 0) {
        p = 0;
      }
      if (p > 100) {
        p = 100;
      }
      return p;
    }

    // Adjust this value to set how often the power values updated (in seconds)
    tick = 5; // seconds
    timer = setInterval(onTick, tick * 1000);

    function house1LightsOn() {
      post('/api/house1/on');
      house1lightson = true;
    }
    function house1LightsOff() {
      post('/api/house1/off');
      house1lightson = false;
    }
    function house2LightsOn() {
      post('/api/house2/on');
      house2lightson = true;
    }
    function house2LightsOff() {
      post('/api/house2/off');
      house2lightson = false;
    }
    function house3LightsOn() {
      post('/api/house3/on');
      house3lightson = true;
    }
    function house3LightsOff() {
      post('/api/house3/off');
      house3lightson = false;
    }
    function house4LightsOn() {
      post('/api/house4/on');
      house4lightson = true;
    }
    function house4LightsOff() {
      post('/api/house4/off');
      house4lightson = false;
    }
  </script>

</body>

</html>