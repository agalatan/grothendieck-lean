import Grothe.LowerAnalytic.KSide
import Grothe.LowerAnalytic.PotentialReg

/-!
# The integrated fibre bound (L4, S5 integrated)

For bounded measurable responses `f̃, g̃` on `ℝ^{(n+1)+(n+1)}`, `k̃ = (f̃ − g̃)/2`, `h̃ = (f̃ + g̃)/2`:

* `coefFib_section`: the coefficient vector of the section `z ↦ k̃(joinR z y)` is
  `(c₀, c₁, conj c₂, c₃, c₄, c₅)(y)`;
* `inner_L_split`: `⟪ℓζ₀ + βv, h⟫ = ∫_y ∫_z conj(L(z)) h̃(joinR z y)` for the frame vector
  `ζ₀ = z₀/√2` and the coupling vector `v = vL 0`;
* `fibre_integrated`: integrating `fibreExprC ≤ Ψ(|q|)` over `y`.
-/

open MeasureTheory ProbabilityTheory Real Set Grothe.Lower
open scoped ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

variable {n : ℕ}

lemma coefFib_section (k : (Fin ((n + 1) + (n + 1)) → ℝ) → ℂ) (y : Fin (n + n) → ℝ) :
    coefFib (fun z => k (joinR z y))
      = ⟨cf n 0 k y, cf n 1 k y, conj (cf n 2 k y), cf n 3 k y, cf n 4 k y, cf n 5 k y⟩ := by
  simp [coefFib, cf, fibreB]

/-- The frame vector `ζ₀ = z₀/√2`. -/
def zeta0 (n : ℕ) : L2G (n + 1) := (((√2 : ℝ) : ℂ)⁻¹) • zL (n + 1) 0

lemma zeta0_mem : zeta0 n ∈ H10 (n + 1) := Submodule.smul_mem _ _ (zL_mem_H10 (n + 1) 0)

lemma norm_zeta0 : ‖zeta0 n‖ = 1 := by
  have h2 : ‖zL (n + 1) 0‖ = √2 := by
    rw [← norm_zL_sq (n + 1) 0, Real.sqrt_sq (norm_nonneg _)]
  rw [zeta0, norm_smul, h2, norm_inv, Complex.norm_real, Real.norm_eq_abs,
    abs_of_nonneg (Real.sqrt_nonneg _), inv_mul_cancel₀ (by positivity)]

/-- The function of `ℓζ₀ + βv`. -/
def Lfun (n : ℕ) (ℓ β : ℝ) (x : Fin ((n + 1) + (n + 1)) → ℝ) : ℂ :=
  (ℓ : ℂ) * (((√2 : ℝ) : ℂ)⁻¹ * zc (n + 1) 0 x)
    + (β : ℂ) * ((((2 * √2)⁻¹ : ℝ) : ℂ) * (wc (n + 1) 0 0 0 x - 4 * zc (n + 1) 0 x))

lemma Lvec_ae (ℓ β : ℝ) :
    ⇑((ℓ : ℂ) • zeta0 n + (β : ℂ) • vL (n + 1) 0) =ᵐ[stdGaussian ((n + 1) + (n + 1))] Lfun n ℓ β := by
  filter_upwards [Lp.coeFn_add ((ℓ : ℂ) • zeta0 n) ((β : ℂ) • vL (n + 1) 0),
    Lp.coeFn_smul (ℓ : ℂ) (zeta0 n), Lp.coeFn_smul (β : ℂ) (vL (n + 1) 0),
    Lp.coeFn_smul (((√2 : ℝ) : ℂ)⁻¹) (zL (n + 1) 0), zL_ae (n + 1) 0, vL_coeFn (n + 1) 0]
    with x h1 h2 h3 h4 h5 h6
  rw [h1, Pi.add_apply, h2, h3, Pi.smul_apply, Pi.smul_apply, smul_eq_mul, smul_eq_mul, zeta0, h4,
    Pi.smul_apply, smul_eq_mul, h5, h6]
  rfl

