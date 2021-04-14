include("hm_lib/hm_global")
include("hm_lib/hm_functions")
include("hm_lib/hm_find_obj")
include("hm_lib/hm_obj_selector")

class hm_bridge_tl extends hm_base_tl {
  desc_name = null
  start = null
  ziel = null
  
  constructor(d_name, s, z) {
    desc_name = d_name
    start = coord3d(s[0],s[1],s[2])
    ziel = coord3d(z[0],z[1],z[2])
    hm_commands.append(this)
  }
  
  // returns [error_message, desc]
  // selector and finder are not available
  // because get_desc() does not exist for a bridge object.
  function _get_desc(){
    local d = hm_get_bridge_desc(desc_name)
    if(d==null) {
      return ["Bridge " + desc_name + " is not found!", null]
    }
    return [null, d]
  }
  
  function exec(player, origin) {
    local dr = _get_desc()
    if(dr[0]!=null) {
      return dr[0] // there was a error in obtaining the desc
    }
    local desc = dr[1]
    local err = command_x.build_bridge(player, origin+start, origin+ziel, desc)
    if(err!=null) {
      //calc_route() failed to find a path.
      return "Bridge building path from (" + (origin+start).tostring() + ") to (" + (origin+ziel).tostring() + ") is not found!"
    } else {
      return null
    }
  }
}
