import Grothe.UpperChaos.HermiteComplete

/-!
# The Hermite Hilbert basis of `L²(gaussC)` and Parseval (U1 + U2 of PLAN_UPPER)

`hermiteBasis : HilbertBasis (ℕ × ℕ) ℂ (Lp ℂ 2 gaussC)`, `h_{pq} = H_{pq}/√(p! q!)`
(orthonormal by `integral_hermite`, total by `hermite_complete`).  Consequently every
`G ∈ L²(gaussC)` has the energy expansion

    Σ_{pq} |⟪h_{pq}, G⟫|² = ‖G‖²                                        (`hasSum_energy`)

with `⟪h_{pq}, G⟫ = (p! q!)^{−1/2} E[conj H_{pq} · G]` (`inner_hvec_left`).
-/

open MeasureTheory ProbabilityTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperChaos

noncomputable section

/-- `(p! q!)^{−1/2}`. -/
def nrm (p q : ℕ) : ℝ := (√((p.factorial * q.factorial : ℕ) : ℝ))⁻¹

lemma nrm_pos (p q : ℕ) : 0 < nrm p q := by
  unfold nrm; have := Nat.factorial_pos p; have := Nat.factorial_pos q; positivity

lemma nrm_sq_mul (p q : ℕ) : nrm p q * nrm p q * ((p.factorial * q.factorial : ℕ) : ℝ) = 1 := by
  have h : (0 : ℝ) < ((p.factorial * q.factorial : ℕ) : ℝ) := by
    have := Nat.factorial_pos p; have := Nat.factorial_pos q; positivity
  rw [nrm, ← mul_inv, Real.mul_self_sqrt h.le, inv_mul_cancel₀ h.ne']

/-- The normalised Hermite function `h_{pq}`. -/
def hfun (i : ℕ × ℕ) (z : ℂ) : ℂ := (nrm i.1 i.2 : ℂ) * ev z (H i.1 i.2)

lemma memLp_hfun (i : ℕ × ℕ) : MemLp (hfun i) 2 gaussC := (memLp_ev _).const_mul _

/-- `h_{pq}` as an element of `L²(gaussC)`. -/
def hvec (i : ℕ × ℕ) : Lp ℂ 2 gaussC := (memLp_hfun i).toLp _

lemma inner_toLp {F G : ℂ → ℂ} (hF : MemLp F 2 gaussC) (hG : MemLp G 2 gaussC) :
    ⟪hF.toLp F, hG.toLp G⟫_ℂ = ∫ z, conj (F z) * G z ∂gaussC := by
  rw [L2.inner_def]
  refine integral_congr_ae ?_
  filter_upwards [hF.coeFn_toLp, hG.coeFn_toLp] with z h1 h2
  rw [h1, h2, RCLike.inner_apply, mul_comm]

lemma inner_hvec (i j : ℕ × ℕ) : ⟪hvec i, hvec j⟫_ℂ = if i = j then 1 else 0 := by
  rw [hvec, hvec, inner_toLp]
  simp only [hfun, map_mul, Complex.conj_ofReal]
  have : ∀ z, (nrm i.1 i.2 : ℂ) * conj (ev z (H i.1 i.2)) * ((nrm j.1 j.2 : ℂ) * ev z (H j.1 j.2))
      = ((nrm i.1 i.2 : ℂ) * nrm j.1 j.2) * (conj (ev z (H i.1 i.2)) * ev z (H j.1 j.2)) :=
    fun z => by ring
  simp_rw [this]
  rw [integral_const_mul, integral_hermite]
  by_cases h : i = j
  · subst h
    simp only [and_self, ↓reduceIte]
    exact_mod_cast nrm_sq_mul i.1 i.2
  · have h' : ¬(i.1 = j.1 ∧ i.2 = j.2) := fun h' => h (Prod.ext h'.1 h'.2)
    simp [h, h']

theorem orthonormal_hvec : Orthonormal ℂ hvec := orthonormal_iff_ite.2 inner_hvec

/-- `⟪h_{pq}, G⟫ = (p! q!)^{−1/2} E[conj H_{pq} · G]`. -/
lemma inner_hvec_left (i : ℕ × ℕ) (G : Lp ℂ 2 gaussC) :
    ⟪hvec i, G⟫_ℂ = (nrm i.1 i.2 : ℂ) * ∫ z, conj (ev z (H i.1 i.2)) * G z ∂gaussC := by
  rw [L2.inner_def, ← integral_const_mul]
  refine integral_congr_ae ?_
  filter_upwards [(memLp_hfun i).coeFn_toLp] with z hz
  simp only [hvec] at *
  rw [hz, RCLike.inner_apply]
  simp [hfun, Complex.conj_ofReal]; ring

theorem span_hvec_perp : (Submodule.span ℂ (Set.range hvec))ᗮ = ⊥ := by
  refine (Submodule.eq_bot_iff _).2 fun G hG => ?_
  have h0 : ∀ p q, ∫ z, conj (ev z (H p q)) * G z ∂gaussC = 0 := fun p q => by
    have := Submodule.inner_right_of_mem_orthogonal
      (Submodule.subset_span ⟨(p, q), rfl⟩ : hvec (p, q) ∈ Submodule.span ℂ (Set.range hvec)) hG
    rw [inner_hvec_left] at this
    exact (mul_eq_zero.1 this).resolve_left (by exact_mod_cast (nrm_pos p q).ne')
  exact Lp.eq_zero_iff_ae_eq_zero.2 (hermite_complete (Lp.memLp G) h0)

/-- **The Hermite Hilbert basis of `L²(gaussC)`.** -/
def hermiteBasis : HilbertBasis (ℕ × ℕ) ℂ (Lp ℂ 2 gaussC) :=
  HilbertBasis.mkOfOrthogonalEqBot orthonormal_hvec span_hvec_perp

@[simp] lemma hermiteBasis_apply (i : ℕ × ℕ) : hermiteBasis i = hvec i := by
  simp [hermiteBasis]

/-- **Parseval**: the energies `|⟪h_{pq}, G⟫|²` sum to `‖G‖²`. -/
theorem hasSum_energy (G : Lp ℂ 2 gaussC) :
    HasSum (fun i => ‖⟪hvec i, G⟫_ℂ‖ ^ 2) (‖G‖ ^ 2) := by
  have h := lp.hasSum_norm (p := 2) (by norm_num) (hermiteBasis.repr G)
  simp only [ENNReal.toReal_ofNat, Real.rpow_two, HilbertBasis.repr_apply_apply,
    hermiteBasis_apply, LinearIsometryEquiv.norm_map] at h
  exact_mod_cast h

end

end Grothe.UpperChaos
