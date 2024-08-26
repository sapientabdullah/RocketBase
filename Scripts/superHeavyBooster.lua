local configuration = {
	LegExplosionVelocity = 300; 
	BodyExplosionVelocity = 25; 
}

local Body = script.Parent:FindFirstChild("ShipBody") 

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

local function explode()
	if exploded == false then
		exploded = true
		Body.Explosion:Play()
		Body.ExplodeParticle.Enabled = true
		for _,rocketpart in pairs(Body.Parent:GetDescendants()) do
			if rocketpart:IsA("BasePart") then
				rocketpart.Material = Enum.Material.CorrodedMetal
				rocketpart.CanCollide = false
			end
		end
		for _,scriptx in pairs(script.Parent:GetDescendants()) do
			if scriptx:IsA("Script") then
				scriptx:Destroy()
			end
		end
		Body:BreakJoints()
		delay(0.75, function()
			Body:Destroy()
		end)
	end	
end

shared.ExplodeCheck = game:GetService("RunService").Stepped:Connect(function()
	if exploded == false then
			local cx,cy,cz = math.floor(Body.Velocity.X),math.floor(Body.Velocity.Y),math.floor(Body.Velocity.Z)
			local current_velocity = Vector3.new(cx,cy,cz)
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
