import Grothe.Upper.ResponseGeometry
import Grothe.Upper.Bivariate
import Grothe.Upper.SpectralScreen
import Grothe.Transfer

/-!
# A full-score certificate for a smoothed response update

Keep the new response's signed energy changes on a finite set of blocks.
Outside it, two positive approximation-error integrals bound the whole
energy change by `A*B`. A contractive linear smoothing can be applied before
the blocks are measured. Passing through the actual bivariate polynomial
kernel and its full coefficient score loses only that one tail allowance.

The nominal coefficient error is also charged once. No approximant is
assumed to equal an orthogonal projection. The final theorem connects these
inputs to `transfer`; Gaussian integrals, support and kernel realizability
must still be supplied for a concrete response. No new endpoint is asserted.
-/

namespace Grothe.Upper.ResponseUpdate

open Finset

noncomputable section

variable {H K : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H]
  [NormedAddCommGroup K] [InnerProductSpace ℝ K]

/-- The finite retained blocks come from the new table; the complement is
the anchor table. Signed block changes are preserved before composition. -/
def hybrid {ι : Type*} (keep : Finset ι) (old new : ι → ℝ) : ι → ℝ := by
  classical
  exact fun i => if i ∈ keep then new i else old i

/-- The full signed coefficient score, including every omitted index. -/
def score (c : ℕ → ℝ) : ℝ := c 0-∑' n, |c (n+1)|

/-- Raw positive-error bounds survive a contractive linear smoothing. -/
theorem tail_of_contracted_approximants {ι : Type*}
    (S : H →ₗ[ℝ] K) (hS : ∀ z, ‖S z‖ ≤ ‖z‖) (P : ι → K →ₗ[ℝ] K)
    (hBessel : ∀ (I : Finset ι) z, ∑ i ∈ I, ‖P i z‖^2 ≤ ‖z‖^2)
    (x y p q : H) (hp : ∀ i, P i (S p) = 0) (hq : ∀ i, P i (S q) = 0)
    (A B : ℝ) (hA : 0 ≤ A) (hB : 0 ≤ B)
    (ha : ‖(y-x)-p‖ ≤ A) (hb : ‖(y+x)-q‖ ≤ B) :
    ∑' i, |‖P i (S y)‖^2-‖P i (S x)‖^2| ≤ A*B := by
  apply ResponseGeometry.tail_of_approximants P hBessel (S x) (S y) (S p) (S q)
    hp hq A B hA hB
  · simpa only [map_sub] using (hS ((y-x)-p)).trans ha
  · simpa only [map_sub, map_add] using (hS ((y+x)-q)).trans hb

/-- Finite Bessel bounds imply summability of the entire block-energy table. -/
theorem summable_block_energy {ι : Type*} (P : ι → K →ₗ[ℝ] K)
    (hBessel : ∀ (I : Finset ι) z, ∑ i ∈ I, ‖P i z‖^2 ≤ ‖z‖^2) (z : K) :
    Summable fun i => |‖P i z‖^2| := by
  have h := summable_of_sum_le (fun i => sq_nonneg ‖P i z‖) (fun I => hBessel I z)
  exact h.congr fun i => (abs_of_nonneg (sq_nonneg ‖P i z‖)).symm

/-- The hybrid table's complete error is a polarized tail, even when the
raw approximants are not projections and smoothing mixes retained blocks. -/
theorem hybrid_energy_error {ι : Type*} (keep : Finset ι)
    (S : H →ₗ[ℝ] K) (hS : ∀ z, ‖S z‖ ≤ ‖z‖) (P : ι → K →ₗ[ℝ] K)
    (hBessel : ∀ (I : Finset ι) z, ∑ i ∈ I, ‖P i z‖^2 ≤ ‖z‖^2)
    (x y p q : H) (hp : ∀ i, i ∉ keep → P i (S p) = 0)
    (hq : ∀ i, i ∉ keep → P i (S q) = 0)
    (A B : ℝ) (hA : 0 ≤ A) (hB : 0 ≤ B)
    (ha : ‖(y-x)-p‖ ≤ A) (hb : ‖(y+x)-q‖ ≤ B) :
    ∑' i, |‖P i (S y)‖^2-
      hybrid keep (fun i => ‖P i (S x)‖^2) (fun i => ‖P i (S y)‖^2) i| ≤ A*B := by
  classical
  let R : ι → K →ₗ[ℝ] K := fun i => if i ∈ keep then 0 else P i
  have hR : ∀ (I : Finset ι) z, ∑ i ∈ I, ‖R i z‖^2 ≤ ‖z‖^2 := by
    intro I z
    refine (sum_le_sum fun i _ => ?_).trans (hBessel I z)
    by_cases hi : i ∈ keep
    · simp [R, hi]
    · simp [R, hi]
  have hpR : ∀ i, R i (S p) = 0 := by
    intro i
    by_cases hi : i ∈ keep
    · simp [R, hi]
    · simp [R, hi, hp i hi]
  have hqR : ∀ i, R i (S q) = 0 := by
    intro i
    by_cases hi : i ∈ keep
    · simp [R, hi]
    · simp [R, hi, hq i hi]
  have h := tail_of_contracted_approximants S hS R hR x y p q hpR hqR A B hA hB ha hb
  convert h using 1
  apply tsum_congr
  intro i
  by_cases hi : i ∈ keep <;> simp [R, hybrid, hi]

