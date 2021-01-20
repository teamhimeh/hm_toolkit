include("hm_lib/hm_global")

class hm_way_tl extends hm_base_tl {
  desc = null
  desc_name = null
  start = null
  ziel = null
  constructor(d_name, s, z) {
    desc_name = d_name
    foreach(wt in hm_all_waytypes) {
      foreach (st in [st_flat, st_elevated, st_tram]) {
        foreach (w in way_desc_x.get_available_ways(wt, st)) {
          if(w.get_name()==desc_name) {
            desc = w
            break
          }
        }
      }
      if(desc!=null) {
        break
      }
    }
    start = coord3d(s[0],s[1],s[2])
    ziel = coord3d(z[0],z[1],z[2])
    hm_commands.append(this)
  }
  function exec(player, origin) {
    if (desc==null) {
      return "Way " + desc_name + " is not found!"
    }
    local err = command_x.build_way(player, origin+start, origin+ziel, desc, true)
    if(err!=null) {
      //calc_route() failed to find a path.
      return "Way building path from (" + (origin+start).tostring() + ") to (" + (origin+ziel).tostring() + ") is not found!"
    } else {
      return null
    }
  }
}
