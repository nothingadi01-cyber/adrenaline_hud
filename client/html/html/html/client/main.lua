-- ADRENALINE HUD by Adi
local isAdmin = true -- Set via permissions later
local currentXP = 0

-- 1. THE CORE LOOP (Vitals & Telemetry)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(200)
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)
        
        local data = {
            action = "updateHUD",
            health = GetEntityHealth(ped) - 100,
            armor = GetPedArmour(ped),
            stamina = 100 - GetPlayerSprintStaminaRemaining(PlayerId()),
            stress = 15 -- Replace with your stress export
        }

        if vehicle ~= 0 then
            data.inVehicle = true
            data.speed = math.ceil(GetEntitySpeed(vehicle) * 3.6) -- KMH
            data.fuel = GetVehicleFuelLevel(vehicle)
        end
        SendNUIMessage(data)
    end
end)

-- 2. A.D.I. ASSISTANT & BOOT
AddEventHandler('onClientResourceStart', function(res)
    if GetCurrentResourceName() == res then
        SendNUIMessage({ 
            action = "startBoot", 
            author = "Adi",
            system = "A.D.I. v1.5"
        })
    end
end)

-- 3. PREMIUM SONAR (Sound Detection)
RegisterNetEvent('hud:detectSound')
AddEventHandler('hud:detectSound', function(angle)
    SendNUIMessage({ action = "sonarActive", angle = angle })
end)

-- 4. XP & KILLSTREAK EXPORTS
exports('AddXP', function(amount)
    currentXP = currentXP + amount
    SendNUIMessage({ action = "updateXP", xp = currentXP })
end)
