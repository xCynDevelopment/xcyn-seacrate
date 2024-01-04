local QBCore = exports['qb-core']:GetCoreObject()


local function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(50)
    end
end







local function CreateBoltCutter(prop, ped)
    cutteritem = CreateObject(GetHashKey(prop), GetEntityCoords(ped), true, true, true)
    local networkId = ObjToNet(cuffitem)
    SetNetworkIdExistsOnAllMachines(networkId, true)
    SetNetworkIdCanMigrate(networkId, false)
    NetworkSetNetworkIdDynamic(networkId, true)
end

RegisterNetEvent('xcyn:client:cuttercheck')
AddEventHandler('xcyn:client:cuttercheck', function(data)
    TriggerServerEvent('xcyn:server:cuttercheck')
end)


RegisterNetEvent('xcyn:client:robcrate')
AddEventHandler('xcyn:client:robcrate', function(data)
	local luck = math.random(1, 100)
	if luck <= 25 then
        TriggerEvent('xcyn:client:robcrate1')
    elseif luck <= 50 then
        TriggerEvent('xcyn:client:robcrate2')
    elseif luck <= 75 then
        TriggerEvent('xcyn:client:robcrate3')
    elseif luck <= 100 then
        TriggerEvent('xcyn:client:robcrate4')
    end
end)


function AttachBoltCutter(prop)
    local cutteritem = CreateObject(GetHashKey(prop), 0.0, 0.0, 0.0, true, true, true)
    AttachEntityToEntity(cutteritem, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 28422), -0.03, 0.0, 0.0, 0.0, -90.0, 0.0, true, true, false, true, 1, true)
    return cutteritem
end

function RobCrate(event, serverEvent, prop)
    local cutteritem = AttachBoltCutter(prop)
    local chance = math.random(1, 100)
    

    QBCore.Functions.Progressbar('name', 'Cutting Open Container', 6000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'anim@scripted@heist@ig4_bolt_cutters@male@',
        anim = 'action_male',
        flags = 16,
    }, {}, {}, function()
        DeleteEntity(cutteritem)
    end, function()
        QBCore.Functions.Notify("Canceled", "error")
        DeleteEntity(cutteritem)
    end)

   


    Wait(7000)

    if chance >= 75 then
        exports['ps-dispatch']:SuspiciousActivity()
    end

	TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)


    QBCore.Functions.Progressbar('name', 'Searching Container', 15000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {

    }, {}, {}, function()
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent(serverEvent)
    end, function()

        QBCore.Functions.Notify("Canceled", "error")
        DeleteEntity(cutteritem)
    end)
end

RegisterNetEvent('xcyn:client:robcrate1')
AddEventHandler('xcyn:client:robcrate1', function(data)
    RobCrate('xcyn:client:robcrate1', 'xcyn:server:robcrate1', "h4_prop_h4_bolt_cutter_01a")
    Wait(15500)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["stolenmicro"], "add", 2)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["stolencoffee"], "add", 3)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["pistol_ammo"], "add", 12)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["advancedlockpick"], "add", 10)
end)

RegisterNetEvent('xcyn:client:robcrate2')
AddEventHandler('xcyn:client:robcrate2', function(data)
    RobCrate('xcyn:client:robcrate2', 'xcyn:server:robcrate2', "h4_prop_h4_bolt_cutter_01a")
    Wait(15500)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["radio"], "add", 3)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["iphone"], "add", 5)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["10kgoldchain"], "add", 4)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["samsungphone"], "add", 4)
end)

RegisterNetEvent('xcyn:client:robcrate3')
AddEventHandler('xcyn:client:robcrate3', function(data)
    RobCrate('xcyn:client:robcrate3', 'xcyn:server:robcrate3', "h4_prop_h4_bolt_cutter_01a")
    Wait(15500)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["stolenart"], "add", 6)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["boostingtablet"], "add", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["stolentv"], "add", 4)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["laptop_green"], "add", 1)
end)

RegisterNetEvent('xcyn:client:robcrate4')
AddEventHandler('xcyn:client:robcrate4', function(data)
    RobCrate('xcyn:client:robcrate4', 'xcyn:server:robcrate4', "h4_prop_h4_bolt_cutter_01a")
    Wait(15500)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["weapon_heavypistol"], "add", 3)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["weapon_pistol"], "add", 3)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["pistol_ammo"], "add", 50)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["weapon_pistolxm3"], "add", 4)
end)