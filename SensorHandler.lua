local xvel = 0
local zvel = 0

local function createSensorRay(Sensor)
	if Sensor.Name == "Sensor" then
		local SensorRay = Instance.new("Part")
		SensorRay.Name = "SensorRay"
		SensorRay.Anchored = true
		SensorRay.CanCollide = false
		SensorRay.Locked = true
		SensorRay.Parent = Sensor
		SensorRay.Size = Sensor.Size + Vector3.new(7.5,0,0)
		SensorRay.CFrame = Sensor.CFrame * CFrame.new(-SensorRay.Size.X/2,0,0)
		local WeldConstraint = Instance.new("WeldConstraint", SensorRay)
		WeldConstraint.Part0 = SensorRay
		WeldConstraint.Part1 = Sensor
		SensorRay.Anchored = false
		SensorRay.Color = Color3.fromRGB(132, 123, 255)
		SensorRay.Transparency = 1
		SensorRay.Material = Enum.Material.Neon
		
		local PhysProperties = PhysicalProperties.new(0,0,0,0,0)
		SensorRay.CustomPhysicalProperties = PhysProperties
		SensorRay.Massless = true
	elseif Sensor.Name == "MainSensor" then
		local SensorRay = Instance.new("Part")
		SensorRay.Name = "SensorRay"
		SensorRay.CanCollide = false
		SensorRay.Locked = true
		SensorRay.Parent = Sensor
		SensorRay.Anchored = true
		SensorRay.Size = Sensor.Size + Vector3.new(250,4,0)
		SensorRay.Color = Color3.fromRGB(255, 26, 95)
		SensorRay.Transparency = 1
		SensorRay.Material = Enum.Material.Neon
		SensorRay.CFrame = Sensor.CFrame * CFrame.new(-SensorRay.Size.X/2,-SensorRay.Size.Y/2,0) * CFrame.new(0,Sensor.Size.Y/2,0)
		local WeldConstraint = Instance.new("WeldConstraint", SensorRay)
		WeldConstraint.Part0 = SensorRay
		WeldConstraint.Part1 = Sensor
		SensorRay.Anchored = false
		local PhysProperties = PhysicalProperties.new(0,0,0,0,0)
		SensorRay.CustomPhysicalProperties = PhysProperties
		SensorRay.Massless = true
	elseif Sensor.Name == "CurrentSensor" then
		script.Parent.PowerOn:Play()
		local SensorRay = Instance.new("Part")
		SensorRay.Name = "SensorRay"
		SensorRay.Anchored = true
		SensorRay.CanCollide = false
		SensorRay.Locked = true
		SensorRay.Parent = Sensor
		SensorRay.Size = Sensor.Size + Vector3.new(7,3,0)
		SensorRay.CFrame = Sensor.CFrame * CFrame.new(-SensorRay.Size.X/2,-SensorRay.Size.Y/2,0) * CFrame.new(0,Sensor.Size.Y/2,0)
		local WeldConstraint = Instance.new("WeldConstraint", SensorRay)
		WeldConstraint.Part0 = SensorRay
		WeldConstraint.Part1 = Sensor
		SensorRay.Anchored = false
		SensorRay.Color = Color3.fromRGB(11, 55, 255)
		SensorRay.Transparency = 1
		SensorRay.Material = Enum.Material.Neon
		
		local PhysProperties = PhysicalProperties.new(0,0,0,0,0)
		SensorRay.CustomPhysicalProperties = PhysProperties
		SensorRay.Massless = true
	end
end

for _,Sensor in pairs(script.Parent.Body.Sensors:GetChildren()) do
	if Sensor.Name == "Sensor" or Sensor.Name == "MainSensor" or Sensor.Name == "CurrentSensor" and Sensor:IsA("BasePart") then
		createSensorRay(Sensor)
	end
end

