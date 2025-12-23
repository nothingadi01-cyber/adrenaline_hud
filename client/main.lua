-- ADRENALINE HUD by Adi
local isLoaded = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(200) -- Performance Opti
        local ped = PlayerPedId()
        local health = GetEntityHealth(ped) - 100
        local armor = GetPedArmour(ped)
        
        SendNUIMessage({
            action = "updateVitals",
            health = health,
            armor = armor,
            stress = 10 -- Example value
        })
    end
end)

-- Boot Sequence Trigger
AddEventHandler('onClientResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        SendNUIMessage({ action = "startBoot", author = Config.Author })
    end
end)
