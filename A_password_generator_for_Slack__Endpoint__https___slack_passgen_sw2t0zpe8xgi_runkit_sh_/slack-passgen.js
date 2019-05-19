const giveMe10 = () => Math.random().toString(36).substr(2, 10)

const passGen = (request, response) => {
    response.end(`${giveMe10()}${giveMe10()}`)
}

exports.endpoint = passGen