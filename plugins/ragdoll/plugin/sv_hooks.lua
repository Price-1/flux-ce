function PLUGIN:PlayerDeath(player)
  player:reset_action()
  player:set_ragdoll_state(RAGDOLL_DUMMY)
end

function PLUGIN:PlayerSpawn(player)
  player:set_ragdoll_state(RAGDOLL_NONE)
end

function PLUGIN:PlayerThink(player)
  if !player:Alive() and player:is_ragdolled() then
    hook.run('PlayerDeathThink', player)
  end
end
