local npcevi = {
  ["Varioc"] = {location = vector3(2569.44, 2720.29, 41.95), h = 205.6, ped = `cs_josef`, prisao = false, spawnanPed = 0},
}

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
		return
	end

	for key, data in pairs(npcevi) do
		DeleteEntity(data.spawnanPed)
	end

end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)  
		local ped = PlayerPedId()
		local pedLoc = GetEntityCoords(ped)

		for key, data in pairs(npcevi) do
			if not data.prisao then
				if #(pedLoc - data.location) <= 150 then
					npcevi[key].prisao = true
					CreateNPCped(data, key)
				end
			else
				if #(pedLoc - npcevi[key].location) > 150 then
					if DoesEntityExist(npcevi[key].spawnanPed) then
						DeleteEntity(npcevi[key].spawnanPed)
					end
					npcevi[key].prisao = false
					npcevi[key].spawnanPed = 0
				end
			end
		end
	end
end)

function CreateNPCped(data, key)

	RequestModel(data.ped)

	while not HasModelLoaded(data.ped) do
		Wait(10)
	end

	if data.ped == -634611634 then

		npcevi[key].spawnanPed = CreatePed(26, data.ped, data.location, data.h, false, false)
		FreezeEntityPosition(npcevi[key].spawnanPed, true)
		SetBlockingOfNonTemporaryEvents(npcevi[key].spawnanPed, true)
		SetEntityInvincible(npcevi[key].spawnanPed, true)
		GiveWeaponToPed(npcevi[key].spawnanPed,GetHashKey('WEAPON_CARBINERIFLE'), 0, false, true)
        SetCurrentPedWeapon(npcevi[key].spawnanPed,GetHashKey('WEAPON_CARBINERIFLE'),true)
	else
		npcevi[key].spawnanPed = CreatePed(26, data.ped, data.location, data.h, false, false)
		FreezeEntityPosition(npcevi[key].spawnanPed, true)
		SetBlockingOfNonTemporaryEvents(npcevi[key].spawnanPed, true)
		SetEntityInvincible(npcevi[key].spawnanPed, true)
	end
end
