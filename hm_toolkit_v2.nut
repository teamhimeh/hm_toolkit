
include("hm_lib/hm_way_tl")
include("hm_lib/hm_wayobj_tl")
include("hm_lib/hm_slope_tl")
include("hm_lib/hm_sign_tl")
include("hm_lib/hm_station_tl")
include("hm_lib/hm_remove_tl")


function init(player) {
  hm_build()
  return true
}

function work(player, pos) {
  foreach (cmd in hm_commands) {
    local err = cmd.exec(player, pos)
    if(err!=null && err.len()>0) {
      return err
    }
  }
  return null
}

function exit(pl)
{
	return true
}
