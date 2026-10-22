import Grothe.LowerAnalytic.GramSpectral

/-!
# The joint sixth-moment inequalities

For a circular cubic `q = a + ib` with `E a² = 1/2`, the sixth moment is bounded *in terms of the
contraction scalars* `(n, h, b, y, z)` of the complex coefficient tensor `t = gramT J a b` that
also enter the contraction-Gram budgets of the Stein cuts.  With

  `s₀ = 8n + 2h + 8b + 8z`,  `h₀ = (8/3)n + (2/3)h + (8/3)b + 24y − (16/3)z`,

`χ = E U² − 2 = (8/3)s₀ + 4h₀` and `x = √χ`, for every `α > 0`

  `E U³ ≤ 6 + 9χ + x (150α s₀ + (198 + 150/α) h₀)`                  (J2, `joint_triangle`)
  `E U³ ≤ 6 + 9χ + x ((135/2)α s₀ + (11781/32 + 135/(2α)) h₀)`      (J3, `joint_young`).

* **The normalisation** (`tenS_eq_gram`, `tenH_eq_gram`): the contraction norms of the real kernel
  `f = ∂³a/6` are `1296 s = s₀` and `1296 h = h₀`.  For `s = Σ G²`, `G = Σ f f` contracted in two
  slots: `G = Re(Σ τ τ̄ + Σ τ τ)/2` for `τ = f + ig`, i.e. `(Re(H + 2N) + 2 Re B)/18`
  (`Htau2_eq`, `Gtau2_eq`), and the cross terms vanish by charge conservation.  For
  `h = ‖Sym(f ⋆ f)‖²`: with `S₊ = Sym(f ⋆ f + g ⋆ g)`, `R = Sym(f ⋆ f − g ⋆ g)`,
  `M = Sym(f ⋆ g + g ⋆ f)`, the derivation `δ` of `CircularTensor.lean` gives `δS₊ = 0`,
  `δR = −2M`, `δM = 2R`, so `⟨S₊, R⟩ = 0` and `‖R‖² = ‖M‖²` (`δ` is antisymmetric); then
  `4h = ‖S₊‖² + ‖R‖²` with `‖S₊‖² = (h + 4n + 4b + 16T)/486` (`sum_kerS_sq`) and
  `‖R‖² + ‖M‖² = ‖Sym(τ ⋆ τ)‖² = 4y/81` (`hipV_V`).
* **Hilbert–Schmidt bounds** (`tenT4_le_sq`, `tenT3_le`, `tenQ_le`, `tenV_le_pow`):
  `T₄ ≤ h²`, `T₃ ≤ h√h`, `Q ≤ s√h`, `V ≤ s√s`, and `W = ‖U‖² ≤ √s √T₄ ≤ h√s`,
  `⟨D, U⟩ ≤ √V √W` (`Circular.lean`).
* **The completed square** `−20V + (165/2)√(VW) ≤ (5445/64)W`, and in the sixth-cumulant
  identity `κ₆/46656 = (135/2)T₃ − 20V + (135/2)Q + (165/2)⟨D,U⟩ + 45W` (`TensorFacts.wick6`)
  either `−20V ≤ 0` (J2) or the square (J3); then `√h₀ ≤ x/2`, `√s₀ ≤ 5x/8` and
  `2√(s₀h₀) ≤ α s₀ + h₀/α` (`joint_scalar`).
-/

open MvPolynomial ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

variable {ι : Type*} [Fintype ι]

/-! ### The normalisation: `1296 s = s₀` and `1296 h = h₀` -/

section normalisation

variable [DecidableEq ι] {J : ι → ι → ℝ} (hJ : IsCplx J) {f g : ι → ι → ι → ℝ}
  (hsym : ∀ a b c, tauC f g a b c = (cplxT J f g a b c + cplxT J f g a c b + cplxT J f g c b a) / 3)
  (ht : ∀ a b c, cplxT J f g a b c = cplxT J f g b a c)

local notation "𝓽" => cplxT J f g

include hJ in
/-- `Σ (Re B)² = b/2` (`Σ B B = 0` by charge). -/
lemma sum_re_sq_B : ∑ m, ∑ n, ((ctB 𝓽 m n).re) ^ 2 = gramB 𝓽 / 2 := by
  have hA : ∀ i j, J i j = -J j i := hJ.anti
  have e : ∀ w : ℂ, (w.re) ^ 2 = (Complex.normSq w + (w * w).re) / 2 := fun w => by
    simp only [Complex.normSq_apply, Complex.mul_re]; ring
  have vBB : ∀ m, ∑ n, ctB 𝓽 m n * ctB 𝓽 m n = 0 := fun m =>
    Chg.sum_mul_eq_zero hA (chg_B2 hJ f g m) (chg_B2 hJ f g m) two_I_ne_zero
  have r : ∑ m, ∑ n, (ctB 𝓽 m n * ctB 𝓽 m n).re = 0 := by
    simp only [← Complex.re_sum, vBB, Complex.zero_re, Finset.sum_const_zero]
  simp only [e, ← Finset.sum_div, Finset.sum_add_distrib, r, add_zero, gramB]

