function updateCountdown() {
    const now = new Date().getTime();
    const distance = startDate - now;

    const days = Math.floor(distance / (1000 * 60 * 60 * 24));
    const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    const seconds = Math.floor((distance % (1000 * 60)) / 1000);

    document.getElementById("days").innerHTML = days + "d";
    document.getElementById("hours").innerHTML = hours + "h";
    document.getElementById("minutes").innerHTML = minutes + "m";
    document.getElementById("seconds").innerHTML = seconds + "s";
}

// Actualizar el contador cada segundo
setInterval(updateCountdown, 1000);

// Fecha de inicio de la Copa América 2024 (año, mes (0-11), día)
const startDate = new Date(2024, 5, 20); // La fecha es el 20 de junio de 2024