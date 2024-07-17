local neutral_thrust = 0

game:GetService("RunService").Heartbeat:Connect(function()
	neutral_thrust = script.Parent["Neutral Thrust"].Value
	for _,x in pairs(script.Parent["Thrust Ram"]:GetDescendants()) do 
		if x:IsA("VectorForce") then 
			x.Force = Vector3.new(0,neutral_thrust,0)
			x.Attachment0 = x.Parent
		end 
	end
end)

script.Parent.Ignition:GetPropertyChangedSignal("Value"):Connect(function()
	if script.Parent.Ignition.Value == true then
		for _,x in pairs(script.Parent["Thrust Ram"]:GetDescendants()) do 
			if x:IsA("PointLight") or x:IsA("ParticleEmitter") or x:IsA("VectorForce") then 
				x.Enabled = true
			elseif x:IsA("Sound") then
				x:Play()
			end 
		end