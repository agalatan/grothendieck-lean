import Grothe.UpperChaos.ProductionF0Head
import Grothe.UpperChaos.TaylorRadialTail
import Grothe.UpperChaos.TaylorMoments
import Grothe.UpperChaos.TaylorRadialIntegral

/-!
# The tail and the root gaps of the quadrature (part (T) of `hQuad`, `docs/QUAD_CHECKER.md` §12.4)

The committed partition covers the radial variable `s = |z|²` on `[0, 100]` except three gaps of width
`2.54·10⁻²⁶` at the roots of `vprof`.  The part of every F0 coefficient carried by the uncovered set
`tailSet = (100, ∞) ∪ gaps` is `partCoefficient tailSet q c d = ⟪h_{qcd}, F₀ · 1_{|z|² ∈ tailSet}⟫`,
and by Bessel's inequality in the Hilbert basis `hermiteBasis2` with `|F₀| ≤ 1`,
```
Σ_{q<251} Σ_{c<q+2} Σ_{d<q+1} ‖partCoefficient tailSet q c d‖² ≤ mu2 {u | ‖u.1‖² ∈ tailSet}
  = ∫_{tailSet} e^{−s} ds ≤ e^{−100} + Σ_i (gap_i width) e^{−13} ≤ 10⁻³¹
```
(`norm_tail_sq_le`), with no analysis of the integrand.  `baseGradedCoefficient_eq_part_add` splits
every coefficient into the covered part and the tail.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad.Tail

open MeasureTheory Set Grothe.UpperChaos Grothe.UpperChaos.FixedChaosSmoothing Grothe.LowerAnalytic
open scoped ComplexConjugate InnerProductSpace

noncomputable section

/-! ### The radial events and the parts of the coefficients -/

/-- The radial event `{u | ‖u.1‖² ∈ S}` of the first coordinate. -/
def radialSet (S : Set ℝ) : Set (ℂ × ℂ) := {z : ℂ | ‖z‖ ^ 2 ∈ S} ×ˢ univ

lemma measurableSet_radialSet {S : Set ℝ} (hS : MeasurableSet S) : MeasurableSet (radialSet S) :=
  ((measurable_norm.pow_const 2) hS).prod MeasurableSet.univ

lemma radialSet_compl (S : Set ℝ) : radialSet Sᶜ = (radialSet S)ᶜ := by
  ext u
  simp [radialSet]

/-- The part of the F0 coefficient `(q, c, d)` carried by the radial event `S`. -/
def partCoefficient (S : Set ℝ) (q c d : ℕ) : ℂ :=
  ∫ u in radialSet S, conj (hfun2 (gradedMode q c d) u) * F0 u ∂mu2

/-- Every coefficient is the sum of its part on `S` and its part off `S`. -/
theorem baseGradedCoefficient_eq_part_add {S : Set ℝ} (hS : MeasurableSet S) (q c d : ℕ) :
    baseGradedCoefficient q c d = partCoefficient S q c d + partCoefficient Sᶜ q c d := by
  unfold baseGradedCoefficient partCoefficient
  rw [radialSet_compl, integral_add_compl (measurableSet_radialSet hS) (integrable_baseCoefficient _)]

/-! ### Bessel's inequality for the restricted phase -/

/-- `F₀` restricted to the radial event, as an element of `L²(mu2)`. -/
def F0Part (S : Set ℝ) (hS : MeasurableSet S) : Lp ℂ 2 mu2 :=
  (memLp_baseF0.indicator (measurableSet_radialSet hS)).toLp _

lemma inner_hvec2_F0Part {S : Set ℝ} (hS : MeasurableSet S) (i : Idx2) :
    ⟪hvec2 i, F0Part S hS⟫_ℂ = ∫ u in radialSet S, conj (hfun2 i u) * F0 u ∂mu2 := by
  rw [hvec2, F0Part, inner_toLp2, ← integral_indicator (measurableSet_radialSet hS)]
  congr 1
  funext u
  by_cases hu : u ∈ radialSet S <;> simp [hu]

