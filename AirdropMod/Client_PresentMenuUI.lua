require('Utilities');

function Client_PresentMenuUI(rootParent, setMaxSize, setScrollable, game, close)
	Game = game; --make it globally accessible

	local vert = UI.CreateVerticalLayoutGroup(rootParent);

	if (game.Us ~= nil) then --don't show airdrop button to spectators
		local allTerritories = game.GameStanding.Territories;
		local turnNumber = game.GameWL.TurnNumber;
		local openTerritories = filter(allTerritories, territoryIsNeutral);

		local vert = UI.CreateVerticalLayoutGroup(rootParent);

		local row1 = UI.CreateHorizontalLayoutGroup(vert);
		UI.CreateButton(row1).SetText("Select Territory...").SetOnClick(TargetTerritoryClicked);
	end

end

function territoryIsNeutral()
   return territoryDetail.IsNeutral;
end

function TargetTerritoryClicked()
	UI.PromptFromList("Select the territory to Airdrop to", openTerritories);
end
