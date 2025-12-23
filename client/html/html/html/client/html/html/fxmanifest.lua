window.addEventListener('message', function(event) {
    let d = event.data;

    if (d.action === "startBoot") {
        // Boot Sequence Logic
        setTimeout(() => { 
            document.getElementById('boot-wrapper').style.display = 'none';
            speak("Welcome back, Adi. Systems active.", "startup.ogg");
        }, 4000);
    }

    if (d.action === "updateHUD") {
        document.getElementById('hp-fill').style.width = d.health + "%";
        document.getElementById('ar-fill').style.width = d.armor + "%";
        
        // Critical Health Warning
        if (d.health < 25) {
            document.getElementById('hp-fill').classList.add('low-hp-blink');
        }
    }

    if (d.action === "sonarActive") {
        // Show directional indicator
        showSonar(d.angle);
    }
});

function speak(text, sound) {
    document.getElementById('adi-assistant').style.display = 'block';
    document.getElementById('adi-msg').innerText = text.toUpperCase();
    // Play audio logic here
            }
            
