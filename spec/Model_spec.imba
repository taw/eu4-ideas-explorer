import Model from '../src/Model'
import { describe, declare, it, expect } from 'imba-spec'

describe "Model" do
  declare "model" do |t|
    Model.new

  describe "#output_effects" do
    it "returns list of unmodelled effects" do |t|
      expect.includes t.model.output_effects, "build_cost"

    it "excludes effects which are transformed" do |t|
      expect.excludes t.model.output_effects, "dip_tech_cost_modifier"
      expect.excludes t.model.output_effects, "adm_tech_cost_modifier"
      expect.excludes t.model.output_effects, "mil_tech_cost_modifier"
      expect.excludes t.model.output_effects, "technology_cost"

    # None such yet
    # it "excludes intermediate effects"

    it "includes output effects" do |t|
      expect.includes t.model.output_effects, "monthly_adm_power"
      expect.includes t.model.output_effects, "monthly_dip_power"
      expect.includes t.model.output_effects, "monthly_mil_power"
      expect.includes t.model.output_effects, "monthly_power"

  describe "#adm_tech_cost_modifier" do
    it "translates to monthly_adm_power" do |t|
      expect.equal {monthly_adm_power: 0.3854674346477625}, t.model.adm_tech_cost_modifier(-0.1)

  describe "#dip_tech_cost_modifier" do
    it "translates to monthly_dip_power" do |t|
      expect.equal {monthly_dip_power: 0.3854674346477625}, t.model.dip_tech_cost_modifier(-0.1)

  describe "#mil_tech_cost_modifier" do
    it "translates to monthly_mil_power" do |t|
      expect.equal {monthly_mil_power: 0.3854674346477625}, t.model.mil_tech_cost_modifier(-0.1)

  describe "#technology_cost" do
    it "translates to monthly_power" do |t|
      expect.equal {monthly_power: 1.1564023039432876}, t.model.technology_cost(-0.1)

  describe "#resolve_effect" do
    it "translates basic effects to themselves" do |t|
      expect.equal {build_cost: -0.1}, t.model.resolve_effect("build_cost", -0.1)
      expect.equal {cb_on_primitives: true}, t.model.resolve_effect("cb_on_primitives", true)

    it "translates complex effects according to their function" do |t|
      expect.equal {monthly_adm_power: 0.3854674346477625}, t.model.resolve_effect("adm_tech_cost_modifier", -0.1)

  describe "#resolve_effects" do
    it "translates basic effects to themselves" do |t|
      expect.equal {build_cost: -0.1}, t.model.resolve_effects({build_cost: -0.1})
      expect.equal {cb_on_primitives: true}, t.model.resolve_effects({cb_on_primitives: true})

    it "translates complex effects according to their function" do |t|
      expect.equal {monthly_adm_power: 0.3854674346477625}, t.model.resolve_effects({adm_tech_cost_modifier: -0.1})
