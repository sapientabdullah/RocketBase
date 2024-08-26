
Factor = -0.1

--Global Definitions
p = script.Parent
f = Instance.new("BodyThrust")
f.Name = ("Force")
vector = Vector3.new

--Area calculations
front = p.Size.x * p.Size.y
side  = p.Size.z * p.Size.y
top	= p.Size.x * p.Size.z

--Functions
function relpos(x, y)
	local HitPos = x
	local CJ = CFrame.new(HitPos) 
	local C0 = CFrame.new(-x) * CJ
	local C1 = y.CFrame:inverse() * CJ
	local ReturnCF = C0 * (C1:inverse())
	return ReturnCF:inverse().p
end

function pn(x)
	if (x > 0) then return 1 end
	if (x < 0) then return -1 end
	return 0
end

--Main
game:GetService("RunService").Heartbeat:Connect(function()
	local fr
	local tr
	local sr
	local vp
	if (workspace:findFirstChild("Wind")) then
		fr = ((p.Velocity + workspace.Wind.Value) * p.CFrame.lookVector).magnitude * front
		tr = ((p.Velocity + workspace.Wind.Value) * (p.CFrame * CFrame.Angles(math.rad(90),0,0)).lookVector).magnitude * top
		sr = ((p.Velocity + workspace.Wind.Value) * (p.CFrame * CFrame.Angles(0,math.rad(90),0)).lookVector).magnitude * side
		vp = relpos(p.Position + p.Velocity + workspace.Wind.Value,p)
	else
		fr = (p.Velocity * p.CFrame.lookVector).magnitude * front
		tr = (p.Velocity * (p.CFrame * CFrame.Angles(math.rad(90),0,0)).lookVector).magnitude * top
		sr = (p.Velocity * (p.CFrame * CFrame.Angles(0,math.rad(90),0)).lookVector).magnitude * side
		vp = relpos(p.Position + p.Velocity,p)
	end
	local vpx = pn(vp.x)
	local vpy = pn(vp.y)
	local vpz = pn(vp.z)
	f.force = vector(sr * vpx,tr * vpy,fr * vpz) * Factor * p:GetMass()
end)
