import Grothe.UpperChaos.RationalUnitRealKernelContinuity
import Grothe.UpperChaos.ProfileIntervalBands
import Grothe.UpperChaos.ReciprocalQuadrature

/-!
# The actual retained source on a finite rectangular mesh

The continuous compiled evaluator agrees with the production kernel in the
interior of every physical rectangle. Exact interval identities turn the
finite-union source pairing into the sum of retained rectangles, so numerical
certificates need not subtract overlapping large-domain enclosures.

Agent-ID: codex-2ca4
-/

open MeasureTheory Set
open scoped InnerProductSpace

namespace Grothe.UpperChaos
open RationalUnitRealKernelContinuity QuadraturePartition
noncomputable section

/-- The checked real evaluator, in auxiliary-first integration order. -/
def unitRectangleKernel {N : ℕ} (i : GradedIdx N) (j : ℕ) (η u s : ℝ) : ℂ :=
  (unitRealKernel i j η s u : ℂ)

private theorem continuous_ofReal_swap (f : ℝ → ℝ → ℝ)
    (hf : Continuous f.uncurry) :
    Continuous (fun p : ℝ × ℝ => (f p.2 p.1 : ℂ)) := by
  have hswap : Continuous (fun p : ℝ × ℝ => (p.2, p.1)) :=
    continuous_snd.prodMk continuous_fst
  have hreal : Continuous (fun p : ℝ × ℝ => f p.2 p.1) := hf.comp hswap
  exact Complex.continuous_ofReal.comp hreal

theorem continuous_unitRectangleKernel {N : ℕ} (i : GradedIdx N) (j : ℕ) (η : ℝ) :
    Continuous (unitRectangleKernel i j η).uncurry := by
  change Continuous (fun p : ℝ × ℝ => (unitRealKernel i j η p.2 p.1 : ℂ))
  exact continuous_ofReal_swap (unitRealKernel i j η) (continuous_unitRealKernel i j η)

/-- No endpoint identity at auxiliary zero is needed to identify the actual cell. -/
theorem rectangleIntegral_unit_eq_continuous {N : ℕ} (i : GradedIdx N) (j : ℕ)
    (η a b c d : ℝ) (ha : 0 ≤ a) (hab : a ≤ b) (hc : 0 ≤ c) (hcd : c ≤ d) :
    rectangleIntegral (taylorQuadratureKernel η j N (gradedUnitCoeff i)) a b c d =
      rectangleIntegral (unitRectangleKernel i j η) a b c d := by
  unfold rectangleIntegral
  apply intervalIntegral.integral_congr_Ioo_of_le hab
  intro u hu
  apply intervalIntegral.integral_congr_Ioo_of_le hcd
  intro s hs
  exact taylorQuadratureKernel_unit_eq_realKernel i j η u s
    (ha.trans_lt hu.1) (hc.trans hs.1.le)

theorem compactTaylorQuadratureValue_unit_eq_rectangle {N : ℕ} (i : GradedIdx N)
    (j : ℕ) (η T L : ℝ) (hL : 0 ≤ L) :
    compactTaylorQuadratureValue η T L j N (gradedUnitCoeff i) =
      (Real.sqrt Real.pi : ℂ)⁻¹ *
        rectangleIntegral (unitRectangleKernel i j η) 0 (Real.sqrt T) 0 L := by
  unfold compactTaylorQuadratureValue
  congr 1
  exact rectangleIntegral_unit_eq_continuous i j η 0 (Real.sqrt T) 0 L
    (by norm_num) (Real.sqrt_nonneg T) (by norm_num) hL

theorem compactTaylorQuadratureValue_unit_sub {N : ℕ} (i : GradedIdx N)
    (j : ℕ) (η T a b : ℝ) (ha : 0 ≤ a) (hab : a ≤ b) :
    compactTaylorQuadratureValue η T b j N (gradedUnitCoeff i) -
      compactTaylorQuadratureValue η T a j N (gradedUnitCoeff i) =
      (Real.sqrt Real.pi : ℂ)⁻¹ *
        rectangleIntegral (unitRectangleKernel i j η) 0 (Real.sqrt T) a b := by
  rw [compactTaylorQuadratureValue_unit_eq_rectangle i j η T b (ha.trans hab),
    compactTaylorQuadratureValue_unit_eq_rectangle i j η T a ha, ← mul_sub,
    rectangleIntegral_radial_prefix_sub _ (continuous_unitRectangleKernel i j η)]

