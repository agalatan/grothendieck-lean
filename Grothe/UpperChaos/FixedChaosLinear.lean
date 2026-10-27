import Grothe.UpperChaos.FixedChaosSmoothing
import Grothe.UpperChaos.GradedHermiteFn
import Grothe.UpperChaos.EnergyBlock

/-!
# The actual degree-one smoothing matrix

The four normalized first-chaos modes are the two complex coordinates and
their conjugates. Integrating the independent centered Gaussian noise proves
their exact images under the production smoothing operator. Every matrix entry
is an explicit entry of the production matrix, with no numerical-entry premise.

Agent-ID: codex-2ca4
-/

open MeasureTheory Finset Grothe.LowerAnalytic
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperChaos.FixedChaosSmoothing

noncomputable section

/-- Order the first-chaos modes as `z, conjugate z, w, conjugate w`. -/
def linearMode : Fin 4 → Idx2 :=
  ![((1, 0), (0, 0)), ((0, 1), (0, 0)), ((0, 0), (1, 0)), ((0, 0), (0, 1))]

/-- The real production matrix acts identically on holomorphic and conjugate modes. -/
def linearMatrix : Fin 4 → Fin 4 → ℝ :=
  ![![m00, 0, m01, 0], ![0, m00, 0, m01],
    ![m01, 0, m11, 0], ![0, m01, 0, m11]]

theorem hfun2_linearMode_zero : hfun2 (linearMode 0) = fun u => u.1 := by
  funext u
  simp [linearMode, hfun2, nrm2, fac2, H2, H_succ_left, H_zero_zero, A0, ev, zv]

theorem hfun2_linearMode_one : hfun2 (linearMode 1) = fun u => conj u.1 := by
  funext u
  simp [linearMode, hfun2, nrm2, fac2, H2, H_zero_succ, H_zero_zero, A1, ev, zv]

theorem hfun2_linearMode_two : hfun2 (linearMode 2) = fun u => u.2 := by
  funext u
  simp [linearMode, hfun2, nrm2, fac2, H2, H_succ_left, H_zero_zero, A0, ev, zv]

theorem hfun2_linearMode_three : hfun2 (linearMode 3) = fun u => conj u.2 := by
  funext u
  simp [linearMode, hfun2, nrm2, fac2, H2, H_zero_succ, H_zero_zero, A1, ev, zv]

private theorem integrable_fst : Integrable (fun u : ℂ × ℂ => u.1) mu2 := by
  simpa only [hfun2_linearMode_zero] using
    (memLp_hfun2 (linearMode 0)).integrable (by norm_num)

private theorem integrable_snd : Integrable (fun u : ℂ × ℂ => u.2) mu2 := by
  simpa only [hfun2_linearMode_two] using
    (memLp_hfun2 (linearMode 2)).integrable (by norm_num)

private theorem integral_id_gauss : (∫ z : ℂ, z ∂gaussC) = 0 := by
  simpa using integral_moment 1 0

private theorem integral_fst : (∫ u : ℂ × ℂ, u.1 ∂mu2) = 0 := by
  have h := integral_prod_mul (μ := gaussC) (ν := gaussC)
    (fun z : ℂ => z) (fun _ : ℂ => (1 : ℂ))
  simpa [mu2, integral_id_gauss] using h

private theorem integral_snd : (∫ u : ℂ × ℂ, u.2 ∂mu2) = 0 := by
  have h := integral_prod_mul (μ := gaussC) (ν := gaussC)
    (fun _ : ℂ => (1 : ℂ)) (fun z : ℂ => z)
  simpa [mu2, integral_id_gauss] using h

private theorem integral_affine_coordinates (A B C : ℂ) :
    (∫ Z : ℂ × ℂ, A + B * Z.1 + C * Z.2 ∂mu2) = A := by
  have hA : Integrable (fun Z : ℂ × ℂ => A + B * Z.1) mu2 :=
    (integrable_const A).add (integrable_fst.const_mul B)
  have hB : Integrable (fun Z : ℂ × ℂ => B * Z.1) mu2 :=
    integrable_fst.const_mul B
  have hC : Integrable (fun Z : ℂ × ℂ => C * Z.2) mu2 :=
    integrable_snd.const_mul C
  rw [integral_add hA hC, integral_add (integrable_const A) hB]
  simp [integral_const_mul, integral_fst, integral_snd]

