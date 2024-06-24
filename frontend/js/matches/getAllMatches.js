function showLoadingSpinner() {
    const loadingSpinner = document.getElementById('loadingSpinner');
    loadingSpinner.style.display = 'block';
}

function hideLoadingSpinner() {
    const loadingSpinner = document.getElementById('loadingSpinner');
    loadingSpinner.style.display = 'none';
}

function response_received(response) {
    console.log(response)
    return response.json()
}

let allMatches = [];

function parse_data(content) {
    console.log(content);

    allMatches = content.matches;
    renderMatches(allMatches);
    hideLoadingSpinner();
}

function renderMatches(matches) {
    const card = document.createElement("div");
    card.classList.add("card", "mb-4");
    card.style.width = "100%";
    card.style.marginBottom = "20px";

   
    const matchesContainer = document.getElementById("matchesContainer");
    matchesContainer.innerHTML = "";

    for (let index = 0; index < matches.length; index++) {
        const match = matches[index];
        const fechaFormatted = convertUTCToLocalTime(match.match_datetime); 
        
        let resultado = `${match.score_home_team !== null ? match.score_home_team : '-'} - ${match.score_away_team !== null ? match.score_away_team : '-'}`;

        if (match.score_home_team === null && match.score_away_team === null) {
            resultado = '-';
        }

        const card = document.createElement("div");
        card.className = "col-md-4 mb-4";

        card.innerHTML = `
            <div class="card h-100">
                <div class="card-header text-center">
                    ${fechaFormatted}
                </div>
                <div class="card-body">
                    <div class="row mb-3">
                        <div class="col-5 d-flex justify-content-center align-items-center">
                            <img src="${match.home_team_photo}" class="img-fluid rounded shadow-lg" alt="${match.home_team_name}">
                        </div>
                        <div class="col-2 text-center">
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
            </div>
        `;

        matchesContainer.appendChild(card);
    }
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
function filterMatches() {
    const searchInput = document.getElementById("searchInput").value.toLowerCase();
    const keywords = searchInput.split(' ');

    const filteredMatches = allMatches.filter(match => {
        return keywords.every(keyword =>
            match.away_team_name.toLowerCase().includes(keyword) ||
            match.home_team_name.toLowerCase().includes(keyword)
        );
    });

    renderMatches(filteredMatches);
}

document.getElementById("searchInput").addEventListener("input", filterMatches);

function request_error(error) {
    console.log("ERROR");
    console.log(error);
    hideLoadingSpinner();
}

showLoadingSpinner();

const request = fetch("http://localhost:5000/matches")
    .then(response_received)
    .then(parse_data)
    .catch(request_error);

console.log(request);