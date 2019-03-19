import "../data/loc.json" as data_loc
import {Bonus,PropertyList} from "."

export tag NationalIdeasCard
  def render
    <self>
      <div>
      <div>
        "Trigger"
      <PropertyList[data:trigger]>
      <div>
      <div>
        "Tradition"
      <div>
        for bonus in data:start:bonuses
          <Bonus[bonus]>
      for idea, i in data:ideas
        <div>
          i+1
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
