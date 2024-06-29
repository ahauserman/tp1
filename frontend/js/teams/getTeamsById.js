const params = new URLSearchParams(window.location.search);
const id = params.get("id");
if (id === null) {
    window.location.href = "/";
}

function showLoadingSpinner() {
    const loadingSpinner = document.getElementById('loadingSpinner');
    loadingSpinner.style.display = 'block';
}

function hideLoadingSpinner() {
    const loadingSpinner = document.getElementById('loadingSpinner');
    loadingSpinner.style.display = "none";
}

function response_received(response) {
    console.log(response)
    return response.json()
}

let allPlayers = [];

function parse_data(content) {
    console.log(content);
    team = content.Country;
    allPlayers = content.Country.players;

    renderTeam(team);
    renderPlayers(allPlayers);

    hideLoadingSpinner();
}

function renderTeam(team) {
    const teamContainer = document.getElementById("teamContainer");
    const teamDiv = document.createElement("div");
    teamDiv.innerHTML = `
    <div class="container row mt-5 mb-5" id="teamContainer">
            
            
                <div class="row">
                <div class="col-sm-1">
                <a href="../"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="black"
                    class="bi bi-arrow-left" viewBox="0 0 16 16">
                    <path fill-rule="evenodd"
                        d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8" />
                </svg></a>
            </div>
                    <div class="col-lg-5">
                        <img class="country-img"
                            src="${team.photo}"
                            style="max-width: 100%">
                    </div>
                    <div class="col-lg-6">
                        <h1 id="country_name">${team.country_name}</h1>
                    
                
                <p id="info">${team.info}</p>
                <div class="row">
                    <div class="col-sm-1"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                            fill="currentColor" class="bi bi-table" viewBox="0 0 16 16">
                            <path
                                d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm15 2h-4v3h4zm0 4h-4v3h4zm0 4h-4v3h3a1 1 0 0 0 1-1zm-5 3v-3H6v3zm-5 0v-3H1v2a1 1 0 0 0 1 1zm-4-4h4V8H1zm0-4h4V4H1zm5-3v3h4V4zm4 4H6v3h4z" />
                        </svg></div>
                    <div class="col-md-11">
                        <h5 class="mb-2" id="group">Grupo: ${team.country_group}</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-1"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                            fill="currentColor" class="bi bi-trophy" viewBox="0 0 16 16">
                            <path
                                d="M2.5.5A.5.5 0 0 1 3 0h10a.5.5 0 0 1 .5.5q0 .807-.034 1.536a3 3 0 1 1-1.133 5.89c-.79 1.865-1.878 2.777-2.833 3.011v2.173l1.425.356c.194.048.377.135.537.255L13.3 15.1a.5.5 0 0 1-.3.9H3a.5.5 0 0 1-.3-.9l1.838-1.379c.16-.12.343-.207.537-.255L6.5 13.11v-2.173c-.955-.234-2.043-1.146-2.833-3.012a3 3 0 1 1-1.132-5.89A33 33 0 0 1 2.5.5m.099 2.54a2 2 0 0 0 .72 3.935c-.333-1.05-.588-2.346-.72-3.935m10.083 3.935a2 2 0 0 0 .72-3.935c-.133 1.59-.388 2.885-.72 3.935M3.504 1q.01.775.056 1.469c.13 2.028.457 3.546.87 4.667C5.294 9.48 6.484 10 7 10a.5.5 0 0 1 .5.5v2.61a1 1 0 0 1-.757.97l-1.426.356a.5.5 0 0 0-.179.085L4.5 15h7l-.638-.479a.5.5 0 0 0-.18-.085l-1.425-.356a1 1 0 0 1-.757-.97V10.5A.5.5 0 0 1 9 10c.516 0 1.706-.52 2.57-2.864.413-1.12.74-2.64.87-4.667q.045-.694.056-1.469z" />
                        </svg></div>
                    <div class="col-md-11">
                        <h5 class="mb-2" id="titles">Títulos: ${team.titles}</h4>
                    </div>
                </div>
</div>
            </div>
        </div>
        `
    teamContainer.appendChild(teamDiv)

    //create new player button
    const newButton = document.getElementById("newPlayerButton");
        newButton.setAttribute("href", `addPlayer.html?id=${team.id_country}`);
        newButton.addEventListener('click', () => {
            window.location.href = `addPlayer.html?id=${team.id_country}`;
        });
}

function renderPlayers(players) {
    const playersContainer = document.getElementById("playersContainer");
    playersContainer.innerHTML = "";

    for (let index = 0; index < players.length; index++) {
        const player = players[index];

        const card = document.createElement("div");
        card.className = "col-md-4 mb-4";
        card.style = "width: 18rem;";


        card.innerHTML = `
            <div class="card h-100">
                <img class="card-img-top" width="100%" id="photo" src="${player.photo}" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">${player.name}</h5>
                    <p class="card-text" id="team">Club: ${player.team}</p>
                    <p class="card-text" id="position">Position: ${player.position}</p>
                    <div class="row">
                        <div class="col-md-6">
                            <button type="button" class="btn btn-primary" id="editPlayer" href="./editPlayer.html?id=${player.id}">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                    class="bi bi-pencil" viewBox="0 0 16 16">
                                    <path
                                        d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325" />
                                </svg>
                                Edit
                            </button>
                        </div>
                        <div class="col-md-6">
                            <button type="button" class="btn btn-outline-danger" id="deletePlayer" href="">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                    class="bi bi-trash" viewBox="0 0 16 16">
                                    <path
                                        d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z">
                                    </path>
                                    <path
                                        d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z">
                                    </path>
                                </svg>
                                Delete
                            </button>
                        </div>
                    </div>
 </div>
                </div>
        `;

        playersContainer.appendChild(card);

    }
}

function filterPlayers() {
    const searchInput = document.getElementById("searchInput").value.toLowerCase();
    const filteredPlayers = allPlayers.filter(player =>
        player.name.toLowerCase().includes(searchInput)
    );
    renderPlayers(filteredPlayers);
}

document.getElementById("searchInput").addEventListener("input", filterPlayers);

function request_error(error) {
    console.log("ERROR");
    console.log(error);
    hideLoadingSpinner();
}

showLoadingSpinner();

const request = fetch(`http://localhost:5000/teams/${id}`)
    .then(response_received)
    .then(parse_data)
    .catch(request_error);

console.log(request);