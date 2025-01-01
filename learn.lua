local addtolearn = {
    "Infinity: Lapse Blue", "Infinity: Reversal Red", "Infinity: Spatial Pummel", 
    "Infinity: Mugen", "Infinity: Red Transmission", "Infinity: Hollow Purple", 
    "Maximum: Six Eyes", "Domain Expansion: Unlimited Void", 
    "Star Rage: Jupiter", "Star Rage: Asteroid", "Star Rage: Oberon", 
    "Star Rage: Mars", "Star Rage: Mercury", "Star Rage: Terra", 
    "Maximum: Total Collapse", "Domain Expansion: Celestial Opera", 
    "Demon Vessel: Dismantle", "Demon Vessel: Cleave", 
    "Demon Vessel: Flame Arrow", "Demon Vessel: Switch", 
    "Maximum: Heian Awakening", "Domain Expansion: Malevolent Shrine", 
    "Curse Queen: Ghastly Fist", "Curse Queen: Demonic Toss", 
    "Curse Queen: Neck Twister", "Curse Queen: Energy Blast", 
    "Curse Queen: Copy", "Curse Queen: Conjuration", 
    "Maximum: Jacob's Ladder", "Domain Expansion: Unequivocal Love"
}
local jogador = game:GetService("Players").LocalPlayer
local learned = jogador.ReplicatedData and jogador.ReplicatedData:FindFirstChild("learned")

if learned then
    for _, valor in ipairs(addtolearn) do
        if not learned:FindFirstChild(valor) then
            local novoValor = Instance.new("StringValue")
            novoValor.Name = valor
            novoValor.Value = valor
            novoValor.Parent = learned
        end
    end
end
