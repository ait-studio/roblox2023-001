print("ObjectActions module has been loaded")

local RunService = game:GetService("RunService")

local ObjectActions = {}

-- Actions for when prompt is triggered
function ObjectActions.promptTriggeredActions(promptObject, player)
	-- Locate model/folders related to the prompt object
	local ancestorModel = promptObject:FindFirstAncestorWhichIsA("Model")
	--local valueFolder = ancestorModel:FindFirstChild("Values")
	--local soundFolder = ancestorModel:FindFirstChild("Sounds")
	
	print(ancestorModel.Name, "is triggered")
	
	--When trigger switch C
	if ancestorModel.Name == "Switch C" then
		local torches = workspace.torches
		
		for i, v in pairs(torches:GetChildren()) do
			if v.Name == "torch" then
				local curChild = v:GetChildren()
				local fireEff = curChild[2]
				local fires = fireEff:GetChildren()
				fires[1].Enabled = not fires[1].Enabled
				fires[2].Enabled = not fires[2].Enabled
			end
		end
	end
	
	if ancestorModel.Name == "Switch B" then
		local switchA = workspace["Switch A"]["Lightening Spehere"]
		local switchB = workspace["Switch B"]["Lightening Spehere"]
		local switchC = workspace["Switch C"]["Lightening Spehere"]
		local startingLight = workspace["Lightening Spehere"]
		
		local lights = {switchA, switchB, switchC, startingLight}
		
		for i, v in pairs(lights) do
			v.PointLight.Enabled = not v.PointLight.Enabled
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