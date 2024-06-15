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

let allTeams = [];

function parse_data(content) {
    console.log(content);

    allTeams = content.Countries;
    renderTeams(allTeams);
    hideLoadingSpinner();
}

function renderTeams(teams) {
    const teamsContainer = document.getElementById("teamsContainer");
    teamsContainer.innerHTML = "";

    for (let index = 0; index < teams.length; index++) {
        const team = teams[index];

        const card = document.createElement("div");
        card.className = "col-md-4 mb-4";
        card.setAttribute("href", `/getbyid?id=${teams[index].id_country}`);

        card.innerHTML = `
            <div class="card h-100">
                <img src="${team.photo}" class="card-img-top" alt="${team.country_name}">
                <div class="card-body">
                    <h5 class="card-title">${team.country_name}</h5>
                    <p class="card-text mb-1"><strong>Director Técnico:</strong> ${team.dt}</p>
                    <p class="card-text mb-1"><strong>Grupo:</strong> ${team.country_group}</p>
                    <p class="card-text mb-1"><strong>Títulos:</strong> ${team.titles}</p>
                    <p class="card-text text-justify"><strong>Información Adicional:</strong> ${team.info}</p>
                </div>
            </div>
        `;

        teamsContainer.appendChild(card);

        card.addEventListener('click', () => {
            window.location.href = `/${team.id_country}`;
        });
    }
}

function filterTeams() {
    const searchInput = document.getElementById("searchInput").value.toLowerCase();
    const filteredTeams = allTeams.filter(team => 
        team.country_name.toLowerCase().includes(searchInput)
    );
    renderTeams(filteredTeams);
}

document.getElementById("searchInput").addEventListener("input", filterTeams);

function request_error(error) {
    console.log("ERROR");
    console.log(error);
    hideLoadingSpinner();
}

showLoadingSpinner();

const request = fetch("http://localhost:5000/teams")
    .then(response_received)
    .then(parse_data)
    .catch(request_error);

console.log(request);