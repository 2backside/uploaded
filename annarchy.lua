local player = game:GetService("Players").LocalPlayer
local replicatedData = player:WaitForChild("ReplicatedData")
local innates = replicatedData:WaitForChild("innates")
local TargetInnate = {
    [1] = "Infinity",
}
for numero, valor in pairs(TargetInnate) do
    local valorObj = innates:FindFirstChild(tostring(numero))
    if valorObj then
        valorObj.Value = valor
    else
        warn("Valor '" .. numero .. "' desconhecido")
    end
end
