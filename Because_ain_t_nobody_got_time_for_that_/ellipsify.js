const ellipsify = (text, maxLength=500) => {
    return (text.length > maxLength) ? `${text.substr(0, maxLength - 4)} ...` : text;
};
