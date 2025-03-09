<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Page</title>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAEDSrky3cfnQhL0Mroz5FC-_ib1VpG1Vw&libraries=places"></script>
    
    <style>
        #map {
            height: 400px;
            width: 100%;
            margin-bottom: 20px;
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
        // Retrieve parameters from the URL
        String customerId = request.getParameter("customerId");
        String driverId = request.getParameter("driverId");
        String vehicleId = request.getParameter("vehicleId");
    %>

   
<body onload="initialize()">

    <h2>Booking Details</h2>

    <!-- Google Map -->
    <div id="map"></div>

    <form action="addBooking" method="post">
        <label for="bookingDate">Booking Date:</label>
        <input type="date" id="bookingDate" name="bookingDate" required><br><br>

        <label for="pickupLocation">Pickup Location:</label>
        <input type="text" id="pickupLocation" name="pickupLocation" required onblur="calculateRoute()"><br><br>

        <label for="dropLocation">Drop Location:</label>
        <input type="text" id="dropLocation" name="dropLocation" required onblur="calculateRoute()"><br><br>

        <label for="distance">Distance:</label>
        <input type="text" id="distance" name="distance" readonly required><br><br>

        <label for="price">Price:</label>
        <input type="text" id="price" name="price" readonly required><br><br>
        
        <label for="tax">Tax (10%):</label>
		<input type="text" id="tax" name="tax" readonly required><br><br>

		<label for="discount">Discount (5%):</label>
		<input type="text" id="discount" name="discount" readonly required><br><br>

		<label for="totalPrice">Total Price:</label>
		<input type="text" id="totalPrice" name="totalPrice" readonly required><br><br>
        

        <label for="bookingStatus">Booking Status:</label>
        <input type="text" id="bookingStatus" name="bookingStatus"value="Booked" required><br><br>

        <input type="hidden" id="customerId" name="customerId" value="<%= customerId %>"><br><br>

        <input type="hidden" id="driverId" name="driverId" value="<%= driverId %>"><br><br>

        <input type="hidden" id="vehicleId" name="vehicleId" value="<%= vehicleId %>"><br><br>

        <input type="submit" value="Submit Booking">
    </form>

</body>
</html>
