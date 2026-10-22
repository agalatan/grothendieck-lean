import Grothe.LowerAnalytic.WickGraphData

/-!
# The sixth cumulant of a cubic chaos

`Chaos3.wick6`: for a cubic chaos `F` with kernel `f = ∂³F/6` and a Gaussian expectation `E`,

  `κ₆(F)/46656 = 135/2 T₃ − 20 V + 135/2 Q + 165/2 ⟨D, U⟩ + 45 ‖U‖²`,

the field `wick6` of `TensorFacts`.  The moments `E F²`, `E F⁴`, `E F⁶` are sums over closed
cubic multigraphs (`wg2_moment`, `wg4_moment`, `wg6_moment` of `WickGraphData.lean`); the
disconnected graphs factor (`gsum_wg6_69`, …) and cancel in `κ₆`, leaving the six connected
cubic multigraphs on six vertices (`wg6_72` … `wg6_77`) with the weights `45/2, 45, 15, 90, 60, 10`.
On the tensor side each of the five contractions is expanded through `S = (C₀ + C₁ + C₂)/3`
(the three pairings `w6C` of `C`) into `1 + 3 + 3 + 9 + 27` multigraph sums (`w6term_*`): each is
unfolded into the nested sum of the graph read off its index structure (`w6close`), and
identified with its canonical form by a `decide`-checked relabelling (`gsum_iso`).
-/

namespace Grothe.LowerAnalytic

open MvPolynomial

noncomputable section

variable {ι : Type*} [Fintype ι]

/-! ### The pairings of `S` -/

section patterns

variable (f : ι → ι → ι → ℝ)

/-- The three pairings `C_{ab,cd}`, `C_{ac,bd}`, `C_{ad,bc}` whose mean is `S`. -/
def w6C : Fin 3 → ι → ι → ι → ι → ℝ
  | 0 => fun a b c d => kerC f a b c d
  | 1 => fun a b c d => kerC f a c b d
  | 2 => fun a b c d => kerC f a d b c

/-- `U` with `S` replaced by one pairing. -/
def w6U (p : Fin 3) (a b c : ι) : ℝ := ∑ d, ∑ e, w6C f p a b d e * f d e c

/-- `Q` with `S` replaced by one pairing. -/
def w6Q (p : Fin 3) : ℝ := ∑ a, ∑ b, ∑ c, ∑ d, kerG f a b * w6C f p a b c d * kerG f c d

/-- `⟨D, U⟩` with `S` replaced by one pairing. -/
def w6DU (p : Fin 3) : ℝ := ∑ a, ∑ b, ∑ c, kerD f a b c * w6U f p a b c

/-- `‖U‖²` with the two copies of `S` replaced by pairings. -/
def w6U2 (p q : Fin 3) : ℝ := ∑ a, ∑ b, ∑ c, w6U f p a b c * w6U f q a b c

/-- `T₃` with the three copies of `S` replaced by pairings. -/
def w6T3 (p q r : Fin 3) : ℝ :=
  ∑ a, ∑ b, ∑ c, ∑ d, ∑ e, ∑ g, w6C f p a b e g * w6C f q e g c d * w6C f r c d a b

lemma kerS_eq_w6C (a b c d : ι) :
    kerS f a b c d = (w6C f 0 a b c d + w6C f 1 a b c d + w6C f 2 a b c d) / 3 := rfl

lemma kerU_eq_w6U (a b c : ι) :
    kerU f a b c = (w6U f 0 a b c + w6U f 1 a b c + w6U f 2 a b c) / 3 := by
  simp only [kerU, w6U, ← Finset.sum_add_distrib, Finset.sum_div]
  refine Finset.sum_congr rfl fun d _ => Finset.sum_congr rfl fun e _ => ?_
  rw [kerS_eq_w6C]; ring

lemma tenQ_eq_w6Q : tenQ f = (w6Q f 0 + w6Q f 1 + w6Q f 2) / 3 := by
  simp only [tenQ, w6Q, ← Finset.sum_add_distrib, Finset.sum_div]
  iterate 4 refine Finset.sum_congr rfl fun _ _ => ?_
  rw [kerS_eq_w6C]; ring

