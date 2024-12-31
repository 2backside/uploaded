local ataques = {
    ["R"] = {
        "Star Rage: Jupiter"
    },
    ["T"] = {
        "Star Rage: Asteroid",
        "Demon Vessel: Dismantle"
    },
    ["Y"] = {
        "Infinity: Lapse Blue", 
        "Soul Manipulation: Blade Rush"
    },
    ["U"] = {
        "Star Rage: Oberon",
        "Demon Vessel: Cleave"
    },
    ["P"] = {
        "Star Rage: Mars", 
        "Demon Vessel: Flame Arrow"
    },
    ["G"] = {
        "Star Rage: Mercury",
        "Demon Vessel: Flame Arrow"
     },
    ["H"] = {
        "Star Rage: Terra",
        "Demon Vessel: Switch"
    },
    ["K"] = {
        "Maximum: Total Collapse",
        "Soul Manipulation: Deformed Fist"
    },
    ["L"] = {
        --"Domain Expansion: Unlimited Void",
        --"Domain Expansion: Malevolent Shrine",
        "Gambler Fever: Pachinko Rush",
        "Gambler Fever: Rendezvous"
    },
    ["Z"] = {
        "Soul Manipulation: Soul Touch",
        "Gambler Fever: Cargo Haul"
    },
    ["X"] = {
        "Infinity: Reversal Red", 
        "Soul Manipulation: Flesh Drill"
        
    },
    ["C"] = {
        "Infinity: Spatial Pummel", 
        "Soul Manipulation: Distorted Inflation", 
        
    },
    ["V"] = {
        "Maximum: Heian Awakening", 
        "Soul Manipulation: Polymorphic Soul Isomer"
    },
    ["B"] = {
        "Infinity: Hollow Purple", 
        "Soul Manipulation: Instant Spirit Body of Distored Killing" 
    },
    ["N"] = {
        "Maximum: Six Eyes", 
        "Soul Manipulation: Self-Embodiment of Perfection"
    },
    ["M"] = {
        "Gambler Fever: Idle Death Gamble",
        "Gambler Fever: Slot Slam"
    }
}

local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CombatSkillRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Combat"):WaitForChild("Skill")

local function executarAtaque(tecla)
    local ataquesTecla = ataques[tecla:upper()]
    if ataquesTecla then
        local ataqueEscolhido = ataquesTecla[math.random(#ataquesTecla)]
        print("Executado: " .. ataqueEscolhido)
        CombatSkillRemote:FireServer(ataqueEscolhido)
    end
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.UserInputType == Enum.UserInputType.Keyboard then
        executarAtaque(input.KeyCode.Name)
    end
end)