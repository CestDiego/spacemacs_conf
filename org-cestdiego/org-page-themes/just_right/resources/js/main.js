
// http://paulirish.com/2011/requestanimationframe-for-smart-animating/
// http://my.opera.com/emoller/blog/2011/12/20/requestanimationframe-for-smart-er-animating

// requestAnimationFrame polyfill by Erik Möller. fixes from Paul Irish and Tino Zijdel

// MIT license

(function() {
    var lastTime = 0;
    var vendors = ['ms', 'moz', 'webkit', 'o'];
    for(var x = 0; x < vendors.length && !window.requestAnimationFrame; ++x) {
        window.requestAnimationFrame = window[vendors[x]+'RequestAnimationFrame'];
        window.cancelAnimationFrame = window[vendors[x]+'CancelAnimationFrame']
                                   || window[vendors[x]+'CancelRequestAnimationFrame'];
    }

    if (!window.requestAnimationFrame)
        window.requestAnimationFrame = function(callback, element) {
            var currTime = new Date().getTime();
            var timeToCall = Math.max(0, 16 - (currTime - lastTime));
            var id = window.setTimeout(function() { callback(currTime + timeToCall); },
              timeToCall);
            lastTime = currTime + timeToCall;
            return id;
        };

    if (!window.cancelAnimationFrame)
        window.cancelAnimationFrame = function(id) {
            clearTimeout(id);
        };
}());

// Taken from http://stackoverflow.com/questions/8917921/cross-browser-javascript-not-jquery-scroll-to-top-animation

//t = current time
//b = from value
//c = change in value
//d = duration
var easeInOutQuad = function (t, b, c, d) {
    t /= d/2;
    if (t < 1) return c/2*t*t + b;
    t--;
    return -c/2 * (t*(t-2) - 1) + b;
};

function scroll(from, to, duration) {
    var change = to - from,
        startTime,
        currentTime = 0;

    var setStartTime = function(timestamp) {
        startTime = timestamp;
        requestAnimationFrame(animateScroll);
    };

    var animateScroll = function(timestamp) {
        currentTime = timestamp - startTime;
        document.documentElement.scrollTop = document.body.scrollTop = easeInOutQuad(currentTime, from, change, duration);
        if(currentTime <= duration) {
            requestAnimationFrame(animateScroll);
        }
    };

    requestAnimationFrame(setStartTime);
}

(function() {
    var lightTheme = document.querySelector("#lightTheme");
    var darkTheme = document.querySelector("#darkTheme");

    var toggleTheme = function () {
        var isDefaultDisabled = lightTheme.disabled;
        darkTheme.disabled = isDefaultDisabled;
        lightTheme.disabled = !isDefaultDisabled;

        var switchLights = document.querySelector(".switch-lights");
        switchLights.textContent = "lights " + (isDefaultDisabled ? "off" : "on");

        return !isDefaultDisabled;
    };

    if (localStorage.darkTheme === "1") {
        toggleTheme();
    }

    var viewportHeight = document.documentElement.clientHeight,
        documentHeight = document.body.clientHeight,
        backToTop;

    if (documentHeight < viewportHeight) {
        backToTop = document.querySelector(".back-to-top");
        backToTop.style.display = "none";
    }

    window.addEventListener("load", function () {
        document.querySelector(".switch-lights").addEventListener("click", function () {
            localStorage.darkTheme = +toggleTheme();
        });

        Array.prototype.forEach.call(document.querySelectorAll('a[href^="#"]'), function (el) {
            el.addEventListener("click", function (event) {
                if (!(location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') &&
                      location.hostname == this.hostname)) {
                    return;
                }

                var to;
                if (this.hash === "") {
                    to = 0;
                } else {
                    to = document.querySelector(this.hash).scrollTop;
                }
                scroll(document.documentElement.scrollTop || document.body.scrollTop, to, 600);
                event.preventDefault();
            });
        });
    });
}());
