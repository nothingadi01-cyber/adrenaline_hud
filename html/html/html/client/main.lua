Citizen.CreateThread(function()
    local isLow = false
    while true do
        Citizen.Wait(500)
        local ped = PlayerPedId()
        if IsPedArmed(ped, 4) then -- If holding a gun
            local hash = GetSelectedPedWeapon(ped)
            local _, ammo = GetAmmoInClip(ped, hash)
            
            if ammo > 0 and ammo < 6 and not isLow then
                isLow = true
                SendNUIMessage({ action = "lowAmmo", toggle = true })
            elseif ammo > 5 and isLow then
                isLow = false
                SendNUIMessage({ action = "lowAmmo", toggle = false })
            end
        end
    end
end)
