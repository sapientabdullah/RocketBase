
local StaticIgnition = script.Parent.StaticIgnition
local neutral_thrust = 0
local vacuum_thrust = 0
local SN1Ignition = script.Parent.SN1Ignition
local sn1active = false
local SN2Ignition = script.Parent.SN2Ignition
local sn2active = false
local SN3Ignition = script.Parent.SN3Ignition
local sn3active = false
local Throttle = script.Parent.Throttle
game:GetService("RunService").Heartbeat:Connect(function()
	neutral_thrust = script.Parent["Neutral Thrust"].Value
	vacuum_thrust = script.Parent["Vacuum Thrust"].Value
	
end)

SN1Ignition:GetPropertyChangedSignal("Value"):Connect(function()
	if SN1Ignition.Value == true then
		--propulsion on
		for _,engine in pairs(script.Parent:GetChildren()) do
			if engine.Name == ("Raptor Engine") then
				if engine:FindFirstChild("SerialNumber").Value == 1 then
					for _,thrust in pairs(engine:GetChildren()) do
						if thrust.Name == ("Thrust") then
							thrust.Sound:Play()
							thrust.Light.Enabled = true
							thrust.Afterburner.Enabled = true
							game:GetService("RunService").Heartbeat:Connect(function()
								thrust.VectorForce.Force = Vector3.new(0,-neutral_thrust*script.Parent.Throttle.Value,0)
								thrust.Afterburner.Lifetime = NumberRange.new(script.Parent.Throttle.Value,script.Parent.Throttle.Value)
							end)
							thrust.VectorForce.Enabled = true
						end
				end
			end
		end
	end
	elseif SN1Ignition.Value == false then
			--propulsion off
			for _,engine in pairs(script.Parent:GetChildren()) do
				if engine.Name == ("Raptor Engine") then
					if engine:FindFirstChild("SerialNumber").Value == 1 then
						for _,thrust in pairs(engine:GetChildren()) do
							if thrust.Name == ("Thrust") then
								thrust.Sound:Stop()
								thrust.Light.Enabled = false
								thrust.Afterburner.Enabled = false
								thrust.VectorForce.Enabled = false
						end
						end
					end
				end
			end
	end
end)
SN2Ignition:GetPropertyChangedSignal("Value"):Connect(function()
	if SN2Ignition.Value == true then
		--propulsion on
		for _,engine in pairs(script.Parent:GetChildren()) do
			if engine.Name == ("Raptor Engine") then
				if engine:FindFirstChild("SerialNumber").Value == 2 then
					for _,thrust in pairs(engine:GetChildren()) do
						if thrust.Name == ("Thrust") then
							thrust.Sound:Play()
							thrust.Light.Enabled = true
							thrust.Afterburner.Enabled = true
							game:GetService("RunService").Heartbeat:Connect(function()
								thrust.VectorForce.Force = Vector3.new(0,-neutral_thrust*script.Parent.Throttle.Value,0)
								thrust.Afterburner.Lifetime = NumberRange.new(script.Parent.Throttle.Value,script.Parent.Throttle.Value)
							end)
							thrust.VectorForce.Enabled = true
						end
					end
				end
			end
		end
	elseif SN2Ignition.Value == false then
		--propulsion off
		for _,engine in pairs(script.Parent:GetChildren()) do
			if engine.Name == ("Raptor Engine") then
				if engine:FindFirstChild("SerialNumber").Value == 2 then
					for _,thrust in pairs(engine:GetChildren()) do
						if thrust.Name == ("Thrust") then
							thrust.Sound:Stop()
							thrust.Light.Enabled = false
							thrust.Afterburner.Enabled = false
							thrust.VectorForce.Enabled = false
						end
					end
				end
			end
		end
	end
end)
SN3Ignition:GetPropertyChangedSignal("Value"):Connect(function()
	if SN3Ignition.Value == true then
		--propulsion on
		for _,engine in pairs(script.Parent:GetChildren()) do
			if engine.Name == ("Raptor Engine") then
				if engine:FindFirstChild("SerialNumber").Value == 3 then
					for _,thrust in pairs(engine:GetChildren()) do
						if thrust.Name == ("Thrust") then
							thrust.Sound:Play()
							thrust.Light.Enabled = true
							thrust.Afterburner.Enabled = true
							game:GetService("RunService").Heartbeat:Connect(function()
								thrust.VectorForce.Force = Vector3.new(0,-neutral_thrust*script.Parent.Throttle.Value,0)
								thrust.Afterburner.Lifetime = NumberRange.new(script.Parent.Throttle.Value,script.Parent.Throttle.Value)
							end)
							thrust.VectorForce.Enabled = true
						end
					end
				end
			end
		end
elseif SN3Ignition.Value == false then
		--propulsion off
		for _,engine in pairs(script.Parent:GetChildren()) do
			if engine.Name == ("Raptor Engine") then
				if engine:FindFirstChild("SerialNumber").Value == 3 then
					for _,thrust in pairs(engine:GetChildren()) do
						if thrust.Name == ("Thrust") then
							thrust.Sound:Stop()
							thrust.Light.Enabled = false
							thrust.Afterburner.Enabled = false
							thrust.VectorForce.Enabled = false
						end
					end
				end
			end
		end
	end
end)
local SN4Ignition = script.Parent.SN4Ignition
local sn4active = false
local SN5Ignition = script.Parent.SN5Ignition
local sn5active = false
local SN6Ignition = script.Parent.SN6Ignition
local sn6active = false


