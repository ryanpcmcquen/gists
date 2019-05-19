const miniMaxSum = (arr) => {
    const arrLength = arr.length;
    const arrSorted = arr.sort();
    const sum = a => a.reduce((acc, val) => acc = acc + val);
    const minSum = sum(arrSorted.slice(0, -1));
    const maxSum = sum(arrSorted.slice(1));
    console.log(minSum, maxSum);

};