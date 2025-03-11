<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Page</title>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAEDSrky3cfnQhL0Mroz5FC-_ib1VpG1Vw&libraries=places"></script>
    
    <style>
    
    /* Reset and base styles */
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
    background-color: #f8f9fa;
    color: #333;
    line-height: 1.4;
    padding: 12px;
    max-width: 1000px;
    margin: 0 auto;
    font-size: 14px;
}

h2 {
    color: #2c3e50;
    margin-bottom: 15px;
    text-align: center;
    font-size: 20px;
    padding-bottom: 8px;
    border-bottom: 1px solid  hsl(220, 24%, 15%);
}

/* Map styling */
#map {
    height: 250px;
    width: 100%;
    margin-bottom: 15px;
    border-radius: 6px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

/* Form styling */
form {
    background-color: white;
    padding: 15px;
    border-radius: 6px;
    box-shadow: 0 1px 6px rgba(0, 0, 0, 0.08);
}

.form-row {
    display: flex;
    flex-wrap: wrap;
    margin-bottom: 12px;
    gap: 10px;
}

.form-group {
    flex: 1 0 220px;
    margin-bottom: 8px;
}

label {
    display: block;
    margin-bottom: 4px;
    font-weight: 500;
    color: #2c3e50;
    font-size: 13px;
}

input[type="text"],
input[type="date"] {
    width: 100%;
    padding: 8px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 14px;
    transition: border-color 0.2s;
}

input[type="text"]:focus,
input[type="date"]:focus {
    border-color: #3498db;
    outline: none;
    box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.15);
}

input[readonly] {
    background-color: #f8f9fa;
    cursor: not-allowed;
}

input[type="submit"] {
    background-color: #ffd700;
    color: black;
    border: none;
    padding: 10px 16px;
    font-size: 14px;
    font-weight: 600;
    border-radius: 4px;
    cursor: pointer;
    width: 100%;
    margin-top: 8px;
    transition: background-color 0.2s;
}

input[type="submit"]:hover {
    background-color: hsl(220, 24%, 15%);
    color: white;
}

.cancel-btn {
    background-color:  hsl(220, 24%, 15%);
    color: white;
    border: none;
    padding: 10px 16px;
    font-size: 14px;
    font-weight: 600;
    border-radius: 4px;
    cursor: pointer;
    width: 100%;
    margin-top: 8px;
    transition: background-color 0.2s;
}

.cancel-btn:hover {
    background-color: gray;
    color: black;
}

/* Price summary section */
.price-summary {
    padding: 12px;
    border-radius: 6px;
    margin-top: 12px;
   
}

.price-summary .form-row:last-child {
    margin-bottom: 0;
}

.price-summary h3 {
    color: #2c3e50;
    margin-bottom: 8px;
    font-size: 15px;
}

.total-price-row {
    border-top: 1px solid #ddd;
    padding-top: 8px;
    margin-top: 8px;
}

.total-price-row label {
    font-size: 15px;
}

.total-price-row input {
    font-weight: 600;
    font-size: 15px;
    color: #2c3e50;
}

