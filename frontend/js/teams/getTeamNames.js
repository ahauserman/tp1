document.addEventListener("DOMContentLoaded", function() {
    const urlParams = new URLSearchParams(window.location.search);
    const teamId = urlParams.get("id_country");

    fetch(`http://localhost:5000/teams`)
        .then(response => response.json())
        .then(data => {
            const countrySelect = document.getElementById("country");
            data.Countries.forEach(country => {
                const option = document.createElement("option");
                option.value = country.id;
                option.textContent = country.country_name;
                if (country.id == id_country) {
                    option.selected = true;
                }
                countrySelect.appendChild(option);
            });
        })
        .catch(error => {
            console.error("Error fetching teams:", error);
        });
});