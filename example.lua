local RunService = game:GetService("RunService");

local Player = game.Players.LocalPlayer
local Character = script.Parent

Character.Humanoid.BreakJointsOnDeath = false;

Character:WaitForChild("IsRagdoll"):GetPropertyChangedSignal("Value"):Connect(function()
	if Character:WaitForChild("IsRagdoll").Value == true then
		for _, v in pairs(Character:GetDescendants()) do
			if v:IsA("Motor6D") then
				v.Enabled = false;
				
				local a0, a1 = Instance.new("Attachment"), Instance.new("Attachment")
				a0.CFrame = v.C0
				a1.CFrame = v.C1
				a0.Parent = v.Part0
				a1.Parent = v.Part1

				local b = Instance.new("BallSocketConstraint")
				b.Attachment0 = a0
				b.Attachment1 = a1
				b.Parent = v.Parent
			end
		end
	elseif Character:WaitForChild("IsRagdoll").Value == false then
		for _, v in pairs(Character:GetDescendants()) do
			if v:IsA("BallSocketConstraint") then
				v:Destroy()
			end
			
			if v:IsA("Attachment") then
				v:Destroy()
			end
			
			if v:IsA("Motor6D") then
				v.Enabled = true;
			end
		end
	end
end)
