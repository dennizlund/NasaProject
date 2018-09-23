/* NEWS FEED SCRIPT */
var newsStatus = 1;
var newsTimer = 30000;

window.onload = function () { /* INITIALIZE THE NEWS LOOP */
    newsLoop();
}

var startNewsLoop = setInterval(function () {
    newsLoop();
}, newsTimer);

function newsLoop() {
    if (newsStatus === 1) {
        document.getElementById("news_feed2").style.opacity = "0"; /*SET THE LEFTHAND IMAGE TO "Invisible"*/

        setTimeout(function () { /*SET TIME FOR HOW LONG IT SHOULD TAKE TO RUN THIS CODE */
            document.getElementById("news_feed1").style.right = "-4fr";
            document.getElementById("news_feed1").style.zIndex = "1500";

            document.getElementById("news_feed3").style.right = "0px";
            document.getElementById("news_feed3").style.zIndex = "1000";

            document.getElementById("news_feed2").style.right = "4fr";
            document.getElementById("news_feed2").style.zIndex = "500";
        }, newsTimer);

        setTimeout(function () {
            document.getElementById("news_feed2").style.opacity = "1";
        }, newsTimer);

        newsStatus = 2;
    }
    else if (newsStatus === 2) {

        document.getElementById("news_feed3").style.opacity = "0";

        setTimeout(function () {
            document.getElementById("news_feed2").style.right = "-4fr";
            document.getElementById("news_feed2").style.zIndex = "1500";

            document.getElementById("news_feed1").style.right = "0px";
            document.getElementById("news_feed1").style.zIndex = "1000";

            document.getElementById("news_feed3").style.right = "4fr";
            document.getElementById("news_feed3").style.zIndex = "500";
        }, newsTimer);

        setTimeout(function () {
            document.getElementById("news_feed3").style.opacity = "1";
        }, newsTimer);

        newsStatus = 3;
    }
    else if (newsStatus === 3) {

        document.getElementById("news_feed1").style.opacity = "0";

        setTimeout(function () {

            document.getElementById("news_feed3").style.right = "-4fr";
            document.getElementById("news_feed3").style.zIndex = "1500";

            document.getElementById("news_feed2").style.right = "0px";
            document.getElementById("news_feed2").style.zIndex = "1000";

            document.getElementById("news_feed1").style.right = "4fr";
            document.getElementById("news_feed1").style.zIndex = "500";
        }, newsTimer);

        setTimeout(function () {
            document.getElementById("news_feed1").style.opacity = "1";
        }, newsTimer);

        newsStatus = 1;
    }
}
