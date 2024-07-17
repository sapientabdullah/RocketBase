local configuration = {
	LegExplosionVelocity = 110; -- Leg Explosion
	BodyExplosionVelocity = 40; -- Body Explosion
}



local Body = script.Parent:FindFirstChild("ShipBody") -- Finding The Body

local Weld = Instance.new("WeldConstraint")

for _,part in pairs(script.Parent:GetChildren()) do
	if part:IsA("BasePart") and part.Name ~= ("ShipBody") then
		local weld = Weld:Clone()
		weld.Parent = part
		weld.Part0 = part
		weld.Part1 = Body
		wait()	
		part.Anchored = false
	elseif part:IsA("BasePart") and part.Name == ("ShipBody") then
		part.Anchored = true
	end
end

local exploded = false


--Explosion Phys

local VectorForce = Instance.new("VectorForce")

local VectorForce = Instance.new("VectorForce")

local function explode()
	if exploded == false then
		exploded = true
		Body.Explosion:Play()
		Body.ExplodeParticle.Enabled = true
		script.Parent.SN1Ignition.Value = false
		script.Parent.SN2Ignition.Value = false
		script.Parent.SN3Ignition.Value = false
		for _,rocketpart in pairs(Body.Parent:GetChildren()) do
			if rocketpart:IsA("BasePart") then
				rocketpart.Material = Enum.Material.CorrodedMetal
			end
			Body.Parent:BreakJoints()
		end
		
	end	
end


shared.ExplodeCheck = game:GetService("RunService").Stepped:Connect(function()
  	if exploded == false then
			local cx,cy,cz = math.floor(Body.Velocity.X),math.floor(Body.Velocity.Y),math.floor(Body.Velocity.Z)
			local current_velocity = Vector3.new(cx,cy,cz)
			--leg portion
			for _,leg in pairs(script.Parent:GetDescendants()) do
				if leg.Name == ("Landing Leg") then
					leg.Touched:Connect(function(Obj)
						if Obj.Size.X > Body.Size.Y or Obj.Size.Y > Body.Size.Y or Obj.Size.Z > Body.Size.Y and Obj.Name ~= "Ray" and Obj.Name ~= "Mars" then
							if cx >= configuration["LegExplosionVelocity"] or cy >= configuration["LegExplosionVelocity"] or cz >= configuration["LegExplosionVelocity"] then
								explode()
							end
						end
					end)
				end
			end
			--body portion
			for _,body in pairs(script.Parent:GetDescendants()) do
				if body.Name == ("ShipBody") then
					body.Touched:Connect(function(Obj)
						if Obj.Size.X > Body.Size.Y or Obj.Size.Y > Body.Size.Y or Obj.Size.Z > Body.Size.Y and Obj.Name ~= "Ray" and Obj.Name ~= "Mars" then
							if cx >= configuration["BodyExplosionVelocity"] or cy >= configuration["BodyExplosionVelocity"] or cz >= configuration["BodyExplosionVelocity"] then
								explode()
							end
						end
					end)
				end
			end
	end
end)