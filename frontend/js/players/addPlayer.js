$(document).ready(function () {
    $.ajax({
        url: 'http://localhost:5000/teams',
        method: 'GET',
        success: function (data) {
            console.log(data);

            let countryDropdown = $('#country');
            data.Countries.forEach(function (team) {
                let option = $('<option></option>').attr('value', team.id).text(team.country_name);
                countryDropdown.append(option);
            });

            // Set default selected country to the team ID received as parameter
            const urlParams = new URLSearchParams(window.location.search);
            const teamId = urlParams.get('id_country');
            if (teamId) {
                countryDropdown.val(teamId);
            }

        },
        error: function (error) {
            console.error('Error fetching teams:', error);
        }
    });

    // Handle form submission
    $('#addPlayerForm').submit(function (event) {
        event.preventDefault();
        let formData = {
            player_name: $('#playerName').val(),
            photo: $('#photo').val(),
            team: $('#team').val(),
            position: $('#position').val(),
            country: $('#country').val()
        };

        $.ajax({
            url: 'http://localhost:8000/players/create_player',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(formData),
            success: function (response) {
                alert('Player added successfully!');
                window.location.href = '/'; // Redirige a la página principal u otra página si es necesario
            },
            error: function (error) {
                alert('Error adding player: ' + error.responseJSON.message);
            }
        });
    });
});