export class Scoring
  prop weights

  def initialize(model, weights)
    @model = model
    @weights = weights

  def score_final_effect(key, val)
    if val === true
      val = 1
    let rate = (@weights[key] || 0)
    rate * val

  def score(effect)
    let resolved = @model.resolve_effects(effect)
    let total = 0
    for key, val of resolved
      total += score_final_effect(key, val)
    total

