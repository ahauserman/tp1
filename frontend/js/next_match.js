function response_received(response) {
    return response.json();
}

function parse_data() {
    fetchMatch();
}


function fetchMatch() {
    const url = `http://localhost:5000/matches/next_match`;

    fetch(url)
        .then(response_received)
        .then(renderMatch)
        .catch(request_error);
}

function renderMatch(content) {
    matchContainer = document.getElementById("matchContainer");
    matchContainer.innerHTML = '';

    const match = content.next_match;
    console.log(content.next_match)
    
    const row = document.createElement("div");
    row.classList.add("row");
    const column = document.createElement("div");
    column.classList.add("col-md-12");
    const card = createMatchCard(match);
    column.appendChild(card);
    row.appendChild(column);
    
    matchContainer.appendChild(row);
}

function createMatchCard(match) {
    const card = document.createElement("div")
    card.classList.add("mb-3");
    card.style.width = "100%";
    card.style.marginBottom = "20px";

    const fechaFormatted = convertUTCToLocalTime(match.match_datetime);

    card.innerHTML = `
        <div class="card-header text-center">
            ${fechaFormatted}
        </div>
        <div class="card-body">
            <div class="row mb-5">
                <div class="col-5 d-flex justify-content-center align-items-center">
                    <img src="${match.home_team_photo}" class="img-fluid rounded shadow-lg" alt="${match.home_team_name}">
                </div>
                <div class="col-2 text-center">
                </div>
                <div class="col-5 d-flex justify-content-center align-items-center">
                    <img src="${match.away_team_photo}" class="img-fluid rounded shadow-lg" alt="${match.away_team_name}">
                </div>
            </div>
            <h5 class="card-title text-center mt-3 mb-3" id="next_match">${match.home_team_name} vs ${match.away_team_name}</h5>
            <p class="card-text">
                <strong style="font-weight: bold;">Grupo:</strong> ${match.match_group}<br>
            </p>
    `;

    return card;
}


function convertUTCToLocalTime(utcDateString) {
    const date = new Date(utcDateString);
    const localDate = new Date(date.getTime() + date.getTimezoneOffset() * 60000);

    return localDate.toLocaleString('es-ES', {
        weekday: 'long',
        day: 'numeric',
        month: 'long',
        year: 'numeric',
        hour: 'numeric',
        minute: 'numeric'
    });
}

function request_error(error) {
    console.error("Error fetching data:", error);
}

const request = fetch(`http://localhost:5000/matches/next_match`)
    .then(response_received)
    .then(parse_data)
    .catch(request_error);