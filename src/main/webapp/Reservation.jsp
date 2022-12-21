<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="web.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="javascript.js"></script>
    <script>
        var lastResponseJson;

        function updateData() {
            if (document.getElementById("check-in-date").value !== "" && document.getElementById("check-out-date").value !== "" ) {
                $.get("list-available-rooms?checkin=" + document.getElementById("check-in-date").value + "&checkout=" + document.getElementById("check-out-date").value, function (responseJson) {
                    var $select = $("#roomDropDownList");
                    $select.find("option").remove();
                    lastResponseJson = responseJson;
                    $.each(responseJson, function (index, room) {
                        $("<option>").val(room.roomNumber).text(room.roomNumber + " " + room.roomTypeName).appendTo($select);
                    });
                });
            }
        }

        function recalculateTotalPrice() {
            var nights = (new Date(document.getElementById("check-out-date").value) - new Date(document.getElementById("check-in-date").value)) / (1000 * 3600 * 24);
            var totalPrice = 0;

            var options = $("#roomDropDownList option:selected");
            var values = $.map(options, function (option) {
                return option.value;
            });

            $.each(lastResponseJson, function (index, room) {
                for (var i = 0; i < values.length; i++) {
                    if (parseInt(room.roomNumber) == values[i]) {
                        totalPrice += parseInt(room.roomStateName) * nights;
                    }
                }
            });
            totalPrice *= nights;
            document.getElementById("totalPrice").innerText = "Total: " + totalPrice + " €";
        }

        $(function(){
            var dtToday = new Date();

            var month = dtToday.getMonth() + 1;
            var day = dtToday.getDate();
            var year = dtToday.getFullYear();
            if(month < 10)
                month = '0' + month.toString();
            if(day < 10)
                day = '0' + day.toString();

            var maxDate = year + '-' + month + '-' + day;

            $('#check-in-date').attr('min', maxDate);
            $('#check-out-date').attr('min', maxDate);
        });
    </script>
</head>

<body style="font-family: Arial;
background-image: url('backgroundweb.jpg');
background-repeat: repeat;
background-attachment: fixed">


<nav>
    <div class="menu">
        <div class="logo">
            <a href="index.jsp">Skyward</a>
        </div>
        <ul>
            <li class="navbar"><a href="index.jsp">Home</a></li>
            <li class="navbar"><a class="active" href="Reservation.jsp">Reservation</a></li>
        </ul>
    </div>
