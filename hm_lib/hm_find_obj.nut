include("hm_lib/lib_obj_finder_v2")
  
// get(key) returns [desc, start_pos, end_pos]
class hm_found_desc {
  found_descs = {}
  function set(key, desc, start, end) {
    found_descs[key] <- [desc, start, end]
  }
  function get(key) {
    if(key in found_descs) {
      return found_descs[key]
    }
    return null
  }
  function get_pos_str(key) {
    if(key in found_descs) {
      local e = found_descs[key]
      return "("+e[1][0]+","+e[1][1]+","+e[1][2]+") and ("+e[2][0]+","+e[2][1]+","+e[2][2]+")"
    }
    return null
  }
}
  
// key prefix: "w"
function hm_find_way(key, start, end) {
  local desc = ObjFinder(player, [start, end]).findWay()
  hm_found_desc().set("w" + key, desc, start, end)
}
