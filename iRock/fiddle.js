var userName;

function greetUser() {
    if (navigator.cookieEnabled) userName = readCookie("irock_username");
    if (userName) alert("Hello " + userName + ", I missed you.");
    else alert('Hello, I am your pet rock.');
}

function touchRock() {
    if (userName) {
        alert("I like the attention, " + userName + ". Thank you.");
    } else {
        userName = prompt("What is your name?", "Enter your name here.");
        if (userName) {
            alert("It is good to meet you, " + userName + ".");
            if (navigator.cookieEnabled) writeCookie("irock_username", userName, 5 * 365);
            else alert("You don't have cookies enabled, no dessert for you!");
        }
    }

    document.getElementById("rockImg").src = "https://raw.githubusercontent.com/ryanpcmcquen/headFirstJavascriptCode/master/JS%20examples/chapter01/irock/rock_happy.png";
    setTimeout(function () {
        document.getElementById('rockImg').src = 'https://raw.githubusercontent.com/ryanpcmcquen/headFirstJavascriptCode/master/JS%20examples/chapter01/irock/rock.png';
    }, 3 * 1000);
}

function resizeRock() {
    document.getElementById("rockImg").style.height = (document.body.clientHeight - 100) * 0.9;
}