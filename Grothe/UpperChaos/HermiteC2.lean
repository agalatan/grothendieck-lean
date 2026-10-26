import Grothe.UpperChaos.GaussC2

/-!
# The tensor Hermite basis of `L²(gaussC ⊗ gaussC)` (U1–U2 of PLAN_UPPER on `ℂ²`)

`H2 ((p,q),(r,s)) (z₁,z₂) = H_{pq}(z₁) H_{rs}(z₂)`.  Orthogonality is Fubini of
`integral_hermite` (`integral_hermite2`).  Completeness (`hermite2_complete`): the span of the
`H2` contains `1` and is closed under multiplication by `z₁, z̄₁, z₂, z̄₂`
(`z H_{pq} = H_{p+1,q} + q H_{p,q−1}`, `z̄ H_{pq} = H_{p,q+1} + p H_{p−1,q}`), hence contains every real
polynomial in the four real coordinates (`mem_V2_realPoly`), and `poly_complete` (d = 4) applies
through `map_e2`.  Hilbert basis `hermiteBasis2` and Parseval `hasSum_energy2` as in one coordinate.
-/

open MeasureTheory ProbabilityTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperChaos

noncomputable section

/-- Multi-indices of `ℂ²`. -/
abbrev Idx2 := (ℕ × ℕ) × (ℕ × ℕ)

/-- The tensor Hermite function `H_{pq}(z₁) H_{rs}(z₂)`. -/
def H2 (i : Idx2) (u : ℂ × ℂ) : ℂ := ev u.1 (H i.1.1 i.1.2) * ev u.2 (H i.2.1 i.2.2)

/-- `p! q! r! s!`. -/
def fac2 (i : Idx2) : ℕ := i.1.1.factorial * i.1.2.factorial * (i.2.1.factorial * i.2.2.factorial)

lemma memLp_prod_mul {f g : ℂ → ℂ} (hf : MemLp f 2 gaussC) (hg : MemLp g 2 gaussC) :
    MemLp (fun u : ℂ × ℂ => f u.1 * g u.2) 2 mu2 := by
  have hm : AEStronglyMeasurable (fun u : ℂ × ℂ => f u.1 * g u.2) mu2 :=
    hf.aestronglyMeasurable.comp_fst.mul hg.aestronglyMeasurable.comp_snd
  rw [memLp_two_iff_integrable_sq_norm hm]
  have h1 := (memLp_two_iff_integrable_sq_norm hf.aestronglyMeasurable).1 hf
  have h2 := (memLp_two_iff_integrable_sq_norm hg.aestronglyMeasurable).1 hg
  have h3 : Integrable (fun u : ℂ × ℂ => ‖f u.1‖ ^ 2 * ‖g u.2‖ ^ 2) (gaussC.prod gaussC) :=
    h1.mul_prod h2
  refine h3.congr (Filter.Eventually.of_forall fun u => ?_)
  simp only [norm_mul, mul_pow]

lemma memLp_H2 (i : Idx2) : MemLp (H2 i) 2 mu2 := by
  unfold H2
  exact memLp_prod_mul (f := fun z => ev z (H i.1.1 i.1.2)) (g := fun z => ev z (H i.2.1 i.2.2))
    (memLp_ev _) (memLp_ev _)

/-- **Orthogonality of the tensor Hermite functions.** -/
theorem integral_hermite2 (i j : Idx2) :
    ∫ u, conj (H2 i u) * H2 j u ∂mu2 = if i = j then (fac2 i : ℂ) else 0 := by
  have : ∀ u : ℂ × ℂ, conj (H2 i u) * H2 j u
      = (conj (ev u.1 (H i.1.1 i.1.2)) * ev u.1 (H j.1.1 j.1.2))
        * (conj (ev u.2 (H i.2.1 i.2.2)) * ev u.2 (H j.2.1 j.2.2)) := fun u => by
    simp only [H2, map_mul]; ring
  simp_rw [this]
  rw [integral_prod_mul (f := fun z => conj (ev z (H i.1.1 i.1.2)) * ev z (H j.1.1 j.1.2))
    (g := fun z => conj (ev z (H i.2.1 i.2.2)) * ev z (H j.2.1 j.2.2)),
    integral_hermite, integral_hermite]
  split_ifs <;> simp_all [Prod.ext_iff, fac2]

/-! ### Multiplication by the coordinates -/

lemma ev_X0_mul_H (z : ℂ) (p q : ℕ) :
    z * ev z (H p q) = ev z (H (p + 1) q) + (q : ℂ) * ev z (H p (q - 1)) := by
  have hX : X 0 * H p q = H (p + 1) q + pderiv 1 (H p q) := by
    rw [H_succ_left, A0]; ring
  cases q with
  | zero => simpa [ev, zv, pderiv1_H_zero] using congrArg (ev z) hX
  | succ q => simpa [ev, zv, pderiv1_H_succ, nsmul_eq_mul] using congrArg (ev z) hX

