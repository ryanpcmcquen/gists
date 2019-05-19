const fs = require('fs')
const mkdirp = require('mkdirp')
const path = require('path')

const write = (filePath, code) => {
    mkdirp.sync(path.dirname(filePath))
    return new Promise((resolve, reject) => {
        fs.writeFile(filePath, code, (err) => {
            if (err) {
                reject(err)
            } else {
                resolve()
            }
        })
    })
}

fs.readFile('./articles.json', 'utf8', (err, data) => {
    if (err) {
        return console.log(err)
    }
    const json = JSON.parse(data)
    write(
        './uniqueArticles.txt',
        [...new Set(json.map((article) => article.url))].join('\n')
    )
})