include hJ in
/-- `Σ Re(H + 2N) Re B = 0` (charge conservation in one slot of each pairing). -/
lemma sum_re_K_re_B :
    ∑ m, ∑ n, (ctH 𝓽 m n + 2 * ctN 𝓽 m n).re * (ctB 𝓽 m n).re = 0 := by
  have hA : ∀ i j, J i j = -J j i := hJ.anti
  have cB1 : ∀ e, Chg J (-Complex.I) (fun b => conj (ctB 𝓽 b e)) := fun e => by
    simpa only [Complex.conj_I] using (chg_B1 hJ f g e).conj
  have cB2 : ∀ b, Chg J (-Complex.I) (fun e => conj (ctB 𝓽 b e)) := fun b => by
    simpa only [Complex.conj_I] using (chg_B2 hJ f g b).conj
  have vHB : ∑ m, ∑ n, ctH 𝓽 m n * ctB 𝓽 m n = 0 := Finset.sum_eq_zero fun m _ =>
    Chg.sum_mul_eq_zero hA (chg_H2 hJ f g m) (chg_B2 hJ f g m) two_I_ne_zero
  have vNB : ∑ m, ∑ n, ctN 𝓽 m n * ctB 𝓽 m n = 0 := by
    rw [Finset.sum_comm]
    exact Finset.sum_eq_zero fun n _ =>
      Chg.sum_mul_eq_zero hA (chg_N1 hJ f g n) (chg_B1 hJ f g n) two_I_ne_zero
  have vHcB : ∑ m, ∑ n, ctH 𝓽 m n * conj (ctB 𝓽 m n) = 0 := by
    rw [Finset.sum_comm]
    exact Finset.sum_eq_zero fun n _ =>
      Chg.sum_mul_eq_zero hA (chg_H1 hJ f g n) (cB1 n) neg_two_I_ne_zero
  have vNcB : ∑ m, ∑ n, ctN 𝓽 m n * conj (ctB 𝓽 m n) = 0 := Finset.sum_eq_zero fun m _ =>
    Chg.sum_mul_eq_zero hA (chg_N2 hJ f g m) (cB2 m) neg_two_I_ne_zero
  have e : ∀ m n, (ctH 𝓽 m n + 2 * ctN 𝓽 m n).re * (ctB 𝓽 m n).re
      = ((ctH 𝓽 m n * ctB 𝓽 m n).re + 2 * (ctN 𝓽 m n * ctB 𝓽 m n).re
        + (ctH 𝓽 m n * conj (ctB 𝓽 m n)).re + 2 * (ctN 𝓽 m n * conj (ctB 𝓽 m n)).re) / 2 :=
    fun m n => by
      simp only [Complex.add_re, Complex.mul_re, Complex.conj_re, Complex.conj_im,
        Complex.re_ofNat, Complex.im_ofNat]
      ring
  have r1 : ∑ m, ∑ n, (ctH 𝓽 m n * ctB 𝓽 m n).re = 0 := by
    simp only [← Complex.re_sum, vHB, Complex.zero_re]
  have r2 : ∑ m, ∑ n, (ctN 𝓽 m n * ctB 𝓽 m n).re = 0 := by
    simp only [← Complex.re_sum, vNB, Complex.zero_re]
  have r3 : ∑ m, ∑ n, (ctH 𝓽 m n * conj (ctB 𝓽 m n)).re = 0 := by
    simp only [← Complex.re_sum, vHcB, Complex.zero_re]
  have r4 : ∑ m, ∑ n, (ctN 𝓽 m n * conj (ctB 𝓽 m n)).re = 0 := by
    simp only [← Complex.re_sum, vNcB, Complex.zero_re]
  simp only [e, ← Finset.sum_div, Finset.sum_add_distrib, ← Finset.mul_sum, r1, r2, r3, r4]
  ring

