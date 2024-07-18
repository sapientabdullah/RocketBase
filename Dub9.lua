local configuration = {
	BodyExplosionVelocity = 30; -- Body Explosion
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


local function explode()
	if exploded == false then
		exploded = true
		Body.Explosion:Play()
		Body.ExplodeParticle.Enabled = true
		script.Parent.Ignition.Value = false
		for _,rocketpart in pairs(Body.Parent:GetDescendants()) do
			if rocketpart:IsA("BasePart") then
				rocketpart.Material = Enum.Material.CorrodedMetal
			end
			Body.Parent:BreakJoints()
		end
		
	end	
end