import "../data/loc.json" as data_loc
import {Bonus} from "."

export tag BasicIdeasCard
  def render
    <self>
      <div>
      <div>
        "Category"
      <div>
        data:category
      for idea, i in data:ideas
        <div>
          "{i+1}"
        <div>
          data_loc[idea:name]
        <div>
          for bonus in idea:bonuses
            <Bonus[bonus]>
      <div>
      <div>
        "Ambition"
      <div>
        for bonus in data:bonus:bonuses
          <Bonus[bonus]>
