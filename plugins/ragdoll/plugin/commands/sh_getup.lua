COMMAND.name = 'GetUp'
COMMAND.description = 'command.getup.description'
COMMAND.syntax = 'command.getup.syntax'
COMMAND.category = 'permission.categories.roleplay'
COMMAND.aliases = { 'chargetup', 'unfall', 'unfallover' }
COMMAND.no_console = true

function COMMAND:on_run(player, delay)
  delay = math.clamp(tonumber(delay) or 0, 4, 60)

  if player:Alive() and player:is_ragdolled() then
    player:set_nv('getup_end', CurTime() + delay)
    player:set_nv('getup_time', delay)
    player:set_action('getup', true)

    timer.simple(delay, function()
      if IsValid(player) and player:Alive() and player:is_ragdolled() then
        player:set_ragdoll_state(RAGDOLL_NONE)

        player:reset_action()
      end
    end)
  else
    player:notify('error.cant_now')
  end
end
