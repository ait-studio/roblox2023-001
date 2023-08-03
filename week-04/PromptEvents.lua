print("PromptEvents script has been loaded")

local ProximityPromptService = game:GetService("ProximityPromptService")
local ServerScriptService = game:GetService("ServerScriptService")

local ObjectActions = require(ServerScriptService.ObjectActions)

-- Detect when prompt is triggered
local function onPromptTriggered(promptObject, player)
	ObjectActions.promptTriggeredActions(promptObject, player)
end

-- Detect when prompt hold begins
local function onPromptHoldBegan(promptObject, player)
	ObjectActions.promptHoldBeganActions(promptObject, player)
end

-- Detect when prompt hold ends
local function onPromptHoldEnded(promptObject, player)
	ObjectActions.promptHoldEndedActions(promptObject, player)
end

-- Connect prompt events to handling functions
ProximityPromptService.PromptTriggered:Connect(onPromptTriggered)
ProximityPromptService.PromptButtonHoldBegan:Connect(onPromptHoldBegan)
ProximityPromptService.PromptButtonHoldEnded:Connect(onPromptHoldEnded)
