var cloneObjectWithNullValues = function (obj) {
    return Object.keys(obj).reduce(function (newObj, prop) {
        newObj[prop] = null;
        return newObj;
    }, {});
};