private theorem integral_smoothArg_fst (x : ℂ × ℂ) :
    (∫ Z, (smoothArg x Z).1 ∂mu2) = (m00 : ℂ) * x.1 + (m01 : ℂ) * x.2 :=
  integral_affine_coordinates _ _ _

private theorem integral_smoothArg_snd (x : ℂ × ℂ) :
    (∫ Z, (smoothArg x Z).2 ∂mu2) = (m01 : ℂ) * x.1 + (m11 : ℂ) * x.2 :=
  integral_affine_coordinates _ _ _

/-- The Gaussian convolution acts on each of the four actual Hermite polynomials by `M`. -/
theorem smoothFn_linearMode (s : Fin 4) (x : ℂ × ℂ) :
    smoothFn (hfun2 (linearMode s)) x =
      ∑ r : Fin 4, (linearMatrix r s : ℂ) * hfun2 (linearMode r) x := by
  fin_cases s
  · change smoothFn (hfun2 (linearMode 0)) x =
      ∑ r : Fin 4, (linearMatrix r 0 : ℂ) * hfun2 (linearMode r) x
    rw [hfun2_linearMode_zero]
    simpa [smoothFn, Fin.sum_univ_four, linearMatrix, hfun2_linearMode_zero, hfun2_linearMode_two]
      using integral_smoothArg_fst x
  · change smoothFn (hfun2 (linearMode 1)) x =
      ∑ r : Fin 4, (linearMatrix r 1 : ℂ) * hfun2 (linearMode r) x
    rw [hfun2_linearMode_one]
    simpa [smoothFn, Fin.sum_univ_four, linearMatrix, hfun2_linearMode_one, hfun2_linearMode_three,
      integral_conj] using congrArg (starRingEnd ℂ) (integral_smoothArg_fst x)
  · change smoothFn (hfun2 (linearMode 2)) x =
      ∑ r : Fin 4, (linearMatrix r 2 : ℂ) * hfun2 (linearMode r) x
    rw [hfun2_linearMode_two]
    simpa [smoothFn, Fin.sum_univ_four, linearMatrix, hfun2_linearMode_zero, hfun2_linearMode_two]
      using integral_smoothArg_snd x
  · change smoothFn (hfun2 (linearMode 3)) x =
      ∑ r : Fin 4, (linearMatrix r 3 : ℂ) * hfun2 (linearMode r) x
    rw [hfun2_linearMode_three]
    simpa [smoothFn, Fin.sum_univ_four, linearMatrix, hfun2_linearMode_one, hfun2_linearMode_three,
      integral_conj] using congrArg (starRingEnd ℂ) (integral_smoothArg_snd x)

