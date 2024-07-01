const urlParams = new URLSearchParams(window.location.search);
const player_id = urlParams.get('id');

function handle_response(data) {
    console.log(data.country)
    if (data.success) {
        window.location.href = `./?id=${data.country}` 
    } else {
        alert("error")
    }
}

function update_player(event) {
    event.preventDefault()

    const formData = new FormData(event.target)

    const player_name = formData.get("player_name")
    const photo = formData.get("photo")
    const team = formData.get("team")
    const position = formData.get("position")
    const country = formData.get("country")

    fetch(`http://localhost:5000/players/update_player/${player_id}`, {
        method: "PUT",
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