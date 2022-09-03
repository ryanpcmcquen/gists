const betterCloneObj = (obj) => {
    return Object.assign({}, Object.getPrototypeOf(obj), obj);
};
