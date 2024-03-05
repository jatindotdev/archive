let winnerCeleb
let box = [null, null, null, null, null, null, null, null, null]
let x_turn = true
let result

document.querySelectorAll('#box button').forEach((btn) => {
    btn.addEventListener('click', () => {
        if (!btn.textContent) {
            if (x_turn) btn.textContent = 'X'
            else btn.textContent = 'O'
            box[btn.id] = x_turn
            x_turn = !x_turn
            btn.style.pointerEvents = 'none'
        }
        result = checkForWinners()
        if (result != null || result != undefined) {
            gotMyWinner(result)
        }
    })
})

function checkForWinners() {
    let diagnols =
        ((box[0] == box[4] && box[4] == box[8]) ||
            (box[2] == box[4] && box[4] == box[6])) &&
        (box[4] == true || box[4] == false)
    if (diagnols) {
        return box[4]
    } else if (
        box[0] == box[1] &&
        box[1] == box[2] &&
        (box[0] == true || box[0] == false)
    ) {
        return box[0]
    } else if (
        box[3] == box[4] &&
        box[4] == box[5] &&
        (box[3] == true || box[3] == false)
    ) {
        return box[3]
    } else if (
        box[6] == box[7] &&
        box[7] == box[8] &&
        (box[6] == true || box[6] == false)
    ) {
        return box[6]
    } else if (
        box[0] == box[3] &&
        box[3] == box[6] &&
        (box[0] == true || box[0] == false)
    ) {
        return box[0]
    } else if (
        box[1] == box[4] &&
        box[4] == box[7] &&
        (box[1] == true || box[1] == false)
    ) {
        return box[1]
    } else if (
        box[2] == box[5] &&
        box[5] == box[8] &&
        (box[2] == true || box[2] == false)
    ) {
        return box[2]
    } else {
        let gotTrue = false
        box.forEach((element) => {
            if (element == null) {
                gotTrue = true
            }
        })
        if (!gotTrue) {
            return 'DRAW'
        }
    }
}

function resetBox() {
    document.querySelectorAll('#box button').forEach((btn) => {
        btn.textContent = ''
        btn.style.pointerEvents = ''
        box = [null, null, null, null, null, null, null, null, null]
        document.getElementById('header').textContent = "Let's Start"
    })
    clearInterval(winnerCeleb)
}

function gotMyWinner(result) {
    let winner
    document.querySelectorAll('#box button').forEach((btn) => {
        btn.style.pointerEvents = 'none'
    })
    if (result == true) {
        winner = 'Winner: X'
    } else if (result == false) {
        winner = 'Winner: O'
    } else if (result == 'DRAW') {
        winner = "It's a Draw"
    }
    document.getElementById('header').textContent = winner
    winnerCeleb = setInterval(() => randomizedConfetti(), 500)
}

// document.addEventListener('click', (event) => {
//     bursty(event.pageX, event.pageY);
// });

function bursty(x, y) {
    const burst = new mojs.Burst({
        left: 0,
        top: 0,
        radius: { 0: 200 },
        count: 20,
        degree: 360,
        children: {
            fill: { white: '#25D2FF' },
            duration: 2000,
        },
    }).tune({
        x: x,
        y: y,
    })

    burst.replay()
}

function randomizedConfetti() {
    let randomX = Math.floor(
        Math.random() * (document.body.clientWidth - 100) + 0
    )
    let randomY = Math.floor(Math.random() * (window.innerHeight - 200) + 0)
    const burst = new mojs.Burst({
        left: 0,
        top: 0,
        radius: { 0: 200 },
        count: 20,
        degree: 360,
        children: {
            fill: { white: '#25D2FF' },
            duration: 2000,
        },
    }).tune({
        x: randomX,
        y: randomY,
    })

    burst.replay()
}
