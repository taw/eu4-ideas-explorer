import "../data/loc.json" as data_loc
import "../data/effects.json" as data_effects
import {EffectCard} from '.'

export tag Effect
  def render
    let name = params:id
    let effect = data_effects[name]
    <self>
      <nav>
        <span.active>
          data_loc[name]
      <EffectCard[effect] name=name>
