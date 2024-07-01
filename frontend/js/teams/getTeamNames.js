//document.addEventListener("DOMContentLoaded", function() {
//const urlParams = new URLSearchParams(window.location.search);
/*const id_country = urlParams.get("id");*/

function getTeamNames(){
    
    fetch(`http://localhost:5000/teams`)
        .then(response => response.json())
        .then(data => {
            const countrySelect = document.getElementById("country");
            data.Countries.forEach(country => {
                const option = document.createElement("option");
                option.value = country.id_country;
                option.textContent = country.country_name;
                /*if (country.id_country == id_country) {
                    option.selected = true;
                }*/
                countrySelect.appendChild(option);
            });
            console.log("termine de cargar los paises")
        })
        .catch(error => {
            console.error("Error fetching countries:", error);
        });
    }
//});