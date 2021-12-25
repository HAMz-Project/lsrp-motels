ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('lsrp-motels:cancelRental')
AddEventHandler('lsrp-motels:cancelRental', function(room)
    local src 		= source
    local xPlayer 	= ESX.GetPlayerFromId(src)

	MySQL.Sync.execute("DELETE FROM lsrp_motels WHERE ident=@ident AND motel_id=@roomno", {['@ident'] = xPlayer.identifier, ['@roomno'] = room})
	TriggerClientEvent('mythic_notify:SendAlert', src, { type = 'inform', text = 'Kamu telah membatalkan sewa kamar' })
end)

RegisterServerEvent('lsrp-motels:rentRoom')
AddEventHandler('lsrp-motels:rentRoom', function(room)
	local count 	= 0
	local src 		= source
	local xPlayer 	= ESX.GetPlayerFromId(src)

	MySQL.Async.fetchAll("SELECT motel_id FROM lsrp_motels WHERE motel_id = @motel_id", {['@motel_id'] = room}, function(countRoom)
		if countRoom ~= nil then
			for _ in pairs(countRoom) do count = count + 1 end
			if count < Config.MaxSlot then
				if xPlayer.getMoney() >= Config.PriceRental then
					xPlayer.removeMoney(Config.PriceRental)
					MySQL.Sync.execute("INSERT INTO lsrp_motels (ident, motel_id) VALUES (@ident, @roomno)", {['@ident'] = xPlayer.identifier, ['@roomno'] = room})
					TriggerClientEvent('mythic_notify:SendAlert', src, { type = 'inform', text = 'Kamu telah berhasil menyewa kamar' })
				else
					TriggerClientEvent('mythic_notify:SendAlert', src, { type = 'error', text = 'Kamu tidak memiliki cukup uang cash' })
				end
			else
				TriggerClientEvent('mythic_notify:SendAlert', src, { type = 'error', text = 'Kamar sudah penuh' })
			end
		else
			TriggerClientEvent('mythic_notify:SendAlert', src, { type = 'error', text = 'Kamar sudah penuh' })
		end
	end)
end)

ESX.RegisterServerCallback('lsrp-motels:getMotelRoomID', function(source, cb, room)
    local src 		= source
    local xPlayer 	= ESX.GetPlayerFromId(src)

    MySQL.Async.fetchScalar("SELECT id FROM lsrp_motels WHERE ident=@ident AND motel_id = @room", {['@ident'] = xPlayer.identifier, ['@room'] = room}, function(rentalID)
        if rentalID ~= nil then
            cb(rentalID)
        else
            cb(false)
        end
    end)
end)

ESX.RegisterServerCallback('lsrp-motels:checkOwnership', function(source, cb)
    local src 		= source
	local xPlayer	= ESX.GetPlayerFromId(src)
	local motels 	= {}

    if xPlayer then
		MySQL.Async.fetchAll("SELECT motel_id FROM lsrp_motels WHERE ident = @ident", {['@ident'] = xPlayer.identifier}, function(motelRoom)
			if motelRoom ~= nil then
				for k,v in pairs(motelRoom) do
					table.insert(motels, v.motel_id)
				end
			end
			cb(motels)
		end)
    end
end)

ESX.RegisterServerCallback('lsrp-motels:checkOwnerCount', function(source, cb, room)
    local src 		= source
	local xPlayer	= ESX.GetPlayerFromId(src)
	local count 	= 0

    if xPlayer then
		MySQL.Async.fetchAll("SELECT motel_id FROM lsrp_motels WHERE motel_id = @motel_id", {['@motel_id'] = room}, function(countRoom)
			if countRoom ~= nil then
				for _ in pairs(countRoom) do count = count + 1 end
			end
			cb(count)
		end)
    end
end)

