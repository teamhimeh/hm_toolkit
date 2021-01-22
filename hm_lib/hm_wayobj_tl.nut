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
  
  // returns [error_message, desc]
  function _get_desc(){
    if(desc_name.slice(0,2)=="?f") {
      local key_str = "c" + desc_name.slice(2)
      local d = hm_found_desc.get(key_str)
      if(d==null) {
        return ["Wayobj key " + desc_name.slice(2) + " is not defined.", null]
      } else if(d[0]==null) {
        return ["No wayobj was detected between " + hm_found_desc.get_pos_str(key_str), null]
      }
      return [null, d[0]]
    }
    else if(desc_name.slice(0,2)=="?s") {
      local idx = desc_name.slice(2).tointeger()
      local d = hm_wayobj_selector().get_desc(idx)
      if(d==null) {
        return ["Selected wayobj "+desc_name.slice(2)+" is not available.", null]
      }
      return [null, d]
    }
    else {
      foreach(wt in hm_all_waytypes) {
        foreach (c in wayobj_desc_x.get_available_wayobjs(wt)) {
          if(c.get_name()==desc_name) {
            return [null, c]
          }
        }
      }
      return ["Wayobj " + desc_name + " is not found!", null]
    }
  }
  
  function exec(player, origin) {
    local dr = _get_desc()
    if(dr[0]!=null) {
      return dr[0] // there was a error in obtaining the desc
    }
    local desc = dr[1]
    local err = command_x.build_wayobj(player, origin+start, origin+ziel, desc)
    if(err!=null) {
      //calc_route() failed to find a path.
      return "Wayobj building path from (" + (origin+start).tostring() + ") to (" + (origin+ziel).tostring() + ") is not found!"
    } else {
      return null
    }
  }
}
