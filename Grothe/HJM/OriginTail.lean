import Grothe.HJM.OriginResidualCoefficients
import Grothe.HJM.OriginPhaseTail

/-!
# Signed endpoint cancellation and the actual origin coefficient tail

Agent-ID: codex-aa04.

Numerical total-energy caps and visible-energy lower bounds remain explicit;
no such integral enclosure is asserted.

All tails use the shifted index `j+N`. The actual weighted HasSum identities
supply residual summability, the existing dominated-kernel construction gives
absolute coefficient summability, and the phase-tail theorem supplies its
inverse-degree-weighted summability. Finite Cauchy--Schwarz is applied before
passing to any infinite sum.
-/

open MeasureTheory Set Finset
open scoped Topology ComplexConjugate

namespace Grothe.HJM.Origin

noncomputable section

def leftEnergyTerm (n : ℕ) : ℝ :=
  (2 * (n : ℝ) + 1) ^ 2 * ‖chargeOneCoeff fResidualLp n‖ ^ 2

def rightEnergyTerm (n : ℕ) : ℝ :=
  (2 * (n : ℝ) + 1) ^ 2 * ‖chargeOneCoeff gResidualLp n‖ ^ 2

def leftTailEnergy (N : ℕ) : ℝ := ∑' j : ℕ, leftEnergyTerm (j + N)

def rightTailEnergy (N : ℕ) : ℝ := ∑' j : ℕ, rightEnergyTerm (j + N)

theorem left_weighted_tail_summable (N : ℕ) :
    Summable (fun j : ℕ => leftEnergyTerm (j + N)) :=
  (summable_nat_add_iff N).mpr fResidual_hasSum_weighted_energy.summable

theorem right_weighted_tail_summable (N : ℕ) :
    Summable (fun j : ℕ => rightEnergyTerm (j + N)) :=
  (summable_nat_add_iff N).mpr gResidual_hasSum_weighted_energy.summable

theorem coeff_tail_summable (N : ℕ) : Summable (fun j : ℕ => |coeff (j + N)|) :=
  (summable_nat_add_iff N).mpr coeff_summable

