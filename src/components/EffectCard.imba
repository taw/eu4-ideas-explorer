import "../data/loc.json" as data_loc
import format_bonus_value from "../format_bonus_value"

export tag EffectCard
  prop name
  def render
    <self>
      for instance in data
        <div>
          format_bonus_value(name, instance[0])
        <div>
          <span route-to="/{instance[1]}/{instance[2]}">
            data_loc[instance[2]]
            " — "
            if instance[3] == "start"
              "Tradition"
            else if instance[3] == "bonus"
              "Ambition"
            else
              data_loc[instance[3]]
