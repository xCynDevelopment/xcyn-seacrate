local QBCore = exports['qb-core']:GetCoreObject()




local cooldowns = {}

RegisterNetEvent('xcyn:server:cuttercheck', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cutters = Player.Functions.GetItemByName("bolt_cutter")

    -- Check if the player is on cooldown
    local cooldown = cooldowns[src]
    if cooldown and (os.time() - cooldown) < 300 then
        TriggerClientEvent('QBCore:Notify', src, 'You must wait before robbing another crate.', 'error')
        return
    end

    if cutters ~= nil then
        TriggerClientEvent('xcyn:client:robcrate', src)

        -- Set the cooldown for the player
        cooldowns[src] = os.time()
    else
        TriggerClientEvent('QBCore:Notify', src, 'You need Bolt Cutters', 'error')
    end
end)


RegisterNetEvent('xcyn:server:robcrate1', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cutters = Player.Functions.GetItemByName("bolt_cutter")
    
 
    if cutters ~= nil then  
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)

        Player.Functions.AddItem('stolenmicro', 2)
        Player.Functions.AddItem('stolencoffee', 3)
        Player.Functions.AddItem('pistol_ammo', 12)
        Player.Functions.AddItem('advancedlockpick', 10)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You need Bolt Cutters', 'error')
    end
    
end)

RegisterNetEvent('xcyn:server:robcrate2', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cutters = Player.Functions.GetItemByName("bolt_cutter")
    
 
    if cutters ~= nil then  
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        
        Player.Functions.AddItem('radio', 3)
        Player.Functions.AddItem('iphone', 5)
        Player.Functions.AddItem('10kgoldchain', 4)
        Player.Functions.AddItem('samsungphone', 4)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You need Bolt Cutters', 'error')
    end
    
end)

RegisterNetEvent('xcyn:server:robcrate3', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cutters = Player.Functions.GetItemByName("bolt_cutter")
    
 
    if cutters ~= nil then  
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        
        Player.Functions.AddItem('stolentv', 4)
        Player.Functions.AddItem('stolenart', 6)
        Player.Functions.AddItem('boostingtablet', 1)
        Player.Functions.AddItem('laptop_green', 1)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You need Bolt Cutters', 'error')
    end
    
end)

RegisterNetEvent('xcyn:server:robcrate4', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cutters = Player.Functions.GetItemByName("bolt_cutter")
    
 
    if cutters ~= nil then  
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        
        Player.Functions.AddItem('weapon_heavypistol', 3)
        Player.Functions.AddItem('weapon_pistol', 3)
        Player.Functions.AddItem('pistol_ammo', 50)
        Player.Functions.AddItem('weapon_pistolxm3', 4)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You need Bolt Cutters', 'error')
    end
    
end)

