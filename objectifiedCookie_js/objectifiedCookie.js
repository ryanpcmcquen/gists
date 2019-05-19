var objectifiedCookie = document.cookie
    .split(';')
    .reduce(function(cookieObj, value) {
        var keyValueArr = value.split('=');
        cookieObj[keyValueArr[0]] = keyValueArr[1];
        return cookieObj;
    }, {});