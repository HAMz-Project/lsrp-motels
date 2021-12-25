Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local ESX = nil
local myMotel = {}
local curMotel = nil
local curRoom = nil
local curRoomOwner = false
local inRoom = false
local roomOwner = nil
local playerIdent = nil
local inMotel = false

CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Wait(0)
	end
	while ESX.GetPlayerData().job == nil do
		Wait(10)
	end
	ESX.PlayerData = ESX.GetPlayerData()
    createBlips()
    playerIdent = ESX.GetPlayerData().identifier
end)

DrawText3D = function(x, y, z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords()) 
	local scale = 0.45
	if onScreen then
		SetTextScale(scale, scale)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextOutline()
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 370
        DrawRect(_x, _y + 0.0150, 0.030 + factor , 0.030, 66, 66, 66, 150)
	end
end

has_value = function(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

loadAnimDict = function(dict)
    while ( not HasAnimDictLoaded(dict) ) do
        RequestAnimDict(dict)
        Wait(5)
    end
end 

openHouseAnim = function()
    loadAnimDict("anim@heists@keycard@") 
    TaskPlayAnim(PlayerPedId(), "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0 )
    Wait(400)
    ClearPedTasks(PlayerPedId())
end

function createBlips()
    for k,v in pairs(Config.Zones) do
        local blip = AddBlipForCoord(tonumber(v.Pos.x), tonumber(v.Pos.y), tonumber(v.Pos.z))
        SetBlipSprite(blip, v.Pos.sprite)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, v.Pos.size)
        SetBlipColour(blip, v.Pos.color)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Penginapan - " .. v.Name)
        EndTextCommandSetBlipName(blip)
    end
end

function getMyMotel()
    ESX.TriggerServerCallback('lsrp-motels:checkOwnership', function(owned)
        myMotel = owned
    end)
end

RegisterNetEvent('instance:onCreate')
AddEventHandler('instance:onCreate', function(instance)
    if instance.type == 'motelroom' then
        roomOwner = ESX.GetPlayerData().identifier
		TriggerEvent('instance:enter', instance)
	end
end)

RegisterNetEvent('lsrp-motels:cancelRental')
AddEventHandler('lsrp-motels:cancelRental', function(room)
    local motelName = nil
    local motelRoom = nil
    for k,v in pairs(Config.Zones) do
        for kk,vm in pairs(v.Rooms) do       
            if room == vm.instancename then
                motelName = v.Name
                motelRoom = vm.number
            end
        end
    end

    local player = PlayerPedId()
    if ( DoesEntityExist(player) and not IsEntityDead(player)) then
        loadAnimDict('missheistdockssetup1clipboard@idle_a')
        TaskPlayAnim(player, 'missheistdockssetup1clipboard@idle_a', 'idle_a', 3.0, 1.0, -1, 1, 0, 0, 0, 0)
    end

    local model = 'prop_notepad_01'
    RequestModel(model)
    while not HasModelLoaded(GetHashKey(model)) do
        Wait(0)
    end

    local pCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, 0.0)
    local modelSpawn = CreateObject(GetHashKey(model), pCoords.x, pCoords.y, pCoords.z, true, true, true)

    local netid = ObjToNet(modelSpawn)
    SetNetworkIdExistsOnAllMachines(netid, true)
    NetworkSetNetworkIdDynamic(netid, true)
    SetNetworkIdCanMigrate(netid, false)

    AttachEntityToEntity(modelSpawn, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
    exports['progressBars']:startUI(2000, "MEMBATALKAN SEWA KAMAR")
    Wait(2000)
    TriggerServerEvent("lsrp-motels:cancelRental", room)

    ClearPedTasks(player)
    DetachEntity(NetToObj(netid), 1, 1)
    DeleteEntity(NetToObj(netid))
end)

function PlayerDressings()
    openHouseAnim()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'room',
	{
		title    = 'Player Clothing',
		align    = 'top',
		elements = {
            {label = _U('player_clothes'), value = 'player_dressing'},
	        {label = _U('remove_cloth'), value = 'remove_cloth'}
        }
	}, function(data, menu)

		if data.current.value == 'player_dressing' then 
            menu.close()
			ESX.TriggerServerCallback('lsrp-motels:getPlayerDressing', function(dressing)
				elements = {}

				for i=1, #dressing, 1 do
					table.insert(elements, {
						label = dressing[i],
						value = i
					})
				end

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing',
				{
					title    = _U('player_clothes'),
					align    = 'top',
					elements = elements
				}, function(data2, menu2)
					TriggerEvent('skinchanger:getSkin', function(skin)
						ESX.TriggerServerCallback('lsrp-motels:getPlayerOutfit', function(clothes)
							TriggerEvent('skinchanger:loadClothes', skin, clothes)
							TriggerEvent('esx_skin:setLastSkin', skin)

							TriggerEvent('skinchanger:getSkin', function(skin)
								TriggerServerEvent('esx_skin:save', skin)
							end)
						end, data2.current.value)
					end)

				end, function(data2, menu2)
					menu2.close()
				end)
			end)

		elseif data.current.value == 'remove_cloth' then
            menu.close()
			ESX.TriggerServerCallback('lsrp-motels:getPlayerDressing', function(dressing)
				elements = {}

				for i=1, #dressing, 1 do
					table.insert(elements, {
						label = dressing[i],
						value = i
					})
				end

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'remove_cloth', {
					title    = _U('remove_cloth'),
					align    = 'top',
					elements = elements
				}, function(data2, menu2)
					menu2.close()
					TriggerServerEvent('lsrp-motels:removeOutfit', data2.current.value)
                    exports['mythic_notify']:SendAlert('inform', _U('removed_cloth'))
				end, function(data2, menu2)
					menu2.close()
				end)
			end)

		end

	end, function(data, menu)
        menu.close()
	end)
