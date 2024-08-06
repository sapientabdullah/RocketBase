local CurrentCapturedVelocity = 0
local CurrentCapturedPosition = 0
local CurrentSpeed = script.Parent.CurrentSpeed
local SteerAngle = script.Parent.Body.SW.SWF.HingeConstraint
local MainTracking = false
local vehicleon = false
local slowingdown = false
local leftmaintouching = false
local rightmaintouching = false
local aroundpathfinding = false
local aroundblocked = false
local pickedrandom = false
local gatheredinfo = false


local MainSensor = script.Parent.Body.Sensors.MainSensor
local MainRightSensor = script.Parent.Body.Sensors.MainRightSensor
local MainLeftSensor = script.Parent.Body.Sensors.MainLeftSensor
local CurrentSensor = script.Parent.Body.Sensors.CurrentSensor


game:GetService("RunService").Heartbeat:Connect(function()
	CurrentCapturedVelocity = script.Parent.Body.Weight.AssemblyLinearVelocity.X + script.Parent.Body.Weight.AssemblyLinearVelocity.Z
	CurrentCapturedPosition = script.Parent.Body.Weight.Position
	
	if aroundpathfinding == true then
		script.Parent.Autonomous.Disabled = true
	elseif aroundpathfinding == false then
		script.Parent.Autonomous.Disabled = false
	end
