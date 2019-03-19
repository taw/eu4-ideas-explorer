require "imba-router"
import {Nav, BasicIdeasIndex, NationalIdeasIndex, EffectsIndex, BasicIdeas, NationalIdeas, Effect} from "./components"

tag App
  def build
    self.router.mode = "hash"

  def render
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

Imba.mount <App>
