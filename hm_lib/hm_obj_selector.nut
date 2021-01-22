
class hm_obj_selector {
  way_messages = [] // text to show when users select the way
  wayobj_messages = []
  way_descs = []
  wayobj_descs = []
  
  function get_way_desc(idx) {
    // given idx can be out of range.
    return idx <= way_descs.len() ? way_descs[idx-1] : null
  }
  
  function need_selection() {
    return way_descs.len()<way_messages.len()
  }
  
  // generate the message for the next click operation
  function get_selection_message() {
    if(way_descs.len()<way_messages.len()) {
      return way_messages[way_descs.len()]
    }
    else if(wayobj_descs.len()<wayobj_messages.len()) {
      return wayobj_messages[wayobj_descs.len()]
    }
    else {
      return "Select the pos to construct."
    }
  }
  
  function _select_way(player, pos) {
    local moWay = tile_x(pos.x, pos.y, pos.z).find_object(mo_way)
    local hasOwnedWay = moWay && moWay.get_owner().get_name() == player.get_name()
    if (hasOwnedWay) {
      way_descs.append(moWay.get_desc())
      return get_selection_message()
    } else {
      return "No valid way on " + pos.tostring()
    }
  }
  
  function select_obj(player, pos) {
    if(way_descs.len()<way_messages.len()) {
      return _select_way(player, pos)
    }
    return get_selection_message()
  }
}

function hm_select_way(text) {
  hm_obj_selector.way_messages.append(text)
}
