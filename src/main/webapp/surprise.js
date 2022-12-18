
function flyImage() {
    var imgElement = document.getElementById("image");

    // If the image is already visible, stop the current animation and hide the image
    if (imgElement.style.display !== "none") {
        clearInterval(animationInterval);
        imgElement.style.display = "none";
    }

    // Show the image and start the animation
    imgElement.style.display = "block";
    imgElement.style.position = "absolute";
    imgElement.style.transition = "all 0.1s";

    animationInterval = setInterval(function() {
        // Check if the image has reached the right edge of the screen
        if (imgElement.offsetLeft + imgElement.offsetWidth >= window.innerWidth) {
            // If it has, stop the animation by clearing the interval
            clearInterval(this);
            imgElement.style.display = "none";
        }

        imgElement.style.left = (imgElement.offsetLeft + 10) + "px";
    }, 100);
}



