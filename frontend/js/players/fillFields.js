const params = new URLSearchParams(window.location.search);
const player_id = params.get("id");

if (id === null) {
    window.location.href = "/";
}

function response_received(response) {
    return response.json();
}

function parse_data(content) {
    const player = content.Player;
    fillFields(player);
}

function fillFields(player) {
    player.player_data.forEach(field => {
        const field_element=document.getElementById("${field}")
        field_element.textContent = field.value;
    });
}

function request_error(error) {
    console.error("Error fetching data:", error);
}

const request = fetch(`http://localhost:5000/players/${player_id}`)
    .then(response_received)
    .then(parse_data)
    .catch(request_error);