include hJ hsym ht in
/-- **`1296 s = s₀`**: `s = ‖G‖² = (h + 4n + 4z + 4b)/648` for the real part `f` of `τ`, fully
symmetric. -/
theorem tenS_eq_gram (h13 : ∀ a b c, f c b a = f a b c) :
    1296 * tenS f = 8 * gramN 𝓽 + 2 * gramH 𝓽 + 8 * gramB 𝓽 + 8 * gramZ 𝓽 := by
  have hG : ∀ c d, kerG f c d = ((ctH 𝓽 c d + 2 * ctN 𝓽 c d).re + 2 * (ctB 𝓽 c d).re) / 18 := by
    intro c d
    have e1 : kerG f c d = kerGs f f c d := by
      simp only [kerG, kerGs]
      exact Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => by
        rw [← h13 a b c, ← h13 a b d]
    have e2 := Htau2_re f g c d
    have e3 := Gtau2_re f g c d
    rw [Htau2_eq hJ hsym c d, Complex.div_ofNat_re] at e2
    rw [Gtau2_eq hJ hsym ht c d, Complex.div_ofNat_re] at e3
    have e4 : (2 * ctB 𝓽 c d).re = 2 * (ctB 𝓽 c d).re := by
      simp only [Complex.mul_re, Complex.re_ofNat, Complex.im_ofNat]; ring
    rw [e4] at e3
    rw [e1]; linarith
  have hK := sum_re_sq_K hJ (f := f) (g := g)
  have hB := sum_re_sq_B hJ (f := f) (g := g)
  have hKB := sum_re_K_re_B hJ (f := f) (g := g)
  have e : ∀ c d, kerG f c d ^ 2 = ((ctH 𝓽 c d + 2 * ctN 𝓽 c d).re ^ 2
      + 4 * ((ctH 𝓽 c d + 2 * ctN 𝓽 c d).re * (ctB 𝓽 c d).re) + 4 * (ctB 𝓽 c d).re ^ 2) / 324 :=
    fun c d => by rw [hG]; ring
  simp only [tenS, e, ← Finset.sum_div, Finset.sum_add_distrib, ← Finset.mul_sum, hK, hB, hKB]
  ring

include hJ hsym ht in
/-- **`1296 h = h₀`**: with `S₊ = Sym(f ⋆ f + g ⋆ g)`, `R = Sym(f ⋆ f − g ⋆ g)`,
`M = Sym(g ⋆ f + f ⋆ g)`: `δS₊ = 0`, `δR = −2M`, `δM = 2R`, hence `⟨S₊, R⟩ = 0`, `‖R‖² = ‖M‖²`,
`4h = ‖S₊‖² + ‖R‖²`, `‖S₊‖² = (h + 4n + 4b + 16T)/486`, `‖R‖² + ‖M‖² = 4y/81`. -/
theorem tenH_eq_gram (hf : ∀ a b c, f a b c = f b a c) (hg : ∀ a b c, g a b c = g b a c)
    (hdf : der3 J f = -g) (hdg : der3 J g = f) :
    1296 * tenH f = 8 / 3 * gramN 𝓽 + 2 / 3 * gramH 𝓽 + 8 / 3 * gramB 𝓽 + 24 * gramY 𝓽
      - 16 / 3 * gramZ 𝓽 := by
  obtain ⟨M, hM⟩ : ∃ M : T4 ι, M = sym4 (con g f + con f g) := ⟨_, rfl⟩
  obtain ⟨R, hR⟩ : ∃ R : T4 ι, R = kerS f - kerS g := ⟨_, rfl⟩
  obtain ⟨Sp, hSp⟩ : ∃ Sp : T4 ι, Sp = kerS f + kerS g := ⟨_, rfl⟩
  have d1 : der4 J (kerS f) = -M := by
    rw [hM, kerS_eq_sym4, der4_sym4, der4_con hJ, hdf, con_neg_left, con_neg_right, ← neg_add,
      sym4_neg]
  have d2 : der4 J (kerS g) = M := by
    rw [hM, kerS_eq_sym4, der4_sym4, der4_con hJ, hdg, add_comm]
  have dM : der4 J M = (2 : ℝ) • R := by
    rw [hM, hR, der4_sym4, map_add, der4_con hJ, der4_con hJ, hdf, hdg, con_neg_left,
      con_neg_right, show con f f + -con g g + (-con g g + con f f) = (2 : ℝ) • (con f f - con g g)
        by module, sym4_smul, sym4_sub, kerS_eq_sym4, kerS_eq_sym4]
  have dSp : der4 J Sp = 0 := by rw [hSp, map_add, d1, d2, neg_add_cancel]
  have dR : der4 J R = -((2 : ℝ) • M) := by rw [hR, map_sub, d1, d2]; module
  have hSR : ip4 Sp R = 0 := by
    have h := ip4_der4 hJ Sp M
    rw [dSp, dM, ip4_smul_right] at h
    have h0 : ip4 (0 : T4 ι) M = 0 := by simp [ip4]
    rw [h0] at h
    linarith
  have hRR : ip4 R R = ip4 M M := by
    have h := ip4_der4 hJ M R
    rw [dM, dR, ip4_smul_left, ip4_neg_right, ip4_smul_right] at h
    linarith
  have hk : kerS f = (1 / 2 : ℝ) • (Sp + R) := by
    rw [hSp, hR]; module
  have h4 : tenH f = (ip4 Sp Sp + ip4 R R) / 4 := by
    rw [tenH_eq_ip4, hk, ip4_smul_left, ip4_smul_right, ip4_add_left, ip4_add_right,
      ip4_add_right, ip4_comm R Sp, hSR]
    ring
  have hS2 : ip4 Sp Sp = (gramH 𝓽 + 4 * gramN 𝓽 + 4 * gramB 𝓽 + 16 * gramT0 𝓽) / 486 := by
    rw [← sum_kerS_sq hJ f g hsym ht hf hg, hSp]
    simp only [ip4, Pi.add_apply, sq]
  have hV := hipV_V hJ f g hsym ht
  rw [hip_self_re] at hV
  have hre : ∀ a b c d, (csym4 (ccon (tauC f g) (tauC f g)) a b c d).re = R a b c d :=
    fun a b c d => by
      rw [csym4_re, hR]
      simp only [sym4, ccon_tauC_re, Pi.sub_apply, kerS_eq_sym4]; ring
  have him : ∀ a b c d, (csym4 (ccon (tauC f g) (tauC f g)) a b c d).im = M a b c d :=
    fun a b c d => by
      rw [csym4_im, hM]
      simp only [sym4, ccon_tauC_im, Pi.add_apply]; ring
  have hRM : ip4 R R + ip4 M M = 4 / 81 * gramY 𝓽 := by
    rw [← hV]
    simp only [ip4, Complex.normSq_apply, hre, him, ← Finset.sum_add_distrib]
  have hY := gramY_eq ht (t := 𝓽)
  rw [h4, hS2]
  linear_combination 162 * hRR + 162 * hRM - 16 * hY
