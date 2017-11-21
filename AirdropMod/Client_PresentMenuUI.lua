require('Utilities');

function Client_PresentMenuUI(rootParent, setMaxSize, setScrollable, game, close)
	Game = game; --make it globally accessible

	local vert = UI.CreateVerticalLayoutGroup(rootParent);

	if (game.Us ~= nil) then --don't show airdrop button to spectators
		local allTerritories = game.LatestStanding.Territories;
		Dump(allTerritories);
		local turnNumber = game.Game.TurnNumber;
    	Dump(turnNumber);
		openTerritories = filter(allTerritories, territoryIsNeutral);
    	Dump(openTerritories);

		local row1 = UI.CreateHorizontalLayoutGroup(vert);
		UI.CreateButton(row1).SetText("Select Territory...").SetOnClick(TargetTerritoryClicked);
	end

end

function territoryIsNeutral(territoryDetail)
   return territoryDetail.IsNeutral;
end

function TargetTerritoryClicked()
	UI.PromptFromList("Select the territory to Airdrop to", openTerritories);
end
