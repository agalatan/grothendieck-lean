import Grothe.LowerAnalytic.FibreIntegral
import Grothe.LowerAnalytic.GaussianRice

/-!
# The per-row Gaussian reduction in the coordinate frame (L4, assembly)

For unimodular `f, g ∈ L²(γ_{n+1})` whose first-chaos part of `h` lies along the visible coordinate
(`P₁,₀ h = t ζ₀`, `ζ₀ = z₀/√2`), the simultaneous reduction `SharedReduction rowData V̂ t Qh v` holds
with `v = vL 0`, the residual `p = Π_{H₂,₁}(c₀[k̃])` and the gate variable `X = Π_{H₂,₁} ξ`, given only
the node caps of the potentials of the rows (`sharedReduction_frame`).

**The identity tail.**  The reduction is stated for the hat value `V̂ = VhatOf (n+1) e ν f g` of a
witness with weight `e` and tail `ν` whose hat weight is the constant of the rows
(`epsHat e ν = ε`), with the potentials at the tail `ν̂ = nuHat ν` and their node caps
(`TailNodeCaps ν̂`) as the hypothesis.  The tail `−2ν̂‖k‖²` of the hat value (`VhatOf_frame`) is the
integrated tail `ν̂ (Re ∫ conj(f̃) g̃ − 1)` of the fibre bound (`fibre_integrated`), because
`Re⟪f, g⟫ − 1 = −2‖k‖²` for a unimodular pair (`re_inner_sub_one`): unimodularity is used here,
once, and not for the fibre sections.
-/

open MeasureTheory ProbabilityTheory Real Set Grothe.Lower MvPolynomial
open scoped ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

/-! ### Bounded measurable representatives -/

/-- The truncation `F` on `{|F| ≤ 1}`, `0` elsewhere. -/
def trunc {α : Type*} (F : α → ℂ) (x : α) : ℂ := if ‖F x‖ ≤ 1 then F x else 0

lemma norm_trunc_le {α : Type*} (F : α → ℂ) (x : α) : ‖trunc F x‖ ≤ 1 := by
  unfold trunc; split_ifs with h
  · exact h
  · simp

lemma measurable_trunc {α : Type*} [MeasurableSpace α] {F : α → ℂ} (hF : Measurable F) :
    Measurable (trunc F) :=
  Measurable.ite (measurableSet_le hF.norm measurable_const) hF measurable_const

lemma trunc_ae {α : Type*} [MeasurableSpace α] {μ : Measure α} {F : α → ℂ}
    (h : ∀ᵐ x ∂μ, ‖F x‖ = 1) : F =ᵐ[μ] trunc F := by
  filter_upwards [h] with x hx
  simp [trunc, hx]

/-! ### The law of a unit element of `H₂,₁` -/

theorem law_of_unit_H21 (m : ℕ) {ψ : L2G m} (hψ : ψ ∈ H21 m) (h1 : ‖ψ‖ = 1) :
    ∃ A B : MvPolynomial (Fin (m + m)) ℝ, Chaos3 A ∧ Circular (Jstd m) A B ∧
      ∫ x, eval x A ^ 2 ∂(stdGaussian (m + m)) = 1 / 2 ∧
      ⇑ψ =ᵐ[stdGaussian (m + m)] fun x => (⟨eval x A, eval x B⟩ : ℂ) := by
  obtain ⟨c, rfl⟩ := exists_wick_repr m hψ
  exact ⟨reP m c, imP m c, chaos3_reP m c, circular_reP_imP m c,
    integral_reP_sq_eq_half m c h1, repr_ae m c⟩

