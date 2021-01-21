
include("hm_lib/hm_way_tl")
include("hm_lib/hm_wayobj_tl")
include("hm_lib/hm_slope_tl")
include("hm_lib/hm_sign_tl")
include("hm_lib/hm_station_tl")
include("hm_lib/hm_remove_tl")
include("hm_lib/hm_find_obj")
include("hm_lib/hm_misc_tl")

function init(pl) {
  this.player = pl
  hm_build()
  return true
}

function work(pl, pos) {
  foreach (cmd in hm_commands) {
    local err = cmd.exec(pl, pos)
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
