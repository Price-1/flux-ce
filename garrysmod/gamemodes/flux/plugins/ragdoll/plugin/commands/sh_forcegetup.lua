local COMMAND = Command("forcegetup")
COMMAND.name = "ForceGetUp"
COMMAND.description = "Forces a player to get up."
COMMAND.Syntax = "<target> [number GetUpTime]"
COMMAND.category = "roleplay"
COMMAND.Arguments = 1
COMMAND.PlayerArg = 1
COMMAND.Aliases = {"forcegetup", "plygetup"}

function COMMAND:OnRun(player, target, delay)
  delay = math.Clamp(delay or 0, 0, 60)
  target = target[1]

  if (IsValid(target) and target:Alive() and target:IsRagdolled()) then
    target:SetRagdollState(RAGDOLL_FALLENOVER)

    player:Notify(target:name().." has been unragdolled!")

    timer.Simple(delay, function()
      target:SetRagdollState(RAGDOLL_NONE)
    end)
  else
    player:Notify("This player cannot be unragdolled right now!")
  end
end

COMMAND:register()
