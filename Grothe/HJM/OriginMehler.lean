import Grothe.HJM.OriginKernel
import Grothe.HJM.OriginLaguerre
import Grothe.UpperChaos.DiagonalPairing
import Grothe.UpperChaos.LawY

/-!
# The asymmetric scalar Mehler expansion and its real symmetrization

Agent-ID: codex-aa04.

The actual Gaussian response-pair kernel is expanded in the existing Hermite
Hilbert basis. Charge selection restricts it to `(n+1,n)`. Reflection then
retains the real parts of the signed cross coefficients, yielding a dominated
radial kernel. These identities include the boundary of the unit disk and
make no numerical table or energy-enclosure assumption.
-/

open MeasureTheory ProbabilityTheory Grothe.LowerAnalytic Grothe.UpperChaos
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.HJM

noncomputable section

private lemma mp_first : MeasurePreserving (Prod.fst : ℂ × ℂ → ℂ) mu2 gaussC := by
  refine ⟨measurable_fst, ?_⟩
  rw [Measure.map_fst_prod, measure_univ, one_smul]

private lemma mp_mehler {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) :
    MeasurePreserving (fun u : ℂ × ℂ => ρ*u.1+sig ρ*u.2) mu2 gaussC :=
  ⟨by fun_prop, map_mehlerY hρ⟩

private def pullFirst : Lp ℂ 2 gaussC →ₗᵢ[ℂ] Lp ℂ 2 mu2 :=
  Lp.compMeasurePreservingₗᵢ ℂ Prod.fst mp_first

private def pullMehler {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) : Lp ℂ 2 gaussC →ₗᵢ[ℂ] Lp ℂ 2 mu2 :=
  Lp.compMeasurePreservingₗᵢ ℂ _ (mp_mehler hρ)

private def pairL2 {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) (F G : Lp ℂ 2 gaussC) : ℂ :=
  ⟪pullFirst F, pullMehler hρ G⟫_ℂ

private lemma pairL2_eq_integral {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) (F G : Lp ℂ 2 gaussC) :
    pairL2 hρ F G = ∫ u, conj (F u.1) * G (ρ*u.1+sig ρ*u.2) ∂mu2 := by
  rw [pairL2, L2.inner_def]
  refine integral_congr_ae ?_
  filter_upwards [Lp.coeFn_compMeasurePreserving F mp_first,
    Lp.coeFn_compMeasurePreserving G (mp_mehler hρ)] with u h1 h2
  change ⟪(Lp.compMeasurePreserving Prod.fst mp_first F : _ → ℂ) u,
    (Lp.compMeasurePreserving _ (mp_mehler hρ) G : _ → ℂ) u⟫_ℂ = _
  rw [h1, h2, RCLike.inner_apply, mul_comm]
  rfl