end

RegisterNetEvent('instance:onEnter')
AddEventHandler('instance:onEnter', function(instance)
    if instance.type == 'motelroom' then
        local property = instance.data.property
        local motel = instance.data.motel
        local isHost   = GetPlayerFromServerId(instance.host) == PlayerId()
            Wait(1000)
        local networkChannel = instance.data.vid
        NetworkSetVoiceChannel(networkChannel)
	end
end)

RegisterNetEvent('instance:onPlayerLeft')
AddEventHandler('instance:onPlayerLeft', function(instance, player)
	if player == instance.host then
		TriggerEvent('instance:leave')
	end
end)

AddEventHandler('instance:loaded', function()
    TriggerEvent('instance:registerType', 'motelroom', function(instance)
        EnterProperty(instance.data.motel, instance.data.room)
    end, function(instance)
		ExitProperty(instance.data.room)
	end)
end)

function EnterProperty(motel, room)
    curMotel      = motel
    curRoom       = room
    inRoom        = true
    inMotel       = true
    local playerPed     = PlayerPedId() 
    TriggerServerEvent('lsrp-motels:SaveMotel', curMotel, curRoom)
    CreateThread(function()
		DoScreenFadeOut(800)
		while not IsScreenFadedOut() do
			Wait(0)
        end
        for k,v in pairs(Config.Zones) do
            for kk,vm in pairs(v.Rooms) do       
                if curRoom == vm.instancename then
                    SetEntityCoords(playerPed, vm.roomLoc.x, vm.roomLoc.y, vm.roomLoc.z)
                end
            end
        end
		DoScreenFadeIn(800)
	end)
end

RegisterNetEvent('lsrp-motels:enterRoom')
AddEventHandler('lsrp-motels:enterRoom', function(room, motel)
    --TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.1)
    openHouseAnim()
    local roomID = nil
    local playerPed = PlayerPedId()
    local roomIdent = room
    local reqmotel = motel
    ESX.TriggerServerCallback('lsrp-motels:getMotelRoomID', function(roomno)
        roomID = roomno
    end, room)
    Wait(500)
    if roomID ~= nil then
        local instanceid = 'motel'..roomID..''..roomIdent
        TriggerEvent('instance:create', 'motelroom', {property = instanceid, owner = ESX.GetPlayerData().identifier, motel = reqmotel, room = roomIdent, vid = roomID})
        --TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_close", 0.1)
    end
end)

RegisterNetEvent('lsrp-motels:exitRoom')
AddEventHandler('lsrp-motels:exitRoom', function(motel, room)
    --TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.1)
    openHouseAnim()
    local roomID = room
    local playerPed = PlayerPedId()
    Wait(500)
    roomOwner = nil
    TriggerEvent('instance:leave')
    --TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_close", 0.1)
end)