end normalisation

/-! ### Hilbert–Schmidt bounds -/

section hs

variable (f : ι → ι → ι → ℝ) (hf : ∀ a b c, f a b c = f b a c)
include hf

/-- `T₄ = ‖S²‖² ≤ ‖S‖⁴ = h²`. -/
lemma tenT4_le_sq : tenT4 f ≤ tenH f ^ 2 := by
  have hcs : ∀ a b c d, kerS2 f a b c d ^ 2
      ≤ (∑ e, ∑ e', kerS f a b e e' ^ 2) * (∑ e, ∑ e', kerS f c d e e' ^ 2) := by
    intro a b c d
    have h := Finset.sum_mul_sq_le_sq_mul_sq (Finset.univ : Finset (ι × ι))
      (fun p => kerS f a b p.1 p.2) (fun p => kerS f p.1 p.2 c d)
    simp only [Fintype.sum_prod_type] at h
    have e : ∀ e e', kerS f e e' c d = kerS f c d e e' := fun e e' => kerS_swap f hf e e' c d
    simp only [e] at h
    unfold kerS2
    simp only [e]
    exact h
  calc tenT4 f ≤ ∑ a, ∑ b, ∑ c, ∑ d,
        (∑ e, ∑ e', kerS f a b e e' ^ 2) * (∑ e, ∑ e', kerS f c d e e' ^ 2) := by
        unfold tenT4
        gcongr with a _ b _ c _ d _
        exact hcs a b c d
    _ = ∑ a, ∑ b, (∑ e, ∑ e', kerS f a b e e' ^ 2)
          * (∑ c, ∑ d, ∑ e, ∑ e', kerS f c d e e' ^ 2) := by
        refine Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => ?_
        rw [Finset.mul_sum]
        exact Finset.sum_congr rfl fun c _ => by rw [Finset.mul_sum]
    _ = tenH f ^ 2 := by
        rw [sq, tenH, Finset.sum_mul]
        exact Finset.sum_congr rfl fun a _ => by rw [Finset.sum_mul]

/-- `T₃ = ⟨S², S⟩ ≤ ‖S²‖ ‖S‖ ≤ h √h`. -/
lemma tenT3_le : tenT3 f ≤ tenH f * √(tenH f) := by
  have h1 : tenT3 f ≤ √(tenT4 f) * √(tenH f) := by
    refine le_sqrt_mul_sqrt_of_sq_le (tenT4_nonneg f) ?_
    have e : tenT3 f = ∑ a, ∑ b, ∑ c, ∑ d, kerS2 f a b c d * kerS f a b c d := by
      unfold tenT3
      exact Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ =>
        Finset.sum_congr rfl fun c _ => Finset.sum_congr rfl fun d _ => by
          rw [kerS_swap f hf c d a b]
    rw [e, tenT4, tenH, sum4_eq, sum4_eq, sum4_eq]
    exact Finset.sum_mul_sq_le_sq_mul_sq _ _ _
  have h2 : √(tenT4 f) ≤ tenH f := by
    rw [Real.sqrt_le_left (tenH_nonneg f)]
    exact tenT4_le_sq f hf
  calc tenT3 f ≤ √(tenT4 f) * √(tenH f) := h1
    _ ≤ tenH f * √(tenH f) := mul_le_mul_of_nonneg_right h2 (Real.sqrt_nonneg _)

/-- `W = ‖U‖² ≤ √s √T₄ ≤ h √s`. -/
lemma tenU2_le_hs : tenU2 f ≤ tenH f * √(tenS f) := by
  have h2 : √(tenT4 f) ≤ tenH f := by
    rw [Real.sqrt_le_left (tenH_nonneg f)]
    exact tenT4_le_sq f hf
  calc tenU2 f ≤ √(tenS f) * √(tenT4 f) := tenU2_le f hf
    _ ≤ √(tenS f) * tenH f := mul_le_mul_of_nonneg_left h2 (Real.sqrt_nonneg _)
    _ = tenH f * √(tenS f) := mul_comm _ _

