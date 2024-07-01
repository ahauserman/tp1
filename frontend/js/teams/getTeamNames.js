//document.addEventListener("DOMContentLoaded", function() {
//const urlParams = new URLSearchParams(window.location.search);
/*const id_country = urlParams.get("id");*/

function getTeamNames(defaultCountryId) {
    fetch(`http://localhost:5000/teams`)
        .then(response => response.json())
        .then(data => {
            const countrySelect = document.getElementById("country");
            data.Countries.forEach(country => {
                const option = document.createElement("option");
                option.value = country.id_country;
                option.textContent = country.country_name;
                countrySelect.appendChild(option);
            });
            countrySelect.value = defaultCountryId;
        })
        .catch(error => {
            console.error("Error fetching countries:", error);
        });
}

