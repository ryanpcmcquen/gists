const birthdayCakeCandles = (ar) => {
    const max = Math.max(...ar);
    return ar.filter(i => i === max).length;
};