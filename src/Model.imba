import "./data/effects.json" as data_effects

export class Model
  def process(key, value)
    result = {}
    result[key] = value
    result

  def resolve_effects(input)
    let output = {}
    for key, value of input
      let resolved = resolve_effect(key, value)
      for key2, value2 of resolved
        # This assumes numbers / numbers
        # What do we do for true / number etc. ?
        if output[key2]
          output[key2] += value2
        else
          output[key2] = value2
    output

  def resolve_effect(key, value)
    if this[key]
      resolve_effects(this[key](value))
    else
      let output = {}
      output[key] = value
      output

  def output_effects
    let output = {}
    for key, _ of data_effects
      let resolved = resolve_effect(key, 1)
      for key2, _ of resolved
        output[key2] = true
    Object.keys output

  def technology_cost(value)
    {
      monthly_power: (29 * 600 * 3 / 4514) * -value
    }

  def adm_tech_cost_modifier(value)
    {
      monthly_adm_power: (29 * 600 / 4514) * -value
    }

  def dip_tech_cost_modifier(value)
    {
      monthly_dip_power: (29 * 600 / 4514) * -value
    }

  def mil_tech_cost_modifier(value)
    {
      monthly_mil_power: (29 * 600 / 4514) * -value
    }
