require 'imba-router'
import './data/data.json' as db

tag EffectCard
  def render
    <self>
      for instance in data
        <div>
          instance[0]
        <div>
          <span route-to="/{instance[1]}/{instance[2]}">
            db:loc[instance[2]]
            " — "
            db:loc[instance[3]]

tag Effect
  def render
    let effect = db:effects[params:id]
    <self>
      <nav>
        <span.active>
          db:loc[params:id]
      <EffectCard[effect]>


tag EffectsIndex
  def render
    let effects = Object.keys(db:effects)
    effects.sort()
    <self>
      <ul>
        for effect_name in effects
          <li>
            <span route-to="/effects/{effect_name}">
              db:loc[effect_name]

tag Bonus
  def render
    let key = data[0]
    let val = data[1]
    <self>
      db:loc[key]
      " — "
      val

tag BasicIdeasCard
  def render
    <self>
      <div>
        "Category"
      <div>
        data:category
      for idea, i in data:ideas
        <div>
          "{i+1} " + db:loc[idea:name]
        <div>
          for bonus in idea:bonuses
            <Bonus[bonus]>
      <div>
        "Bonus"
      <div>
        for bonus in data:bonus:bonuses
          <Bonus[bonus]>


tag BasicIdeas
  def render
    let idea = db:basic.find do |x| x:name == params:id
    <self>
      <nav>
        <span.active>
          db:loc[idea:name]
      <BasicIdeasCard[idea]>

tag PropertyList
  def render
    <self>
      for entry in data:plist
        <Property[entry]>

tag Property
  def render
    let key = data[0]
    let val = data[1]
    <self>
      if key === "AND" || key === "OR" || key === "NOT"
        <div.key.{key}>
          key
      else
        <div.key>
          db:loc[key] || key
      <div.val>
        if val === true
          "Yes"
        else if val === false
          "No"
        else if typeof(val) === "object"
          <PropertyList[val]>
        else
          db:loc[val] || val

tag NationalIdeasCard
  def render
    <self>
      <div>
        "Trigger"
      <PropertyList[data:trigger]>
      <div>
        "Tradition"
      <div>
        for bonus in data:start:bonuses
          <Bonus[bonus]>
      for idea, i in data:ideas
        <div>
          "{i+1} " + db:loc[idea:name]
        <div>
          for bonus in idea:bonuses
            <Bonus[bonus]>
      <div>
        "Bonus"
      <div>
        for bonus in data:bonus:bonuses
          <Bonus[bonus]>

tag NationalIdeas
  def render
    let idea = db:national.find do |x| x:name == params:id
    <self>
      <nav>
        <span.active>
          db:loc[idea:name]
      <NationalIdeasCard[idea]>

tag BasicIdeasIndex
  def render
    <self>
      <ul>
        for idea in db:basic
          <li>
            <span route-to="/basic/{idea:name}">
              db:loc[idea:name]

tag NationalIdeasIndex
  def render
    <self>
      <ul>
        for idea in db:national
          <li>
            <span route-to="/national/{idea:name}">
              db:loc[idea:name]

tag Nav
  def render
    <self>
      <nav>
        <span route-to="/basic/">
          "Basic Ideas"
        <span route-to="/national/">
          "National Ideas"
        <span route-to="/effects/">
          "Effects"

tag App
  def build
    self.router.mode = 'hash'

  def render
    # FFS
    let idea1 = db:national.find do |x| x:name == "barbary_pirate_ideas"
    let idea2 = db:national.find do |x| x:name == "vindhyan_ideas"
    let idea3 = db:national.find do |x| x:name == "pirate_ideas"
    let idea4 = db:national.find do |x| x:name == "indian_muslim_ideas"
    let idea5 = db:national.find do |x| x:name == "native_ideas"

    <self>
      <header>
        "EU4 Idea Explorer"
      <Nav>
      <BasicIdeasIndex route="/basic/">
      <NationalIdeasIndex route="/national/">
      <EffectsIndex route="/effects/">
      <BasicIdeas route="/basic/:id">
      <NationalIdeas route="/national/:id">
      <Effect route="/effects/:id">

      <NationalIdeasCard[idea1]>
      <NationalIdeasCard[idea2]>
      <NationalIdeasCard[idea3]>
      <NationalIdeasCard[idea4]>
      <NationalIdeasCard[idea5]>

Imba.mount <App>
