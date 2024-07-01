const urlParams = new URLSearchParams(window.location.search);
const id_country = urlParams.get('id');



getTeamNames(id_country);
    setCurrentCountry();

function handle_response(data) {
    if (data.success) {
        window.location.href = `../team/?id=${id_country}`
    } else {
        alert("error")
        console.log(data)
    }
}

function setCurrentCountry() {
    const countrySelect = document.getElementById("country");
    const options = countrySelect.options;
    for (let i = 0; i < options.length; i++) {
        const option = options[i];
        if (option.value === id_country) {
            option.selected = true;
        }
    }

}

function create_player(event) {
    event.preventDefault()

    const formData = new FormData(event.target)

    const player_name = formData.get("player_name")
    const photo = formData.get("photo")
    const team = formData.get("team")
    const position = formData.get("position")
    const country = formData.get("country")

    fetch("http://localhost:5000/players/create_player", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            player_name: player_name,
            team: team,
            photo: photo,
            country: country,
            position: position
        })
    })
        .then((res) => res.json())
        .then(handle_response)
        .catch((error) => console.log("ERROR", error))
}
