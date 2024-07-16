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