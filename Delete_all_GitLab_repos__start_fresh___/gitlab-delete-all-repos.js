const request = require('request')
const token = require('./.SECRET')
const user = ''

request(
    `https://gitlab.com/api/v4/users/${user}/projects?private_token=${token}`,
    (error, response, body) => {
        JSON.parse(body)
            .map((project) => project.id)
            .forEach((projectId) => {
                request(
                    {
                        uri: `https://gitlab.com/api/v4/projects/${projectId}/?private_token=${token}`,
                        method: 'DELETE'
                    },
                    (error, response, body) => {
                        console.log('error:', error)
                        console.log(JSON.parse(body).message)
                    }
                )
            })
    }
)