SN4Ignition:GetPropertyChangedSignal("Value"):Connect(function()
	if SN4Ignition.Value == true then
		--propulsion on
		for _,engine in pairs(script.Parent:GetChildren()) do
			if engine.Name == ("Raptor Engine") then
				if engine:FindFirstChild("SerialNumber").Value == 4 then
					for _,thrust in pairs(engine:GetChildren()) do
						if thrust.Name == ("Thrust") then
							thrust.Sound:Play()
							thrust.Light.Enabled = true
							thrust.Afterburner.Enabled = true
							game:GetService("RunService").Heartbeat:Connect(function()
								thrust.VectorForce.Force = Vector3.new(0,-vacuum_thrust,0)
							end)
							thrust.VectorForce.Enabled = true
						end
					end
				end
			end
		end
	elseif SN4Ignition.Value == false then
		--propulsion off
		for _,engine in pairs(script.Parent:GetChildren()) do
			if engine.Name == ("Raptor Engine") then
				if engine:FindFirstChild("SerialNumber").Value == 4 then
					for _,thrust in pairs(engine:GetChildren()) do
						if thrust.Name == ("Thrust") then
							thrust.Sound:Stop()
							thrust.Light.Enabled = false
							thrust.Afterburner.Enabled = false
							thrust.VectorForce.Enabled = false
						end
					end
				end
			end
		end
	end
end)
SN5Ignition:GetPropertyChangedSignal("Value"):Connect(function()
	if SN5Ignition.Value == true then
		--propulsion on
		for _,engine in pairs(script.Parent:GetChildren()) do
			if engine.Name == ("Raptor Engine") then
				if engine:FindFirstChild("SerialNumber").Value == 5 then
					for _,thrust in pairs(engine:GetChildren()) do
						if thrust.Name == ("Thrust") then
							thrust.Sound:Play()
							thrust.Light.Enabled = true
							thrust.Afterburner.Enabled = true
							game:GetService("RunService").Heartbeat:Connect(function()
								thrust.VectorForce.Force = Vector3.new(0,-vacuum_thrust,0)
							end)
							thrust.VectorForce.Enabled = true
						end
					end
				end
			end
		end
	elseif SN5Ignition.Value == false then
		--propulsion off
		for _,engine in pairs(script.Parent:GetChildren()) do
			if engine.Name == ("Raptor Engine") then
				if engine:FindFirstChild("SerialNumber").Value == 5 then
					for _,thrust in pairs(engine:GetChildren()) do
						if thrust.Name == ("Thrust") then
							thrust.Sound:Stop()
							thrust.Light.Enabled = false
							thrust.Afterburner.Enabled = false
							thrust.VectorForce.Enabled = false
						end
					end
				end
			end
		end
	end
end)