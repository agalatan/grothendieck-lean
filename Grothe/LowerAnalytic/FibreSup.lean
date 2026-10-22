import Grothe.LowerAnalytic.FibrePotential

/-!
# The fibre potential `Ψ_r` as a supremum: finiteness, convexity, Lipschitz bound, node caps

Continuation of `FibrePotential.lean`.  `Jpot E R ℓ β a y s` is the function `J_r(y, s)` of the
certified potential written in the variable `y = M⁻¹m`, and `pot E R ℓ β a s = ⨆ y, J_r(y, s)` is
`Ψ_r(s)` (see the module docstring of `FibrePotential.lean` for the conventions).
-/

open MeasureTheory Real Set Grothe.Lower
open scoped ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

/-! ### Algebra of the packed dual variable -/

lemma hre_comm (u v : ℂ) : hre u v = hre v u := by simp only [hre_eq]; ring

lemma abs_hre_le (u v : ℂ) : |hre u v| ≤ ‖u‖ * ‖v‖ := by
  unfold hre
  refine (Complex.abs_re_le_norm _).trans ?_
  rw [norm_mul, Complex.norm_conj]

namespace Fib

instance : Nonempty Fib := ⟨⟨0, 0, 0, 0, 0, 0⟩⟩

variable (E : Sym3) (R : Sym2)

lemma ip_M_self (y : Fib) : ip (M E R y) y = quad E R y := by
  simp only [ip, M, quad, Sym3.form, Sym2.form, hre_eq, Complex.sq_norm, Complex.normSq_apply,
    Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im, Complex.ratCast_re,
    Complex.ratCast_im]
  ring

lemma ip_add_smul (v w : Fib) (s : ℝ) (K : Fib) : ip (v.add (w.smul s)) K = ip v K + s * ip w K := by
  simp only [ip, add, smul, hre_eq, Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im,
    Complex.ofReal_re, Complex.ofReal_im]
  ring

/-- `quad (y − K) = quad y − 2 ip (M y) K + quad K`. -/
lemma quad_sub (y K : Fib) : quad E R (y.sub K) = quad E R y - 2 * ip (M E R y) K + quad E R K := by
  simp only [ip, M, quad, sub, Sym3.form, Sym2.form, hre_eq, Complex.sq_norm, Complex.normSq_apply,
    Complex.add_re, Complex.add_im, Complex.sub_re, Complex.sub_im, Complex.mul_re, Complex.mul_im,
    Complex.ratCast_re, Complex.ratCast_im]
  ring

lemma quad_nonneg (hE : E.psdOK = true) (hR : R.psdOK = true) (y : Fib) : 0 ≤ quad E R y := by
  have h1 := Sym3.form_nonneg_of_psdOK E hE y.e1 y.e2 y.e3
  have h2 := Sym2.form_nonneg_of_psdOK R hR y.z1 y.z2
  have hε : (0 : ℝ) ≤ ε := by unfold ε; norm_num
  unfold quad
  positivity

/-- A crude bound of the quadratic form on a box. -/
lemma quad_le (c : ℝ) (y : Fib) (h1 : ‖y.e1‖ ≤ c) (h2 : ‖y.e2‖ ≤ c) (h3 : ‖y.e3‖ ≤ c)
    (h4 : ‖y.z1‖ ≤ c) (h5 : ‖y.z2‖ ≤ c) (h6 : ‖y.d‖ ≤ c) :
    quad E R y ≤ (|(E.m11 : ℝ)| + 2 * |(E.m12 : ℝ)| + 2 * |(E.m13 : ℝ)| + |(E.m22 : ℝ)|
      + 2 * |(E.m23 : ℝ)| + |(E.m33 : ℝ)| + |(R.m11 : ℝ)| + 2 * |(R.m12 : ℝ)| + |(R.m22 : ℝ)| + 1)
        * c ^ 2 := by
  have hc : 0 ≤ c := (norm_nonneg _).trans h1
  have b : ∀ u v : ℂ, ‖u‖ ≤ c → ‖v‖ ≤ c → ∀ m : ℝ, m * hre u v ≤ |m| * c ^ 2 := by
    intro u v hu hv m
    have h := abs_hre_le u v
    have : ‖u‖ * ‖v‖ ≤ c ^ 2 := by rw [sq]; exact mul_le_mul hu hv (norm_nonneg _) hc
    calc m * hre u v ≤ |m * hre u v| := le_abs_self _
      _ = |m| * |hre u v| := abs_mul _ _
      _ ≤ |m| * c ^ 2 := mul_le_mul_of_nonneg_left (h.trans this) (abs_nonneg _)
  have hd : ε * ‖y.d‖ ^ 2 ≤ 1 * c ^ 2 := by
    have : ‖y.d‖ ^ 2 ≤ c ^ 2 := pow_le_pow_left₀ (norm_nonneg _) h6 2
    have hε0 : (0 : ℝ) ≤ ε := by unfold ε; norm_num
    have hε1 : (ε : ℝ) ≤ 1 := by unfold ε; norm_num
    nlinarith
  have := b _ _ h1 h1 E.m11; have := b _ _ h1 h2 E.m12; have := b _ _ h1 h3 E.m13
  have := b _ _ h2 h2 E.m22; have := b _ _ h2 h3 E.m23; have := b _ _ h3 h3 E.m33
  have := b _ _ h4 h4 R.m11; have := b _ _ h4 h5 R.m12; have := b _ _ h5 h5 R.m22
  simp only [quad, Sym3.form, Sym2.form]
  nlinarith

end Fib

/-! ### The coefficient vector of a fibre function -/