/-- A polynomial representative of an element of `H₂,₁` with its circular law: for every
`p ∈ H₂,₁` there is a circular cubic `(A, B)` with `E A² = 1/2` and `p = ‖p‖ (A + iB)` a.e.
(an arbitrary normalised one when `p = 0`). -/
theorem poly_rep_H21 (m : ℕ) (hm : 0 < m) {p : L2G m} (hp : p ∈ H21 m) :
    ∃ A B : MvPolynomial (Fin (m + m)) ℝ, Chaos3 A ∧ Circular (Jstd m) A B ∧
      ∫ x, eval x A ^ 2 ∂(stdGaussian (m + m)) = 1 / 2 ∧
      ⇑p =ᵐ[stdGaussian (m + m)] fun x => (‖p‖ : ℂ) * (⟨eval x A, eval x B⟩ : ℂ) := by
  rcases (norm_nonneg p).eq_or_lt with h0 | h0
  · -- `p = 0`: any normalised element, e.g. `vL 0 / √2`
    have hv := vL_mem_H21 m ⟨0, hm⟩
    have hvn : ‖vL m ⟨0, hm⟩‖ = √2 := by
      rw [← norm_vL_sq m ⟨0, hm⟩, Real.sqrt_sq (norm_nonneg _)]
    obtain ⟨A, B, hA, hc, haa, -⟩ := law_of_unit_H21 m
      (Submodule.smul_mem _ (((√2 : ℝ) : ℂ)⁻¹) hv) (by
        rw [norm_smul, hvn, norm_inv, Complex.norm_real, Real.norm_eq_abs,
          abs_of_nonneg (Real.sqrt_nonneg _), inv_mul_cancel₀ (by positivity)])
    refine ⟨A, B, hA, hc, haa, ?_⟩
    have hp0 : p = 0 := norm_eq_zero.1 h0.symm
    rw [← h0]
    filter_upwards [hp0 ▸ (Lp.coeFn_zero ℂ 2 (stdGaussian (m + m)))] with x hx
    rw [hp0] at hx ⊢
    rw [hx]; simp
  · have hne : (‖p‖ : ℂ) ≠ 0 := by exact_mod_cast h0.ne'
    obtain ⟨A, B, hA, hc, haa, hae⟩ := law_of_unit_H21 m
      (Submodule.smul_mem _ ((‖p‖ : ℂ)⁻¹) hp) (by
        rw [norm_smul, norm_inv, Complex.norm_real, Real.norm_eq_abs, abs_norm,
          inv_mul_cancel₀ h0.ne'])
    refine ⟨A, B, hA, hc, haa, ?_⟩
    filter_upwards [hae, Lp.coeFn_smul ((‖p‖ : ℂ)⁻¹) p] with x h1 h2
    rw [← h1, h2, Pi.smul_apply, smul_eq_mul, ← mul_assoc, mul_inv_cancel₀ hne, one_mul]

/-! ### One row -/

section onerow

variable {n : ℕ} {ft gt : (Fin ((n + 1) + (n + 1)) → ℝ) → ℂ} (hfm : Measurable ft)
  (hgm : Measurable gt) (hfb : ∀ x, ‖ft x‖ ≤ 1) (hgb : ∀ x, ‖gt x‖ ≤ 1)

/-- The residual `p = Π_{H₂,₁} c₀[k̃]`. -/
abbrev pres : L2G n := (H21 n).starProjection (cK hfm hgm hfb hgb 0)
/-- The gate coordinates `X₂ = Π_{H₂,₁} c₁`, `X₃ = Π_{H₂,₁} conj c₂`. -/
abbrev X2e : L2G n := (H21 n).starProjection (cK hfm hgm hfb hgb 1)
abbrev X3e : L2G n := (H21 n).starProjection (conjL (cK hfm hgm hfb hgb 2))

lemma pres_mem : pres hfm hgm hfb hgb ∈ H21 n :=
  (H21 n).starProjection_apply_mem _

lemma inner_pres_proj (w : L2G n) :
    inner ℂ (pres hfm hgm hfb hgb) w = inner ℂ (pres hfm hgm hfb hgb) ((H21 n).starProjection w) := by
  rw [← Submodule.inner_starProjection_left_eq_right,
    Submodule.starProjection_eq_self_iff.2 (pres_mem hfm hgm hfb hgb)]

/-- The integral of the gate expression of a row. -/
lemma integral_gate (r : Row) (p x2 x3 : L2G n) {P : (Fin (n + n) → ℝ) → ℂ}
    (hP : ⇑p =ᵐ[stdGaussian (n + n)] P) :
    Integrable (fun y => r.gate (P y) (x2 y) (x3 y)) (stdGaussian (n + n)) ∧
    ∫ y, r.gate (P y) (x2 y) (x3 y) ∂(stdGaussian (n + n))
      = formH3 r.E p x2 x3 - (ε - r.delta) * ‖p‖ ^ 2
        + 2 * r.delta * (r.b1 * (inner ℂ p p).re + r.b2 * (inner ℂ p x2).re
          + r.b3 * (inner ℂ p x3).re) := by
  have hpt : ∀ᵐ y ∂(stdGaussian (n + n)), r.gate (P y) (x2 y) (x3 y)
      = r.E.form (p y) (x2 y) (x3 y) + (-(ε - r.delta : ℝ)) * hre (p y) (p y)
        + 2 * r.delta * (r.b1 * hre (p y) (p y) + r.b2 * hre (p y) (x2 y) + r.b3 * hre (p y) (x3 y)) := by
    filter_upwards [hP] with y hy
    rw [Row.gate_eq, ← hy]
    simp only [hre, Complex.sq_norm, Complex.normSq_apply, Complex.mul_re, Complex.add_re, Complex.mul_im, Complex.add_im, Complex.ratCast_re,
      Complex.ratCast_im, Complex.conj_re, Complex.conj_im]
    ring
  have i3 := integrable_form3 r.E p x2 x3
  have ipp := integrable_hre p p
  have ip2 := integrable_hre p x2
  have ip3 := integrable_hre p x3
  have iS : Integrable (fun y => r.E.form (p y) (x2 y) (x3 y) + (-(ε - r.delta : ℝ)) * hre (p y) (p y)
      + 2 * r.delta * (r.b1 * hre (p y) (p y) + r.b2 * hre (p y) (x2 y) + r.b3 * hre (p y) (x3 y)))
      (stdGaussian (n + n)) :=
    (i3.add (ipp.const_mul _)).add
      ((((ipp.const_mul _).add (ip2.const_mul _)).add (ip3.const_mul _)).const_mul _)
  refine ⟨iS.congr (hpt.mono fun y hy => hy.symm), ?_⟩
  rw [integral_congr_ae hpt]
  have j1 : Integrable (fun y => r.E.form (p y) (x2 y) (x3 y) + (-(ε - r.delta : ℝ)) * hre (p y) (p y))
      (stdGaussian (n + n)) := i3.add (ipp.const_mul _)
  have j2 : Integrable (fun y => (r.b1 : ℝ) * hre (p y) (p y) + r.b2 * hre (p y) (x2 y))
      (stdGaussian (n + n)) := (ipp.const_mul _).add (ip2.const_mul _)
  have j3 : Integrable (fun y => (r.b1 : ℝ) * hre (p y) (p y) + r.b2 * hre (p y) (x2 y)
      + r.b3 * hre (p y) (x3 y)) (stdGaussian (n + n)) := j2.add (ip3.const_mul _)
  rw [integral_add j1 (j3.const_mul _), integral_add i3 (ipp.const_mul _), integral_const_mul,
    integral_const_mul, integral_add j2 (ip3.const_mul _), integral_add (ipp.const_mul _) (ip2.const_mul _),
    integral_const_mul, integral_const_mul, integral_const_mul, ← formH3_eq_integral,
    ← re_inner_eq_integral, ← re_inner_eq_integral, ← re_inner_eq_integral, re_inner_self]
  ring

end onerow

/-! ### The row inequality in the coordinate frame -/

section frame

variable {n : ℕ} {ft gt : (Fin ((n + 1) + (n + 1)) → ℝ) → ℂ} (hfm : Measurable ft)
  (hgm : Measurable gt) (hfb : ∀ x, ‖ft x‖ ≤ 1) (hgb : ∀ x, ‖gt x‖ ≤ 1)

lemma hOf_ae (f g : L2G (n + 1)) (hfa : ⇑f =ᵐ[stdGaussian ((n + 1) + (n + 1))] ft)
    (hga : ⇑g =ᵐ[stdGaussian ((n + 1) + (n + 1))] gt) :
    ⇑(hOf (n + 1) f g) =ᵐ[stdGaussian ((n + 1) + (n + 1))] fun x => (ft x + gt x) / 2 := by
  filter_upwards [Lp.coeFn_smul ((2 : ℂ)⁻¹) (f + g), Lp.coeFn_add f g, hfa, hga] with x h1 h2 h3 h4
  rw [hOf, h1, Pi.smul_apply, h2, Pi.add_apply, h3, h4, smul_eq_mul]; ring

lemma kOf_ae (f g : L2G (n + 1)) (hfa : ⇑f =ᵐ[stdGaussian ((n + 1) + (n + 1))] ft)
    (hga : ⇑g =ᵐ[stdGaussian ((n + 1) + (n + 1))] gt) :
    ⇑(kOf (n + 1) f g) =ᵐ[stdGaussian ((n + 1) + (n + 1))] fun x => (ft x - gt x) / 2 := by
  filter_upwards [Lp.coeFn_smul ((2 : ℂ)⁻¹) (f - g), Lp.coeFn_sub f g, hfa, hga] with x h1 h2 h3 h4
  rw [kOf, h1, Pi.smul_apply, h2, Pi.sub_apply, h3, h4, smul_eq_mul]; ring

include hfm hgm hfb hgb in
/-- **The row inequality of the shared reduction, in the coordinate frame**, for the hat value of
a witness with weight `e` and tail `ν` whose hat weight is the constant `ε` of the rows, with the
potential of the row at the tail `ν̂ = nuHat ν`.  The tail `−2ν̂‖k‖²` of the hat value is the
integrated tail of the fibre bound, by `re_inner_sub_one` for the unimodular pair `f, g`. -/
theorem rowSharedWith_frame (r : Row) (R : Sym2) (hE : r.E.psdOK = true)
    (hE1 : (r.E.subDiag (-1) ε ε).psdOK = true) (hR : R.psdOK = true)
    (hR1 : (R.subDiag (-1) ε).psdOK = true) (hR2 : (R.subDiag ε 0).psdOK = true)
    {e ν : ℝ} (he : epsHat e ν = ε)
    (hcaps : CapsHold (fun s => pot r.E R r.ell r.beta (aFib r.b1 r.b2 r.b3) (nuHat ν) s - capPad)
      r.nodeList r.smax)
    (hδ : (0 : ℝ) ≤ r.delta)
    (f g : L2G (n + 1)) (hf : f ∈ Unimod (stdGaussian ((n + 1) + (n + 1))))
    (hg : g ∈ Unimod (stdGaussian ((n + 1) + (n + 1))))
    (hfa : ⇑f =ᵐ[stdGaussian ((n + 1) + (n + 1))] ft)
    (hga : ⇑g =ᵐ[stdGaussian ((n + 1) + (n + 1))] gt)
    (hP : (H10 (n + 1)).starProjection (hOf (n + 1) f g) = ((tOf (n + 1) f g : ℝ) : ℂ) • zeta0 n)
    (X1 : (Fin (n + n) → ℝ) → ℂ) (hX1 : ⇑(pres hfm hgm hfb hgb) =ᵐ[stdGaussian (n + n)] X1)
    (U : (Fin (n + n) → ℝ) → ℝ) (hU : ∀ y, ‖X1 y‖ ^ 2 = ‖pres hfm hgm hfb hgb‖ ^ 2 * U y)
    (_hU0 : ∀ y, 0 ≤ U y) :
    RowSharedWith r (pot r.E R r.ell r.beta (aFib r.b1 r.b2 r.b3) (nuHat ν)) (stdGaussian (n + n))
      U X1 ⇑(X2e hfm hgm hfb hgb) ⇑(X3e hfm hgm hfb hgb) ‖pres hfm hgm hfb hgb‖
      (VhatOf (n + 1) e ν f g) (tOf (n + 1) f g) (QhOf (n + 1) f g) (vL (n + 1) 0) := by
  set p := pres hfm hgm hfb hgb with hpdef
  set τ := ‖p‖ with hτ
  set Ψ := pot r.E R r.ell r.beta (aFib r.b1 r.b2 r.b3) (nuHat ν) with hΨ
  -- `τ √U = |X₁|`
  have hsq : ∀ y, τ * √(U y) = ‖X1 y‖ := fun y => by
    rw [← Real.sqrt_sq (norm_nonneg (X1 y)), hU, Real.sqrt_mul (sq_nonneg _), Real.sqrt_sq (norm_nonneg _)]
  set Qe : L2G n := ((r.delta : ℝ) : ℂ) • p with hQe
  have hQae : ∀ᵐ y ∂(stdGaussian (n + n)), Ψ (r.delta * τ * √(U y)) = Ψ ‖Qe y‖ := by
    filter_upwards [Lp.coeFn_smul (((r.delta : ℝ) : ℂ)) p, hX1] with y h1 h2
    rw [h1, Pi.smul_apply, smul_eq_mul, norm_mul, Complex.norm_real, Real.norm_eq_abs,
      abs_of_nonneg hδ, h2, mul_assoc, hsq]
  have iQ : Integrable (fun y => Ψ ‖Qe y‖) (stdGaussian (n + n)) := by
    simpa using integrable_pot_comp (E := r.E) (R := R) (ℓ := r.ell) (β := r.beta)
      (a := aFib r.b1 r.b2 r.b3) (ν := nuHat ν) hE hR (Lp.memLp Qe).aestronglyMeasurable
      ((Lp.memLp Qe).integrable one_le_two).norm 1 zero_le_one
  obtain ⟨igate, hgate⟩ := integral_gate r p (X2e hfm hgm hfb hgb) (X3e hfm hgm hfb hgb) hX1
  refine ⟨hcaps, iQ.congr (hQae.mono fun y hy => hy.symm), igate, ?_⟩
  rw [integral_congr_ae hQae, hgate]
  -- the three ingredients
  have hV := VhatOf_frame (n + 1) f g he r.ell r.beta (zeta0 n) (vL (n + 1) 0) zeta0_mem
    norm_zeta0 hP (vL_mem_H21 (n + 1) 0) (norm_vL_sq (n + 1) 0)
  have hL := inner_L_split r.ell r.beta (hOf (n + 1) f g) (hOf_ae f g hfa hga)
  have hFib := fibre_integrated r.E R r.ell r.beta r.b1 r.b2 r.b3 (nuHat ν) hfm hgm hfb hgb hE hR Qe
  -- the tail of the fibre bound is the tail of the hat value
  have hT : nuHat ν * ((∫ x, conj (ft x) * gt x ∂(stdGaussian ((n + 1) + (n + 1)))).re - 1)
      = -(2 * nuHat ν * ‖kOf (n + 1) f g‖ ^ 2) := by
    have hi : ∫ x, conj (ft x) * gt x ∂(stdGaussian ((n + 1) + (n + 1))) = inner ℂ f g := by
      rw [inner_L2]
      exact integral_congr_ae (by filter_upwards [hfa, hga] with x h1 h2; rw [h1, h2])
    rw [hi, re_inner_sub_one (n + 1) hf hg]
    ring
  rw [hT] at hFib
  have hK := kside r.E R hE hE1 hR hR1 hR2 (measurable_kt hfm hgm) (norm_kt_le hfb hgb)
    (kOf (n + 1) f g) (kOf_ae f g hfa hga)
  -- the coupling term
  have hc : (inner ℂ Qe (aXi r.b1 r.b2 r.b3 hfm hgm hfb hgb)).re
      = r.delta * ((1 + r.b1) * ‖p‖ ^ 2 + r.b2 * (inner ℂ p (X2e hfm hgm hfb hgb)).re
        + r.b3 * (inner ℂ p (X3e hfm hgm hfb hgb)).re) := by
    rw [hQe, aXi, inner_smul_left, Complex.conj_ofReal, inner_add_right, inner_add_right,
      inner_smul_right, inner_smul_right, inner_smul_right, inner_pres_proj hfm hgm hfb hgb (cK _ _ _ _ 0),
      inner_pres_proj hfm hgm hfb hgb (cK _ _ _ _ 1),
      inner_pres_proj hfm hgm hfb hgb (conjL (cK _ _ _ _ 2))]
    simp only [Complex.re_ofReal_mul, Complex.add_re]
    rw [← hpdef, re_inner_self]
  have hLs : (inner ℂ (((r.ell : ℝ) : ℂ) • zeta0 n + ((r.beta : ℝ) : ℂ) • vL (n + 1) 0)
      (hOf (n + 1) f g)).re = (∫ y, Lsec r.ell r.beta (ft := ft) (gt := gt) y ∂(stdGaussian (n + n))).re := by
    rw [hL]; rfl
  simp only [QkOf, PkOf] at hV
  rw [re_inner_self]
  rw [hc] at hFib
  push_cast at hV hFib hK hLs ⊢
  nlinarith [hV, hFib, hK, hLs]

end frame

/-! ### The shared reduction in the coordinate frame -/

/-- The physical remote scale in the aligned first-chaos frame obeys the Rice energy budget. -/
theorem PhysicalRice.pres_sq_le_priced (k : ℝ) {n : ℕ} {ft gt : (Fin ((n + 1) + (n + 1)) → ℝ) → ℂ}
    (hfm : Measurable ft) (hgm : Measurable gt)
    (hfb : ∀ x, ‖ft x‖ ≤ 1) (hgb : ∀ x, ‖gt x‖ ≤ 1) (f g : L2G (n+1))
    (hfa : ⇑f =ᵐ[stdGaussian ((n+1)+(n+1))] ft) (hga : ⇑g =ᵐ[stdGaussian ((n+1)+(n+1))] gt)
    (hP : (H10 (n+1)).starProjection (hOf (n+1) f g) = ((tOf (n+1) f g : ℝ) : ℂ) • zeta0 n) :
    ‖pres hfm hgm hfb hgb‖^2 ≤ 2*((√π/2)*PhysicalRice.riceSlope k)*((√π/2)*PhysicalRice.riceIntercept k - tOf (n+1) f g) := by
  let M := (√π/2)*PhysicalRice.riceSlope k
  let A := (√π/2)*PhysicalRice.riceIntercept k
  let c := cK hfm hgm hfb hgb 0
  have hi : Integrable (fun y ↦ ‖c y‖^2) (stdGaussian (n+n)) :=
    (Lp.memLp c).integrable_norm_pow two_ne_zero
  let W := Lsec 1 0 (ft := ft) (gt := gt)
  have hW : Integrable W (stdGaussian (n+n)) := integrable_Lsec 1 0 hfm hgm hfb hgb
  have hpt : ∀ᵐ y ∂stdGaussian (n+n), ‖c y‖^2 ≤ 2*M*(A -(W y).re) := by
    filter_upwards [cfL_ae (measurable_kt hfm hgm) (norm_kt_le hfb hgb) 0] with y hy
    change ‖(cK hfm hgm hfb hgb 0) y‖^2 ≤ _
    rw [cK,hy]
    simpa [cf,fibreB,W,Lsec,Lf,M,A] using PhysicalRice.fibre_mean_energy_priced k
      (hfm.comp (measurable_joinR_left y)).aestronglyMeasurable
      (hgm.comp (measurable_joinR_left y)).aestronglyMeasurable
      (fun z ↦ hfb (joinR z y)) (fun z ↦ hgb (joinR z y))
  have hiW := ((integrable_const A).sub hW.re).const_mul (2*M)
  have h := integral_mono_ae hi hiW hpt
  change (∫ y, ‖c y‖^2 ∂stdGaussian (n+n)) ≤ ∫ y, 2*M*(A-(W y).re) ∂stdGaussian (n+n) at h
  have hWre : Integrable (fun y ↦ (W y).re) (stdGaussian (n+n)) := hW.re
  have hWint : (∫ y, (W y).re ∂stdGaussian (n+n)) = (∫ y, W y ∂stdGaussian (n+n)).re := _root_.integral_re hW
  rw [integral_const_mul,integral_sub (f := fun _ ↦ A) (g := fun y ↦ (W y).re) (integrable_const _) hWre,integral_const,probReal_univ,
     one_smul,← norm_sq_eq_integral, hWint] at h
  have he := inner_L_split 1 0 (hOf (n+1) f g) (hOf_ae f g hfa hga)
  change _ = ∫ y, W y ∂stdGaussian (n+n) at he
  simp only [Complex.ofReal_one,Complex.ofReal_zero,one_smul,zero_smul,add_zero] at he
  have hz : (H10 (n+1)).starProjection (zeta0 n) = zeta0 n :=
    Submodule.starProjection_eq_self_iff.mpr zeta0_mem
  have hpair : (inner ℂ (zeta0 n) (hOf (n+1) f g)).re = tOf (n+1) f g := by
    rw [← hz,Submodule.inner_starProjection_left_eq_right,hP,inner_smul_right,inner_self_eq_norm_sq_to_K,
      norm_zeta0]; simp
  rw [← he,hpair] at h
  have hpr : ‖pres hfm hgm hfb hgb‖ ≤ ‖c‖ :=
    (H21 n).norm_starProjection_apply_le c
  exact (pow_le_pow_left₀ (norm_nonneg _) hpr 2).trans h


/-- The physical remote scale in the aligned first-chaos frame obeys the Rice energy budget. -/
theorem PhysicalRice.pres_sq_le {n : ℕ} {ft gt : (Fin ((n + 1) + (n + 1)) → ℝ) → ℂ}
    (hfm : Measurable ft) (hgm : Measurable gt)
    (hfb : ∀ x, ‖ft x‖ ≤ 1) (hgb : ∀ x, ‖gt x‖ ≤ 1) (f g : L2G (n+1))
    (hfa : ⇑f =ᵐ[stdGaussian ((n+1)+(n+1))] ft) (hga : ⇑g =ᵐ[stdGaussian ((n+1)+(n+1))] gt)
    (hP : (H10 (n+1)).starProjection (hOf (n+1) f g) = ((tOf (n+1) f g : ℝ) : ℂ) • zeta0 n) :
    ‖pres hfm hgm hfb hgb‖^2 ≤ 2*(√π/2)*(√π/2 - tOf (n+1) f g) := by
  simpa [PhysicalRice.riceIntercept,PhysicalRice.riceSlope] using
    PhysicalRice.pres_sq_le_priced 0 hfm hgm hfb hgb f g hfa hga hP

lemma rowData_delta_pos : rowData.all (fun r => decide (0 < r.delta)) = true := by decide +kernel

section shared

variable {n : ℕ} {ft gt : (Fin ((n + 1) + (n + 1)) → ℝ) → ℂ} (hfm : Measurable ft)
  (hgm : Measurable gt) (hfb : ∀ x, ‖ft x‖ ≤ 1) (hgb : ∀ x, ‖gt x‖ ≤ 1)

lemma cbound_zero : cbound 0 = 1 := by
  simp [cbound, fibreB]

include hfm hgm hfb hgb in
/-- **`τ = ‖p‖ ≤ ρ`**, from `‖p‖² = ⟪c₀, p⟫ ≤ E|p|` (`|c₀| ≤ 1`) and the first-moment bound. -/
theorem norm_pres_le_rho : ‖pres hfm hgm hfb hgb‖ ≤ ρ := by
  refine norm_starProjection_H21_le_rho n ?_
  filter_upwards [cfL_ae (measurable_kt hfm hgm) (norm_kt_le hfb hgb) 0] with y hy
  rw [cK, hy, ← cbound_zero]
  exact norm_cf_le (norm_kt_le hfb hgb) 0 y

include hfm hgm hfb hgb in
/-- **Certified sharp scale bound `τ = ‖p‖ ≤ 93/100`**, from `‖p‖² = ⟪c₀, p⟫ ≤ E|p|` (`|c₀| ≤ 1`)
and the certified cubic radius bound `norm_starProjection_H21_le_93`. -/
theorem norm_pres_le_93 : ‖pres hfm hgm hfb hgb‖ ≤ 93 / 100 := by
  refine norm_starProjection_H21_le_93 n ?_
  filter_upwards [cfL_ae (measurable_kt hfm hgm) (norm_kt_le hfb hgb) 0] with y hy
  rw [cK, hy, ← cbound_zero]
  exact norm_cf_le (norm_kt_le hfb hgb) 0 y

end shared

/-- **The node caps of the potentials of the rows with an identity tail `ν`** (in hat units): at
every stored node `(s, c)` of every row, `Ψ_ν(s) − capPad ≤ c` for the fibre potential of the row
with the tail `ν`.  This is the hypothesis of the reduction with a tail. -/
def TailNodeCaps (ν : ℝ) : Prop :=
  ∀ k, k < rowData.length → ∀ m ∈ (rowData.getD k row01).nodeList,
    pot (rowData.getD k row01).E (rowR k) (rowData.getD k row01).ell (rowData.getD k row01).beta
      (aFib (rowData.getD k row01).b1 (rowData.getD k row01).b2 (rowData.getD k row01).b3) ν m.1
        - capPad ≤ m.2

/-- **The simultaneous Gaussian reduction of the rows in the coordinate frame**: for unimodular
`f, g` on `ℂ^{n+1}` (`n ≥ 1`) with `P₁,₀ h = t ζ₀`, `SharedReduction rowData V̂ t Qh v` holds with the
coupling vector `v = vL 0`, for the hat value `V̂` of a witness with weight `e` and tail `ν` whose
hat weight is the constant `ε` of the rows, given the node caps of the potentials of the rows with
the tail `ν̂ = nuHat ν`. -/
theorem sharedReduction_frame {n : ℕ} (hn : 0 < n) {e ν : ℝ} (he : epsHat e ν = ε)
    (f g : L2G (n + 1))
    (hf : f ∈ Unimod (stdGaussian ((n + 1) + (n + 1))))
    (hg : g ∈ Unimod (stdGaussian ((n + 1) + (n + 1))))
    (hP : (H10 (n + 1)).starProjection (hOf (n + 1) f g) = ((tOf (n + 1) f g : ℝ) : ℂ) • zeta0 n)
    (hcaps : TailNodeCaps (nuHat ν)) :
    SharedReduction rowData (VhatOf (n + 1) e ν f g) (tOf (n + 1) f g) (QhOf (n + 1) f g)
      (vL (n + 1) 0) := by
  have hfm : Measurable (trunc ⇑f) := measurable_trunc (Lp.stronglyMeasurable f).measurable
  have hgm : Measurable (trunc ⇑g) := measurable_trunc (Lp.stronglyMeasurable g).measurable
  have hfb := norm_trunc_le ⇑f
  have hgb := norm_trunc_le ⇑g
  have hfa : ⇑f =ᵐ[stdGaussian ((n + 1) + (n + 1))] trunc ⇑f := trunc_ae hf
  have hga : ⇑g =ᵐ[stdGaussian ((n + 1) + (n + 1))] trunc ⇑g := trunc_ae hg
  set p := pres hfm hgm hfb hgb with hp
  obtain ⟨A, B, hA, hc, haa, hpA⟩ := poly_rep_H21 n hn (pres_mem hfm hgm hfb hgb)
  set X1 : (Fin (n + n) → ℝ) → ℂ := fun y => (‖p‖ : ℂ) * (⟨eval y A, eval y B⟩ : ℂ) with hX1def
  have hX : ∀ y, ‖X1 y‖ ^ 2 = ‖p‖ ^ 2 * eval y (radU A B) := fun y => by
    rw [hX1def, norm_mul, mul_pow, Complex.norm_real, Real.norm_eq_abs, sq_abs, Complex.sq_norm,
      Complex.normSq_mk, radU]
    simp only [map_add, map_mul]
  refine sharedReduction_of_gaussian rowData _ _ _ _ A B hA haa hc X1 ⇑(X2e hfm hgm hfb hgb)
    ⇑(X3e hfm hgm hfb hgb) ‖p‖ (norm_nonneg _) (norm_pres_le_rho hfm hgm hfb hgb) hX ?_
  intro r hr
  obtain ⟨k, hk, rfl⟩ := List.mem_iff_getElem.1 hr
  have hkr : rowData.getD k row01 = rowData[k] := List.getD_eq_getElem _ _ hk
  have hg' := List.all_eq_true.1 rowData_gatesOK _ hr
  simp only [rowGatesOK, Bool.and_eq_true] at hg'
  have hlen := rowGates_consistent.1
  have hk' : k < rowGates.length := hlen ▸ hk
  have hRg := List.all_eq_true.1 rowGates_ok _ (List.getElem_mem hk')
  simp only [Bool.and_eq_true] at hRg
  have hRk : rowR k = (rowGates[k]).2.2.2 := by unfold rowR; rw [List.getD_eq_getElem _ _ hk']
  have hδ := List.all_eq_true.1 rowData_delta_pos _ hr
  simp only [decide_eq_true_eq] at hδ
  have hcaps' := capsHold_rowPot (nuHat ν) k hk (hcaps k hk)
  rw [hkr] at hcaps'
  exact ⟨_, rowSharedWith_frame hfm hgm hfb hgb (rowData[k]) (rowR k) hg'.1.1 hg'.1.2
    (hRk ▸ hRg.1.1) (hRk ▸ hRg.1.2) (hRk ▸ hRg.2) he hcaps' (by exact_mod_cast hδ.le) f g hf hg hfa
    hga hP X1 hpA (fun y => eval y (radU A B)) hX (fun y => eval_radU_nonneg A B y)⟩

/-- Simultaneous Gaussian reduction exposing the normalized circular cubic `(A, B)` of the residual,
the certified sharp scale bound `τ ≤ 93/100`, and integrability of each row potential at every
nonnegative scale `σ'`. -/
def CircularSharedReduction {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (rows : List Row) (V t : ℝ) (Qh v : E) (scaleOK : ℝ → Prop := fun τ ↦ τ ≤ ρ) : Prop :=
  ∃ (d : ℕ) (J : Fin d → Fin d → ℝ) (A B : MvPolynomial (Fin d) ℝ)
    (X1 X2 X3 : (Fin d → ℝ) → ℂ) (τ x : ℝ),
    Chaos3 A ∧ ∫ y, eval y A ^ 2 ∂(stdGaussian d) = 1 / 2 ∧ Circular J A B ∧
    Moments (stdGaussian d) (fun y => eval y (radU A B)) x ∧
    GramInputs (stdGaussian d) (fun y => eval y (radU A B)) ∧
    0 ≤ τ ∧ τ ≤ 93 / 100 ∧ scaleOK τ ∧
    (∀ y, ‖X1 y‖ ^ 2 = τ ^ 2 * eval y (radU A B)) ∧
    ∀ r ∈ rows, ∃ Ψ : ℝ → ℝ,
      RowSharedWith r Ψ (stdGaussian d) (fun y => eval y (radU A B)) X1 X2 X3 τ V t Qh v ∧
      ∀ σ' : ℝ, 0 ≤ σ' → Integrable (fun y => Ψ (σ' * √(eval y (radU A B)))) (stdGaussian d)

/-- The physical joint scale and visible amplitude in the selected frame. -/
def physicalScale (t τ : ℝ) : Prop :=
  τ ≤ ρ ∧ ∀ k : ℝ, τ^2 ≤ 2*((√π/2)*PhysicalRice.riceSlope k)*((√π/2)*PhysicalRice.riceIntercept k-t)

theorem physicalScale.quadratic {t τ : ℝ} (h : physicalScale t τ) :
    τ^2 ≤ 2*(√π/2)*(√π/2-t) := by
  simpa [PhysicalRice.riceIntercept,PhysicalRice.riceSlope] using h.2 0

lemma CircularSharedReduction.weaken {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {rows : List Row} {V t : ℝ} {Qh v : E} {P Q : ℝ → Prop}
    (h : CircularSharedReduction rows V t Qh v P) (hpq : ∀ τ, P τ → Q τ) :
    CircularSharedReduction rows V t Qh v Q := by
  obtain ⟨d,J,A,B,X1,X2,X3,τ,x,hA,haa,hc,hM,hG,h0,h93,hP,hX,hrows⟩ := h
  exact ⟨d,J,A,B,X1,X2,X3,τ,x,hA,haa,hc,hM,hG,h0,h93,hpq τ hP,hX,hrows⟩

lemma circularSharedReduction_congr {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {rows : List Row} {V t : ℝ} {Qh₁ v₁ Qh₂ v₂ : E} {scaleOK : ℝ → Prop}
    (h : CircularSharedReduction rows V t Qh₁ v₁ scaleOK)
    (hn : ∀ c : ℝ, ‖Qh₁ + c • v₁‖ = ‖Qh₂ + c • v₂‖) :
    CircularSharedReduction rows V t Qh₂ v₂ scaleOK := by
  obtain ⟨d, J, A, B, X1, X2, X3, τ, x, hA, haa, hc, hM, hG, h0, h93, hρ, hX, hrows⟩ := h
  refine ⟨d, J, A, B, X1, X2, X3, τ, x, hA, haa, hc, hM, hG, h0, h93, hρ, hX, fun r hr => ?_⟩
  obtain ⟨Ψ, ⟨hcap, hi, hg, hV⟩, hInt⟩ := hrows r hr
  exact ⟨Ψ, ⟨hcap, hi, hg, by rw [← hn]; exact hV⟩, hInt⟩

/-- **The simultaneous circular Gaussian reduction in the coordinate frame**, sharpening
`sharedReduction_frame` with the certified cubic radius bound `‖p‖ ≤ 93/100` and exposing the
circular cubic law `(A, B)` so tightened rows can invoke antiholomorphic Stein certificates. -/
theorem circularSharedReduction_frame_rice {n : ℕ} (hn : 0 < n) {e ν : ℝ} (he : epsHat e ν = ε)
    (f g : L2G (n + 1))
    (hf : f ∈ Unimod (stdGaussian ((n + 1) + (n + 1))))
    (hg : g ∈ Unimod (stdGaussian ((n + 1) + (n + 1))))
    (hP : (H10 (n + 1)).starProjection (hOf (n + 1) f g) = ((tOf (n + 1) f g : ℝ) : ℂ) • zeta0 n)
    (hcaps : TailNodeCaps (nuHat ν)) :
    CircularSharedReduction rowData (VhatOf (n + 1) e ν f g) (tOf (n + 1) f g) (QhOf (n + 1) f g)
      (vL (n + 1) 0) (physicalScale (tOf (n+1) f g)) := by
  have hfm : Measurable (trunc ⇑f) := measurable_trunc (Lp.stronglyMeasurable f).measurable
  have hgm : Measurable (trunc ⇑g) := measurable_trunc (Lp.stronglyMeasurable g).measurable
  have hfb := norm_trunc_le ⇑f
  have hgb := norm_trunc_le ⇑g
  have hfa : ⇑f =ᵐ[stdGaussian ((n + 1) + (n + 1))] trunc ⇑f := trunc_ae hf
  have hga : ⇑g =ᵐ[stdGaussian ((n + 1) + (n + 1))] trunc ⇑g := trunc_ae hg
  set p := pres hfm hgm hfb hgb with hp
  obtain ⟨A, B, hA, hc, haa, hpA⟩ := poly_rep_H21 n hn (pres_mem hfm hgm hfb hgb)
  set X1 : (Fin (n + n) → ℝ) → ℂ := fun y => (‖p‖ : ℂ) * (⟨eval y A, eval y B⟩ : ℂ) with hX1def
  have hX : ∀ y, ‖X1 y‖ ^ 2 = ‖p‖ ^ 2 * eval y (radU A B) := fun y => by
    rw [hX1def, norm_mul, mul_pow, Complex.norm_real, Real.norm_eq_abs, sq_abs, Complex.sq_norm,
      Complex.normSq_mk, radU]
    simp only [map_add, map_mul]
  have hP_norm : ∀ y, ‖(⟨eval y A, eval y B⟩ : ℂ)‖ = √(eval y (radU A B)) := fun y => by
    rw [← Real.sqrt_sq (norm_nonneg _), Complex.sq_norm, Complex.normSq_mk, radU]
    simp only [map_add, map_mul]
  have hP_meas : AEStronglyMeasurable (fun y : Fin (n + n) → ℝ => (⟨eval y A, eval y B⟩ : ℂ))
      (stdGaussian (n + n)) := by
    have heq : (fun y : Fin (n + n) → ℝ => (⟨eval y A, eval y B⟩ : ℂ))
        = fun y : Fin (n + n) → ℝ => ((eval y A : ℝ) : ℂ) + ((eval y B : ℝ) : ℂ) * Complex.I := by
      funext y; apply Complex.ext <;> simp
    rw [heq]
    exact (Complex.continuous_ofReal.comp_aestronglyMeasurable (integrable_eval A).aestronglyMeasurable).add
      ((Complex.continuous_ofReal.comp_aestronglyMeasurable (integrable_eval B).aestronglyMeasurable).mul_const _)
  have hP_int : Integrable (fun y : Fin (n + n) → ℝ => ‖(⟨eval y A, eval y B⟩ : ℂ)‖)
      (stdGaussian (n + n)) := by
    simp_rw [hP_norm]
    exact integrable_sqrt (eval_radU_nonneg A B) (integrable_eval _)
  refine ⟨n + n, Jstd n, A, B, X1, ⇑(X2e hfm hgm hfb hgb), ⇑(X3e hfm hgm hfb hgb), ‖p‖, _,
    hA, haa, hc, gaussian_moments A B hA haa hc, gaussian_gramInputs A B hA haa hc,
    norm_nonneg _, norm_pres_le_93 hfm hgm hfb hgb, ⟨norm_pres_le_rho hfm hgm hfb hgb, fun k ↦ PhysicalRice.pres_sq_le_priced k hfm hgm hfb hgb f g hfa hga hP⟩, hX, ?_⟩
  intro r hr
  obtain ⟨k, hk, rfl⟩ := List.mem_iff_getElem.1 hr
  have hkr : rowData.getD k row01 = rowData[k] := List.getD_eq_getElem _ _ hk
  have hg' := List.all_eq_true.1 rowData_gatesOK _ hr
  simp only [rowGatesOK, Bool.and_eq_true] at hg'
  have hlen := rowGates_consistent.1
  have hk' : k < rowGates.length := hlen ▸ hk
  have hRg := List.all_eq_true.1 rowGates_ok _ (List.getElem_mem hk')
  simp only [Bool.and_eq_true] at hRg
  have hRk : rowR k = (rowGates[k]).2.2.2 := by unfold rowR; rw [List.getD_eq_getElem _ _ hk']
  have hδ := List.all_eq_true.1 rowData_delta_pos _ hr
  simp only [decide_eq_true_eq] at hδ
  have hcaps' := capsHold_rowPot (nuHat ν) k hk (hcaps k hk)
  rw [hkr] at hcaps'
  refine ⟨_, rowSharedWith_frame hfm hgm hfb hgb (rowData[k]) (rowR k) hg'.1.1 hg'.1.2
    (hRk ▸ hRg.1.1) (hRk ▸ hRg.1.2) (hRk ▸ hRg.2) he hcaps' (by exact_mod_cast hδ.le) f g hf hg hfa
    hga hP X1 hpA (fun y => eval y (radU A B)) hX (fun y => eval_radU_nonneg A B y), ?_⟩
  intro σ' hσ'
  have hi := integrable_pot_comp (E := (rowData[k]).E) (R := rowR k) (ℓ := (rowData[k]).ell)
    (β := (rowData[k]).beta) (a := aFib (rowData[k]).b1 (rowData[k]).b2 (rowData[k]).b3)
    (ν := nuHat ν) hg'.1.1 (hRk ▸ hRg.1.1) hP_meas hP_int σ' hσ'
  simpa only [hP_norm] using hi

/-- The uniform-radius coordinate-frame interface. -/
theorem circularSharedReduction_frame {n : ℕ} (hn : 0 < n) {e ν : ℝ} (he : epsHat e ν = ε)
    (f g : L2G (n + 1))
    (hf : f ∈ Unimod (stdGaussian ((n + 1) + (n + 1))))
    (hg : g ∈ Unimod (stdGaussian ((n + 1) + (n + 1))))
    (hP : (H10 (n + 1)).starProjection (hOf (n + 1) f g) = ((tOf (n + 1) f g : ℝ) : ℂ) • zeta0 n)
    (hcaps : TailNodeCaps (nuHat ν)) :
    CircularSharedReduction rowData (VhatOf (n + 1) e ν f g) (tOf (n + 1) f g) (QhOf (n + 1) f g)
      (vL (n + 1) 0) :=
  (circularSharedReduction_frame_rice hn he f g hf hg hP hcaps).weaken fun _ h ↦ h.1

end

end Grothe.LowerAnalytic
