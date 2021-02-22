var cloneObj = function(obj) {
    return Object.keys(obj).reduce(function(dolly, key) {
        dolly[key] = (obj[key].constructor === Object) ?
            cloneObj(obj[key]) :
            obj[key];
        return dolly;
    }, {});
};