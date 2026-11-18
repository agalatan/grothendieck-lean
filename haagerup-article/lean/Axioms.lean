import HaagerupRefutation

/-! The axioms of the package's theorems. CI (`.github/workflows/haagerup-article.yml`) accepts only `propext`,
`Classical.choice` and `Quot.sound`. Add one line for every headline theorem. -/

#print axioms HaagerupRefutation.main_refutation
#print axioms HaagerupRefutation.haagerupDagger_pos
#print axioms HaagerupRefutation.haagerupDagger_lt_upper
#print axioms HaagerupRefutation.cert_rational_margins
#print axioms HaagerupRefutation.transferMargin_le_alternatingVal
#print axioms HaagerupRefutation.convex_no_go_below_ceiling
#print axioms HaagerupRefutation.complexGrothendieckConstant_le_inv_of_dominated