omit hf in
/-- `Q = ⟨vec G, S vec G⟩ ≤ ‖S‖ ‖G‖² = s √h`. -/
lemma tenQ_le : tenQ f ≤ tenS f * √(tenH f) := by
  obtain ⟨w, hw⟩ : ∃ w : ι → ι → ℝ, w = fun a b => ∑ c, ∑ d, kerS f a b c d * kerG f c d :=
    ⟨_, rfl⟩
  have eQ : tenQ f = ∑ a, ∑ b, kerG f a b * w a b := by
    unfold tenQ
    rw [hw]
    exact Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => by
      simp only [Finset.mul_sum]
      exact Finset.sum_congr rfl fun c _ => Finset.sum_congr rfl fun d _ => by ring
  have hw2 : ∑ a, ∑ b, w a b ^ 2 ≤ tenH f * tenS f := by
    have hcs : ∀ a b, w a b ^ 2 ≤ (∑ c, ∑ d, kerS f a b c d ^ 2) * tenS f := by
      intro a b
      have h := Finset.sum_mul_sq_le_sq_mul_sq (Finset.univ : Finset (ι × ι))
        (fun p => kerS f a b p.1 p.2) (fun p => kerG f p.1 p.2)
      simp only [Fintype.sum_prod_type] at h
      rw [hw]
      exact h
    calc ∑ a, ∑ b, w a b ^ 2 ≤ ∑ a, ∑ b, (∑ c, ∑ d, kerS f a b c d ^ 2) * tenS f := by
          gcongr with a _ b _
          exact hcs a b
      _ = tenH f * tenS f := by simp only [tenH, ← Finset.sum_mul]
  have h1 : tenQ f ≤ √(tenS f) * √(tenH f * tenS f) := by
    refine le_sqrt_mul_sqrt_of_sq_le (tenS_nonneg f) ?_
    rw [eQ]
    have h := Finset.sum_mul_sq_le_sq_mul_sq (Finset.univ : Finset (ι × ι))
      (fun p => kerG f p.1 p.2) (fun p => w p.1 p.2)
    simp only [Fintype.sum_prod_type] at h
    refine h.trans ?_
    exact mul_le_mul_of_nonneg_left hw2 (tenS_nonneg f)
  calc tenQ f ≤ √(tenS f) * √(tenH f * tenS f) := h1
    _ = tenS f * √(tenH f) := by
        rw [Real.sqrt_mul (tenH_nonneg f), mul_comm (√(tenH f)), ← mul_assoc,
          Real.mul_self_sqrt (tenS_nonneg f)]

end hs

/-- `V ≤ s √s` from the cubic-trace bound `V² ≤ s³ (1 + 2r)²(1 − r)/2`, `r = η/s ≥ 0`
(`(1 + 2r)²(1 − r) ≤ 2` since `2 − (1 + 2r)²(1 − r) = (1 + r)(1 − 2r)²`). -/
lemma tenV_le_of_trace {V s η : ℝ} (hs : 0 < s) (hη : 0 ≤ η)
    (h : V ^ 2 ≤ s ^ 3 * ((1 + 2 * (η / s)) ^ 2 * (1 - η / s) / 2)) : V ≤ s * √s := by
  have hr : 0 ≤ η / s := div_nonneg hη hs.le
  have hq : (1 + 2 * (η / s)) ^ 2 * (1 - η / s) / 2 ≤ 1 := by
    nlinarith [mul_nonneg (by linarith : (0 : ℝ) ≤ 1 + η / s) (sq_nonneg (1 - 2 * (η / s)))]
  have h2 : V ^ 2 ≤ (s * √s) ^ 2 := by
    rw [mul_pow, Real.sq_sqrt hs.le]
    calc V ^ 2 ≤ s ^ 3 * ((1 + 2 * (η / s)) ^ 2 * (1 - η / s) / 2) := h
      _ ≤ s ^ 3 * 1 := mul_le_mul_of_nonneg_left hq (by positivity)
      _ = s ^ 2 * s := by ring
  exact le_of_sq_le_sq' (by positivity) h2

/-! ### The scalar step: `√h₀ ≤ x/2`, `√s₀ ≤ 5x/8`, `2√(s₀h₀) ≤ α s₀ + h₀/α` -/

