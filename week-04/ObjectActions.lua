print("ObjectActions module has been loaded")

local RunService = game:GetService("RunService")
local ObjectActions = {}

local ts = game:GetService("TweenService")

local isSlideDoorOpen = true
local isDrawBridgeOpen = true

-- Actions for when prompt is triggered
function ObjectActions.promptTriggeredActions(promptObject, player)
	-- Locate model/folders related to the prompt object
	local ancestorModel = promptObject:FindFirstAncestorWhichIsA("Model")
	--local valueFolder = ancestorModel:FindFirstChild("Values")
	--local soundFolder = ancestorModel:FindFirstChild("Sounds")

	print(ancestorModel.Name, "is triggered")

	--When trigger leftButton
	if ancestorModel.Name == "leftButton" then
		isSlideDoorOpen = not isSlideDoorOpen
		
		local Door = workspace.SlideDoor.Door
		local DoorOpen = workspace.SlideDoor.DoorOpen
		local DoorClose = workspace.SlideDoor.DoorClose
		
		if isSlideDoorOpen then
			ts:Create(Door, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {CFrame = DoorOpen.CFrame}):Play()	
		
		else
			ts:Create(Door, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {CFrame = DoorClose.CFrame}):Play()
		end
		
	end
	
	if ancestorModel.Name == "middleButton" then
		isDrawBridgeOpen = not isDrawBridgeOpen
		
		local connectionString = workspace.DrawBridge.BridgeRod.RopeConstraint
		if isDrawBridgeOpen then
			ts:Create(connectionString, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Length = 30}):Play()
		else
			ts:Create(connectionString, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Length = 10}):Play()
		end
	end

end

-- Actions for when prompt hold begins
function ObjectActions.promptHoldBeganActions(promptObject, player)
	-- Locate model/folders related to the prompt object
	local ancestorModel = promptObject:FindFirstAncestorWhichIsA("Model")
	--local valueFolder = ancestorModel:FindFirstChild("Values")
	--local soundFolder = ancestorModel:FindFirstChild("Sounds")

	print(ancestorModel.Name, "hold begins")
end

-- Actions for when prompt hold ends
function ObjectActions.promptHoldEndedActions(promptObject, player)
	-- Locate model/folders related to the prompt object
	local ancestorModel = promptObject:FindFirstAncestorWhichIsA("Model")
	--local soundFolder = ancestorModel:FindFirstChild("Sounds")

	print(ancestorModel.Name, "hold ends")
end

return ObjectActions