/-- `K = (∫k, ∫(|z|²−1)k, conj ∫ conj(z²/√2) k, ∫ z̄ k, ∫ conj(z(|z|²−2)/√2) k, ∫ z k)`: the packed
real coefficients `K_j = Re ∫ conj(B_j) k`. -/
def coefFib (k : ℂ → ℂ) : Fib :=
  ⟨∫ z, k z ∂gaussC, ∫ z, conj (fB1 z) * k z ∂gaussC, conj (∫ z, conj (fB2 z) * k z ∂gaussC),
   ∫ z, conj z * k z ∂gaussC, ∫ z, conj (fB4 z) * k z ∂gaussC, ∫ z, z * k z ∂gaussC⟩

section coef

variable {k : ℂ → ℂ} (hkm : AEStronglyMeasurable k gaussC) (hkb : ∀ z, ‖k z‖ ≤ 1)
include hkm hkb

lemma integrable_mul_k {g : ℂ → ℂ} (hg : Integrable g gaussC) :
    Integrable (fun z => g z * k z) gaussC := by
  have := hg.bdd_mul hkm (c := 1) (Filter.Eventually.of_forall hkb)
  refine this.congr (Filter.Eventually.of_forall fun z => ?_)
  simp only; ring

lemma norm_integral_mul_k_le {g : ℂ → ℂ} (hg : Integrable g gaussC) :
    ‖∫ z, g z * k z ∂gaussC‖ ≤ ∫ z, ‖g z‖ ∂gaussC := by
  refine (norm_integral_le_integral_norm _).trans (integral_mono (integrable_mul_k hkm hkb hg).norm
    hg.norm fun z => ?_)
  simp only [norm_mul]
  exact mul_le_of_le_one_right (norm_nonneg _) (hkb z)

/-- **The pairing with a fibre function**: `Re ∫ conj(B·w) k = Σ_j w_j K_j`. -/
lemma re_integral_conj_fn_mul (w : Fib) :
    (∫ z, conj (w.fn z) * k z ∂gaussC).re = Fib.ip w (coefFib k) := by
  have i0 : Integrable k gaussC := by
    simpa using integrable_mul_k hkm hkb (integrable_const (1 : ℂ))
  have i1 := integrable_mul_k hkm hkb (integrable_of_le_qw _
    (Complex.continuous_conj.comp continuous_fB1) 1 (by simpa using norm_fB1_le))
  have i2 := integrable_mul_k hkm hkb (integrable_of_le_qw _
    (Complex.continuous_conj.comp continuous_fB2) 1 (by simpa using norm_fB2_le))
  have i3 := integrable_mul_k hkm hkb integrable_conj
  have i4 := integrable_mul_k hkm hkb (integrable_of_le_qw _
    (Complex.continuous_conj.comp continuous_fB4) 2 (by simpa using norm_fB4_le))
  have i5 := integrable_mul_k hkm hkb integrable_id
  let T : Fin 6 → ℂ → ℂ := ![fun z => conj w.e1 * k z, fun z => conj w.e2 * (conj (fB1 z) * k z),
    fun z => w.e3 * (conj (fB2 z) * k z), fun z => conj w.z1 * (conj z * k z),
    fun z => conj w.z2 * (conj (fB4 z) * k z), fun z => conj w.d * (z * k z)]
  have hT : ∀ i, Integrable (T i) gaussC := by
    intro i
    fin_cases i
    · exact i0.const_mul _
    · exact i1.const_mul _
    · exact i2.const_mul _
    · exact i3.const_mul _
    · exact i4.const_mul _
    · exact i5.const_mul _
  have e : (fun z => conj (w.fn z) * k z) = fun z => ∑ i, T i z := by
    funext z
    simp only [Fin.sum_univ_six, T, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val,
      Fib.fn, map_add, map_mul, Complex.conj_conj]
    ring
  rw [e, integral_finsetSum _ (fun i _ => hT i)]
  simp only [Fin.sum_univ_six, T, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val,
    integral_const_mul, Complex.add_re, Fib.ip, coefFib, hre]
  rw [show (conj w.e3 * conj (∫ z, conj (fB2 z) * k z ∂gaussC)).re
      = (w.e3 * ∫ z, conj (fB2 z) * k z ∂gaussC).re by rw [← map_mul, Complex.conj_re]]

end coef

lemma integrable_conj_of {F : ℂ → ℂ} (hF : Integrable F gaussC) :
    Integrable (fun z => conj (F z)) gaussC :=
  hF.norm.mono' (Complex.continuous_conj.comp_aestronglyMeasurable hF.1)
    (Filter.Eventually.of_forall fun z => by simp)

/-! ### The phase function -/

/-- `ph w = w/|w|` (`1` at `0`). -/
def ph (w : ℂ) : ℂ := if w = 0 then 1 else w / (‖w‖ : ℂ)

lemma measurable_ph : Measurable ph := by
  unfold ph
  refine Measurable.ite (measurableSet_eq_fun measurable_id measurable_const) measurable_const ?_
  exact measurable_id.div (Complex.measurable_ofReal.comp measurable_norm)

lemma norm_ph_le (w : ℂ) : ‖ph w‖ ≤ 1 := by
  unfold ph
  split_ifs with h
  · simp
  · rw [norm_div, Complex.norm_real, Real.norm_eq_abs, abs_norm, div_self (norm_ne_zero_iff.2 h)]

lemma conj_mul_ph (w : ℂ) : conj w * ph w = (‖w‖ : ℂ) := by
  unfold ph
  split_ifs with h
  · simp [h]
  · have hn : (‖w‖ : ℂ) ≠ 0 := by exact_mod_cast norm_ne_zero_iff.2 h
    rw [mul_div_assoc', Complex.conj_mul', sq, mul_div_assoc, div_self hn, mul_one]

