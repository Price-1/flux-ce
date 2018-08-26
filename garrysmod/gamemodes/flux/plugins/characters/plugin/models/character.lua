ActiveRecord.define_model('Character', function(t)
  t:string { 'steam_id', null = false }
  t:string { 'name', null = false }
  t:string 'model'
  t:text 'phys_desc'
  t:integer 'money'
end)

Character:belongs_to 'Player'
Character:has_many 'data'
Character:has_one 'inventory'
Character:has_one 'ammo'

function Character:init()
  hook.Run("RestoreCharacter", self.player, self.id, self)
end
