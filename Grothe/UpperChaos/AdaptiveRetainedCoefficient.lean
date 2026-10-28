import Grothe.UpperChaos.AdaptiveRectangleEnclosure
import Grothe.UpperChaos.GaussianNormalizationInterval
import Grothe.UpperChaos.SmallProfileMesh
import Mathlib.Order.Interval.Finset.Nat

/-!
# Adaptive leaf certificates for the actual retained Gaussian coefficient

The seven fixed radial strips each have a regular and a reciprocal root.
Their real integral identities, local continuity and Gaussian normalization
are proved here, leaving only the certified leaf intervals as numerical data.
The separate source-omission reserve is not spent in this coefficient bound.

Agent-ID: codex-2ca4
-/

open MeasureTheory Set LeanCert.Core

namespace Grothe.UpperChaos.AdaptiveRetainedCoefficient

open AdaptiveRectanglePartition SmallProfileMesh
open RationalUnitRealKernelContinuity QuadraturePartition

def regularRoot (k : ℕ) : Rect :=
  ⟨cutQ k, cutQ (k + 1), 0, 1⟩

def reciprocalLo (k : ℕ) : ℚ :=
  if selected k then (100 : ℚ)⁻¹ else ((2 : ℚ) ^ 53)⁻¹

def reciprocalRoot (k : ℕ) : Rect :=
  ⟨cutQ k, cutQ (k + 1), reciprocalLo k, 1⟩

theorem reciprocalLo_pos (k : ℕ) : 0 < reciprocalLo k := by
  unfold reciprocalLo
  split_ifs <;> positivity

theorem reciprocalLo_le_one (k : ℕ) : reciprocalLo k ≤ 1 := by
  unfold reciprocalLo
  split_ifs <;> norm_num

theorem reciprocalLo_cast (k : ℕ) :
    (reciprocalLo k : ℝ) =
      if selected k then (100 : ℝ)⁻¹ else ((2 : ℝ) ^ 53)⁻¹ := by
  unfold reciprocalLo
  split_ifs <;> simp only [Rat.cast_inv, Rat.cast_pow, Rat.cast_ofNat]

theorem regularRoot_valid (k : ℕ) : (regularRoot k).Valid :=
  ⟨monotone_cutQ (Nat.le_succ k), by
    change (0 : ℚ) ≤ 1
    exact zero_le_one⟩

theorem reciprocalRoot_valid (k : ℕ) : (reciprocalRoot k).Valid :=
  ⟨monotone_cutQ (Nat.le_succ k), reciprocalLo_le_one k⟩

noncomputable def regularKernel {N : ℕ} (i : GradedIdx N) (j : ℕ) : ℝ → ℝ → ℝ :=
  unitRealKernel i j finiteLaplaceEta

noncomputable def reciprocalRealKernel {N : ℕ} (i : GradedIdx N) (j : ℕ)
    (s x : ℝ) : ℝ := (x ^ 2)⁻¹ * regularKernel i j s x⁻¹

theorem continuousOn_regularKernel {N : ℕ} (i : GradedIdx N) (j k : ℕ) :
    ContinuousOn (regularKernel i j).uncurry (regularRoot k).domain :=
  (continuous_unitRealKernel i j finiteLaplaceEta).continuousOn

private theorem continuousOn_realReciprocal (f : ℝ → ℝ → ℝ)
    (hf : Continuous f.uncurry) (S : Set (ℝ × ℝ))
    (hne : ∀ p ∈ S, p.2 ≠ 0) :
    ContinuousOn (fun p : ℝ × ℝ => (p.2 ^ 2)⁻¹ * f p.1 p.2⁻¹) S := by
  have hi : ContinuousOn (fun p : ℝ × ℝ => p.2⁻¹) S :=
    continuous_snd.continuousOn.inv₀ hne
  have hm : ContinuousOn (fun p : ℝ × ℝ => (p.1, p.2⁻¹)) S :=
    continuous_fst.continuousOn.prodMk hi
  have hj : ContinuousOn (fun p : ℝ × ℝ => (p.2 ^ 2)⁻¹) S :=
    (continuous_snd.continuousOn.pow 2).inv₀ (fun p hp => pow_ne_zero 2 (hne p hp))
  exact hj.mul (hf.comp_continuousOn hm)

