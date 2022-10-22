local Selection = game:GetService("Selection")
local ChangeHistoryService = game:GetService("ChangeHistoryService")
local toolbar = plugin:CreateToolbar("Anti-Leak Script Adder")
local newScriptButton = toolbar:CreateButton("Create a Anti-Leak Script","Create a Anti-Leak Script","rbxassetid://4458901886") 
local newScriptButton3 = toolbar:CreateButton("Delete all Anti-Leak scripts","Delete all Anti-Leak scripts","rbxassetid://11348790064")
newScriptButton3.ClickableWhenViewportHidden = true

newScriptButton.Click:Connect(function()
	local selectedObjects = Selection:Get()
	if #selectedObjects > 0 then
		for i,objects in pairs(selectedObjects) do
			local scr = Instance.new("Script")
			scr.Parent = objects
			wait()
			scr.Source = 'game.Players.PlayerAdded:Connect(function(plr)		if game.PlaceId ~= '..game.PlaceId..' then		plr:Kick("Ce jeu utilise des contenus leak")	end	end)'
		end
		ChangeHistoryService:SetWaypoint("Added new Anti-Leak scripts")
	end
end)
newScriptButton3.Click:Connect(function()
	for i, scrs in pairs(game:GetDescendants()) do
		if scrs:IsA("Script") then
			if scrs.Source == 'game.Players.PlayerAdded:Connect(function(plr)		if game.PlaceId ~= '..game.PlaceId..' then		plr:Kick("Ce jeu utilise des contenus leak")	end	end)' then
				scrs:Destroy()
			end
		end
	end
end)