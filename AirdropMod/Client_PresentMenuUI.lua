require('Utilities');

function Client_PresentMenuUI(rootParent, setMaxSize, setScrollable, game, close)
	Game = game; --make it globally accessible

	local vert = UI.CreateVerticalLayoutGroup(rootParent);

	if (game.Us ~= nil) then --don't show airdrop button to spectators
		standing = game.LatestStanding
    if (standing ~= nil) then
      print("Standing was NOT nil")
      territories = standing.Territories;
      Dump(territories);
    else
      print("Standing was nil");
    end
    
		local turnNumber = game.Game.TurnNumber;
    --Dump(turnNumber);
		--openTerritories = filter(allTerritories, territoryIsNeutral);
    --Dump(openTerritories);

		local row1 = UI.CreateHorizontalLayoutGroup(vert);
		--UI.CreateButton(row1).SetText("Select Territory...").SetOnClick(TargetTerritoryClicked);
    UI.CreateLabel(row1).SetText("Current turn number: " .. turnNumber);
  end

end

function territoryIsNeutral(territoryDetail)
   return territoryDetail.IsNeutral;
end

function TargetTerritoryClicked()
	UI.PromptFromList("Select the territory to Airdrop to", openTerritories);
end