RegisterServerEvent('lsrp-motels:getItem')
AddEventHandler('lsrp-motels:getItem', function(motelName, owner, type, item, count)
	local _source      = source
	local xPlayer      = ESX.GetPlayerFromId(_source)
	local xPlayerOwner = ESX.GetPlayerFromIdentifier(owner)

	if type == 'item_standard' then
		local sourceItem = xPlayer.getInventoryItem(item)

		TriggerEvent('esx_addoninventory:getInventory', motelName, xPlayerOwner.identifier, function(inventory)
			local inventoryItem = inventory.getItem(item)

			-- is there enough in the property?
			if count > 0 and inventoryItem.count >= count then
				-- can the player carry the said amount of x item?
				--if sourceItem.limit ~= nil and (sourceItem.count + count) > sourceItem.limit then
				if xPlayer.canCarryItem(item, count) then
					inventory.removeItem(item, count)
					xPlayer.addInventoryItem(item, count)
					TriggerClientEvent('mythic_notify:SendAlert', _source, { type = 'inform', text = _U('have_withdrawn', count, inventoryItem.label) })
				else
					TriggerClientEvent('mythic_notify:SendAlert', _source, { type = 'error', text = _U('player_cannot_hold') })
				end
			else
				TriggerClientEvent('mythic_notify:SendAlert', _source, { type = 'error', text = _U('not_enough_in_property') })
			end
		end)
	elseif type == 'item_account' then
		TriggerEvent('esx_addonaccount:getAccount', motelName .. '_' .. item, xPlayerOwner.identifier, function(account)
			local roomAccountMoney = account.money

			if roomAccountMoney >= count then
				account.removeMoney(count)
				xPlayer.addAccountMoney(item, count)
			else
				TriggerClientEvent('mythic_notify:SendAlert', _source, { type = 'error', text = _U('amount_invalid') })
			end
		end)
	elseif type == 'item_money' then
		TriggerEvent('esx_addonaccount:getAccount', motelName .. '_' .. item, xPlayerOwner.identifier, function(account)
			local roomAccountMoney = account.money

			if roomAccountMoney >= count then
				account.removeMoney(count)
				xPlayer.addAccountMoney('money', count)
			else
				TriggerClientEvent('mythic_notify:SendAlert', _source, { type = 'error', text = _U('amount_invalid') })
			end
		end)
	elseif type == 'item_weapon' then
		TriggerEvent('esx_datastore:getDataStore', motelName, xPlayerOwner.identifier, function(store)
			local storeWeapons = store.get('weapons') or {}
			local weaponName   = nil
			local ammo         = nil

			for i=1, #storeWeapons, 1 do
				if storeWeapons[i].name == item then
					weaponName = storeWeapons[i].name
					ammo       = storeWeapons[i].ammo

					table.remove(storeWeapons, i)
					break
				end
			end

			store.set('weapons', storeWeapons)
			xPlayer.addWeapon(weaponName, ammo)
		end)
	end
end)

RegisterServerEvent('lsrp-motels:putItem')
AddEventHandler('lsrp-motels:putItem', function(motelName, owner, type, item, count)
	local _source      = source
	local xPlayer      = ESX.GetPlayerFromId(_source)
	local xPlayerOwner = ESX.GetPlayerFromIdentifier(owner)
	
	if type == 'item_standard' then
		local playerItemCount = xPlayer.getInventoryItem(item).count

		if playerItemCount >= count and count > 0 then
			TriggerEvent('esx_addoninventory:getInventory', motelName, xPlayerOwner.identifier, function(inventory)
				local inventoryItem = inventory.getItem(item)
				xPlayer.removeInventoryItem(item, count)
				inventory.addItem(item, count)
				TriggerClientEvent('mythic_notify:SendAlert', _source, { type = 'inform', text = _U('have_deposited', count, inventory.getItem(item).label) })
			end)
		else
			TriggerClientEvent('mythic_notify:SendAlert', _source, { type = 'error', text = _U('invalid_quantity') })
		end
	elseif type == 'item_account' then
		local playerAccountMoney = xPlayer.getAccount(item).money

		if playerAccountMoney >= count and count > 0 then
			xPlayer.removeAccountMoney(item, count)

			TriggerEvent('esx_addonaccount:getAccount', motelName .. '_' .. item, xPlayerOwner.identifier, function(account)
				account.addMoney(count)
			end)
		else
			TriggerClientEvent('mythic_notify:SendAlert', _source, { type = 'error', text = _U('amount_invalid') })
		end

	elseif type == 'item_money' then
		local playerAccountMoney = xPlayer.getAccount('money').money

		if playerAccountMoney >= count and count > 0 then
			xPlayer.removeAccountMoney('money', count)

			TriggerEvent('esx_addonaccount:getAccount', motelName .. '_' .. item, xPlayerOwner.identifier, function(account)
				account.addMoney(count)
			end)
		else
			TriggerClientEvent('mythic_notify:SendAlert', _source, { type = 'error', text = _U('amount_invalid') })
		end
	elseif type == 'item_weapon' then
		if xPlayer.hasWeapon(item) then
			xPlayer.removeWeapon(item)
			
			TriggerEvent('esx_datastore:getDataStore', motelName, xPlayerOwner.identifier, function(store)
				local storeWeapons = store.get('weapons') or {}

				table.insert(storeWeapons, {
					name = item,
					ammo = count
				})

				store.set('weapons', storeWeapons)
				xPlayer.removeWeapon(item)
			end)
		end
	end
end)