lemma norm_F0Part_sq_le {S : Set ℝ} (hS : MeasurableSet S) :
    ‖F0Part S hS‖ ^ 2 ≤ mu2.real (radialSet S) := by
  unfold F0Part
  rw [norm_toLp_sq_eq_integral]
  have hI : Integrable ((radialSet S).indicator (fun _ => (1 : ℝ))) mu2 :=
    (integrable_const 1).indicator (measurableSet_radialSet hS)
  calc
    _ ≤ ∫ u, (radialSet S).indicator (fun _ => (1 : ℝ)) u ∂mu2 := by
      apply integral_mono_of_nonneg (Filter.Eventually.of_forall fun _ => sq_nonneg _) hI
      exact Filter.Eventually.of_forall fun u => by
        by_cases hu : u ∈ radialSet S
        · simp only [Set.indicator_of_mem hu]
          have hF : ‖F0 u‖ ≤ 1 := by unfold F0; exact Grothe.Haag.norm_ph_le _
          have h0 := norm_nonneg (F0 u)
          change ‖F0 u‖ ^ 2 ≤ 1
          nlinarith [hF]
        · simp [hu]
    _ = mu2.real (radialSet S) := integral_indicator_one (measurableSet_radialSet hS)

/-- **Bessel**: the parts of the F0 coefficients on a radial event are bounded in `ℓ²` by the
measure of the event. -/
theorem sum_norm_partCoefficient_sq_le (N : ℕ) {S : Set ℝ} (hS : MeasurableSet S) :
    ∑ q ∈ Finset.range N, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      ‖partCoefficient S q c d‖ ^ 2 ≤ mu2.real (radialSet S) := by
  have h := hasSum_energy2 (F0Part S hS)
  have hle := sum_le_hasSum (gradedSupport N) (fun i _ => sq_nonneg ‖⟪hvec2 i, F0Part S hS⟫_ℂ‖) h
  rw [sum_gradedSupport N (fun i => ‖⟪hvec2 i, F0Part S hS⟫_ℂ‖ ^ 2),
    sum_bounded_graded_eq_range N (fun q c d => ‖⟪hvec2 (gradedMode q c d), F0Part S hS⟫_ℂ‖ ^ 2)]
    at hle
  simp_rw [inner_hvec2_F0Part] at hle
  exact hle.trans (norm_F0Part_sq_le hS)

/-! ### The measure of a radial event -/

lemma mu2_real_radialSet (S : Set ℝ) :
    mu2.real (radialSet S) = gaussC.real {z : ℂ | ‖z‖ ^ 2 ∈ S} := by
  simp [radialSet, mu2, measureReal_prod_prod]

/-- The law of `|z|²` under the standard complex Gaussian is exponential: the measure of a radial
event is `∫_S e^{−s} ds`. -/
lemma gaussC_real_radial {S : Set ℝ} (hS : MeasurableSet S) :
    gaussC.real {z : ℂ | ‖z‖ ^ 2 ∈ S} = ∫ s in S ∩ Ioi 0, Real.exp (-s) := by
  have hA : MeasurableSet {z : ℂ | ‖z‖ ^ 2 ∈ S} := (measurable_norm.pow_const 2) hS
  rw [← integral_indicator_one hA]
  have hind : ∀ z : ℂ, {z : ℂ | ‖z‖ ^ 2 ∈ S}.indicator (1 : ℂ → ℝ) z =
      S.indicator (fun _ => (1 : ℝ)) (‖z‖ ^ 2) := by
    intro z
    by_cases hz : ‖z‖ ^ 2 ∈ S <;> simp [hz]
  simp_rw [hind]
  have hc := integral_gaussC_norm_sq_complex (fun s => ((S.indicator (fun _ => (1 : ℝ)) s : ℝ) : ℂ))
    (Complex.measurable_ofReal.comp ((measurable_const).indicator hS))
  rw [integral_complex_ofReal] at hc
  have hr : ∫ s in Ioi (0 : ℝ), (Real.exp (-s) : ℂ) * ((S.indicator (fun _ => (1 : ℝ)) s : ℝ) : ℂ) =
      ((∫ s in Ioi (0 : ℝ), Real.exp (-s) * S.indicator (fun _ => (1 : ℝ)) s : ℝ) : ℂ) := by
    rw [← integral_complex_ofReal]
    push_cast
    rfl
  rw [hr] at hc
  rw [Complex.ofReal_inj.mp hc]
  have hpoint : ∀ s : ℝ, Real.exp (-s) * S.indicator (fun _ => (1 : ℝ)) s =
      S.indicator (fun s => Real.exp (-s)) s := by
    intro s
    by_cases hs : s ∈ S <;> simp [hs]
  simp_rw [hpoint]
  rw [setIntegral_indicator hS, inter_comm]

/-! ### The tail set of the partition -/

/-- The right ends of the panels `210`, `620`, `1025` and the left ends of the panels `211`, `621`,
`1026` of `Q0GaussAddress.sourcePanels`: the three root gaps (`data/quad-checker/panels.txt`). -/
def gap1lo : ℚ := 1992764592858483379217733207240521 / 144115188075855872000000000000000
def gap1hi : ℚ := 15942116742867867033741865687221043 / 1152921504606846976000000000000000
def gap2lo : ℚ := 4800764363527901244487645430436401 / 230584300921369395200000000000000
def gap2hi : ℚ := 150023886360246913890238919884243 / 7205759403792793600000000000000
def gap3lo : ℚ := 29058158379891066357410162512512173 / 1152921504606846976000000000000000
def gap3hi : ℚ := 3632269797486383294676270317726131 / 144115188075855872000000000000000

