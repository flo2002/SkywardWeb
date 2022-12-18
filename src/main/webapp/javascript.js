
function formValidation() {
    var firstname = document.getElementById("firstname");
    var lastname = document.getElementById("lastname");
    var street = document.getElementById("street");
    var housenumber = document.getElementById("housenumber");
    var zip = document.getElementById("zip");
    var city = document.getElementById("city");
    var country = document.getElementById("country");
    var email = document.getElementById("email");
    var customerType = document.getElementById("customerType");
    var roomDropDownList = document.getElementById("roomDropDownList");

    var namereg = new RegExp(/^[A-ZÄÖÜ][a-zäöüß]+$/);
    var streetreg = new RegExp(/^[a-zA-Zäöüß0-9]+(?:[\s-][a-zA-Zäöüß0-9]+)*$/);
    var housereg = new RegExp(/^[0-9]+[a-z]?$/);
    var zipreg = new RegExp(/^\d{4}$/);
    var cityreg = new RegExp(/^[a-zA-Zäöüß]+(?:[\s-][a-zA-Zäöüß]+)*$/);
    var countryreg = new RegExp(/^[a-zA-Zäöüß]+(?:[\s-][a-zA-Zäöüß]+)*$/);
    var emailreg = new RegExp(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/);
    var roomListReg = new RegExp("[0-9]+");



    if (!namereg.test(firstname.value)) {
        alert("The firstname is not valid!");
        firstname.focus();
        return false;
    }

    if (!namereg.test(lastname.value)) {
        alert("The lastname is not valid!");
        lastname.focus();
        return false;
    }


    if (!streetreg.test(street.value)) {
        alert("The street is not valid!");
        street.focus();
        return false;
    }

    if (!housereg.test(housenumber.value)) {
        alert("The housenumber address is not valid!");
        housenumber.focus();
        return false;
    }

    if (!zipreg.test(zip.value)) {
        alert("The zip is not valid!");
        zip.focus();
        return false;
    }

    if (!cityreg.test(city.value)) {
        alert("The city is not valid!");
        city.focus();
        return false;
    }

    if (!countryreg.test(country.value)) {
        alert("The country is not valid!");
        country.focus();
        return false;
    }

    let typeValue = customerType.value;
    if (!typeValue === "Individual" || !typeValue === "Travel Agency" || !typeValue === "Group") {
        alert("Type is not valid");
        customerType.focus();
        return false;
    }

    if (!roomListReg.test($("#roomDropDownList option:selected").text())) {
        alert("Please select a room!");
        roomDropDownList.focus();
        return false;
    }

    if (!emailreg.test(email.value)) {
        alert("The email is not valid!");
        email.focus();
        return false;
    }

    return true;
}












