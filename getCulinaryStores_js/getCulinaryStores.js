fetch('https://api.surlatable.com/stores/')
    .then((response) => response.json())
    .then((data) =>
        console.log(
            JSON.parse(data.body)
                .Items.reduce((culinaryList = [], store) => {
                    if (
                        Object.keys(store.culinary).length &&
                        store.culinary.cookingClasses.toLowerCase() !== 'no'
                    ) {
                        culinaryList.push(String(store.id).padStart(3, '0'))
                    }
                    return culinaryList
                }, [])
                .sort()
        )
    )