lemma Lfun_joinR (ℓ β : ℝ) (z : ℂ) (y : Fin (n + n) → ℝ) : Lfun n ℓ β (joinR z y) = Lf ℓ β z := by
  have hs : ((√2 : ℝ) : ℂ) ≠ 0 := by exact_mod_cast sqrt_two_ne
  have hs2 : ((√2 : ℝ) : ℂ) ^ 2 = 2 := sqrt2_sq_C
  have nsq : conj z * z = ((Complex.normSq z : ℝ) : ℂ) := by rw [mul_comm, Complex.mul_conj]
  simp only [Lfun, wc, joinR_zc0, map_mul, Complex.conj_ofReal, Lf]
  push_cast
  field_simp
  linear_combination (z ^ 2 * (β : ℂ) * conj z) * hs2 + (2 * z * (β : ℂ)) * nsq

lemma inner_L_split (ℓ β : ℝ) (h : L2G (n + 1)) {ht : (Fin ((n + 1) + (n + 1)) → ℝ) → ℂ}
    (hh : ⇑h =ᵐ[stdGaussian ((n + 1) + (n + 1))] ht) :
    inner ℂ ((ℓ : ℂ) • zeta0 n + (β : ℂ) • vL (n + 1) 0) h
      = ∫ y, ∫ z, conj (Lf ℓ β z) * ht (joinR z y) ∂gaussC ∂(stdGaussian (n + n)) := by
  have hi := L2.integrable_inner (𝕜 := ℂ) ((ℓ : ℂ) • zeta0 n + (β : ℂ) • vL (n + 1) 0) h
  have hae : (fun x => inner ℂ (((ℓ : ℂ) • zeta0 n + (β : ℂ) • vL (n + 1) 0 : L2G (n + 1)) x) (h x))
      =ᵐ[stdGaussian ((n + 1) + (n + 1))] fun x => conj (Lfun n ℓ β x) * ht x := by
    filter_upwards [Lvec_ae ℓ β, hh] with x h1 h2
    rw [RCLike.inner_apply', h1, h2]
  have e1 : inner ℂ ((ℓ : ℂ) • zeta0 n + (β : ℂ) • vL (n + 1) 0) h
      = ∫ x, conj (Lfun n ℓ β x) * ht x ∂(stdGaussian ((n + 1) + (n + 1))) := by
    rw [L2.inner_def]
    exact integral_congr_ae hae
  rw [e1, integral_split2 _ (hi.congr hae)]
  simp_rw [Lfun_joinR]

/-! ### Integrability of the pointwise forms -/

lemma integrable_form3 (M : Sym3) (u1 u2 u3 : L2G n) :
    Integrable (fun y => M.form (u1 y) (u2 y) (u3 y)) (stdGaussian (n + n)) := by
  have i := fun a b : L2G n => integrable_hre a b
  unfold Sym3.form
  exact (((((i u1 u1).const_mul _).add ((i u1 u2).const_mul _)).add ((i u1 u3).const_mul _)).add
    ((i u2 u2).const_mul _)).add ((i u2 u3).const_mul _) |>.add ((i u3 u3).const_mul _)

lemma integrable_form2 (M : Sym2) (u1 u2 : L2G n) :
    Integrable (fun y => M.form (u1 y) (u2 y)) (stdGaussian (n + n)) := by
  have i := fun a b : L2G n => integrable_hre a b
  unfold Sym2.form
  exact (((i u1 u1).const_mul _).add ((i u1 u2).const_mul _)).add ((i u2 u2).const_mul _)

lemma norm_sq_eq_integral (u : L2G n) : ‖u‖ ^ 2 = ∫ y, ‖u y‖ ^ 2 ∂(stdGaussian (n + n)) := by
  rw [← re_inner_self, re_inner_eq_integral]
  simp_rw [hre_self]

/-! ### The integrated fibre bound -/

section integrated

variable (E : Sym3) (R : Sym2) (ℓ β b1 b2 b3 : ℝ)
  {ft gt : (Fin ((n + 1) + (n + 1)) → ℝ) → ℂ} (hfm : Measurable ft) (hgm : Measurable gt)
  (hfb : ∀ x, ‖ft x‖ ≤ 1) (hgb : ∀ x, ‖gt x‖ ≤ 1)

include hfm hgm in
lemma measurable_kt : Measurable fun x => (ft x - gt x) / 2 := (hfm.sub hgm).div_const _

include hfb hgb in
lemma norm_kt_le (x : Fin ((n + 1) + (n + 1)) → ℝ) : ‖(ft x - gt x) / 2‖ ≤ 1 := by
  rw [norm_div, Complex.norm_two, div_le_one two_pos]
  exact (norm_sub_le _ _).trans (by linarith [hfb x, hgb x])

include hfb hgb in
lemma norm_ht_le (x : Fin ((n + 1) + (n + 1)) → ℝ) : ‖(ft x + gt x) / 2‖ ≤ 1 := by
  rw [norm_div, Complex.norm_two, div_le_one two_pos]
  exact (norm_add_le _ _).trans (by linarith [hfb x, hgb x])

/-- The coefficient element `c_j[k̃]`. -/
abbrev cK (j : Fin 6) : L2G n := cfL n (measurable_kt hfm hgm) (norm_kt_le hfb hgb) j

/-- The coupling element `a·ξ = (1+b₁)c₀ + b₂c₁ + b₃ conj c₂`. -/
def aXi : L2G n :=
  (((1 + b1 : ℝ) : ℂ)) • cK hfm hgm hfb hgb 0 + (b2 : ℂ) • cK hfm hgm hfb hgb 1
    + (b3 : ℂ) • conjL (cK hfm hgm hfb hgb 2)

lemma aXi_ae : ⇑(aXi b1 b2 b3 hfm hgm hfb hgb) =ᵐ[stdGaussian (n + n)] fun y =>
    ((1 + b1 : ℝ) : ℂ) * cf n 0 (fun x => (ft x - gt x) / 2) y
      + (b2 : ℂ) * cf n 1 (fun x => (ft x - gt x) / 2) y
      + (b3 : ℂ) * conj (cf n 2 (fun x => (ft x - gt x) / 2) y) := by
  unfold aXi
  filter_upwards [Lp.coeFn_add (((1 + b1 : ℝ) : ℂ) • cK hfm hgm hfb hgb 0 + (b2 : ℂ) • cK hfm hgm hfb hgb 1)
      ((b3 : ℂ) • conjL (cK hfm hgm hfb hgb 2)),
    Lp.coeFn_add (((1 + b1 : ℝ) : ℂ) • cK hfm hgm hfb hgb 0) ((b2 : ℂ) • cK hfm hgm hfb hgb 1),
    Lp.coeFn_smul (((1 + b1 : ℝ) : ℂ)) (cK hfm hgm hfb hgb 0),
    Lp.coeFn_smul (b2 : ℂ) (cK hfm hgm hfb hgb 1), Lp.coeFn_smul (b3 : ℂ) (conjL (cK hfm hgm hfb hgb 2)),
    cfL_ae (measurable_kt hfm hgm) (norm_kt_le hfb hgb) 0,
    cfL_ae (measurable_kt hfm hgm) (norm_kt_le hfb hgb) 1,
    cfL_ae (measurable_kt hfm hgm) (norm_kt_le hfb hgb) 2,
    conjL_ae (cK hfm hgm hfb hgb 2)] with y h1 h2 h3 h4 h5 h6 h7 h8 h9
  rw [h1, Pi.add_apply, h2, Pi.add_apply, h3, h4, h5, Pi.smul_apply, Pi.smul_apply, Pi.smul_apply,
    smul_eq_mul, smul_eq_mul, smul_eq_mul, h9, h6, h7, h8]

end integrated

lemma measurable_joinR_left (y : Fin (n + n) → ℝ) : Measurable fun z : ℂ => joinR z y :=
  split2.symm.measurable.comp (measurable_const.prodMk measurable_id)

section integrated2

variable (E : Sym3) (R : Sym2) (ℓ β b1 b2 b3 : ℝ)
  {ft gt : (Fin ((n + 1) + (n + 1)) → ℝ) → ℂ} (hfm : Measurable ft) (hgm : Measurable gt)
  (hfb : ∀ x, ‖ft x‖ ≤ 1) (hgb : ∀ x, ‖gt x‖ ≤ 1)

/-- The fibre `L`-term `∫_z conj(L z) h̃(joinR z y)`. -/
def Lsec (y : Fin (n + n) → ℝ) : ℂ :=
  ∫ z, conj (Lf ℓ β z) * ((ft (joinR z y) + gt (joinR z y)) / 2) ∂gaussC

include hfm hgm hfb hgb in
lemma integrable_Lsec : Integrable (Lsec ℓ β (ft := ft) (gt := gt)) (stdGaussian (n + n)) := by
  have hm : StronglyMeasurable (Lsec ℓ β (ft := ft) (gt := gt)) := by
    have hf : StronglyMeasurable fun p : (Fin (n + n) → ℝ) × ℂ =>
        conj (Lf ℓ β p.2) * ((ft (joinR p.2 p.1) + gt (joinR p.2 p.1)) / 2) := by
      have hj : Measurable fun p : (Fin (n + n) → ℝ) × ℂ => joinR p.2 p.1 :=
        split2.symm.measurable.comp (measurable_fst.prodMk measurable_snd)
      refine (((Complex.continuous_conj.comp (continuous_Lf ℓ β)).measurable.comp
        measurable_snd).mul (((hfm.comp hj).add (hgm.comp hj)).div_const _)).stronglyMeasurable
    exact hf.integral_prod_right'
  refine MemLp.integrable one_le_two (MemLp.of_bound hm.aestronglyMeasurable
    (∫ z, ‖Lf ℓ β z‖ ∂gaussC) (Filter.Eventually.of_forall fun y => ?_))
  refine (norm_integral_le_integral_norm _).trans (integral_mono_of_nonneg
    (Filter.Eventually.of_forall fun _ => norm_nonneg _) (integrable_Lf ℓ β).norm
    (Filter.Eventually.of_forall fun z => ?_))
  simp only [norm_mul, Complex.norm_conj]
  exact mul_le_of_le_one_right (norm_nonneg _) (norm_ht_le hfb hgb _)

/-- **The integrated fibre bound.** -/
theorem fibre_integrated (hE : E.psdOK = true) (hR : R.psdOK = true) (Qe : L2G n) :
    formH3 E (cK hfm hgm hfb hgb 0) (cK hfm hgm hfb hgb 1) (conjL (cK hfm hgm hfb hgb 2))
      + formH2 R (cK hfm hgm hfb hgb 3) (cK hfm hgm hfb hgb 4) + ε * ‖cK hfm hgm hfb hgb 5‖ ^ 2
      + 2 * (∫ y, Lsec ℓ β (ft := ft) (gt := gt) y ∂(stdGaussian (n + n))).re
      + 2 * (inner ℂ Qe (aXi b1 b2 b3 hfm hgm hfb hgb)).re
      ≤ ∫ y, pot E R ℓ β (aFib b1 b2 b3) ‖Qe y‖ ∂(stdGaussian (n + n)) := by
  set kt := fun x => (ft x - gt x) / 2 with hkt
  have hkm := measurable_kt hfm hgm
  have hkb := norm_kt_le hfb hgb
  -- the pointwise bound
  have hpt : ∀ y, fibreExprC E R ℓ β b1 b2 b3 (fun z => ft (joinR z y)) (fun z => gt (joinR z y))
      (Qe y) ≤ pot E R ℓ β (aFib b1 b2 b3) ‖Qe y‖ := fun y =>
    fibreExprC_le_pot E R ℓ β b1 b2 b3 hE hR (hfm.comp (measurable_joinR_left y))
      (hgm.comp (measurable_joinR_left y)) (fun z => hfb _) (fun z => hgb _) (Qe y)
  -- the three parts
  set A : (Fin (n + n) → ℝ) → ℝ := fun y => E.form (cK hfm hgm hfb hgb 0 y) (cK hfm hgm hfb hgb 1 y)
      (conjL (cK hfm hgm hfb hgb 2) y) + R.form (cK hfm hgm hfb hgb 3 y) (cK hfm hgm hfb hgb 4 y)
      + ε * ‖cK hfm hgm hfb hgb 5 y‖ ^ 2 with hA
  set C : (Fin (n + n) → ℝ) → ℝ := fun y => 2 * hre (Qe y) (aXi b1 b2 b3 hfm hgm hfb hgb y) with hC
  have hF : ∀ᵐ y ∂(stdGaussian (n + n)), fibreExprC E R ℓ β b1 b2 b3 (fun z => ft (joinR z y))
      (fun z => gt (joinR z y)) (Qe y) = A y + 2 * (Lsec ℓ β (ft := ft) (gt := gt) y).re + C y := by
    filter_upwards [cfL_ae hkm hkb 0, cfL_ae hkm hkb 1, cfL_ae hkm hkb 2, cfL_ae hkm hkb 3,
      cfL_ae hkm hkb 4, cfL_ae hkm hkb 5, conjL_ae (cK hfm hgm hfb hgb 2),
      aXi_ae b1 b2 b3 hfm hgm hfb hgb] with y h0 h1 h2 h3 h4 h5 h6 h7
    simp only [fibreExprC, hA, hC, Lsec]
    rw [coefFib_section kt y]
    simp only [Fib.quad]
    rw [h6, h0, h1, h2, h3, h4, h5, h7]
    simp only [hre]
    ring
  have iA : Integrable A (stdGaussian (n + n)) :=
    ((integrable_form3 E _ _ _).add (integrable_form2 R _ _)).add
      (((Lp.memLp _).integrable_norm_pow two_ne_zero).const_mul _)
  have iB : Integrable (fun y => 2 * (Lsec ℓ β (ft := ft) (gt := gt) y).re) (stdGaussian (n + n)) :=
    (integrable_Lsec ℓ β hfm hgm hfb hgb).re.const_mul 2
  have iC : Integrable C (stdGaussian (n + n)) := (integrable_hre _ _).const_mul 2
  have iP : Integrable (fun y => pot E R ℓ β (aFib b1 b2 b3) ‖Qe y‖) (stdGaussian (n + n)) := by
    have := integrable_pot_comp (E := E) (R := R) (ℓ := ℓ) (β := β) (a := aFib b1 b2 b3) hE hR
      (Lp.memLp Qe).aestronglyMeasurable ((Lp.memLp Qe).integrable one_le_two).norm 1 zero_le_one
    simpa using this
  have iAB : Integrable (fun y => A y + 2 * (Lsec ℓ β (ft := ft) (gt := gt) y).re)
      (stdGaussian (n + n)) := iA.add iB
  have iS : Integrable (fun y => A y + 2 * (Lsec ℓ β (ft := ft) (gt := gt) y).re + C y)
      (stdGaussian (n + n)) := iAB.add iC
  have hmono := integral_mono_ae iS iP (by
    filter_upwards [hF] with y hy
    rw [← hy]; exact hpt y)
  rw [integral_add iAB iC, integral_add iA iB] at hmono
  have eA : ∫ y, A y ∂(stdGaussian (n + n))
      = formH3 E (cK hfm hgm hfb hgb 0) (cK hfm hgm hfb hgb 1) (conjL (cK hfm hgm hfb hgb 2))
        + formH2 R (cK hfm hgm hfb hgb 3) (cK hfm hgm hfb hgb 4) + ε * ‖cK hfm hgm hfb hgb 5‖ ^ 2 := by
    have j3 := integrable_form3 E (cK hfm hgm hfb hgb 0) (cK hfm hgm hfb hgb 1)
      (conjL (cK hfm hgm hfb hgb 2))
    have j2 := integrable_form2 R (cK hfm hgm hfb hgb 3) (cK hfm hgm hfb hgb 4)
    have j32 : Integrable (fun y => E.form (cK hfm hgm hfb hgb 0 y) (cK hfm hgm hfb hgb 1 y)
        (conjL (cK hfm hgm hfb hgb 2) y) + R.form (cK hfm hgm hfb hgb 3 y) (cK hfm hgm hfb hgb 4 y))
        (stdGaussian (n + n)) := j3.add j2
    have j5 : Integrable (fun y => (ε : ℝ) * ‖cK hfm hgm hfb hgb 5 y‖ ^ 2) (stdGaussian (n + n)) :=
      ((Lp.memLp _).integrable_norm_pow two_ne_zero).const_mul _
    rw [hA, integral_add j32 j5, integral_add j3 j2, integral_const_mul,
      ← formH3_eq_integral, ← formH2_eq_integral, ← norm_sq_eq_integral]
  have eB : ∫ y, 2 * (Lsec ℓ β (ft := ft) (gt := gt) y).re ∂(stdGaussian (n + n))
      = 2 * (∫ y, Lsec ℓ β (ft := ft) (gt := gt) y ∂(stdGaussian (n + n))).re := by
    rw [integral_const_mul]
    congr 1
    have := integral_re (integrable_Lsec ℓ β hfm hgm hfb hgb)
    simpa using this
  have eC : ∫ y, C y ∂(stdGaussian (n + n)) = 2 * (inner ℂ Qe (aXi b1 b2 b3 hfm hgm hfb hgb)).re := by
    rw [hC, integral_const_mul, re_inner_eq_integral]
  rw [eA, eB, eC] at hmono
  exact hmono

end integrated2

end

end Grothe.LowerAnalytic
