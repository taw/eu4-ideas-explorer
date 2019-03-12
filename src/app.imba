# wow, all 3 styles
require "imba-router"
import "./data/basic.json" as data_basic
import "./data/national.json" as data_national
import "./data/loc.json" as data_loc
import "./data/effects.json" as data_effects
import "./data/effect_types.json" as data_effect_types

import {sprintf} from "sprintf-js"

# It should defend on name
let def format_bonus_value(name, val)
  if val === true
    "Yes"
  else if val === false
    "No"
  else if data_effect_types[name] === "percent"
    sprintf("%+f%%", val*100)
  else if data_effect_types[name] === "int"
    sprintf("%+d", val)
  else
    val

tag EffectCard
  prop name
  def render
    <self>
      for instance in data
        <div>
          format_bonus_value(name, instance[0])
        <div>
          <span route-to="/{instance[1]}/{instance[2]}">
            data_loc[instance[2]]
            " — "
            if instance[3] == "start"
              "Tradition"
            else if instance[3] == "bonus"
              "Ambition"
            else
              data_loc[instance[3]]


tag Effect
  def render
    let name = params:id
    let effect = data_effects[name]
    <self>
      <nav>
        <span.active>
          data_loc[name]
      <EffectCard[effect] name=name>

tag EffectsIndex
  def render
    let effects = Object.keys(data_effects)
    effects.sort()
    <self>
      <ul>
        for effect_name in effects
          <li>
            <span route-to="/effects/{effect_name}">
              data_loc[effect_name]

tag Bonus
  def render
    let key = data[0]
    let val = data[1]
    <self>
      data_loc[key]
      " — "
      format_bonus_value(key, val)

tag BasicIdeasCard
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


tag BasicIdeas
  def render
    let idea = data_basic.find do |x| x:name == params:id
    <self>
      <nav>
        <span.active>
          data_loc[idea:name]
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

tag NationalIdeasCard
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

tag NationalIdeas
  def render
    let idea = data_national.find do |x| x:name == params:id
    <self>
      <nav>
        <span.active>
          data_loc[idea:name]
      <NationalIdeasCard[idea]>

tag BasicIdeasIndex
  def render
    <self>
      <ul>
        for idea in data_basic
          <li>
            <span route-to="/basic/{idea:name}">
              data_loc[idea:name]

tag NationalIdeasIndex
  def render
    <self>
      <ul>
        for idea in data_national
          <li>
            <span route-to="/national/{idea:name}">
              data_loc[idea:name]

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
