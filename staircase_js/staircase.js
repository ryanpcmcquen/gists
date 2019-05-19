const staircase = (n) => {
    console.log(
        Array(n)
            .fill()
            .map(
                (ignore, index) => `${' '.repeat(n - (index + 1))}${'#'.repeat(index + 1)}`
            )
            .join('\n')
    );
};

staircase(6)