private lemma pairL2_hvec {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) (i j : ℕ × ℕ) :
    pairL2 hρ (hvec i) (hvec j) = if i = j then ρ^i.1 * conj ρ^i.2 else 0 := by
  rw [pairL2_eq_integral]
  have hx := mp_first.quasiMeasurePreserving.ae_eq_comp (memLp_hfun i).coeFn_toLp
  have hy := (mp_mehler hρ).quasiMeasurePreserving.ae_eq_comp (memLp_hfun j).coeFn_toLp
  rw [integral_congr_ae (g := fun u => ((nrm i.1 i.2 : ℂ) * nrm j.1 j.2) *
    (conj (ev u.1 (H i.1 i.2)) * ev (ρ*u.1+sig ρ*u.2) (H j.1 j.2))) ?_]
  · rw [integral_const_mul, integral_mehler hρ]
    by_cases h : i = j
    · subst h
      simp only [and_self, ↓reduceIte]
      have hn : ((nrm i.1 i.2 : ℂ) * nrm i.1 i.2) *
          ((i.1.factorial * i.2.factorial : ℕ) : ℂ) = 1 := by
        exact_mod_cast nrm_sq_mul i.1 i.2
      linear_combination (ρ^i.1 * conj ρ^i.2) * hn
    · have h' : ¬(i.1 = j.1 ∧ i.2 = j.2) := fun h' => h (Prod.ext h'.1 h'.2)
      simp [h, h']
  · filter_upwards [hx, hy] with u h1 h2
    simp only [Function.comp, hvec] at h1 h2 ⊢
    rw [h1, h2]
    simp [hfun, Complex.conj_ofReal]
    ring

/-- The complete scalar Mehler expansion for two actual Gaussian `L²` responses.
No charge or pointwise boundedness assumption is needed for this identity. -/
theorem scalarPairKernel_hasSum {F G : ℂ → ℂ} (hF : MemLp F 2 gaussC)
    (hG : MemLp G 2 gaussC) {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) :
    HasSum (fun i : ℕ × ℕ => conj ⟪hvec i, hF.toLp F⟫_ℂ *
      (ρ^i.1 * conj ρ^i.2) * ⟪hvec i, hG.toLp G⟫_ℂ) (scalarPairKernel F G ρ) := by
  have hs : HasSum (fun i : ℕ × ℕ => conj ⟪hvec i, hF.toLp F⟫_ℂ *
      (ρ^i.1 * conj ρ^i.2) * ⟪hvec i, hG.toLp G⟫_ℂ)
      (pairL2 hρ (hF.toLp F) (hG.toLp G)) := by
    simpa only [hermiteBasis_apply, pairL2, LinearIsometry.coe_toContinuousLinearMap] using
      hasSum_diagonal_pairing hermiteBasis pullFirst.toContinuousLinearMap
        (pullMehler hρ).toContinuousLinearMap (fun i => ρ^i.1 * conj ρ^i.2)
        (fun i j => by simpa only [hermiteBasis_apply, pairL2,
          LinearIsometry.coe_toContinuousLinearMap] using pairL2_hvec hρ i j)
        (hF.toLp F) (hG.toLp G)
  have he : pairL2 hρ (hF.toLp F) (hG.toLp G) = scalarPairKernel F G ρ := by
    rw [pairL2_eq_integral]
    apply integral_congr_ae
    filter_upwards [mp_first.quasiMeasurePreserving.ae_eq_comp hF.coeFn_toLp,
      (mp_mehler hρ).quasiMeasurePreserving.ae_eq_comp hG.coeFn_toLp] with u h1 h2
    simp only [Function.comp_apply] at h1 h2
    rw [h1, h2]
  exact he ▸ hs

/-- Signed complex cross coefficients; no absolute value is taken here. -/
def scalarPairCoeff (F G : Lp ℂ 2 gaussC) (n : ℕ) : ℂ :=
  conj (chargeOneCoeff F n) * chargeOneCoeff G n

/-- The real coefficients of the reflection-symmetrized kernel. -/
def symmetrizedPairCoeff (F G : Lp ℂ 2 gaussC) (n : ℕ) : ℝ :=
  (scalarPairCoeff F G n).re

/-- One charge-one response suffices to select the charge-one slice of a pair. -/
theorem scalarPairKernel_hasSum_chargeOne {F G : ℂ → ℂ}
    (hF : MemLp F 2 gaussC) (hG : MemLp G 2 gaussC)
    (hcharge : ∀ c z, ‖c‖ = 1 → F (c*z) = c*F z)
    {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) :
    HasSum (fun n => scalarPairCoeff (hF.toLp F) (hG.toLp G) n *
      (ρ * (‖ρ‖ : ℂ)^(2*n))) (scalarPairKernel F G ρ) := by
  have hs := scalarPairKernel_hasSum hF hG hρ
  have hinj : Function.Injective (fun n : ℕ => (n+1,n)) :=
    fun a b h => congrArg Prod.snd h
  have hz : ∀ i : ℕ × ℕ, i ∉ Set.range (fun n : ℕ => (n+1,n)) →
      conj ⟪hvec i, hF.toLp F⟫_ℂ * (ρ^i.1 * conj ρ^i.2) *
        ⟪hvec i, hG.toLp G⟫_ℂ = 0 := by
    intro i hi
    have hne : i.1 ≠ i.2+1 := fun h => hi ⟨i.2, Prod.ext h.symm rfl⟩
    rw [hermiteCoeff_eq_zero_of_charge_one hF hcharge hne]
    simp
  have hs' := (hinj.hasSum_iff hz).2 hs
  have he (n : ℕ) :
      conj ⟪hvec (n+1,n), hF.toLp F⟫_ℂ * (ρ^(n+1) * conj ρ^n) *
        ⟪hvec (n+1,n), hG.toLp G⟫_ℂ =
      scalarPairCoeff (hF.toLp F) (hG.toLp G) n * (ρ * (‖ρ‖ : ℂ)^(2*n)) := by
    have hp : ρ^(n+1) * conj ρ^n = ρ * (‖ρ‖ : ℂ)^(2*n) := by
      calc
        _ = ρ * (ρ * conj ρ)^n := by rw [mul_pow, pow_succ]; ring
        _ = _ := by rw [mul_comm ρ (conj ρ), ← Complex.normSq_eq_conj_mul_self,
            Complex.normSq_eq_norm_sq, Complex.ofReal_pow, pow_mul]
    rw [hp]
    dsimp [scalarPairCoeff, chargeOneCoeff, chargeOneMode]
    ring
  exact hs'.congr_fun (fun n => (he n).symm)

theorem symmetrizedPairCoeff_summable (F G : Lp ℂ 2 gaussC) :
    Summable fun n => |symmetrizedPairCoeff F G n| := by
  apply Summable.of_nonneg_of_le (fun _ => abs_nonneg _)
    (fun n => ?_) (chargeOneCoeff_summable_norm_mul F G)
  exact (Complex.abs_re_le_norm _).trans_eq (by
    simp only [scalarPairCoeff, norm_mul, Complex.norm_conj])

/-- Reflection symmetrization retains the real signed cross coefficients,
including all omitted modes and correlations on the unit-circle boundary. -/
theorem symmetrizedPairKernel_eq_radialKernel {F G : ℂ → ℂ}
    (hFm : Measurable F) (hGm : Measurable G)
    (hF : MemLp F 2 gaussC) (hG : MemLp G 2 gaussC)
    (hcharge : ∀ c z, ‖c‖ = 1 → F (c*z) = c*F z)
    {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) :
    symmetrizedPairKernel F G ρ =
      radialKernel (symmetrizedPairCoeff (hF.toLp F) (hG.toLp G)) ρ := by
  have hs := scalarPairKernel_hasSum_chargeOne hF hG hcharge hρ
  have ht := Complex.hasSum_conj'.2
    (scalarPairKernel_hasSum_chargeOne hF hG hcharge (by simpa using hρ : ‖conj ρ‖ ≤ 1))
  have hu := (hs.add ht).div_const (2 : ℂ)
  have he (n : ℕ) :
      (scalarPairCoeff (hF.toLp F) (hG.toLp G) n * (ρ * (‖ρ‖ : ℂ)^(2*n)) +
        conj (scalarPairCoeff (hF.toLp F) (hG.toLp G) n *
          (conj ρ * (‖conj ρ‖ : ℂ)^(2*n)))) / 2 =
      (symmetrizedPairCoeff (hF.toLp F) (hG.toLp G) n : ℂ) *
        (ρ * (‖ρ‖ : ℂ)^(2*n)) := by
    let a := scalarPairCoeff (hF.toLp F) (hG.toLp G) n
    have ha : a + conj a = 2 * (a.re : ℂ) := by
      apply Complex.ext <;> simp <;> ring
    change (a * (ρ * (‖ρ‖ : ℂ)^(2*n)) +
        conj (a * (conj ρ * (‖conj ρ‖ : ℂ)^(2*n)))) / 2 =
      (a.re : ℂ) * (ρ * (‖ρ‖ : ℂ)^(2*n))
    simp only [map_mul, map_pow, Complex.norm_conj, Complex.conj_ofReal, Complex.conj_conj]
    rw [← add_mul, ha]
    ring
  have hv : HasSum (fun n => (symmetrizedPairCoeff (hF.toLp F) (hG.toLp G) n : ℂ) *
      (ρ * (‖ρ‖ : ℂ)^(2*n)))
      ((scalarPairKernel F G ρ + conj (scalarPairKernel F G (conj ρ))) / 2) :=
    hu.congr_fun (fun n => (he n).symm)
  rw [symmetrizedPairKernel_eq hFm hGm]
  exact hv.tsum_eq.symm

/-- A coefficient formula for the actual disk-valued responses gives a
dominated radial kernel, without assuming domination as an external input. -/
theorem symmetrizedPairCoeff_dominated {F G : ℂ → ℂ}
    (hFm : Measurable F) (hGm : Measurable G)
    (hF1 : ∀ z, ‖F z‖ ≤ 1) (hG1 : ∀ z, ‖G z‖ ≤ 1)
    (hF : MemLp F 2 gaussC) (hG : MemLp G 2 gaussC)
    (hcharge : ∀ c z, ‖c‖ = 1 → F (c*z) = c*F z) :
    DominatedKernel (radialKernel (symmetrizedPairCoeff (hF.toLp F) (hG.toLp G))) :=
  (symmetrizedPairKernel_dominated hFm hGm hF1 hG1).congr fun _ hρ =>
    symmetrizedPairKernel_eq_radialKernel hFm hGm hF hG hcharge hρ

end

end Grothe.HJM