RegisterNetEvent('lsrp-motels:roomOptions')
AddEventHandler('lsrp-motels:roomOptions', function(room, motel)
    local motelName = nil
    local motelRoom = nil
    for k,v in pairs(Config.Zones) do
        for kk,vm in pairs(v.Rooms) do       
            if room == vm.instancename then
                motelName = v.Name
                motelRoom = vm.number
            end
        end
    end
    
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'lsrp-motels',
        {
            title    = motelName..' Room '..motelRoom,
            align    = 'top',
            elements = { 
                { label = 'Masuk Kamar', value = 'enter' },
                { label = 'Berhenti Sewa', value = 'cancel' }
            }
        },
    function(data, entry)
        local value = data.current.value

        if value == 'enter' then
            entry.close()
            TriggerEvent("lsrp-motels:enterRoom", room, motel)
        elseif value == 'cancel' then
            entry.close()
            TriggerEvent("lsrp-motels:cancelRental", room)
        end
    end,
    function(data, entry)
        entry.close()
    end)
end)


RegisterNetEvent('lsrp-motels:roomMenu')
AddEventHandler('lsrp-motels:roomMenu', function(room, motel)
    openHouseAnim()
    local motelName = nil
    local motelRoom = nil
    local roomID = nil
    local owner = ESX.GetPlayerData().identifier
    for k,v in pairs(Config.Zones) do
        for kk,vm in pairs(v.Rooms) do       
            if room == vm.instancename then
                motelName = v.Name
                motelRoom = vm.number
            end
        end
    end
   
    options = {}
    if roomOwner == playerIdent then
        table.insert(options, {label = 'Buka Inventory', value = 'inventory'})
        table.insert(options, {label = 'Undang Seseorang', value = 'inviteplayer'})
        table.insert(options, {label = 'Keluar Kamar', value = 'leaveroom'})
    end
        
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'lsrp-motels',
        {
            title    = motelName..' Room '..motelRoom,
            align    = 'top',
            elements = options
        },
    function(data, menu)
        local value = data.current.value
        if value == 'leaveroom' then
            menu.close()
            TriggerEvent('lsrp-motels:exitRoom', curMotel, curRoom)
        elseif value == 'inventory' then
            menu.close()

            owner = ESX.GetPlayerData().identifier
            if roomOwner == owner then
                --TriggerServerEvent("InteractSound_SV:PlayOnSource", "StashOpen", 1.0)
                openHouseAnim()
                local motelN = string.lower(motelName)
                OpenPropertyInventoryMenu(motelN, owner)
            else
                exports['mythic_notify']:SendAlert('error', 'Akses hanya untuk penyewa')
            end
        elseif value == 'inviteplayer' then
            local myInstance = nil
            local roomIdent = room
            local reqmotel = motel
            
            for k,v in pairs(Config.Zones) do
                for kk,vm in pairs(v.Rooms) do       
                    if room == vm.instancename then
                        playersInArea = ESX.Game.GetPlayersInArea(vm.entry, 5.0)
                    end
                end
            end
             
			local elements      = {}
            if playersInArea ~= nil then
                for i=1, #playersInArea, 1 do
                    if playersInArea[i] ~= PlayerId() then
                        table.insert(elements, {label = GetPlayerName(playersInArea[i]), value = playersInArea[i]})
                    end
                end
            else
                exports['mythic_notify']:SendAlert('inform', _U('no_players'))
            end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'room_invite',
			{
				title    = motelName..' Kamar '..motelRoom .. ' - ' .. _U('invite'),
				align    = 'top',
				elements = elements,
            }, function(data2, menu2)
                myInstance = 'motel'..motelRoom..''..roomIdent
				TriggerEvent('instance:invite', 'motelroom', GetPlayerServerId(data2.current.value), {property = myInstance, owner = ESX.GetPlayerData().identifier, motel = reqmotel, room = roomIdent, vid = roomID})
                exports['mythic_notify']:SendAlert('inform', _U('you_invited', GetPlayerName(data2.current.value)))
			end, function(data2, menu2)
				menu2.close()
			end)
        end
    end,
    function(data, menu)
        menu.close()
    end)
end)