@media (max-width: 600px) {
    body {
        padding: 8px;
    }
    
    h2 {
        font-size: 18px;
    }
    
    #map {
        height: 200px;
    }
    
    form {
        padding: 10px;
    }
    
    .form-group {
        flex: 1 0 100%;
    }
    
    input[type="text"],
    input[type="date"] {
        padding: 7px;
    }
    
    input[type="submit"] {
        padding: 8px 14px;
    }
    .cancel-btn{
     padding: 8px 14px;
    }
}
    </style>

   <script>
    let map, directionsService, directionsRenderer, autocompletePickup, autocompleteDrop, distanceService;

    // Retrieve passengerType from the URL
    const urlParams = new URLSearchParams(window.location.search);
    const passengerType = urlParams.get("passengerType");

    // Define different rates per km for each category
    const rates = {
        "Flex": 50, 
        "Mini": 40, 
        "Car": 60,  
        "Van": 80   
    };

    const MINIMUM_FARE = 300; // Base minimum fare
    const TAX_RATE = 0.10; // 10% tax
    const DISCOUNT_RATE = 0.05; // 5% discount

    function initialize() {
        map = new google.maps.Map(document.getElementById("map"), {
            center: { lat: 7.2906, lng: 80.6337 },
            zoom: 10
        });

        directionsService = new google.maps.DirectionsService();
        directionsRenderer = new google.maps.DirectionsRenderer();
        distanceService = new google.maps.DistanceMatrixService();
        directionsRenderer.setMap(map);

        let options = {
            types: ["geocode"],
            componentRestrictions: { country: "LK" }
        };

        autocompletePickup = new google.maps.places.Autocomplete(document.getElementById("pickupLocation"), options);
        autocompleteDrop = new google.maps.places.Autocomplete(document.getElementById("dropLocation"), options);

        autocompletePickup.addListener("place_changed", calculateRoute);
        autocompleteDrop.addListener("place_changed", calculateRoute);
    }

    function calculateRoute() {
        let pickupData = getPlaceDetails(autocompletePickup, document.getElementById("pickupLocation"));
        let dropData = getPlaceDetails(autocompleteDrop, document.getElementById("dropLocation"));

        if (!pickupData || !dropData) return;

        let request = {
            origin: pickupData,
            destination: dropData,
            travelMode: 'DRIVING'
        };

        directionsService.route(request, function(result, status) {
            if (status === 'OK') {
                directionsRenderer.setDirections(result);
                calculateDistance(pickupData, dropData);
            } else {
                alert("Could not get directions: " + status);
            }
        });
    }

    function getPlaceDetails(autocomplete, inputField) {
        let place = autocomplete.getPlace();
        if (!place.geometry) {
            alert("Please select a valid location.");
            inputField.value = "";
            return null;
        }
        return place.formatted_address;
    }
    
    
    function calculateTotal() {
        let price = parseFloat(document.getElementById("price").value) || 0;

        // Calculate tax and discount
        let tax = price * TAX_RATE;
        let discount = price * DISCOUNT_RATE;
        
        // Compute total price
        let totalPrice = price + tax - discount;

        // Set values in the form
        document.getElementById("tax").value = tax.toFixed(2);
        document.getElementById("discount").value = discount.toFixed(2);
        document.getElementById("totalPrice").value = totalPrice.toFixed(2);
    }

    function calculateDistance(pickup, drop) {
        distanceService.getDistanceMatrix(
            {
                origins: [pickup],
                destinations: [drop],
                travelMode: 'DRIVING',
            },
            function(response, status) {
                if (status === 'OK' && response.rows[0].elements[0].status === 'OK') {
                    let distanceInMeters = response.rows[0].elements[0].distance.value;
                    let distanceInKm = (distanceInMeters / 1000).toFixed(2);
                    document.getElementById("distance").value = distanceInKm;

                    let ratePerKm = rates[passengerType] || 50;
                    let price = distanceInKm * ratePerKm;
                    if (price < MINIMUM_FARE) {
                        price = MINIMUM_FARE;
                    }
                    document.getElementById("price").value = price;

                    // Calculate tax, discount, and total
                    calculateTotal();
                } else {
                    alert("Distance calculation failed: " + status);
                }
            }
        );
    }

</script>

</head>

 <%
        
        String customerId = request.getParameter("customerId");
        String driverId = request.getParameter("driverId");
        String vehicleId = request.getParameter("vehicleId");
    %>

   
<body onload="initialize()">

    <h2>Booking Details</h2>

    <!-- Google Map -->
    <div id="map"></div>

    
    <form action="adminAddBooking" method="post">
     <div class="form-group">
                <label for="customerId">Customer ID</label>
                <input type="text" id="customerId" name="customerId" required>
            </div>
            
             <div class="form-group">
                <label for="driverId">Driver ID</label>
                <input type="text" id="driverId" name="driverId" required>
            </div>
            
             <div class="form-group">
                <label for="vehicleId">Vehicle ID</label>
                <input type="text" id="vehicleId" name="vehicleId" required >
            </div>
            
        <div class="form-row">
            <div class="form-group">
    		<label for="bookingDate">Booking Date</label>
    		<input type="date" id="bookingDate" name="bookingDate" required>
			</div>

			<script>
    
    		let today = new Date().toISOString().split('T')[0];
    		document.getElementById("bookingDate").setAttribute("min", today);
			</script>

            
            <div class="form-group">
                <label for="pickupLocation">Pickup Location</label>
                <input type="text" id="pickupLocation" name="pickupLocation" required onblur="calculateRoute()">
            </div>
        
            <div class="form-group">
                <label for="dropLocation">Drop Location</label>
                <input type="text" id="dropLocation" name="dropLocation" required onblur="calculateRoute()">
            </div>
        </div>
        
        <div class="form-row">
            <div class="form-group">
                <label for="distance">Distance (km)</label>
                <input type="text" id="distance" name="distance" readonly required>
            </div>
            
            <div class="form-group">
                <label for="price">Base Price</label>
                <input type="text" id="price" name="price" readonly required>
            </div>
            
            <div class="form-group">
                <label for="bookingStatus">Status</label>
                <input type="text" id="bookingStatus" name="bookingStatus" value="Booked" readonly required>
            </div>
        </div>
        
        <div class="price-summary">
            <h3>Price Summary</h3>
            <div class="form-row">
                <div class="form-group">
                    <label for="tax">Tax (10%)</label>
                    <input type="text" id="tax" name="tax" readonly required>
                </div>
                
                <div class="form-group">
                    <label for="discount">Discount (5%)</label>
                    <input type="text" id="discount" name="discount" readonly required>
                </div>
                
                <div class="form-group ">
                    <label for="totalPrice">Total Price</label>
                    <input type="text" id="totalPrice" name="totalPrice" readonly required>
                </div>
            </div>
        </div>

       

        <input type="submit" value="Confirm Booking">
		<button class="cancel-btn">Cancel Booking</button>

		<script>
  				document.querySelector('.cancel-btn').addEventListener('click', function() {
    
    		alert('Booking has been canceled!');
    
    
    		window.history.back();  
  		});
	</script>

    </form>
</body>
</html>
