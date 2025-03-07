local CurrentCapturedVelocity = 0
local CurrentCapturedPosition = 0
local CurrentCapturedOrientation = 0
local CurrentSpeed = script.Parent.CurrentSpeed
local SteerAngle = script.Parent.Body.SW.SWF.HingeConstraint
local CanTrace = false
local CurrentRoad = nil
local GotRoad = false
local SteerMagnitude = 0
local CurrentSensor = script.Parent.Body.Sensors.CurrentSensor
local MainSensor = script.Parent.Body.Sensors.MainSensor
local EngageABS = 10
local slowingdown = false
local speedingup = false
local cautionspeed = 20
local speedlimit = 35

local function slowdown()
	while slowingdown do
		if script.Parent.CurrentSpeed.Value > cautionspeed then
			script.Parent.CurrentSpeed.Value -= 1
		end
		wait(0.03)
	end
end

local function speedup()
	while speedingup do
		if script.Parent.CurrentSpeed.Value < speedlimit then
			script.Parent.CurrentSpeed.Value += 1
		end
		wait(0.1)
	end
end

game:GetService("RunService").Heartbeat:Connect(function()
	if script.Parent.Power.Value == true then
		CurrentCapturedOrientation = script.Parent.Wheels.FL.Arm.Orientation.Y or script.Parent.Wheels.FR.Arm.Orientation.Y
		if CurrentSensor:FindFirstChild("SensorRay") and CanTrace == false then
			CanTrace = true
			CurrentSensor.SensorRay.Touched:Connect(function(object)
				if object.Name ~= "Terrain" then
					if object.Name == "Road" then
						CurrentRoad = object
						
					elseif object.Name == "Road" then
						CurrentRoad = nil
					end
				end
			end)
		end
		if MainSensor:FindFirstChild("SensorRay") then
			MainSensor.SensorRay.Touched:Connect(function(object)
				if object.Name == "Road" then
					local magnitude = (script.Parent.Body.Weight.Position - object.Position).Magnitude
					if magnitude < script.Parent.Body.Weight.AssemblyLinearVelocity.X + script.Parent.Body.Weight.AssemblyLinearVelocity.Z then
						local steermagnitude = (object.Orientation.Y - CurrentCapturedOrientation)
						if steermagnitude > EngageABS or steermagnitude < -EngageABS then
							if slowingdown == false then
								speedingup = false
								slowingdown = true
								slowdown()
							end
						elseif steermagnitude < EngageABS or steermagnitude > -EngageABS then
							if speedingup == false then
								slowingdown = false
								speedingup = true
								speedup()
							end
						end
					end
				end
			end)
		end
		
	end
	if CurrentRoad ~= nil then
		SteerAngle.TargetAngle = CurrentRoad.Orientation.Y - CurrentCapturedOrientation
	elseif CurrentRoad == nil then
	end
end)
local function RoadTrace(Road)
	if not Road:FindFirstChild("MiddleLine") then
		local MiddleLine = Instance.new("Part", Road)
		MiddleLine.Name = "MiddleLine"
		MiddleLine.Anchored = true
		MiddleLine.Material = Enum.Material.Neon
		MiddleLine.CanCollide = false
		MiddleLine.Transparency = 1
		MiddleLine.Color = Color3.fromRGB(255, 255, 0)
		MiddleLine.CFrame = Road.CFrame + Vector3.new(0,Road.Size.Y,0)
		MiddleLine.Size = Vector3.new(0.1,Road.Size.Y,Road.Size.Z)
	end
	if not Road:FindFirstChild("LeftLine") then
		local LeftLine = Instance.new("Part", Road)
		LeftLine.Name = "LeftLine"
		LeftLine.Anchored = true
		LeftLine.Material = Enum.Material.Neon
		LeftLine.CanCollide = false
		LeftLine.Transparency = 1
		LeftLine.Color = Color3.fromRGB(255, 255, 0)
		LeftLine.CFrame = Road.CFrame + Vector3.new(-Road.Size.X/2,Road.Size.Y,0)
		LeftLine.Size = Vector3.new(0.1,Road.Size.Y,Road.Size.Z)
	end
	if not Road:FindFirstChild("RightLine") then
		local RightLine = Instance.new("Part", Road)
		RightLine.Name = "RightLine"
		RightLine.Anchored = true
		RightLine.Material = Enum.Material.Neon
		RightLine.CanCollide = false
		RightLine.Transparency = 1
		RightLine.Color = Color3.fromRGB(255, 255, 0)
		RightLine.CFrame = Road.CFrame + Vector3.new(-Road.Size.X/2,Road.Size.Y,0)
		RightLine.Size = Vector3.new(0.1,Road.Size.Y,Road.Size.Z)
	end
	Road.TouchEnded:Connect(function(object)
		if object.Parent.Name == "CurrentSensor" then
			if Road:FindFirstChild("LeftLine") then
				Road.LeftLine:Destroy()
			end
			if Road:FindFirstChild("RightLine") then
				Road.RightLine:Destroy()
			end
			CurrentRoad = nil
		end
	end)
end

game:GetService("RunService").Heartbeat:Connect(function()
	if CurrentRoad ~= nil then
		GotRoad = true
	elseif CurrentRoad == nil then
		GotRoad = false
	end
	if GotRoad == true then
		RoadTrace(CurrentRoad)
	end
end)