lemma tenDU_eq_w6DU : tenDU f = (w6DU f 0 + w6DU f 1 + w6DU f 2) / 3 := by
  simp only [tenDU, w6DU, ← Finset.sum_add_distrib, Finset.sum_div]
  iterate 3 refine Finset.sum_congr rfl fun _ _ => ?_
  rw [kerU_eq_w6U]; ring

lemma tenU2_eq_w6U2 : tenU2 f = (w6U2 f 0 0 + w6U2 f 0 1 + w6U2 f 0 2 + w6U2 f 1 0 + w6U2 f 1 1
    + w6U2 f 1 2 + w6U2 f 2 0 + w6U2 f 2 1 + w6U2 f 2 2) / 9 := by
  simp only [tenU2, w6U2, ← Finset.sum_add_distrib, Finset.sum_div]
  iterate 3 refine Finset.sum_congr rfl fun _ _ => ?_
  rw [kerU_eq_w6U]; ring

lemma tenT3_eq_w6T3 : tenT3 f = (∑ p, ∑ q, ∑ r, w6T3 f p q r) / 27 := by
  simp only [Fin.sum_univ_three]
  simp (config := { maxSteps := 4000000 }) only [tenT3, kerS2, w6T3, ← Finset.sum_add_distrib,
    Finset.sum_div, Finset.sum_mul]
  iterate 6 refine Finset.sum_congr rfl fun _ _ => ?_
  rw [kerS_eq_w6C, kerS_eq_w6C, kerS_eq_w6C]; ring

end patterns

/-! ### The tensor terms as multigraph sums -/

