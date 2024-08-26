
local Weld = Instance.new("WeldConstraint")

for _,part in pairs(script.Parent:GetChildren()) do
	if part:IsA("BasePart") and part.Name ~= ("EngineBase") and part.Name ~= ("HingePart") then
		local weld = Weld:Clone()
		weld.Parent = part
		weld.Part0 = part
		weld.Part1 = script.Parent.EngineBase
		wait()	
		part.Anchored = false
	elseif part:IsA("BasePart") and part.Name == ("EngineBase") or part.Name == ("HingePart") then
		part.Anchored = false
	end
end