/-- The exact degree-one action of the production smoothing on `L²`. -/
theorem smoothOp_linearMode (s : Fin 4) :
    smoothOp (hvec2 (linearMode s)) =
      ∑ r : Fin 4, (linearMatrix r s : ℂ) • hvec2 (linearMode r) := by
  rw [hvec2, smoothOp_toLp' (continuous_hfun2 _).measurable]
  apply Lp.ext
  have hterm (r : Fin 4) :
      ((linearMatrix r s : ℂ) • hvec2 (linearMode r) : Lp ℂ 2 mu2) =ᵐ[mu2]
        fun u => (linearMatrix r s : ℂ) * hfun2 (linearMode r) u := by
    refine (Lp.coeFn_smul _ _).trans ?_
    filter_upwards [(memLp_hfun2 (linearMode r)).coeFn_toLp] with u hu
    change (linearMatrix r s : ℂ) * hvec2 (linearMode r) u = _
    exact congrArg (fun z => (linearMatrix r s : ℂ) * z) hu
  have hs := (Lp.coeFn_finsetSum (s := (Finset.univ : Finset (Fin 4)))
    (fun r => (linearMatrix r s : ℂ) • hvec2 (linearMode r)))
  have he := eventuallyEq_sum (s := (Finset.univ : Finset (Fin 4))) (fun r _ => hterm r)
  filter_upwards [(memLp_smoothFn (continuous_hfun2 (linearMode s)).measurable
    (memLp_hfun2 (linearMode s))).coeFn_toLp, hs, he] with u hu hsum heq
  rw [hu, hsum, heq]
  exact smoothFn_linearMode s u

/-- All sixteen actual entries on the first chaos are exactly the displayed matrix. -/
theorem actualEntry_linearMode (r s : Fin 4) :
    actualEntry (linearMode r) (linearMode s) = (linearMatrix r s : ℂ) := by
  rw [actualEntry, smoothOp_linearMode, inner_sum]
  simp only [inner_smul_right, inner_hvec2]
  fin_cases r <;> fin_cases s <;> simp [Fin.sum_univ_four, linearMode, linearMatrix]

theorem linearMode_injective : Function.Injective linearMode := by decide +kernel

theorem tdeg_linearMode (r : Fin 4) : tdeg (linearMode r) = 1 := by
  fin_cases r <;> rfl

theorem chaosShell_one : chaosShell 1 = Finset.univ.image linearMode := by decide +kernel

/-- For any input response, each actual first-chaos coefficient is the exact
four-term production matrix product. No approximation or table-entry premise occurs. -/
theorem inner_linearMode_smoothOp (r : Fin 4) (f : Lp ℂ 2 mu2) :
    ⟪hvec2 (linearMode r), smoothOp f⟫_ℂ =
      ∑ s : Fin 4, (linearMatrix r s : ℂ) * ⟪hvec2 (linearMode s), f⟫_ℂ := by
  rw [fixed_shell_action, tdeg_linearMode, chaosShell_one,
    Finset.sum_image (fun _ _ _ _ h => linearMode_injective h)]
  apply Finset.sum_congr rfl
  intro s _
  rw [actualEntry_linearMode, mul_comm]

/-- The first-coordinate degree-one energy of the actual smoothed response. -/
theorem energy_smoothOp_one_zero (f : Lp ℂ 2 mu2) :
    energy (smoothOp f) (1, 0) =
      ‖(m00 : ℂ) * ⟪hvec2 (linearMode 0), f⟫_ℂ +
        (m01 : ℂ) * ⟪hvec2 (linearMode 2), f⟫_ℂ‖ ^ 2 +
      ‖(m00 : ℂ) * ⟪hvec2 (linearMode 1), f⟫_ℂ +
        (m01 : ℂ) * ⟪hvec2 (linearMode 3), f⟫_ℂ‖ ^ 2 := by
  rw [← norm_energyBlock_sq, EuclideanSpace.norm_sq_eq]
  change (∑ a : Fin 2 × Fin 1,
    ‖⟪hvec2 ((blockEquiv (1, 0)) a).1, smoothOp f⟫_ℂ‖ ^ 2) = _
  simp only [Fintype.sum_prod_type, Fin.sum_univ_two, Fin.sum_univ_one]
  change ‖⟪hvec2 (linearMode 1), smoothOp f⟫_ℂ‖ ^ 2 +
    ‖⟪hvec2 (linearMode 0), smoothOp f⟫_ℂ‖ ^ 2 = _
  rw [inner_linearMode_smoothOp, inner_linearMode_smoothOp]
  simp [Fin.sum_univ_four, linearMatrix, add_comm]

/-- The second-coordinate degree-one energy of the actual smoothed response. -/
theorem energy_smoothOp_zero_one (f : Lp ℂ 2 mu2) :
    energy (smoothOp f) (0, 1) =
      ‖(m01 : ℂ) * ⟪hvec2 (linearMode 0), f⟫_ℂ +
        (m11 : ℂ) * ⟪hvec2 (linearMode 2), f⟫_ℂ‖ ^ 2 +
      ‖(m01 : ℂ) * ⟪hvec2 (linearMode 1), f⟫_ℂ +
        (m11 : ℂ) * ⟪hvec2 (linearMode 3), f⟫_ℂ‖ ^ 2 := by
  rw [← norm_energyBlock_sq, EuclideanSpace.norm_sq_eq]
  change (∑ a : Fin 1 × Fin 2,
    ‖⟪hvec2 ((blockEquiv (0, 1)) a).1, smoothOp f⟫_ℂ‖ ^ 2) = _
  simp only [Fintype.sum_prod_type, Fin.sum_univ_two, Fin.sum_univ_one]
  change ‖⟪hvec2 (linearMode 3), smoothOp f⟫_ℂ‖ ^ 2 +
    ‖⟪hvec2 (linearMode 2), smoothOp f⟫_ℂ‖ ^ 2 = _
  rw [inner_linearMode_smoothOp, inner_linearMode_smoothOp]
  simp [Fin.sum_univ_four, linearMatrix, add_comm]

end
end Grothe.UpperChaos.FixedChaosSmoothing
