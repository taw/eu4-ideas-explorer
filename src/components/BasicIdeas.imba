import "../data/basic.json" as data_basic
import "../data/loc.json" as data_loc
import {BasicIdeasCard} from "."

export tag BasicIdeas
  def render
    let idea = data_basic.find do |x| x:name == params:id
    <self>
      <nav>
        <span.active>
          data_loc[idea:name]
      <BasicIdeasCard[idea]>