/-- Subtraction of a certified visible prefix from a certified total cap.
The HasSum premise ensures this is an actual suffix of a convergent series. -/
theorem tail_cap_of_visible {u : ℕ → ℝ} {total cap visible : ℝ} (N : ℕ)
    (hu : HasSum u total) (hcap : total ≤ cap)
    (hvisible : visible ≤ ∑ n ∈ range N, u n) :
    (∑' j : ℕ, u (j + N)) ≤ cap - visible := by
  have hsplit := hu.summable.sum_add_tsum_nat_add N
  rw [hu.tsum_eq] at hsplit
  linarith

/-- The actual left energy permits visible-mode subtraction without an
additional analytic or summability hypothesis. -/
theorem leftTailEnergy_le_of_visible (N : ℕ) (cap visible : ℝ)
    (hcap : (∫ s in Ioi (0 : ℝ), Real.exp (-s) * ‖fEnergyAmplitude s‖ ^ 2) ≤ cap)
    (hvisible : visible ≤ ∑ n ∈ range N, leftEnergyTerm n) :
    leftTailEnergy N ≤ cap - visible :=
  tail_cap_of_visible N fResidual_hasSum_weighted_energy hcap hvisible

theorem rightTailEnergy_le_of_visible (N : ℕ) (cap visible : ℝ)
    (hcap : (∫ s in Ioi (0 : ℝ), Real.exp (-s) * ‖gEnergyAmplitude s‖ ^ 2) ≤ cap)
    (hvisible : visible ≤ ∑ n ∈ range N, rightEnergyTerm n) :
    rightTailEnergy N ≤ cap - visible :=
  tail_cap_of_visible N gResidual_hasSum_weighted_energy hcap hvisible

private theorem finite_cauchy_cap (s : Finset ℕ) (a b : ℕ → ℝ) (A B : ℝ)
    (ha : ∑ j ∈ s, a j ^ 2 ≤ A) (hb : ∑ j ∈ s, b j ^ 2 ≤ B) :
    ∑ j ∈ s, a j * b j ≤ Real.sqrt (A * B) := by
  have hA : 0 ≤ A := (sum_nonneg fun j _ => sq_nonneg (a j)).trans ha
  calc
    _ ≤ Real.sqrt (∑ j ∈ s, a j ^ 2) * Real.sqrt (∑ j ∈ s, b j ^ 2) :=
      Real.sum_mul_le_sqrt_mul_sqrt s a b
    _ ≤ Real.sqrt A * Real.sqrt B :=
      mul_le_mul (Real.sqrt_le_sqrt ha) (Real.sqrt_le_sqrt hb)
        (Real.sqrt_nonneg _) (Real.sqrt_nonneg _)
    _ = _ := (Real.sqrt_mul hA B).symm

private theorem finite_phase_residual_cap (s : Finset ℕ) (d x z : ℕ → ℝ)
    (E W : ℝ) (hd : ∀ j, d j ≠ 0)
    (hx : ∑ j ∈ s, d j ^ 2 * x j ^ 2 ≤ E)
    (hz : ∑ j ∈ s, z j ^ 2 / d j ^ 2 ≤ W) :
    ∑ j ∈ s, z j * x j ≤ Real.sqrt (E * W) := by
  calc
    _ = ∑ j ∈ s, (d j * x j) * (z j / d j) := by
      apply sum_congr rfl
      intro j _hj
      field_simp [hd j]
    _ ≤ _ := finite_cauchy_cap s (fun j => d j * x j) (fun j => z j / d j) E W
      (by simpa only [mul_pow] using hx) (by simpa only [div_pow] using hz)

private theorem finite_residual_product_cap (s : Finset ℕ) (d x y : ℕ → ℝ)
    (D E F : ℝ) (hD : 0 < D) (hd : ∀ j, D ≤ d j)
    (hx0 : ∀ j, 0 ≤ x j) (hy0 : ∀ j, 0 ≤ y j)
    (hx : ∑ j ∈ s, d j ^ 2 * x j ^ 2 ≤ E)
    (hy : ∑ j ∈ s, d j ^ 2 * y j ^ 2 ≤ F) :
    ∑ j ∈ s, x j * y j ≤ Real.sqrt (E * F) / D ^ 2 := by
  have hD2 : 0 < D ^ 2 := sq_pos_of_pos hD
  calc
    _ ≤ ∑ j ∈ s, ((d j * x j) * (d j * y j)) / D ^ 2 := by
      apply sum_le_sum
      intro j _hj
      apply (le_div_iff₀ hD2).mpr
      calc
        x j * y j * D ^ 2 = D ^ 2 * (x j * y j) := by ring
        _ ≤ d j ^ 2 * (x j * y j) :=
          mul_le_mul_of_nonneg_right (pow_le_pow_left₀ hD.le (hd j) 2)
            (mul_nonneg (hx0 j) (hy0 j))
        _ = (d j * x j) * (d j * y j) := by ring
    _ = (∑ j ∈ s, (d j * x j) * (d j * y j)) / D ^ 2 := by rw [sum_div]
    _ ≤ _ := div_le_div_of_nonneg_right
      (finite_cauchy_cap s (fun j => d j * x j) (fun j => d j * y j) E F
        (by simpa only [mul_pow] using hx) (by simpa only [mul_pow] using hy)) hD2.le

/-- The actual signed phase coefficient is subtracted before taking norms. -/
theorem coeff_le_residual_products (n : ℕ) :
    |coeff n| ≤
      ‖chargeOneCoeff Grothe.Haag.phaseLp n‖ * ‖chargeOneCoeff fResidualLp n‖ +
      ‖chargeOneCoeff Grothe.Haag.phaseLp n‖ * ‖chargeOneCoeff gResidualLp n‖ +
      ‖chargeOneCoeff fResidualLp n‖ * ‖chargeOneCoeff gResidualLp n‖ := by
  have h := endpoint_subtracted_coeff_bound (chargeOneCoeff FLp n)
    (chargeOneCoeff GLp n) (chargeOneCoeff Grothe.Haag.phaseLp n)
  rw [← chargeOneCoeff_fResidualLp, ← chargeOneCoeff_gResidualLp] at h
  simpa only [coeff, symmetrizedPairCoeff, scalarPairCoeff, mul_add] using h

/-- The entire origin coefficient suffix is controlled by the two residual
energy caps and the inverse-degree-weighted phase cap. Summability follows
from actual response theorems, not from any numerical cap. -/
theorem coeff_tail_le_of_energy_caps (N : ℕ) (EL ER W : ℝ)
    (hEL : leftTailEnergy N ≤ EL) (hER : rightTailEnergy N ≤ ER)
    (hW : (∑' j : ℕ, ‖chargeOneCoeff Grothe.Haag.phaseLp (j + N)‖ ^ 2 /
      (2 * ((j + N : ℕ) : ℝ) + 1) ^ 2) ≤ W) :
    (∑' j : ℕ, |coeff (j + N)|) ≤ Real.sqrt (EL * W) + Real.sqrt (ER * W) +
      Real.sqrt (EL * ER) / (2 * (N : ℝ) + 1) ^ 2 := by
  apply (coeff_tail_summable N).tsum_le_of_sum_le
  intro s
  let d : ℕ → ℝ := fun j => 2 * ((j + N : ℕ) : ℝ) + 1
  let x : ℕ → ℝ := fun j => ‖chargeOneCoeff fResidualLp (j + N)‖
  let y : ℕ → ℝ := fun j => ‖chargeOneCoeff gResidualLp (j + N)‖
  let z : ℕ → ℝ := fun j => ‖chargeOneCoeff Grothe.Haag.phaseLp (j + N)‖
  have hd : ∀ j, d j ≠ 0 := fun j => by dsimp [d]; positivity
  have hx : ∑ j ∈ s, d j ^ 2 * x j ^ 2 ≤ EL :=
    ((left_weighted_tail_summable N).sum_le_tsum s
      (fun j _hj => by unfold leftEnergyTerm; positivity)).trans hEL
  have hy : ∑ j ∈ s, d j ^ 2 * y j ^ 2 ≤ ER :=
    ((right_weighted_tail_summable N).sum_le_tsum s
      (fun j _hj => by unfold rightEnergyTerm; positivity)).trans hER
  have hz : ∑ j ∈ s, z j ^ 2 / d j ^ 2 ≤ W :=
    ((phase_weighted_tail_summable N).sum_le_tsum s
      (fun j _hj => by positivity)).trans hW
  have hL := finite_phase_residual_cap s d x z EL W hd hx hz
  have hR := finite_phase_residual_cap s d y z ER W hd hy hz
  have hX := finite_residual_product_cap s d x y (2 * (N : ℝ) + 1) EL ER
    (by positivity) (fun j => by
      have hj : (0 : ℝ) ≤ (j : ℝ) := Nat.cast_nonneg j
      dsimp [d]
      push_cast
      linarith)
    (fun j => norm_nonneg (chargeOneCoeff fResidualLp (j + N)))
    (fun j => norm_nonneg (chargeOneCoeff gResidualLp (j + N))) hx hy
  calc
    _ ≤ ∑ j ∈ s, (z j * x j + z j * y j + x j * y j) :=
      sum_le_sum fun j _hj => coeff_le_residual_products (j + N)
    _ = (∑ j ∈ s, z j * x j) + (∑ j ∈ s, z j * y j) +
        ∑ j ∈ s, x j * y j := by simp only [sum_add_distrib]
    _ ≤ _ := add_le_add (add_le_add hL hR) hX

/-- The proved Wallis tail removes the phase cap as an assumption. Only the
two numerical residual energy caps remain to be certified. -/
theorem coeff_tail_le_of_residual_caps (N : ℕ) (hN : 1 ≤ N) (EL ER : ℝ)
    (hEL : leftTailEnergy N ≤ EL) (hER : rightTailEnergy N ≤ ER) :
    (∑' j : ℕ, |coeff (j + N)|) ≤
      Real.sqrt (EL * (1 / (48 * (N : ℝ) ^ 3))) +
      Real.sqrt (ER * (1 / (48 * (N : ℝ) ^ 3))) +
      Real.sqrt (EL * ER) / (2 * (N : ℝ) + 1) ^ 2 :=
  coeff_tail_le_of_energy_caps N EL ER _ hEL hER (phase_weighted_tail_le N hN)

/-- Direct certificate-facing interface: subtract the certified visible
prefixes from the certified full energies before estimating the signed tail. -/
theorem coeff_tail_le_of_visible (N : ℕ) (hN : 1 ≤ N) (CL CR VL VR : ℝ)
    (hCL : (∫ s in Ioi (0 : ℝ), Real.exp (-s) * ‖fEnergyAmplitude s‖ ^ 2) ≤ CL)
    (hCR : (∫ s in Ioi (0 : ℝ), Real.exp (-s) * ‖gEnergyAmplitude s‖ ^ 2) ≤ CR)
    (hVL : VL ≤ ∑ n ∈ range N, leftEnergyTerm n)
    (hVR : VR ≤ ∑ n ∈ range N, rightEnergyTerm n) :
    (∑' j : ℕ, |coeff (j + N)|) ≤
      Real.sqrt ((CL - VL) * (1 / (48 * (N : ℝ) ^ 3))) +
      Real.sqrt ((CR - VR) * (1 / (48 * (N : ℝ) ^ 3))) +
      Real.sqrt ((CL - VL) * (CR - VR)) / (2 * (N : ℝ) + 1) ^ 2 :=
  coeff_tail_le_of_residual_caps N hN (CL - VL) (CR - VR)
    (leftTailEnergy_le_of_visible N CL VL hCL hVL)
    (rightTailEnergy_le_of_visible N CR VR hCR hVR)

/-- Exact rational evaluation of the tail formula at mode 120. The rational
ceilings of the three square roots are checked by squaring nonnegative numbers. -/
theorem residual_tail_budget_at_120 :
    Real.sqrt ((1174 / 1000 : ℝ) * (1 / (48 * (120 : ℝ) ^ 3))) +
      Real.sqrt ((1176 / 1000 : ℝ) * (1 / (48 * (120 : ℝ) ^ 3))) +
      Real.sqrt ((1174 / 1000 : ℝ) * (1176 / 1000)) / (2 * (120 : ℝ) + 1) ^ 2 ≤
      (6457 / 25000000 : ℝ) := by
  have hL : Real.sqrt ((1174 / 1000 : ℝ) * (1 / (48 * (120 : ℝ) ^ 3))) ≤
      118972 / 1000000000 := by
    apply Real.sqrt_le_iff.mpr
    norm_num
  have hR : Real.sqrt ((1176 / 1000 : ℝ) * (1 / (48 * (120 : ℝ) ^ 3))) ≤
      119073 / 1000000000 := by
    apply Real.sqrt_le_iff.mpr
    norm_num
  have hLR : Real.sqrt ((1174 / 1000 : ℝ) * (1176 / 1000)) ≤ 47 / 40 := by
    apply Real.sqrt_le_iff.mpr
    norm_num
  calc
    _ ≤ (118972 / 1000000000 : ℝ) + 119073 / 1000000000 +
        (47 / 40) / (2 * (120 : ℝ) + 1) ^ 2 :=
      add_le_add (add_le_add hL hR)
        (div_le_div_of_nonneg_right hLR (by positivity))
    _ ≤ _ := by norm_num

/-- The published residual-energy caps imply the sharper origin tail
`0.00025828`, using the all-mode phase estimate at the actual cutoff 120. -/
theorem coeff_tail_at_120_le_of_residual_caps
    (hEL : leftTailEnergy 120 ≤ (1174 / 1000 : ℝ))
    (hER : rightTailEnergy 120 ≤ (1176 / 1000 : ℝ)) :
    (∑' j : ℕ, |coeff (j + 120)|) ≤ (6457 / 25000000 : ℝ) :=
  (coeff_tail_le_of_residual_caps 120 (by norm_num) _ _ hEL hER).trans
    residual_tail_budget_at_120

/-- Certificate interface at the intended origin cutoff: numerical upper bounds
for the two full energy integrals and lower bounds for the first 120 modes. -/
theorem coeff_tail_at_120_le_of_visible
    (hCL : (∫ s in Ioi (0 : ℝ), Real.exp (-s) * ‖fEnergyAmplitude s‖ ^ 2) ≤
      (12671 / 1000 : ℝ))
    (hCR : (∫ s in Ioi (0 : ℝ), Real.exp (-s) * ‖gEnergyAmplitude s‖ ^ 2) ≤
      (6337 / 500 : ℝ))
    (hVL : (11497 / 1000 : ℝ) ≤ ∑ n ∈ range 120, leftEnergyTerm n)
    (hVR : (5749 / 500 : ℝ) ≤ ∑ n ∈ range 120, rightEnergyTerm n) :
    (∑' j : ℕ, |coeff (j + 120)|) ≤ (6457 / 25000000 : ℝ) := by
  apply coeff_tail_at_120_le_of_residual_caps
  · have h := leftTailEnergy_le_of_visible 120 _ _ hCL hVL
    norm_num at h ⊢
    exact h
  · have h := rightTailEnergy_le_of_visible 120 _ _ hCR hVR
    norm_num at h ⊢
    exact h

/-- The stronger rational cap also supplies the published `0.0002615` budget. -/
theorem coeff_tail_at_120_le_published
    (hEL : leftTailEnergy 120 ≤ (1174 / 1000 : ℝ))
    (hER : rightTailEnergy 120 ≤ (1176 / 1000 : ℝ)) :
    (∑' j : ℕ, |coeff (j + 120)|) ≤ (523 / 2000000 : ℝ) :=
  (coeff_tail_at_120_le_of_residual_caps hEL hER).trans (by norm_num)

end

end Grothe.HJM.Origin