/-- Close `6⁶ · (nested sum of kernels) = gsum (phiC F) es` once both sides are nested sums in the
same order: unfold the graph sum, go under the nine sums, write every kernel through the multiset
of its indices and normalise the multisets. -/
macro "w6close" : tactic => `(tactic| (
  simp only [gsum_cons, gsum_nil]
  simp only [phiC, Fin.prod_univ_six]
  simp only [addE_apply, Fin.isValue, Fin.reduceEq, ite_true, ite_false, List.nil_append,
    List.cons_append, List.append_nil]
  iterate 9 refine Finset.sum_congr rfl fun _ _ => ?_
  simp only [cw3_eq, cubicKernel_eq_cwm]
  simp only [Multiset.cons_swap]
  ring))

section terms

variable (F : MvPolynomial ι ℝ)

lemma w6term_V : 6 ^ 6 * tenV (cubicKernel F) = gsum (phiC F) wg6_74 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 1, 3, 5, 4, 2])
    (es := ([(0, 5), (1, 2), (3, 4), (4, 5), (4, 5), (2, 3), (2, 3), (0, 1), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_74) (by decide +kernel)]
  simp only [tenV, kerG, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_Q0 : 6 ^ 6 * w6Q (cubicKernel F) 0 = gsum (phiC F) wg6_72 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 1, 2, 3, 4, 5])
    (es := ([(0, 2), (1, 2), (3, 4), (3, 5), (4, 5), (4, 5), (2, 3), (0, 1), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_72) (by decide +kernel)]
  simp only [w6Q, w6C, kerC, kerG, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_Q1 : 6 ^ 6 * w6Q (cubicKernel F) 1 = gsum (phiC F) wg6_73 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 1, 2, 3, 4, 5])
    (es := ([(0, 2), (1, 3), (2, 4), (3, 5), (4, 5), (4, 5), (2, 3), (0, 1), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_73) (by decide +kernel)]
  simp only [w6Q, w6C, kerC, kerG, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_Q2 : 6 ^ 6 * w6Q (cubicKernel F) 2 = gsum (phiC F) wg6_73 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 1, 2, 3, 5, 4])
    (es := ([(0, 2), (1, 3), (3, 4), (2, 5), (4, 5), (4, 5), (2, 3), (0, 1), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_73) (by decide +kernel)]
  simp only [w6Q, w6C, kerC, kerG, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_DU0 : 6 ^ 6 * w6DU (cubicKernel F) 0 = gsum (phiC F) wg6_74 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 2, 4, 1, 3, 5])
    (es := ([(0, 3), (0, 3), (2, 5), (4, 5), (4, 5), (3, 4), (0, 1), (1, 2), (1, 2)] : List (Fin 6 × Fin 6))) (es' := wg6_74) (by decide +kernel)]
  simp only [w6DU, w6U, kerD, w6C, kerC, kerG, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_DU1 : 6 ^ 6 * w6DU (cubicKernel F) 1 = gsum (phiC F) wg6_75 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![2, 0, 1, 4, 5, 3])
    (es := ([(0, 3), (0, 4), (2, 5), (3, 5), (4, 5), (3, 4), (0, 1), (1, 2), (1, 2)] : List (Fin 6 × Fin 6))) (es' := wg6_75) (by decide +kernel)]
  simp only [w6DU, w6U, kerD, w6C, kerC, kerG, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_DU2 : 6 ^ 6 * w6DU (cubicKernel F) 2 = gsum (phiC F) wg6_75 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![2, 0, 1, 4, 5, 3])
    (es := ([(0, 3), (0, 4), (2, 5), (4, 5), (3, 5), (3, 4), (0, 1), (1, 2), (1, 2)] : List (Fin 6 × Fin 6))) (es' := wg6_75) (by decide +kernel)]
  simp only [w6DU, w6U, kerD, w6C, kerC, kerG, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_U200 : 6 ^ 6 * w6U2 (cubicKernel F) 0 0 = gsum (phiC F) wg6_74 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 2, 4, 1, 3, 5])
    (es := ([(0, 3), (0, 3), (2, 5), (4, 5), (4, 5), (3, 4), (1, 2), (1, 2), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_74) (by decide +kernel)]
  simp only [w6U2, w6U, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_U201 : 6 ^ 6 * w6U2 (cubicKernel F) 0 1 = gsum (phiC F) wg6_75 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![2, 0, 1, 4, 5, 3])
    (es := ([(0, 3), (0, 4), (2, 5), (3, 5), (4, 5), (3, 4), (1, 2), (1, 2), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_75) (by decide +kernel)]
  simp only [w6U2, w6U, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_U202 : 6 ^ 6 * w6U2 (cubicKernel F) 0 2 = gsum (phiC F) wg6_75 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![2, 0, 1, 4, 5, 3])
    (es := ([(0, 3), (0, 4), (2, 5), (4, 5), (3, 5), (3, 4), (1, 2), (1, 2), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_75) (by decide +kernel)]
  simp only [w6U2, w6U, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_U210 : 6 ^ 6 * w6U2 (cubicKernel F) 1 0 = gsum (phiC F) wg6_75 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![4, 5, 2, 3, 1, 0])
    (es := ([(0, 3), (1, 3), (2, 5), (4, 5), (4, 5), (3, 4), (0, 2), (1, 2), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_75) (by decide +kernel)]
  simp only [w6U2, w6U, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_U211 : 6 ^ 6 * w6U2 (cubicKernel F) 1 1 = gsum (phiC F) wg6_76 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 1, 2, 3, 4, 5])
    (es := ([(0, 3), (1, 4), (2, 5), (3, 5), (4, 5), (3, 4), (0, 2), (1, 2), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_76) (by decide +kernel)]
  simp only [w6U2, w6U, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_U212 : 6 ^ 6 * w6U2 (cubicKernel F) 1 2 = gsum (phiC F) wg6_76 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 1, 2, 3, 4, 5])
    (es := ([(0, 3), (1, 4), (2, 5), (4, 5), (3, 5), (3, 4), (0, 2), (1, 2), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_76) (by decide +kernel)]
  simp only [w6U2, w6U, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_U220 : 6 ^ 6 * w6U2 (cubicKernel F) 2 0 = gsum (phiC F) wg6_75 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![4, 5, 2, 3, 1, 0])
    (es := ([(0, 3), (1, 3), (2, 5), (4, 5), (4, 5), (3, 4), (1, 2), (0, 2), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_75) (by decide +kernel)]
  simp only [w6U2, w6U, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_U221 : 6 ^ 6 * w6U2 (cubicKernel F) 2 1 = gsum (phiC F) wg6_76 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 1, 2, 3, 4, 5])
    (es := ([(0, 3), (1, 4), (2, 5), (3, 5), (4, 5), (3, 4), (1, 2), (0, 2), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_76) (by decide +kernel)]
  simp only [w6U2, w6U, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_U222 : 6 ^ 6 * w6U2 (cubicKernel F) 2 2 = gsum (phiC F) wg6_76 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 1, 2, 3, 4, 5])
    (es := ([(0, 3), (1, 4), (2, 5), (4, 5), (3, 5), (3, 4), (1, 2), (0, 2), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_76) (by decide +kernel)]
  simp only [w6U2, w6U, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_T3000 : 6 ^ 6 * w6T3 (cubicKernel F) 0 0 0 = gsum (phiC F) wg6_74 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 2, 4, 5, 3, 1])
    (es := ([(0, 5), (0, 5), (3, 4), (3, 4), (1, 2), (1, 2), (4, 5), (2, 3), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_74) (by decide +kernel)]
  simp only [w6T3, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_T3001 : 6 ^ 6 * w6T3 (cubicKernel F) 0 0 1 = gsum (phiC F) wg6_75 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![2, 0, 1, 3, 4, 5])
    (es := ([(0, 4), (0, 5), (3, 4), (3, 5), (1, 2), (1, 2), (4, 5), (2, 3), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_75) (by decide +kernel)]
  simp only [w6T3, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_T3002 : 6 ^ 6 * w6T3 (cubicKernel F) 0 0 2 = gsum (phiC F) wg6_75 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![2, 0, 1, 3, 4, 5])
    (es := ([(0, 5), (0, 4), (3, 4), (3, 5), (1, 2), (1, 2), (4, 5), (2, 3), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_75) (by decide +kernel)]
  simp only [w6T3, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_T3010 : 6 ^ 6 * w6T3 (cubicKernel F) 0 1 0 = gsum (phiC F) wg6_75 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 2, 4, 5, 3, 1])
    (es := ([(0, 5), (0, 5), (2, 4), (3, 4), (1, 2), (1, 3), (4, 5), (2, 3), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_75) (by decide +kernel)]
  simp only [w6T3, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_T3011 : 6 ^ 6 * w6T3 (cubicKernel F) 0 1 1 = gsum (phiC F) wg6_76 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 3, 4, 5, 1, 2])
    (es := ([(0, 4), (0, 5), (2, 4), (3, 5), (1, 2), (1, 3), (4, 5), (2, 3), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_76) (by decide +kernel)]
  simp only [w6T3, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_T3012 : 6 ^ 6 * w6T3 (cubicKernel F) 0 1 2 = gsum (phiC F) wg6_76 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 3, 4, 5, 1, 2])
    (es := ([(0, 5), (0, 4), (2, 4), (3, 5), (1, 2), (1, 3), (4, 5), (2, 3), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_76) (by decide +kernel)]
  simp only [w6T3, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_T3020 : 6 ^ 6 * w6T3 (cubicKernel F) 0 2 0 = gsum (phiC F) wg6_75 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 2, 4, 5, 3, 1])
    (es := ([(0, 5), (0, 5), (3, 4), (2, 4), (1, 2), (1, 3), (4, 5), (2, 3), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_75) (by decide +kernel)]
  simp only [w6T3, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_T3021 : 6 ^ 6 * w6T3 (cubicKernel F) 0 2 1 = gsum (phiC F) wg6_76 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 3, 4, 5, 2, 1])
    (es := ([(0, 4), (0, 5), (3, 4), (2, 5), (1, 2), (1, 3), (4, 5), (2, 3), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_76) (by decide +kernel)]
  simp only [w6T3, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_T3022 : 6 ^ 6 * w6T3 (cubicKernel F) 0 2 2 = gsum (phiC F) wg6_76 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 3, 4, 5, 2, 1])
    (es := ([(0, 5), (0, 4), (3, 4), (2, 5), (1, 2), (1, 3), (4, 5), (2, 3), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_76) (by decide +kernel)]
  simp only [w6T3, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_T3100 : 6 ^ 6 * w6T3 (cubicKernel F) 1 0 0 = gsum (phiC F) wg6_75 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![4, 5, 2, 0, 1, 3])
    (es := ([(0, 5), (1, 5), (3, 4), (3, 4), (0, 2), (1, 2), (4, 5), (2, 3), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_75) (by decide +kernel)]
  simp only [w6T3, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_T3101 : 6 ^ 6 * w6T3 (cubicKernel F) 1 0 1 = gsum (phiC F) wg6_76 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 1, 2, 5, 3, 4])
    (es := ([(0, 4), (1, 5), (3, 4), (3, 5), (0, 2), (1, 2), (4, 5), (2, 3), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_76) (by decide +kernel)]
  simp only [w6T3, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_T3102 : 6 ^ 6 * w6T3 (cubicKernel F) 1 0 2 = gsum (phiC F) wg6_76 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 1, 2, 5, 4, 3])
    (es := ([(0, 5), (1, 4), (3, 4), (3, 5), (0, 2), (1, 2), (4, 5), (2, 3), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_76) (by decide +kernel)]
  simp only [w6T3, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_T3110 : 6 ^ 6 * w6T3 (cubicKernel F) 1 1 0 = gsum (phiC F) wg6_76 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 1, 3, 4, 5, 2])
    (es := ([(0, 5), (1, 5), (2, 4), (3, 4), (0, 2), (1, 3), (4, 5), (2, 3), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_76) (by decide +kernel)]
  simp only [w6T3, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_T3111 : 6 ^ 6 * w6T3 (cubicKernel F) 1 1 1 = gsum (phiC F) wg6_76 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 3, 1, 4, 2, 5])
    (es := ([(0, 4), (1, 5), (2, 4), (3, 5), (0, 2), (1, 3), (4, 5), (2, 3), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_76) (by decide +kernel)]
  simp only [w6T3, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_T3112 : 6 ^ 6 * w6T3 (cubicKernel F) 1 1 2 = gsum (phiC F) wg6_77 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 1, 2, 4, 5, 3])
    (es := ([(0, 5), (1, 4), (2, 4), (3, 5), (0, 2), (1, 3), (4, 5), (2, 3), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_77) (by decide +kernel)]
  simp only [w6T3, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_T3120 : 6 ^ 6 * w6T3 (cubicKernel F) 1 2 0 = gsum (phiC F) wg6_76 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 1, 3, 4, 5, 2])
    (es := ([(0, 5), (1, 5), (3, 4), (2, 4), (0, 2), (1, 3), (4, 5), (2, 3), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_76) (by decide +kernel)]
  simp only [w6T3, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_T3121 : 6 ^ 6 * w6T3 (cubicKernel F) 1 2 1 = gsum (phiC F) wg6_77 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 1, 2, 4, 3, 5])
    (es := ([(0, 4), (1, 5), (3, 4), (2, 5), (0, 2), (1, 3), (4, 5), (2, 3), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_77) (by decide +kernel)]
  simp only [w6T3, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_T3122 : 6 ^ 6 * w6T3 (cubicKernel F) 1 2 2 = gsum (phiC F) wg6_76 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 3, 1, 4, 5, 2])
    (es := ([(0, 5), (1, 4), (3, 4), (2, 5), (0, 2), (1, 3), (4, 5), (2, 3), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_76) (by decide +kernel)]
  simp only [w6T3, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_T3200 : 6 ^ 6 * w6T3 (cubicKernel F) 2 0 0 = gsum (phiC F) wg6_75 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![4, 5, 2, 0, 1, 3])
    (es := ([(0, 5), (1, 5), (3, 4), (3, 4), (1, 2), (0, 2), (4, 5), (2, 3), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_75) (by decide +kernel)]
  simp only [w6T3, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_T3201 : 6 ^ 6 * w6T3 (cubicKernel F) 2 0 1 = gsum (phiC F) wg6_76 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 1, 2, 5, 3, 4])
    (es := ([(0, 4), (1, 5), (3, 4), (3, 5), (1, 2), (0, 2), (4, 5), (2, 3), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_76) (by decide +kernel)]
  simp only [w6T3, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_T3202 : 6 ^ 6 * w6T3 (cubicKernel F) 2 0 2 = gsum (phiC F) wg6_76 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 1, 2, 5, 4, 3])
    (es := ([(0, 5), (1, 4), (3, 4), (3, 5), (1, 2), (0, 2), (4, 5), (2, 3), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_76) (by decide +kernel)]
  simp only [w6T3, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_T3210 : 6 ^ 6 * w6T3 (cubicKernel F) 2 1 0 = gsum (phiC F) wg6_76 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 1, 4, 3, 5, 2])
    (es := ([(0, 5), (1, 5), (2, 4), (3, 4), (1, 2), (0, 3), (4, 5), (2, 3), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_76) (by decide +kernel)]
  simp only [w6T3, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_T3211 : 6 ^ 6 * w6T3 (cubicKernel F) 2 1 1 = gsum (phiC F) wg6_77 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 1, 4, 2, 3, 5])
    (es := ([(0, 4), (1, 5), (2, 4), (3, 5), (1, 2), (0, 3), (4, 5), (2, 3), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_77) (by decide +kernel)]
  simp only [w6T3, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_T3212 : 6 ^ 6 * w6T3 (cubicKernel F) 2 1 2 = gsum (phiC F) wg6_76 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 3, 4, 1, 5, 2])
    (es := ([(0, 5), (1, 4), (2, 4), (3, 5), (1, 2), (0, 3), (4, 5), (2, 3), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_76) (by decide +kernel)]
  simp only [w6T3, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_T3220 : 6 ^ 6 * w6T3 (cubicKernel F) 2 2 0 = gsum (phiC F) wg6_76 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 1, 4, 3, 5, 2])
    (es := ([(0, 5), (1, 5), (3, 4), (2, 4), (1, 2), (0, 3), (4, 5), (2, 3), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_76) (by decide +kernel)]
  simp only [w6T3, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_T3221 : 6 ^ 6 * w6T3 (cubicKernel F) 2 2 1 = gsum (phiC F) wg6_76 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 3, 4, 1, 2, 5])
    (es := ([(0, 4), (1, 5), (3, 4), (2, 5), (1, 2), (0, 3), (4, 5), (2, 3), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_76) (by decide +kernel)]
  simp only [w6T3, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

lemma w6term_T3222 : 6 ^ 6 * w6T3 (cubicKernel F) 2 2 2 = gsum (phiC F) wg6_77 (fun _ => []) := by
  rw [← gsum_iso (phiC_permInv F) (phiC_relabel F) (π := ![0, 1, 4, 2, 5, 3])
    (es := ([(0, 5), (1, 4), (3, 4), (2, 5), (1, 2), (0, 3), (4, 5), (2, 3), (0, 1)] : List (Fin 6 × Fin 6))) (es' := wg6_77) (by decide +kernel)]
  simp only [w6T3, w6C, kerC, Finset.sum_mul, Finset.mul_sum]
  w6close

end terms

/-! ### Factorisation of the disconnected graphs -/

section factor

variable (F : MvPolynomial ι ℝ)

/-- Unfold a closed graph sum into nested sums of products of the constants `cw`. -/
macro "w6unfold" : tactic => `(tactic| (
  simp only [gsum_cons, gsum_nil]
  simp only [phiC, Fin.prod_univ_six, Fin.prod_univ_four, Fin.prod_univ_two]
  simp only [addE_apply, Fin.isValue, Fin.reduceEq, ite_true, ite_false, List.nil_append,
    List.cons_append, List.append_nil]))

