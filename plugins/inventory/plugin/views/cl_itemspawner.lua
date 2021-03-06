local PANEL = {}

function PANEL:Init()
  local w, h = self:GetWide(), self:GetTall()

  self.scroll_panel = vgui.Create('DScrollPanel', self)
  self.scroll_panel:Dock(FILL)

  self.layout = vgui.Create('DListLayout', self.scroll_panel)
  self.layout:Dock(FILL)

  self:rebuild()
end

function PANEL:rebuild()
  local categories = {}

  self.scroll_panel:Dock(FILL)
  self.layout:Dock(FILL)

  for id, item_table in pairs(Item.all()) do
    if !categories[item_table.category] then
      categories[item_table.category] = {}
    end

    table.insert(categories[item_table.category], { id = id, item_table = item_table })
  end

  self.layout:Clear()

  for id, category in pairs(categories) do
    local collapsible = self.layout:Add('DCollapsibleCategory')
    local list = vgui.Create('DIconLayout', self)
    collapsible:SetLabel(t(id))
    collapsible:SetContents(list)

    for k, v in ipairs(category) do
      local spawn_icon = list:Add('SpawnIcon')
      spawn_icon:SetSize(48, 48)
      spawn_icon:SetModel(v.item_table.model)
      spawn_icon:SetToolTip(t(v.item_table:get_name())..'\n'..t(v.item_table:get_description()))

      spawn_icon.DoClick = function(btn)
        MVC.push('SpawnMenu::SpawnItem', v.id)
      end
    end
  end
end

vgui.Register('fl_item_spawner', PANEL, 'fl_base_panel')
