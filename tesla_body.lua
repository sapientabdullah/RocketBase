for _,x in pairs(script.Parent:GetDescendants()) do
	if x.Name ~= "SW" and x.Name ~= "SWF" and x.Name ~= "CentralPart" and x.Name ~= "Hood" and x.Name ~= "TeslaLogo" and x.Name ~= "HingePart" then
		if x:IsA("BasePart") or x:IsA("MeshPart") then
			local weld = Instance.new("WeldConstraint",x)
			weld.Part0 = x
			weld.Part1 = script.Parent.Parent.CentralPart
			x.Anchored = false
		end
	elseif x.Name == "CentralPart" then
		x.Anchored = false
		x:SetNetworkOwner(nil)
	end
end
game:GetService("RunService").Heartbeat:Connect(function()
	for _,seat in pairs(script.Parent:GetChildren()) do
		if seat:IsA("Seat") then
			local occupant = nil
			if seat.Occupant ~= nil then
				occupant = seat.Occupant
				if occupant ~= nil then
					for _,part in pairs(seat.Occupant.Parent:GetDescendants()) do
						if part:IsA("BasePart") or part:IsA("MeshPart") then
							local PhysProperties = PhysicalProperties.new(0,0.3,0,1,0)
							part.CustomPhysicalProperties = PhysProperties
							part.Massless = true
						end
					end
				elseif seat.Occupant == nil then
					occupant = nil
				end
			end
		end
	end
	for _,character in pairs(workspace:GetChildren()) do
		if character:FindFirstChild("Humanoid") then
			if character.Humanoid.Jump == true then
				delay(0.5, function()
					for _,part in pairs(character:GetDescendants()) do
						if part:IsA("BasePart") or part:IsA("MeshPart") then
							local PhysProperties = PhysicalProperties.new(0.7,0.3,0,1,0)
							part.CustomPhysicalProperties = PhysProperties
							part.Massless = false
						end
					end
				end)
			end
		end
	end
end)

