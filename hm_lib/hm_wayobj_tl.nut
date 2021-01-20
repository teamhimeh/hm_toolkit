include("hm_lib/hm_global")

// valid only for wt_rail
class hm_wayobj_tl extends hm_base_tl {
  desc_name = null
  start = null
  ziel = null
  constructor(d_name, s, z) {
    desc_name = d_name
    start = coord3d(s[0],s[1],s[2])
    ziel = coord3d(z[0],z[1],z[2])
    hm_commands.append(this)
  }
  function exec(player, origin) {
    local tl = command_x(tool_build_wayobj)
    //return tl.work(player, origin+start, origin+ziel, desc_name)
    local err = tl.work(player, origin+start, origin+ziel, desc_name)
    if(err!=null) {
      //calc_route() failed to find a path.
      return "Wayobj building path from (" + (origin+start).tostring() + ") to (" + (origin+ziel).tostring() + ") is not found!"
    } else {
      return null
    }
  }
}
