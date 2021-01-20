include("hm_lib/hm_global")

class hm_slope_tl extends hm_base_tl {
  slope = 0
  pos = null
  constructor(slp, p) {
    slope = slp
    pos = coord3d(p[0],p[1],p[2])
    hm_commands.append(this)
  }
  function exec(player, origin) {
    // check if the designated pos refers a ground tile.
    local tp = origin+pos
    local tile = square_x(tp.x, tp.y).get_ground_tile()
    if(tile.z!=tp.z || !tile.is_ground()) {
      return "Tile " + tp.tostring() + " is not a valid ground!"
    }
    return command_x.set_slope(player, tp, slope);
  }
}
