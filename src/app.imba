require 'imba-router'
import './data/data.json' as data

tag Effect
  def render
    <self>
      "Effect"

tag EffectsIndex
  def render
    <self>
      <h2>
        "Effects Index"
      <div>
        "TODO"

tag Idea
  def render
    <self>
      "TODO"

tag BasicIdeas
  def render
    let idea = data:basic.find do |x| x:name == params:id

    <self>
      <div>
        "Basic"
      <div>
        JSON.stringify(idea)

tag NationalIdeas
  def render
    let idea = data:national.find do |x| x:name == params:id

    <self>
      <div>
        "National"
      <div>
        JSON.stringify(idea)

tag BasicIdeasIndex
  def render
    <self>
      <BasicIdeas route=":id">
      <h2>
        "Basic Index"
      <ul>
        for idea in data:basic
          <li>
            <span route-to=(idea:name)>
              data:loc[idea:name]

tag NationalIdeasIndex
  def render
    <self>
      <NationalIdeas route=":id">
      <h2>
        "National Ideas"
      <ul>
        for idea in data:national
          <li>
            <span route-to=(idea:name)>
              data:loc[idea:name]

tag App
  def build
    self.router.mode = 'hash'

  def render
    <self>
      <header>
        "EU4 Idea Explorer"
      <nav>
        <span route-to="/basic">
          "Basic Ideas"
        <span route-to="/national">
          "National Ideas"
        <span route-to="/effects">
          "Effects"
      <BasicIdeasIndex route="/basic">
      <NationalIdeasIndex route="/national">
      <EffectsIndex route="/effects">

Imba.mount <App>

console.log(data)