lemma gsum_wg4_15 : gsum (phiC F) wg4_15 (fun _ => []) = gsum (phiC F) wg2_3 (fun _ => []) ^ 2 := by
  simp only [wg4_15, wg2_3]
  w6unfold
  simp only [sq, Finset.sum_mul, Finset.mul_sum]
  iterate 6 refine Finset.sum_congr rfl fun _ _ => ?_
  ring

lemma gsum_wg6_69 : gsum (phiC F) wg6_69 (fun _ => []) = gsum (phiC F) wg2_3 (fun _ => []) ^ 3 := by
  simp only [wg6_69, wg2_3]
  w6unfold
  simp only [pow_succ, pow_zero, one_mul, Finset.sum_mul, Finset.mul_sum]
  iterate 9 refine Finset.sum_congr rfl fun _ _ => ?_
  ring

lemma gsum_wg6_70 : gsum (phiC F) wg6_70 (fun _ => [])
    = gsum (phiC F) wg2_3 (fun _ => []) * gsum (phiC F) wg4_16 (fun _ => []) := by
  simp only [wg6_70, wg2_3, wg4_16]
  w6unfold
  simp only [Finset.sum_mul]
  simp only [Finset.mul_sum]
  iterate 9 refine Finset.sum_congr rfl fun _ _ => ?_
  ring

