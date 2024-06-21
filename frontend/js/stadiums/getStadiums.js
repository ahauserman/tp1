function showLoadingSpinner() {
    const loadingSpinner = document.getElementById('loadingSpinner');
    loadingSpinner.style.display = 'block';
}

function hideLoadingSpinner() {
    const loadingSpinner = document.getElementById('loadingSpinner');
    loadingSpinner.style.display = 'none';
}

function response_received(response){
    console.log(response)
    return response.json()
}

let allStadiums = [];

function parse_data(content) {
    console.log(content);

    allStadiums = content.stadiums;
    renderStadiums(allStadiums);
    hideLoadingSpinner();
}

function renderStadiums(stadiums) {
    const stadiumsContainer = document.getElementById("stadiumsContainer");
    stadiumsContainer.innerHTML = "";

    for (let index = 0; index < stadiums.length; index++) {
        const stadium = stadiums[index];

        const card = document.createElement("div");
        card.className = "col-md-4 mb-4";
        card.setAttribute("href", `/stadium?id=${stadium.id_stadium}`);

        card.innerHTML = `
            <div class="card h-100">
                <img src="${stadium.photo}" class="card-img-top" alt="${stadium.stadium_name}">
                <div class="card-body">
                    <h5 class="card-title">${stadium.stadium_name}</h5>
                    <p class="card-text mb-1"><strong>City:</strong> ${stadium.city}</p>
                    <p class="card-text"><strong>Capacity:</strong> ${stadium.capacity}</p>
                </div>
            </div>
        `;

        stadiumsContainer.appendChild(card);

        card.addEventListener('click', () => {
            window.location.href = `stadium?id=${stadium.id_stadium}`;
        });
    }
}

function filterStadiums() {
    const searchInput = document.getElementById("searchInput").value.toLowerCase();
    const filteredStadiums = allStadiums.filter(stadium => 
        stadium.stadium_name.toLowerCase().includes(searchInput) ||
        stadium.city.toLowerCase().includes(searchInput)
    );
    renderStadiums(filteredStadiums);
}

document.getElementById("searchInput").addEventListener("input", filterStadiums);

function request_error(error){
    console.log("ERROR")
    console.log(error)
    hideLoadingSpinner();
}

showLoadingSpinner();

const request = fetch("http://localhost:5000/stadiums")
    .then(response_received)
    .then(parse_data)
    .catch(request_error);

console.log(request);