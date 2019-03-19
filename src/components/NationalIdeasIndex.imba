import "../data/national.json" as data_national
import "../data/loc.json" as data_loc

export tag NationalIdeasIndex
  def render
    <self>
      <ul>
        for idea in data_national
          <li>
            <span route-to="/national/{idea:name}">
              data_loc[idea:name]
