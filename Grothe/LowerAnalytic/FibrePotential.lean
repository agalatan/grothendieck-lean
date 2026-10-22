import Grothe.LowerAnalytic.Potential

/-!
# The fibre potential `Ψ_r` of a row (L4, S4.1–S4.5)

The certified potential (`handoff/lower-stein/cert-0745e`, GPT's
`anchored_potential_formalization.md` §1, the price layer of `pipeline/wcert`) is, for the standard
complex Gaussian `γ = gaussC` (`E|z|² = 1`), the real basis

  `B = (1, |z|²−1, z²/√2, i, i(|z|²−1), −i z²/√2, z, z(|z|²−2)/√2, iz, i z(|z|²−2)/√2, z̄, i z̄)`,

`M = diag(E, E, R, R, ε I₂)`, `a = (1 + b₁, b₂, b₃, 0, …, 0)`, `L(z) = z(ℓ + β(|z|² − 2))`,

  `Ψ_r(s) = sup_{m ∈ ℝ¹²} [∫ (|L + B·(m + s a)| + |L − B·(m + s a)|) dγ − mᵀ M⁻¹ m]`.    (1)

Here the twelve real coordinates are packed into six complex ones (`Fib`): `η = (y₀ + i y₃, y₁ + i y₄,
y₂ + i y₅)`, `ζ = (y₆ + i y₈, y₇ + i y₉)`, `d = y₁₀ + i y₁₁`, so that `B·y = η₁ + η₂(|z|² − 1) +
conj(η₃) z²/√2 + ζ₁ z + ζ₂ z(|z|² − 2)/√2 + d z̄` (`Fib.fn`), `yᵀMy = η*Eη + ζ*Rζ + ε|d|²`
(`Fib.quad`, the Hermitian forms of `RowReduction.lean`), and `m = My` (`Fib.M`): since `M` is
invertible (`E ≻ 0`, `R ≻ 0`), the supremum over `m` in (1) is the supremum over `y` of

  `J_r(y, s) = ∫ (|L + B·(My + s a)| + |L − B·(My + s a)|) dγ − yᵀMy`             (`Jpot`),

and `Ψ_r(s) = sup_y J_r(y, s)` (`pot`).  Proved here:

* `fibreExpr_le_Jpot`: for `f₀, g₀` with `|f₀|, |g₀| ≤ 1`, `h₀ = (f₀+g₀)/2`, `k₀ = (f₀−g₀)/2` and
  the coefficient vector `K = coefFib k₀` (`K_j = ∫ conj(B_j) k₀`, packed), the fibre expression
  `KᵀMK + 2 Re ∫ conj(L) h₀ + 2 s aᵀK` is at most `J_r(K, s) ≤ Ψ_r(s)` (the `≤` direction of the
  reduction to (1); the pointwise fibre bound S5 of the row reduction).
* `Jpot_le_fibreExpr`: conversely `J_r(y, s)` is the fibre expression of the phases of `L ± B·v`
  minus a nonnegative square, so `Ψ_r(s) ≤ 2 E|L| + 2s Σ|a_j| E|B_j| + Σ|M_ij| E|B_i| E|B_j|`
  (`pot_bddAbove`).
* `pot_convexOn`: `Ψ_r` is convex (a supremum of convex functions of `s`).
* `pot_lipschitz`: `Ψ_r(t) ≤ Ψ_r(s) + smax_r (t − s)` for `0 ≤ s ≤ t`, from
  `|J_r(y, t) − J_r(y, s)| ≤ 2(t − s) E|B·a| ≤ 2(t − s)(|1 + b₁| + (2/e)|b₂| + |b₃|/√2)` and the
  Lipschitz header `rowData_smaxOK` (`2/e ≤ 0.7358`, `1/√2 ≤ 0.707107`).
* `capsHold_pot`: `CapsHold (Ψ_r − capPad) r.nodeList r.smax` from the node caps alone, which are
  the data certified outside Lean (`Ψ_r(r_k) − capPad ≤ c_k`, hypothesis `hcaps`).
-/

open MeasureTheory Real Set Grothe.Lower
open scoped ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

/-! ### The fibre functions -/

