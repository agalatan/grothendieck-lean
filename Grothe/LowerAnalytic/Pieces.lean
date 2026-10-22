import Grothe.LowerAnalytic.Tensor

/-!
# The six mixed pieces of `H₂,₁(n+1)` and the bound on `‖P₂,₁ k‖²` (L4, INFRA-D)

`T j r = B_j(z) ⊗ r(y)` (`fibreB j` the orthonormal fibre functions): an isometry `L2G n → L2G (n+1)`
with `⟪T i r, T j s⟫ = δ_ij ⟪r, s⟫` (`inner_T`), and `⟪T j r, u⟫ = ⟪r, c_j[k]⟫` for a measurable
representative `k` of `u` with `|k| ≤ 1`, where `c_j[k](y) = ∫ conj(B_j z) k(joinR z y) dz` (`cf`,
`cfL`, `inner_T_left`).
-/

open MeasureTheory ProbabilityTheory Real Set Grothe.Lower
open scoped ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

variable {n : ℕ}

/-! ### The fibre functions in `L²(gaussC)` -/

lemma continuous_fibreB (j : Fin 6) : Continuous (fibreB j) := by
  fin_cases j
  · exact continuous_const
  · exact continuous_fB1
  · exact continuous_fB2
  · exact continuous_id
  · exact continuous_fB4
  · exact Complex.continuous_conj

lemma norm_sq_fibreB_le (j : Fin 6) (z : ℂ) :
    ‖fibreB j z‖ ^ 2 ≤ (1 + Complex.normSq z) ^ 3 := by
  have hN := Complex.normSq_nonneg z
  have hz : ‖z‖ ^ 2 = Complex.normSq z := (Complex.normSq_eq_norm_sq z).symm
  have hs : (√2 : ℝ) ^ 2 = 2 := Real.sq_sqrt (by norm_num)
  fin_cases j <;> simp only [fibreB, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val,
    Fin.isValue, Fin.reduceFinMk]
  · simp; nlinarith [pow_nonneg hN 2, pow_nonneg hN 3]
  · rw [norm_fB1_eq, sq_abs]; nlinarith [pow_nonneg hN 2, pow_nonneg hN 3]
  · rw [norm_fB2_eq, div_pow, hs]; nlinarith [pow_nonneg hN 2, pow_nonneg hN 3]
  · rw [hz]; nlinarith [pow_nonneg hN 2, pow_nonneg hN 3]
  · rw [fB4, norm_div, norm_mul, Complex.norm_real, Complex.norm_real, Real.norm_eq_abs,
      Real.norm_eq_abs, abs_of_nonneg (Real.sqrt_nonneg _), div_pow, mul_pow, hz, sq_abs, hs]
    nlinarith [pow_nonneg hN 2, pow_nonneg hN 3, sq_nonneg (Complex.normSq z - 2)]
  · rw [Complex.norm_conj, hz]; nlinarith [pow_nonneg hN 2, pow_nonneg hN 3]

lemma memLp_fibreB (j : Fin 6) : MemLp (fibreB j) 2 gaussC := by
  rw [memLp_two_iff_integrable_sq_norm (continuous_fibreB j).aestronglyMeasurable]
  refine integrable_gaussC_of_bound _ ((continuous_fibreB j).norm.pow 2) 1 3 3 1 fun z => ?_
  rw [abs_of_nonneg (sq_nonneg _)]
  exact (norm_sq_fibreB_le j z).trans (le_of_eq (by ring))

lemma integrable_fibreB (j : Fin 6) : Integrable (fibreB j) gaussC :=
  (memLp_fibreB j).integrable one_le_two

/-! ### The tensor maps -/

variable (n) in
/-- `T j r = B_j ⊗ r`. -/
def Tfun (j : Fin 6) (r : L2G n) : L2G (n + 1) :=
  tensorL n (fibreB j) ⇑r (memLp_fibreB j) (Lp.memLp r)