/-- For `s₀, h₀ ≥ 0` with `x² = (8/3)s₀ + 4h₀`, `x ≥ 0`, `α > 0` and `c₁, c₂, c₃ ≥ 0`:
`c₁ h₀√h₀ + c₂ s₀√h₀ + c₃ h₀√s₀ ≤ x ((5c₂/16) α s₀ + (c₁/2 + 5c₂/(16α) + 5c₃/8) h₀)`. -/
lemma joint_scalar {s0 h0 x al c1 c2 c3 : ℝ} (hs : 0 ≤ s0) (hh : 0 ≤ h0) (hx : 0 ≤ x)
    (hχ : x ^ 2 = 8 / 3 * s0 + 4 * h0) (hal : 0 < al) (h1 : 0 ≤ c1) (h2 : 0 ≤ c2) (h3 : 0 ≤ c3) :
    c1 * (h0 * √h0) + c2 * (s0 * √h0) + c3 * (h0 * √s0)
      ≤ x * (5 * c2 / 16 * al * s0 + (c1 / 2 + 5 * c2 / (16 * al) + 5 * c3 / 8) * h0) := by
  obtain ⟨p, hp0, rfl⟩ : ∃ p, 0 ≤ p ∧ p ^ 2 = s0 := ⟨√s0, Real.sqrt_nonneg _, Real.sq_sqrt hs⟩
  obtain ⟨q, hq0, rfl⟩ : ∃ q, 0 ≤ q ∧ q ^ 2 = h0 := ⟨√h0, Real.sqrt_nonneg _, Real.sq_sqrt hh⟩
  rw [Real.sqrt_sq hp0, Real.sqrt_sq hq0]
  have hq : q ≤ x / 2 := by nlinarith [sq_nonneg p, sq_nonneg (x / 2 - q)]
  have hp : p ≤ 5 * x / 8 := by nlinarith [sq_nonneg q, sq_nonneg (5 * x / 8 - p)]
  have hpq : 2 * (p * q) ≤ al * p ^ 2 + q ^ 2 / al := by
    have e : al * p ^ 2 + q ^ 2 / al - 2 * (p * q) = (al * p - q) ^ 2 / al := by
      field_simp; ring
    have : 0 ≤ (al * p - q) ^ 2 / al := div_nonneg (sq_nonneg _) hal.le
    linarith
  have t1 : c1 * (q ^ 2 * q) ≤ c1 * (q ^ 2 * (x / 2)) :=
    mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left hq (sq_nonneg q)) h1
  have t3 : c3 * (q ^ 2 * p) ≤ c3 * (q ^ 2 * (5 * x / 8)) :=
    mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left hp (sq_nonneg q)) h3
  have t2 : c2 * (p ^ 2 * q) ≤ c2 * (5 * x / 8 * ((al * p ^ 2 + q ^ 2 / al) / 2)) := by
    have e : p ^ 2 * q = p * (p * q) := by ring
    rw [e]
    refine mul_le_mul_of_nonneg_left ?_ h2
    calc p * (p * q) ≤ 5 * x / 8 * (p * q) :=
          mul_le_mul_of_nonneg_right hp (mul_nonneg hp0 hq0)
      _ ≤ 5 * x / 8 * ((al * p ^ 2 + q ^ 2 / al) / 2) :=
          mul_le_mul_of_nonneg_left (by linarith) (by linarith)
  have e : x * (5 * c2 / 16 * al * p ^ 2 + (c1 / 2 + 5 * c2 / (16 * al) + 5 * c3 / 8) * q ^ 2)
      = c1 * (q ^ 2 * (x / 2)) + c2 * (5 * x / 8 * ((al * p ^ 2 + q ^ 2 / al) / 2))
        + c3 * (q ^ 2 * (5 * x / 8)) := by
    field_simp; ring
  rw [e]
  linarith

/-! ### The joint inequalities for a circular cubic -/

/-- `s₀ = 8n + 2h + 8b + 8z`. -/
def jointS0 (t : ι → ι → ι → ℂ) : ℝ := 8 * gramN t + 2 * gramH t + 8 * gramB t + 8 * gramZ t

/-- `h₀ = (8/3)n + (2/3)h + (8/3)b + 24y − (16/3)z`. -/
def jointH0 (t : ι → ι → ι → ℂ) : ℝ :=
  8 / 3 * gramN t + 2 / 3 * gramH t + 8 / 3 * gramB t + 24 * gramY t - 16 / 3 * gramZ t

/-- The coefficient of `s₀` in (J2) (`young = false`: `150α`) or (J3) (`young = true`:
`(135/2)α`). -/
def jointA (young : Bool) (al : ℝ) : ℝ := if young then 135 / 2 * al else 150 * al

/-- The coefficient of `h₀` in (J2) (`198 + 150/α`) or (J3) (`11781/32 + 135/(2α)`). -/
def jointB (young : Bool) (al : ℝ) : ℝ :=
  if young then 11781 / 32 + 135 / (2 * al) else 198 + 150 / al

omit [Fintype ι] in
lemma cubicKernel_symm13 (F : MvPolynomial ι ℝ) (i j k : ι) :
    cubicKernel F k j i = cubicKernel F i j k := by
  unfold cubicKernel; rw [kern_rev]

section circular