/-- `|z|² − 1`. -/
def B1 (z : ℂ) : ℂ := ((Complex.normSq z - 1 : ℝ) : ℂ)
/-- `z²/√2`. -/
def B2 (z : ℂ) : ℂ := z ^ 2 / (√2 : ℝ)
/-- `z(|z|² − 2)/√2`. -/
def B4 (z : ℂ) : ℂ := z * ((Complex.normSq z - 2 : ℝ) : ℂ) / (√2 : ℝ)
/-- `L(z) = z(ℓ + β(|z|² − 2))`. -/
def Lf (ℓ β : ℝ) (z : ℂ) : ℂ := z * ((ℓ + β * (Complex.normSq z - 2) : ℝ) : ℂ)

lemma continuous_B1 : Continuous B1 := by unfold B1; fun_prop
lemma continuous_B2 : Continuous B2 := by unfold B2; fun_prop
lemma continuous_B4 : Continuous B4 := by unfold B4; fun_prop
lemma continuous_Lf (ℓ β : ℝ) : Continuous (Lf ℓ β) := by unfold Lf; fun_prop

/-- The growth weight `(1 + |z|²)²`. -/
def qw (z : ℂ) : ℝ := (1 + Complex.normSq z) ^ 2

lemma qw_nonneg (z : ℂ) : 0 ≤ qw z := sq_nonneg _

lemma norm_le_one_add_normSq (z : ℂ) : ‖z‖ ≤ 1 + Complex.normSq z := by
  rw [Complex.normSq_eq_norm_sq]; nlinarith [sq_nonneg (‖z‖ - 1)]

lemma one_add_normSq_le_qw (z : ℂ) : 1 + Complex.normSq z ≤ qw z := by
  unfold qw; nlinarith [Complex.normSq_nonneg z]

lemma norm_le_qw (z : ℂ) : ‖z‖ ≤ qw z := (norm_le_one_add_normSq z).trans (one_add_normSq_le_qw z)

lemma norm_B1_le (z : ℂ) : ‖B1 z‖ ≤ qw z := by
  rw [B1, Complex.norm_real, Real.norm_eq_abs]
  refine (abs_sub _ _).trans ?_
  rw [abs_one, abs_of_nonneg (Complex.normSq_nonneg z)]
  linarith [one_add_normSq_le_qw z]

lemma norm_B2_le (z : ℂ) : ‖B2 z‖ ≤ qw z := by
  rw [B2, norm_div, norm_pow, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg (Real.sqrt_nonneg _),
    div_le_iff₀ (by positivity), ← Complex.normSq_eq_norm_sq]
  have h1 : (1 : ℝ) ≤ √2 := by rw [Real.le_sqrt (by norm_num) (by norm_num)]; norm_num
  have h2 := one_add_normSq_le_qw z
  have h3 := Complex.normSq_nonneg z
  nlinarith [qw_nonneg z]

lemma norm_B4_le (z : ℂ) : ‖B4 z‖ ≤ 2 * qw z := by
  rw [B4, norm_div, norm_mul, Complex.norm_real, Complex.norm_real, Real.norm_eq_abs,
    Real.norm_eq_abs, abs_of_nonneg (Real.sqrt_nonneg _), div_le_iff₀ (by positivity)]
  have h1 : (1 : ℝ) ≤ √2 := by rw [Real.le_sqrt (by norm_num) (by norm_num)]; norm_num
  have h2 := norm_le_one_add_normSq z
  have h3 := Complex.normSq_nonneg z
  have h4 : |Complex.normSq z - 2| ≤ Complex.normSq z + 2 := by
    refine (abs_sub _ _).trans ?_; rw [abs_of_nonneg h3, abs_two]
  have h5 : ‖z‖ * |Complex.normSq z - 2| ≤ (1 + Complex.normSq z) * (Complex.normSq z + 2) :=
    mul_le_mul h2 h4 (abs_nonneg _) (by linarith)
  unfold qw
  nlinarith [sq_nonneg (1 + Complex.normSq z)]

