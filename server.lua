local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand('gamble', function(source, args)
    local amount = tonumber(args[1])
    local Player = QBCore.Functions.GetPlayer(source)

    if not amount or amount <= 0 then
        TriggerClientEvent('chat:addMessage', source, {
            args = { 'Gamble', 'Invalid amount.' }
        })
        return
    end

    if Player.Functions.RemoveMoney('cash', amount) then
        if math.random() < 0.5 then
            Player.Functions.AddMoney('cash', amount * 2)
            TriggerClientEvent('chat:addMessage', source, {
                args = { 'Gamble', '🎉 You won! You now have double the amount.' }
            })
        else
            TriggerClientEvent('chat:addMessage', source, {
                args = { 'Gamble', '💀 You lost. Better luck next time.' }
            })
        end
    else
        TriggerClientEvent('chat:addMessage', source, {
            args = { 'Gamble', 'Not enough cash!' }
        })
    end
end)

