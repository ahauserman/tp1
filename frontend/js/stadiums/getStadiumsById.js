const params = new URLSearchParams(window.location.search);
const id = params.get("id");

if (id === null) {
    window.location.href = "/";
}

function response_received(response) {
    return response.json();
}

function parse_data(content) {
    const stadium = content.stadiums;
    renderStadium(stadium);
    fetchMatches(id);
}

function renderStadium(stadium) {
    const stadiumContainer = document.getElementById("stadiumContainer");
    stadiumContainer.innerHTML = `
        <div class="container row mt-5 mb-5" id="stadiumContainer">
            <div class="row">
                <div class="col-sm-1">
                    <a href="../"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="black"
                            class="bi bi-arrow-left" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8" />
                        </svg></a>
                </div>
                <div class="col-lg-5">
                    <img class="stadiums-img" src="${stadium.photo}" style="max-width: 100%">
                </div>
                <div class="col-lg-6">
                    <h1 id="stadium_name">${stadium.stadium_name}</h1>
                    <p id="info">${stadium.city}</p>
                    <div class="row">
                        <div class="col-sm-1">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-people" viewBox="0 0 16 16">
                                <path
                                    d="M5 10a2 2 0 1 0 0-4 2 2 0 0 0 0 4z" />
                                <path
                                    d="M1 10c0-2.5 2-4 5-4s5 1.5 5 4v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-2z" />
                                <path
                                    d="M11 6.757C10.158 6.265 8.744 6 8 6s-2.158.265-3 .757V5a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v1.757z" />
                                <path fill-rule="evenodd"
                                    d="M3.12 13.693A1 1 0 0 1 3 13v-1.268C4.061 11.752 5.614 11 8 11s3.939.752 5 1.732V13a1 1 0 0 1-.12.693 7.544 7.544 0 0 1-.514 1.23A1 1 0 0 1 12 16H4a1 1 0 0 1-.366-.068 7.544 7.544 0 0 1-.514-1.23zM8 9c1.5 0 2.5 1 2.5 2H5c0-1 1-2 3-2z" />
                            </svg>
                        </div>
                        <div class="col-md-11">
                            <h5 class="mb-2" id="capacity">Capacidad: ${stadium.capacity}</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    `;
}

function fetchMatches(id) {
    const url = `http://localhost:5000/stadiums/${id}`;

    fetch(url)
        .then(response_received)
        .then(renderMatches)
        .catch(request_error);
}
function renderMatches(content) {
    const fixtureContainer = document.getElementById("fixtureContainer");
    fixtureContainer.innerHTML = '';

    const matches = content.stadiums.matches;

    const row = document.createElement("div");
    row.classList.add("row");

    matches.forEach((match, index) => {
        const column = document.createElement("div");
        column.classList.add("col-md-6");

        const card = createMatchCard(match);
        column.appendChild(card);

        row.appendChild(column);
        if (index % 2 === 0) {
            column.style.marginRight = "auto";
        } else {
            column.style.marginLeft = "auto";
        }
    });
    
    fixtureContainer.appendChild(row);
}

function createMatchCard(match) {
    const card = document.createElement("div");
    card.classList.add("card", "mb-4");
    card.style.width = "100%";
    card.style.marginBottom = "20px";

    const fechaFormatted = convertUTCToLocalTime(match.match_datetime);

    let resultado = `${match.score_home_team !== null ? match.score_home_team : '-'} - ${match.score_away_team !== null ? match.score_away_team : '-'}`;

    if (match.score_home_team === null && match.score_away_team === null) {
        resultado = '-';
    }

    card.innerHTML = `
        <div class="card-header text-center">
            ${fechaFormatted}
        </div>
        <div class="card-body">
            <div class="row mb-3">
                <div class="col-5 d-flex justify-content-center align-items-center">
                    <img src="${match.home_team_photo}" class="img-fluid rounded shadow-lg" alt="${match.home_team_name}">
                </div>
                <div class="col-2 text-center">
                    VS
                </div>
                <div class="col-5 d-flex justify-content-center align-items-center">
                    <img src="${match.away_team_photo}" class="img-fluid rounded shadow-lg" alt="${match.away_team_name}">
                </div>
            </div>
            <h5 class="card-title text-center mt-3 mb-3">${match.home_team_name} vs ${match.away_team_name}</h5>
            <p class="card-text">
                <strong style="font-weight: bold;">Grupo:</strong> ${match.match_group}<br>
                <strong>Resultado:</strong> ${resultado}
            </p>
        </div>
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

const request = fetch(`http://localhost:5000/stadiums/${id}`)
    .then(response_received)
    .then(parse_data)
    .catch(request_error);