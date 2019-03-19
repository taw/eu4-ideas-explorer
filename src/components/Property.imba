import "../data/loc.json" as data_loc

export tag PropertyList
  def render
    <self>
      for entry in data:plist
        <Property[entry]>

export tag Property
  def render
    let key = data[0]
    let val = data[1]
    <self>
      if key === "AND" || key === "OR" || key === "NOT"
        <div.key.{key}>
          key
      else
        <div.key>
          data_loc[key] || key
      <div.val>
        if val === true
          "Yes"
        else if val === false
          "No"
        else if typeof(val) === "object"
          <PropertyList[val]>
        else
          data_loc[val] || val
