------------------ message --------------------------------------

local function sendNotification(message)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    DrawNotification(true, false)
end

RegisterCommand("message", function(source, args, rawCommand)
    if #args < 1 then
        sendNotification("~r~Vous devez préciser un message ! ")
        return
    end

    local final_Message = ""

    for k, v in pairs(args) do
        final_Message = final_Message .. v .. " "
    end

    sendNotification("Votre message est: ~g~" .. final_Message)
end, false)

------------------------------------------------ Health -------------------------------------------------

RegisterCommand("heal", function(source, args, rawCommand)
    local ped = PlayerPedId()

    sendNotification("~g~Vous avez été soigné !")

    local health = GetEntityHealth(ped)


    local finalHealth = health / 2.0

    SetEntityHealth(ped, finalHealth)
end, false)


RegisterCommand("kill", function(source, args, rawCommand)
    local ped = PlayerPedId()

    local health = GetEntityHealth(ped)
    sendNotification("~r~ Vous êtes mort ! ")
    local finalHealth = health / 2

    ApplyDamageToPed(ped, health / 2, false)

    health = GetEntityHealth(ped)
end, false)


RegisterCommand("vie", function(source, args, rawCommand)
    local ped = PlayerPedId()

    local health = GetEntityHealth(ped)
    sendNotification("~r~ Votre vie a été réduite de moitié")
    local finalHealth = health / 2

    ApplyDamageToPed(ped, 70, false)

    health = GetEntityHealth(ped)
end, false)


---------------------------------------------- Weapons -------------------------------------------------------

RegisterCommand("give_weapon", function(source, args, rawCommand)
    local ped = PlayerPedId()

    local weapon = "WEAPON_COMBATPISTOL"
    local weaponHash = GetHashKey(weapon)

    GiveWeaponToPed(ped, weaponHash, 100, false, true)
end, false)


RegisterCommand("remove_weapon", function(source, args, rawCommand)
    local ped = PlayerPedId()

    local weapon = "WEAPON_COMBATPISTOL"
    local weaponHash = GetHashKey(weapon)

    RemoveWeaponFromPed(ped, weaponHash)
end, false)