theorem profileIntervalCorrectionValue_unit_eq_rectangles {N : ℕ} (i : GradedIdx N)
    (j : ℕ) (a b : ℝ) (ha : 0 ≤ a) (hab : a ≤ b) :
    profileIntervalCorrectionValue a b j N (gradedUnitCoeff i) =
      (Real.sqrt Real.pi : ℂ)⁻¹ *
        (rectangleIntegral (unitRectangleKernel i j finiteLaplaceEta) 0 (2 ^ 53) a b -
          rectangleIntegral (unitRectangleKernel i j finiteLaplaceEta) 0 100 a b) := by
  have hshort : Real.sqrt (10000 : ℝ) = 100 := by norm_num
  rw [profileIntervalCorrectionValue,
    compactTaylorQuadratureValue_unit_sub i j _ _ a b ha hab,
    compactTaylorQuadratureValue_unit_sub i j _ _ a b ha hab,
    sqrt_finiteLaplaceCutoff, finiteLaplaceEndpoint, hshort, ← mul_sub]

theorem profileIntervalQuadratureValue_unit_eq_rectangles {ι : Type*} (I : Finset ι)
    (a b : ι → ℝ) {N : ℕ} (i : GradedIdx N) (j : ℕ)
    (ha : ∀ k ∈ I, 0 ≤ a k) (hab : ∀ k ∈ I, a k ≤ b k) :
    profileIntervalQuadratureValue I a b j N (gradedUnitCoeff i) =
      (Real.sqrt Real.pi : ℂ)⁻¹ *
        (rectangleIntegral (unitRectangleKernel i j finiteLaplaceEta) 0 (2 ^ 53) 0 80 -
          ∑ k ∈ I,
            (rectangleIntegral (unitRectangleKernel i j finiteLaplaceEta) 0 (2 ^ 53) (a k) (b k) -
              rectangleIntegral (unitRectangleKernel i j finiteLaplaceEta) 0 100 (a k) (b k))) := by
  have hs : (∑ k ∈ I, profileIntervalCorrectionValue (a k) (b k) j N (gradedUnitCoeff i)) =
      ∑ k ∈ I, (Real.sqrt Real.pi : ℂ)⁻¹ *
        (rectangleIntegral (unitRectangleKernel i j finiteLaplaceEta) 0 (2 ^ 53) (a k) (b k) -
          rectangleIntegral (unitRectangleKernel i j finiteLaplaceEta) 0 100 (a k) (b k)) := by
    apply Finset.sum_congr rfl
    intro k hk
    exact profileIntervalCorrectionValue_unit_eq_rectangles i j (a k) (b k) (ha k hk) (hab k hk)
  rw [profileIntervalQuadratureValue, hs, ← Finset.mul_sum,
    compactTaylorQuadratureValue_unit_eq_rectangle i j _ _ 80 (by norm_num),
    sqrt_finiteLaplaceCutoff, finiteLaplaceEndpoint, mul_sub]

/-- Each radial strip retains either the short or full auxiliary interval. -/
def retainedMeshValue {N : ℕ} (i : GradedIdx N) (j : ℕ) (a : ℕ → ℝ) (n : ℕ)
    (selected : ℕ → Prop) [DecidablePred selected] : ℂ :=
  (Real.sqrt Real.pi : ℂ)⁻¹ * ∑ k ∈ Finset.range n,
    rectangleIntegral (unitRectangleKernel i j finiteLaplaceEta)
      0 (if selected k then 100 else 2 ^ 53) (a k) (a (k + 1))

/-- The finite-union coefficient equals the sum of retained, nonoverlapping rectangles. -/
theorem profileIntervalQuadratureValue_mesh_eq_retained {N : ℕ} (i : GradedIdx N)
    (j : ℕ) (a : ℕ → ℝ) (n : ℕ) (selected : ℕ → Prop) [DecidablePred selected]
    (hmono : Monotone a) (hleft : a 0 = 0) (hright : a n = 80) :
    profileIntervalQuadratureValue ((Finset.range n).filter selected)
      a (fun k => a (k + 1)) j N (gradedUnitCoeff i) = retainedMeshValue i j a n selected := by
  rw [profileIntervalQuadratureValue_unit_eq_rectangles _ a (fun k => a (k + 1)) i j
    (fun k _ => by simpa only [hleft] using hmono (Nat.zero_le k))
    (fun k _ => hmono (Nat.le_succ k)), Finset.sum_filter]
  unfold retainedMeshValue
  congr 1
  have he := rectangleIntegral_sub_selected_eq_retained
    (unitRectangleKernel i j finiteLaplaceEta) (continuous_unitRectangleKernel i j finiteLaplaceEta)
    0 (2 ^ 53) 100 a n selected
  simpa only [hleft, hright] using he

