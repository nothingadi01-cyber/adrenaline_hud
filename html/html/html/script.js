// Function to update Crew Vitals
function updateCrew(crewData) {
    const container = document.getElementById('crew-list');
    container.innerHTML = ''; // Clear old data

    crewData.forEach(member => {
        container.innerHTML += `
            <div class="crew-card">
                <div class="crew-name">${member.name.toUpperCase()}</div>
                <div class="crew-hp"><div class="crew-hp-fill" style="width:${member.hp}%"></div></div>
            </div>
        `;
    });
}

// Listener for Reload and Crew
window.addEventListener('message', function(event) {
    let d = event.data;

    if (d.action === "lowAmmo") {
        const warn = document.getElementById('reload-warning');
        warn.style.display = d.toggle ? 'block' : 'none';
        if (d.toggle) { speak("Magazine low. Swap."); }
    }

    if (d.action === "updateCrew") {
        updateCrew(d.members);
    }
});