lemma Tfun_ae (j : Fin 6) (r : L2G n) :
    Tfun n j r =ᵐ[stdGaussian ((n + 1) + (n + 1))] tensorFn n (fibreB j) ⇑r :=
  tensorL_ae _ _ _ _

lemma Tfun_ae' (j : Fin 6) (r : L2G n) {R : (Fin (n + n) → ℝ) → ℂ}
    (hR : ⇑r =ᵐ[stdGaussian (n + n)] R) :
    Tfun n j r =ᵐ[stdGaussian ((n + 1) + (n + 1))] tensorFn n (fibreB j) R :=
  (Tfun_ae j r).trans (tensorFn_congr_ae (Filter.EventuallyEq.refl _ _) hR)

/-- Equality in `L2G (n+1)` from a pointwise identity on `joinR`. -/
lemma lp_eq_of_joinR {u v : L2G (n + 1)} {f g : (Fin ((n + 1) + (n + 1)) → ℝ) → ℂ}
    (hu : ⇑u =ᵐ[stdGaussian ((n + 1) + (n + 1))] f) (hv : ⇑v =ᵐ[stdGaussian ((n + 1) + (n + 1))] g)
    (h : ∀ z y, f (joinR z y) = g (joinR z y)) : u = v := by
  refine Lp.ext (hu.trans ?_)
  rw [funext_joinR h]
  exact hv.symm

