if Flux and Flux.initialized then return end

if SERVER then
  AddCSLuaFile()
  AddCSLuaFile 'cl_utils.lua'
  AddCSLuaFile 'sh_aliases.lua'
  AddCSLuaFile 'sh_class.lua'
  AddCSLuaFile 'sh_color.lua'
  AddCSLuaFile 'sh_debug.lua'
  AddCSLuaFile 'sh_file.lua'
  AddCSLuaFile 'sh_helpers.lua'
  AddCSLuaFile 'sh_library.lua'
  AddCSLuaFile 'sh_math.lua'
  AddCSLuaFile 'sh_player.lua'
  AddCSLuaFile 'sh_string.lua'
  AddCSLuaFile 'sh_table.lua'
  AddCSLuaFile 'sh_unit.lua'
  AddCSLuaFile 'sh_utils.lua'
  AddCSLuaFile 'sh_wrappers.lua'
end

include 'sh_aliases.lua'

include 'sh_helpers.lua'
include 'sh_string.lua'
include 'sh_table.lua'
include 'sh_math.lua'
include 'sh_utils.lua'
include 'sh_color.lua'
include 'sh_class.lua'
include 'sh_library.lua'
include 'sh_unit.lua'
include 'sh_player.lua'
include 'sh_file.lua'
include 'sh_wrappers.lua'
include 'cl_utils.lua'
include 'sh_debug.lua'
