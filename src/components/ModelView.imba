import "../data/loc.json" as data_loc

export tag ModelView
  def render
    <self>
      <h2>
        "Technology"
      <p>
        "Game lasts 4514 months."
      <p>
        "If you start at tech 3 and end at tech 32, it means you needed to tech up 29 times for each kind."
      <p>
        "Base cost of every technology is 600 points."
      <p>
        "Therefore 10% tech discount saves you exactly 1.156 points a month."
      <p>
        "And 10% tech discount on specific tech type saves you exactly 0.385 points a month."
      <h2>
        "Effects"
      # This probably isn't going to be all that useful
      <ul>
        for effect_name in data.output_effects
          <li>
            data_loc[effect_name] || effect_name
