// 1. Open: chrome://settings/passwords
// 2. Open Chrome developer tools (using F12 or Ctrl+Shift+i).
// 3. Run the following code in the console tab.
// 4. Copy output in a text file and save it somewhere safe!
;(() => {
    const asyncForEach = (array, done, iterator) => {
        let i = 0
        let next = err => {
            if (err) {
                done(err)
            } else if (i >= array.length) {
                done()
            } else if (i < array.length) {
                let item = array[i++]
                setTimeout(() => {
                    iterator(item, i - 1, next)
                }, 0)
            }
        }
        next()
    }

    settingsUi = $$("settings-ui")
    settingsPage = Polymer.dom(settingsUi[0].shadowRoot)
    container = settingsPage.querySelector("#container")
    settingsPasswordsAndForms = Polymer.dom(
        Polymer.dom(
            Polymer.dom(
                settingsPage.querySelector("#main").shadowRoot
            ).querySelector("settings-basic-page").shadowRoot
        ).querySelector("settings-passwords-and-forms-page").shadowRoot
    )
    page = settingsPasswordsAndForms.querySelector("passwords-section")
        .shadowRoot
    passwordSection = Polymer.dom(
        settingsPasswordsAndForms.querySelector("#pages")
    ).querySelector("#passwordSection")
    list = Polymer.dom(page).querySelector("iron-list")
    passwordItems = list.get("items")

    asyncForEach(
        passwordItems,
        () => {
            console.log(JSON.stringify(passwordItems, null, 4))
            // Now you can save the output in a text file!
        },
        (item, index, next) => {
            passwordSection.passwordManager_.getPlaintextPassword(
                index,
                (item) => {
                    passwordItems[index].password = item.plaintextPassword
                    next()
                }.bind(passwordSection)
            )
        }
    )
})()
