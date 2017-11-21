require('Utilities');

function Client_PresentMenuUI(rootParent, setMaxSize, setScrollable, game, close)
	Game = game; --make it globally accessible

	local vert = UI.CreateVerticalLayoutGroup(rootParent);

	if (game.Us ~= nil) then --don't show propose button to spectators
		UI.CreateButton(vert).SetText("Create Airdrop").SetOnClick(function()
			game.CreateDialog(CreateAirdropDialog);
		end);
	end

end

function CreateAirdropDialog(rootParent, setMaxSize, setScrollable, game, close)
	setMaxSize(390, 300);

	local vert = UI.CreateVerticalLayoutGroup(rootParent);
	
	local row1 = UI.CreateHorizontalLayoutGroup(vert);
	UI.CreateLabel(row1).SetText("Select territory to airdrop to: ");

end