lemma gsum_wg6_71 : gsum (phiC F) wg6_71 (fun _ => [])
    = gsum (phiC F) wg2_3 (fun _ => []) * gsum (phiC F) wg4_17 (fun _ => []) := by
  simp only [wg6_71, wg2_3, wg4_17]
  w6unfold
  simp only [Finset.sum_mul]
  simp only [Finset.mul_sum]
  iterate 9 refine Finset.sum_congr rfl fun _ _ => ?_
  ring

end factor

/-! ### The sixth cumulant -/

variable [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ} {F : MvPolynomial ι ℝ}

/-- **The sixth cumulant of a cubic chaos** (the field `wick6`):
`κ₆/46656 = 135/2 T₃ − 20 V + 135/2 Q + 165/2 ⟨D,U⟩ + 45 ‖U‖²` for the kernel `f = ∂³F/6`. -/
theorem Chaos3.wick6 (hE : IsGaussianExpectation E) (hF : Chaos3 F) :
    (E (F ^ 6) - 15 * E (F ^ 4) * E (F ^ 2) + 30 * E (F ^ 2) ^ 3) / 46656
      = 135 / 2 * tenT3 (cubicKernel F) - 20 * tenV (cubicKernel F)
        + 135 / 2 * tenQ (cubicKernel F) + 165 / 2 * tenDU (cubicKernel F)
        + 45 * tenU2 (cubicKernel F) := by
  rw [wg6_moment hE hF, wg4_moment hE hF, wg2_moment hE hF]
  rw [gval_full hE hF wg2_3 (by decide), gval_full hE hF wg4_15 (by decide),
    gval_full hE hF wg4_16 (by decide), gval_full hE hF wg4_17 (by decide),
    gval_full hE hF wg6_69 (by decide), gval_full hE hF wg6_70 (by decide),
    gval_full hE hF wg6_71 (by decide), gval_full hE hF wg6_72 (by decide),
    gval_full hE hF wg6_73 (by decide), gval_full hE hF wg6_74 (by decide),
    gval_full hE hF wg6_75 (by decide), gval_full hE hF wg6_76 (by decide),
    gval_full hE hF wg6_77 (by decide)]
  rw [gsum_wg4_15, gsum_wg6_69, gsum_wg6_70, gsum_wg6_71]
  rw [tenT3_eq_w6T3, tenQ_eq_w6Q, tenDU_eq_w6DU, tenU2_eq_w6U2]
  simp only [Fin.sum_univ_three]
  have hV := w6term_V F
  have hQ0 := w6term_Q0 F
  have hQ1 := w6term_Q1 F
  have hQ2 := w6term_Q2 F
  have hDU0 := w6term_DU0 F
  have hDU1 := w6term_DU1 F
  have hDU2 := w6term_DU2 F
  have hU200 := w6term_U200 F
  have hU201 := w6term_U201 F
  have hU202 := w6term_U202 F
  have hU210 := w6term_U210 F
  have hU211 := w6term_U211 F
  have hU212 := w6term_U212 F
  have hU220 := w6term_U220 F
  have hU221 := w6term_U221 F
  have hU222 := w6term_U222 F
  have hT3000 := w6term_T3000 F
  have hT3001 := w6term_T3001 F
  have hT3002 := w6term_T3002 F
  have hT3010 := w6term_T3010 F
  have hT3011 := w6term_T3011 F
  have hT3012 := w6term_T3012 F
  have hT3020 := w6term_T3020 F
  have hT3021 := w6term_T3021 F
  have hT3022 := w6term_T3022 F
  have hT3100 := w6term_T3100 F
  have hT3101 := w6term_T3101 F
  have hT3102 := w6term_T3102 F
  have hT3110 := w6term_T3110 F
  have hT3111 := w6term_T3111 F
  have hT3112 := w6term_T3112 F
  have hT3120 := w6term_T3120 F
  have hT3121 := w6term_T3121 F
  have hT3122 := w6term_T3122 F
  have hT3200 := w6term_T3200 F
  have hT3201 := w6term_T3201 F
  have hT3202 := w6term_T3202 F
  have hT3210 := w6term_T3210 F
  have hT3211 := w6term_T3211 F
  have hT3212 := w6term_T3212 F
  have hT3220 := w6term_T3220 F
  have hT3221 := w6term_T3221 F
  have hT3222 := w6term_T3222 F
  linear_combination (20 / 46656) * hV + (-(45 / 2) / 46656) * hQ0 + (-(45 / 2) / 46656) * hQ1 + (-(45 / 2) / 46656) * hQ2 + (-(55 / 2) / 46656) * hDU0 + (-(55 / 2) / 46656) * hDU1 + (-(55 / 2) / 46656) * hDU2 + (-5 / 46656) * hU200 + (-5 / 46656) * hU201 + (-5 / 46656) * hU202 + (-5 / 46656) * hU210 + (-5 / 46656) * hU211 + (-5 / 46656) * hU212 + (-5 / 46656) * hU220 + (-5 / 46656) * hU221 + (-5 / 46656) * hU222 + (-(5 / 2) / 46656) * hT3000 + (-(5 / 2) / 46656) * hT3001 + (-(5 / 2) / 46656) * hT3002 + (-(5 / 2) / 46656) * hT3010 + (-(5 / 2) / 46656) * hT3011 + (-(5 / 2) / 46656) * hT3012 + (-(5 / 2) / 46656) * hT3020 + (-(5 / 2) / 46656) * hT3021 + (-(5 / 2) / 46656) * hT3022 + (-(5 / 2) / 46656) * hT3100 + (-(5 / 2) / 46656) * hT3101 + (-(5 / 2) / 46656) * hT3102 + (-(5 / 2) / 46656) * hT3110 + (-(5 / 2) / 46656) * hT3111 + (-(5 / 2) / 46656) * hT3112 + (-(5 / 2) / 46656) * hT3120 + (-(5 / 2) / 46656) * hT3121 + (-(5 / 2) / 46656) * hT3122 + (-(5 / 2) / 46656) * hT3200 + (-(5 / 2) / 46656) * hT3201 + (-(5 / 2) / 46656) * hT3202 + (-(5 / 2) / 46656) * hT3210 + (-(5 / 2) / 46656) * hT3211 + (-(5 / 2) / 46656) * hT3212 + (-(5 / 2) / 46656) * hT3220 + (-(5 / 2) / 46656) * hT3221 + (-(5 / 2) / 46656) * hT3222

end

end Grothe.LowerAnalytic