lemma ev_X1_mul_H (z : ℂ) (p q : ℕ) :
    conj z * ev z (H p q) = ev z (H p (q + 1)) + (p : ℂ) * ev z (H (p - 1) q) := by
  have hX : X 1 * H p q = H p (q + 1) + pderiv 0 (H p q) := by
    rw [← A1_H, A1]; ring
  cases p with
  | zero => simpa [ev, zv, pderiv0_H_zero] using congrArg (ev z) hX
  | succ p => simpa [ev, zv, pderiv0_H_succ, nsmul_eq_mul] using congrArg (ev z) hX

/-- The span of the tensor Hermite functions. -/
def V2 : Submodule ℂ (ℂ × ℂ → ℂ) := Submodule.span ℂ (Set.range H2)

lemma H2_mem (i : Idx2) : H2 i ∈ V2 := Submodule.subset_span ⟨i, rfl⟩

/-- `V2` is closed under multiplication by a function `m` once each `m · H2 i` lies in `V2`. -/
lemma V2_mul_mem (m : ℂ × ℂ → ℂ) (hm : ∀ i, (fun u => m u * H2 i u) ∈ V2) {v : ℂ × ℂ → ℂ}
    (hv : v ∈ V2) : (fun u => m u * v u) ∈ V2 := by
  exact (Submodule.span_le.2 (Set.range_subset_iff.2 hm) :
    V2 ≤ V2.comap (LinearMap.mul ℂ _ m)) hv

lemma mul_z1_mem (i : Idx2) : (fun u : ℂ × ℂ => u.1 * H2 i u) ∈ V2 := by
  have : (fun u : ℂ × ℂ => u.1 * H2 i u)
      = H2 ((i.1.1 + 1, i.1.2), i.2) + (i.1.2 : ℂ) • H2 ((i.1.1, i.1.2 - 1), i.2) := by
    funext u; simp only [H2, Pi.add_apply, Pi.smul_apply, smul_eq_mul]
    rw [← mul_assoc, ev_X0_mul_H]; ring
  rw [this]; exact V2.add_mem (H2_mem _) (V2.smul_mem _ (H2_mem _))

lemma mul_cz1_mem (i : Idx2) : (fun u : ℂ × ℂ => conj u.1 * H2 i u) ∈ V2 := by
  have : (fun u : ℂ × ℂ => conj u.1 * H2 i u)
      = H2 ((i.1.1, i.1.2 + 1), i.2) + (i.1.1 : ℂ) • H2 ((i.1.1 - 1, i.1.2), i.2) := by
    funext u; simp only [H2, Pi.add_apply, Pi.smul_apply, smul_eq_mul]
    rw [← mul_assoc, ev_X1_mul_H]; ring
  rw [this]; exact V2.add_mem (H2_mem _) (V2.smul_mem _ (H2_mem _))

lemma mul_z2_mem (i : Idx2) : (fun u : ℂ × ℂ => u.2 * H2 i u) ∈ V2 := by
  have : (fun u : ℂ × ℂ => u.2 * H2 i u)
      = H2 (i.1, (i.2.1 + 1, i.2.2)) + (i.2.2 : ℂ) • H2 (i.1, (i.2.1, i.2.2 - 1)) := by
    funext u; simp only [H2, Pi.add_apply, Pi.smul_apply, smul_eq_mul]
    rw [mul_left_comm, ev_X0_mul_H]; ring
  rw [this]; exact V2.add_mem (H2_mem _) (V2.smul_mem _ (H2_mem _))

lemma mul_cz2_mem (i : Idx2) : (fun u : ℂ × ℂ => conj u.2 * H2 i u) ∈ V2 := by
  have : (fun u : ℂ × ℂ => conj u.2 * H2 i u)
      = H2 (i.1, (i.2.1, i.2.2 + 1)) + (i.2.1 : ℂ) • H2 (i.1, (i.2.1 - 1, i.2.2)) := by
    funext u; simp only [H2, Pi.add_apply, Pi.smul_apply, smul_eq_mul]
    rw [mul_left_comm, ev_X1_mul_H]; ring
  rw [this]; exact V2.add_mem (H2_mem _) (V2.smul_mem _ (H2_mem _))

lemma mul_lin_mem (a b c d : ℂ) {v : ℂ × ℂ → ℂ} (hv : v ∈ V2) :
    (fun u : ℂ × ℂ => (a * u.1 + b * conj u.1 + c * u.2 + d * conj u.2) * v u) ∈ V2 := by
  refine V2_mul_mem _ (fun i => ?_) hv
  have : (fun u : ℂ × ℂ => (a * u.1 + b * conj u.1 + c * u.2 + d * conj u.2) * H2 i u)
      = a • (fun u : ℂ × ℂ => u.1 * H2 i u) + b • (fun u : ℂ × ℂ => conj u.1 * H2 i u)
        + c • (fun u : ℂ × ℂ => u.2 * H2 i u) + d • (fun u : ℂ × ℂ => conj u.2 * H2 i u) := by
    funext u; simp only [Pi.add_apply, Pi.smul_apply, smul_eq_mul]; ring
  rw [this]
  exact V2.add_mem (V2.add_mem (V2.add_mem (V2.smul_mem _ (mul_z1_mem i))
    (V2.smul_mem _ (mul_cz1_mem i))) (V2.smul_mem _ (mul_z2_mem i))) (V2.smul_mem _ (mul_cz2_mem i))

