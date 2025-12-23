window.addEventListener('message', function(event) {
    let data = event.data;

    if (data.action === "startBoot") {
        document.getElementById('boot-screen').style.display = 'flex';
        setTimeout(() => {
            document.getElementById('boot-screen').style.opacity = '0';
        }, 3000);
    }

    if (data.action === "updateVitals") {
        document.getElementById('health-fill').style.width = data.health + "%";
    }
});
