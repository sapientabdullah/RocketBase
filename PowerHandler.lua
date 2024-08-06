local power = false
game:GetService("RunService").Heartbeat:Connect(function()
	if script.Parent.Power.Value == true and power == false then
		power = true
		for _,x in pairs(script.Parent.Body.RealLights:GetDescendants()) do
			if x:IsA("SpotLight") then
			x.Enabled = true
		elseif x:IsA("BasePart") or x:IsA("MeshPart") then
			x.Material = Enum.Material.Neon
			end
		end
		script.Parent.Body.SW.SWF.Material = Enum.Material.Neon
		script.Parent.Body.SW.SWF.Color = Color3.fromRGB(255, 255, 255)
		script.Parent.SensorHandler.Disabled = false
		
	elseif script.Parent.Power.Value == false then
		power = false
		for _,x in pairs(script.Parent.Body.RealLights:GetDescendants()) do
			if x:IsA("SpotLight") then
				x.Enabled = false
			elseif x:IsA("BasePart") or x:IsA("MeshPart") then
				x.Material = Enum.Material.SmoothPlastic
			end
		end
		script.Parent.SensorHandler.Disabled = true
		script.Parent.Body.SW.SWF.Material = Enum.Material.SmoothPlastic
		script.Parent.Body.SW.SWF.Color = Color3.fromRGB(27, 27, 27)
		wait()
		script.Parent.Body.SW.SWF.HingeConstraint.TargetAngle = 0
		script.Parent.CurrentSpeed.Value = 0
	end
	
	
	if script.Parent.SensorHandler.Disabled == true then
		for _,sensorray in pairs(script.Parent.Body.Sensors:GetDescendants()) do
			if sensorray.Name == "SensorRay" then
				sensorray:Destroy()
			end
		end
	end
	
end)