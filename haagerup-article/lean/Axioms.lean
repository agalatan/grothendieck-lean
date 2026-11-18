import HaagerupRefutation

/-! The axioms of the package's theorems. CI (`.github/workflows/haagerup-article.yml`) accepts only `propext`,
`Classical.choice` and `Quot.sound`. Add one line for every headline theorem. -/

#print axioms HaagerupRefutation.CertData.weights_sum_eq_one
#print axioms HaagerupRefutation.CertData.certDLower_gt_haagerupUpper
#print axioms HaagerupRefutation.CertData.inv_certDLower_lt_bound
#print axioms HaagerupRefutation.haagerupDagger_pos
#print axioms HaagerupRefutation.haagerupDagger_lt_upper
#print axioms HaagerupRefutation.complexGrothendieckConstant_le_inv_of_dominated
#print axioms HaagerupRefutation.complexGrothendieckConstant_le_of_certificate
#print axioms HaagerupRefutation.complexGrothendieckConstant_lt_inv_haagerupDagger_of_certificate
