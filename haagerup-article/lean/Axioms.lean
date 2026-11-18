import HaagerupRefutation

/-! The axioms of the package's theorems. CI (`.github/workflows/haagerup-article.yml`) accepts only `propext`,
`Classical.choice` and `Quot.sound`. Add one line for every headline theorem. -/

#print axioms HaagerupRefutation.CertData.weights_sum_eq_one
#print axioms HaagerupRefutation.CertData.certDLower_gt_haagerupUpper
#print axioms HaagerupRefutation.CertData.inv_certDLower_lt_world_record
