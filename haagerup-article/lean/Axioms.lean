import HaagerupBound

/-! The axioms of the package's theorems. CI (`.github/workflows/haagerup-article.yml`) accepts only `propext`,
`Classical.choice` and `Quot.sound`. Add one line for every headline theorem; `upper_bound` comes first. -/

#print axioms HaagerupBound.upper_bound
#print axioms HaagerupBound.complexGrothendieckConstant_le_of_channelFacts
#print axioms HaagerupBound.complexGrothendieckConstant_lt_inv_haagerupDagger_of_channelFacts
#print axioms HaagerupBound.budgetNum_eq
#print axioms HaagerupBound.budget_gt_haagerupUpper
#print axioms HaagerupBound.budget_inv_lt
#print axioms HaagerupBound.haagerupDagger_pos
#print axioms HaagerupBound.haagerupDagger_lt_upper
#print axioms HaagerupBound.complexGrothendieckConstant_le_inv_of_dominated
#print axioms HaagerupBound.CertData.weights_sum_eq_one
