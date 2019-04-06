import Model from '../src/Model'
import { describe, declare, it, assert-equal } from 'imba-spec'

describe "Model" do
  declare "model" do |t|
    Model.new

  describe "#output_effects" do
    it "returns list of unmodelled effects" do |t|
      assert-equal true, t.model.output_effects.includes("build_cost")

    it "excludes effects which are transformed" do |t|
      assert-equal false, t.model.output_effects.includes("dip_tech_cost_modifier")
      assert-equal false, t.model.output_effects.includes("adm_tech_cost_modifier")
      assert-equal false, t.model.output_effects.includes("mil_tech_cost_modifier")
      assert-equal false, t.model.output_effects.includes("technology_cost")

    # None such yet
    # it "excludes intermediate effects"

    it "includes output effects" do |t|
      assert-equal true, t.model.output_effects.includes("monthly_adm_power")
      assert-equal true, t.model.output_effects.includes("monthly_dip_power")
      assert-equal true, t.model.output_effects.includes("monthly_mil_power")
      assert-equal true, t.model.output_effects.includes("monthly_power")

  describe "#adm_tech_cost_modifier" do
    it "translates to monthly_adm_power" do |t|
      assert-equal {monthly_adm_power: 0.3854674346477625}, t.model.adm_tech_cost_modifier(-0.1)

  describe "#dip_tech_cost_modifier" do
    it "translates to monthly_dip_power" do |t|
      assert-equal {monthly_dip_power: 0.3854674346477625}, t.model.dip_tech_cost_modifier(-0.1)

  describe "#mil_tech_cost_modifier" do
    it "translates to monthly_mil_power" do |t|
      assert-equal {monthly_mil_power: 0.3854674346477625}, t.model.mil_tech_cost_modifier(-0.1)

  describe "#technology_cost" do
    it "translates to monthly_power" do |t|
      assert-equal {monthly_power: 1.1564023039432876}, t.model.technology_cost(-0.1)

  describe "#resolve_effect" do
    it "translates basic effects to themselves" do |t|
      assert-equal {build_cost: -0.1}, t.model.resolve_effect("build_cost", -0.1)
      assert-equal {cb_on_primitives: true}, t.model.resolve_effect("cb_on_primitives", true)

    it "translates complex effects according to their function" do |t|
      assert-equal {monthly_adm_power: 0.3854674346477625}, t.model.resolve_effect("adm_tech_cost_modifier", -0.1)

  describe "#resolve_effects" do
    it "translates basic effects to themselves" do |t|
      assert-equal {build_cost: -0.1}, t.model.resolve_effects({build_cost: -0.1})
      assert-equal {cb_on_primitives: true}, t.model.resolve_effects({cb_on_primitives: true})

    it "translates complex effects according to their function" do |t|
      assert-equal {monthly_adm_power: 0.3854674346477625}, t.model.resolve_effects({adm_tech_cost_modifier: -0.1})
