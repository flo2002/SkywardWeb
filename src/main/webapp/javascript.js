function formValidation() {
    var firstname = document.getElementById("firstname");
    var lastname = document.getElementById("lastname");
    var street = document.getElementById("street");
    var housenumber = document.getElementById("housenumber");
    var zip = document.getElementById("zip");
    var city = document.getElementById("city");
    var country = document.getElementById("country");
    var checkin = document.getElementById("check-in-date");
    var checkout = document.getElementById("check-out-date");
    var roomtype = document.getElementById("roomtype");

    if (firstname_vali(firstname)) {
        if (lastname_vali(lastname)) {
            if (street_vali(street)) {
                if (housenumber_vali(housenumber)) {
                    if (zip_vali(zip)) {
                        if (city_vali(city)) {
                            if (country_vali(country)) {
                                if (checkin_vali(checkin)) {
                                    if(checkout_vali(checkout)) {
                                        if(roomtype_vali(roomtype)) {
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return false;
}


function firstname_vali(firstname) {
    var regex = new RegExp(/^[A-ZÄÖÜ][a-zäöüß]+$/);

    if (regex.match(firstname)) {
        return true;
    } else {
        alert("The firstname is not valid!");
        firstname.focus();
        return false;
    }
}

function lastname_vali(lastname) {
    var regex = new RegExp(/^[A-ZÄÖÜ][a-zäöüß]+$/);

    if (regex.test(lastname)) {
        return true;
    }
    else {
        alert("The lastname is not valid!");
        lastname.focus();
        return false;
    }
}

function street_vali(street) {
    var regex = new RegExp(/^[a-zA-Zäöüß0-9]+(?:[\s-][a-zA-Zäöüß0-9]+)*$/);

    if (regex.test(street)) {
        return true;
    }
    else {
        alert("The street is not valid!");
        street.focus();
        return false;
    }
}

function housenumber_vali(housenumber) {
    var regex = new RegExp(/^[0-9]+[a-z]?$/);

    if (regex.test(housenumber)) {
        return true;
    } else {
        alert("The housenumber address is not valid!");
        housenumber.focus();
        return false;
    }
}

function zip_vali(zip) {
    var regex = new RegExp(/^\d{5}(?:[-\s]\d{4})?$/);

    if (regex.test(zip)) {
        return true;
    } else {
        alert("The zip is not valid!");
        zip.focus();
        return false;
    }
}

function city_vali(city) {
    var regex = new RegExp(/^[a-zA-Zäöüß]+(?:[\s-][a-zA-Zäöüß]+)*$/);

    if (regex.test(city)) {
        return true;
    } else {
        alert("The city is not valid!");
        city.focus();
        return false;
    }
}

function country_vali(country) {
    var regex = new RegExp(/^[a-zA-Zäöüß]+(?:[\s-][a-zA-Zäöüß]+)*$/);

    if (regex.test(country)) {
        return true;
    } else {
        alert("The country is not valid!");
        country.focus();
        return false;
    }
}

function checkin_vali(checkin) {
    // Get the current date
    var currentDate = new Date();
    // Set the minimum allowed date to the current date
    checkin.min = currentDate.toISOString().substring(0, 10);
    console.log(checkin.min);

    if (checkin.checkValidity()) {
        var selectedDate = new Date(checkin.value);

        if (selectedDate < currentDate) {
            alert("The date cannot be in the past!");
            checkin.focus();
            return false;
        }
        return true;
    } else {
        alert("The date is not valid!");
        checkin.focus();
        return false;
    }
}



function checkout_vali(checkin, checkout) {
    // Get the current date
    var currentDate = new Date();

    // Set the minimum allowed date to the current date
    checkin.min = currentDate.toISOString().substring(0, 10);

    if (checkout.checkValidity()) {
        var selectedDate = new Date(checkout.value);
        var checkinDate = new Date(checkin.value);

        if (selectedDate < currentDate) {
            alert("The date cannot be in the past!");
            checkout.focus();
            return false;
        }

        if (selectedDate < checkinDate) {
            alert("The checkout date must be later than the check-in date!");
            checkout.focus();
            return false;
        }

        return true;
    } else {
        alert("The date is not valid!");
        checkout.focus();
        return false;
    }
}


function roomtype_vali(roomtype) {

    if (roomtype.value.match("Default")) {
        alert("The roomtype is not valid!");
        roomtype.focus();
        return false;
    } else {
        return true;
    }
}






