this.hm_commands <- [] // array to store the commands
this.hm_all_waytypes <- [wt_road,wt_rail,wt_water,wt_monorail,wt_maglev,wt_tram,wt_narrowgauge,wt_air,wt_power]

class hm_slope {
  N1 = 4
  N2 = 8
  S1 = 36
  S2 = 72
  E1 = 28
  E2 = 56
  W1 = 12
  W2 = 24
  UP = 82
  //UP2 = 92
  DOWN = 83
  //DN2 = 93
}

class hm_base_tl {
  function exec(player, origin) {
    return null
  }
}
