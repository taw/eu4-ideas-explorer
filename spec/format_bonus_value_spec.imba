import format_bonus_value from '../src/format_bonus_value'
import { describe, declare, it, expect } from 'imba-spec'

describe "format_bonus_value" do
  it "formats booleans" do
    expect.equal "Yes", format_bonus_value("no_religion_penalty", true)
    expect.equal "No", format_bonus_value("no_religion_penalty", false)

  it "formats integers" do
    expect.equal "+2", format_bonus_value("num_accepted_cultures", 2)
    expect.equal "+0", format_bonus_value("num_accepted_cultures", 0)
    expect.equal "-2", format_bonus_value("num_accepted_cultures", -2)

  it "formats percent bonuses" do
    expect.equal "+25%", format_bonus_value("technology_cost", 0.25)
    expect.equal "+0%", format_bonus_value("technology_cost", 0.00)
    expect.equal "-15%", format_bonus_value("technology_cost", -0.15)
    expect.equal "+100%", format_bonus_value("technology_cost", 1.00)
    expect.equal "-100%", format_bonus_value("technology_cost", -1.00)