lemma Tfun_add (j : Fin 6) (r s : L2G n) : Tfun n j (r + s) = Tfun n j r + Tfun n j s := by
  refine lp_eq_of_joinR (Tfun_ae' j (r + s) (Lp.coeFn_add r s))
    ((Lp.coeFn_add _ _).trans ((Tfun_ae j r).add (Tfun_ae j s))) fun z y => ?_
  simp only [tensorFn_joinR, Pi.add_apply, add_mul]

lemma Tfun_smul (j : Fin 6) (c : ℂ) (r : L2G n) : Tfun n j (c • r) = c • Tfun n j r := by
  refine lp_eq_of_joinR (Tfun_ae' j (c • r) (Lp.coeFn_smul c r))
    ((Lp.coeFn_smul c _).trans ((Tfun_ae j r).const_smul c)) fun z y => ?_
  simp only [tensorFn_joinR, Pi.smul_apply, smul_eq_mul, mul_assoc]

variable (n) in
/-- The tensor map as a linear map. -/
def T (j : Fin 6) : L2G n →ₗ[ℂ] L2G (n + 1) where
  toFun := Tfun n j
  map_add' := Tfun_add j
  map_smul' := Tfun_smul j

/-- **Orthonormality of the pieces**: `⟪T i r, T j s⟫ = ⟪r, s⟫ δ_ij`. -/
theorem inner_T (i j : Fin 6) (r s : L2G n) :
    inner ℂ (T n i r) (T n j s) = inner ℂ r s * if i = j then 1 else 0 := by
  simp only [T, LinearMap.coe_mk, AddHom.coe_mk, Tfun]
  rw [inner_tensorL, ← fibreGram_eq, inner_L2]
  rfl

lemma norm_T (j : Fin 6) (r : L2G n) : ‖T n j r‖ = ‖r‖ := by
  have h := inner_T j j r r
  rw [ite_eq_left rfl, mul_one, inner_self_eq_norm_sq_to_K, inner_self_eq_norm_sq_to_K] at h
  have h2 : ‖T n j r‖ ^ 2 = ‖r‖ ^ 2 := by exact_mod_cast h
  exact (pow_left_inj₀ (norm_nonneg _) (norm_nonneg _) two_ne_zero).1 h2

/-! ### Coefficient functions -/

variable (n) in
/-- `c_j[k](y) = ∫ conj(B_j z) k(joinR z y) dz`. -/
def cf (j : Fin 6) (k : (Fin ((n + 1) + (n + 1)) → ℝ) → ℂ) (y : Fin (n + n) → ℝ) : ℂ :=
  ∫ z, conj (fibreB j z) * k (joinR z y) ∂gaussC

/-- The bound `∫ |B_j|`. -/
def cbound (j : Fin 6) : ℝ := ∫ z, ‖fibreB j z‖ ∂gaussC

section bdd

variable {k : (Fin ((n + 1) + (n + 1)) → ℝ) → ℂ} (hkm : Measurable k) (hkb : ∀ x, ‖k x‖ ≤ 1)
include hkm hkb

omit hkm in
lemma norm_cf_le (j : Fin 6) (y : Fin (n + n) → ℝ) : ‖cf n j k y‖ ≤ cbound j := by
  refine (norm_integral_le_integral_norm _).trans (integral_mono_of_nonneg
    (Filter.Eventually.of_forall fun _ => norm_nonneg _) (integrable_fibreB j).norm
    (Filter.Eventually.of_forall fun z => ?_))
  simp only [norm_mul, Complex.norm_conj]
  exact mul_le_of_le_one_right (norm_nonneg _) (hkb _)

omit hkb in
lemma stronglyMeasurable_cf (j : Fin 6) : StronglyMeasurable (cf n j k) := by
  have hf : StronglyMeasurable fun p : (Fin (n + n) → ℝ) × ℂ =>
      conj (fibreB j p.2) * k (joinR p.2 p.1) := by
    refine (((Complex.continuous_conj.comp (continuous_fibreB j)).measurable.comp
      measurable_snd).mul (hkm.comp ?_)).stronglyMeasurable
    exact split2.symm.measurable.comp (measurable_fst.prodMk measurable_snd)
  exact hf.integral_prod_right'

lemma memLp_cf (j : Fin 6) : MemLp (cf n j k) 2 (stdGaussian (n + n)) :=
  MemLp.of_bound (stronglyMeasurable_cf hkm j).aestronglyMeasurable (cbound j)
    (Filter.Eventually.of_forall fun y => norm_cf_le hkb j y)

variable (n) in
/-- `c_j[k]` as an element of `L2G n`. -/
def cfL (j : Fin 6) : L2G n := (memLp_cf hkm hkb j).toLp _

lemma cfL_ae (j : Fin 6) : ⇑(cfL n hkm hkb j) =ᵐ[stdGaussian (n + n)] cf n j k :=
  MemLp.coeFn_toLp _

/-- **The pairing of a piece with a bounded function**: `⟪T j r, u⟫ = ⟪r, c_j[k]⟫` for `u =ᵐ k`. -/
theorem inner_T_left (j : Fin 6) (r : L2G n) (u : L2G (n + 1))
    (hu : ⇑u =ᵐ[stdGaussian ((n + 1) + (n + 1))] k) :
    inner ℂ (T n j r) u = inner ℂ r (cfL n hkm hkb j) := by
  simp only [T, LinearMap.coe_mk, AddHom.coe_mk, Tfun]
  rw [inner_tensorL_left, inner_L2]
  refine integral_congr_ae ?_
  have h2 := ae_split2 hu
  filter_upwards [h2, cfL_ae hkm hkb j] with y hy hc
  rw [hc, cf]
  congr 1
  exact integral_congr_ae (by filter_upwards [hy] with z hz; rw [hz])

end bdd

/-! ### Remote elements and the remote spaces `K_j` -/

section remote

variable (n)

lemma memLp_quad (F : (Fin (n + n) → ℝ) → ℂ) (hF : Continuous F)
    (hb : ∀ y, ‖F y‖ ≤ rad n y ^ 2) : MemLp F 2 (stdGaussian (n + n)) := by
  rw [memLp_two_iff_integrable_sq_norm hF.aestronglyMeasurable]
  refine (integrable_rad_pow_four n).mono' (hF.norm.pow 2).aestronglyMeasurable
    (Filter.Eventually.of_forall fun y => ?_)
  rw [Real.norm_eq_abs, abs_of_nonneg (sq_nonneg _)]
  calc ‖F y‖ ^ 2 ≤ (rad n y ^ 2) ^ 2 := pow_le_pow_left₀ (norm_nonneg _) (hb y) 2
    _ = rad n y ^ 4 := by ring

/-- The constant `1`. -/
def oneL : L2G n := (memLp_const (1 : ℂ)).toLp _
/-- `z̄_c`. -/
def zbL (c : Fin n) : L2G n :=
  ((memLp_zc n c).of_le (Complex.continuous_conj.comp (continuous_zc n c)).aestronglyMeasurable
    (Filter.Eventually.of_forall fun y => by simp)).toLp (fun y => conj (zc n c y))

lemma norm_zc_mul_le (a b : Fin n) (y : Fin (n + n) → ℝ) : ‖zc n a y * zc n b y‖ ≤ rad n y ^ 2 := by
  rw [norm_mul, sq]
  exact mul_le_mul (norm_zc_le n a y) (norm_zc_le n b y) (norm_nonneg _) (rad_nonneg n y)

/-- `z_a z_b`. -/
def zzL (a b : Fin n) : L2G n :=
  (memLp_quad n _ ((continuous_zc n a).mul (continuous_zc n b)) (norm_zc_mul_le n a b)).toLp _

/-- `z_a z̄_b`. -/
def zzbL (a b : Fin n) : L2G n :=
  (memLp_quad n (fun y => zc n a y * conj (zc n b y))
    ((continuous_zc n a).mul (Complex.continuous_conj.comp (continuous_zc n b)))
    (fun y => by simpa [norm_mul] using norm_zc_mul_le n a b y)).toLp _

/-- `z_a z̄_b − 2δ_ab`. -/
def qL (a b : Fin n) : L2G n := zzbL n a b - (if a = b then (2 : ℂ) else 0) • oneL n

/-- **The remote spaces** of the six pieces: `H₂,₁`, `H₁,₀`, `span z̄_c`, `span (z_a z̄_b − 2δ)`,
the constants, `span z_a z_b`. -/
def Kspace : Fin 6 → Submodule ℂ (L2G n) :=
  ![H21 n, H10 n, Submodule.span ℂ (Set.range (zbL n)),
    Submodule.span ℂ (Set.range fun p : Fin n × Fin n => qL n p.1 p.2),
    Submodule.span ℂ {oneL n}, Submodule.span ℂ (Set.range fun p : Fin n × Fin n => zzL n p.1 p.2)]

end remote

/-! ### Representatives -/

section reps

variable (m : ℕ)

/-- The function of the Wick cubic. -/
def wickFn (a b c : Fin m) (x : Fin (m + m) → ℝ) : ℂ :=
  wc m a b c x - (if a = c then (2 : ℂ) else 0) * zc m b x - (if b = c then (2 : ℂ) else 0) * zc m a x

lemma wickL_ae' (a b c : Fin m) : ⇑(wickL m a b c) =ᵐ[stdGaussian (m + m)] wickFn m a b c := by
  rw [wickL]
  filter_upwards [Lp.coeFn_sub (wL m a b c - (if a = c then (2 : ℂ) else 0) • zL m b)
      ((if b = c then (2 : ℂ) else 0) • zL m a),
    Lp.coeFn_sub (wL m a b c) ((if a = c then (2 : ℂ) else 0) • zL m b),
    Lp.coeFn_smul (if a = c then (2 : ℂ) else 0) (zL m b),
    Lp.coeFn_smul (if b = c then (2 : ℂ) else 0) (zL m a),
    MemLp.coeFn_toLp (memLp_wc m a b c), MemLp.coeFn_toLp (memLp_zc m b),
    MemLp.coeFn_toLp (memLp_zc m a)] with x h1 h2 h3 h4 h5 h6 h7
  rw [h1, Pi.sub_apply, h2, Pi.sub_apply, h3, h4, Pi.smul_apply, Pi.smul_apply, smul_eq_mul,
    smul_eq_mul]
  unfold wL zL at *
  rw [h5, h6, h7]
  rfl

lemma zL_ae (l : Fin m) : ⇑(zL m l) =ᵐ[stdGaussian (m + m)] zc m l := MemLp.coeFn_toLp _

lemma oneL_ae : ⇑(oneL m) =ᵐ[stdGaussian (m + m)] fun _ => (1 : ℂ) := MemLp.coeFn_toLp _

lemma zbL_ae (c : Fin m) : ⇑(zbL m c) =ᵐ[stdGaussian (m + m)] fun y => conj (zc m c y) :=
  MemLp.coeFn_toLp _

lemma zzL_ae (a b : Fin m) :
    ⇑(zzL m a b) =ᵐ[stdGaussian (m + m)] fun y => zc m a y * zc m b y := MemLp.coeFn_toLp _

lemma qL_ae (a b : Fin m) :
    ⇑(qL m a b) =ᵐ[stdGaussian (m + m)]
      fun y => zc m a y * conj (zc m b y) - (if a = b then (2 : ℂ) else 0) := by
  rw [qL]
  filter_upwards [Lp.coeFn_sub (zzbL m a b) ((if a = b then (2 : ℂ) else 0) • oneL m),
    Lp.coeFn_smul (if a = b then (2 : ℂ) else 0) (oneL m), oneL_ae m,
    (MemLp.coeFn_toLp _ : ⇑(zzbL m a b) =ᵐ[stdGaussian (m + m)] _)] with y h1 h2 h3 h4
  rw [h1, Pi.sub_apply, h2, Pi.smul_apply, h3, smul_eq_mul, mul_one]
  unfold zzbL
  rw [h4]

end reps

lemma T_ae (j : Fin 6) (r : L2G n) {R : (Fin (n + n) → ℝ) → ℂ}
    (hR : ⇑r =ᵐ[stdGaussian (n + n)] R) :
    ⇑(T n j r) =ᵐ[stdGaussian ((n + 1) + (n + 1))] tensorFn n (fibreB j) R :=
  Tfun_ae' j r hR

lemma smul_T_ae (κ : ℂ) (j : Fin 6) (r : L2G n) {R : (Fin (n + n) → ℝ) → ℂ}
    (hR : ⇑r =ᵐ[stdGaussian (n + n)] R) :
    ⇑(κ • T n j r) =ᵐ[stdGaussian ((n + 1) + (n + 1))] fun x => κ * tensorFn n (fibreB j) R x :=
  (Lp.coeFn_smul κ _).trans ((T_ae j r hR).const_smul κ)

/-! ### Every Wick cubic of `ℂ^{n+1}` lies in one piece -/

lemma wickFn_joinR (a b c : Fin (n + 1)) (z : ℂ) (y : Fin (n + n) → ℝ) :
    wickFn (n + 1) a b c (joinR z y) = zc (n + 1) a (joinR z y) * zc (n + 1) b (joinR z y)
      * conj (zc (n + 1) c (joinR z y))
      - (if a = c then (2 : ℂ) else 0) * zc (n + 1) b (joinR z y)
      - (if b = c then (2 : ℂ) else 0) * zc (n + 1) a (joinR z y) := rfl

lemma s_inv : ((√2 : ℝ) : ℂ)⁻¹ = ((√2 : ℝ) : ℂ) / 2 := by
  have hs : ((√2 : ℝ) : ℂ) ≠ 0 := by exact_mod_cast sqrt_two_ne
  field_simp
  rw [← Complex.ofReal_pow, Real.sq_sqrt (by norm_num)]; norm_num

/-- **The representation of a Wick cubic in one piece.** -/
theorem wick_rep (a b c : Fin (n + 1)) :
    ∃ (j : Fin 6) (κ : ℂ) (r : L2G n), r ∈ Kspace n j ∧ wickL (n + 1) a b c = κ • T n j r := by
  have hs2 : ((√2 : ℝ) : ℂ) ^ 2 = 2 := sqrt2_sq_C
  have nsq : ∀ z : ℂ, conj z * z = ((Complex.normSq z : ℝ) : ℂ) := fun z => by
    rw [mul_comm, Complex.mul_conj]
  rcases Fin.eq_zero_or_eq_succ a with rfl | ⟨a, rfl⟩ <;>
  rcases Fin.eq_zero_or_eq_succ b with rfl | ⟨b, rfl⟩ <;>
  rcases Fin.eq_zero_or_eq_succ c with rfl | ⟨c, rfl⟩
  · -- (0,0,0)
    refine ⟨4, 4, oneL n, Submodule.mem_span_singleton_self _, ?_⟩
    refine lp_eq_of_joinR (wickL_ae' _ _ _ _) (smul_T_ae _ _ _ (oneL_ae n)) fun z y => ?_
    rw [wickFn_joinR, tensorFn_joinR]
    simp only [joinR_zc0, map_mul, Complex.conj_ofReal, ite_true, fibreB, Matrix.cons_val,
      Fin.isValue, fB4, one_mul]
    push_cast
    simp only [div_eq_mul_inv, s_inv]
    linear_combination ((√2 : ℝ) * z ^ 2 * conj z : ℂ) * hs2 + (2 * (√2 : ℝ) * z : ℂ) * nsq z
  · -- (0,0,c+1)
    refine ⟨2, 2 * ((√2 : ℝ) : ℂ), zbL n c, Submodule.subset_span ⟨c, rfl⟩, ?_⟩
    refine lp_eq_of_joinR (wickL_ae' _ _ _ _) (smul_T_ae _ _ _ (zbL_ae n c)) fun z y => ?_
    rw [wickFn_joinR, tensorFn_joinR]
    simp only [joinR_zc0, joinR_zc_succ, ite_false, fibreB, Matrix.cons_val, Fin.isValue, (Fin.succ_ne_zero _).symm, fB2, zero_mul, sub_zero]
    try simp only [div_eq_mul_inv, s_inv]
    ring
  · -- (0,b+1,0)
    refine ⟨1, 2, zL n b, zL_mem_H10 n b, ?_⟩
    refine lp_eq_of_joinR (wickL_ae' _ _ _ _) (smul_T_ae _ _ _ (zL_ae n b)) fun z y => ?_
    rw [wickFn_joinR, tensorFn_joinR]
    simp only [joinR_zc0, joinR_zc_succ, map_mul, Complex.conj_ofReal, ite_true, ite_false, fibreB, Matrix.cons_val_zero, Matrix.cons_val_one, Fin.isValue, Fin.succ_ne_zero, fB1, zero_mul, sub_zero]
    push_cast
    try simp only [div_eq_mul_inv, s_inv]
    linear_combination (zc n b y * z * conj z) * hs2 + (2 * zc n b y) * nsq z
  · -- (0,b+1,c+1)
    refine ⟨3, ((√2 : ℝ) : ℂ), qL n b c, Submodule.subset_span ⟨(b, c), rfl⟩, ?_⟩
    refine lp_eq_of_joinR (wickL_ae' _ _ _ _) (smul_T_ae _ _ _ (qL_ae n b c)) fun z y => ?_
    rw [wickFn_joinR, tensorFn_joinR]
    simp only [joinR_zc0, joinR_zc_succ, ite_false, fibreB, Matrix.cons_val, Fin.isValue, Fin.succ_inj, (Fin.succ_ne_zero _).symm, zero_mul, sub_zero]
    try simp only [div_eq_mul_inv, s_inv]
    split_ifs <;> ring
  · -- (a+1,0,0)
    refine ⟨1, 2, zL n a, zL_mem_H10 n a, ?_⟩
    refine lp_eq_of_joinR (wickL_ae' _ _ _ _) (smul_T_ae _ _ _ (zL_ae n a)) fun z y => ?_
    rw [wickFn_joinR, tensorFn_joinR]
    simp only [joinR_zc0, joinR_zc_succ, map_mul, Complex.conj_ofReal, ite_true, ite_false, fibreB, Matrix.cons_val_zero, Matrix.cons_val_one, Fin.isValue, Fin.succ_ne_zero, fB1, zero_mul, sub_zero]
    push_cast
    try simp only [div_eq_mul_inv, s_inv]
    linear_combination (zc n a y * z * conj z) * hs2 + (2 * zc n a y) * nsq z
  · -- (a+1,0,c+1)
    refine ⟨3, ((√2 : ℝ) : ℂ), qL n a c, Submodule.subset_span ⟨(a, c), rfl⟩, ?_⟩
    refine lp_eq_of_joinR (wickL_ae' _ _ _ _) (smul_T_ae _ _ _ (qL_ae n a c)) fun z y => ?_
    rw [wickFn_joinR, tensorFn_joinR]
    simp only [joinR_zc0, joinR_zc_succ, ite_false, fibreB, Matrix.cons_val, Fin.isValue, Fin.succ_inj, (Fin.succ_ne_zero _).symm, zero_mul, sub_zero]
    try simp only [div_eq_mul_inv, s_inv]
    split_ifs <;> ring
  · -- (a+1,b+1,0)
    refine ⟨5, ((√2 : ℝ) : ℂ), zzL n a b, Submodule.subset_span ⟨(a, b), rfl⟩, ?_⟩
    refine lp_eq_of_joinR (wickL_ae' _ _ _ _) (smul_T_ae _ _ _ (zzL_ae n a b)) fun z y => ?_
    rw [wickFn_joinR, tensorFn_joinR]
    simp only [joinR_zc0, joinR_zc_succ, map_mul, Complex.conj_ofReal, ite_false, fibreB, Matrix.cons_val, Fin.isValue, Fin.succ_ne_zero, zero_mul, sub_zero]
    try simp only [div_eq_mul_inv, s_inv]
    ring
  · -- (a+1,b+1,c+1)
    refine ⟨0, 1, wickL n a b c, wickL_mem_H21 n a b c, ?_⟩
    refine lp_eq_of_joinR (wickL_ae' _ _ _ _) (smul_T_ae _ _ _ (wickL_ae' n a b c)) fun z y => ?_
    rw [wickFn_joinR, tensorFn_joinR]
    simp only [joinR_zc_succ, fibreB, Matrix.cons_val_zero, Fin.isValue, Fin.succ_inj, one_mul, mul_one]
    try simp only [div_eq_mul_inv, s_inv]
    simp only [wickFn, wc]

lemma finiteDimensional_Kspace (j : Fin 6) : FiniteDimensional ℂ (Kspace n j) := by
  fin_cases j
  · exact (inferInstance : FiniteDimensional ℂ (H21 n))
  · exact (inferInstance : FiniteDimensional ℂ (H10 n))
  · exact FiniteDimensional.span_of_finite ℂ (Set.finite_range _)
  · exact FiniteDimensional.span_of_finite ℂ (Set.finite_range _)
  · exact FiniteDimensional.span_singleton ℂ _
  · exact FiniteDimensional.span_of_finite ℂ (Set.finite_range _)

instance (j : Fin 6) : (Kspace n j).HasOrthogonalProjection := by
  have := finiteDimensional_Kspace (n := n) j
  have := Submodule.complete_of_finiteDimensional (Kspace n j)
  infer_instance

/-- **`H₂,₁(n+1)` lies in the sum of the six pieces.** -/
theorem exists_piece_repr {ψ : L2G (n + 1)} (hψ : ψ ∈ H21 (n + 1)) :
    ∃ R : Fin 6 → L2G n, (∀ j, R j ∈ Kspace n j) ∧ ψ = ∑ j, T n j (R j) := by
  classical
  obtain ⟨c, rfl⟩ := exists_wick_repr (n + 1) hψ
  choose jj κ r hr hrep using fun p : Fin (n + 1) × Fin (n + 1) × Fin (n + 1) =>
    wick_rep (n := n) p.1 p.2.1 p.2.2
  refine ⟨fun j => ∑ p, if jj p = j then (c p * κ p) • r p else 0, fun j => ?_, ?_⟩
  · refine Submodule.sum_mem _ fun p _ => ?_
    split_ifs with h
    · exact Submodule.smul_mem _ _ (h ▸ hr p)
    · exact Submodule.zero_mem _
  · simp_rw [map_sum, Finset.sum_comm (s := Finset.univ) (t := Finset.univ) (γ := Fin 6)]
    refine Finset.sum_congr rfl fun p _ => ?_
    rw [hrep p]
    simp_rw [apply_ite (T n _), map_smul, map_zero]
    rw [Finset.sum_ite_eq Finset.univ (jj p) (fun j => (c p * κ p) • T n j (r p)),
      ite_eq_left (Finset.mem_univ _), smul_smul]

/-- `‖Σ_j T j (R j)‖² = Σ_j ‖R j‖²`. -/
lemma norm_sq_sum_T (R : Fin 6 → L2G n) : ‖∑ j, T n j (R j)‖ ^ 2 = ∑ j, ‖R j‖ ^ 2 := by
  rw [@norm_sq_eq_re_inner ℂ, sum_inner]
  simp_rw [inner_sum, inner_T, mul_ite, mul_one, mul_zero, Finset.sum_ite_eq, Finset.mem_univ,
    ite_true]
  rw [RCLike.re_to_complex, Complex.re_sum]
  refine Finset.sum_congr rfl fun j _ => ?_
  rw [inner_self_eq_norm_sq_to_K]
  norm_cast

/-- **The bound on `‖P₂,₁ u‖²` by the six remote projections** of the coefficient functions of a
bounded representative `k` of `u`. -/
theorem norm_sq_starProjection_H21_le {k : (Fin ((n + 1) + (n + 1)) → ℝ) → ℂ} (hkm : Measurable k)
    (hkb : ∀ x, ‖k x‖ ≤ 1) (u : L2G (n + 1)) (hu : ⇑u =ᵐ[stdGaussian ((n + 1) + (n + 1))] k) :
    ‖(H21 (n + 1)).starProjection u‖ ^ 2
      ≤ ∑ j, ‖(Kspace n j).starProjection (cfL n hkm hkb j)‖ ^ 2 := by
  set ψ := (H21 (n + 1)).starProjection u with hψdef
  have hψ : ψ ∈ H21 (n + 1) := by
    rw [hψdef, Submodule.starProjection_apply]; exact Submodule.coe_mem _
  obtain ⟨R, hR, hrep⟩ := exists_piece_repr hψ
  have h1 : (inner ℂ u ψ).re = ‖ψ‖ ^ 2 := re_inner_starProjection _ u
  have h2 : ‖ψ‖ ^ 2 = ∑ j, ‖R j‖ ^ 2 := by rw [hrep, norm_sq_sum_T]
  have h3 : (inner ℂ u ψ).re ≤ ∑ j, ‖R j‖ * ‖(Kspace n j).starProjection (cfL n hkm hkb j)‖ := by
    rw [hrep, inner_sum, Complex.re_sum]
    refine Finset.sum_le_sum fun j _ => ?_
    have e : inner ℂ (R j) (cfL n hkm hkb j)
        = inner ℂ (R j) ((Kspace n j).starProjection (cfL n hkm hkb j)) := by
      rw [← Submodule.inner_starProjection_left_eq_right,
        Submodule.starProjection_eq_self_iff.2 (hR j)]
    rw [← inner_conj_symm, Complex.conj_re, inner_T_left hkm hkb j (R j) u hu, e]
    exact (Complex.re_le_norm _).trans (norm_inner_le_norm _ _)
  have h4 : ∀ j, ‖R j‖ * ‖(Kspace n j).starProjection (cfL n hkm hkb j)‖
      ≤ (‖R j‖ ^ 2 + ‖(Kspace n j).starProjection (cfL n hkm hkb j)‖ ^ 2) / 2 := fun j => by
    nlinarith [sq_nonneg (‖R j‖ - ‖(Kspace n j).starProjection (cfL n hkm hkb j)‖)]
  have h5 := Finset.sum_le_sum fun j (_ : j ∈ Finset.univ) => h4 j
  rw [← Finset.sum_div, Finset.sum_add_distrib] at h5
  linarith

end

end Grothe.LowerAnalytic
