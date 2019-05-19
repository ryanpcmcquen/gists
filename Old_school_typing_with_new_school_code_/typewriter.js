document.addEventListener('DOMContentLoaded', () => {
    const typeWriter = (obj) => {
        const firstIndex = obj.firstIndex
        const speed = obj.speed
        const inputElem = obj.inputElem
        const outputElem = obj.outputElem
        const input = document.querySelector(inputElem).textContent
        const outputNode = document.querySelector(outputElem)
        if (firstIndex === 0) {
            outputNode.textContent = ''
        } else {
            outputNode.textContent += input.charAt(firstIndex)
        }
        window.setTimeout(() => {
            if (firstIndex < input.length - 1) {
                typeWriter({
                    firstIndex: firstIndex + 1,
                    speed: speed,
                    inputElem: inputElem,
                    outputElem: outputElem
                })
            } else {
                typeWriter({
                    firstIndex: 0,
                    speed: speed,
                    inputElem: inputElem,
                    outputElem: outputElem
                })
            }
        }, speed)
    }

    typeWriter({
        firstIndex: 0,
        speed: 75,
        inputElem: ".input",
        outputElem: ".output"
    })
})