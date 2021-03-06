﻿COMMAND.name = 'CharAttributeMultiplier'
COMMAND.description = 'command.charattributemultiplier.description'
COMMAND.syntax = 'command.charattributemultiplier.syntax'
COMMAND.permission = 'moderator'
COMMAND.category = 'permission.categories.character_management'
COMMAND.arguments = 4
COMMAND.player_arg = 1
COMMAND.aliases = { 'multiplierattribute', 'attmultiplier', 'attributemult', 'attributemultiplier', 'charattmult' }

function COMMAND:get_description()
  return t(self.description, { attributes = table.concat(table.get_keys(Attributes.get_stored()), ', ') })
end

function COMMAND:on_run(player, targets, attribute_id, value, duration)
  attribute_id = attribute_id:to_id()

  local attribute = Attributes.find(attribute_id)
  duration = Bolt:interpret_ban_time(duration)
  value = tonumber(value)

  if !isnumber(duration) then
    player:notify('error.invalid_time', {
      time = tostring(duration)
    })

    return
  end

  if !value then
    player:notify('error.invalid_value')

    return
  end

  if attribute and attribute.multipliable then
    for k, v in ipairs(targets) do
      v:notify('notification.attribute.multiplier', {
        attribute = attribute.name,
        value = value,
        time = Flux.Lang:nice_time(duration)
      })
      v:boost_attribute(attribute_id, value, duration)
    end

    self:notify_staff('command.charattributemultiplier.message', {
      player = get_player_name(player),
      target = util.player_list_to_string(targets),
      attribute = attribute.name,
      value = value,
      time = Flux.Lang:nice_time(duration)
    })
  else
    player:notify('error.attribute_not_valid', { attribute = attribute_id })
  end
end
