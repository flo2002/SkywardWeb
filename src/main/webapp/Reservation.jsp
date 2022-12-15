<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="web.css">
    <script src="javascript.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

    <script>
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
            <a href="#">Skyward</a>
        </div>
        <ul>
            <li class="navbar"><a href="index.jsp">Home</a></li>
            <li class="navbar"><a class="active" href="Reservation.jsp">Reservation</a></li>
        </ul>
    </div>
</nav>

    <div style="float: left">
        <div class="whitebackground">

            <!-- Überschrift -->
            <div class="centerContent">
                <h1>Make a Reservation</h1>
                <h3>Fill in this form to create a reservation.</h3>
                <div class="container">

                    <form id="form" action="./controller" onsubmit="return formValidation()" name="registration" method="GET">

                        <table id="dates">
                            <tr>
                                <td>
                                    <div class="input-control">
                                        <label for="check-in-date" class="bold">Checkin:<br/></label>
                                        <input type="date" id="check-in-date" name="checkin" required>
                                        <div class="error"></div>
                                    </div>
                                </td>


                                <td>
                                    <div class="input-control">
                                        <label for="check-out-date" style="margin-left: 50px" class="bold">Checkout:<br/></label>
                                        <input type="date" id="check-out-date" name="checkout" required >
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
                                        <label for="housenumber" class="bold" style="margin-left: 50px">HNr.
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
                                <option value="select">Africa</option>
                                <option value="select">Asia</option>
                                <option value="select">Australia</option>
                                <option value="select">Austria</option>
                                <option value="select">Belgium</option>
                                <option value="select">Bulgaria</option>
                                <option value="select">Central America</option>
                                <option value="select">Croatia</option>
                                <option value="select">Cyprus</option>
                                <option value="select">Czech Republic</option>
                                <option value="select">Denmark</option>
                                <option value="select">Estonia</option>
                                <option value="select">Finnland</option>
                                <option value="select">France</option>
                                <option value="select">Germany</option>
                                <option value="select">Greece</option>
                                <option value="select">Hungary</option>
                                <option value="select">Ireland</option>
                                <option value="select">Italy</option>
                                <option value="select">Latvia</option>
                                <option value="select">Liechtenstein</option>
                                <option value="select">Luxembourg</option>
                                <option value="select">Malta</option>
                                <option value="select">Netherlands</option>
                                <option value="select">North America</option>
                                <option value="select">Poland</option>
                                <option value="select">Portugal</option>
                                <option value="select">Romania</option>
                                <option value="select">Slovakia</option>
                                <option value="select">South America</option>
                                <option value="select">Spain</option>
                                <option value="select">Sweden</option>
                                <option value="select">Switzerland</option>
                            </select>
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
                            <button type="submit" action="./controller" class="send">Send</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
</div>

</body>
</html>
