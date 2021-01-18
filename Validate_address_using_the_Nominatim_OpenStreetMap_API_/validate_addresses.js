const fs = require('fs')
/* global fetch */
require('isomorphic-fetch')
const path = require('path')

fs.readFile(process.argv[2], 'utf8', (err, data) => {
    if (err) {
        return console.log(err)
    }
    const addresses = JSON.parse(data)

    addresses.forEach((address) =>
        fetch(
            `https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(
                address
            )}`
        )
    )
})
