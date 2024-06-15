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
    loadingSpinner.style.display = 'none';
}

function response_received(response) {
    console.log(response)
    return response.json()
}

let allPlayers = [];

function parse_data(content) {
    console.log(content);

    allPlayers = content.Players;
    renderPlayers(allPlayers);

    hideLoadingSpinner();
}

function renderPlayers(players) {
    const playersContainer = document.getElementById("playersContainer");
    playersContainer.innerHTML = "";

    for (let index = 0; index < players.length; index++) {
        const player = players[index];

        const card = document.createElement("div");
        card.className = "card";
        card.style = "width: 18rem;";


        card.innerHTML = `
x
                <img class="card-img-top" id="photo" src="${player.photo}" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">${player._name}</h5>
                    <p class="card-text" id="team">Club: ${player.team}</p>
                    <p class="card-text" id="country">Pais: ${player.country}</p>
                    <p class="card-text" id="position">Posicion: ${player.position}</p>
                    <div class="row">
                        <div class="col-lg-6">

                            <button type="button" class="btn btn-primary" id="editPlayer" href="">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                    class="bi bi-pencil" viewBox="0 0 16 16">
                                    <path
                                        d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325" />
                                </svg>
                                Button
                            </button>
                        </div>
                        <div class="col-lg-6">
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
                                Button
                            </button>
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
        player._name.toLowerCase().includes(searchInput)
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

const request = fetch("http://localhost:5000/players/${id}")
    .then(response_received)
    .then(parse_data)
    .catch(request_error);

console.log(request);