/-- Every reciprocal root stays strictly away from auxiliary zero. -/
theorem continuousOn_reciprocalRealKernel {N : ℕ} (i : GradedIdx N) (j k : ℕ) :
    ContinuousOn (reciprocalRealKernel i j).uncurry (reciprocalRoot k).domain := by
  apply continuousOn_realReciprocal (regularKernel i j)
    (continuous_unitRealKernel i j finiteLaplaceEta)
  intro p hp
  have hlo : (0 : ℝ) < (reciprocalLo k : ℝ) := Rat.cast_pos.mpr (reciprocalLo_pos k)
  exact ne_of_gt (hlo.trans_le hp.2.1)

theorem regular_integral_eq {N : ℕ} (i : GradedIdx N) (j k : ℕ) :
    (((regularRoot k).integral (regularKernel i j) : ℝ) : ℂ) =
      rectangleIntegral (unitRectangleKernel i j finiteLaplaceEta)
        0 1 (cut k) (cut (k + 1)) := by
  simp only [Rect.integral, regularRoot, regularKernel, rectangleIntegral,
    unitRectangleKernel, cut, Rat.cast_zero, Rat.cast_one,
    intervalIntegral.integral_ofReal]

theorem reciprocal_integral_eq {N : ℕ} (i : GradedIdx N) (j k : ℕ) :
    (((reciprocalRoot k).integral (reciprocalRealKernel i j) : ℝ) : ℂ) =
      rectangleIntegral (reciprocalKernel (unitRectangleKernel i j finiteLaplaceEta))
        (if selected k then (100 : ℝ)⁻¹ else ((2 : ℝ) ^ 53)⁻¹)
        1 (cut k) (cut (k + 1)) := by
  have hkernel : reciprocalKernel (unitRectangleKernel i j finiteLaplaceEta) =
      fun x s => (reciprocalRealKernel i j s x : ℂ) := by
    funext x s
    simp only [reciprocalKernel, unitRectangleKernel, reciprocalRealKernel,
      regularKernel, Complex.real_smul, Complex.ofReal_mul]
  rw [hkernel]
  simp only [Rect.integral, reciprocalRoot, rectangleIntegral, cut,
    reciprocalLo_cast, Rat.cast_one, intervalIntegral.integral_ofReal]

noncomputable def retainedRealValue {N : ℕ} (i : GradedIdx N) (j : ℕ) : ℝ :=
  (Real.sqrt Real.pi)⁻¹ * ∑ k ∈ Finset.range 7,
    ((regularRoot k).integral (regularKernel i j) +
      (reciprocalRoot k).integral (reciprocalRealKernel i j))

/-- The real adaptive roots compute the actual normalized retained mesh. -/
theorem retainedRealValue_ofReal {N : ℕ} (i : GradedIdx N) (j : ℕ) :
    (retainedRealValue i j : ℂ) = retainedReciprocalMeshValue i j cut 7 selected := by
  simp only [retainedRealValue, retainedReciprocalMeshValue, Complex.ofReal_mul,
    Complex.ofReal_inv, Complex.ofReal_sum, Complex.ofReal_add,
    regular_integral_eq, reciprocal_integral_eq]

theorem retainedRealValue_eq_re {N : ℕ} (i : GradedIdx N) (j : ℕ) :
    retainedRealValue i j = (retainedReciprocalMeshValue i j cut 7 selected).re := by
  simpa only [Complex.ofReal_re] using congrArg Complex.re (retainedRealValue_ofReal i j)

def rootInterval (t : SplitTree) (r : Rect) (bound : Rect → IntervalRat) : IntervalRat :=
  enclosureSum ((t.leaves r).map bound)

/-- Sum and normalize the fourteen certified root intervals. -/
def normalizedRootInterval (regularBounds reciprocalBounds : ℕ → IntervalRat) : IntervalRat :=
  IntervalRat.mul GaussianNormalizationInterval.normalization
    (enclosureSum ((List.range 7).map (fun k => IntervalRat.add
      (regularBounds k) (reciprocalBounds k))))

/-- Root certificates may be assembled in separate checked subtrees; their
normalization does not require expanding a monolithic list of leaves. -/
theorem coefficient_mem_of_roots {N : ℕ} (i : GradedIdx N) (j : ℕ)
    (regularBounds reciprocalBounds : ℕ → IntervalRat)
    (hregular : ∀ k < 7, (regularRoot k).integral (regularKernel i j) ∈ regularBounds k)
    (hreciprocal : ∀ k < 7,
      (reciprocalRoot k).integral (reciprocalRealKernel i j) ∈ reciprocalBounds k) :
    (retainedReciprocalMeshValue i j cut 7 selected).re ∈
      normalizedRootInterval regularBounds reciprocalBounds := by
  rw [← retainedRealValue_eq_re]
  apply GaussianNormalizationInterval.normalized_mem
  have hsum := sum_mem_enclosureSum (List.range 7)
    (fun k => (regularRoot k).integral (regularKernel i j) +
      (reciprocalRoot k).integral (reciprocalRealKernel i j))
    (fun k => IntervalRat.add (regularBounds k) (reciprocalBounds k))
    (fun k hk => IntervalRat.mem_add
      (hregular k (List.mem_range.mp hk)) (hreciprocal k (List.mem_range.mp hk)))
  have hsumEq := List.sum_toFinset
    (fun k => (regularRoot k).integral (regularKernel i j) +
      (reciprocalRoot k).integral (reciprocalRealKernel i j))
    (List.nodup_range (n := 7))
  rw [List.toFinset_range] at hsumEq
  rw [hsumEq]
  exact hsum

