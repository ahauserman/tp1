function showDeleteModal(player_id) {
    $(`#deletePlayer-${player_id}`).modal('show');
}

function handle_response(data) {
    console.log(data)
    if (data.success) {
        window.location.href = `./?id=${data.country}`
    } else {
        alert("error")
        console.log(data)
        
    }
}

function deletePlayer(player_id){
    fetch(`http://localhost:5000/players/delete_player/${player_id}`, {
        method: "DELETE",
        headers: {
            "Content-Type": "application/json"
        }
    })
        .then((res) => res.json())
        .then(handle_response)
        .catch((error) => console.log("ERROR", error))
}
