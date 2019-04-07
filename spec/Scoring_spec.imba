import Model from '../src/Model'
import Scoring from '../src/Scoring'
import { describe, declare, it, expect } from 'imba-spec'

describe "Scoring" do
  declare "model" do |t|
    Model.new

  declare "scoring" do |t|
    Scoring.new t.model, t.weights

  declare "weights" do |t|
    {}

  it "treats all unknown keys as 0" do |t|
    expect.equal 0, t.scoring.score({cats: 1})

  describe "input effects" do
    declare "weights" do |t|
      {
        merchants: 0.3,
        colonists: 2.5,
      }
    it "get added up" do |t|
      expect.equal 3.1, t.scoring.score({merchants: 2, colonists: 1})

  describe "it can score output effects" do
    declare "weights" do |t|
      {
        monthly_adm_power: 1.2,
        monthly_dip_power: 1.0,
        monthly_mil_power: 0.8,
      }
    it "get added up" do |t|
      expect.equal (
        1.2 * 2 * 0.3854674346477625 -
        0.8 * 1 * 0.3854674346477625
      ), t.scoring.score({adm_tech_cost_modifier: -0.2, mil_tech_cost_modifier: 0.1})

  # It is an API use error
  describe "it does not double count effects" do
    declare "weights" do |t|
      {
        monthly_adm_power: 1.2,
        adm_tech_cost_modifier: -2.0, # Ignored
      }
    it "get added up" do |t|
      expect.equal (
        1.2 * 2 * 0.3854674346477625
      ), t.scoring.score({adm_tech_cost_modifier: -0.2})