/-- The complete fourteen-root enclosure includes the certified Gaussian
normalization interval. It contains no source-omission reserve. -/
def coefficientInterval (regularTrees reciprocalTrees : ℕ → SplitTree)
    (regularBounds reciprocalBounds : ℕ → Rect → IntervalRat) : IntervalRat :=
  normalizedRootInterval
    (fun k => rootInterval (regularTrees k) (regularRoot k) (regularBounds k))
    (fun k => rootInterval (reciprocalTrees k) (reciprocalRoot k) (reciprocalBounds k))

/-- Complete leaf certificates for all fixed roots enclose the actual
retained coefficient; the domain and normalization facts are discharged. -/
theorem coefficient_mem {N : ℕ} (i : GradedIdx N) (j : ℕ)
    (regularTrees reciprocalTrees : ℕ → SplitTree)
    (regularBounds reciprocalBounds : ℕ → Rect → IntervalRat)
    (hregular : ∀ k < 7, ∀ q ∈ (regularTrees k).leaves (regularRoot k),
      q.integral (regularKernel i j) ∈ regularBounds k q)
    (hreciprocal : ∀ k < 7, ∀ q ∈ (reciprocalTrees k).leaves (reciprocalRoot k),
      q.integral (reciprocalRealKernel i j) ∈ reciprocalBounds k q) :
    (retainedReciprocalMeshValue i j cut 7 selected).re ∈
      coefficientInterval regularTrees reciprocalTrees regularBounds reciprocalBounds := by
  apply coefficient_mem_of_roots i j
    (fun k => rootInterval (regularTrees k) (regularRoot k) (regularBounds k))
    (fun k => rootInterval (reciprocalTrees k) (reciprocalRoot k) (reciprocalBounds k))
  · intro k hk
    exact SplitTree.integral_mem_enclosureSum (regularTrees k) (regularRoot k)
      (regularRoot_valid k) (regularKernel i j) (continuousOn_regularKernel i j k)
      (regularBounds k) (hregular k hk)
  · intro k hk
    exact SplitTree.integral_mem_enclosureSum (reciprocalTrees k) (reciprocalRoot k)
      (reciprocalRoot_valid k) (reciprocalRealKernel i j)
      (continuousOn_reciprocalRealKernel i j k)
      (reciprocalBounds k) (hreciprocal k hk)

/-- Rational endpoint checks turn the complete normalized enclosure into
the actual coefficient bound consumed by the original band budgets. -/
theorem coefficient_abs_sub_le {N : ℕ} (i : GradedIdx N) (j : ℕ)
    (regularTrees reciprocalTrees : ℕ → SplitTree)
    (regularBounds reciprocalBounds : ℕ → Rect → IntervalRat)
    (hregular : ∀ k < 7, ∀ q ∈ (regularTrees k).leaves (regularRoot k),
      q.integral (regularKernel i j) ∈ regularBounds k q)
    (hreciprocal : ∀ k < 7, ∀ q ∈ (reciprocalTrees k).leaves (reciprocalRoot k),
      q.integral (reciprocalRealKernel i j) ∈ reciprocalBounds k q)
    (center radius : ℚ)
    (hlo : center - radius ≤
      (coefficientInterval regularTrees reciprocalTrees regularBounds reciprocalBounds).lo)
    (hhi : (coefficientInterval regularTrees reciprocalTrees regularBounds reciprocalBounds).hi ≤
      center + radius) :
    |(retainedReciprocalMeshValue i j cut 7 selected).re - (center : ℝ)| ≤ (radius : ℝ) :=
  abs_sub_le_of_mem
    (coefficient_mem i j regularTrees reciprocalTrees regularBounds reciprocalBounds
      hregular hreciprocal) center radius hlo hhi

end Grothe.UpperChaos.AdaptiveRetainedCoefficient
