include("hm_lib/hm_global")

class hm_station_tl extends hm_base_tl {
  desc = null
  desc_name = null
  pos = null
  constructor(sta_name, p) {
    desc_name = sta_name
    pos = coord3d(p[0],p[1],p[2])
    // find descriptor
    foreach (d in building_desc_x.get_building_list(building_desc_x.station)) {
      if(d.get_name()==desc_name) {
        desc = d
        break
      }
    }
    hm_commands.append(this)
  }
  function exec(player, origin) {
    if (desc==null) {
      return "Station " + desc_name + " is not found!"
    }
    return command_x.build_station(player, origin+pos, desc);
  }
}