RegisterNetEvent('lsrp-motels:rentRoom')
AddEventHandler('lsrp-motels:rentRoom', function(room)
    ESX.TriggerServerCallback('lsrp-motels:checkOwnerCount', function(count)
        for k,v in pairs(Config.Zones) do
            for kk,vm in pairs(v.Rooms) do       
                if room == vm.instancename then
                    motelName = v.Name
                    motelRoom = vm.number
                end
            end
        end
        local elements = {}
        if count < Config.MaxSlot then
            table.insert(elements, { label = 'Sewa Kamar ($'..Config.PriceRental..'/bulan)', value = 'rent' })
        else
            table.insert(elements, { label = 'KAMAR SUDAH PENUH'})
        end
        ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'lsrp-motels',
        {
            title    = motelName..' Room '..motelRoom,
            align    = 'top',
            elements = elements
        },
        function(data, entry)
            local value = data.current.value

            if value == 'rent' then
                entry.close()
                isRent = true
                local motelName = nil
                local motelRoom = nil
                ESX.TriggerServerCallback('lsrp-motels:checkOwnerCount', function(count2)
                    if count2 < Config.MaxSlot then
                        local player = PlayerPedId()
                        if ( DoesEntityExist(player) and not IsEntityDead(player)) then
                            loadAnimDict('missheistdockssetup1clipboard@idle_a')
                            TaskPlayAnim(player, 'missheistdockssetup1clipboard@idle_a', 'idle_a', 3.0, 1.0, -1, 1, 0, 0, 0, 0)
                        end

                        local model = 'prop_notepad_01'
                        RequestModel(model)
                        while not HasModelLoaded(GetHashKey(model)) do
                            Wait(0)
                        end

                        local pCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, 0.0)
                        local modelSpawn = CreateObject(GetHashKey(model), pCoords.x, pCoords.y, pCoords.z, true, true, true)

                        local netid = ObjToNet(modelSpawn)
                        SetNetworkIdExistsOnAllMachines(netid, true)
                        NetworkSetNetworkIdDynamic(netid, true)
                        SetNetworkIdCanMigrate(netid, false)

                        AttachEntityToEntity(modelSpawn, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
                        exports['progressBars']:startUI(2000, "MENYEWA KAMAR")
                        Wait(2000)
                        TriggerServerEvent('lsrp-motels:rentRoom', room)

                        ClearPedTasks(player)
                        DetachEntity(NetToObj(netid), 1, 1)
                        DeleteEntity(NetToObj(netid))
                        
                        isRent = false
                    else
                        exports['mythic_notify']:SendAlert('inform', 'Kamar sudah penuh')
                    end
                end, room)
            end
        end,
        function(data, entry)
            entry.close()
        end)
    end, room)
end)

function roomMarkers()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local canSleep  = true
    
    for k,v in pairs(Config.Zones) do
        for kk,vm in pairs(v.Rooms) do 
            if curRoom == vm.instancename then
                distance = GetDistanceBetweenCoords(coords, vm.roomExit.x, vm.roomExit.y, vm.roomExit.z, true)
                if distance < 1.0 then
                    canSleep = false
                    DrawMarker(2, vm.roomExit.x, vm.roomExit.y, vm.roomExit.z + -0.11, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.2, 0, 255, 0, 255, 1, 0, 0, 1, 0, 0, 0)
                    if IsControlJustReleased(0, Keys['E']) then
                        TriggerEvent('lsrp-motels:exitRoom', curRoom, curMotel)
                    end
                end
            end
        end
    end

    -- Room Menu Marker
    for k,v in pairs(Config.Zones) do
        for kk,vm in pairs(v.Rooms) do 
            if curRoom == vm.instancename then
                distance = GetDistanceBetweenCoords(coords, vm.Menu.x, vm.Menu.y, vm.Menu.z, true)
                if distance < 1.0 then
                    canSleep = false
                    DrawText3D(vm.Menu.x, vm.Menu.y, vm.Menu.z + 0.35, 'Tekan [~g~E~s~] untuk membuka menu')
                    if IsControlJustReleased(0, Keys['E']) then
                        TriggerEvent('lsrp-motels:roomMenu', curRoom, curMotel)
                    end
                end
            end
        end
    end

    -- Clothing Menu
    for k,v in pairs(Config.Zones) do
        for kk,vm in pairs(v.Rooms) do 
            if curRoom == vm.instancename then
                distance = GetDistanceBetweenCoords(coords, vm.Inventory.x, vm.Inventory.y, vm.Inventory.z, true)
                if distance < 1.0 then
                    canSleep = false
                    if roomOwner == playerIdent then
                        DrawText3D(vm.Inventory.x, vm.Inventory.y, vm.Inventory.z + 0.35, 'Tekan [~g~E~s~] untuk membuka lemari baju')
                        if IsControlJustReleased(0, Keys['E']) then
                            PlayerDressings()
                        end
                    end
                end
            end
        end
    end

    if canSleep then
        Wait(500)
    end
end

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

