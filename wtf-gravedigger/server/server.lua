local RSGCore = exports['rsg-core']:GetCoreObject()
lib.locale()

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
        if Config.Debug then
        print("Digging locations have been shuffled")
        end
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

  
   local rewardType

   if Config.RewardType == "cash" then
       rewardType = "cash"
   elseif Config.RewardType == "item" then
       rewardType = "item"
   elseif Config.RewardType == "50_50" then
       rewardType = math.random(1, 2) == 1 and "cash" or "item"  
   end

  
if rewardType == "cash" then
    -- Multiply by 100 to convert amounts to cents (avoiding decimals in math.random)
    local minReward = math.floor(Config.CashRewards[rewardLevel].min * 100)  
    local maxReward = math.floor(Config.CashRewards[rewardLevel].max * 100)

    -- Check that minReward and maxReward are valid
    if minReward > 0 and maxReward > 0 and minReward <= maxReward then
        -- Calculate the reward amount by dividing by 100 to revert to dollars
        local cashReward = math.random(minReward, maxReward) / 100

        Player.Functions.AddMoney("cash", cashReward)
        TriggerClientEvent('ox_lib:notify', _source, { 
            title = locale('sv_lang_1'), 
            description = locale('sv_lang_2') .. string.format("%.2f", cashReward) .. locale('sv_lang_3'), 
            type = "success" 
        })
    else
        print("[ERROR] Invalid reward range for reward level: " .. rewardLevel)
    end

   elseif rewardType == "item" then  
       local rewardItems = Config.RewardItems[rewardLevel]
       local rewardItem = rewardItems[math.random(#rewardItems)]
       Player.Functions.AddItem(rewardItem, 1)
       TriggerClientEvent('ox_lib:notify', _source, { title = locale('sv_lang_1'), description = locale('sv_lang_4') .. rewardItem:gsub("_", " ") .. "!", type = "success" })
   end
else
   print("[ERROR] Player not found for ID: " .. tostring(_source))
end
end)
