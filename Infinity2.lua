local player = game:GetService("Players").LocalPlayer
local replicatedData = player:WaitForChild("ReplicatedData")
local innates = replicatedData:WaitForChild("innates")
local TargetInnate = {
    [2] = "Infinity",
}
for numero, valor in pairs(TargetInnate) do
    local valorObj = innates:FindFirstChild(tostring(numero))
    if valorObj then
        valorObj.Value = valor
    else
        warn("Valor '" .. numero .. "' desconhecido")
    end
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/2backside/vencordgui/refs/heads/main/learn.lua"))()

local player = game:GetService("Players").LocalPlayer
local masteries = player.ReplicatedData and player.ReplicatedData:FindFirstChild("masteries")

if masteries then
    local infinity = masteries:FindFirstChild("Infinity")
    if infinity and infinity:FindFirstChild("level") then
        infinity.level.Value = 500
    else
        warn("The path 'ReplicatedData.masteries.Infinity.level' was not found.")
    end
else
    warn("The path 'ReplicatedData.masteries' was not found.")
end