ESX.RegisterServerCallback('lsrp-motels:getPropertyInventory', function(source, cb, motelName, owner)
	local xPlayer    	= ESX.GetPlayerFromIdentifier(owner)
	local blackMoney 	= 0
	local money 		= 0
	local items      	= {}
	local weapons    	= {}

	TriggerEvent('esx_addonaccount:getAccount', motelName .. '_black_money', xPlayer.identifier, function(account)
		blackMoney = account.money
	end)
	TriggerEvent('esx_addonaccount:getAccount', motelName .. '_money', xPlayer.identifier, function(account2)
		money = account2.money
	end)

	TriggerEvent('esx_addoninventory:getInventory', motelName, xPlayer.identifier, function(inventory)
		items = inventory.items
	end)

	TriggerEvent('esx_datastore:getDataStore', motelName, xPlayer.identifier, function(store)
		weapons = store.get('weapons') or {}
	end)

	cb({
		blackMoney = blackMoney,
		money      = money,
		items      = items,
		weapons    = weapons
	})
end)

ESX.RegisterServerCallback('lsrp-motels:getPlayerInventory', function(source, cb)
	local xPlayer    	= ESX.GetPlayerFromId(source)
	local blackMoney 	= xPlayer.getAccount('black_money').money
	local money 		= xPlayer.getAccount('money').money
	local items      	= xPlayer.inventory

	cb({
		blackMoney = blackMoney,
		money = money,
		items      = items,
		weapons    = xPlayer.getLoadout()
	})
end)

ESX.RegisterServerCallback('lsrp-motels:getPlayerDressing', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local count  = store.count('dressing')
		local labels = {}

		for i=1, count, 1 do
			local entry = store.get('dressing', i)
			table.insert(labels, entry.label)
		end

		cb(labels)
	end)
end)

ESX.RegisterServerCallback('lsrp-motels:getPlayerOutfit', function(source, cb, num)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local outfit = store.get('dressing', num)

		cb(outfit.skin)
	end)
end)

RegisterServerEvent('lsrp-motels:removeOutfit')
AddEventHandler('lsrp-motels:removeOutfit', function(label)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local dressing = store.get('dressing') or {}
		table.remove(dressing, label)
		store.set('dressing', dressing)
	end)
end)

ESX.RegisterServerCallback('lsrp-motels:checkIsOwner', function(source, cb, room, owner)
    local xPlayer    = ESX.GetPlayerFromIdentifier(owner)

    MySQL.Async.fetchScalar("SELECT motel_id FROM lsrp_motels WHERE motel_id = @room AND ident = @id", {
        ['@room'] = room,
        ['@id'] = xPlayer.identifier
     }, function(isOwner)
        if isOwner ~= nil then
            cb(true)
        else
            cb(false)
        end
    end)
end)

RegisterServerEvent('lsrp-motels:SaveMotel')
AddEventHandler('lsrp-motels:SaveMotel', function(motel, room)
	local xPlayer  	= ESX.GetPlayerFromId(source)
	local motelname = motel
	local roomident = room

	MySQL.Sync.execute('UPDATE users SET last_motel = @motelname, last_motel_room = @lroom WHERE identifier = @identifier',
	{
		['@motelname']        = motelname,
		['@lroom'] 			  = roomident,
		['@identifier'] 	  = xPlayer.identifier
	})
end)

RegisterServerEvent('lsrp-motels:DelMotel')
AddEventHandler('lsrp-motels:DelMotel', function()
	local xPlayer  = ESX.GetPlayerFromId(source)
	MySQL.Sync.execute('UPDATE users SET last_motel = NULL, last_motel_room = NULL WHERE identifier = @identifier',
	{
		['@identifier'] = xPlayer.identifier
	})
end)

function PayRent(d, h, m)
	MySQL.Async.fetchAll('SELECT * FROM lsrp_motels', {}, function (result)
		for i=1, #result, 1 do
			local xPlayer = ESX.GetPlayerFromIdentifier(result[i].ident)

			-- message player if connected
			if xPlayer then
				xPlayer.removeAccountMoney('bank', Config.Tax)
				TriggerClientEvent('mythic_notify:SendAlert', xPlayer.source, { type = 'inform', text = _U('paid_rent', ESX.Math.GroupDigits(Config.Tax)) })
			else -- pay rent either way
				MySQL.Async.fetchScalar('SELECT accounts FROM users WHERE identifier = @identifier', {
					['@identifier'] = result[i].ident
				}, function(accounts)
					if accounts then
						local playerAccounts = json.decode(accounts)

						if playerAccounts and playerAccounts.bank then
							if playerAccounts.bank >= Config.Tax then
								playerAccounts.bank = playerAccounts.bank - Config.Tax

								MySQL.Async.execute('UPDATE users SET accounts = @accounts WHERE identifier = @identifier', {
									['@identifier'] = result[i].ident,
									['@accounts'] = json.encode(playerAccounts)
								})
							end
						end
					end
				end)
			end
		end
	end)
end

TriggerEvent('cron:runAt', 22, 0, PayRent)