variable [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ} (hE : IsGaussianExpectation E)
  {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ} (ha : Chaos3 a) (hc : Circular J a b)
include hc

/-- `s₀ = 1296 s` for the kernel of `a`. -/
lemma Circular.jointS0_eq : jointS0 (gramT J a b) = 1296 * tenS (cubicKernel a) :=
  (tenS_eq_gram hc.isCplx hc.tauC_eq (gramT_symm12 J a b) (cubicKernel_symm13 a)).symm

/-- `h₀ = 1296 h` for the kernel of `a`. -/
lemma Circular.jointH0_eq : jointH0 (gramT J a b) = 1296 * tenH (cubicKernel a) :=
  (tenH_eq_gram hc.isCplx hc.tauC_eq (gramT_symm12 J a b) (cubicKernel_symm12 a)
    (cubicKernel_symm12 b) hc.der3_left hc.der3_right).symm

lemma Circular.jointS0_nonneg : 0 ≤ jointS0 (gramT J a b) := by
  rw [hc.jointS0_eq]; exact mul_nonneg (by norm_num) (tenS_nonneg _)

lemma Circular.jointH0_nonneg : 0 ≤ jointH0 (gramT J a b) := by
  rw [hc.jointH0_eq]; exact mul_nonneg (by norm_num) (tenH_nonneg _)

include hE ha

