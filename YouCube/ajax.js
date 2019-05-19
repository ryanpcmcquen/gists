// AjaxRequest object constructor
function AjaxRequest() {
    // try the XMLHttpRequest object first
    if (window.XMLHttpRequest) {
        try {
            this.request = new XMLHttpRequest();
        } catch (e) {
            this.request = null;
        }
    }

    // if the request creation failed, notify the user
    if (this.request === null) alert("Ajax error creating the request.\n" + "Details: " + e);
}

// send an ajax request to the server
AjaxRequest.prototype.send = function (type, url, handler, postDataType, postData) {
    if (this.request !== null) {
        // kill the previous request
        this.request.abort();

        // tack on a dummy parameter to override browser caching
        url += "?dummy" + new Date().getTime();

        try {
            this.request.onreadystatechange = handler;
            this.request.open(type, url, true); // always asynchronous (true)
            if (type.toLowerCase() === "get") {
                // send a GET request; no data involved
                this.request.send(null);
            } else {
                // send a POST request; the last argument is data
                this.request.setRequestHeader("Content-Type", postDataType);
                this.request.send(postData);
            }
        } catch (e) {
            alert("Ajax error communicating with the server.\n" + "Details: " + e);
        }
    }
};

AjaxRequest.prototype.getReadyState = function () {
    return this.request.readyState;
};

AjaxRequest.prototype.getStatus = function () {
    return this.request.status;
};

AjaxRequest.prototype.getResponseText = function () {
    return this.request.responseText;
};

AjaxRequest.prototype.getResponseXML = function () {
    return this.request.responseXML;
};