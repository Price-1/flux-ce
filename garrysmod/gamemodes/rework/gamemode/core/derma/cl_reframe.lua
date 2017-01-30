--[[ 
	Rework © 2016-2017 TeslaCloud Studios
	Do not share or re-distribute before 
	the framework is publicly released.
--]]

local PANEL = {};

function PANEL:Init()
	self:SetTitle("Rework Frame");
	self:SetMainColor(Color(55, 55, 55, 235));
	self:SetAccentColor(Color(90, 90, 190));

	self.btnClose = vgui.Create("reButton", self);
	self.btnClose:SetSize(20, 20);
	self.btnClose:SetPos(0, 0);
	self.btnClose:SetIcon("fa-times");
	self.btnClose:SetText("");
	self.btnClose:SetDrawBackground(false);
	self.btnClose.DoClick = function(button)
		self:SetVisible(false);
		self:Remove();
	end;
end;

function PANEL:Paint(w, h)
	return theme.Hook("PaintFrame", self, w, h);
end;

function PANEL:Think()
	local w, h = self:GetSize();

	if (IsValid(self.btnClose)) then
		self.btnClose:SetPos(w - 20, 0);
	end;

	theme.Hook("FrameThink");
end;

vgui.Register("rwFrame", PANEL, "rwBasePanel");