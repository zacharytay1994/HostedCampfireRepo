// JavaScript source code
window.onscroll = function () { scrollFunction() };

function scrollFunction() {
    if (document.body.scrollTop > 1060 || document.documentElement.scrollTop > 1060) {
        document.getElementById("scrollButton").style.display = "block";
    } else {
        document.getElementById("scrollButton").style.display = "none";
    }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
}