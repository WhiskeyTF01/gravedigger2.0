local RSGCore = exports['rsg-core']:GetCoreObject()
local isDigging = false
local shovelObject = nil
local createdObjects = {}
local targetZones = {}

CreateThread(function()
    Wait(1000)
    setupSearches() -- Initializes search locations
    SetupDiggingLocations() -- Ensure it's called at the start
    while true do
        local ped = PlayerPedId()
        local playerPos = GetEntityCoords(ped)
        local isInRange = false
        for locationIndex, locationData in pairs(Config.DiggingLocations) do
            local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, locationData.coord.x, locationData.coord.y, locationData.coord.z)
            if distance <= 3.0 and locationData.searched then
                isInRange = true
            end
        end
        if not isInRange then
            Wait(5000) -- Longer wait if not in range
        end
        Wait(3) -- Frequent checks
    end
end)

function StartDiggingAnimation(location)
    local ped = PlayerPedId()
    local playerPos = GetEntityCoords(ped)

    for locationIndex, locationData in pairs(Config.DiggingLocations) do
        local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, locationData.coord.x, locationData.coord.y, locationData.coord.z)
        if distance <= 3.0 then
            if not locationData.searched then
                Wait(10)
                currentSearch = locationIndex
                local waitDuration = math.random(Config.WaitDurationMin, Config.WaitDurationMax)
                local dirtModel = 'mp005_p_dirtpile_tall_unburied'

                RequestModel(dirtModel)
                while not HasModelLoaded(dirtModel) do
                    Wait(1)
                end

                RequestAnimDict("amb_work@world_human_gravedig@working@male_b@base")
                while not HasAnimDictLoaded("amb_work@world_human_gravedig@working@male_b@base") do
                    Wait(100)
                end

                local boneIndex = GetEntityBoneIndexByName(ped, "SKEL_R_Hand")
                shovelObject = CreateObject(GetHashKey("p_shovel02x"), playerPos, true, true, true)
                SetCurrentPedWeapon(ped, WEAPON_UNARMED, true)
                AttachEntityToEntity(shovelObject, ped, boneIndex, 0.0, -0.19, -0.089, 274.1899, 483.89, 378.40, true, true, false, true, 1, true)

                FreezeEntityPosition(ped, true)
                TaskPlayAnim(ped, "amb_work@world_human_gravedig@working@male_b@base", "base", 3.0, 3.0, -1, 1, 0, false, false, false)

                -- Display the progress bar for digging
                if Config.UseProgressBar then
                    lib.progressBar({
                        duration = waitDuration,
                        position = 'bottom',
                        useWhileDead = false,
                        canCancel = false,
                        disableControl = true,
                        disable = {
                            move = true,
                            mouse = true,
                        },
                        label = "Digging...",
                    })
                else
                    Wait(waitDuration) -- If progress bar is disabled, just wait
                end

                local playerCoords = GetEntityCoords(ped)
                local forwardVector = GetEntityForwardVector(ped)
                local offsetX = 0.6

                local objectX = playerCoords.x + forwardVector.x * offsetX
                local objectY = playerCoords.y + forwardVector.y * offsetX
                local objectZ = playerCoords.z - 1

                local dirtObject = CreateObject(dirtModel, objectX, objectY, objectZ, true, true, false)
                table.insert(createdObjects, dirtObject)

                ClearPedTasks(ped)
                FreezeEntityPosition(ped, false)
                DeleteObject(shovelObject)
                shovelObject = nil

                Config.DiggingLocations[locationIndex].searched = true
                TriggerServerEvent('wtf-treasurehunter:found', currentSearch)
                return
            else
                lib.notify({ title = 'This has already been searched', type = 'inform', duration = 7000 })
                return
            end
        end
    end

    lib.notify({ title = 'You are too far away to dig', type = 'inform', duration = 7000 })
end

function SetupDiggingLocations()
    local groupedLocations = GroupLocationsByName(Config.DiggingLocations)

    -- Remove existing target zones before creating new ones
    for _, zone in pairs(targetZones) do
        exports['rsg-target']:RemoveZone(zone)
    end
    targetZones = {}

    for locationName, locationsList in pairs(groupedLocations) do
        local selectedCoords = GetRandomCoords(locationsList, Config.NumberOfLocations)

        for i, locationData in ipairs(selectedCoords) do
            local coord = locationData.coord
            local zoneName = locationName .. '_' .. i
            exports['rsg-target']:AddCircleZone(zoneName, coord, 1.0, {
                name = zoneName,
                debugPoly = false,
            }, {
                options = {
                    {
                        event = 'digging:startDigging',
                        icon = 'fas fa-hand',
                        label = 'Start Digging',
                        location = locationData,
                        coord = coord
                    },
                },
                distance = 2.0
            })
            table.insert(targetZones, zoneName)
        end
    end
end

function GroupLocationsByName(locations)
    local groupedLocations = {}
    for _, locationData in pairs(locations) do
        if not groupedLocations[locationData.name] then
            groupedLocations[locationData.name] = {}
        end
        table.insert(groupedLocations[locationData.name], locationData)
    end
    return groupedLocations
end

function GetRandomCoords(coordsList, count)
    local tempCoords = {table.unpack(coordsList)}
    local randomCoords = {}

    for i = 1, math.min(count, #tempCoords) do
        local randomIndex = math.random(#tempCoords)
        table.insert(randomCoords, tempCoords[randomIndex])
        table.remove(tempCoords, randomIndex)
    end

    return randomCoords
end

RegisterNetEvent('digging:startDigging')
AddEventHandler('digging:startDigging', function(data)
    if isDigging then return end
    StartDiggingAnimation(data.location)
end)

RegisterNetEvent('wtf-treasurehunter:setSearchStatus', function(DiggingLocations)
    for locationIndex, locationData in pairs(DiggingLocations) do
        if Config.DiggingLocations[locationIndex] then
            Config.DiggingLocations[locationIndex].searched = locationData.searched
        end
    end
end)

RegisterNetEvent('wtf-treasurehunter:updateLocations', function(newLocations)
    Config.DiggingLocations = newLocations
    SetupDiggingLocations() -- Refresh the target zones with new locations
end)

function setupSearches()
    RSGCore.Functions.TriggerCallback('wtf-treasurehunter:getATMStatus', function(DiggingLocations)
        if DiggingLocations then
            for locationIndex, locationData in pairs(DiggingLocations) do
                if Config.DiggingLocations[locationIndex] then
                    Config.DiggingLocations[locationIndex].searched = locationData.searched
                end
            end
        else
            print("[ERROR] No digging locations received from the server.")
        end
    end)
end

CreateThread(function()
    setupSearches()
end)
