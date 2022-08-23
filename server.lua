ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_welder:paycheck')
AddEventHandler('esx_welder:paycheck', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local receivemoney = math.random(50, 100)
	if receivemoney < 200 then
		xPlayer.addMoney(receivemoney)
	else
		print("godfather can't do that") -- put a ban or kick trigger here --
	end
end)

RegisterNetEvent('esx_welder:additems')
AddEventHandler('esx_welder:additems', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addInventoryItem(RandomItem(), RandomNumber())
end)

Items = {
	"celik", -- put the items you want here --
    "bakar"
}

function RandomItem()
return Items[math.random(#Items)]
end

function RandomNumber()
	return math.random(1,2)
end