/-! ### The function `J_r` and the potential -/

variable (E : Sym3) (R : Sym2) (ℓ β : ℝ) (a : Fib)

/-- The residual direction `B·(M y + s a)`. -/
def pfn (y : Fib) (s : ℝ) (z : ℂ) : ℂ := ((Fib.M E R y).add (a.smul s)).fn z

lemma pfn_eq (y : Fib) (s : ℝ) (z : ℂ) : pfn E R a y s z = (Fib.M E R y).fn z + (s : ℂ) * a.fn z := by
  rw [pfn, Fib.fn_add, Fib.fn_smul]

lemma continuous_pfn (y : Fib) (s : ℝ) : Continuous (pfn E R a y s) := Fib.continuous_fn _

/-- `J_r(y, s) = ∫ (|L + B·(My + sa)| + |L − B·(My + sa)|) dγ − yᵀMy`. -/
def Jpot (y : Fib) (s : ℝ) : ℝ :=
  ∫ z, (‖Lf ℓ β z + pfn E R a y s z‖ + ‖Lf ℓ β z - pfn E R a y s z‖) ∂gaussC - Fib.quad E R y

/-- **The fibre potential** `Ψ_r(s) = sup_y J_r(y, s)` (the certified potential, eq. (1)). -/
def pot (s : ℝ) : ℝ := ⨆ y : Fib, Jpot E R ℓ β a y s

lemma integrable_norm_L_add (v : Fib) (σ : ℝ) :
    Integrable (fun z => ‖Lf ℓ β z + (σ : ℂ) * v.fn z‖) gaussC := by
  refine integrable_of_le_qw' _ (by have := v.continuous_fn; have := continuous_Lf ℓ β; fun_prop)
    ((|ℓ| + 3 * |β|) + |σ| * (‖v.e1‖ + ‖v.e2‖ + ‖v.e3‖ + ‖v.z1‖ + 2 * ‖v.z2‖ + ‖v.d‖))
    fun z => ?_
  rw [abs_of_nonneg (norm_nonneg _)]
  refine (norm_add_le _ _).trans ?_
  rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, add_mul, mul_assoc]
  exact add_le_add (norm_Lf_le ℓ β z) (mul_le_mul_of_nonneg_left (v.norm_fn_le z) (abs_nonneg _))

lemma integrable_norm_L_pfn (y : Fib) (s σ : ℝ) :
    Integrable (fun z => ‖Lf ℓ β z + (σ : ℂ) * pfn E R a y s z‖) gaussC := by
  have := integrable_norm_L_add ℓ β ((Fib.M E R y).add (a.smul s)) σ
  exact this

lemma integrable_norm_L_plus (y : Fib) (s : ℝ) :
    Integrable (fun z => ‖Lf ℓ β z + pfn E R a y s z‖) gaussC := by
  simpa using integrable_norm_L_pfn E R ℓ β a y s 1

lemma integrable_norm_L_minus (y : Fib) (s : ℝ) :
    Integrable (fun z => ‖Lf ℓ β z - pfn E R a y s z‖) gaussC := by
  simpa [sub_eq_add_neg] using integrable_norm_L_pfn E R ℓ β a y s (-1)

lemma integrable_Jint (y : Fib) (s : ℝ) :
    Integrable (fun z => ‖Lf ℓ β z + pfn E R a y s z‖ + ‖Lf ℓ β z - pfn E R a y s z‖) gaussC :=
  (integrable_norm_L_plus E R ℓ β a y s).add (integrable_norm_L_minus E R ℓ β a y s)

/-- The fibre expression `KᵀMK + 2 Re ∫ conj(L) h₀ + 2 s aᵀK` of a pair of fibre responses. -/
def fibreExpr (f g : ℂ → ℂ) (s : ℝ) : ℝ :=
  Fib.quad E R (coefFib fun z => (f z - g z) / 2)
    + 2 * (∫ z, conj (Lf ℓ β z) * ((f z + g z) / 2) ∂gaussC).re
    + 2 * s * Fib.ip a (coefFib fun z => (f z - g z) / 2)

section pair

variable {f g : ℂ → ℂ} (hfm : AEStronglyMeasurable f gaussC) (hgm : AEStronglyMeasurable g gaussC)
  (hfb : ∀ z, ‖f z‖ ≤ 1) (hgb : ∀ z, ‖g z‖ ≤ 1)
include hfm hgm hfb hgb

