include("hm_lib/hm_global")
include("hm_lib/hm_functions")

class hm_sign_tl extends hm_base_tl {
  desc_name = null
  pos = null
  num_exec = 1
  constructor(sign_name, num, p) {
    desc_name = sign_name
    pos = coord3d(p[0],p[1],p[2])
    num_exec = num
    hm_commands.append(this)
  }
  
  // returns [error_message, desc]
  function _get_desc(){
    if(desc_name.slice(0,2)=="?f") {
      local key_str = "s" + desc_name.slice(2)
      local d = hm_found_desc.get(key_str)
      if(d==null) {
        return ["Sign key " + desc_name.slice(2) + " is not defined.", null]
      } else if(d[0]==null) {
        return ["No sign was detected between " + hm_found_desc.get_pos_str(key_str), null]
      }
      return [null, d[0]]
    } else if(desc_name.slice(0,2)=="?s") {
      local idx = desc_name.slice(2).tointeger()
      local d = hm_sign_selector().get_desc(idx)
      if(d==null) {
        return ["Selected sign "+desc_name.slice(2)+" is not available.", null]
      }
      return [null, d]
    } else {
      local d = hm_get_sign_desc(desc_name)
      if(d==null) {
        return ["Sign " + desc_name + " is not found!", null]
      }
      return [null, d]
    }
  }
  
  function exec(player, origin) {
    local dr = _get_desc()
    if(dr[0]!=null) {
      return dr[0] // there was a error in obtaining the desc
    }
    local desc = dr[1]
    // check if the way exists
    local s_pos = origin + pos
    for(local i=0; i<num_exec; i++) {
      try {
        local err = command_x.build_sign_at(player, s_pos, desc)
      } catch(e) {
        return "an error occured."
      }
    }
    return null
  }
}
