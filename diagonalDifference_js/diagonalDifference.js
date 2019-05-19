const diagonalDifference = (arr, n) => {
    const sum = a => a.reduce((acc, val) => acc += val);
    const getFirstDiagonal = (gridSize, a) =>
        Array(gridSize).fill().map((ignore, index) => a[index][index]);
    const getSecondDiagonal = (gridSize, a) => 
        Array(gridSize).fill().map((ignore, index) => {
            gridSize--;
            return a[index][gridSize];
        });
    return (Math.abs(
        sum(getFirstDiagonal(n, arr)) - sum(getSecondDiagonal(n, arr))
    ));
};