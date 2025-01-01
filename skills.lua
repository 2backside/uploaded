local player = game:GetService("Players").LocalPlayer
local replicatedData = player:WaitForChild("ReplicatedData")
local techniques = replicatedData:WaitForChild("techniques")
local skills = techniques:WaitForChild("skills")
local valores = {
    B = "Simple Domain",
    C = "Cursed Reinforcement",
    G = "Divergent Fist: Second Impact",
    T = "Cursed Vision",
    V = "Veil",
    X = "Curse Tendril",
    Z = "Hollow wicker basket",
    Y = "Rising Kick"
}

for nome, valor in pairs(valores) do
    local valorObj =    skills:FindFirstChild(nome)
    if valorObj then
        valorObj.Value = valor
    else
        warn("Valor '" .. nome .. "' desconhecido")
    end
end