/-- The two linear payoffs split into the `h`- and `k`-parts. -/
lemma payoff_split (p : ℂ → ℂ) (hp : Continuous p) (C : ℝ) (hC : ∀ z, ‖p z‖ ≤ C * qw z) :
    (∫ z, conj (Lf ℓ β z + p z) * f z ∂gaussC).re + (∫ z, conj (Lf ℓ β z - p z) * g z ∂gaussC).re
      = 2 * (∫ z, conj (Lf ℓ β z) * ((f z + g z) / 2) ∂gaussC).re
        + 2 * (∫ z, conj (p z) * ((f z - g z) / 2) ∂gaussC).re := by
  have hL := integrable_Lf ℓ β
  have hP := integrable_of_le_qw p hp C hC
  have hLc : Integrable (fun z => conj (Lf ℓ β z)) gaussC :=
    integrable_of_le_qw _ (Complex.continuous_conj.comp (continuous_Lf ℓ β)) _
      (by simpa using norm_Lf_le ℓ β)
  have hPc : Integrable (fun z => conj (p z)) gaussC :=
    integrable_of_le_qw _ (Complex.continuous_conj.comp hp) C (by simpa using hC)
  have hkm : AEStronglyMeasurable (fun z => (f z - g z) / 2) gaussC := by fun_prop
  have hhm : AEStronglyMeasurable (fun z => (f z + g z) / 2) gaussC := by fun_prop
  have hkb : ∀ z, ‖(f z - g z) / 2‖ ≤ 1 := fun z => by
    rw [norm_div, Complex.norm_two, div_le_one two_pos]
    exact (norm_sub_le _ _).trans (by linarith [hfb z, hgb z])
  have hhb : ∀ z, ‖(f z + g z) / 2‖ ≤ 1 := fun z => by
    rw [norm_div, Complex.norm_two, div_le_one two_pos]
    exact (norm_add_le _ _).trans (by linarith [hfb z, hgb z])
  have i1 := integrable_mul_k hfm hfb (hLc.add hPc)
  have i2 := integrable_mul_k hgm hgb (hLc.sub hPc)
  have i3 := integrable_mul_k hhm hhb hLc
  have i4 := integrable_mul_k hkm hkb hPc
  rw [← Complex.add_re, ← integral_add (by simpa [map_add] using i1) (by simpa [map_sub] using i2),
    ← Complex.re_ofReal_mul, ← Complex.re_ofReal_mul, ← Complex.add_re, ← integral_const_mul,
    ← integral_const_mul, ← integral_add (i3.const_mul _) (i4.const_mul _)]
  congr 2
  funext z
  simp only [map_add, map_sub]
  push_cast
  ring

/-- **The fibre bound**: the fibre expression of any pair of responses is at most `J_r(K, s)`,
`K` the coefficient vector of `k₀ = (f₀ − g₀)/2`. -/
theorem fibreExpr_le_Jpot (s : ℝ) :
    fibreExpr E R ℓ β a f g s ≤ Jpot E R ℓ β a (coefFib fun z => (f z - g z) / 2) s := by
  set K := coefFib fun z => (f z - g z) / 2 with hK
  have hkm : AEStronglyMeasurable (fun z => (f z - g z) / 2) gaussC := by fun_prop
  have hkb : ∀ z, ‖(f z - g z) / 2‖ ≤ 1 := fun z => by
    rw [norm_div, Complex.norm_two, div_le_one two_pos]
    exact (norm_sub_le _ _).trans (by linarith [hfb z, hgb z])
  obtain ⟨C, hC⟩ : ∃ C, ∀ z, ‖pfn E R a K s z‖ ≤ C * qw z :=
    ⟨_, fun z => Fib.norm_fn_le _ z⟩
  have hsplit := payoff_split ℓ β hfm hgm hfb hgb (pfn E R a K s) (continuous_pfn E R a K s) C hC
  have hpair := re_integral_conj_fn_mul hkm hkb ((Fib.M E R K).add (a.smul s))
  rw [Fib.ip_add_smul, Fib.ip_M_self] at hpair
  have hre_le : ∀ (F : ℂ → ℂ) (u : ℂ → ℂ), Integrable F gaussC → AEStronglyMeasurable u gaussC →
      (∀ z, ‖u z‖ ≤ 1) → (∫ z, conj (F z) * u z ∂gaussC).re ≤ ∫ z, ‖F z‖ ∂gaussC := by
    intro F u hF hu hub
    refine (Complex.re_le_norm _).trans ((norm_integral_le_integral_norm _).trans
      (integral_mono (integrable_mul_k hu hub (integrable_conj_of hF)).norm hF.norm fun z => ?_))
    simp only [norm_mul, Complex.norm_conj]
    exact mul_le_of_le_one_right (norm_nonneg _) (hub z)
  have hLP : Integrable (fun z => Lf ℓ β z + pfn E R a K s z) gaussC :=
    (integrable_Lf ℓ β).add (integrable_of_le_qw _ (continuous_pfn E R a K s) C hC)
  have hLM : Integrable (fun z => Lf ℓ β z - pfn E R a K s z) gaussC :=
    (integrable_Lf ℓ β).sub (integrable_of_le_qw _ (continuous_pfn E R a K s) C hC)
  have hA := hre_le _ f hLP hfm hfb
  have hB := hre_le _ g hLM hgm hgb
  have hI : ∫ z, (‖Lf ℓ β z + pfn E R a K s z‖ + ‖Lf ℓ β z - pfn E R a K s z‖) ∂gaussC
      = ∫ z, ‖Lf ℓ β z + pfn E R a K s z‖ ∂gaussC + ∫ z, ‖Lf ℓ β z - pfn E R a K s z‖ ∂gaussC :=
    integral_add hLP.norm hLM.norm
  unfold fibreExpr Jpot
  rw [← hK, hI]
  have hpair' : (∫ z, conj (pfn E R a K s z) * ((f z - g z) / 2) ∂gaussC).re
      = Fib.quad E R K + s * Fib.ip a K := hpair
  linarith

end pair

lemma re_integral_conj_mul_le {F u : ℂ → ℂ} (hF : Integrable F gaussC)
    (hu : AEStronglyMeasurable u gaussC) (hub : ∀ z, ‖u z‖ ≤ 1) :
    (∫ z, conj (F z) * u z ∂gaussC).re ≤ ∫ z, ‖F z‖ ∂gaussC := by
  refine (Complex.re_le_norm _).trans ((norm_integral_le_integral_norm _).trans
    (integral_mono (integrable_mul_k hu hub (integrable_conj_of hF)).norm hF.norm fun z => ?_))
  simp only [norm_mul, Complex.norm_conj]
  exact mul_le_of_le_one_right (norm_nonneg _) (hub z)

