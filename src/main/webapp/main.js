const rInput = document.querySelector(".r-select")
const form = document.querySelector(".form")
const yInput = document.querySelector("#y-data")
const xInput = document.querySelectorAll(".x-input")
// const baseURL = './web2/controller'
const resTable = document.querySelector("#result-table-body")
const clearFormButton = document.querySelector("#clear-form-button")
const clearTableButton = document.querySelector("#clear-table-button")
const error = document.getElementById('error')
const graph = document.querySelector("#graph")
const yDashLine = document.querySelector('.graph-y-dash-line')
const xDashLine = document.querySelector('.graph-x-dash-line')
let xValue;
let yValue;
let rValue;

xInput.forEach(button => {
    button.addEventListener('click', (event) => {
        xInput.forEach(button => button.classList.remove("active"))
        button.classList.add("active")
    })
});


const fetchData = async (url) => {
        const res = await fetch(url)
        return res.text()
}

function sub(xValue, yValue, rValue) {
    if (yValue >= -5 && yValue <= 5 && [-3, -2, -1, 0, 1, 2, 3, 4 ,5].includes(xValue)) {
        error.innerHTML = ""
        ;(async () => {
            // let data = new FormData()
            // data.append("x", xValue)
            // data.append("y", yValue)
            // data.append("r", rValue)
            const submitRes = await fetchData(`http://localhost:8080/web2/controller?type=hit&x=${xValue}&y=${yValue}&r=${rValue}`)
            if (submitRes === "error") {
                location.href("/error.jsp")
            }
            let resArray = JSON.parse(submitRes)
            let current_time = Date(resArray['current_time'])
            current_time = current_time.split(' ').slice(1, 5).join(' ')
            resTable.insertAdjacentHTML("afterbegin",
                `<tr style='text-align: center;'>
                <td>${resArray['x']}</td>
                <td>${resArray['y']}</td>
                <td>${resArray['r']}</td>
                <td>${resArray['hit']}</td>
                <td>${current_time}</td>
                <td>${resArray['time']} ms</td>
                </tr>`
            )
            let convX = (resArray['x'] / resArray['r']) * 100 + 150
            let convY = - (resArray['y'] / resArray['r']) * 100 + 150
            if (convX > 300) {convX = 300}
            if (convY > 300) {convY = 300}
            graph.insertAdjacentHTML("beforeend", `<circle cx="${convX}" cy="${convY}" r="2" class="point" />`)
        })()
    }
    else {
        error.innerHTML = "Validation error. Y must be in [-3,3]. R must be defined."
    }

}

form.addEventListener('submit', (event) => {
    event.preventDefault()
    xInput.forEach(button => {
        if (button.classList.contains("active")) {
            xValue = +button.value
        }
    })
    let y = yInput.value
    yValue = +y.replace(',', '.')
    rValue = +rInput.value
    sub(xValue, yValue, rValue)
})

clearFormButton.addEventListener('click', (event) => {
    xInput.forEach(button => button.classList.remove("active"))
    yInput.value = ""
    rInput.value = 1
})

clearTableButton.addEventListener('click', (event) => {
    fetch('./controller?type=clear')
    resTable.innerHTML = ""
    let points = document.querySelectorAll('.point')
    points.forEach( point => point.remove())
})

graph.addEventListener('mousemove', event => {
    let x = (event.offsetX / 360 * 300).toString()
    let y = event.offsetY / 360 * 300
    let r = rValue
    if (x > 300) {
        x = 300
        xDashLine.setAttribute("stroke", "transparent")
    }
    if (y > 300) {
        y = 300
        yDashLine.setAttribute("stroke", "transparent")
    }
    let yCord = ((-y / 300) + 0.5) * 3 * r
    if (!r || yCord <= 5 && yCord >= -5) {
        yDashLine.setAttribute("y1", y)
        yDashLine.setAttribute("y2", y)
    }


    xDashLine.setAttribute("x1", x)
    xDashLine.setAttribute("x2", x)
})

graph.addEventListener('click', event => {
    let x = (event.offsetX / 360 * 300).toString()
    let y = event.offsetY / 360 * 300
    let r = rInput.value
    let xCord = Math.round((x / 300 - 0.5) * r * 3)
    let yCord = ((-y / 300) + 0.5) * 3 * r
    if (!r) {
        error.innerHTML = "Radius must be selected"
    }
    if (xCord >= -4 && xCord <= 4 && yCord <= 5 && yCord >= -5) {
        sub(xCord, yCord, r)
    }
})