/-- The radial values the partition does not cover: beyond `100` and the three root gaps. -/
def tailSet : Set ℝ :=
  Ioi 100 ∪ Ioo (gap1lo : ℝ) gap1hi ∪ Ioo (gap2lo : ℝ) gap2hi ∪ Ioo (gap3lo : ℝ) gap3hi

lemma measurableSet_tailSet : MeasurableSet tailSet :=
  ((measurableSet_Ioi.union measurableSet_Ioo).union measurableSet_Ioo).union measurableSet_Ioo

/-- `e^{−n} ≤ (10/27)^n`. -/
lemma exp_neg_nat_le (n : ℕ) : Real.exp (-(n : ℝ)) ≤ (10 / 27 : ℝ) ^ n := by
  have h : (27 / 10 : ℝ) ≤ Real.exp 1 := by
    have := Real.exp_one_gt_d9
    norm_num at this ⊢
    linarith
  calc Real.exp (-(n : ℝ)) = (Real.exp 1 ^ n)⁻¹ := by
        rw [Real.exp_neg, Real.exp_one_pow]
    _ ≤ ((27 / 10 : ℝ) ^ n)⁻¹ := inv_anti₀ (by positivity) (pow_le_pow_left₀ (by norm_num) h n)
    _ = (10 / 27 : ℝ) ^ n := by rw [← inv_pow]; norm_num

/-- The integral of `e^{−s}` over an interval `(a, b)` with `a ≥ n` is at most `(b − a)(10/27)^n`. -/
lemma integral_Ioo_exp_neg_le {a b : ℝ} (n : ℕ) (hab : a ≤ b) (hn : (n : ℝ) ≤ a) :
    ∫ s in Ioo a b, Real.exp (-s) ≤ (b - a) * (10 / 27 : ℝ) ^ n := by
  have hbound : ∀ s ∈ Ioo a b, Real.exp (-s) ≤ (10 / 27 : ℝ) ^ n := by
    intro s hs
    calc Real.exp (-s) ≤ Real.exp (-(n : ℝ)) := Real.exp_le_exp.mpr (by linarith [hs.1])
      _ ≤ _ := exp_neg_nat_le n
  calc ∫ s in Ioo a b, Real.exp (-s) ≤ ∫ _s in Ioo a b, (10 / 27 : ℝ) ^ n := by
        apply setIntegral_mono_on _ _ measurableSet_Ioo hbound
        · exact (integrableOn_exp_mul_Ioi (by norm_num : (-1 : ℝ) < 0) a).mono_set
            Ioo_subset_Ioi_self |>.congr_fun (fun s _ => by simp) measurableSet_Ioo
        · exact integrableOn_const (by simp)
    _ = (b - a) * (10 / 27 : ℝ) ^ n := by
        rw [setIntegral_const, Real.volume_real_Ioo_of_le hab, smul_eq_mul]

lemma integral_Ioi_exp_neg_le : ∫ s in Ioi (100 : ℝ), Real.exp (-s) ≤ (10 / 27 : ℝ) ^ 100 := by
  rw [integral_exp_neg_Ioi]
  exact_mod_cast exp_neg_nat_le 100

/-- The three gaps lie in increasing order between `13` and `100`, with the checkpoints `20` and
`25` below the second and third. -/
private lemma gaps_ordered :
    (13 : ℝ) ≤ gap1lo ∧ (gap1lo : ℝ) ≤ gap1hi ∧ (gap1hi : ℝ) < gap2lo ∧
      (20 : ℝ) ≤ gap2lo ∧ (gap2lo : ℝ) ≤ gap2hi ∧ (gap2hi : ℝ) < gap3lo ∧
      (25 : ℝ) ≤ gap3lo ∧ (gap3lo : ℝ) ≤ gap3hi ∧ (gap3hi : ℝ) < 100 := by
  norm_num [gap1lo, gap1hi, gap2lo, gap2hi, gap3lo, gap3hi]

