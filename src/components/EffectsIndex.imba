import "../data/effects.json" as data_effects
import "../data/loc.json" as data_loc

export tag EffectsIndex
  def render
    let effects = Object.keys(data_effects)
    effects.sort()
    <self>
      <ul>
        for effect_name in effects
          <li>
            <span route-to="/effects/{effect_name}">
              data_loc[effect_name]