function ExitProperty(room)
    local playerPed = PlayerPedId()
    inRoom          = false
    inMotel         = false
    TriggerServerEvent('lsrp-motels:DelMotel')
	CreateThread(function()
		DoScreenFadeOut(800)
		while not IsScreenFadedOut() do
			Wait(0)
		end
        for k,v in pairs(Config.Zones) do
            for km,vm in pairs(v.Rooms) do
                if room == vm.instancename then
                    SetEntityCoords(playerPed, vm.entry.x, vm.entry.y, vm.entry.z)
                end
            end
        end

		DoScreenFadeIn(800)
	end)
end

local isRent = false
CreateThread(function()
    while true do
        Wait(0)
        local playerPed = PlayerPedId()
        local coords    = GetEntityCoords(playerPed)
        local canSleepm = true

        if next(myMotel) ~= nil then 
            for k,v in pairs(Config.Zones) do
                for km,vm in pairs(v.Rooms) do
                    if has_value(myMotel, vm.instancename) then
                        distance = GetDistanceBetweenCoords(coords, vm.entry.x, vm.entry.y, vm.entry.z, true)
                        if (distance < 2.0) then
                            canSleepm = false
                            DrawMarker(2, vm.entry.x, vm.entry.y, vm.entry.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.2, Config.RoomMarker.Owned.r, Config.RoomMarker.Owned.g, Config.RoomMarker.Owned.b, 255, 1, 0, 0, 1, 0, 0, 0)
                        end
                        if (distance < 1.0) then
                            canSleepm = false
                            DrawText3D(vm.entry.x, vm.entry.y, vm.entry.z + 0.35, 'Tekan [~g~E~s~] untuk opsi')
                            if IsControlJustReleased(0, Keys['E']) then
                                TriggerEvent("lsrp-motels:roomOptions", vm.instancename, k)
                            end
                        end
                    else
                        distance = GetDistanceBetweenCoords(coords, vm.entry.x, vm.entry.y, vm.entry.z, true)
                        if (distance < 2.0) then
                            canSleepm = false
                            DrawMarker(2, vm.entry.x, vm.entry.y, vm.entry.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.2, 0, 255, 0, 255, 1, 0, 0, 1, 0, 0, 0)
                        end
                        if (distance < 1.0 and isRent == false) then
                            DrawText3D(vm.entry.x, vm.entry.y, vm.entry.z + 0.35, 'Tekan [~g~E~s~] untuk sewa kamar ~b~'..vm.number)
                            if IsControlJustReleased(0, Keys['E']) and isRent == false then
                                TriggerEvent('lsrp-motels:rentRoom', vm.instancename)
                            end
                        end
                    end
                end
            end
        else
            for k,v in pairs(Config.Zones) do
                distance = GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true)
                if (distance < v.Boundries) then
                    for km,vm in pairs(v.Rooms) do
                        distance = GetDistanceBetweenCoords(coords, vm.entry.x, vm.entry.y, vm.entry.z, true)
                        if (distance < 2.0) then
                            canSleepm = false
                            DrawMarker(2, vm.entry.x, vm.entry.y, vm.entry.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.2, 0, 255, 0, 255, 1, 0, 0, 1, 0, 0, 0)
                        end
                        if (distance < 1.0 and isRent == false) then
                            DrawText3D(vm.entry.x, vm.entry.y, vm.entry.z + 0.35, 'Tekan [~g~E~s~] untuk sewa kamar ~b~'..vm.number)
                            if IsControlJustReleased(0, Keys['E']) and isRent == false then
                                TriggerEvent('lsrp-motels:rentRoom', vm.instancename)
                            end
                        end
                    end
                end
            end    
        end

        if canSleepm then
            Wait(500)
        end
    end
end)

CreateThread(function()
    Wait(0)
    while true do
        Wait(0)
        local playerPed = PlayerPedId()
        local coords    = GetEntityCoords(playerPed)
        local canSleep  = true

        if inRoom then
            canSleep = false
            roomMarkers()
        end 

        if not inMotel then
            for k,v in pairs(Config.Zones) do
                distance = GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true)
                if (distance < v.Boundries) then
                    canSleep = false
                    getMyMotel()
                    Wait(1000)
                end
            end
        end

        if canSleep then
            Wait(500)
        end
    end
end)

function OpenPropertyInventoryMenu(motelName, owner)
	ESX.TriggerServerCallback("lsrp-motels:getPropertyInventory", function(inventory)
        if motelName == "rusun" then
            TriggerEvent("esx_inventoryhud:openRusunInventory", inventory)
        elseif motelName == "losmen" then
            TriggerEvent("esx_inventoryhud:openLosmenInventory", inventory)
        end
	end, motelName, owner)
end