private lemma summable_hybrid {ι : Type*} (keep : Finset ι) (old new : ι → ℝ)
    (ho : Summable fun i => |old i|) (hn : Summable fun i => |new i|) :
    Summable fun i => |hybrid keep old new i| := by
  classical
  refine (ho.add hn).of_nonneg_of_le (fun _ => abs_nonneg _) fun i => ?_
  by_cases hi : i ∈ keep <;> simp only [hybrid, hi, ite_true, ite_false]
  · exact le_add_of_nonneg_left (abs_nonneg _)
  · exact le_add_of_nonneg_right (abs_nonneg _)

private lemma summable_abs_diff {ι : Type*} (x y : ι → ℝ)
    (hx : Summable fun i => |x i|) (hy : Summable fun i => |y i|) :
    Summable fun i => |x i-y i| :=
  (hx.add hy).of_nonneg_of_le (fun _ => abs_nonneg _) fun i => abs_sub (x i) (y i)

/-- The hybrid kernel is the anchor kernel plus the finite SIGNED update.
This identity exposes exactly which retained measurements are needed. -/
theorem hybrid_kernel_update (P Q : Polynomial ℝ) (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1)
    (keep : Finset (ℕ × ℕ)) (old new : ℕ × ℕ → ℝ)
    (ho : Summable fun i => |old i|) (hn : Summable fun i => |new i|) (j : ℕ) :
    bivarKernel P Q (hybrid keep old new) j = bivarKernel P Q old j+
      ∑ i ∈ keep, (new i-old i)*(termOf P Q i).coeff j := by
  classical
  have ha := summable_hybrid keep old new ho hn
  have hlin := bivarKernel_sub P Q hP hQ (hybrid keep old new) old ha ho j
  have hfinite : bivarKernel P Q (fun i => hybrid keep old new i-old i) j =
      ∑ i ∈ keep, (new i-old i)*(termOf P Q i).coeff j := by
    unfold bivarKernel
    calc
      _ = ∑ i ∈ keep, (hybrid keep old new i-old i)*(termOf P Q i).coeff j :=
        tsum_eq_sum fun i hi => by simp [hybrid, hi]
      _ = _ := sum_congr rfl fun i hi => by simp [hybrid, hi]
  rw [hfinite] at hlin
  linarith