/-- **The joint sixth-moment inequalities (J2), (J3)** for a circular cubic `q = a + ib` with
`a` in the third chaos and `E a² = 1/2`: with `χ = E U² − 2`, for every `α > 0`,
`E U³ ≤ 6 + 9χ + √χ (A s₀ + B h₀)` with `(A, B) = (150α, 198 + 150/α)` or
`((135/2)α, 11781/32 + 135/(2α))`. -/
theorem Circular.joint_sixth (haa : E (a * a) = 1 / 2) (young : Bool) {al : ℝ} (hal : 0 < al) :
    E (radU a b ^ 3) ≤ 6 + 9 * (E (radU a b ^ 2) - 2) + √(E (radU a b ^ 2) - 2)
      * (jointA young al * jointS0 (gramT J a b) + jointB young al * jointH0 (gramT J a b)) := by
  have hT := Circular.tensorFacts hE ha hc
  have hf := cubicKernel_symm12 a
  have ha2 : E (a ^ 2) = 1 / 2 := by rw [sq]; exact haa
  have ha4 := hc.gE_pow_four hE
  have ha6 := hc.gE_pow_six hE
  have hs : 0 < tenS (cubicKernel a) := by
    apply tenS_pos
    have := ha.gE_sq_eq_kernel hE
    rw [haa] at this
    linarith
  obtain ⟨s, hsd⟩ : ∃ s, s = tenS (cubicKernel a) := ⟨_, rfl⟩
  obtain ⟨h, hhd⟩ : ∃ h, h = tenH (cubicKernel a) := ⟨_, rfl⟩
  have hh : 0 ≤ h := hhd ▸ tenH_nonneg _
  rw [← hsd] at hs
  -- the cumulants
  have w4 := hT.wick4
  have w6 := hT.wick6
  rw [ha4, ha2, ← hsd, ← hhd] at w4
  rw [ha6, ha4, ha2] at w6
  -- the tensor bounds
  have bT3 : tenT3 (cubicKernel a) ≤ h * √h := hhd ▸ tenT3_le _ hf
  have bQ : tenQ (cubicKernel a) ≤ s * √h := hsd ▸ hhd ▸ tenQ_le _
  have bW : tenU2 (cubicKernel a) ≤ h * √s := hsd ▸ hhd ▸ tenU2_le_hs _ hf
  have bV : tenV (cubicKernel a) ≤ s * √s := by
    have := tenV_le_of_trace (hsd ▸ hs) (tenGa_nonneg _ J) hT.cubicTrace
    rwa [← hsd] at this
  have bDU := tenDU_le (cubicKernel a)
  have hV0 := tenV_nonneg (cubicKernel a)
  have hW0 := tenU2_nonneg (cubicKernel a)
  obtain ⟨V, hVd⟩ : ∃ V, V = tenV (cubicKernel a) := ⟨_, rfl⟩
  obtain ⟨W, hWd⟩ : ∃ W, W = tenU2 (cubicKernel a) := ⟨_, rfl⟩
  rw [← hVd, ← hWd] at w6 bDU
  rw [← hVd] at bV hV0
  rw [← hWd] at bW hW0
  -- `√V √W ≤ s √h`
  have hVW : √V * √W ≤ s * √h := by
    rw [← Real.sqrt_mul hV0]
    have hp : V * W ≤ (s * √h) ^ 2 := by
      calc V * W ≤ (s * √s) * (h * √s) := mul_le_mul bV bW hW0 (by positivity)
        _ = s * h * (√s * √s) := by ring
        _ = (s * √h) ^ 2 := by rw [Real.mul_self_sqrt hs.le, mul_pow, Real.sq_sqrt hh]; ring
    calc √(V * W) ≤ √((s * √h) ^ 2) := Real.sqrt_le_sqrt hp
      _ = s * √h := Real.sqrt_sq (by positivity)
  -- the completed square `−20V + (165/2)√V√W ≤ (5445/64)W`
  have hsq : -20 * V + 165 / 2 * (√V * √W) ≤ 5445 / 64 * W := by
    have h1 := sq_nonneg (√V - 33 / 16 * √W)
    have h2 := Real.sq_sqrt hV0
    have h3 := Real.sq_sqrt hW0
    nlinarith
  -- the bound on `κ₆` in `s, h`
  have hk : ∀ c1 c2 c3 : ℝ, (young = true → c1 = 135 / 2 ∧ c2 = 135 / 2 ∧ c3 = 8325 / 64) →
      (young = false → c1 = 135 / 2 ∧ c2 = 150 ∧ c3 = 45) →
      (5 / 16 * (E (radU a b ^ 3)) - 15 * (3 / 8 * E (radU a b ^ 2)) * (1 / 2)
          + 30 * (1 / 2) ^ 3) / 46656
        ≤ c1 * (h * √h) + c2 * (s * √h) + c3 * (h * √s) := by
    intro c1 c2 c3 hy hn
    rw [w6]
    have hDU : 165 / 2 * tenDU (cubicKernel a) ≤ 165 / 2 * (√V * √W) := by linarith
    cases young
    · obtain ⟨rfl, rfl, rfl⟩ := hn rfl
      nlinarith
    · obtain ⟨rfl, rfl, rfl⟩ := hy rfl
      nlinarith
  -- the normalisation
  have e0 := hc.jointS0_eq
  have e1 := hc.jointH0_eq
  rw [← hsd] at e0
  rw [← hhd] at e1
  have hm : E (radU a b ^ 2) - 2 = 8 / 3 * jointS0 (gramT J a b) + 4 * jointH0 (gramT J a b) := by
    rw [e0, e1]; linarith
  have hχ0 : 0 ≤ E (radU a b ^ 2) - 2 := by rw [hm, e0, e1]; positivity
  have sqh : √(jointH0 (gramT J a b)) = 36 * √h := by
    rw [e1, Real.sqrt_mul (by norm_num), show (1296 : ℝ) = 36 ^ 2 by norm_num,
      Real.sqrt_sq (by norm_num)]
  have sqs : √(jointS0 (gramT J a b)) = 36 * √s := by
    rw [e0, Real.sqrt_mul (by norm_num), show (1296 : ℝ) = 36 ^ 2 by norm_num,
      Real.sqrt_sq (by norm_num)]
  have hx : √(E (radU a b ^ 2) - 2) ^ 2 = 8 / 3 * jointS0 (gramT J a b) + 4 * jointH0 (gramT J a b) := by
    rw [Real.sq_sqrt hχ0, hm]
  have hm' : 9 * E (radU a b ^ 2) - 12 = 6 + 9 * (E (radU a b ^ 2) - 2) := by ring
  cases young
  · have hb := hk (135 / 2) 150 45 (by simp) (fun _ => ⟨rfl, rfl, rfl⟩)
    have hj := joint_scalar hc.jointS0_nonneg hc.jointH0_nonneg (Real.sqrt_nonneg _) hx hal
      (c1 := 216) (c2 := 480) (c3 := 144) (by norm_num) (by norm_num) (by norm_num)
    rw [sqh, sqs, e0, e1] at hj
    simp only [jointA, jointB, Bool.false_eq_true, ↓reduceIte]
    rw [e0, e1]
    have e : 5 * 480 / 16 * al = 150 * al ∧ 216 / 2 + 5 * 480 / (16 * al) + 5 * 144 / 8
        = 198 + 150 / al := by
      constructor
      · ring
      · field_simp; ring
    rw [e.1, e.2] at hj
    linear_combination (46656 * 16 / 5) * hb + hj
  · have hb := hk (135 / 2) (135 / 2) (8325 / 64) (fun _ => ⟨rfl, rfl, rfl⟩) (by simp)
    have hj := joint_scalar hc.jointS0_nonneg hc.jointH0_nonneg (Real.sqrt_nonneg _) hx hal
      (c1 := 216) (c2 := 216) (c3 := 1665 / 4) (by norm_num) (by norm_num) (by norm_num)
    rw [sqh, sqs, e0, e1] at hj
    simp only [jointA, jointB, ↓reduceIte]
    rw [e0, e1]
    have e : 5 * 216 / 16 * al = 135 / 2 * al ∧ 216 / 2 + 5 * 216 / (16 * al) + 5 * (1665 / 4) / 8
        = 11781 / 32 + 135 / (2 * al) := by
      constructor
      · ring
      · field_simp; ring
    rw [e.1, e.2] at hj
    linear_combination (46656 * 16 / 5) * hb + hj

end circular

end

end Grothe.LowerAnalytic