/-- The actual Gaussian source pairing is exactly the retained rectangular mesh. -/
theorem inner_profileRetained_eq_mesh {N : ℕ} (i : GradedIdx N) (j : ℕ)
    (a : ℕ → ℝ) (n : ℕ) (selected : ℕ → Prop) [DecidablePred selected]
    (hmono : Monotone a) (hleft : a 0 = 0) (hright : a n = 80) :
    ⟪hvec2 (gradedIdx i),
      profileRetainedL2
        (profileIntervalUnion ((Finset.range n).filter selected) a (fun k => a (k + 1)))
        (measurableSet_profileIntervalUnion _ _ _) j⟫_ℂ = retainedMeshValue i j a n selected := by
  have ha (k : ℕ) (_hk : k ∈ (Finset.range n).filter selected) : 0 ≤ a k := by
    simpa only [hleft] using hmono (Nat.zero_le k)
  have hab (k : ℕ) (_hk : k ∈ (Finset.range n).filter selected) : a k ≤ a (k + 1) :=
    hmono (Nat.le_succ k)
  have hb (k : ℕ) (hk : k ∈ (Finset.range n).filter selected) : a (k + 1) ≤ 80 := by
    have hkn : k < n := Finset.mem_range.mp (Finset.mem_filter.mp hk).1
    simpa only [hright] using hmono (Nat.succ_le_of_lt hkn)
  have hd : (((Finset.range n).filter selected : Finset ℕ) : Set ℕ).PairwiseDisjoint
      (fun k => Ioc (a k) (a (k + 1))) := by
    intro k _hk l _hl hkl
    rcases lt_or_gt_of_ne hkl with h | h
    · exact Ioc_disjoint_Ioc_of_le (hmono (Nat.succ_le_of_lt h))
    · exact (Ioc_disjoint_Ioc_of_le (hmono (Nat.succ_le_of_lt h))).symm
  rw [← gradedHermite_unit i,
    inner_profileRetained_eq_intervalQuadrature _ _ _ j N (gradedUnitCoeff i) ha hab hb hd]
  exact profileIntervalQuadratureValue_mesh_eq_retained i j a n selected hmono hleft hright

/-- The same exact mesh, with the auxiliary tail in a bounded reciprocal coordinate. -/
def retainedReciprocalMeshValue {N : ℕ} (i : GradedIdx N) (j : ℕ) (a : ℕ → ℝ) (n : ℕ)
    (selected : ℕ → Prop) [DecidablePred selected] : ℂ :=
  (Real.sqrt Real.pi : ℂ)⁻¹ * ∑ k ∈ Finset.range n,
    (rectangleIntegral (unitRectangleKernel i j finiteLaplaceEta) 0 1 (a k) (a (k + 1)) +
      rectangleIntegral (reciprocalKernel (unitRectangleKernel i j finiteLaplaceEta))
        (if selected k then (100 : ℝ)⁻¹ else ((2 : ℝ) ^ 53)⁻¹) 1 (a k) (a (k + 1)))

theorem retainedMeshValue_eq_reciprocal {N : ℕ} (i : GradedIdx N) (j : ℕ)
    (a : ℕ → ℝ) (n : ℕ) (selected : ℕ → Prop) [DecidablePred selected] :
    retainedMeshValue i j a n selected = retainedReciprocalMeshValue i j a n selected := by
  unfold retainedMeshValue retainedReciprocalMeshValue
  congr 1
  apply Finset.sum_congr rfl
  intro k _hk
  by_cases hk : selected k
  · simp only [hk, ite_true]
    exact rectangleIntegral_eq_initial_add_reciprocal _
      (continuous_unitRectangleKernel i j finiteLaplaceEta) 100 _ _ (by norm_num)
  · simp only [hk, ite_false]
    exact rectangleIntegral_eq_initial_add_reciprocal _
      (continuous_unitRectangleKernel i j finiteLaplaceEta) (2 ^ 53) _ _ (by positivity)

/-- Every retained actual Gaussian coefficient is a finite mesh of bounded
auxiliary and reciprocal-auxiliary rectangles, with the Jacobian included. -/
theorem inner_profileRetained_eq_reciprocalMesh {N : ℕ} (i : GradedIdx N) (j : ℕ)
    (a : ℕ → ℝ) (n : ℕ) (selected : ℕ → Prop) [DecidablePred selected]
    (hmono : Monotone a) (hleft : a 0 = 0) (hright : a n = 80) :
    ⟪hvec2 (gradedIdx i),
      profileRetainedL2
        (profileIntervalUnion ((Finset.range n).filter selected) a (fun k => a (k + 1)))
        (measurableSet_profileIntervalUnion _ _ _) j⟫_ℂ =
      retainedReciprocalMeshValue i j a n selected := by
  rw [inner_profileRetained_eq_mesh i j a n selected hmono hleft hright,
    retainedMeshValue_eq_reciprocal]

end
end Grothe.UpperChaos
