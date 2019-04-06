import format_bonus_value from '../src/format_bonus_value'
import { describe, declare, it, assert-equal } from 'imba-spec'

describe "format_bonus_value" do
  it "formats booleans" do
    assert-equal "Yes", format_bonus_value("no_religion_penalty", true)
    assert-equal "No", format_bonus_value("no_religion_penalty", false)

  it "formats integers" do
    assert-equal "+2", format_bonus_value("num_accepted_cultures", 2)
    assert-equal "+0", format_bonus_value("num_accepted_cultures", 0)
    assert-equal "-2", format_bonus_value("num_accepted_cultures", -2)

  it "formats percent bonuses" do
    assert-equal "+25%", format_bonus_value("technology_cost", 0.25)
    assert-equal "+0%", format_bonus_value("technology_cost", 0.00)
    assert-equal "-15%", format_bonus_value("technology_cost", -0.15)
    assert-equal "+100%", format_bonus_value("technology_cost", 1.00)
    assert-equal "-100%", format_bonus_value("technology_cost", -1.00)
