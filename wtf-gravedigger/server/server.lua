local RSGCore = exports['rsg-core']:GetCoreObject()

local function ShuffleLocations()
    local shuffledLocations = {}
    local locationCount = #Config.DiggingLocations

    for i = 1, locationCount do
        table.insert(shuffledLocations, Config.DiggingLocations[i])
    end

    for i = locationCount, 2, -1 do
        local j = math.random(i)
        shuffledLocations[i], shuffledLocations[j] = shuffledLocations[j], shuffledLocations[i]
    end

    return shuffledLocations
end

CreateThread(function()
    while true do
        Wait(Config.shuffleInterval)
        Config.DiggingLocations = ShuffleLocations()
        TriggerClientEvent('wtf-treasurehunter:updateLocations', -1, Config.DiggingLocations)
        
        if Config.SendResetMessage then
            TriggerClientEvent('chat:addMessage', -1, { args = { "System", Config.ResetMessage } })
        end

        print("Digging locations have been shuffled")
    end
end)

CreateThread(function()
    while true do
        local toSend = {}
        for k, v in pairs(Config.DiggingLocations) do
            if v.time > 0 and (v.time - Config.tickInterval) >= 0 then
                v.time = v.time - Config.tickInterval
            else
                if v.searched then
                    v.time = 0
                    v.searched = false
                    toSend[#toSend + 1] = v
                end
            end
        end

        if #toSend > 0 then
            TriggerClientEvent('wtf-treasurehunter:setSearchStatus', -1, toSend)
        end

        Wait(Config.tickInterval)
    end
end)

function ResetDiggingLocations()
    for _, location in pairs(Config.DiggingLocations) do
        location.searched = false
        location.time = 0
    end
    TriggerClientEvent('wtf-treasurehunter:setSearchStatus', -1, Config.DiggingLocations)
end

RSGCore.Functions.CreateCallback('wtf-treasurehunter:getATMStatus', function(source, cb)
    cb(Config.DiggingLocations)
end)

RegisterNetEvent('wtf-treasurehunter:found')
AddEventHandler('wtf-treasurehunter:found', function(currentSearch)
    local _source = source
    local Player = RSGCore.Functions.GetPlayer(_source)

    if Config.DiggingLocations[currentSearch] == nil then
        print("[ERROR] Invalid digging location index: " .. tostring(currentSearch))
        return
    end

    Config.DiggingLocations[currentSearch].searched = true
    Config.DiggingLocations[currentSearch].time = Config.resettime

    TriggerClientEvent('wtf-treasurehunter:setSearchStatus', -1, Config.DiggingLocations[currentSearch])

    if Player then
        local chance = math.random(1, 100)
        local rewardLevel = "good"

        if chance <= Config.RewardChances.good then
            rewardLevel = "good"
        elseif chance <= Config.RewardChances.good + Config.RewardChances.better then
            rewardLevel = "better"
        else
            rewardLevel = "best"
        end

   -- Decide on the reward type based on config settings
   local rewardType

   if Config.RewardType == "cash" then
       rewardType = "cash"
   elseif Config.RewardType == "item" then
       rewardType = "item"
   elseif Config.RewardType == "50_50" then
       rewardType = math.random(1, 2) == 1 and "cash" or "item"  -- 50% chance for cash or item
   end

   if rewardType == "cash" then  -- Cash reward
       local cashReward = math.random(Config.CashRewards[rewardLevel].min, Config.CashRewards[rewardLevel].max)
       Player.Functions.AddMoney("cash", cashReward)
       TriggerClientEvent('ox_lib:notify', _source, { title = "Congratulations!", description = "You found $" .. cashReward .. " in cash!", type = "success" })
   elseif rewardType == "item" then  -- Item reward
       local rewardItems = Config.RewardItems[rewardLevel]
       local rewardItem = rewardItems[math.random(#rewardItems)]
       Player.Functions.AddItem(rewardItem, 1)
       TriggerClientEvent('ox_lib:notify', _source, { title = "Congratulations!", description = "You found a " .. rewardItem:gsub("_", " ") .. "!", type = "success" })
   end
else
   print("[ERROR] Player not found for ID: " .. tostring(_source))
end
end)


--original functioning code below--- save for now
--[[
local RSGCore = exports['rsg-core']:GetCoreObject()

local function ShuffleLocations()
    local shuffledLocations = {}
    local locationCount = #Config.DiggingLocations

    for i = 1, locationCount do
        table.insert(shuffledLocations, Config.DiggingLocations[i])
    end

    for i = locationCount, 2, -1 do
        local j = math.random(i)
        shuffledLocations[i], shuffledLocations[j] = shuffledLocations[j], shuffledLocations[i]
    end

    return shuffledLocations
end

CreateThread(function()
    while true do
        Wait(Config.shuffleInterval)
        Config.DiggingLocations = ShuffleLocations()
        TriggerClientEvent('wtf-treasurehunter:updateLocations', -1, Config.DiggingLocations)
        --TriggerClientEvent('chat:addMessage', -1, { args = { "System", "Digging locations have been shuffled!" } }) -- use this if you want the client to be notified that the locations have been reset
        if Config.SendResetMessage then
            TriggerClientEvent('chat:addMessage', -1, { args = { "System", Config.ResetMessage } })
        end

        print("Digging locations have been shuffled")
    end
end)

CreateThread(function()
    while true do
        local toSend = {}
        for k, v in pairs(Config.DiggingLocations) do
            if v.time > 0 and (v.time - Config.tickInterval) >= 0 then
                v.time = v.time - Config.tickInterval
            else
                if v.searched then
                    v.time = 0
                    v.searched = false
                    toSend[#toSend + 1] = v
                end
            end
        end

        if #toSend > 0 then
            TriggerClientEvent('wtf-treasurehunter:setSearchStatus', -1, toSend)
        end

        Wait(Config.tickInterval)
    end
end)

function ResetDiggingLocations()
    for _, location in pairs(Config.DiggingLocations) do
        location.searched = false
        location.time = 0
    end
    TriggerClientEvent('wtf-treasurehunter:setSearchStatus', -1, Config.DiggingLocations)
end

RSGCore.Functions.CreateCallback('wtf-treasurehunter:getATMStatus', function(source, cb)
    cb(Config.DiggingLocations)
end)

RegisterNetEvent('wtf-treasurehunter:found')
AddEventHandler('wtf-treasurehunter:found', function(currentSearch)
    local _source = source
    local Player = RSGCore.Functions.GetPlayer(_source)

    if Config.DiggingLocations[currentSearch] == nil then
        print("[ERROR] Invalid digging location index: " .. tostring(currentSearch))
        return
    end

    Config.DiggingLocations[currentSearch].searched = true
    Config.DiggingLocations[currentSearch].time = Config.resettime

    TriggerClientEvent('wtf-treasurehunter:setSearchStatus', -1, Config.DiggingLocations[currentSearch])

    if Player then
        local chance = math.random(1, 100)
        local rewardLevel = "good"

        if chance <= Config.RewardChances.good then
            rewardLevel = "good"
        elseif chance <= Config.RewardChances.good + Config.RewardChances.better then
            rewardLevel = "better"
        else
            rewardLevel = "best"
        end

        local rewardItems = Config.RewardItems[rewardLevel]
        local rewardItem = rewardItems[math.random(#rewardItems)]

        Player.Functions.AddItem(rewardItem, 1)

        TriggerClientEvent('ox_lib:notify', _source, { title = "Congratulations!", description = "You found a " .. rewardItem:gsub("_", " ") .. "!", type = "success" })
    else
        print("[ERROR] Player not found for ID: " .. tostring(_source))
    end
end)
--]]