lemma norm_Lf_le (ℓ β : ℝ) (z : ℂ) : ‖Lf ℓ β z‖ ≤ (|ℓ| + 3 * |β|) * qw z := by
  rw [Lf, norm_mul, Complex.norm_real, Real.norm_eq_abs]
  have h2 := norm_le_one_add_normSq z
  have h3 := Complex.normSq_nonneg z
  have h4 : |ℓ + β * (Complex.normSq z - 2)| ≤ |ℓ| + |β| * (Complex.normSq z + 2) := by
    refine (abs_add_le _ _).trans ?_
    rw [abs_mul]
    gcongr
    refine (abs_sub _ _).trans ?_; rw [abs_of_nonneg h3, abs_two]
  have h5 : ‖z‖ * |ℓ + β * (Complex.normSq z - 2)|
      ≤ (1 + Complex.normSq z) * (|ℓ| + |β| * (Complex.normSq z + 2)) :=
    mul_le_mul h2 h4 (abs_nonneg _) (by linarith)
  have h6 : (1 + Complex.normSq z) * (|ℓ| + |β| * (Complex.normSq z + 2))
      ≤ (|ℓ| + 3 * |β|) * (1 + Complex.normSq z) ^ 2 := by
    have e : (|ℓ| + 3 * |β|) * (1 + Complex.normSq z) ^ 2
        - (1 + Complex.normSq z) * (|ℓ| + |β| * (Complex.normSq z + 2))
        = (1 + Complex.normSq z) * (|ℓ| * Complex.normSq z + |β| * (2 * Complex.normSq z + 1)) := by
      ring
    have : 0 ≤ (1 + Complex.normSq z) * (|ℓ| * Complex.normSq z + |β| * (2 * Complex.normSq z + 1)) := by
      have := abs_nonneg ℓ; have := abs_nonneg β; positivity
    linarith
  unfold qw
  linarith

/-- Integrability of a continuous function with `‖F z‖ ≤ C (1 + |z|²)²`. -/
lemma integrable_of_le_qw (F : ℂ → ℂ) (hF : Continuous F) (C : ℝ) (h : ∀ z, ‖F z‖ ≤ C * qw z) :
    Integrable F gaussC :=
  integrable_gaussC_of_bound' F hF C (2 * C) C 0 fun z => (h z).trans (le_of_eq (by unfold qw; ring))

lemma integrable_of_le_qw' (F : ℂ → ℝ) (hF : Continuous F) (C : ℝ) (h : ∀ z, |F z| ≤ C * qw z) :
    Integrable F gaussC :=
  integrable_gaussC_of_bound F hF C (2 * C) C 0 fun z => (h z).trans (le_of_eq (by unfold qw; ring))

lemma integrable_qw : Integrable qw gaussC :=
  integrable_of_le_qw' qw (by unfold qw; fun_prop) 1 fun z => by
    rw [abs_of_nonneg (qw_nonneg z), one_mul]

lemma integrable_B1 : Integrable B1 gaussC := integrable_of_le_qw B1 continuous_B1 1 (by simpa using norm_B1_le)
lemma integrable_B2 : Integrable B2 gaussC := integrable_of_le_qw B2 continuous_B2 1 (by simpa using norm_B2_le)
lemma integrable_B4 : Integrable B4 gaussC := integrable_of_le_qw B4 continuous_B4 2 norm_B4_le
lemma integrable_id : Integrable (fun z : ℂ => z) gaussC :=
  integrable_of_le_qw _ continuous_id 1 (by simpa using norm_le_qw)
lemma integrable_conj : Integrable (fun z : ℂ => conj z) gaussC :=
  integrable_of_le_qw _ Complex.continuous_conj 1 (by simpa using norm_le_qw)
lemma integrable_Lf (ℓ β : ℝ) : Integrable (Lf ℓ β) gaussC :=
  integrable_of_le_qw _ (continuous_Lf ℓ β) _ (norm_Lf_le ℓ β)

/-! ### The dual variable -/

/-- The twelve real dual coordinates packed into six complex numbers. -/
structure Fib where
  e1 : ℂ
  e2 : ℂ
  e3 : ℂ
  z1 : ℂ
  z2 : ℂ
  d : ℂ

namespace Fib

/-- `B·y`. -/
def fn (v : Fib) (z : ℂ) : ℂ :=
  v.e1 + v.e2 * B1 z + conj v.e3 * B2 z + v.z1 * z + v.z2 * B4 z + v.d * conj z

def add (v w : Fib) : Fib := ⟨v.e1 + w.e1, v.e2 + w.e2, v.e3 + w.e3, v.z1 + w.z1, v.z2 + w.z2, v.d + w.d⟩
def sub (v w : Fib) : Fib := ⟨v.e1 - w.e1, v.e2 - w.e2, v.e3 - w.e3, v.z1 - w.z1, v.z2 - w.z2, v.d - w.d⟩
def smul (s : ℝ) (v : Fib) : Fib := ⟨s * v.e1, s * v.e2, s * v.e3, s * v.z1, s * v.z2, s * v.d⟩

