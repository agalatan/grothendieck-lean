import Grothe.Lower.SharedGateSaving

set_option warningAsError true

/-!
# The common Gaussian gate for a finite mixture of rows

The Schur complement prices the actual common coordinates. Its gain over the scalar baselines
is concave in the row weights, so rational endpoint prices bound real weights between them.

Agent-ID: codex-a7c4
-/

open MeasureTheory
open scoped BigOperators

namespace Grothe.Lower.SharedGate.WeightedSchur

/-- First quadratic coefficient, two cross coefficients, and the trailing symmetric block. -/
structure Gate where
  n : ℝ
  x : ℝ
  y : ℝ
  a : ℝ
  b : ℝ
  c : ℝ

noncomputable def ofRow (r : Row) : Gate :=
  ⟨(r.N.m11 : ℝ) + 2 * r.g1, (r.N.m12 : ℝ) + r.g2, (r.N.m13 : ℝ) + r.g3,
    r.N.m22, r.N.m23, r.N.m33⟩

def form (g : Gate) (p u v : ℝ) : ℝ :=
  g.n * p^2 + 2*g.x*p*u + 2*g.y*p*v + g.a*u^2 + 2*g.b*u*v + g.c*v^2

def det (g : Gate) : ℝ := g.a*g.c - g.b^2

def Pos (g : Gate) : Prop := 0 < g.a ∧ 0 < det g

noncomputable def price (g : Gate) : ℝ :=
  g.n - (g.c*g.x^2 - 2*g.b*g.x*g.y + g.a*g.y^2) / det g

theorem pos_of_row (r : Row) (h : gateOK r.N = true) : Pos (ofRow r) := by
  simp only [gateOK, Bool.and_eq_true, decide_eq_true_eq] at h
  constructor
  · change (0 : ℝ) < (r.N.m22 : ℝ)
    exact_mod_cast h.1
  · change (0:ℝ) < (r.N.m22 : ℝ) * r.N.m33 - (r.N.m23 : ℝ)^2
    exact_mod_cast h.2

theorem form_ge (g : Gate) (h : Pos g) (p u v : ℝ) : price g * p^2 ≤ form g p u v :=
  real_completion g.n g.x g.y g.a g.b g.c p u v h.1 h.2

theorem row_gate (r : Row) (p u v : ℂ) :
    r.gate p u v = form (ofRow r) p.re u.re v.re + form (ofRow r) p.im u.im v.im := by
  simp only [Row.gate, gateForm, form, ofRow, hre_eq]
  ring

variable {ι : Type*} [Fintype ι]

/-- The matrix and the first-coordinate terms are both mixed before completion. -/
noncomputable def mix (w : ι → ℝ) (g : ι → Gate) : Gate :=
  ⟨∑ i, w i * (g i).n, ∑ i, w i * (g i).x, ∑ i, w i * (g i).y,
   ∑ i, w i * (g i).a, ∑ i, w i * (g i).b, ∑ i, w i * (g i).c⟩

