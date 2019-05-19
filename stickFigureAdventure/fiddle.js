// initialize the current scene to scene to scene 0 (intro)
var curScene = 0;

function replaceNodeText(id, newText) {
    var node = document.getElementById(id);
    while (node.firstChild)
    node.removeChild(node.firstChild);
    node.appendChild(document.createTextNode(newText));
}

function changeScene(decision) {
    // clear the scene message
    var message = "";
    var decision1 = "",
        decision2 = "";

    switch (curScene) {
        case 0:
            curScene = 1;
            message = "Your journey begins at a fork in the road.";
            decision1 = "Take the path";
            decision2 = "Take the bridge";

            // show the second decision
            document.getElementById("decision2").style.visibility = "visible";
            break;
        case 1:
            if (decision === 1) {
                curScene = 2;
                message = "You have arrived at a cute little house in the woods.";
                decision1 = "Walk around back";
                decision2 = "Knock on door";
            } else {
                curScene = 3;
                message = "You are standing on the bridge overlooking a peaceful stream.";
                decision1 = "Walk across bridge";
                decision2 = "Gaze into stream";
            }
            break;
        case 2:
            if (decision === 1) {
                curScene = 4;
                message = "Peeking through the window, you see a witch inside the house.";
                decision1 = "Sneak by window";
                decision2 = "Wave at witch";
            } else {
                curScene = 5;
                message = "Sorry, a witch lives in the house and you just became part of her stew.";
                decision1 = "Start over";
                decision2 = "";

                // hide the second decision
                document.getElementById("decision2").style.visibility = "hidden";
            }
            break;
        case 3:
            if (decision === 1) {
                curScene = 6;
                message = "Sorry, a troll lives on the other side of the bridge and you just became his lunch.";
                decision1 = "Start over";
                decision2 = "";

                // hide the second decision

                document.getElementById("decision2").style.visibility = "hidden";
            } else {
                curScene = 7;
                message = "Your stare is interrupted by the arrival of a huge troll.";
                decision1 = "Say hello to troll";
                decision2 = "Jump into stream";
            }
            break;
        case 4:
            if (decision === 1) {
                curScene = 8;
                decision1 = "?";
                decision2 = "?";
            } else {
                curScene = 5;
                message = "Sorry, you became part of the witch's stew.";
                decision1 = "Start over";
                decision2 = "";

                // hide the second decision
                document.getElementById("decision2").style.visibility = "hidden";
            }
            break;
        case 5:
            curScene = 0;
            decision1 = "Start game";
            decision2 = "";
            break;
        case 6:
            curScene = 0;
            decision1 = "Start game";
            decision2 = "";
            break;
        case 7:
            if (decision === 1) {
                curScene = 6;
                message = "Sorry, you became the troll's tasty lunch.";
                decision1 = "Start over";
                decision2 = "";

                // hide the second decision
                document.getElementById("decision2").style.visibility = "hidden";
            } else {
                curScene = 9;
                decision1 = "?";
                decision2 = "?";
            }
            break;
        case 8:
            // TO BE CONTINUED
            break;
        case 9:
            // TO BE CONTINUED
            break;
    }

    // update the scene image
    document.getElementById("sceneimg").src = "https://github.com/ryanpcmcquen/headFirstJavascriptCode/raw/master/JS%20examples/chapter08/sfa/scene" + curScene + ".png";

    // update the scene description text and decisions
    replaceNodeText("scenetext", message);
    replaceNodeText("decision1", decision1);
    replaceNodeText("decision2", decision2);

    // update the decision history
    var history = document.getElementById("history");
    if (curScene !== 0) {
        // add the latest decision to the history
        var decisionElem = document.createElement("p");

        decisionElem.appendChild(document.createTextNode("Decision " + decision + " => Scene " + curScene + " : " + message));
        history.appendChild(decisionElem);
    } else {
        // clear the decision history
        while (history.firstChild)
        history.removeChild(history.firstChild);
    }
}