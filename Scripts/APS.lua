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

	if script.Parent.Power.Value == true then
		if MainSensor:FindFirstChild("SensorRay") then
			MainSensor.SensorRay.Touched:Connect(function(object)
				if object.Name ~= "Terrain" and object.Name ~= "Road" then
					MainTracking = true
					shared.trackingloop = game:GetService("RunService").Heartbeat:Connect(function()
						if MainTracking == true then
							local Magnitude = (CurrentCapturedPosition - object.Position).Magnitude
							if slowingdown == false then
								slowingdown = true
								for i = 1,math.floor(CurrentSpeed.Value) do
									if CurrentSpeed.Value > 0 then
										CurrentSpeed.Value -= 1
									end
									wait(0.02)
								end
							end
							if CurrentSpeed.Value == 0 then
								if aroundpathfinding == false then
									aroundpathfinding = true
									wait(4)
									wait()
									if rightmaintouching == true and leftmaintouching == false and gatheredinfo == false then
										gatheredinfo = true
										SteerAngle.TargetAngle = 30
										rightmaintouching = false
										delay(2, function()
											aroundblocked = false
											aroundpathfinding = true
										end)
									elseif rightmaintouching == false and leftmaintouching == true and gatheredinfo == false then
										gatheredinfo = true
										SteerAngle.TargetAngle = -30
										leftmaintouching = false
										delay(2, function()
											aroundblocked = false
											aroundpathfinding = true
										end)
																		elseif rightmaintouching == false and leftmaintouching == true and gatheredinfo == false then
										gatheredinfo = true
										SteerAngle.TargetAngle = -30
										leftmaintouching = false
										delay(2, function()
											aroundblocked = false
											aroundpathfinding = true
										end)
									elseif rightmaintouching == true and leftmaintouching == true and gatheredinfo == false then
										gatheredinfo = true
										aroundblocked = true
										local random = math.random(1,2)
										if random == 1 then
											SteerAngle.TargetAngle = 30
										elseif random == 2 then
											SteerAngle.TargetAngle = -30
										end
										delay(2, function()
											aroundblocked = false
											aroundpathfinding = true
										end)
									elseif rightmaintouching == false and leftmaintouching == false and gatheredinfo == false then
										gatheredinfo = true
										if pickedrandom == false then
											pickedrandom = true
											local random = math.random(1,2)
											aroundblocked = false
											if random == 1 then
												SteerAngle.TargetAngle = 30
											elseif random == 2 then
												SteerAngle.TargetAngle = -30
											end
										end
										delay(2, function()
											aroundblocked = false
											aroundpathfinding = true
										end)
									end
									wait(1)
									if aroundblocked == false then
										CurrentSpeed.Value = 7.5
									elseif aroundblocked == true then
										CurrentSpeed.Value = -7.5
									end
										shared.trackingloop:Disconnect()
								end
							end
						end
					end)
					MainSensor.SensorRay.TouchEnded:Connect(function()
						delay(0.25, function()
							aroundpathfinding = false
							gatheredinfo = false
							slowingdown = false
							rightmaintouching = false
							leftmaintouching = false
						end)
						
						MainTracking = false
						pickedrandom = false
						CurrentSpeed.Value = 25
						
					end)
				end
			end)
		end
	end
	if aroundpathfinding == true then
		MainRightSensor.SensorRay.Touched:Connect(function(object)
			if object.Name ~= "Terrain" then
				rightmaintouching = true
			end
		end)
		MainRightSensor.SensorRay.TouchEnded:Connect(function(object)
			rightmaintouching = false
		end)
		MainLeftSensor.SensorRay.Touched:Connect(function(object)
			if object.Name ~= "Terrain" then
				leftmaintouching = true
			end
		end)
		MainLeftSensor.SensorRay.TouchEnded:Connect(function(object)
			leftmaintouching = false
		end)
	end
end)