/-- `∫_{tailSet} e^{−s} ds ≤ 10⁻³¹`. -/
theorem integral_tailSet_le : ∫ s in tailSet ∩ Ioi 0, Real.exp (-s) ≤ 1 / 10 ^ 31 := by
  obtain ⟨g1, g11, g12, g2, g22, g23, g3, g33, g3h⟩ := gaps_ordered
  have hg1 : Ioo (gap1lo : ℝ) gap1hi ⊆ Ioi 0 := fun s hs => mem_Ioi.mpr (by linarith [hs.1])
  have hg2 : Ioo (gap2lo : ℝ) gap2hi ⊆ Ioi 0 := fun s hs => mem_Ioi.mpr (by linarith [hs.1])
  have hg3 : Ioo (gap3lo : ℝ) gap3hi ⊆ Ioi 0 := fun s hs => mem_Ioi.mpr (by linarith [hs.1])
  have h100 : Ioi (100 : ℝ) ⊆ Ioi 0 := Ioi_subset_Ioi (by norm_num)
  unfold tailSet
  rw [inter_eq_left.mpr (union_subset (union_subset (union_subset h100 hg1) hg2) hg3)]
  have hint : IntegrableOn (fun s : ℝ => Real.exp (-s)) (Ioi 0) :=
    (integrableOn_exp_mul_Ioi (by norm_num : (-1 : ℝ) < 0) 0).congr_fun (fun s _ => by simp)
      measurableSet_Ioi
  have hsub : ∀ T ⊆ Ioi (0 : ℝ), IntegrableOn (fun s : ℝ => Real.exp (-s)) T :=
    fun T hT => hint.mono_set hT
  -- the four pieces are pairwise disjoint
  have d1 : Disjoint (Ioi (100 : ℝ)) (Ioo (gap1lo : ℝ) gap1hi) :=
    Set.disjoint_left.mpr fun s h1 h2 => by linarith [mem_Ioi.mp h1, h2.2]
  have d2 : Disjoint (Ioi (100 : ℝ) ∪ Ioo (gap1lo : ℝ) gap1hi) (Ioo (gap2lo : ℝ) gap2hi) :=
    Set.disjoint_left.mpr fun s h1 h2 => by
      rcases h1 with h1 | h1
      · linarith [mem_Ioi.mp h1, h2.2]
      · linarith [h1.2, h2.1]
  have d3 : Disjoint (Ioi (100 : ℝ) ∪ Ioo (gap1lo : ℝ) gap1hi ∪ Ioo (gap2lo : ℝ) gap2hi)
      (Ioo (gap3lo : ℝ) gap3hi) :=
    Set.disjoint_left.mpr fun s h1 h2 => by
      rcases h1 with (h1 | h1) | h1
      · linarith [mem_Ioi.mp h1, h2.2]
      · linarith [h1.2, h2.1]
      · linarith [h1.2, h2.1]
  rw [setIntegral_union d3 measurableSet_Ioo (hsub _ (union_subset (union_subset h100 hg1) hg2))
      (hsub _ hg3),
    setIntegral_union d2 measurableSet_Ioo (hsub _ (union_subset h100 hg1)) (hsub _ hg2),
    setIntegral_union d1 measurableSet_Ioo (hsub _ h100) (hsub _ hg1)]
  have e0 := integral_Ioi_exp_neg_le
  have e1 := integral_Ioo_exp_neg_le 13 g11 (by exact_mod_cast g1)
  have e2 := integral_Ioo_exp_neg_le 20 g22 (by exact_mod_cast g2)
  have e3 := integral_Ioo_exp_neg_le 25 g33 (by exact_mod_cast g3)
  have hnum : (10 / 27 : ℝ) ^ 100 + ((gap1hi : ℝ) - gap1lo) * (10 / 27 : ℝ) ^ 13 +
      ((gap2hi : ℝ) - gap2lo) * (10 / 27 : ℝ) ^ 20 + ((gap3hi : ℝ) - gap3lo) * (10 / 27 : ℝ) ^ 25 ≤
      1 / 10 ^ 31 := by
    norm_num [gap1lo, gap1hi, gap2lo, gap2hi, gap3lo, gap3hi]
  linarith

/-- **(T): the tail and the root gaps carry at most `10⁻³¹` of the squared `ℓ²` norm of the F0
coefficients** (Bessel; no analysis of the integrand). -/
theorem norm_tail_sq_le :
    ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      ‖partCoefficient tailSet q c d‖ ^ 2 ≤ 1 / 10 ^ 31 := by
  calc _ ≤ mu2.real (radialSet tailSet) := sum_norm_partCoefficient_sq_le 251 measurableSet_tailSet
    _ = ∫ s in tailSet ∩ Ioi 0, Real.exp (-s) := by
        rw [mu2_real_radialSet, gaussC_real_radial measurableSet_tailSet]
    _ ≤ 1 / 10 ^ 31 := integral_tailSet_le

end

end Grothe.UpperQuad.Tail
