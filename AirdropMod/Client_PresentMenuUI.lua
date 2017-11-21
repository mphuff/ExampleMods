require('Utilities');

function Client_PresentMenuUI(rootParent, setMaxSize, setScrollable, game, close)
	Game = game; --make it globally accessible

	if (game.Us ~= nil) then --don't show airdrop button to spectators
    local vert = UI.CreateVerticalLayoutGroup(rootParent);
    local turnNumber = game.Game.TurnNumber;
    local row1 = UI.CreateHorizontalLayoutGroup(vert);
    UI.CreateLabel(row1).SetText("Airdrop armies to this territory: ");
    TargetTerritoryBtn = UI.CreateButton(row1).SetText("Select source territory...").SetOnClick(TargetTerritoryClicked);
    

  end

end

function TargetTerritoryClicked()
	local options = map(filter(Game.LatestStanding.Territories, function(t) return t.IsNeutral end), TerritoryButton);
	UI.PromptFromList("Select the territory you'd like to take armies from", options);
end

function TerritoryButton(terr)
	local name = Game.Map.Territories[terr.ID].Name;
	local ret = {};
	ret["text"] = name;
	ret["selected"] = function()
		TargetTerritoryBtn.SetText(name);
		TargetTerritoryID = terr.ID;

		CheckCreateFinalStep();
	end
	return ret;
end

function CheckCreateFinalStep()
	if (SubmitBtn == nil) then

		local row3 = UI.CreateHorizontalLayoutGroup(vert);
		UI.CreateLabel(row3).SetText(Game.Game.TurnNumber .. " armies will be airdropped");

		SubmitBtn = UI.CreateButton(vert).SetText("Gift").SetOnClick(SubmitClicked);
	end
end

function SubmitClicked()
	local msg = 'Airdropping ' .. Game.Game.TurnNumber .. ' armies';
  print(msg)

	--local payload = 'GiftArmies_' .. NumArmiesInput.GetValue() .. ',' .. TargetTerritoryID .. ',' .. TargetPlayerID;

	--local orders = Game.Orders;
	--table.insert(orders, WL.GameOrderCustom.Create(Game.Us.ID, msg, payload));
	--Game.Orders = orders;
end