/-- `‖L ± p‖` integrated, as the real part of the payoff of the phase. -/
lemma integral_norm_eq_re (F : ℂ → ℂ) (_hF : Continuous F) :
    ∫ z, ‖F z‖ ∂gaussC = (∫ z, conj (F z) * ph (F z) ∂gaussC).re := by
  simp_rw [conj_mul_ph]
  rw [integral_complex_ofReal, Complex.ofReal_re]

/-- **The converse bound**: `J_r(y, s)` is at most the fibre expression of the phases
`ph(L ± B·(My + sa))` (the square `quad (y − K) ≥ 0` is dropped). -/
theorem Jpot_le_fibreExpr (hE : E.psdOK = true) (hR : R.psdOK = true) (y : Fib) (s : ℝ) :
    Jpot E R ℓ β a y s ≤ fibreExpr E R ℓ β a (fun z => ph (Lf ℓ β z + pfn E R a y s z))
      (fun z => ph (Lf ℓ β z - pfn E R a y s z)) s := by
  have hpc := continuous_pfn E R a y s
  have hLc := continuous_Lf ℓ β
  have hfm : AEStronglyMeasurable (fun z => ph (Lf ℓ β z + pfn E R a y s z)) gaussC :=
    (measurable_ph.comp (hLc.add hpc).measurable).aestronglyMeasurable
  have hgm : AEStronglyMeasurable (fun z => ph (Lf ℓ β z - pfn E R a y s z)) gaussC :=
    (measurable_ph.comp (hLc.sub hpc).measurable).aestronglyMeasurable
  have hfb : ∀ z, ‖ph (Lf ℓ β z + pfn E R a y s z)‖ ≤ 1 := fun z => norm_ph_le _
  have hgb : ∀ z, ‖ph (Lf ℓ β z - pfn E R a y s z)‖ ≤ 1 := fun z => norm_ph_le _
  set K := coefFib fun z => (ph (Lf ℓ β z + pfn E R a y s z) - ph (Lf ℓ β z - pfn E R a y s z)) / 2
    with hK
  have hkm : AEStronglyMeasurable (fun z => (ph (Lf ℓ β z + pfn E R a y s z)
      - ph (Lf ℓ β z - pfn E R a y s z)) / 2) gaussC := by fun_prop
  have hkb : ∀ z, ‖(ph (Lf ℓ β z + pfn E R a y s z) - ph (Lf ℓ β z - pfn E R a y s z)) / 2‖ ≤ 1 :=
    fun z => by
      rw [norm_div, Complex.norm_two, div_le_one two_pos]
      exact (norm_sub_le _ _).trans (by linarith [hfb z, hgb z])
  obtain ⟨C, hC⟩ : ∃ C, ∀ z, ‖pfn E R a y s z‖ ≤ C * qw z := ⟨_, fun z => Fib.norm_fn_le _ z⟩
  have hsplit := payoff_split ℓ β hfm hgm hfb hgb (pfn E R a y s) hpc C hC
  have hpair : (∫ z, conj (pfn E R a y s z) * ((ph (Lf ℓ β z + pfn E R a y s z)
      - ph (Lf ℓ β z - pfn E R a y s z)) / 2) ∂gaussC).re
      = Fib.ip (Fib.M E R y) K + s * Fib.ip a K := by
    have := re_integral_conj_fn_mul hkm hkb ((Fib.M E R y).add (a.smul s))
    rw [Fib.ip_add_smul] at this
    exact this
  have hsq := Fib.quad_nonneg E R hE hR (y.sub K)
  rw [Fib.quad_sub] at hsq
  have hLP : Integrable (fun z => Lf ℓ β z + pfn E R a y s z) gaussC :=
    (integrable_Lf ℓ β).add (integrable_of_le_qw _ hpc C hC)
  have hLM : Integrable (fun z => Lf ℓ β z - pfn E R a y s z) gaussC :=
    (integrable_Lf ℓ β).sub (integrable_of_le_qw _ hpc C hC)
  have hI : ∫ z, (‖Lf ℓ β z + pfn E R a y s z‖ + ‖Lf ℓ β z - pfn E R a y s z‖) ∂gaussC
      = ∫ z, ‖Lf ℓ β z + pfn E R a y s z‖ ∂gaussC + ∫ z, ‖Lf ℓ β z - pfn E R a y s z‖ ∂gaussC :=
    integral_add hLP.norm hLM.norm
  rw [integral_norm_eq_re (fun z => Lf ℓ β z + pfn E R a y s z) (hLc.add hpc),
    integral_norm_eq_re (fun z => Lf ℓ β z - pfn E R a y s z) (hLc.sub hpc)] at hI
  unfold Jpot fibreExpr
  rw [← hK, hI]
  linarith

/-- The uniform constant of the coefficient bounds, `2 E(1 + |z|²)²`. -/
def cq : ℝ := 2 * ∫ z, qw z ∂gaussC

lemma norm_coef_le {k : ℂ → ℂ} (hkm : AEStronglyMeasurable k gaussC) (hkb : ∀ z, ‖k z‖ ≤ 1)
    {G : ℂ → ℂ} (hG : Continuous G) (hGb : ∀ z, ‖G z‖ ≤ 2 * qw z) :
    ‖∫ z, G z * k z ∂gaussC‖ ≤ cq := by
  have hGi := integrable_of_le_qw G hG 2 hGb
  refine (norm_integral_mul_k_le hkm hkb hGi).trans ?_
  unfold cq
  rw [← integral_const_mul]
  exact integral_mono hGi.norm (integrable_qw.const_mul 2) hGb