lemma re_eq (z : ℂ) : ((√2 * z.re : ℝ) : ℂ) = ((√2 : ℝ) : ℂ)⁻¹ * z + ((√2 : ℝ) : ℂ)⁻¹ * conj z := by
  have h2 : ((√2 : ℝ) : ℂ) ≠ 0 := by rw [Complex.ofReal_ne_zero]; positivity
  have hs : ((√2 : ℝ) : ℂ) * ((√2 : ℝ) : ℂ) = 2 := by
    rw [← Complex.ofReal_mul, Real.mul_self_sqrt (by norm_num)]; norm_num
  rw [← mul_add, Complex.add_conj]
  field_simp
  push_cast
  linear_combination (z.re : ℂ) * hs

lemma im_eq (z : ℂ) : ((√2 * z.im : ℝ) : ℂ)
    = (-Complex.I * ((√2 : ℝ) : ℂ)⁻¹) * z + (Complex.I * ((√2 : ℝ) : ℂ)⁻¹) * conj z := by
  have h2 : ((√2 : ℝ) : ℂ) ≠ 0 := by rw [Complex.ofReal_ne_zero]; positivity
  have hs : ((√2 : ℝ) : ℂ) * ((√2 : ℝ) : ℂ) = 2 := by
    rw [← Complex.ofReal_mul, Real.mul_self_sqrt (by norm_num)]; norm_num
  have : (-Complex.I * ((√2 : ℝ) : ℂ)⁻¹) * z + (Complex.I * ((√2 : ℝ) : ℂ)⁻¹) * conj z
      = -Complex.I * ((√2 : ℝ) : ℂ)⁻¹ * (z - conj z) := by ring
  rw [this, Complex.sub_conj]
  field_simp
  push_cast
  linear_combination (z.im : ℂ) * hs + (2 * (z.im : ℂ)) * Complex.I_sq

lemma mul_coord_mem (i : Fin 4) {v : ℂ × ℂ → ℂ} (hv : v ∈ V2) :
    (fun u => ((fromC2 u i : ℝ) : ℂ) * v u) ∈ V2 := by
  fin_cases i
  · have := mul_lin_mem (((√2 : ℝ) : ℂ)⁻¹) (((√2 : ℝ) : ℂ)⁻¹) 0 0 hv
    convert this using 3 with u
    simp only [fromC2, fromC, Fin.zero_eta, Matrix.cons_val_zero, re_eq]; ring
  · have := mul_lin_mem (-Complex.I * ((√2 : ℝ) : ℂ)⁻¹) (Complex.I * ((√2 : ℝ) : ℂ)⁻¹) 0 0 hv
    convert this using 3 with u
    simp only [fromC2, fromC, Fin.mk_one, Matrix.cons_val_one, Matrix.cons_val_zero, im_eq]; ring
  · have := mul_lin_mem 0 0 (((√2 : ℝ) : ℂ)⁻¹) (((√2 : ℝ) : ℂ)⁻¹) hv
    convert this using 3 with u
    simp [fromC2, fromC]
    have h := re_eq u.2; push_cast at h; linear_combination h
  · have := mul_lin_mem 0 0 (-Complex.I * ((√2 : ℝ) : ℂ)⁻¹) (Complex.I * ((√2 : ℝ) : ℂ)⁻¹) hv
    convert this using 3 with u
    simp [fromC2, fromC]
    have h := im_eq u.2; push_cast at h; linear_combination h

/-- Every real polynomial in the four real coordinates lies in the span. -/
lemma mem_V2_realPoly (P : MvPolynomial (Fin 4) ℝ) :
    (fun u => ((eval (fromC2 u) P : ℝ) : ℂ)) ∈ V2 := by
  induction P using MvPolynomial.induction_on with
  | C a =>
    have : (fun u : ℂ × ℂ => ((eval (fromC2 u) (C a) : ℝ) : ℂ)) = (a : ℂ) • H2 ((0, 0), (0, 0)) := by
      funext u; simp [H2, H_zero_zero, ev]
    rw [this]; exact V2.smul_mem _ (H2_mem _)
  | add P Q hP hQ =>
    have : (fun u => ((eval (fromC2 u) (P + Q) : ℝ) : ℂ))
        = (fun u => ((eval (fromC2 u) P : ℝ) : ℂ)) + fun u => ((eval (fromC2 u) Q : ℝ) : ℂ) := by
      funext u; simp
    rw [this]; exact V2.add_mem hP hQ
  | mul_X P i hP =>
    have : (fun u => ((eval (fromC2 u) (P * X i) : ℝ) : ℂ))
        = fun u => ((fromC2 u i : ℝ) : ℂ) * ((eval (fromC2 u) P : ℝ) : ℂ) := by
      funext u; simp [mul_comm]
    rw [this]; exact mul_coord_mem i hP

end

end Grothe.UpperChaos
