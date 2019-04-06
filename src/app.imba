require "imba-router"
import Model from "./Model"
import {Nav, BasicIdeasIndex, NationalIdeasIndex, EffectsIndex, BasicIdeas, NationalIdeas, Effect, ModelView} from "./components"

tag App
  def build
    self.router.mode = "hash"
    @model = Model.new

  def render
    <self>
      <header>
        "EU4 Idea Explorer"
      <Nav>
      <BasicIdeasIndex route="/basic/">
      <NationalIdeasIndex route="/national/">
      <EffectsIndex route="/effects/">
      <ModelView[@model] route="/model">
      <BasicIdeas route="/basic/:id">
      <NationalIdeas route="/national/:id">
      <Effect route="/effects/:id">

Imba.mount <App>
