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