const urlParams = new URLSearchParams(window.location.search);
const id_country = urlParams.get('id');

function handle_response(data) {
    console.log(data.success)
    if (data.success) {
        window.location.href = `../?id=${id_country}` //?id=${id_country}
    } else {
        alert("error")
        console.log(data)
    }
}

function update_player(event) {
    event.preventDefault()

    const formData = new FormData(event.target)

    const player_name = formData.get("player_name")
    const photo = formData.get("photo")
    const team = formData.get("team")
    const position = formData.get("position")

    fetch("http://localhost:5000/players/update_player", {
        method: "PUT",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            player_name: player_name,
            team: team,
            photo: photo,
            country: id_country,
            position: position
        })
    })
        .then((res) => res.json())
        .then(handle_response)
        .catch((error) => console.log("ERROR", error))
}