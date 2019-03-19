import "../data/basic.json" as data_basic
import "../data/loc.json" as data_loc

export tag BasicIdeasIndex
  def render
    <self>
      <ul>
        for idea in data_basic
          <li>
            <span route-to="/basic/{idea:name}">
              data_loc[idea:name]
