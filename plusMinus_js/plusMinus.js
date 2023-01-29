const plusMinus = (arr) => {
    let arrLength = arr.length;
    let positives = 0;
    let negatives = 0;
    let zeroes = 0;
    arr.forEach(num => {
        switch (true) {
            case num > 0:
                positives++;
                break;
            case num < 0:
                negatives++;
                break;
            default:
                zeroes++;
                break;
        }
    });
    const calculateProportion = (num, len) =>
        Number((num * 100 / len * 100) / 10000).toFixed(6)
    console.log(
        calculateProportion(positives, arrLength)
    );
    console.log(
        calculateProportion(negatives, arrLength)
    );
    console.log(
        calculateProportion(zeroes, arrLength)
    );
};