lemma coefFib_le {k : ℂ → ℂ} (hkm : AEStronglyMeasurable k gaussC) (hkb : ∀ z, ‖k z‖ ≤ 1) :
    ‖(coefFib k).e1‖ ≤ cq ∧ ‖(coefFib k).e2‖ ≤ cq ∧ ‖(coefFib k).e3‖ ≤ cq ∧
      ‖(coefFib k).z1‖ ≤ cq ∧ ‖(coefFib k).z2‖ ≤ cq ∧ ‖(coefFib k).d‖ ≤ cq := by
  have h1 : ∀ z, (1 : ℝ) ≤ qw z := fun z => by unfold qw; nlinarith [Complex.normSq_nonneg z]
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩
  · have := norm_coef_le hkm hkb (G := fun _ => (1 : ℂ)) continuous_const
      (fun z => by simp; linarith [h1 z])
    simpa [coefFib] using this
  · exact norm_coef_le hkm hkb (Complex.continuous_conj.comp continuous_fB1)
      (fun z => by simpa using (norm_fB1_le z).trans (by linarith [qw_nonneg z]))
  · rw [coefFib, Complex.norm_conj]
    exact norm_coef_le hkm hkb (Complex.continuous_conj.comp continuous_fB2)
      (fun z => by simpa using (norm_fB2_le z).trans (by linarith [qw_nonneg z]))
  · exact norm_coef_le hkm hkb Complex.continuous_conj
      (fun z => by simpa using (norm_le_qw z).trans (by linarith [qw_nonneg z]))
  · exact norm_coef_le hkm hkb (Complex.continuous_conj.comp continuous_fB4)
      (fun z => by simpa using norm_fB4_le z)
  · exact norm_coef_le hkm hkb continuous_id
      (fun z => by simpa using (norm_le_qw z).trans (by linarith [qw_nonneg z]))

lemma ip_le (v K : Fib) (c : ℝ) (h1 : ‖K.e1‖ ≤ c) (h2 : ‖K.e2‖ ≤ c) (h3 : ‖K.e3‖ ≤ c)
    (h4 : ‖K.z1‖ ≤ c) (h5 : ‖K.z2‖ ≤ c) (h6 : ‖K.d‖ ≤ c) :
    Fib.ip v K ≤ (‖v.e1‖ + ‖v.e2‖ + ‖v.e3‖ + ‖v.z1‖ + ‖v.z2‖ + ‖v.d‖) * c := by
  have b : ∀ u w : ℂ, ‖w‖ ≤ c → hre u w ≤ ‖u‖ * c := fun u w hw =>
    (le_abs_self _).trans ((abs_hre_le u w).trans (mul_le_mul_of_nonneg_left hw (norm_nonneg _)))
  have := b v.e1 _ h1; have := b v.e2 _ h2; have := b v.e3 _ h3
  have := b v.z1 _ h4; have := b v.z2 _ h5; have := b v.d _ h6
  simp only [Fib.ip]
  linarith

/-- The bound of the fibre expression over all responses. -/
def fibreCap (s : ℝ) : ℝ :=
  (|(E.m11 : ℝ)| + 2 * |(E.m12 : ℝ)| + 2 * |(E.m13 : ℝ)| + |(E.m22 : ℝ)| + 2 * |(E.m23 : ℝ)|
      + |(E.m33 : ℝ)| + |(R.m11 : ℝ)| + 2 * |(R.m12 : ℝ)| + |(R.m22 : ℝ)| + 1) * cq ^ 2
    + 2 * ∫ z, ‖Lf ℓ β z‖ ∂gaussC
    + 2 * |s| * ((‖a.e1‖ + ‖a.e2‖ + ‖a.e3‖ + ‖a.z1‖ + ‖a.z2‖ + ‖a.d‖) * cq)

lemma fibreExpr_le_cap {f g : ℂ → ℂ} (hfm : AEStronglyMeasurable f gaussC)
    (hgm : AEStronglyMeasurable g gaussC) (hfb : ∀ z, ‖f z‖ ≤ 1) (hgb : ∀ z, ‖g z‖ ≤ 1) (s : ℝ) :
    fibreExpr E R ℓ β a f g s ≤ fibreCap E R ℓ β a s := by
  have hkm : AEStronglyMeasurable (fun z => (f z - g z) / 2) gaussC := by fun_prop
  have hkb : ∀ z, ‖(f z - g z) / 2‖ ≤ 1 := fun z => by
    rw [norm_div, Complex.norm_two, div_le_one two_pos]
    exact (norm_sub_le _ _).trans (by linarith [hfb z, hgb z])
  have hhm : AEStronglyMeasurable (fun z => (f z + g z) / 2) gaussC := by fun_prop
  have hhb : ∀ z, ‖(f z + g z) / 2‖ ≤ 1 := fun z => by
    rw [norm_div, Complex.norm_two, div_le_one two_pos]
    exact (norm_add_le _ _).trans (by linarith [hfb z, hgb z])
  obtain ⟨c1, c2, c3, c4, c5, c6⟩ := coefFib_le hkm hkb
  have hq := Fib.quad_le E R cq _ c1 c2 c3 c4 c5 c6
  have hL := re_integral_conj_mul_le (integrable_Lf ℓ β) hhm hhb
  have hip := ip_le a _ cq c1 c2 c3 c4 c5 c6
  have hip' : -Fib.ip a (coefFib fun z => (f z - g z) / 2)
      ≤ (‖a.e1‖ + ‖a.e2‖ + ‖a.e3‖ + ‖a.z1‖ + ‖a.z2‖ + ‖a.d‖) * cq := by
    have := ip_le (a.smul (-1)) _ cq c1 c2 c3 c4 c5 c6
    have e : Fib.ip (a.smul (-1)) (coefFib fun z => (f z - g z) / 2)
        = -Fib.ip a (coefFib fun z => (f z - g z) / 2) := by
      simp only [Fib.ip, Fib.smul, hre_eq, Complex.mul_re, Complex.mul_im, Complex.ofReal_re,
        Complex.ofReal_im]
      ring
    rw [e] at this
    simpa only [Fib.smul, norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_neg, abs_one,
      one_mul] using this
  have hs : s * Fib.ip a (coefFib fun z => (f z - g z) / 2)
      ≤ |s| * ((‖a.e1‖ + ‖a.e2‖ + ‖a.e3‖ + ‖a.z1‖ + ‖a.z2‖ + ‖a.d‖) * cq) := by
    rcases le_or_gt 0 s with h | h
    · rw [abs_of_nonneg h]; exact mul_le_mul_of_nonneg_left hip h
    · rw [abs_of_neg h]; nlinarith
  unfold fibreExpr fibreCap
  linarith