/-- A global nominal coefficient error comes from one inherited anchor
error plus finite weighted errors in the retained signed block changes. -/
theorem nominal_update_error (P Q : Polynomial ℝ) (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1)
    (keep : Finset (ℕ × ℕ)) (old new : ℕ × ℕ → ℝ)
    (ho : Summable fun i => |old i|) (hn : Summable fun i => |new i|)
    (base : ℕ → ℝ) (hbase : Summable fun j => |base j|)
    (anchorRadius : ℝ) (hanchor : ∑' j, |bivarKernel P Q old j-base j| ≤ anchorRadius)
    (delta w : ℕ × ℕ → ℝ)
    (hw : ∀ i ∈ keep, l1 (termOf P Q i) ≤ w i)
    (headRadius : ℝ)
    (hhead : ∑ i ∈ keep, w i*|(new i-old i)-delta i| ≤ headRadius) :
    ∑' j, |bivarKernel P Q (hybrid keep old new) j-
      (base j+∑ i ∈ keep, delta i*(termOf P Q i).coeff j)| ≤ anchorRadius+headRadius := by
  have hdiff := summable_abs_diff (bivarKernel P Q old) base
    (summable_abs_bivarKernel P Q hP hQ old ho) hbase
  apply Real.tsum_le_of_sum_range_le (fun _ => abs_nonneg _)
  intro J
  have hfinite := head_perturbation_weighted P Q keep (fun i => new i-old i) delta J w
    (fun i hi => (sum_abs_coeff_le_l1 (termOf P Q i) J).trans (hw i hi))
  have hanchorJ : (∑ j ∈ range J, |bivarKernel P Q old j-base j|) ≤ anchorRadius :=
    (hdiff.sum_le_tsum (range J) (fun _ _ => abs_nonneg _)).trans hanchor
  calc
    _ ≤ ∑ j ∈ range J, (|bivarKernel P Q old j-base j|+
        |(∑ i ∈ keep, (new i-old i)*(termOf P Q i).coeff j)-
          ∑ i ∈ keep, delta i*(termOf P Q i).coeff j|) := by
      refine sum_le_sum fun j _ => ?_
      rw [hybrid_kernel_update P Q hP hQ keep old new ho hn j]
      calc
        _ = |(bivarKernel P Q old j-base j)+
            ((∑ i ∈ keep, (new i-old i)*(termOf P Q i).coeff j)-
              ∑ i ∈ keep, delta i*(termOf P Q i).coeff j)| := by congr 1; ring
        _ ≤ _ := abs_add_le _ _
    _ = (∑ j ∈ range J, |bivarKernel P Q old j-base j|)+
        ∑ j ∈ range J, |(∑ i ∈ keep, (new i-old i)*(termOf P Q i).coeff j)-
          ∑ i ∈ keep, delta i*(termOf P Q i).coeff j| := sum_add_distrib
    _ ≤ anchorRadius+headRadius := add_le_add hanchorJ (hfinite.trans hhead)

/-- The actual bivariate kernel inherits only the hybrid tail allowance and
one nominal coefficient-error radius. All coefficient indices are included. -/
theorem kernel_score_update (P Q : Polynomial ℝ) (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1)
    (keep : Finset (ℕ × ℕ)) (old new : ℕ × ℕ → ℝ)
    (ho : Summable fun i => |old i|) (hn : Summable fun i => |new i|)
    (tail : ℝ) (htail : ∑' i, |new i-hybrid keep old new i| ≤ tail)
    (mid : ℕ → ℝ) (hm : Summable fun j => |mid j|) (radius : ℝ)
    (hmid : ∑' j, |bivarKernel P Q (hybrid keep old new) j-mid j| ≤ radius) :
    score mid-radius-tail ≤ score (bivarKernel P Q new) := by
  let anchor := hybrid keep old new
  have ha := summable_hybrid keep old new ho hn
  have hd := summable_abs_diff new anchor hn ha
  have hc := summable_abs_bivarKernel P Q hP hQ new hn
  have hk := summable_abs_bivarKernel P Q hP hQ anchor ha
  have hck := summable_abs_diff (bivarKernel P Q new) (bivarKernel P Q anchor) hc hk
  have hkm := summable_abs_diff (bivarKernel P Q anchor) mid hk hm
  have hcm := summable_abs_diff (bivarKernel P Q new) mid hc hm
  have hcost : ∑' j, |bivarKernel P Q new j-bivarKernel P Q anchor j| ≤ tail := by
    calc
      _ = ∑' j, |bivarKernel P Q (fun i => new i-anchor i) j| := by
        apply tsum_congr
        intro j
        rw [bivarKernel_sub P Q hP hQ new anchor hn ha]
      _ ≤ ∑' i, |new i-anchor i| := tsum_abs_bivarKernel_le P Q hP hQ _ hd
      _ ≤ tail := htail
  have htri : ∀ j, |bivarKernel P Q new j-mid j| ≤
      |bivarKernel P Q new j-bivarKernel P Q anchor j|+
        |bivarKernel P Q anchor j-mid j| := by
    intro j
    calc
      _ = |(bivarKernel P Q new j-bivarKernel P Q anchor j)+
          (bivarKernel P Q anchor j-mid j)| := by congr 1; ring
      _ ≤ _ := abs_add_le _ _
  have herr : ∑' j, |bivarKernel P Q new j-mid j| ≤ tail+radius := by
    calc
      _ ≤ ∑' j, (|bivarKernel P Q new j-bivarKernel P Q anchor j|+
          |bivarKernel P Q anchor j-mid j|) := hcm.tsum_le_tsum htri (hck.add hkm)
      _ = (∑' j, |bivarKernel P Q new j-bivarKernel P Q anchor j|)+
          ∑' j, |bivarKernel P Q anchor j-mid j| := hck.tsum_add hkm
      _ ≤ tail+radius := add_le_add hcost hmid
  have h := SpectralScreen.full_score_l1_lower (bivarKernel P Q new) mid hc hm hcm
    (tail+radius) herr
  unfold score
  linarith

/-- The response-level certificate: raw positive residual errors, contractive
smoothing, finite retained block data and the real polynomial kernel score. -/
theorem smoothed_update_score (P Q : Polynomial ℝ) (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1)
    (keep : Finset (ℕ × ℕ)) (S : H →ₗ[ℝ] K) (hS : ∀ z, ‖S z‖ ≤ ‖z‖)
    (blocks : (ℕ × ℕ) → K →ₗ[ℝ] K)
    (hBessel : ∀ (I : Finset (ℕ × ℕ)) z, ∑ i ∈ I, ‖blocks i z‖^2 ≤ ‖z‖^2)
    (x y p q : H) (hp : ∀ i, i ∉ keep → blocks i (S p) = 0)
    (hq : ∀ i, i ∉ keep → blocks i (S q) = 0)
    (A B : ℝ) (hA : 0 ≤ A) (hB : 0 ≤ B)
    (ha : ‖(y-x)-p‖ ≤ A) (hb : ‖(y+x)-q‖ ≤ B)
    (mid : ℕ → ℝ) (hm : Summable fun j => |mid j|) (radius : ℝ)
    (hmid : ∑' j, |bivarKernel P Q
      (hybrid keep (fun i => ‖blocks i (S x)‖^2) (fun i => ‖blocks i (S y)‖^2)) j-mid j|
        ≤ radius) :
    score mid-radius-A*B ≤ score (bivarKernel P Q (fun i => ‖blocks i (S y)‖^2)) :=
  kernel_score_update P Q hP hQ keep _ _
    (summable_block_energy blocks hBessel (S x))
    (summable_block_energy blocks hBessel (S y)) (A*B)
    (hybrid_energy_error keep S hS blocks hBessel x y p q hp hq A B hA hB ha hb)
    mid hm radius hmid

/-- A positive full score yields the existing transfer bound, without
introducing an additional residual allowance for its first coefficient. -/
theorem bound_of_score (c : ℕ → ℝ) (hc : Summable fun j => |c j|)
    (hdom : Grothe.DominatedKernel (Grothe.radialKernel c))
    (s : ℝ) (hs : 0 < s) (hscore : s ≤ score c) :
    Grothe.IsGrothendieckBound (1/s) := by
  have hres : |c 0-c 0|+(∑' j, |c (j+1)|) ≤ c 0-s := by
    simp only [sub_self, abs_zero, zero_add]
    unfold score at hscore
    linarith
  have h := Grothe.transfer c hc hdom (c := c 0) (δ := c 0-s) (by linarith) hres
  have heq : c 0-(c 0-s) = s := by ring
  rw [heq] at h
  exact h

/-- Conditional upper-bound assembly from the actual response update.
The domination hypothesis is realizability of this kernel, not a norm cap.
All remaining numerical obligations occur in the explicit error budgets. -/
theorem upper_of_smoothed_update (P Q : Polynomial ℝ) (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1)
    (keep : Finset (ℕ × ℕ)) (S : H →ₗ[ℝ] K) (hS : ∀ z, ‖S z‖ ≤ ‖z‖)
    (blocks : (ℕ × ℕ) → K →ₗ[ℝ] K)
    (hBessel : ∀ (I : Finset (ℕ × ℕ)) z, ∑ i ∈ I, ‖blocks i z‖^2 ≤ ‖z‖^2)
    (x y p q : H) (hp : ∀ i, i ∉ keep → blocks i (S p) = 0)
    (hq : ∀ i, i ∉ keep → blocks i (S q) = 0)
    (A B : ℝ) (hA : 0 ≤ A) (hB : 0 ≤ B)
    (ha : ‖(y-x)-p‖ ≤ A) (hb : ‖(y+x)-q‖ ≤ B)
    (mid : ℕ → ℝ) (hm : Summable fun j => |mid j|) (radius : ℝ)
    (hmid : ∑' j, |bivarKernel P Q
      (hybrid keep (fun i => ‖blocks i (S x)‖^2) (fun i => ‖blocks i (S y)‖^2)) j-mid j|
        ≤ radius)
    (hdom : Grothe.DominatedKernel
      (Grothe.radialKernel (bivarKernel P Q (fun i => ‖blocks i (S y)‖^2))))
    (s : ℝ) (hs : 0 < s) (hbudget : s+radius+A*B ≤ score mid) :
    Grothe.IsGrothendieckBound (1/s) := by
  have hscore := smoothed_update_score P Q hP hQ keep S hS blocks hBessel
    x y p q hp hq A B hA hB ha hb mid hm radius hmid
  exact bound_of_score _
    (summable_abs_bivarKernel P Q hP hQ _ (summable_block_energy blocks hBessel (S y)))
    hdom s hs (by linarith)

end
end Grothe.Upper.ResponseUpdate
