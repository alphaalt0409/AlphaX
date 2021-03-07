local mt = getrawmetatable(game)
local old = mt.__namecall
local oldfunc 
local hook = hookfunc or hookfunction


oldfunc = hook(Instance.new("Player").Kick, function(self, ...)
    return print("Anti Kick Actived")
end)

setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    if method:lower() == "kick" then
        return print("Anti Kick Actived")
    end
    return old(self, unpack(args))
end)

if game.ReplicatedStorage.Interaction:FindFirstChild("Ban") then
    game.ReplicatedStorage.Interaction.Ban:Destroy()
end

if game.ReplicatedStorage.Transactions:FindFirstChild("AddLog") then 
    game.ReplicatedStorage.Transactions.AddLog:Destroy()
end
