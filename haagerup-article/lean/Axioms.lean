import HaagerupRefutation

/-! The axioms of the package's theorems. CI (`.github/workflows/haagerup-article.yml`) accepts only `propext`,
`Classical.choice` and `Quot.sound`. Add one line for every headline theorem; `upper_bound` comes first. -/

#print axioms HaagerupRefutation.upper_bound
#print axioms HaagerupRefutation.complexGrothendieckConstant_le_of_channelFacts
#print axioms HaagerupRefutation.complexGrothendieckConstant_lt_inv_haagerupDagger_of_channelFacts
#print axioms HaagerupRefutation.budgetNum_eq
#print axioms HaagerupRefutation.budget_gt_haagerupUpper
#print axioms HaagerupRefutation.budget_inv_lt
#print axioms HaagerupRefutation.haagerupDagger_pos
#print axioms HaagerupRefutation.haagerupDagger_lt_upper
#print axioms HaagerupRefutation.complexGrothendieckConstant_le_inv_of_dominated
#print axioms HaagerupRefutation.CertData.weights_sum_eq_one
