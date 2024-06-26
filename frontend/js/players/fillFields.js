const params = new URLSearchParams(window.location.search);
const id_player = params.get("id");

if (id_player === null) {
    window.location.href = "/";
}

function response_received(response) {
    return response.json();
}

function parse_data(content) {
    const player = content.player;
    fillFields(player);
}

function fillFields(player) {
    getTeamNames(player.country);
    for (const field in player) {
        const field_element = document.getElementById(`${field}`)
        
        if (field_element !== null) {
            if (field_element.tagName === 'SELECT') {
                const options = field_element.options;
                for (let i = 0; i < options.length; i++) {
                    if (options[i].value === player[field]) {
                        field_element.selectedIndex = i;
                        break;
                    }
                }
            } else {
                field_element.value = player[field];
            }
            
    }
}
}

function request_error(error) {
    console.error("Error fetching data:", error);
}

const request = fetch(`http://localhost:5000/players/${id_player}`)
    .then(response_received)
    .then(parse_data)
    .catch(request_error);