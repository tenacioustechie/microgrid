<html>
<head>
    <title>Main screen</title>
    <meta name="veiwport" content="width:device-width; initial-scale:1;"/>
    <link rel="stylesheet" href="styles.css"> 
    <link href='https://fonts.googleapis.com/css?family=Orbitron' rel='stylesheet'>
    <link href="https://fonts.googleapis.com/css?family=Nunito&display=swap" rel="stylesheet">
    <script>
function post(url) {
  var xhr = new XMLHttpRequest();
  xhr.open("POST", url, true);
  xhr.setRequestHeader('Content-Type', 'application/json');
  xhr.send(JSON.stringify({
      value: "nothing"
  }));
}
    </script>
</head>
<body style="background-color:#FFAA00">


    <div class="energyusagebox">
        <p></p>
    </div>

    <div class="energyusagebox2">
            <p></p>
        </div>    

    <div class="energyusagebox3">
            <p></p>
        </div>



    <div class="energyusageboxtitle">
                <p>Total Stored Energy</p>
            </div>
    
    <div class="energyusageboxtitle2">
                <p>Average energy usage</p>
             </div>
    
    <div class="energyusageboxtitle3">
                <p>Enery usage monthly</p>
            </div>
        
    <div class="buyenergy">
        <p> Buy Energy</p>
    </div>

    <div class="sellenergy">
        <p>
            Sell Energy
        </p>
    </div>

    <div class="donatenergy">
        <p>
            Donate Energy
        </p>
    </div>

    <div class="sell2">
        <button onclick="post("/api/house2/on"); return false;">
            Sell to house 2
        </button>
    </div>

    <div class="sell3">
            <button onclick="post("/api/house3/on"); return false;>
                Sell to house 3
            </button>
        </div>

    <div class="sellC">
            <button>
                Donate to community centre
            </button>
        </div>

    <div class="buy2">
        <button>
            Buy from house 2
        </button>
    </div>

    <div class="buy3">
            <button>
                Buy from house 3
            </button>
        </div>

        <div class="battery">
            <p>
            </p>
        </div>
    
    <div class="batterytitle">
        <p>
            Battery Storage
        </p>
    </div>

</body>
</html>