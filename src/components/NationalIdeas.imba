import "../data/national.json" as data_national
import "../data/loc.json" as data_loc
import {NationalIdeasCard} from "."

export tag NationalIdeas
  def render
    let idea = data_national.find do |x| x:name == params:id
    <self>
      <nav>
        <span.active>
          data_loc[idea:name]
      <NationalIdeasCard[idea]>
