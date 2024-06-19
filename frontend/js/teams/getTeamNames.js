document.addEventListener("DOMContentLoaded", function() {
    const urlParams = new URLSearchParams(window.location.search);
    const teamId = urlParams.get("teamId");

    fetch(`http://localhost:5000/teams`)
        .then(response => response.json())
        .then(data => {
            const countrySelect = document.getElementById("country");
            data.forEach(team => {
                const option = document.createElement("option");
                option.value = team.id;
                option.textContent = team.country_name;
                if (team.id == teamId) {
                    option.selected = true;
                }
                countrySelect.appendChild(option);
            });
        })
        .catch(error => {
            console.error("Error fetching teams:", error);
        });
});