/-- **`Ψ_r` is finite**: `J_r(·, s)` is bounded above. -/
theorem Jpot_le_cap (hE : E.psdOK = true) (hR : R.psdOK = true) (y : Fib) (s : ℝ) :
    Jpot E R ℓ β a y s ≤ fibreCap E R ℓ β a s := by
  refine (Jpot_le_fibreExpr E R ℓ β a hE hR y s).trans (fibreExpr_le_cap E R ℓ β a ?_ ?_ ?_ ?_ s)
  · exact (measurable_ph.comp ((continuous_Lf ℓ β).add
      (continuous_pfn E R a y s)).measurable).aestronglyMeasurable
  · exact (measurable_ph.comp ((continuous_Lf ℓ β).sub
      (continuous_pfn E R a y s)).measurable).aestronglyMeasurable
  · exact fun z => norm_ph_le _
  · exact fun z => norm_ph_le _

lemma bddAbove_Jpot (hE : E.psdOK = true) (hR : R.psdOK = true) (s : ℝ) :
    BddAbove (range fun y => Jpot E R ℓ β a y s) :=
  ⟨fibreCap E R ℓ β a s, by rintro _ ⟨y, rfl⟩; exact Jpot_le_cap E R ℓ β a hE hR y s⟩

lemma Jpot_le_pot (hE : E.psdOK = true) (hR : R.psdOK = true) (y : Fib) (s : ℝ) :
    Jpot E R ℓ β a y s ≤ pot E R ℓ β a s :=
  le_ciSup (bddAbove_Jpot E R ℓ β a hE hR s) y

/-- **The fibre bound against the potential** (S5): every pair of responses with `|f₀|, |g₀| ≤ 1`
has fibre expression at most `Ψ_r(s)`. -/
theorem fibreExpr_le_pot (hE : E.psdOK = true) (hR : R.psdOK = true) {f g : ℂ → ℂ}
    (hfm : AEStronglyMeasurable f gaussC) (hgm : AEStronglyMeasurable g gaussC)
    (hfb : ∀ z, ‖f z‖ ≤ 1) (hgb : ∀ z, ‖g z‖ ≤ 1) (s : ℝ) :
    fibreExpr E R ℓ β a f g s ≤ pot E R ℓ β a s :=
  (fibreExpr_le_Jpot E R ℓ β a hfm hgm hfb hgb s).trans (Jpot_le_pot E R ℓ β a hE hR _ s)

/-! ### Convexity and the Lipschitz bound -/

