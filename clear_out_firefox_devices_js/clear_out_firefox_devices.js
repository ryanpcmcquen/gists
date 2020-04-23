window.setInterval(() => {
    ;[
        ...document.querySelectorAll(
            'button.settings-button.warning-button.client-disconnect'
        )
    ]
        .pop()
        .click()
    window.setTimeout(() => document.querySelector('#submit-btn').click(), 300)
}, 600)
