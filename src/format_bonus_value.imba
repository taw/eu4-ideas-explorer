import {sprintf} from "sprintf-js"
import "./data/effect_types.json" as data_effect_types

# It should defend on name
export let def format_bonus_value(name, val)
  if val === true
    "Yes"
  else if val === false
    "No"
  else if data_effect_types[name] === "percent"
    sprintf("%+f%%", val*100)
  else if data_effect_types[name] === "int"
    sprintf("%+d", val)
  else
    val
