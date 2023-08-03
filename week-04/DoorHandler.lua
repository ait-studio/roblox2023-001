local door = script.Parent.Door
local lever = script.Parent.Lever

local leverOff = script.Parent.LeverOff
local leverOn = script.Parent.LeverOn

local DoorOpen = script.Parent.DoorOpen
local DoorClose = script.Parent.DoorClose

local cd = lever:WaitForChild("ClickDetector")
local ts = game:GetService("TweenService")
local isOpen = false

cd.MouseClick:Connect(function()
	isOpen = not isOpen
	if isOpen then	
		
		ts:Create(lever, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {CFrame = leverOn.CFrame}):Play()
		ts:Create(door, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {CFrame = DoorOpen.CFrame}):Play()
			
	else
		ts:Create(lever, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {CFrame = leverOff.CFrame}):Play()
		ts:Create(door, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {CFrame = DoorClose.CFrame}):Play()

	end
end)