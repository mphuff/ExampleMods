require('Utilities');

function Client_PresentMenuUI(rootParent, setMaxSize, setScrollable, game, close)
	Game = game; --make it globally accessible

	local vert = UI.CreateVerticalLayoutGroup(rootParent);

	if (game.Us ~= nil) then --don't show airdrop button to spectators
		UI.CreateButton(vert).SetText("Create Airdrop").SetOnClick(function()
			game.CreateDialog(CreateAirdropDialog);
		end);
	end

end

function CreateAirdropDialog(rootParent, setMaxSize, setScrollable, game, close)
	setMaxSize(390, 300);

	local allTerritories = game.GameStanding.Territories;
	local turnNumber = game.GameWL.TurnNumber;
	local openTerritories = filter(allTerritories, function(territoryDetail) {
		return territoryDetail.IsNeutral
	});

	local vert = UI.CreateVerticalLayoutGroup(rootParent);

	local row1 = UI.CreateHorizontalLayoutGroup(vert);
	AirdropButton = UI.CreateButton(row1).SetText("Select Territory...").SetOnClick(TargetTerritoryClicked);
end

function TargetTerritoryClicked()
	UI.PromptFromList("Select the territory to Airdrop to", openTerritories);
end
