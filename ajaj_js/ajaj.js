/*jshint esversion:6*/
((global) => {
    'use strict';

    const ajaj = (url, type) => {
        type = type || 'get';
        return new Promise((resolve, reject) => {
            const xhr = new XMLHttpRequest();
            xhr.open(type, url, true);
            xhr.responseType = 'json';
            xhr.addEventListener('load', () => {
                const status = xhr.status;
                if (status === 200) {
                    resolve(xhr.response);
                } else {
                    reject(status);
                }
            });
            xhr.send();
        });
    };
    global.ajaj = ajaj;
    return ajaj;
})(this);
