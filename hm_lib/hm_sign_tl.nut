include("hm_lib/hm_global")
include("hm_lib/hm_functions")

class hm_sign_tl extends hm_base_tl {
  desc = null
  desc_name = null
  pos = null
  num_exec = 1
  constructor(sign_name, num, p) {
    desc_name = sign_name
    pos = coord3d(p[0],p[1],p[2])
    num_exec = num
    desc = hm_get_sign_desc(desc_name)
    hm_commands.append(this)
  }
  function exec(player, origin) {
    if (desc==null) {
      return "Sign " + desc_name + " is not found!"
    }
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
