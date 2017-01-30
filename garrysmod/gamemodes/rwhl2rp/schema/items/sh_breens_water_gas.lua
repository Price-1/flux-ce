--[[ 
	Rework © 2016-2017 TeslaCloud Studios
	Do not share or re-distribute before 
	the framework is publicly released.
--]]

ITEM.Base = "consumables_base";
ITEM.Name = "Sparkling Breen's Water";
ITEM.PrintName = "Sparkling Breen's Water";
ITEM.Description = "A red can filled with sparkling water."
ITEM.Model = "models/props_junk/popcan01a.mdl";
ITEM.Skin = 1;
ITEM.Weight = 0.35;
ITEM.Stackable = true;
ITEM.MaxStack = 8;
ITEM.useText = "Drink";

function ITEM:OnUse(player)
	print("Player just drank some sparkling breen's water. #brainwash");
end;