theorem form_mix (w : ι → ℝ) (g : ι → Gate) (p u v : ℝ) :
    form (mix w g) p u v = ∑ i, w i * form (g i) p u v := by
  simp only [form, mix, Finset.mul_sum, Finset.sum_mul, ← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro i _
  ring

private theorem trailing_pos (g : Gate) (hg : Pos g) (u v : ℝ) (hne : u ≠ 0 ∨ v ≠ 0) :
    0 < form g 0 u v := by
  have hid : g.a * form g 0 u v = (g.a*u+g.b*v)^2 + det g*v^2 := by
    unfold form det
    ring
  have h : 0 < g.a * form g 0 u v := by
    rw [hid]
    by_cases hv : v = 0
    · obtain hu := hne.resolve_right (not_not_intro hv)
      simpa [hv] using (sq_pos_of_ne_zero (mul_ne_zero hg.1.ne' hu))
    · exact add_pos_of_nonneg_of_pos (sq_nonneg _) (mul_pos hg.2 (sq_pos_of_ne_zero hv))
  exact pos_of_mul_pos_right h hg.1.le

theorem mix_pos (w : ι → ℝ) (g : ι → Gate)
    (hw : ∀ i, 0 ≤ w i) (ht : 0 < ∑ i, w i) (hg : ∀ i, Pos (g i)) : Pos (mix w g) := by
  obtain ⟨j, hj⟩ : ∃ j, 0 < w j := by
    by_contra! h
    exact (not_lt_of_ge (Finset.sum_nonpos (fun i _ ↦ h i))) ht
  have htform (u v : ℝ) (h : u ≠ 0 ∨ v ≠ 0) : 0 < form (mix w g) 0 u v := by
    rw [form_mix]
    exact Finset.sum_pos' (fun i _ ↦ mul_nonneg (hw i) (trailing_pos _ (hg i) _ _ h).le)
      ⟨j, Finset.mem_univ _, mul_pos hj (trailing_pos _ (hg j) _ _ h)⟩
  let q := mix w g
  have ha : 0 < q.a := by simpa [form, q] using htform 1 0 (Or.inl one_ne_zero)
  refine ⟨ha, ?_⟩
  have hv := htform (-q.b) q.a (Or.inr ha.ne')
  change 0 < form q 0 (-q.b) q.a at hv
  have hid : form q 0 (-q.b) q.a = q.a * det q := by unfold form det; ring
  rw [hid] at hv
  exact pos_of_mul_pos_right hv ha.le

/-- The coefficient actually retained above the original row baselines. -/
noncomputable def gain (w : ι → ℝ) (r : ι → Row) : ℝ :=
  price (mix w (fun i ↦ ofRow (r i))) - ∑ i, w i * (baseline (r i) : ℝ)

theorem pointwise (w : ι → ℝ) (r : ι → Row)
    (hw : ∀ i, 0 ≤ w i) (ht : 0 < ∑ i, w i) (hr : ∀ i, gateOK (r i).N = true)
    (p u v : ℂ) :
    price (mix w (fun i ↦ ofRow (r i))) * Complex.normSq p ≤ ∑ i, w i * (r i).gate p u v := by
  let g := fun i ↦ ofRow (r i)
  have hpos := mix_pos w g hw ht fun i ↦ pos_of_row _ (hr i)
  have h₁ := form_ge (mix w g) hpos p.re u.re v.re
  have h₂ := form_ge (mix w g) hpos p.im u.im v.im
  simp_rw [row_gate, mul_add]
  rw [Finset.sum_add_distrib, ← form_mix, ← form_mix, Complex.normSq_apply]
  change price (mix w g) * _ ≤ _
  nlinarith only [h₁,h₂]

/-- For every finite mixture the shared gate pays the Schur complement of its weighted
matrix, integrated on the actual common random variables. Weights need not sum to one. -/
theorem weighted_surplus {Ω : Type} [MeasurableSpace Ω] {μ : Measure Ω}
    {U : Ω → ℝ} {x τ : ℝ} {X1 X2 X3 : Ω → ℂ}
    (w : ι → ℝ) (r : ι → Row) (hw : ∀ i, 0 ≤ w i) (ht : 0 < ∑ i, w i)
    (hr : ∀ i, gateOK (r i).N = true) (hM : Moments μ U x)
    (hX : ∀ ω, ‖X1 ω‖ ^ 2 = τ ^ 2 * U ω)
    (hint : ∀ i, Integrable (fun ω ↦ (r i).gate (X1 ω) (X2 ω) (X3 ω)) μ) :
    gain w r * τ ^ 2 ≤ ∑ i, w i * surplus (r i) μ X1 X2 X3 τ := by
  let p := price (mix w (fun i ↦ ofRow (r i)))
  let F := fun i ω ↦ w i * (r i).gate (X1 ω) (X2 ω) (X3 ω)
  have hF (i) : Integrable (F i) μ := (hint i).const_mul (w i)
  have hp (ω) : p * τ ^ 2 * U ω ≤ ∑ i, F i ω := by
    have h := pointwise w r hw ht hr (X1 ω) (X2 ω) (X3 ω)
    rw [Complex.normSq_eq_norm_sq, hX ω, ← mul_assoc] at h
    exact h
  have hi := integral_mono (hM.i1.const_mul _) (integrable_finsetSum _ fun i _ ↦ hF i) hp
  rw [integral_const_mul, hM.m1, mul_one, integral_finsetSum _ fun i _ ↦ hF i] at hi
  simp only [F, integral_const_mul] at hi
  simp only [gain, surplus, sub_mul, Finset.sum_mul, mul_sub, Finset.sum_sub_distrib, mul_assoc]
  exact sub_le_sub_right hi _

/-- The common minimizing second and third real coordinates when the first one is 1. -/
noncomputable def minU (g : Gate) : ℝ := (g.b*g.y - g.c*g.x) / det g

noncomputable def minV (g : Gate) : ℝ := (g.b*g.x - g.a*g.y) / det g

theorem at_min (g : Gate) (h : Pos g) : form g 1 (minU g) (minV g) = price g := by
  have hd := h.2.ne'
  unfold form minU minV price
  field_simp [hd]
  unfold det
  ring

/-- Exact squared distance of a common completion from the minimizer of a single row. -/
theorem excess_eq (g : Gate) (h : Pos g) (u v : ℝ) :
    form g 1 u v = price g + form g 0 (u - minU g) (v - minV g) := by
  have hd := h.2.ne'
  unfold form minU minV price
  field_simp [hd]
  unfold det
  ring

/-- Gain above separately completing the rows, as a finite sum of squared distances. -/
theorem price_decomposition (w : ι → ℝ) (g : ι → Gate) (hw : ∀ i, 0 ≤ w i)
    (ht : 0 < ∑ i, w i) (hg : ∀ i, Pos (g i)) :
    price (mix w g) = (∑ i, w i * price (g i)) +
      ∑ i, w i * form (g i) 0 (minU (mix w g) - minU (g i)) (minV (mix w g) - minV (g i)) := by
  conv_lhs => rw [← at_min _ (mix_pos w g hw ht hg), form_mix]
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro i _
  rw [excess_eq _ (hg i), mul_add]

theorem price_mix_ge (w : ι → ℝ) (g : ι → Gate) (hw : ∀ i, 0 ≤ w i)
    (ht : 0 < ∑ i, w i) (hg : ∀ i, Pos (g i)) :
    ∑ i, w i * price (g i) ≤ price (mix w g) := by
  rw [price_decomposition w g hw ht hg]
  apply le_add_of_nonneg_right
  apply Finset.sum_nonneg
  intro i _
  apply mul_nonneg (hw i)
  simpa using form_ge (g i) (hg i) 0 _ _

/-- A zero total weight gives the zero gate; allow every nonnegative finite mixture. -/
theorem weighted_surplus_nonneg_weights {Ω : Type} [MeasurableSpace Ω] {μ : Measure Ω}
    {U : Ω → ℝ} {x τ : ℝ} {X1 X2 X3 : Ω → ℂ}
    (w : ι → ℝ) (r : ι → Row) (hw : ∀ i, 0 ≤ w i)
    (hr : ∀ i, gateOK (r i).N = true) (hM : Moments μ U x)
    (hX : ∀ ω, ‖X1 ω‖ ^ 2 = τ ^ 2 * U ω)
    (hint : ∀ i, Integrable (fun ω ↦ (r i).gate (X1 ω) (X2 ω) (X3 ω)) μ) :
    gain w r * τ ^ 2 ≤ ∑ i, w i * surplus (r i) μ X1 X2 X3 τ := by
  by_cases ht : 0 < ∑ i, w i
  · exact weighted_surplus w r hw ht hr hM hX hint
  · have hz (i : ι) : w i = 0 := le_antisymm
        ((Finset.single_le_sum (fun j _ ↦ hw j) (Finset.mem_univ i)).trans (le_of_not_gt ht))
        (hw i)
    simp [gain, price, mix, det, hz]

/-- Undoing the weighted completion at any common trial vector gives an affine price majorant. -/
theorem gain_support (w : ι → ℝ) (r : ι → Row) (hw : ∀ i, 0 ≤ w i)
    (ht : 0 < ∑ i, w i) (hr : ∀ i, gateOK (r i).N = true) (u v : ℝ) :
    gain w r ≤ ∑ i, w i * (form (ofRow (r i)) 1 u v - (baseline (r i) : ℝ)) := by
  have h := form_ge _ (mix_pos w _ hw ht (fun i ↦ pos_of_row _ (hr i))) 1 u v
  simp only [one_pow, mul_one, form_mix] at h
  simp only [gain, mul_sub, Finset.sum_sub_distrib]
  exact sub_le_sub_right h _

theorem gain_at_min (w : ι → ℝ) (r : ι → Row) (hw : ∀ i, 0 ≤ w i)
    (ht : 0 < ∑ i, w i) (hr : ∀ i, gateOK (r i).N = true) :
    let g := mix w (fun i ↦ ofRow (r i))
    gain w r = ∑ i, w i * (form (ofRow (r i)) 1 (minU g) (minV g) - (baseline (r i) : ℝ)) := by
  dsimp only
  simp only [gain, mul_sub, Finset.sum_sub_distrib, ← form_mix]
  rw [at_min _ (mix_pos w _ hw ht fun i ↦ pos_of_row _ (hr i))]

/-- Rational endpoint prices give a lower chord on the full real weight segment. -/
theorem gain_chord (w z : ι → ℝ) (r : ι → Row) (hw : ∀ i, 0 ≤ w i) (hz : ∀ i, 0 ≤ z i)
    (htw : 0 < ∑ i, w i) (htz : 0 < ∑ i, z i) (hr : ∀ i, gateOK (r i).N = true)
    (θ : ℝ) (h0 : 0 ≤ θ) (h1 : θ ≤ 1) :
    (1-θ) * gain w r + θ * gain z r ≤ gain (fun i ↦ (1-θ)*w i + θ*z i) r := by
  let m := fun i ↦ (1-θ)*w i + θ*z i
  have hleft := sub_nonneg.mpr h1
  have hm (i) : 0 ≤ m i := add_nonneg (mul_nonneg hleft (hw i)) (mul_nonneg h0 (hz i))
  have htm : 0 < ∑ i, m i := by
    simp only [m, Finset.sum_add_distrib, ← Finset.mul_sum]
    rcases eq_or_lt_of_le h1 with h | h
    · simpa [h] using htz
    · exact add_pos_of_pos_of_nonneg (mul_pos (sub_pos.mpr h) htw) (mul_nonneg h0 htz.le)
  let g := mix m (fun i ↦ ofRow (r i))
  let f := fun i ↦ form (ofRow (r i)) 1 (minU g) (minV g) - (baseline (r i) : ℝ)
  have hwm : gain w r ≤ ∑ i, w i * f i := gain_support w r hw htw hr _ _
  have hzm : gain z r ≤ ∑ i, z i * f i := gain_support z r hz htz hr _ _
  have hmm : gain m r = ∑ i, m i * f i := gain_at_min m r hm htm hr
  change _ ≤ gain m r
  rw [hmm]
  calc (1-θ) * gain w r + θ * gain z r
      ≤ (1-θ)*(∑ i, w i * f i) + θ*(∑ i, z i * f i) :=
        add_le_add (mul_le_mul_of_nonneg_left hwm hleft) (mul_le_mul_of_nonneg_left hzm h0)
    _ = ∑ i, m i * f i := by
      rw [Finset.mul_sum, Finset.mul_sum, ← Finset.sum_add_distrib]
      apply Finset.sum_congr rfl
      intro i _
      dsimp [m]
      ring

end Grothe.Lower.SharedGate.WeightedSchur