</nav>

    <div style="display: flex;justify-content: center">
        <div class="whitebackground">

            <!-- Überschrift -->
            <div class="centerContent">
                <h1>Make a Reservation</h1>
                <h3>Fill in this form to create a reservation.</h3>
                <div class="container">

                    <form id="form" action="./controller" onsubmit="return formValidation()" name="registration" method="post">

                        <table id="dates">
                            <tr>
                                <td>
                                    <div class="input-control">
                                        <label for="check-in-date" class="bold">Checkin:<br/></label>
                                        <input type="date" id="check-in-date" name="checkin" onchange="updateData()" required>
                                        <div class="error"></div>
                                    </div>
                                </td>


                                <td>
                                    <div class="input-control">
                                        <label for="check-out-date" style="margin-left: 50px" class="bold">Checkout:<br/></label>
                                        <input type="date" id="check-out-date" name="checkout" onchange="updateData()" required >
                                        <div class="error"></div>
                                    </div>
                                </td>
                            </tr>
                        </table>

                        <!-- Vorname und Nachname -->
                        <table id="name">
                            <tr>
                                <!-- Vorname -->
                                <td>
                                    <div class="input-control">
                                        <label for="firstname" class="bold">Firstname <br/></label>
                                        <input class="name" name="firstname" id="firstname" type="text" required>
                                        <div class="error"></div>
                                    </div>
                                </td>

                                <!-- Nachname -->
                                <td>
                                    <div class="input-control">
                                        <label for="lastname" style="margin-left: 50px" class="bold">Lastname <br/></label>
                                        <input class="name" name="lastname" id="lastname" type="text" required>
                                        <div class="error" style="margin-left: 50px"></div>
                                    </div>
                                </td>
                            </tr>
                        </table>

                        <!-- Adresse -->
                        <table id="adress1">
                            <tr>
                                <!-- Straße -->
                                <td>
                                    <div class="input-control">
                                        <label for="street" class="bold">Street<br/></label>
                                        <input class="sizebig" name="street" id="street" type="text" required>
                                        <div class="error"></div>
                                    </div>
                                </td>
                                <!-- HNr. -->
                                <td>
                                    <div class="input-control">
                                        <label for="housenumber" class="bold" style="margin-left: 50px">House
                                            <br/></label>
                                        <input class="sizesmall" name="housenumber" id="housenumber" type="text" required>
                                        <div class="error" style="margin-left: 50px"></div>
                                    </div>
                                </td>
                            </tr>
                        </table>

                        <table id="adress2">
                            <tr>
                                <!-- Stadt -->
                                <td>
                                    <div class="input-control">
                                        <label for="city" class="bold">City<br/></label>
                                        <input class="sizebig" name="city" id="city" type="text" required>
                                        <div class="error"></div>
                                    </div>
                                </td>
                                <!-- PLZ -->
                                <td>
                                    <div class="input-control">
                                        <label for="zip" class="bold" style="margin-left: 50px">ZIP Code
                                            <br/></label>
                                        <input class="sizesmall" name="zip" id="zip" type="text" required>
                                        <div class="error" style="margin-left: 50px"></div>
                                    </div>
                                </td>
                            </tr>
                        </table>

                        <!-- Land -->
                        <!-- Nationalität -->
                        <div class="input-control">
                            <label for="country" class="bold">Nationality <br/></label>
                            <select name="country" id="country" class="sizebig">
                                <option value="" selected>--Please select--</option>
                                <option value="Africa">Africa</option>
                                <option value="Asia">Asia</option>
                                <option value="Australia">Australia</option>
                                <option value="Austria">Austria</option>
                                <option value="Belgium">Belgium</option>
                                <option value="Bulgaria">Bulgaria</option>
                                <option value="Central America">Central America</option>
                                <option value="Croatia">Croatia</option>
                                <option value="Cyprus">Cyprus</option>
                                <option value="Czech Republic">Czech Republic</option>
                                <option value="Denmark">Denmark</option>
                                <option value="Estonia">Estonia</option>
                                <option value="Finnland">Finnland</option>
                                <option value="France">France</option>
                                <option value="Germany">Germany</option>
                                <option value="Greece">Greece</option>
                                <option value="Hungary">Hungary</option>
                                <option value="Ireland">Ireland</option>
                                <option value="Italy">Italy</option>
                                <option value="Latvia">Latvia</option>
                                <option value="Liechtenstein">Liechtenstein</option>
                                <option value="Luxembourg">Luxembourg</option>
                                <option value="Malta">Malta</option>
                                <option value="Netherlands">Netherlands</option>
                                <option value="North America">North America</option>
                                <option value="Poland">Poland</option>
                                <option value="Portugal">Portugal</option>
                                <option value="Romania">Romania</option>
                                <option value="Slovakia">Slovakia</option>
                                <option value="South America">South America</option>
                                <option value="Spain">Spain</option>
                                <option value="Sweden">Sweden</option>
                                <option value="Switzerland">Switzerland</option>
                            </select>
                            <div class="error"></div>
                        </div>

                        <!-- Customer Type -->
                        <div class="input-control">
                            <label for="customerType" class="bold">Type <br/></label>
                            <select name="customerType" id="customerType" class="sizebig">
                                <option value="Individual" selected>Individual</option>
                                <option value="TravelAgency">Travel Agency</option>
                                <option value="Group">Group</option>
                            </select>
                            <div class="error"></div>
                        </div>

                        <!-- Rooms -->
                        <div class="input-control">
                            <select id="roomDropDownList" name="roomDropDownList" onchange="recalculateTotalPrice()" multiple style="min-width: 200px">
                                <option value="Select Room" selected>Select Room</option>
                            </select><br/>
                            <p id="totalPrice">Total: - €</p>
                            <div class="error"></div>
                        </div>

                        <!-- Email -->
                        <div class="input-control">
                            <label for="email" class="bold">E-Mail Address <br/> </label>
                            <input class="sizebig" name="email" id="email" type="text" required>
                            <div class="error"></div>
                        </div>

                        <div style="margin-top: 30px">
                            <button type="reset" class="reset">Reset</button>
                            <button type="submit" id="submit" class="send">Complete Reservation</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
</div>

</body>
</html>