lemma Jpot_convex (y : Fib) (s t θ : ℝ) (h0 : 0 ≤ θ) (h1 : θ ≤ 1) :
    Jpot E R ℓ β a y (θ * s + (1 - θ) * t)
      ≤ θ * Jpot E R ℓ β a y s + (1 - θ) * Jpot E R ℓ β a y t := by
  have hpt : ∀ z, ‖Lf ℓ β z + pfn E R a y (θ * s + (1 - θ) * t) z‖
        + ‖Lf ℓ β z - pfn E R a y (θ * s + (1 - θ) * t) z‖
      ≤ θ * (‖Lf ℓ β z + pfn E R a y s z‖ + ‖Lf ℓ β z - pfn E R a y s z‖)
        + (1 - θ) * (‖Lf ℓ β z + pfn E R a y t z‖ + ‖Lf ℓ β z - pfn E R a y t z‖) := by
    intro z
    have e1 : Lf ℓ β z + pfn E R a y (θ * s + (1 - θ) * t) z
        = (θ : ℂ) * (Lf ℓ β z + pfn E R a y s z) + ((1 - θ : ℝ) : ℂ) * (Lf ℓ β z + pfn E R a y t z) := by
      simp only [pfn_eq]; push_cast; ring
    have e2 : Lf ℓ β z - pfn E R a y (θ * s + (1 - θ) * t) z
        = (θ : ℂ) * (Lf ℓ β z - pfn E R a y s z) + ((1 - θ : ℝ) : ℂ) * (Lf ℓ β z - pfn E R a y t z) := by
      simp only [pfn_eq]; push_cast; ring
    have n : ∀ u v : ℂ, ‖(θ : ℂ) * u + ((1 - θ : ℝ) : ℂ) * v‖ ≤ θ * ‖u‖ + (1 - θ) * ‖v‖ := by
      intro u v
      refine (norm_add_le _ _).trans (le_of_eq ?_)
      rw [norm_mul, norm_mul, Complex.norm_real, Complex.norm_real, Real.norm_eq_abs,
        Real.norm_eq_abs, abs_of_nonneg h0, abs_of_nonneg (by linarith)]
    rw [e1, e2]
    have := n (Lf ℓ β z + pfn E R a y s z) (Lf ℓ β z + pfn E R a y t z)
    have := n (Lf ℓ β z - pfn E R a y s z) (Lf ℓ β z - pfn E R a y t z)
    linarith
  have hm := integral_mono (integrable_Jint E R ℓ β a y _)
    (((integrable_Jint E R ℓ β a y s).const_mul θ).add
      ((integrable_Jint E R ℓ β a y t).const_mul (1 - θ))) hpt
  have hsum : ∫ z, (θ * (‖Lf ℓ β z + pfn E R a y s z‖ + ‖Lf ℓ β z - pfn E R a y s z‖)
        + (1 - θ) * (‖Lf ℓ β z + pfn E R a y t z‖ + ‖Lf ℓ β z - pfn E R a y t z‖)) ∂gaussC
      = θ * ∫ z, (‖Lf ℓ β z + pfn E R a y s z‖ + ‖Lf ℓ β z - pfn E R a y s z‖) ∂gaussC
        + (1 - θ) * ∫ z, (‖Lf ℓ β z + pfn E R a y t z‖ + ‖Lf ℓ β z - pfn E R a y t z‖) ∂gaussC := by
    rw [integral_add ((integrable_Jint E R ℓ β a y s).const_mul θ)
      ((integrable_Jint E R ℓ β a y t).const_mul (1 - θ)), integral_const_mul, integral_const_mul]
  have hm' := hm.trans_eq hsum
  unfold Jpot
  nlinarith [hm']

/-- **`Ψ_r` is convex.** -/
theorem pot_convexOn (hE : E.psdOK = true) (hR : R.psdOK = true) :
    ConvexOn ℝ univ (pot E R ℓ β a) := by
  refine ⟨convex_univ, fun s _ t _ θ μ h0 hμ hsum => ?_⟩
  obtain rfl : μ = 1 - θ := by linarith
  simp only [smul_eq_mul]
  refine ciSup_le fun y => (Jpot_convex E R ℓ β a y s t θ h0 (by linarith)).trans ?_
  exact add_le_add (mul_le_mul_of_nonneg_left (Jpot_le_pot E R ℓ β a hE hR y s) h0)
    (mul_le_mul_of_nonneg_left (Jpot_le_pot E R ℓ β a hE hR y t) hμ)

/-- `J_r(y, t) ≤ J_r(y, s) + 2(t − s) E|B·a|` for `s ≤ t`. -/
lemma Jpot_lip (y : Fib) (s t : ℝ) (hst : s ≤ t) :
    Jpot E R ℓ β a y t ≤ Jpot E R ℓ β a y s + 2 * (t - s) * ∫ z, ‖a.fn z‖ ∂gaussC := by
  have hA : Integrable (fun z => ‖a.fn z‖) gaussC :=
    (integrable_of_le_qw _ a.continuous_fn _ (fun z => a.norm_fn_le z)).norm
  have hpt : ∀ z, ‖Lf ℓ β z + pfn E R a y t z‖ + ‖Lf ℓ β z - pfn E R a y t z‖
      ≤ (‖Lf ℓ β z + pfn E R a y s z‖ + ‖Lf ℓ β z - pfn E R a y s z‖) + 2 * (t - s) * ‖a.fn z‖ := by
    intro z
    have e1 : Lf ℓ β z + pfn E R a y t z = (Lf ℓ β z + pfn E R a y s z) + ((t - s : ℝ) : ℂ) * a.fn z := by
      simp only [pfn_eq]; push_cast; ring
    have e2 : Lf ℓ β z - pfn E R a y t z = (Lf ℓ β z - pfn E R a y s z) - ((t - s : ℝ) : ℂ) * a.fn z := by
      simp only [pfn_eq]; push_cast; ring
    have hn : ‖((t - s : ℝ) : ℂ) * a.fn z‖ = (t - s) * ‖a.fn z‖ := by
      rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg (by linarith)]
    rw [e1, e2]
    have := norm_add_le (Lf ℓ β z + pfn E R a y s z) (((t - s : ℝ) : ℂ) * a.fn z)
    have := norm_sub_le (Lf ℓ β z - pfn E R a y s z) (((t - s : ℝ) : ℂ) * a.fn z)
    linarith
  have hm := integral_mono (integrable_Jint E R ℓ β a y t)
    ((integrable_Jint E R ℓ β a y s).add (hA.const_mul (2 * (t - s)))) hpt
  have hsum : ∫ z, ((‖Lf ℓ β z + pfn E R a y s z‖ + ‖Lf ℓ β z - pfn E R a y s z‖)
        + 2 * (t - s) * ‖a.fn z‖) ∂gaussC
      = ∫ z, (‖Lf ℓ β z + pfn E R a y s z‖ + ‖Lf ℓ β z - pfn E R a y s z‖) ∂gaussC
        + 2 * (t - s) * ∫ z, ‖a.fn z‖ ∂gaussC := by
    rw [integral_add (integrable_Jint E R ℓ β a y s) (hA.const_mul _), integral_const_mul]
  have hm' := hm.trans_eq hsum
  unfold Jpot
  linarith [hm']

/-- **The Lipschitz bound of `Ψ_r`** with constant `2 E|B·a|`. -/
theorem pot_lip (hE : E.psdOK = true) (hR : R.psdOK = true) (s t : ℝ) (hst : s ≤ t) :
    pot E R ℓ β a t ≤ pot E R ℓ β a s + 2 * (t - s) * ∫ z, ‖a.fn z‖ ∂gaussC :=
  ciSup_le fun y => (Jpot_lip E R ℓ β a y s t hst).trans
    (by linarith [Jpot_le_pot E R ℓ β a hE hR y s])

end

end Grothe.LowerAnalytic
