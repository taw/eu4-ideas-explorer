import "../data/loc.json" as data_loc
import format_bonus_value from '../format_bonus_value'

export tag Bonus
  def render
    let key = data[0]
    let val = data[1]
    <self>
      data_loc[key]
      " — "
      format_bonus_value(key, val)
