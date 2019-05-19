var objectMeIfEmpty = function(item) {
    return (item && item.constructor && item.constructor === Object) ? item : {};
};