/-- The real inner product `Σ Re(conj vᵢ wᵢ)` of `ℝ¹²`. -/
def ip (v w : Fib) : ℝ :=
  hre v.e1 w.e1 + hre v.e2 w.e2 + hre v.e3 w.e3 + hre v.z1 w.z1 + hre v.z2 w.z2 + hre v.d w.d

/-- `M y` for `M = diag(E, E, R, R, ε I₂)`. -/
def M (E : Sym3) (R : Sym2) (y : Fib) : Fib :=
  ⟨(E.m11 : ℂ) * y.e1 + (E.m12 : ℂ) * y.e2 + (E.m13 : ℂ) * y.e3,
   (E.m12 : ℂ) * y.e1 + (E.m22 : ℂ) * y.e2 + (E.m23 : ℂ) * y.e3,
   (E.m13 : ℂ) * y.e1 + (E.m23 : ℂ) * y.e2 + (E.m33 : ℂ) * y.e3,
   (R.m11 : ℂ) * y.z1 + (R.m12 : ℂ) * y.z2, (R.m12 : ℂ) * y.z1 + (R.m22 : ℂ) * y.z2,
   ((ε : ℚ) : ℂ) * y.d⟩

/-- `yᵀMy = η*Eη + ζ*Rζ + ε|d|²`. -/
def quad (E : Sym3) (R : Sym2) (y : Fib) : ℝ :=
  E.form y.e1 y.e2 y.e3 + R.form y.z1 y.z2 + ε * ‖y.d‖ ^ 2

lemma fn_add (v w : Fib) (z : ℂ) : (v.add w).fn z = v.fn z + w.fn z := by
  simp only [fn, add, map_add]; ring

lemma fn_smul (s : ℝ) (v : Fib) (z : ℂ) : (v.smul s).fn z = (s : ℂ) * v.fn z := by
  simp only [fn, smul, map_mul, Complex.conj_ofReal]; ring

lemma continuous_fn (v : Fib) : Continuous v.fn := by
  unfold fn
  exact (((((continuous_const.add (continuous_const.mul continuous_B1)).add
    (continuous_const.mul continuous_B2)).add (continuous_const.mul continuous_id)).add
    (continuous_const.mul continuous_B4)).add (continuous_const.mul Complex.continuous_conj))

lemma norm_fn_le (v : Fib) (z : ℂ) :
    ‖v.fn z‖ ≤ (‖v.e1‖ + ‖v.e2‖ + ‖v.e3‖ + ‖v.z1‖ + 2 * ‖v.z2‖ + ‖v.d‖) * qw z := by
  have h0 : (1 : ℝ) ≤ qw z := by unfold qw; nlinarith [Complex.normSq_nonneg z]
  calc ‖v.fn z‖ ≤ ‖v.e1‖ + ‖v.e2 * B1 z‖ + ‖conj v.e3 * B2 z‖ + ‖v.z1 * z‖ + ‖v.z2 * B4 z‖
        + ‖v.d * conj z‖ := by
        unfold fn
        refine (norm_add_le _ _).trans (add_le_add ?_ le_rfl)
        refine (norm_add_le _ _).trans (add_le_add ?_ le_rfl)
        refine (norm_add_le _ _).trans (add_le_add ?_ le_rfl)
        refine (norm_add_le _ _).trans (add_le_add ?_ le_rfl)
        exact norm_add_le _ _
    _ ≤ ‖v.e1‖ * qw z + ‖v.e2‖ * qw z + ‖v.e3‖ * qw z + ‖v.z1‖ * qw z + ‖v.z2‖ * (2 * qw z)
        + ‖v.d‖ * qw z := by
        simp only [norm_mul, Complex.norm_conj]
        gcongr
        · exact le_mul_of_one_le_right (norm_nonneg _) h0
        · exact norm_B1_le z
        · exact norm_B2_le z
        · exact norm_le_qw z
        · exact norm_B4_le z
        · exact norm_le_qw z
    _ = _ := by ring

end Fib

end

end Grothe.LowerAnalytic
