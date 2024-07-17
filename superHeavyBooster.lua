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