const cloneObj = (obj) => {
    return Object.keys(obj).reduce((dolly, key) => {
        dolly[key] = (obj[key].constructor === Object) ?
            cloneObj(obj[key]) :
            obj[key];
        return dolly;
    }, {});
};