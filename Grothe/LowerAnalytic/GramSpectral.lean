import Grothe.LowerAnalytic.GramTensor
import Grothe.LowerAnalytic.CircularTensor

/-!
# The spectral identities of the contraction-Gram budget

The chaos energies `u₂ = ‖U₂‖²`, `v₂ = ‖(q²)₂‖²`, `u₄ = ‖U₄‖²`, `v₄ = ‖(q²)₄‖²` of a circular cubic
`q = a + ib` in terms of the contraction scalars `n, h, b, y, z` of its complex coefficient tensor
`t = gramT J a b` (`GramTensor.lean`).

* **The complex charge calculus.**  `J` acts on each slot of a complex 3-tensor (`cl₁`, `cl₂`,
  `cl₃`, ℂ-linear, commuting, squaring to `−1` for `IsCplx J`); the projections
  `P_s = (1 − s i J_k)/2` (`cPr`) cut out the `±i` eigenspaces of each slot and the eight
  **charge sectors** `sector s₁ s₂ s₃` sum to the identity (`sector_sum`); the derivation
  `δ = J₁ + J₂ + J₃` (`cder`) acts on a sector as `(s₁ + s₂ + s₃) i` (`cder_sector`).  The complex
  kernel `τ = f + ig` (`tauC`) of a circular pair has `δ τ = i τ` (`cder_tauC`, from `δf = −g`,
  `δg = f`), so only the three sectors of charge `(+,+,−)` survive (`sector_eq_zero`); `t` is
  `3 P₊P₊P₋ τ` (`cplxT_eq_sector`) and, `τ` being fully symmetric, **`τ = Sym t`**
  (`tauC_eq_sym`: `f + ig = (t_{abc} + t_{acb} + t_{cba})/3`).  The slots of `t` are
  `J`-eigenvectors with eigenvalues `i, i, −i` (`chg_t1`, `chg_t2`, `chg_t3`; `Chg J s u` is
  `J u = s u`), and **charge conservation** `Chg.sum_mul_eq_zero` kills every contraction of two
  slots with eigenvalues not summing to zero (`J` antisymmetric).
* **The second chaos.**  `∂ₙ∂ₘ Π₂(ab) = 18 (G^{fg}_{mn} + G^{fg}_{nm})` with
  `G^{fg}_{mn} = Σ_{ji} f_{mij} g_{nij}` (`pderiv2_comp2`), and the Ornstein–Uhlenbeck ladder
  `E X² = ½ Σ (∂²X)²` on the second chaos (`gE_sq_quad`, from `Quad` of `Covariance.lean`).  The
  real matrices are the real and imaginary parts of `Σ_{ji} τ_{mij} conj τ_{nij}` and
  `Σ_{ji} τ_{mij} τ_{nij}`, which the sector expansion of `τ` evaluates to `(H + 2N)/9`
  (`Htau2_eq`) and `2B/9` (`Gtau2_eq`): of the nine terms, charge conservation kills six resp.
  seven.  With `Σ (Re(H + 2N))² = (h + 4n + 4z)/2` (`sum_re_sq_K`; `tr(NH̄) = Σ H² = Σ N² = 0` by
  charge) this gives **`u₂ = 16n + 4h + 16z`** (`Circular.specU2_eq`) and **`v₂ = 32b`**
  (`Circular.specV2_eq`).
* **The fourth chaos.**  `∂⁴ Π₄(ab) = 108 (Sym(f ⋆ g) + Sym(g ⋆ f))` with the contraction
  `(f ⋆ g)_{ab,cd} = Σₓ f_{abx} g_{cdx}` and the partial symmetrisation `Sym` of
  `CircularTensor.lean` (`pderiv4_comp4`), and the ladder `E X² = (1/24) Σ (∂⁴X)²`
  (`gE_sq_chaos4`).  The sector expansion gives `τ ⋆ τ = (W_{abc;d} + W_{abd;c} + W_{cda;b}
  + W_{cdb;a})/9` (`ccon_tau_eq`) and `τ ⋆ τ̄ = (D + C^{(adbc)} + C^{(acbd)} + C^{(bdac)}
  + C^{(bcad)})/9` (`ccon_tau_conj_eq`, with the tensors `D`, `C` of `GramTensor.lean`).  Every
  pairing of permuted copies of `W`, `D`, `C` whose slot charges disagree vanishes
  (`hip_zero₁`–`hip_zero₄`, the slot charges `chg_W*`, `chg_D*`, `chg_C*`); the surviving ones
  are the six Gram identities of `GramTensor.lean` up to reindexing (the lemmas `pv4_*`, `pu4_*`).
  `‖Sym(τ ⋆ τ)‖² = 4y/81` (`hipV_V`: `Sym A` is fully symmetric, `‖Sym A‖² = 4⟨Sym A, W⟩` and three
  of twelve pairings survive, `z + 2T = 3y`), whence **`v₄ = 96y`** (`Circular.specV4_eq`);
  `‖Sym(f ⋆ f + g ⋆ g)‖² = (h + 4n + 4b + 16T)/486` (`sum_kerS_sq`: `S = Sym(Re(τ ⋆ τ̄))` is fully
  symmetric, the symmetrisation is moved onto `D` and `C`, ten of sixty pairings survive), whence
  **`u₄ = 16n + 4h + 16b + 96y − 32z`** (`Circular.specU4_eq`, with `2T = 3y − z`).
-/

open MvPolynomial ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

variable {ι : Type*} [Fintype ι]

/-! ### Complex slot operators and the charge sectors -/

section slots

variable (J : ι → ι → ℝ)

/-- `J` on the first slot of a complex 3-tensor. -/
def cl₁ : (ι → ι → ι → ℂ) →ₗ[ℂ] (ι → ι → ι → ℂ) where
  toFun T a b c := ∑ p, (J a p : ℂ) * T p b c
  map_add' T T' := by
    funext a b c; simp only [Pi.add_apply, mul_add, Finset.sum_add_distrib]
  map_smul' r T := by
    funext a b c
    simp only [Pi.smul_apply, smul_eq_mul, Finset.mul_sum, RingHom.id_apply]
    exact Finset.sum_congr rfl fun p _ => by ring

/-- `J` on the second slot. -/
def cl₂ : (ι → ι → ι → ℂ) →ₗ[ℂ] (ι → ι → ι → ℂ) where
  toFun T a b c := ∑ p, (J b p : ℂ) * T a p c
  map_add' T T' := by
    funext a b c; simp only [Pi.add_apply, mul_add, Finset.sum_add_distrib]
  map_smul' r T := by
    funext a b c
    simp only [Pi.smul_apply, smul_eq_mul, Finset.mul_sum, RingHom.id_apply]
    exact Finset.sum_congr rfl fun p _ => by ring

/-- `J` on the third slot. -/
def cl₃ : (ι → ι → ι → ℂ) →ₗ[ℂ] (ι → ι → ι → ℂ) where
  toFun T a b c := ∑ p, (J c p : ℂ) * T a b p
  map_add' T T' := by
    funext a b c; simp only [Pi.add_apply, mul_add, Finset.sum_add_distrib]
  map_smul' r T := by
    funext a b c
    simp only [Pi.smul_apply, smul_eq_mul, Finset.mul_sum, RingHom.id_apply]
    exact Finset.sum_congr rfl fun p _ => by ring

/-- The derivation `δ = J₁ + J₂ + J₃`. -/
def cder : (ι → ι → ι → ℂ) →ₗ[ℂ] (ι → ι → ι → ℂ) := cl₁ J + cl₂ J + cl₃ J

/-- The projection `(1 − s i L)/2` for a slot operator `L` with `L² = −1`: `s = 1` is the
`i`-eigenspace, `s = −1` the `−i`-eigenspace. -/
def cPr (L : (ι → ι → ι → ℂ) →ₗ[ℂ] (ι → ι → ι → ℂ)) (s : ℂ) :
    (ι → ι → ι → ℂ) →ₗ[ℂ] (ι → ι → ι → ℂ) :=
  (1 / 2 : ℂ) • (LinearMap.id - (s * Complex.I) • L)

/-- The charge sector `(s₁, s₂, s₃)`. -/
def sector (s₁ s₂ s₃ : ℂ) (T : ι → ι → ι → ℂ) : ι → ι → ι → ℂ :=
  cPr (cl₁ J) s₁ (cPr (cl₂ J) s₂ (cPr (cl₃ J) s₃ T))

variable {J}

lemma cl₁_apply (T : ι → ι → ι → ℂ) (a b c : ι) : cl₁ J T a b c = ∑ p, (J a p : ℂ) * T p b c := rfl
lemma cl₂_apply (T : ι → ι → ι → ℂ) (a b c : ι) : cl₂ J T a b c = ∑ p, (J b p : ℂ) * T a p c := rfl
lemma cl₃_apply (T : ι → ι → ι → ℂ) (a b c : ι) : cl₃ J T a b c = ∑ p, (J c p : ℂ) * T a b p := rfl
lemma cder_apply (T : ι → ι → ι → ℂ) : cder J T = cl₁ J T + cl₂ J T + cl₃ J T := rfl

omit [Fintype ι] in
lemma cPr_apply (L : (ι → ι → ι → ℂ) →ₗ[ℂ] (ι → ι → ι → ℂ)) (s : ℂ) (T : ι → ι → ι → ℂ) :
    cPr L s T = (1 / 2 : ℂ) • (T - (s * Complex.I) • L T) := by
  simp only [cPr, LinearMap.smul_apply, LinearMap.sub_apply, LinearMap.id_apply]

omit [Fintype ι] in
lemma cPr_apply_pt (L : (ι → ι → ι → ℂ) →ₗ[ℂ] (ι → ι → ι → ℂ)) (s : ℂ) (T : ι → ι → ι → ℂ)
    (a b c : ι) : cPr L s T a b c = 1 / 2 * (T a b c - s * Complex.I * L T a b c) := by
  rw [cPr_apply]; simp only [Pi.smul_apply, Pi.sub_apply, smul_eq_mul]

omit [Fintype ι] in
lemma cPr_add_neg (L : (ι → ι → ι → ℂ) →ₗ[ℂ] (ι → ι → ι → ℂ)) (T : ι → ι → ι → ℂ) :
    cPr L 1 T + cPr L (-1) T = T := by
  rw [cPr_apply, cPr_apply]; module

omit [Fintype ι] in
/-- `L P_s = s i P_s` when `L² = −1` and `s² = 1`. -/
lemma L_cPr {L : (ι → ι → ι → ℂ) →ₗ[ℂ] (ι → ι → ι → ℂ)} (hL : ∀ T, L (L T) = -T) {s : ℂ}
    (hs : s * s = 1) (T : ι → ι → ι → ℂ) : L (cPr L s T) = (s * Complex.I) • cPr L s T := by
  have h2 : (s * Complex.I) * (s * Complex.I) = -1 := by
    rw [show (s * Complex.I) * (s * Complex.I) = (s * s) * (Complex.I * Complex.I) by ring, hs,
      Complex.I_mul_I]; ring
  rw [cPr_apply, map_smul, map_sub, map_smul, hL]
  calc (1 / 2 : ℂ) • (L T - (s * Complex.I) • -T)
      = ((s * Complex.I) / 2) • T - (((s * Complex.I) * (s * Complex.I)) / 2) • L T := by
        rw [h2]; module
    _ = _ := by module

omit [Fintype ι] in
/-- A slot operator commuting with `L` commutes with `P_s`. -/
lemma M_cPr {L M : (ι → ι → ι → ℂ) →ₗ[ℂ] (ι → ι → ι → ℂ)} (hLM : ∀ T, M (L T) = L (M T))
    (s : ℂ) (T : ι → ι → ι → ℂ) : M (cPr L s T) = cPr L s (M T) := by
  rw [cPr_apply, cPr_apply, map_smul, map_sub, map_smul, hLM]

omit [Fintype ι] in
lemma cPr_cPr_comm {L M : (ι → ι → ι → ℂ) →ₗ[ℂ] (ι → ι → ι → ℂ)} (hLM : ∀ T, M (L T) = L (M T))
    (s s' : ℂ) (T : ι → ι → ι → ℂ) : cPr M s' (cPr L s T) = cPr L s (cPr M s' T) := by
  have h1 : cPr M s' (cPr L s T)
      = (1 / 2 : ℂ) • (cPr L s T - (s' * Complex.I) • cPr L s (M T)) := by
    rw [cPr_apply M, M_cPr hLM]
  have h2 : cPr L s (cPr M s' T)
      = (1 / 2 : ℂ) • (cPr L s T - (s' * Complex.I) • cPr L s (M T)) := by
    rw [cPr_apply M, map_smul, map_sub, map_smul]
  rw [h1, h2]

lemma cl_comm12 (T : ι → ι → ι → ℂ) : cl₂ J (cl₁ J T) = cl₁ J (cl₂ J T) := by
  funext a b c
  simp only [cl₁_apply, cl₂_apply, Finset.mul_sum]
  rw [Finset.sum_comm]
  exact Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun q _ => by ring

lemma cl_comm13 (T : ι → ι → ι → ℂ) : cl₃ J (cl₁ J T) = cl₁ J (cl₃ J T) := by
  funext a b c
  simp only [cl₁_apply, cl₃_apply, Finset.mul_sum]
  rw [Finset.sum_comm]
  exact Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun q _ => by ring

lemma cl_comm23 (T : ι → ι → ι → ℂ) : cl₃ J (cl₂ J T) = cl₂ J (cl₃ J T) := by
  funext a b c
  simp only [cl₂_apply, cl₃_apply, Finset.mul_sum]
  rw [Finset.sum_comm]
  exact Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun q _ => by ring

variable (hJ : IsCplx J)
include hJ

/-- `Σ_p J a p (Σ_q J p q v q) = −v a` for complex `v`. -/
lemma IsCplx.csum_sq (v : ι → ℂ) (a : ι) :
    ∑ p, (J a p : ℂ) * ∑ q, (J p q : ℂ) * v q = -v a := by
  classical
  simp only [Finset.mul_sum]
  rw [Finset.sum_comm]
  have e : ∀ q, ∑ p, (J a p : ℂ) * ((J p q : ℂ) * v q) = ((∑ p, J a p * J p q : ℝ) : ℂ) * v q :=
    fun q => by
      push_cast
      rw [Finset.sum_mul]
      exact Finset.sum_congr rfl fun p _ => by ring
  simp only [e]
  rw [Finset.sum_eq_single a (fun q _ hq => by rw [hJ.sq_off a q (Ne.symm hq)]; simp)
    (fun h => absurd (Finset.mem_univ a) h), hJ.sq_diag a]
  push_cast; ring

lemma cl_sq1 (T : ι → ι → ι → ℂ) : cl₁ J (cl₁ J T) = -T := by
  funext a b c; exact hJ.csum_sq (fun p => T p b c) a
lemma cl_sq2 (T : ι → ι → ι → ℂ) : cl₂ J (cl₂ J T) = -T := by
  funext a b c; exact hJ.csum_sq (fun p => T a p c) b
lemma cl_sq3 (T : ι → ι → ι → ℂ) : cl₃ J (cl₃ J T) = -T := by
  funext a b c; exact hJ.csum_sq (fun p => T a b p) c

/-- `δ` acts on the sector `(s₁, s₂, s₃)` as `(s₁ + s₂ + s₃) i`. -/
lemma cder_sector {s₁ s₂ s₃ : ℂ} (h₁ : s₁ * s₁ = 1) (h₂ : s₂ * s₂ = 1) (h₃ : s₃ * s₃ = 1)
    (T : ι → ι → ι → ℂ) :
    cder J (sector J s₁ s₂ s₃ T) = ((s₁ + s₂ + s₃) * Complex.I) • sector J s₁ s₂ s₃ T := by
  rw [cder_apply]
  unfold sector
  have e1 := L_cPr (cl_sq1 hJ) h₁ (cPr (cl₂ J) s₂ (cPr (cl₃ J) s₃ T))
  have e2 : cl₂ J (cPr (cl₁ J) s₁ (cPr (cl₂ J) s₂ (cPr (cl₃ J) s₃ T)))
      = (s₂ * Complex.I) • cPr (cl₁ J) s₁ (cPr (cl₂ J) s₂ (cPr (cl₃ J) s₃ T)) := by
    rw [M_cPr cl_comm12, L_cPr (cl_sq2 hJ) h₂, map_smul]
  have e3 : cl₃ J (cPr (cl₁ J) s₁ (cPr (cl₂ J) s₂ (cPr (cl₃ J) s₃ T)))
      = (s₃ * Complex.I) • cPr (cl₁ J) s₁ (cPr (cl₂ J) s₂ (cPr (cl₃ J) s₃ T)) := by
    rw [M_cPr cl_comm13, M_cPr cl_comm23, L_cPr (cl_sq3 hJ) h₃, map_smul, map_smul]
  rw [e1, e2, e3]
  module

omit hJ in
/-- The sectors commute with `δ`. -/
lemma sector_cder (s₁ s₂ s₃ : ℂ) (T : ι → ι → ι → ℂ) :
    sector J s₁ s₂ s₃ (cder J T) = cder J (sector J s₁ s₂ s₃ T) := by
  unfold sector
  rw [cder_apply, cder_apply, map_add, map_add, map_add, map_add, map_add, map_add]
  have h1 : ∀ X, cPr (cl₁ J) s₁ (cPr (cl₂ J) s₂ (cPr (cl₃ J) s₃ (cl₁ J X)))
      = cl₁ J (cPr (cl₁ J) s₁ (cPr (cl₂ J) s₂ (cPr (cl₃ J) s₃ X))) := fun X => by
    rw [← M_cPr (L := cl₃ J) (M := cl₁ J) (fun T => (cl_comm13 T).symm),
      ← M_cPr (L := cl₂ J) (M := cl₁ J) (fun T => (cl_comm12 T).symm),
      ← M_cPr (L := cl₁ J) (M := cl₁ J) (fun T => rfl)]
  have h2 : ∀ X, cPr (cl₁ J) s₁ (cPr (cl₂ J) s₂ (cPr (cl₃ J) s₃ (cl₂ J X)))
      = cl₂ J (cPr (cl₁ J) s₁ (cPr (cl₂ J) s₂ (cPr (cl₃ J) s₃ X))) := fun X => by
    rw [← M_cPr (L := cl₃ J) (M := cl₂ J) (fun T => (cl_comm23 T).symm),
      ← M_cPr (L := cl₂ J) (M := cl₂ J) (fun T => rfl),
      ← M_cPr (L := cl₁ J) (M := cl₂ J) cl_comm12]
  have h3 : ∀ X, cPr (cl₁ J) s₁ (cPr (cl₂ J) s₂ (cPr (cl₃ J) s₃ (cl₃ J X)))
      = cl₃ J (cPr (cl₁ J) s₁ (cPr (cl₂ J) s₂ (cPr (cl₃ J) s₃ X))) := fun X => by
    rw [← M_cPr (L := cl₃ J) (M := cl₃ J) (fun T => rfl),
      ← M_cPr (L := cl₂ J) (M := cl₃ J) cl_comm23,
      ← M_cPr (L := cl₁ J) (M := cl₃ J) cl_comm13]
  rw [h1, h2, h3]

/-- **Charge selection**: a tensor with `δ T = i T` has no component in the sectors with
`s₁ + s₂ + s₃ ≠ 1`. -/
lemma sector_eq_zero {T : ι → ι → ι → ℂ} (hT : cder J T = Complex.I • T) {s₁ s₂ s₃ : ℂ}
    (h₁ : s₁ * s₁ = 1) (h₂ : s₂ * s₂ = 1) (h₃ : s₃ * s₃ = 1) (hs : s₁ + s₂ + s₃ ≠ 1) :
    sector J s₁ s₂ s₃ T = 0 := by
  have h := cder_sector hJ h₁ h₂ h₃ T
  rw [← sector_cder, hT] at h
  have h' : ((s₁ + s₂ + s₃ - 1) * Complex.I) • sector J s₁ s₂ s₃ T = 0 := by
    have : sector J s₁ s₂ s₃ (Complex.I • T) = Complex.I • sector J s₁ s₂ s₃ T := by
      unfold sector; rw [map_smul, map_smul, map_smul]
    rw [this] at h
    rw [sub_mul, one_mul, sub_smul, h, sub_self]
  rcases smul_eq_zero.mp h' with h0 | h0
  · exact absurd h0 (mul_ne_zero (sub_ne_zero.mpr hs) Complex.I_ne_zero)
  · exact h0

omit hJ in
/-- The eight sectors sum to the tensor. -/
lemma sector_sum (T : ι → ι → ι → ℂ) :
    sector J 1 1 1 T + sector J 1 1 (-1) T + sector J 1 (-1) 1 T + sector J 1 (-1) (-1) T
      + sector J (-1) 1 1 T + sector J (-1) 1 (-1) T + sector J (-1) (-1) 1 T
      + sector J (-1) (-1) (-1) T = T := by
  unfold sector
  conv_rhs => rw [← cPr_add_neg (cl₁ J) T, ← cPr_add_neg (cl₂ J) T, ← cPr_add_neg (cl₃ J) T]
  simp only [map_add]
  abel

end slots

/-! ### The kernels of a circular cubic as a complex tensor -/

section tau

variable (J : ι → ι → ℝ)

/-- `τ = f + ig`. -/
def tauC (f g : ι → ι → ι → ℝ) (a b c : ι) : ℂ := (f a b c : ℂ) + Complex.I * g a b c

variable {J}

lemma cl₁_tauC (f g : ι → ι → ι → ℝ) : cl₁ J (tauC f g) = tauC (sl₁ J f) (sl₁ J g) := by
  funext a b c
  simp only [cl₁_apply, tauC, sl₁_apply, Complex.ofReal_sum, Complex.ofReal_mul, Finset.mul_sum,
    mul_add, Finset.sum_add_distrib]
  congr 1
  exact Finset.sum_congr rfl fun p _ => by ring

lemma cl₂_tauC (f g : ι → ι → ι → ℝ) : cl₂ J (tauC f g) = tauC (sl₂ J f) (sl₂ J g) := by
  funext a b c
  simp only [cl₂_apply, tauC, sl₂_apply, Complex.ofReal_sum, Complex.ofReal_mul, Finset.mul_sum,
    mul_add, Finset.sum_add_distrib]
  congr 1
  exact Finset.sum_congr rfl fun p _ => by ring

lemma cl₃_tauC (f g : ι → ι → ι → ℝ) : cl₃ J (tauC f g) = tauC (sl₃ J f) (sl₃ J g) := by
  funext a b c
  simp only [cl₃_apply, tauC, sl₃_apply, Complex.ofReal_sum, Complex.ofReal_mul, Finset.mul_sum,
    mul_add, Finset.sum_add_distrib]
  congr 1
  exact Finset.sum_congr rfl fun p _ => by ring

/-- `δ τ = i τ` for the kernels of a circular pair (`δ f = −g`, `δ g = f`). -/
lemma cder_tauC {f g : ι → ι → ι → ℝ} (hf : der3 J f = -g) (hg : der3 J g = f) :
    cder J (tauC f g) = Complex.I • tauC f g := by
  have e : cder J (tauC f g) = tauC (der3 J f) (der3 J g) := by
    rw [cder_apply, cl₁_tauC, cl₂_tauC, cl₃_tauC, der3_apply', der3_apply']
    funext a b c
    simp only [tauC, Pi.add_apply, Complex.ofReal_add]; ring
  rw [e, hf, hg]
  funext a b c
  simp only [tauC, Pi.smul_apply, Pi.neg_apply, Complex.ofReal_neg, smul_eq_mul]
  linear_combination (-(g a b c : ℂ)) * Complex.I_mul_I

variable [DecidableEq ι]

/-- `Σ_{a'} P_s(a, a') v(a') = (v a − s i (J v) a)/2`. -/
lemma sum_cplxProj (s : ℝ) (v : ι → ℂ) (a : ι) :
    ∑ a', cplxProj J s a a' * v a' = 1 / 2 * (v a - s * Complex.I * ∑ p, (J a p : ℂ) * v p) := by
  have e : ∀ a', cplxProj J s a a' * v a'
      = (if a = a' then v a' else 0) / 2 - (s * Complex.I * (J a a' : ℂ) * v a') / 2 := fun a' => by
    unfold cplxProj; split_ifs <;> ring
  simp only [e, Finset.sum_sub_distrib, ← Finset.sum_div, Finset.sum_ite_eq, Finset.mem_univ,
    ite_true, Finset.mul_sum]
  rw [mul_sub]
  congr 1
  · ring
  · rw [Finset.mul_sum, Finset.sum_div]
    exact Finset.sum_congr rfl fun p _ => by ring

/-- `t = 3 P₊P₊P₋ τ`. -/
lemma cplxT_eq_sector (f g : ι → ι → ι → ℝ) :
    cplxT J f g = (3 : ℂ) • sector J 1 1 (-1) (tauC f g) := by
  funext a b c
  simp only [cplxT, Pi.smul_apply, smul_eq_mul]
  congr 1
  have e3 : ∀ a' b', ∑ c', cplxProj J (-1) c c' * tauC f g a' b' c'
      = cPr (cl₃ J) (-1) (tauC f g) a' b' c := fun a' b' => by
    rw [sum_cplxProj, cPr_apply_pt (cl₃ J), cl₃_apply]; push_cast; ring
  have e2 : ∀ a', ∑ b', cplxProj J 1 b b' * cPr (cl₃ J) (-1) (tauC f g) a' b' c
      = cPr (cl₂ J) 1 (cPr (cl₃ J) (-1) (tauC f g)) a' b c := fun a' => by
    rw [sum_cplxProj, cPr_apply_pt (cl₂ J), cl₂_apply]; push_cast; ring
  have e1 : ∑ a', cplxProj J 1 a a' * cPr (cl₂ J) 1 (cPr (cl₃ J) (-1) (tauC f g)) a' b c
      = cPr (cl₁ J) 1 (cPr (cl₂ J) 1 (cPr (cl₃ J) (-1) (tauC f g))) a b c := by
    rw [sum_cplxProj, cPr_apply_pt (cl₁ J), cl₁_apply]; push_cast; ring
  rw [sector, ← e1]
  refine Finset.sum_congr rfl fun a' _ => ?_
  rw [← e2, Finset.mul_sum]
  refine Finset.sum_congr rfl fun b' _ => ?_
  rw [← e3, Finset.mul_sum, Finset.mul_sum]
  refine Finset.sum_congr rfl fun c' _ => ?_
  simp only [tauC]; ring

variable (hJ : IsCplx J)
include hJ

/-- `J₁ t = i t`. -/
lemma cl₁_cplxT (f g : ι → ι → ι → ℝ) : cl₁ J (cplxT J f g) = Complex.I • cplxT J f g := by
  rw [cplxT_eq_sector, map_smul, sector, L_cPr (cl_sq1 hJ) (by norm_num), one_mul, smul_comm]

/-- `J₂ t = i t`. -/
lemma cl₂_cplxT (f g : ι → ι → ι → ℝ) : cl₂ J (cplxT J f g) = Complex.I • cplxT J f g := by
  rw [cplxT_eq_sector, map_smul, sector, M_cPr cl_comm12, L_cPr (cl_sq2 hJ) (by norm_num), one_mul,
    map_smul, smul_comm]

/-- `J₃ t = −i t`. -/
lemma cl₃_cplxT (f g : ι → ι → ι → ℝ) : cl₃ J (cplxT J f g) = (-Complex.I) • cplxT J f g := by
  rw [cplxT_eq_sector, map_smul, sector, M_cPr cl_comm13, M_cPr cl_comm23,
    L_cPr (cl_sq3 hJ) (by norm_num), map_smul, map_smul, smul_comm, neg_one_mul]

/-- The swap of the last two slots. -/
def sw23c (X : ι → ι → ι → ℂ) (a b c : ι) : ℂ := X a c b
/-- The swap of the outer slots. -/
def sw13c (X : ι → ι → ι → ℂ) (a b c : ι) : ℂ := X c b a

omit hJ [DecidableEq ι] in
lemma cPr_sw23 (s : ℂ) (X : ι → ι → ι → ℂ) :
    cPr (cl₂ J) s (sw23c X) = sw23c (cPr (cl₃ J) s X)
      ∧ cPr (cl₃ J) s (sw23c X) = sw23c (cPr (cl₂ J) s X)
      ∧ cPr (cl₁ J) s (sw23c X) = sw23c (cPr (cl₁ J) s X) := by
  refine ⟨?_, ?_, ?_⟩ <;> funext a b c <;>
    simp only [sw23c, cPr_apply_pt, cl₁_apply, cl₂_apply, cl₃_apply]

omit hJ [DecidableEq ι] in
lemma cPr_sw13 (s : ℂ) (X : ι → ι → ι → ℂ) :
    cPr (cl₁ J) s (sw13c X) = sw13c (cPr (cl₃ J) s X)
      ∧ cPr (cl₃ J) s (sw13c X) = sw13c (cPr (cl₁ J) s X)
      ∧ cPr (cl₂ J) s (sw13c X) = sw13c (cPr (cl₂ J) s X) := by
  refine ⟨?_, ?_, ?_⟩ <;> funext a b c <;>
    simp only [sw13c, cPr_apply_pt, cl₁_apply, cl₂_apply, cl₃_apply]

/-- **`τ = Sym t`**: for the fully symmetric kernels of a circular pair,
`f + ig = (t_{abc} + t_{acb} + t_{cba})/3`. -/
theorem tauC_eq_sym {f g : ι → ι → ι → ℝ} (hf : der3 J f = -g) (hg : der3 J g = f)
    (hf23 : ∀ a b c, f a c b = f a b c) (hf13 : ∀ a b c, f c b a = f a b c)
    (hg23 : ∀ a b c, g a c b = g a b c) (hg13 : ∀ a b c, g c b a = g a b c) (a b c : ι) :
    tauC f g a b c = (cplxT J f g a b c + cplxT J f g a c b + cplxT J f g c b a) / 3 := by
  have hτ := cder_tauC hf hg
  have h23 : sw23c (tauC f g) = tauC f g := by
    funext a b c; simp only [sw23c, tauC, hf23, hg23]
  have h13 : sw13c (tauC f g) = tauC f g := by
    funext a b c; simp only [sw13c, tauC, hf13, hg13]
  have z : ∀ s₁ s₂ s₃ : ℂ, s₁ * s₁ = 1 → s₂ * s₂ = 1 → s₃ * s₃ = 1 → s₁ + s₂ + s₃ ≠ 1 →
      sector J s₁ s₂ s₃ (tauC f g) = 0 := fun s₁ s₂ s₃ h₁ h₂ h₃ hs =>
    sector_eq_zero hJ hτ h₁ h₂ h₃ hs
  have hsum := sector_sum (J := J) (tauC f g)
  rw [z 1 1 1 (by norm_num) (by norm_num) (by norm_num) (by norm_num),
    z 1 (-1) (-1) (by norm_num) (by norm_num) (by norm_num) (by norm_num),
    z (-1) 1 (-1) (by norm_num) (by norm_num) (by norm_num) (by norm_num),
    z (-1) (-1) 1 (by norm_num) (by norm_num) (by norm_num) (by norm_num),
    z (-1) (-1) (-1) (by norm_num) (by norm_num) (by norm_num) (by norm_num)] at hsum
  -- the two other surviving sectors are the slot permutations of `P₊P₊P₋ τ`
  have e2 : sector J 1 (-1) 1 (tauC f g) = sw23c (sector J 1 1 (-1) (tauC f g)) := by
    unfold sector
    conv_lhs => rw [← h23]
    rw [(cPr_sw23 1 _).2.1, (cPr_sw23 (-1) _).1, (cPr_sw23 1 _).2.2,
      cPr_cPr_comm (L := cl₂ J) (M := cl₃ J) cl_comm23]
  have e3 : sector J (-1) 1 1 (tauC f g) = sw13c (sector J 1 1 (-1) (tauC f g)) := by
    unfold sector
    conv_lhs => rw [← h13]
    rw [(cPr_sw13 1 _).2.1, (cPr_sw13 1 _).2.2, (cPr_sw13 (-1) _).1,
      cPr_cPr_comm (L := cl₁ J) (M := cl₂ J) cl_comm12,
      cPr_cPr_comm (L := cl₁ J) (M := cl₃ J) cl_comm13,
      cPr_cPr_comm (L := cl₂ J) (M := cl₃ J) cl_comm23]
  rw [e2, e3] at hsum
  have ht : sector J 1 1 (-1) (tauC f g) = (1 / 3 : ℂ) • cplxT J f g := by
    rw [cplxT_eq_sector, smul_smul]; norm_num
  rw [ht] at hsum
  have := congrFun (congrFun (congrFun hsum a) b) c
  simp only [Pi.add_apply, Pi.zero_apply, Pi.smul_apply, sw23c, sw13c, smul_eq_mul, zero_add,
    add_zero] at this
  rw [← this]; ring

end tau

/-! ### Slot charges and the vanishing of mismatched contractions -/

section charge

variable (J : ι → ι → ℝ)

/-- `u` is a `J`-eigenvector with eigenvalue `s` (`s = ±i` for the slot charges). -/
def Chg (s : ℂ) (u : ι → ℂ) : Prop := ∀ a, ∑ p, (J a p : ℂ) * u p = s * u a

variable {J}

lemma Chg.sum {κ : Type*} [Fintype κ] {s : ℂ} {u : κ → ι → ℂ} (h : ∀ k, Chg J s (u k)) :
    Chg J s (fun a => ∑ k, u k a) := by
  intro a
  simp only [Finset.mul_sum]
  rw [Finset.sum_comm]
  exact Finset.sum_congr rfl fun k _ => h k a

lemma Chg.mul_const {s : ℂ} {u : ι → ℂ} (h : Chg J s u) (c : ℂ) : Chg J s (fun a => u a * c) := by
  intro a
  simp only [← mul_assoc, ← Finset.sum_mul, h a]

lemma Chg.const_mul {s : ℂ} {u : ι → ℂ} (h : Chg J s u) (c : ℂ) : Chg J s (fun a => c * u a) := by
  intro a
  simp only [mul_left_comm _ c, ← Finset.mul_sum, h a]

lemma Chg.conj {s : ℂ} {u : ι → ℂ} (h : Chg J s u) : Chg J (conj s) (fun a => conj (u a)) := by
  intro a
  have := congrArg conj (h a)
  simpa only [map_sum, map_mul, Complex.conj_ofReal] using this

/-- **Charge conservation**: the contraction of two eigenvectors with `s + s' ≠ 0` vanishes. -/
lemma Chg.sum_mul_eq_zero (hJ : ∀ i j, J i j = -J j i) {s s' : ℂ} {u v : ι → ℂ}
    (hu : Chg J s u) (hv : Chg J s' v) (h : s + s' ≠ 0) : ∑ a, u a * v a = 0 := by
  have h1 : s * ∑ a, u a * v a = ∑ a, (∑ p, (J a p : ℂ) * u p) * v a := by
    rw [Finset.mul_sum]
    exact Finset.sum_congr rfl fun a _ => by rw [hu a]; ring
  have h2 : ∑ a, (∑ p, (J a p : ℂ) * u p) * v a = -(s' * ∑ a, u a * v a) := by
    simp only [Finset.sum_mul]
    rw [Finset.sum_comm, Finset.mul_sum, ← Finset.sum_neg_distrib]
    refine Finset.sum_congr rfl fun p _ => ?_
    rw [show ∑ x, (J x p : ℂ) * u p * v x = u p * ∑ x, (J x p : ℂ) * v x by
      rw [Finset.mul_sum]; exact Finset.sum_congr rfl fun x _ => by ring]
    have e : ∑ x, (J x p : ℂ) * v x = -(s' * v p) := by
      rw [← hv p, ← Finset.sum_neg_distrib]
      exact Finset.sum_congr rfl fun x _ => by rw [hJ x p]; push_cast; ring
    rw [e]; ring
  have h3 : (s + s') * ∑ a, u a * v a = 0 := by rw [add_mul, h1, h2]; ring
  exact (mul_eq_zero.mp h3).resolve_left h

variable [DecidableEq ι] (hJ : IsCplx J) (f g : ι → ι → ι → ℝ)
include hJ

/-- Slot charges of `t`: `+i, +i, −i`. -/
lemma chg_t1 (b c : ι) : Chg J Complex.I (fun a => cplxT J f g a b c) := fun a => by
  have := congrFun (congrFun (congrFun (cl₁_cplxT hJ f g) a) b) c
  simpa only [cl₁_apply, Pi.smul_apply, smul_eq_mul] using this
lemma chg_t2 (a c : ι) : Chg J Complex.I (fun b => cplxT J f g a b c) := fun b => by
  have := congrFun (congrFun (congrFun (cl₂_cplxT hJ f g) a) b) c
  simpa only [cl₂_apply, Pi.smul_apply, smul_eq_mul] using this
lemma chg_t3 (a b : ι) : Chg J (-Complex.I) (fun c => cplxT J f g a b c) := fun c => by
  have := congrFun (congrFun (congrFun (cl₃_cplxT hJ f g) a) b) c
  simpa only [cl₃_apply, Pi.smul_apply, smul_eq_mul] using this

omit hJ in
lemma two_I_ne_zero : Complex.I + Complex.I ≠ 0 := by
  rw [← two_mul]; exact mul_ne_zero two_ne_zero Complex.I_ne_zero
omit hJ in
lemma neg_two_I_ne_zero : -Complex.I + -Complex.I ≠ 0 := by
  rw [← neg_add, neg_ne_zero]; exact two_I_ne_zero

/-- Slot charges of `conj t`: `−i, −i, +i`. -/
lemma chg_ct1 (b c : ι) : Chg J (-Complex.I) (fun a => conj (cplxT J f g a b c)) := by
  simpa only [Complex.conj_I] using (chg_t1 hJ f g b c).conj
lemma chg_ct2 (a c : ι) : Chg J (-Complex.I) (fun b => conj (cplxT J f g a b c)) := by
  simpa only [Complex.conj_I] using (chg_t2 hJ f g a c).conj
lemma chg_ct3 (a b : ι) : Chg J Complex.I (fun c => conj (cplxT J f g a b c)) := by
  simpa only [Complex.conj_neg_I] using (chg_t3 hJ f g a b).conj

/-- Slot charges of `N`: `(+i, −i)`. -/
lemma chg_N1 (d : ι) : Chg J Complex.I (fun c => ctN (cplxT J f g) c d) :=
  Chg.sum fun j => Chg.sum fun k => (chg_t1 hJ f g j k).mul_const _
lemma chg_N2 (c : ι) : Chg J (-Complex.I) (fun d => ctN (cplxT J f g) c d) :=
  Chg.sum fun j => Chg.sum fun k => (chg_ct1 hJ f g j k).const_mul _
/-- Slot charges of `H`: `(−i, +i)`. -/
lemma chg_H1 (d : ι) : Chg J (-Complex.I) (fun c => ctH (cplxT J f g) c d) :=
  Chg.sum fun j => Chg.sum fun k => (chg_t3 hJ f g j k).mul_const _
lemma chg_H2 (c : ι) : Chg J Complex.I (fun d => ctH (cplxT J f g) c d) :=
  Chg.sum fun j => Chg.sum fun k => (chg_ct3 hJ f g j k).const_mul _
/-- Slot charges of `B`: `(+i, +i)`. -/
lemma chg_B1 (e : ι) : Chg J Complex.I (fun b => ctB (cplxT J f g) b e) :=
  Chg.sum fun a => Chg.sum fun d => (chg_t2 hJ f g a d).mul_const _
lemma chg_B2 (b : ι) : Chg J Complex.I (fun e => ctB (cplxT J f g) b e) :=
  Chg.sum fun a => Chg.sum fun d => (chg_t2 hJ f g d a).const_mul _

end charge

/-! ### The second-chaos identities: `u₂ = 16n + 4h + 16z`, `v₂ = 32b` -/

section chaos2

/-- `Σ_{ji} f_{mij} g_{nij}`, the Gram matrix of the kernels in their last two slots. -/
def kerGs (f g : ι → ι → ι → ℝ) (m n : ι) : ℝ := ∑ j, ∑ i, f m i j * g n i j

/-- `Σ_{ji} τ_{mij} conj τ_{nij}`. -/
def Htau2 (f g : ι → ι → ι → ℝ) (m n : ι) : ℂ := ∑ j, ∑ i, tauC f g m i j * conj (tauC f g n i j)
/-- `Σ_{ji} τ_{mij} τ_{nij}`. -/
def Gtau2 (f g : ι → ι → ι → ℝ) (m n : ι) : ℂ := ∑ j, ∑ i, tauC f g m i j * tauC f g n i j

lemma Htau2_re (f g : ι → ι → ι → ℝ) (m n : ι) :
    (Htau2 f g m n).re = kerGs f f m n + kerGs g g m n := by
  simp only [Htau2, kerGs, Complex.re_sum, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun j _ => Finset.sum_congr rfl fun i _ => ?_
  simp only [tauC, Complex.mul_re, Complex.add_re, Complex.add_im, Complex.ofReal_re,
    Complex.ofReal_im, Complex.mul_im, Complex.I_re, Complex.I_im, Complex.conj_re,
    Complex.conj_im]
  ring

lemma Gtau2_re (f g : ι → ι → ι → ℝ) (m n : ι) :
    (Gtau2 f g m n).re = kerGs f f m n - kerGs g g m n := by
  simp only [Gtau2, kerGs, Complex.re_sum, ← Finset.sum_sub_distrib]
  refine Finset.sum_congr rfl fun j _ => Finset.sum_congr rfl fun i _ => ?_
  simp only [tauC, Complex.mul_re, Complex.add_re, Complex.add_im, Complex.ofReal_re,
    Complex.ofReal_im, Complex.mul_im, Complex.I_re, Complex.I_im]
  ring

lemma Gtau2_im (f g : ι → ι → ι → ℝ) (m n : ι) :
    (Gtau2 f g m n).im = kerGs f g m n + kerGs f g n m := by
  simp only [Gtau2, kerGs, Complex.im_sum, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun j _ => Finset.sum_congr rfl fun i _ => ?_
  simp only [tauC, Complex.mul_re, Complex.add_re, Complex.add_im, Complex.ofReal_re,
    Complex.ofReal_im, Complex.mul_im, Complex.I_re, Complex.I_im]
  ring

variable [DecidableEq ι] {J : ι → ι → ℝ} (hJ : IsCplx J) {f g : ι → ι → ι → ℝ}
  (hsym : ∀ a b c, tauC f g a b c = (cplxT J f g a b c + cplxT J f g a c b + cplxT J f g c b a) / 3)
  (ht : ∀ a b c, cplxT J f g a b c = cplxT J f g b a c)
include hJ hsym ht

omit ht in
/-- `Σ_{ji} τ_{mij} conj τ_{nij} = (H + 2N)/9`: the charge-conserving terms of the sector
expansion of `τ`. -/
theorem Htau2_eq (m n : ι) :
    Htau2 f g m n = (ctH (cplxT J f g) m n + 2 * ctN (cplxT J f g) m n) / 9 := by
  set t := cplxT J f g with ht_def
  have e : ∀ j i, tauC f g m i j * conj (tauC f g n i j) = (1 / 9 : ℂ)
      * (t m i j * conj (t n i j) + t m i j * conj (t n j i) + t m i j * conj (t j i n)
        + t m j i * conj (t n i j) + t m j i * conj (t n j i) + t m j i * conj (t j i n)
        + t j i m * conj (t n i j) + t j i m * conj (t n j i) + t j i m * conj (t j i n)) :=
    fun j i => by rw [hsym m i j, hsym n i j]; simp only [map_div₀, map_add, map_ofNat]; ring
  have hA : ∀ i j, J i j = -J j i := hJ.anti
  have v12 : ∑ j, ∑ i, t m i j * conj (t n j i) = 0 := Finset.sum_eq_zero fun j _ =>
    Chg.sum_mul_eq_zero hA (chg_t2 hJ f g m j) (chg_ct3 hJ f g n j) two_I_ne_zero
  have v13 : ∑ j, ∑ i, t m i j * conj (t j i n) = 0 := by
    rw [Finset.sum_comm]
    exact Finset.sum_eq_zero fun i _ =>
      Chg.sum_mul_eq_zero hA (chg_t3 hJ f g m i) (chg_ct1 hJ f g i n) neg_two_I_ne_zero
  have v21 : ∑ j, ∑ i, t m j i * conj (t n i j) = 0 := Finset.sum_eq_zero fun j _ =>
    Chg.sum_mul_eq_zero hA (chg_t3 hJ f g m j) (chg_ct2 hJ f g n j) neg_two_I_ne_zero
  have v23 : ∑ j, ∑ i, t m j i * conj (t j i n) = 0 := Finset.sum_eq_zero fun j _ =>
    Chg.sum_mul_eq_zero hA (chg_t3 hJ f g m j) (chg_ct2 hJ f g j n) neg_two_I_ne_zero
  have v31 : ∑ j, ∑ i, t j i m * conj (t n i j) = 0 := by
    rw [Finset.sum_comm]
    exact Finset.sum_eq_zero fun i _ =>
      Chg.sum_mul_eq_zero hA (chg_t1 hJ f g i m) (chg_ct3 hJ f g n i) two_I_ne_zero
  have v32 : ∑ j, ∑ i, t j i m * conj (t n j i) = 0 := Finset.sum_eq_zero fun j _ =>
    Chg.sum_mul_eq_zero hA (chg_t2 hJ f g j m) (chg_ct3 hJ f g n j) two_I_ne_zero
  have s11 : ∑ j, ∑ i, t m i j * conj (t n i j) = ctN t m n := Finset.sum_comm
  have s22 : ∑ j, ∑ i, t m j i * conj (t n j i) = ctN t m n := rfl
  have s33 : ∑ j, ∑ i, t j i m * conj (t j i n) = ctH t m n := rfl
  simp only [Htau2, e, ← Finset.mul_sum, Finset.sum_add_distrib, v12, v13, v21, v23, v31, v32, s11,
    s22, s33]
  ring

/-- `Σ_{ji} τ_{mij} τ_{nij} = 2B/9`. -/
theorem Gtau2_eq (m n : ι) : Gtau2 f g m n = 2 * ctB (cplxT J f g) m n / 9 := by
  set t := cplxT J f g with ht_def
  have e : ∀ j i, tauC f g m i j * tauC f g n i j = (1 / 9 : ℂ)
      * (t m i j * t n i j + t m i j * t n j i + t m i j * t j i n
        + t m j i * t n i j + t m j i * t n j i + t m j i * t j i n
        + t j i m * t n i j + t j i m * t n j i + t j i m * t j i n) :=
    fun j i => by rw [hsym m i j, hsym n i j]; ring
  have hA : ∀ i j, J i j = -J j i := hJ.anti
  have v11 : ∑ j, ∑ i, t m i j * t n i j = 0 := Finset.sum_eq_zero fun j _ =>
    Chg.sum_mul_eq_zero hA (chg_t2 hJ f g m j) (chg_t2 hJ f g n j) two_I_ne_zero
  have v13 : ∑ j, ∑ i, t m i j * t j i n = 0 := Finset.sum_eq_zero fun j _ =>
    Chg.sum_mul_eq_zero hA (chg_t2 hJ f g m j) (chg_t2 hJ f g j n) two_I_ne_zero
  have v22 : ∑ j, ∑ i, t m j i * t n j i = 0 := Finset.sum_eq_zero fun j _ =>
    Chg.sum_mul_eq_zero hA (chg_t3 hJ f g m j) (chg_t3 hJ f g n j) neg_two_I_ne_zero
  have v23 : ∑ j, ∑ i, t m j i * t j i n = 0 := by
    rw [Finset.sum_comm]
    exact Finset.sum_eq_zero fun i _ =>
      Chg.sum_mul_eq_zero hA (chg_t2 hJ f g m i) (chg_t1 hJ f g i n) two_I_ne_zero
  have v31 : ∑ j, ∑ i, t j i m * t n i j = 0 := Finset.sum_eq_zero fun j _ =>
    Chg.sum_mul_eq_zero hA (chg_t2 hJ f g j m) (chg_t2 hJ f g n j) two_I_ne_zero
  have v32 : ∑ j, ∑ i, t j i m * t n j i = 0 := by
    rw [Finset.sum_comm]
    exact Finset.sum_eq_zero fun i _ =>
      Chg.sum_mul_eq_zero hA (chg_t1 hJ f g i m) (chg_t2 hJ f g n i) two_I_ne_zero
  have v33 : ∑ j, ∑ i, t j i m * t j i n = 0 := Finset.sum_eq_zero fun j _ =>
    Chg.sum_mul_eq_zero hA (chg_t2 hJ f g j m) (chg_t2 hJ f g j n) two_I_ne_zero
  have s12 : ∑ j, ∑ i, t m i j * t n j i = ctB t m n := by
    rw [Finset.sum_comm]
    exact Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => by
      rw [ht m i j, ht n j i]
  have s21 : ∑ j, ∑ i, t m j i * t n i j = ctB t m n :=
    Finset.sum_congr rfl fun j _ => Finset.sum_congr rfl fun i _ => by rw [ht m j i, ht n i j]
  simp only [Gtau2, e, ← Finset.mul_sum, Finset.sum_add_distrib, v11, v13, v22, v23, v31, v32,
    v33, s12, s21]
  ring

omit hsym ht in
/-- `Σ (Re (H + 2N))² = (h + 4n + 4z)/2`. -/
theorem sum_re_sq_K :
    ∑ m, ∑ n, ((ctH (cplxT J f g) m n + 2 * ctN (cplxT J f g) m n).re) ^ 2
      = (gramH (cplxT J f g) + 4 * gramN (cplxT J f g) + 4 * gramZ (cplxT J f g)) / 2 := by
  set t := cplxT J f g with ht_def
  have hA : ∀ i j, J i j = -J j i := hJ.anti
  have e : ∀ w : ℂ, (w.re) ^ 2 = (Complex.normSq w + (w * w).re) / 2 := fun w => by
    simp only [Complex.normSq_apply, Complex.mul_re]; ring
  have vHN : ∑ m, ∑ n, ctH t m n * conj (ctN t m n) = 0 := Finset.sum_eq_zero fun m _ =>
    Chg.sum_mul_eq_zero hA (chg_H2 hJ f g m) (by simpa only [Complex.conj_neg_I] using
      (chg_N2 hJ f g m).conj) two_I_ne_zero
  have vHH : ∑ m, ∑ n, ctH t m n * ctH t m n = 0 := Finset.sum_eq_zero fun m _ =>
    Chg.sum_mul_eq_zero hA (chg_H2 hJ f g m) (chg_H2 hJ f g m) two_I_ne_zero
  have vNN : ∑ m, ∑ n, ctN t m n * ctN t m n = 0 := Finset.sum_eq_zero fun m _ =>
    Chg.sum_mul_eq_zero hA (chg_N2 hJ f g m) (chg_N2 hJ f g m) neg_two_I_ne_zero
  have e2 : ∀ m n, ((ctH t m n + 2 * ctN t m n).re) ^ 2
      = (Complex.normSq (ctH t m n) + 4 * Complex.normSq (ctN t m n)
        + 4 * (ctH t m n * conj (ctN t m n)).re
        + ((ctH t m n * ctH t m n).re + 4 * (ctN t m n * ctH t m n).re
          + 4 * (ctN t m n * ctN t m n).re)) / 2 := fun m n => by
    simp only [Complex.normSq_apply, Complex.mul_re, Complex.add_re, Complex.conj_re,
      Complex.conj_im, Complex.re_ofNat, Complex.im_ofNat]
    ring
  have r1 : ∑ m, ∑ n, (ctH t m n * conj (ctN t m n)).re = 0 := by
    simp only [← Complex.re_sum, vHN, Complex.zero_re]
  have r2 : ∑ m, ∑ n, (ctH t m n * ctH t m n).re = 0 := by
    simp only [← Complex.re_sum, vHH, Complex.zero_re]
  have r3 : ∑ m, ∑ n, (ctN t m n * ctN t m n).re = 0 := by
    simp only [← Complex.re_sum, vNN, Complex.zero_re]
  simp only [e2, ← Finset.sum_div, Finset.sum_add_distrib, ← Finset.mul_sum, r1, r2, r3]
  simp only [gramH, gramN, gramZ]
  ring

end chaos2

/-! ### The Ornstein–Uhlenbeck ladder and the kernel derivatives -/

section ladder

variable [DecidableEq ι]

omit [DecidableEq ι] in
lemma kerGs_comm (f : ι → ι → ι → ℝ) (m n : ι) : kerGs f f n m = kerGs f f m n :=
  Finset.sum_congr rfl fun _ _ => Finset.sum_congr rfl fun _ _ => mul_comm _ _

lemma quad_of_eig {X : MvPolynomial ι ℝ} (hX : ouL X = -(2 * X))
    (hc : ∀ m n, ∃ t : ℝ, pderiv n (pderiv m X) = C t) : Quad X where
  eig := hX
  eig1 m := by rw [ouL_pderiv, hX, map_neg, ofNat_mul_apply]; ring
  cst := hc

variable {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ} (hE : IsGaussianExpectation E)

include hE in
/-- **The second-chaos ladder**: `E X² = ½ Σ_{mn} (∂ₙ∂ₘX)²` for constant second derivatives. -/
lemma gE_sq_quad {X : MvPolynomial ι ℝ} (hX : ouL X = -(2 * X)) (c : ι → ι → ℝ)
    (hc : ∀ m n, pderiv n (pderiv m X) = C (c m n)) :
    E (X * X) = 1 / 2 * ∑ m, ∑ n, c m n * c m n := by
  have hQ : Quad X := quad_of_eig hX fun m n => ⟨c m n, hc m n⟩
  rw [hQ.gE_mul hE, hQ.gE_gam hE c c hc hc]

omit [Fintype ι] [DecidableEq ι] in
lemma kern_eq_six (F : MvPolynomial ι ℝ) (i j k : ι) : kern F i j k = 6 * cubicKernel F i j k := by
  unfold cubicKernel; ring

omit [DecidableEq ι] in
/-- `∂ₙ∂ₘ Π₂(ab) = 18 (Σ_{ji} f_{mij} g_{nij} + Σ_{ji} f_{nij} g_{mij})`. -/
lemma pderiv2_comp2 {a b : MvPolynomial ι ℝ} (ha : Chaos3 a) (hb : Chaos3 b) (m n : ι) :
    pderiv n (pderiv m (comp2 E a b)) = C (18 * (kerGs (cubicKernel a) (cubicKernel b) m n
      + kerGs (cubicKernel a) (cubicKernel b) n m)) := by
  simp only [comp2, map_sub, map_add, pderiv_C, gam2c, gam, map_sum, pderiv_mul, ha.pderiv3_eq,
    hb.pderiv3_eq, zero_mul, zero_add, mul_zero, add_zero, sub_zero]
  simp only [← map_mul, ← map_add, ← map_sum (C : ℝ →+* MvPolynomial ι ℝ)]
  congr 1
  simp only [kerGs, kern_eq_six, Finset.mul_sum, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun j _ => Finset.sum_congr rfl fun i _ => ?_
  ring

end ladder

/-! ### The spectral identities `u₂`, `v₂` for a circular cubic -/

section spectral2

variable [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ} (hE : IsGaussianExpectation E)
  {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ} (ha : Chaos3 a) (hc : Circular J a b)
  (haa : E (a * a) = 1 / 2)
include hE ha hc haa

omit hE ha haa in
/-- The full symmetry of the kernels and `τ = Sym t` for a circular pair. -/
lemma Circular.tauC_eq (i j k : ι) :
    tauC (cubicKernel a) (cubicKernel b) i j k
      = (cplxT J (cubicKernel a) (cubicKernel b) i j k + cplxT J (cubicKernel a) (cubicKernel b) i k j
        + cplxT J (cubicKernel a) (cubicKernel b) k j i) / 3 := by
  have h13 : ∀ (F : MvPolynomial ι ℝ) a b c, cubicKernel F c b a = cubicKernel F a b c :=
    fun F a b c => by unfold cubicKernel; rw [kern_rev]
  have h23 : ∀ (F : MvPolynomial ι ℝ) a b c, cubicKernel F a c b = cubicKernel F a b c :=
    fun F a b c => by rw [cubicKernel_symm12 F a c b, h13 F b a c, cubicKernel_symm12 F b a c]
  exact tauC_eq_sym hc.isCplx hc.der3_left hc.der3_right (h23 a) (h13 a) (h23 b) (h13 b) i j k

/-- **`u₂ = 16n + 4h + 16z`** (the field `u2_eq`). -/
theorem Circular.specU2_eq : specU2 E a b
    = 16 * gramN (gramT J a b) + 4 * gramH (gramT J a b) + 16 * gramZ (gramT J a b) := by
  have hb : Chaos3 b := hc.chaos3_right ha
  have hbb : E (b * b) = 1 / 2 := by rw [← hc.gE_sq_eq hE, haa]
  have hJ := hc.isCplx
  have hsym := hc.tauC_eq
  have ht : ∀ i j k, cplxT J (cubicKernel a) (cubicKernel b) i j k
      = cplxT J (cubicKernel a) (cubicKernel b) j i k := gramT_symm12 J a b
  obtain ⟨p2, -, -⟩ := proj_radU hE ha hb (v := 1) haa hbb
  show specU2 E a b = 16 * gramN (cplxT J (cubicKernel a) (cubicKernel b))
    + 4 * gramH (cplxT J (cubicKernel a) (cubicKernel b))
    + 16 * gramZ (cplxT J (cubicKernel a) (cubicKernel b))
  unfold specU2
  rw [p2]
  have hX := eigen_add 2 (comp2_eig hE ha ha) (comp2_eig hE hb hb)
  have hcd : ∀ m n, pderiv n (pderiv m (comp2 E a a + comp2 E b b))
      = C (36 * (kerGs (cubicKernel a) (cubicKernel a) m n
        + kerGs (cubicKernel b) (cubicKernel b) m n)) := fun m n => by
    rw [map_add, map_add, pderiv2_comp2 ha ha, pderiv2_comp2 hb hb, ← map_add, kerGs_comm _ n m,
      kerGs_comm _ n m]
    congr 1; ring
  rw [gE_sq_quad hE hX _ hcd]
  set t := cplxT J (cubicKernel a) (cubicKernel b) with ht_def
  have hre : ∀ m n, kerGs (cubicKernel a) (cubicKernel a) m n
      + kerGs (cubicKernel b) (cubicKernel b) m n
      = (ctH t m n + 2 * ctN t m n).re / 9 := fun m n => by
    rw [← Htau2_re, Htau2_eq hJ hsym m n, Complex.div_ofNat_re]
  have e : ∀ m n, 36 * ((ctH t m n + 2 * ctN t m n).re / 9)
      * (36 * ((ctH t m n + 2 * ctN t m n).re / 9))
      = 16 * ((ctH t m n + 2 * ctN t m n).re) ^ 2 := fun m n => by ring
  simp only [hre, e, ← Finset.mul_sum]
  rw [sum_re_sq_K hJ (f := cubicKernel a) (g := cubicKernel b)]
  ring

/-- **`v₂ = 32b`** (the field `v2_eq`). -/
theorem Circular.specV2_eq : specV2 E a b = 32 * gramB (gramT J a b) := by
  have hb : Chaos3 b := hc.chaos3_right ha
  have hbb : E (b * b) = 1 / 2 := by rw [← hc.gE_sq_eq hE, haa]
  have hab : E (a * b) = 0 := hc.gE_mul hE
  have hJ := hc.isCplx
  have hsym := hc.tauC_eq
  have ht : ∀ i j k, cplxT J (cubicKernel a) (cubicKernel b) i j k
      = cplxT J (cubicKernel a) (cubicKernel b) j i k := gramT_symm12 J a b
  obtain ⟨p2, -, -⟩ := proj_radP hE ha hb (v := 1) haa hbb
  obtain ⟨q2, -, -⟩ := proj_radQ hE ha hb hab
  show specV2 E a b = 32 * gramB (cplxT J (cubicKernel a) (cubicKernel b))
  set t := cplxT J (cubicKernel a) (cubicKernel b) with ht_def
  unfold specV2
  rw [p2, q2]
  have hP := eigen_sub 2 (comp2_eig hE ha ha) (comp2_eig hE hb hb)
  have hQ := eigen_two_mul 2 (comp2_eig hE ha hb)
  have hcP : ∀ m n, pderiv n (pderiv m (comp2 E a a - comp2 E b b))
      = C (36 * (kerGs (cubicKernel a) (cubicKernel a) m n
        - kerGs (cubicKernel b) (cubicKernel b) m n)) := fun m n => by
    rw [map_sub, map_sub, pderiv2_comp2 ha ha, pderiv2_comp2 hb hb, ← map_sub, kerGs_comm _ n m,
      kerGs_comm _ n m]
    congr 1; ring
  have hcQ : ∀ m n, pderiv n (pderiv m (2 * comp2 E a b))
      = C (36 * (kerGs (cubicKernel a) (cubicKernel b) m n
        + kerGs (cubicKernel a) (cubicKernel b) n m)) := fun m n => by
    rw [ofNat_mul_apply, ofNat_mul_apply, pderiv2_comp2 ha hb, ← C_two_mul]
    congr 1; ring
  rw [gE_sq_quad hE hP _ hcP, gE_sq_quad hE hQ _ hcQ]
  have hns : ∀ m n, Complex.normSq (Gtau2 (cubicKernel a) (cubicKernel b) m n)
      = (kerGs (cubicKernel a) (cubicKernel a) m n - kerGs (cubicKernel b) (cubicKernel b) m n) ^ 2
        + (kerGs (cubicKernel a) (cubicKernel b) m n
          + kerGs (cubicKernel a) (cubicKernel b) n m) ^ 2 := fun m n => by
    rw [Complex.normSq_apply, Gtau2_re, Gtau2_im]; ring
  have hB : ∀ m n, Complex.normSq (Gtau2 (cubicKernel a) (cubicKernel b) m n)
      = 4 / 81 * Complex.normSq (ctB t m n) := fun m n => by
    rw [Gtau2_eq hJ hsym ht m n, show (2 * ctB t m n / 9 : ℂ)
      = ((2 / 9 : ℝ) : ℂ) * ctB t m n by push_cast; ring, Complex.normSq_mul,
      Complex.normSq_ofReal]
    ring
  have key : ∑ m, ∑ n, (kerGs (cubicKernel a) (cubicKernel a) m n
        - kerGs (cubicKernel b) (cubicKernel b) m n) ^ 2
      + ∑ m, ∑ n, (kerGs (cubicKernel a) (cubicKernel b) m n
          + kerGs (cubicKernel a) (cubicKernel b) n m) ^ 2
      = 4 / 81 * gramB t := by
    rw [← Finset.sum_add_distrib]
    simp only [← Finset.sum_add_distrib, ← hns, hB, ← Finset.mul_sum]
    rfl
  have e1 : ∀ x : ℝ, 36 * x * (36 * x) = 1296 * x ^ 2 := fun x => by ring
  simp only [e1, ← Finset.mul_sum]
  linear_combination 648 * key

end spectral2



/-! ### Complex 4-tensors: contraction, partial symmetrisation, plain pairing -/

section four

/-- `(T ⋆ T')_{ab,cd} = Σₓ T_{abx} T'_{cdx}` for complex tensors. -/
def ccon (T T' : ι → ι → ι → ℂ) (a b c d : ι) : ℂ := ∑ x, T a b x * T' c d x

/-- The partial symmetrisation `(X_{abcd} + X_{acbd} + X_{adbc})/3`. -/
def csym4 (X : ι → ι → ι → ι → ℂ) (a b c d : ι) : ℂ := (X a b c d + X a c b d + X a d b c) / 3

/-- The plain (bilinear) pairing `Σ X Y`. -/
def pip (X Y : ι → ι → ι → ι → ℂ) : ℂ := ∑ a, ∑ b, ∑ c, ∑ d, X a b c d * Y a b c d

lemma pip_eq_hip (X Y : ι → ι → ι → ι → ℂ) :
    pip X Y = hip X (fun a b c d => conj (Y a b c d)) := by
  simp only [pip, hip, Complex.conj_conj]

lemma pip_conj_left (X Y : ι → ι → ι → ι → ℂ) :
    pip (fun a b c d => conj (X a b c d)) Y = conj (hip X Y) := by
  simp only [pip, hip, map_sum, map_mul, Complex.conj_conj]

lemma ccon_tauC_re (f g : ι → ι → ι → ℝ) (a b c d : ι) :
    (ccon (tauC f g) (tauC f g) a b c d).re = con f f a b c d - con g g a b c d := by
  simp only [ccon, con, Complex.re_sum, ← Finset.sum_sub_distrib]
  refine Finset.sum_congr rfl fun x _ => ?_
  simp only [tauC, Complex.mul_re, Complex.add_re, Complex.add_im, Complex.ofReal_re,
    Complex.ofReal_im, Complex.mul_im, Complex.I_re, Complex.I_im]
  ring

lemma ccon_tauC_im (f g : ι → ι → ι → ℝ) (a b c d : ι) :
    (ccon (tauC f g) (tauC f g) a b c d).im = con f g a b c d + con g f a b c d := by
  simp only [ccon, con, Complex.im_sum, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun x _ => ?_
  simp only [tauC, Complex.mul_re, Complex.add_re, Complex.add_im, Complex.ofReal_re,
    Complex.ofReal_im, Complex.mul_im, Complex.I_re, Complex.I_im]
  ring

lemma ccon_tauC_conj_re (f g : ι → ι → ι → ℝ) (a b c d : ι) :
    (ccon (tauC f g) (fun a b c => conj (tauC f g a b c)) a b c d).re
      = con f f a b c d + con g g a b c d := by
  simp only [ccon, con, Complex.re_sum, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun x _ => ?_
  simp only [tauC, Complex.mul_re, Complex.add_re, Complex.add_im, Complex.ofReal_re,
    Complex.ofReal_im, Complex.mul_im, Complex.I_re, Complex.I_im, Complex.conj_re, Complex.conj_im]
  ring

omit [Fintype ι] in
lemma csym4_re (X : ι → ι → ι → ι → ℂ) (a b c d : ι) :
    (csym4 X a b c d).re = sym4 (fun a b c d => (X a b c d).re) a b c d := by
  simp only [csym4, sym4, Complex.div_ofNat_re, Complex.add_re]

omit [Fintype ι] in
lemma csym4_im (X : ι → ι → ι → ι → ℂ) (a b c d : ι) :
    (csym4 X a b c d).im = sym4 (fun a b c d => (X a b c d).im) a b c d := by
  simp only [csym4, sym4, Complex.div_ofNat_im, Complex.add_im]

omit [Fintype ι] in
/-- `csym4 X` is fully symmetric when `X` is symmetric in each pair and under the pair swap. -/
lemma csym4_symm {X : ι → ι → ι → ι → ℂ} (h12 : ∀ a b c d, X b a c d = X a b c d)
    (h34 : ∀ a b c d, X a b d c = X a b c d) (hP : ∀ a b c d, X c d a b = X a b c d) :
    (∀ a b c d, csym4 X b a c d = csym4 X a b c d) ∧ (∀ a b c d, csym4 X a c b d = csym4 X a b c d)
      ∧ (∀ a b c d, csym4 X a b d c = csym4 X a b c d) := by
  refine ⟨fun a b c d => ?_, fun a b c d => ?_, fun a b c d => ?_⟩ <;> simp only [csym4]
  · rw [h12 a b c d, ← hP b c a d, ← hP b d a c]; ring
  · rw [h34 a d b c]; ring
  · rw [h34 a b c d]; ring

lemma csum4_rot1 {M : Type*} [AddCommMonoid M] (F : ι → ι → ι → ι → M) :
    ∑ a, ∑ b, ∑ c, ∑ d, F a b c d = ∑ b, ∑ c, ∑ d, ∑ a, F a b c d :=
  Finset.sum_comm.trans (Finset.sum_congr rfl fun _ _ => Finset.sum_comm.trans
    (Finset.sum_congr rfl fun _ _ => Finset.sum_comm))

lemma csum4_rot2 {M : Type*} [AddCommMonoid M] (F : ι → ι → ι → ι → M) :
    ∑ a, ∑ b, ∑ c, ∑ d, F a b c d = ∑ a, ∑ c, ∑ d, ∑ b, F a b c d :=
  Finset.sum_congr rfl fun _ _ => Finset.sum_comm.trans
    (Finset.sum_congr rfl fun _ _ => Finset.sum_comm)

lemma csum4_rot3 {M : Type*} [AddCommMonoid M] (F : ι → ι → ι → ι → M) :
    ∑ a, ∑ b, ∑ c, ∑ d, F a b c d = ∑ a, ∑ b, ∑ d, ∑ c, F a b c d :=
  Finset.sum_congr rfl fun _ _ => Finset.sum_congr rfl fun _ _ => Finset.sum_comm

variable {J : ι → ι → ℝ} (hA : ∀ i j, J i j = -J j i) {X Y : ι → ι → ι → ι → ℂ} {s s' : ℂ}
include hA

/-- Vanishing of a pairing by a charge mismatch in the first slot. -/
lemma hip_zero₁ (hX : ∀ b c d, Chg J s (fun a => X a b c d))
    (hY : ∀ b c d, Chg J s' (fun a => Y a b c d)) (h : s + conj s' ≠ 0) : hip X Y = 0 := by
  unfold hip
  rw [csum4_rot1]
  exact Finset.sum_eq_zero fun b _ => Finset.sum_eq_zero fun c _ => Finset.sum_eq_zero fun d _ =>
    Chg.sum_mul_eq_zero hA (hX b c d) (hY b c d).conj h

/-- Vanishing of a pairing by a charge mismatch in the second slot. -/
lemma hip_zero₂ (hX : ∀ a c d, Chg J s (fun b => X a b c d))
    (hY : ∀ a c d, Chg J s' (fun b => Y a b c d)) (h : s + conj s' ≠ 0) : hip X Y = 0 := by
  unfold hip
  rw [csum4_rot2]
  exact Finset.sum_eq_zero fun a _ => Finset.sum_eq_zero fun c _ => Finset.sum_eq_zero fun d _ =>
    Chg.sum_mul_eq_zero hA (hX a c d) (hY a c d).conj h

/-- Vanishing of a pairing by a charge mismatch in the third slot. -/
lemma hip_zero₃ (hX : ∀ a b d, Chg J s (fun c => X a b c d))
    (hY : ∀ a b d, Chg J s' (fun c => Y a b c d)) (h : s + conj s' ≠ 0) : hip X Y = 0 := by
  unfold hip
  rw [csum4_rot3]
  exact Finset.sum_eq_zero fun a _ => Finset.sum_eq_zero fun b _ => Finset.sum_eq_zero fun d _ =>
    Chg.sum_mul_eq_zero hA (hX a b d) (hY a b d).conj h

/-- Vanishing of a pairing by a charge mismatch in the fourth slot. -/
lemma hip_zero₄ (hX : ∀ a b c, Chg J s (fun d => X a b c d))
    (hY : ∀ a b c, Chg J s' (fun d => Y a b c d)) (h : s + conj s' ≠ 0) : hip X Y = 0 := by
  unfold hip
  exact Finset.sum_eq_zero fun a _ => Finset.sum_eq_zero fun b _ => Finset.sum_eq_zero fun c _ =>
    Chg.sum_mul_eq_zero hA (hX a b c) (hY a b c).conj h

omit hA in
lemma cI_ne₁ : Complex.I + conj (-Complex.I) ≠ 0 := by
  rw [Complex.conj_neg_I]; exact two_I_ne_zero
omit hA in
lemma cI_ne₂ : -Complex.I + conj Complex.I ≠ 0 := by
  rw [Complex.conj_I]; exact neg_two_I_ne_zero

end four

/-! ### Slot charges of `W`, `D`, `C` -/

section charges4

variable [DecidableEq ι] {J : ι → ι → ℝ} (hJ : IsCplx J) (f g : ι → ι → ι → ℝ)
include hJ

local notation "𝓽" => cplxT J f g

/-- `W_{abj;c}`: charges `(+i, +i, +i, −i)`. -/
lemma chg_W1 (b j c : ι) : Chg J Complex.I (fun a => ctW 𝓽 a b j c) :=
  Chg.sum fun i => (chg_t1 hJ f g b i).mul_const _
lemma chg_W2 (a j c : ι) : Chg J Complex.I (fun b => ctW 𝓽 a b j c) :=
  Chg.sum fun i => (chg_t2 hJ f g a i).mul_const _
lemma chg_W3 (a b c : ι) : Chg J Complex.I (fun j => ctW 𝓽 a b j c) :=
  Chg.sum fun i => (chg_t1 hJ f g i c).const_mul _
lemma chg_W4 (a b j : ι) : Chg J (-Complex.I) (fun c => ctW 𝓽 a b j c) :=
  Chg.sum fun i => (chg_t3 hJ f g j i).const_mul _

/-- `D_{ij;kl}`: charges `(+i, +i, −i, −i)`. -/
lemma chg_D1 (j k l : ι) : Chg J Complex.I (fun i => ctD 𝓽 i j k l) :=
  Chg.sum fun a => (chg_t1 hJ f g j a).mul_const _
lemma chg_D2 (i k l : ι) : Chg J Complex.I (fun j => ctD 𝓽 i j k l) :=
  Chg.sum fun a => (chg_t2 hJ f g i a).mul_const _
lemma chg_D3 (i j l : ι) : Chg J (-Complex.I) (fun k => ctD 𝓽 i j k l) :=
  Chg.sum fun a => (chg_ct1 hJ f g l a).const_mul _
lemma chg_D4 (i j k : ι) : Chg J (-Complex.I) (fun l => ctD 𝓽 i j k l) :=
  Chg.sum fun a => (chg_ct2 hJ f g k a).const_mul _

/-- `C_{ij;kl}`: charges `(+i, +i, −i, −i)`. -/
lemma chg_C1 (j k l : ι) : Chg J Complex.I (fun i => ctC 𝓽 i j k l) :=
  Chg.sum fun a => (chg_t1 hJ f g a k).mul_const _
lemma chg_C2 (i k l : ι) : Chg J Complex.I (fun j => ctC 𝓽 i j k l) :=
  Chg.sum fun a => (chg_ct3 hJ f g l a).const_mul _
lemma chg_C3 (i j l : ι) : Chg J (-Complex.I) (fun k => ctC 𝓽 i j k l) :=
  Chg.sum fun a => (chg_t3 hJ f g i a).mul_const _
lemma chg_C4 (i j k : ι) : Chg J (-Complex.I) (fun l => ctC 𝓽 i j k l) :=
  Chg.sum fun a => (chg_ct1 hJ f g a j).const_mul _

end charges4

/-! ### The fourth-chaos ladder and the fourth derivatives -/

section ladder4

variable [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ} (hE : IsGaussianExpectation E)

include hE in
omit [DecidableEq ι] in
lemma gE_sq_step {X : MvPolynomial ι ℝ} {k : ℝ} (hX : ouL X = -(C k * X)) (hk : k ≠ 0) :
    E (X * X) = 1 / k * ∑ i, E (pderiv i X * pderiv i X) := by
  have h := gE_gam_of_eigen hE hX
  rw [gam, map_sum] at h
  rw [h]; field_simp

lemma ouL_pderiv_eig {X : MvPolynomial ι ℝ} {k : ℝ} (hX : ouL X = -(C k * X)) (i : ι) :
    ouL (pderiv i X) = -(C (k - 1) * pderiv i X) := by
  rw [ouL_pderiv, hX, map_neg, pderiv_C_mul, map_sub, map_one]; ring

include hE in
/-- **The fourth-chaos ladder**: `E X² = (1/24) Σ (∂⁴X)²` for constant fourth derivatives. -/
lemma gE_sq_chaos4 {X : MvPolynomial ι ℝ} (hX : ouL X = -(4 * X)) (c : ι → ι → ι → ι → ℝ)
    (hc : ∀ i j k l, pderiv l (pderiv k (pderiv j (pderiv i X))) = C (c i j k l)) :
    E (X * X) = 1 / 24 * ∑ i, ∑ j, ∑ k, ∑ l, c i j k l ^ 2 := by
  have h4 : ouL X = -(C 4 * X) := by rw [hX, map_ofNat]
  have h3 : ∀ i, ouL (pderiv i X) = -(C 3 * pderiv i X) := fun i => by
    rw [ouL_pderiv_eig h4]; norm_num
  have h2 : ∀ i j, ouL (pderiv j (pderiv i X)) = -(C 2 * pderiv j (pderiv i X)) := fun i j => by
    rw [ouL_pderiv_eig (h3 i)]; norm_num
  have h1 : ∀ i j k, ouL (pderiv k (pderiv j (pderiv i X)))
      = -(C 1 * pderiv k (pderiv j (pderiv i X))) := fun i j k => by
    rw [ouL_pderiv_eig (h2 i j)]; norm_num
  have e3 : ∀ i, E (pderiv i X * pderiv i X)
      = 1 / 3 * ∑ j, E (pderiv j (pderiv i X) * pderiv j (pderiv i X)) := fun i =>
    gE_sq_step hE (h3 i) (by norm_num)
  have e2 : ∀ i j, E (pderiv j (pderiv i X) * pderiv j (pderiv i X))
      = 1 / 2 * ∑ k, E (pderiv k (pderiv j (pderiv i X)) * pderiv k (pderiv j (pderiv i X))) :=
    fun i j => gE_sq_step hE (h2 i j) (by norm_num)
  have e1 : ∀ i j k, E (pderiv k (pderiv j (pderiv i X)) * pderiv k (pderiv j (pderiv i X)))
      = 1 / 1 * ∑ l, E (pderiv l (pderiv k (pderiv j (pderiv i X)))
        * pderiv l (pderiv k (pderiv j (pderiv i X)))) := fun i j k =>
    gE_sq_step hE (h1 i j k) one_ne_zero
  have e0 : ∀ i j k l, E (pderiv l (pderiv k (pderiv j (pderiv i X)))
      * pderiv l (pderiv k (pderiv j (pderiv i X)))) = c i j k l ^ 2 := fun i j k l => by
    rw [hc, ← map_mul, gE_C hE, sq]
  rw [gE_sq_step hE h4 (by norm_num)]
  simp only [e3, e2, e1, e0, Finset.mul_sum]
  refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ =>
    Finset.sum_congr rfl fun k _ => Finset.sum_congr rfl fun l _ => by ring

omit [DecidableEq ι] in
/-- `∂⁴ Γ(a,b) = 108 (Sym(f ⋆ g) + Sym(g ⋆ f))` for cubic chaoses with symmetric kernels. -/
lemma pderiv4_gam {a b : MvPolynomial ι ℝ} (ha : Chaos3 a) (hb : Chaos3 b)
    (hf : ∀ i j k, cubicKernel a i j k = cubicKernel a j i k)
    (hg : ∀ i j k, cubicKernel b i j k = cubicKernel b j i k) (i j k l : ι) :
    pderiv l (pderiv k (pderiv j (pderiv i (gam a b))))
      = C (108 * (sym4 (con (cubicKernel a) (cubicKernel b)) i j k l
        + sym4 (con (cubicKernel b) (cubicKernel a)) i j k l)) := by
  simp only [gam, map_sum, pderiv_mul, map_add, ha.pderiv3_eq, hb.pderiv3_eq, pderiv_C, zero_mul,
    mul_zero, zero_add, add_zero]
  simp only [← map_mul, ← map_add, ← map_sum (C : ℝ →+* MvPolynomial ι ℝ)]
  congr 1
  have e1 : ∑ x, cubicKernel a j i x * cubicKernel b l k x
      = con (cubicKernel a) (cubicKernel b) i j k l :=
    Finset.sum_congr rfl fun x _ => by rw [hf j i, hg l k]
  have e2 : ∑ x, cubicKernel a k i x * cubicKernel b l j x
      = con (cubicKernel a) (cubicKernel b) i k j l :=
    Finset.sum_congr rfl fun x _ => by rw [hf k i, hg l j]
  have e3 : ∑ x, cubicKernel a l i x * cubicKernel b k j x
      = con (cubicKernel a) (cubicKernel b) i l j k :=
    Finset.sum_congr rfl fun x _ => by rw [hf l i, hg k j]
  have e4 : ∑ x, cubicKernel a k j x * cubicKernel b l i x
      = con (cubicKernel b) (cubicKernel a) i l j k :=
    Finset.sum_congr rfl fun x _ => by rw [hf k j, hg l i]; ring
  have e5 : ∑ x, cubicKernel a l j x * cubicKernel b k i x
      = con (cubicKernel b) (cubicKernel a) i k j l :=
    Finset.sum_congr rfl fun x _ => by rw [hf l j, hg k i]; ring
  have e6 : ∑ x, cubicKernel a l k x * cubicKernel b j i x
      = con (cubicKernel b) (cubicKernel a) i j k l :=
    Finset.sum_congr rfl fun x _ => by rw [hf l k, hg j i]; ring
  simp only [kern_eq_six, Finset.sum_add_distrib, sym4]
  simp only [show ∀ (p q : ℝ), 6 * p * (6 * q) = 36 * (p * q) from fun p q => by ring,
    ← Finset.mul_sum, e1, e2, e3, e4, e5, e6]
  ring

omit [DecidableEq ι] in
lemma pderiv4_gam2c {a b : MvPolynomial ι ℝ} (ha : Chaos3 a) (hb : Chaos3 b) (i j k l : ι) :
    pderiv l (pderiv k (pderiv j (pderiv i (gam2c a b)))) = 0 := by
  simp only [gam2c, gam, map_sum, pderiv_mul, map_add, ha.pderiv3_eq, hb.pderiv3_eq, pderiv_C,
    zero_mul, mul_zero, zero_add, add_zero, Finset.sum_const_zero, map_zero]

omit [DecidableEq ι] in
/-- `∂⁴ Π₄(ab) = 108 (Sym(f ⋆ g) + Sym(g ⋆ f))`. -/
lemma pderiv4_comp4 {a b : MvPolynomial ι ℝ} (ha : Chaos3 a) (hb : Chaos3 b)
    (hf : ∀ i j k, cubicKernel a i j k = cubicKernel a j i k)
    (hg : ∀ i j k, cubicKernel b i j k = cubicKernel b j i k) (i j k l : ι) :
    pderiv l (pderiv k (pderiv j (pderiv i (comp4 E a b))))
      = C (108 * (sym4 (con (cubicKernel a) (cubicKernel b)) i j k l
        + sym4 (con (cubicKernel b) (cubicKernel a)) i j k l)) := by
  unfold comp4
  simp only [map_add, map_sub, pderiv4_gam ha hb hf hg, pderiv4_gam2c ha hb, pderiv_C, sub_zero,
    add_zero]

end ladder4

/-! ### The sector expansions of `τ ⋆ τ` and `τ ⋆ τ̄` -/

section expansions

variable [DecidableEq ι] {J : ι → ι → ℝ} (hJ : IsCplx J) {f g : ι → ι → ι → ℝ}
  (hsym : ∀ a b c, tauC f g a b c = (cplxT J f g a b c + cplxT J f g a c b + cplxT J f g c b a) / 3)
  (ht : ∀ a b c, cplxT J f g a b c = cplxT J f g b a c)
include hJ hsym ht

/-- `τ ⋆ τ = (W_{abc;d} + W_{abd;c} + W_{cda;b} + W_{cdb;a})/9`. -/
theorem ccon_tau_eq (a b c d : ι) : ccon (tauC f g) (tauC f g) a b c d
    = (ctW (cplxT J f g) a b c d + ctW (cplxT J f g) a b d c + ctW (cplxT J f g) c d a b
      + ctW (cplxT J f g) c d b a) / 9 := by
  set t := cplxT J f g with ht_def
  have e : ∀ x, tauC f g a b x * tauC f g c d x = (1 / 9 : ℂ)
      * (t a b x * t c d x + t a b x * t c x d + t a b x * t x d c
        + t a x b * t c d x + t a x b * t c x d + t a x b * t x d c
        + t x b a * t c d x + t x b a * t c x d + t x b a * t x d c) :=
    fun x => by rw [hsym a b x, hsym c d x]; ring
  have hA := hJ.anti
  have v11 : ∑ x, t a b x * t c d x = 0 :=
    Chg.sum_mul_eq_zero hA (chg_t3 hJ f g a b) (chg_t3 hJ f g c d) neg_two_I_ne_zero
  have v22 : ∑ x, t a x b * t c x d = 0 :=
    Chg.sum_mul_eq_zero hA (chg_t2 hJ f g a b) (chg_t2 hJ f g c d) two_I_ne_zero
  have v23 : ∑ x, t a x b * t x d c = 0 :=
    Chg.sum_mul_eq_zero hA (chg_t2 hJ f g a b) (chg_t1 hJ f g d c) two_I_ne_zero
  have v32 : ∑ x, t x b a * t c x d = 0 :=
    Chg.sum_mul_eq_zero hA (chg_t1 hJ f g b a) (chg_t2 hJ f g c d) two_I_ne_zero
  have v33 : ∑ x, t x b a * t x d c = 0 :=
    Chg.sum_mul_eq_zero hA (chg_t1 hJ f g b a) (chg_t1 hJ f g d c) two_I_ne_zero
  have s12 : ∑ x, t a b x * t c x d = ctW t a b c d := rfl
  have s13 : ∑ x, t a b x * t x d c = ctW t a b d c :=
    Finset.sum_congr rfl fun x _ => by rw [ht x d c]
  have s21 : ∑ x, t a x b * t c d x = ctW t c d a b :=
    Finset.sum_congr rfl fun x _ => mul_comm _ _
  have s31 : ∑ x, t x b a * t c d x = ctW t c d b a :=
    Finset.sum_congr rfl fun x _ => by rw [ht x b a]; ring
  simp only [ccon, e, ← Finset.mul_sum, Finset.sum_add_distrib, v11, v22, v23, v32, v33, s12, s13,
    s21, s31]
  ring

/-- `τ ⋆ τ̄ = (D_{ab;cd} + C_{ad;bc} + C_{ac;bd} + C_{bd;ac} + C_{bc;ad})/9`. -/
theorem ccon_tau_conj_eq (a b c d : ι) :
    ccon (tauC f g) (fun a b c => conj (tauC f g a b c)) a b c d
      = (ctD (cplxT J f g) a b c d + ctC (cplxT J f g) a d b c + ctC (cplxT J f g) a c b d
        + ctC (cplxT J f g) b d a c + ctC (cplxT J f g) b c a d) / 9 := by
  set t := cplxT J f g with ht_def
  have e : ∀ x, tauC f g a b x * conj (tauC f g c d x) = (1 / 9 : ℂ)
      * (t a b x * conj (t c d x) + t a b x * conj (t c x d) + t a b x * conj (t x d c)
        + t a x b * conj (t c d x) + t a x b * conj (t c x d) + t a x b * conj (t x d c)
        + t x b a * conj (t c d x) + t x b a * conj (t c x d) + t x b a * conj (t x d c)) :=
    fun x => by rw [hsym a b x, hsym c d x]; simp only [map_div₀, map_add, map_ofNat]; ring
  have hA := hJ.anti
  have v12 : ∑ x, t a b x * conj (t c x d) = 0 :=
    Chg.sum_mul_eq_zero hA (chg_t3 hJ f g a b) (chg_ct2 hJ f g c d) neg_two_I_ne_zero
  have v13 : ∑ x, t a b x * conj (t x d c) = 0 :=
    Chg.sum_mul_eq_zero hA (chg_t3 hJ f g a b) (chg_ct1 hJ f g d c) neg_two_I_ne_zero
  have v21 : ∑ x, t a x b * conj (t c d x) = 0 :=
    Chg.sum_mul_eq_zero hA (chg_t2 hJ f g a b) (chg_ct3 hJ f g c d) two_I_ne_zero
  have v31 : ∑ x, t x b a * conj (t c d x) = 0 :=
    Chg.sum_mul_eq_zero hA (chg_t1 hJ f g b a) (chg_ct3 hJ f g c d) two_I_ne_zero
  have s11 : ∑ x, t a b x * conj (t c d x) = ctD t a b c d := rfl
  have s22 : ∑ x, t a x b * conj (t c x d) = ctC t a d b c := rfl
  have s23 : ∑ x, t a x b * conj (t x d c) = ctC t a c b d :=
    Finset.sum_congr rfl fun x _ => by rw [ht x d c]
  have s32 : ∑ x, t x b a * conj (t c x d) = ctC t b d a c :=
    Finset.sum_congr rfl fun x _ => by rw [ht x b a]
  have s33 : ∑ x, t x b a * conj (t x d c) = ctC t b c a d :=
    Finset.sum_congr rfl fun x _ => by rw [ht x b a, ht x d c]
  simp only [ccon, e, ← Finset.mul_sum, Finset.sum_add_distrib, v12, v13, v21, v31, s11, s22, s23,
    s32, s33]
  ring

end expansions

/-! ### Conjugates and the plain pairing -/

section pipl

variable (t : ι → ι → ι → ℂ)

lemma ctD_conj (a b c d : ι) : conj (ctD t a b c d) = ctD t c d a b := by
  simp only [ctD, map_sum, map_mul, Complex.conj_conj]
  exact Finset.sum_congr rfl fun x _ => mul_comm _ _

lemma ctC_conj (i j k l : ι) : conj (ctC t i j k l) = ctC t l k j i := by
  simp only [ctC, map_sum, map_mul, Complex.conj_conj]
  exact Finset.sum_congr rfl fun x _ => mul_comm _ _

variable {t}

lemma pip_add_left (X Y Z : ι → ι → ι → ι → ℂ) :
    pip (fun a b c d => X a b c d + Y a b c d) Z = pip X Z + pip Y Z := by
  simp only [pip, add_mul, Finset.sum_add_distrib]
lemma pip_add_right (X Y Z : ι → ι → ι → ι → ℂ) :
    pip X (fun a b c d => Y a b c d + Z a b c d) = pip X Y + pip X Z := by
  simp only [pip, mul_add, Finset.sum_add_distrib]
lemma pip_div_left (X Y : ι → ι → ι → ι → ℂ) (n : ℕ) [n.AtLeastTwo] :
    pip (fun a b c d => X a b c d / (OfNat.ofNat n : ℂ)) Y = pip X Y / OfNat.ofNat n := by
  simp only [pip, div_mul_eq_mul_div, Finset.sum_div]
lemma pip_div_right (X Y : ι → ι → ι → ι → ℂ) (n : ℕ) [n.AtLeastTwo] :
    pip X (fun a b c d => Y a b c d / (OfNat.ofNat n : ℂ)) = pip X Y / OfNat.ofNat n := by
  simp only [pip, mul_div_assoc, Finset.sum_div]
lemma pip_swap23 (X Y : ι → ι → ι → ι → ℂ) :
    pip (fun a b c d => X a c b d) (fun a b c d => Y a c b d) = pip X Y := csum4_swap23 _
lemma pip_cyc' (X Y : ι → ι → ι → ι → ℂ) :
    pip (fun a b c d => X a d b c) (fun a b c d => Y a d b c) = pip X Y := csum4_cyc' _
lemma pip_cyc3 (X Y : ι → ι → ι → ι → ℂ) :
    pip (fun a b c d => X b c a d) (fun a b c d => Y b c a d) = pip X Y := csum4_cyc3 _
lemma pip_swap12 (X Y : ι → ι → ι → ι → ℂ) :
    pip (fun a b c d => X b a c d) (fun a b c d => Y b a c d) = pip X Y := csum4_swap12 _
lemma pip_perm_bdac (X Y : ι → ι → ι → ι → ℂ) :
    pip (fun a b c d => X b d a c) (fun a b c d => Y b d a c) = pip X Y :=
  (pip_swap12 (fun a b c d => X a d b c) (fun a b c d => Y a d b c)).trans (pip_cyc' X Y)

end pipl

/-! ### The pairings -/

section pairings

variable [DecidableEq ι] {J : ι → ι → ℝ} (hJ : IsCplx J) (f g : ι → ι → ι → ℝ)
  (ht : ∀ a b c, cplxT J f g a b c = cplxT J f g b a c)
include hJ ht

local notation "𝓽" => cplxT J f g


/-! #### The pairings of the v4 identity -/

omit hJ in
lemma pv4_00 : hip (ctW 𝓽) (ctW 𝓽) = (gramZ 𝓽 : ℂ) := by
  calc hip (ctW 𝓽) (ctW 𝓽)
      _ = _ := hipW_eq ht

omit ht in
lemma pv4_01 : hip (fun a b c d => ctW 𝓽 a b d c) (ctW 𝓽) = 0 :=
  hip_zero₃ hJ.anti (fun a b d => chg_W4 hJ f g a b d) (fun a b d => chg_W3 hJ f g a b d) cI_ne₂

omit ht in
lemma pv4_02 : hip (fun a b c d => ctW 𝓽 c d a b) (ctW 𝓽) = 0 :=
  hip_zero₂ hJ.anti (fun a c d => chg_W4 hJ f g c d a) (fun a c d => chg_W2 hJ f g a c d) cI_ne₂

omit ht in
lemma pv4_03 : hip (fun a b c d => ctW 𝓽 c d b a) (ctW 𝓽) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_W4 hJ f g c d b) (fun b c d => chg_W1 hJ f g b c d) cI_ne₂

omit hJ ht in
lemma pv4_10 : hip (fun a b c d => ctW 𝓽 a c b d) (ctW 𝓽) = (gramT0 𝓽 : ℂ) := by
  calc hip (fun a b c d => ctW 𝓽 a c b d) (ctW 𝓽)
      _ = _ := hipW23_eq

omit ht in
lemma pv4_11 : hip (fun a b c d => ctW 𝓽 a c d b) (ctW 𝓽) = 0 :=
  hip_zero₂ hJ.anti (fun a c d => chg_W4 hJ f g a c d) (fun a c d => chg_W2 hJ f g a c d) cI_ne₂

omit ht in
lemma pv4_12 : hip (fun a b c d => ctW 𝓽 b d a c) (ctW 𝓽) = 0 :=
  hip_zero₃ hJ.anti (fun a b d => chg_W4 hJ f g b d a) (fun a b d => chg_W3 hJ f g a b d) cI_ne₂

omit ht in
lemma pv4_13 : hip (fun a b c d => ctW 𝓽 b d c a) (ctW 𝓽) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_W4 hJ f g b d c) (fun b c d => chg_W1 hJ f g b c d) cI_ne₂

omit ht in
lemma pv4_20 : hip (fun a b c d => ctW 𝓽 a d b c) (ctW 𝓽) = 0 :=
  hip_zero₃ hJ.anti (fun a b d => chg_W4 hJ f g a d b) (fun a b d => chg_W3 hJ f g a b d) cI_ne₂

omit ht in
lemma pv4_21 : hip (fun a b c d => ctW 𝓽 a d c b) (ctW 𝓽) = 0 :=
  hip_zero₂ hJ.anti (fun a c d => chg_W4 hJ f g a d c) (fun a c d => chg_W2 hJ f g a c d) cI_ne₂

omit hJ in
lemma pv4_22 : hip (fun a b c d => ctW 𝓽 b c a d) (ctW 𝓽) = (gramT0 𝓽 : ℂ) := by
  calc hip (fun a b c d => ctW 𝓽 b c a d) (ctW 𝓽)
      _ = _ := (hipW123 ht).trans hipW23_eq

omit ht in
lemma pv4_23 : hip (fun a b c d => ctW 𝓽 b c d a) (ctW 𝓽) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_W4 hJ f g b c d) (fun b c d => chg_W1 hJ f g b c d) cI_ne₂


/-! #### The pairings of the u4 identity -/

omit hJ ht in
lemma pu4_D000 : hip (ctD 𝓽) (ctD 𝓽) = (gramH 𝓽 : ℂ) := by
  calc hip (ctD 𝓽) (ctD 𝓽)
      _ = _ := hipD_D

omit ht in
lemma pu4_D001 : hip (fun a b c d => ctC 𝓽 a d b c) (ctD 𝓽) = 0 :=
  hip_zero₂ hJ.anti (fun a c d => chg_C3 hJ f g a d c) (fun a c d => chg_D2 hJ f g a c d) cI_ne₂

omit ht in
lemma pu4_D002 : hip (fun a b c d => ctC 𝓽 a c b d) (ctD 𝓽) = 0 :=
  hip_zero₂ hJ.anti (fun a c d => chg_C3 hJ f g a c d) (fun a c d => chg_D2 hJ f g a c d) cI_ne₂

omit ht in
lemma pu4_D003 : hip (fun a b c d => ctC 𝓽 b d a c) (ctD 𝓽) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_C3 hJ f g b d c) (fun b c d => chg_D1 hJ f g b c d) cI_ne₂

omit ht in
lemma pu4_D004 : hip (fun a b c d => ctC 𝓽 b c a d) (ctD 𝓽) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_C3 hJ f g b c d) (fun b c d => chg_D1 hJ f g b c d) cI_ne₂

omit ht in
lemma pu4_D010 : hip (ctD 𝓽) (fun a b c d => ctD 𝓽 c d a b) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_D1 hJ f g b c d) (fun b c d => chg_D3 hJ f g c d b) cI_ne₁

omit ht in
lemma pu4_D011 : hip (fun a b c d => ctC 𝓽 a d b c) (fun a b c d => ctD 𝓽 c d a b) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_C1 hJ f g d b c) (fun b c d => chg_D3 hJ f g c d b) cI_ne₁

omit ht in
lemma pu4_D012 : hip (fun a b c d => ctC 𝓽 a c b d) (fun a b c d => ctD 𝓽 c d a b) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_C1 hJ f g c b d) (fun b c d => chg_D3 hJ f g c d b) cI_ne₁

omit ht in
lemma pu4_D013 : hip (fun a b c d => ctC 𝓽 b d a c) (fun a b c d => ctD 𝓽 c d a b) = 0 :=
  hip_zero₂ hJ.anti (fun a c d => chg_C1 hJ f g d a c) (fun a c d => chg_D4 hJ f g c d a) cI_ne₁

omit ht in
lemma pu4_D014 : hip (fun a b c d => ctC 𝓽 b c a d) (fun a b c d => ctD 𝓽 c d a b) = 0 :=
  hip_zero₂ hJ.anti (fun a c d => chg_C1 hJ f g c a d) (fun a c d => chg_D4 hJ f g c d a) cI_ne₁

omit ht in
lemma pu4_D100 : hip (ctD 𝓽) (fun a b c d => ctD 𝓽 a c b d) = 0 :=
  hip_zero₂ hJ.anti (fun a c d => chg_D2 hJ f g a c d) (fun a c d => chg_D3 hJ f g a c d) cI_ne₁

omit ht in
lemma pu4_D101 : hip (fun a b c d => ctC 𝓽 a d b c) (fun a b c d => ctD 𝓽 a c b d) = 0 :=
  hip_zero₃ hJ.anti (fun a b d => chg_C4 hJ f g a d b) (fun a b d => chg_D2 hJ f g a b d) cI_ne₂

omit hJ in
lemma pu4_D102 : hip (fun a b c d => ctC 𝓽 a c b d) (fun a b c d => ctD 𝓽 a c b d) = (gramT0 𝓽 : ℂ) := by
  calc hip (fun a b c d => ctC 𝓽 a c b d) (fun a b c d => ctD 𝓽 a c b d)
      _ = hip (ctC 𝓽) (ctD 𝓽) := hip_swap23 _ _
      _ = _ := hipC_D ht

omit ht in
lemma pu4_D103 : hip (fun a b c d => ctC 𝓽 b d a c) (fun a b c d => ctD 𝓽 a c b d) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_C3 hJ f g b d c) (fun b c d => chg_D1 hJ f g c b d) cI_ne₂

omit ht in
lemma pu4_D104 : hip (fun a b c d => ctC 𝓽 b c a d) (fun a b c d => ctD 𝓽 a c b d) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_C3 hJ f g b c d) (fun b c d => chg_D1 hJ f g c b d) cI_ne₂

omit ht in
lemma pu4_D110 : hip (ctD 𝓽) (fun a b c d => ctD 𝓽 b d a c) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_D1 hJ f g b c d) (fun b c d => chg_D3 hJ f g b d c) cI_ne₁

omit ht in
lemma pu4_D111 : hip (fun a b c d => ctC 𝓽 a d b c) (fun a b c d => ctD 𝓽 b d a c) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_C1 hJ f g d b c) (fun b c d => chg_D3 hJ f g b d c) cI_ne₁

omit ht in
lemma pu4_D112 : hip (fun a b c d => ctC 𝓽 a c b d) (fun a b c d => ctD 𝓽 b d a c) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_C1 hJ f g c b d) (fun b c d => chg_D3 hJ f g b d c) cI_ne₁

omit hJ in
lemma pu4_D113 : hip (fun a b c d => ctC 𝓽 b d a c) (fun a b c d => ctD 𝓽 b d a c) = (gramT0 𝓽 : ℂ) := by
  calc hip (fun a b c d => ctC 𝓽 b d a c) (fun a b c d => ctD 𝓽 b d a c)
      _ = hip (fun a b c d => ctC 𝓽 a d b c) (fun a b c d => ctD 𝓽 a d b c) := hip_swap12 _ _
      _ = hip (fun a b c d => ctC 𝓽 a c b d) (fun a b c d => ctD 𝓽 a c b d) := hip_swap34 _ _
      _ = hip (ctC 𝓽) (ctD 𝓽) := hip_swap23 _ _
      _ = _ := hipC_D ht

omit ht in
lemma pu4_D114 : hip (fun a b c d => ctC 𝓽 b c a d) (fun a b c d => ctD 𝓽 b d a c) = 0 :=
  hip_zero₃ hJ.anti (fun a b d => chg_C2 hJ f g b a d) (fun a b d => chg_D4 hJ f g b d a) cI_ne₁

omit ht in
lemma pu4_D200 : hip (ctD 𝓽) (fun a b c d => ctD 𝓽 a c d b) = 0 :=
  hip_zero₂ hJ.anti (fun a c d => chg_D2 hJ f g a c d) (fun a c d => chg_D4 hJ f g a c d) cI_ne₁

omit ht in
lemma pu4_D201 : hip (fun a b c d => ctC 𝓽 a d b c) (fun a b c d => ctD 𝓽 a c d b) = 0 :=
  hip_zero₃ hJ.anti (fun a b d => chg_C4 hJ f g a d b) (fun a b d => chg_D2 hJ f g a d b) cI_ne₂

omit hJ in
lemma pu4_D202 : hip (fun a b c d => ctC 𝓽 a c b d) (fun a b c d => ctD 𝓽 a c d b) = (gramT0 𝓽 : ℂ) := by
  calc hip (fun a b c d => ctC 𝓽 a c b d) (fun a b c d => ctD 𝓽 a c d b)
      _ = hip (fun a b c d => ctC 𝓽 a c b d) (fun a b c d => ctD 𝓽 a c b d) :=
        congrArg (hip (fun a b c d => ctC 𝓽 a c b d)) (funext fun a => funext fun b => funext fun c => funext fun d => ctD_swap34 ht a c b d)
      _ = hip (ctC 𝓽) (ctD 𝓽) := hip_swap23 _ _
      _ = _ := hipC_D ht

omit ht in
lemma pu4_D203 : hip (fun a b c d => ctC 𝓽 b d a c) (fun a b c d => ctD 𝓽 a c d b) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_C3 hJ f g b d c) (fun b c d => chg_D1 hJ f g c d b) cI_ne₂

omit ht in
lemma pu4_D204 : hip (fun a b c d => ctC 𝓽 b c a d) (fun a b c d => ctD 𝓽 a c d b) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_C3 hJ f g b c d) (fun b c d => chg_D1 hJ f g c d b) cI_ne₂

omit ht in
lemma pu4_D210 : hip (ctD 𝓽) (fun a b c d => ctD 𝓽 d b a c) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_D1 hJ f g b c d) (fun b c d => chg_D3 hJ f g d b c) cI_ne₁

omit ht in
lemma pu4_D211 : hip (fun a b c d => ctC 𝓽 a d b c) (fun a b c d => ctD 𝓽 d b a c) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_C1 hJ f g d b c) (fun b c d => chg_D3 hJ f g d b c) cI_ne₁

omit ht in
lemma pu4_D212 : hip (fun a b c d => ctC 𝓽 a c b d) (fun a b c d => ctD 𝓽 d b a c) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_C1 hJ f g c b d) (fun b c d => chg_D3 hJ f g d b c) cI_ne₁

omit hJ in
lemma pu4_D213 : hip (fun a b c d => ctC 𝓽 b d a c) (fun a b c d => ctD 𝓽 d b a c) = (gramT0 𝓽 : ℂ) := by
  calc hip (fun a b c d => ctC 𝓽 b d a c) (fun a b c d => ctD 𝓽 d b a c)
      _ = hip (fun a b c d => ctC 𝓽 b d a c) (fun a b c d => ctD 𝓽 b d a c) :=
        congrArg (hip (fun a b c d => ctC 𝓽 b d a c)) (funext fun a => funext fun b => funext fun c => funext fun d => ctD_swap12 ht b d a c)
      _ = hip (fun a b c d => ctC 𝓽 a d b c) (fun a b c d => ctD 𝓽 a d b c) := hip_swap12 _ _
      _ = hip (fun a b c d => ctC 𝓽 a c b d) (fun a b c d => ctD 𝓽 a c b d) := hip_swap34 _ _
      _ = hip (ctC 𝓽) (ctD 𝓽) := hip_swap23 _ _
      _ = _ := hipC_D ht

omit ht in
lemma pu4_D214 : hip (fun a b c d => ctC 𝓽 b c a d) (fun a b c d => ctD 𝓽 d b a c) = 0 :=
  hip_zero₃ hJ.anti (fun a b d => chg_C2 hJ f g b a d) (fun a b d => chg_D4 hJ f g d b a) cI_ne₁

omit hJ in
lemma pu4_C000 : hip (ctD 𝓽) (ctC 𝓽) = (gramT0 𝓽 : ℂ) := by
  calc hip (ctD 𝓽) (ctC 𝓽)
      _ = _ := by rw [← hip_conj, hipC_D ht, Complex.conj_ofReal]

omit ht in
lemma pu4_C001 : hip (fun a b c d => ctC 𝓽 a d b c) (ctC 𝓽) = 0 :=
  hip_zero₂ hJ.anti (fun a c d => chg_C3 hJ f g a d c) (fun a c d => chg_C2 hJ f g a c d) cI_ne₂

omit ht in
lemma pu4_C002 : hip (fun a b c d => ctC 𝓽 a c b d) (ctC 𝓽) = 0 :=
  hip_zero₂ hJ.anti (fun a c d => chg_C3 hJ f g a c d) (fun a c d => chg_C2 hJ f g a c d) cI_ne₂

omit ht in
lemma pu4_C003 : hip (fun a b c d => ctC 𝓽 b d a c) (ctC 𝓽) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_C3 hJ f g b d c) (fun b c d => chg_C1 hJ f g b c d) cI_ne₂

omit ht in
lemma pu4_C004 : hip (fun a b c d => ctC 𝓽 b c a d) (ctC 𝓽) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_C3 hJ f g b c d) (fun b c d => chg_C1 hJ f g b c d) cI_ne₂

omit ht in
lemma pu4_C010 : hip (ctD 𝓽) (fun a b c d => ctC 𝓽 d c b a) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_D1 hJ f g b c d) (fun b c d => chg_C4 hJ f g d c b) cI_ne₁

omit ht in
lemma pu4_C011 : hip (fun a b c d => ctC 𝓽 a d b c) (fun a b c d => ctC 𝓽 d c b a) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_C1 hJ f g d b c) (fun b c d => chg_C4 hJ f g d c b) cI_ne₁

omit ht in
lemma pu4_C012 : hip (fun a b c d => ctC 𝓽 a c b d) (fun a b c d => ctC 𝓽 d c b a) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_C1 hJ f g c b d) (fun b c d => chg_C4 hJ f g d c b) cI_ne₁

omit ht in
lemma pu4_C013 : hip (fun a b c d => ctC 𝓽 b d a c) (fun a b c d => ctC 𝓽 d c b a) = 0 :=
  hip_zero₂ hJ.anti (fun a c d => chg_C1 hJ f g d a c) (fun a c d => chg_C3 hJ f g d c a) cI_ne₁

omit ht in
lemma pu4_C014 : hip (fun a b c d => ctC 𝓽 b c a d) (fun a b c d => ctC 𝓽 d c b a) = 0 :=
  hip_zero₂ hJ.anti (fun a c d => chg_C1 hJ f g c a d) (fun a c d => chg_C3 hJ f g d c a) cI_ne₁

omit ht in
lemma pu4_C100 : hip (ctD 𝓽) (fun a b c d => ctC 𝓽 a c b d) = 0 :=
  hip_zero₂ hJ.anti (fun a c d => chg_D2 hJ f g a c d) (fun a c d => chg_C3 hJ f g a c d) cI_ne₁

omit ht in
lemma pu4_C101 : hip (fun a b c d => ctC 𝓽 a d b c) (fun a b c d => ctC 𝓽 a c b d) = 0 :=
  hip_zero₃ hJ.anti (fun a b d => chg_C4 hJ f g a d b) (fun a b d => chg_C2 hJ f g a b d) cI_ne₂

omit hJ in
lemma pu4_C102 : hip (fun a b c d => ctC 𝓽 a c b d) (fun a b c d => ctC 𝓽 a c b d) = (gramN 𝓽 : ℂ) := by
  calc hip (fun a b c d => ctC 𝓽 a c b d) (fun a b c d => ctC 𝓽 a c b d)
      _ = hip (ctC 𝓽) (ctC 𝓽) := hip_swap23 _ _
      _ = _ := hipC_C ht

omit ht in
lemma pu4_C103 : hip (fun a b c d => ctC 𝓽 b d a c) (fun a b c d => ctC 𝓽 a c b d) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_C3 hJ f g b d c) (fun b c d => chg_C1 hJ f g c b d) cI_ne₂

omit ht in
lemma pu4_C104 : hip (fun a b c d => ctC 𝓽 b c a d) (fun a b c d => ctC 𝓽 a c b d) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_C3 hJ f g b c d) (fun b c d => chg_C1 hJ f g c b d) cI_ne₂

omit ht in
lemma pu4_C110 : hip (ctD 𝓽) (fun a b c d => ctC 𝓽 d b c a) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_D1 hJ f g b c d) (fun b c d => chg_C4 hJ f g d b c) cI_ne₁

omit ht in
lemma pu4_C111 : hip (fun a b c d => ctC 𝓽 a d b c) (fun a b c d => ctC 𝓽 d b c a) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_C1 hJ f g d b c) (fun b c d => chg_C4 hJ f g d b c) cI_ne₁

omit ht in
lemma pu4_C112 : hip (fun a b c d => ctC 𝓽 a c b d) (fun a b c d => ctC 𝓽 d b c a) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_C1 hJ f g c b d) (fun b c d => chg_C4 hJ f g d b c) cI_ne₁

omit hJ ht in
lemma pu4_C113 : hip (fun a b c d => ctC 𝓽 b d a c) (fun a b c d => ctC 𝓽 d b c a) = (gramB 𝓽 : ℂ) := by
  calc hip (fun a b c d => ctC 𝓽 b d a c) (fun a b c d => ctC 𝓽 d b c a)
      _ = hip (fun a b c d => ctC 𝓽 a d b c) (fun a b c d => ctC 𝓽 d a c b) := hip_swap12 _ _
      _ = hip (fun a b c d => ctC 𝓽 a d c b) (fun a b c d => ctC 𝓽 d a b c) := hip_swap23 _ _
      _ = hip (fun a b c d => ctC 𝓽 a c d b) (fun a b c d => ctC 𝓽 c a b d) := hip_swap34 _ _
      _ = hip (fun a b c d => ctC 𝓽 a b d c) (fun a b c d => ctC 𝓽 b a c d) := hip_swap23 _ _
      _ = hip (fun a b c d => ctC 𝓽 b a d c) (ctC 𝓽) := hip_swap12 _ _
      _ = _ := hipC1234_C

omit ht in
lemma pu4_C114 : hip (fun a b c d => ctC 𝓽 b c a d) (fun a b c d => ctC 𝓽 d b c a) = 0 :=
  hip_zero₃ hJ.anti (fun a b d => chg_C2 hJ f g b a d) (fun a b d => chg_C3 hJ f g d b a) cI_ne₁

omit ht in
lemma pu4_C200 : hip (ctD 𝓽) (fun a b c d => ctC 𝓽 a c d b) = 0 :=
  hip_zero₂ hJ.anti (fun a c d => chg_D2 hJ f g a c d) (fun a c d => chg_C4 hJ f g a c d) cI_ne₁

omit ht in
lemma pu4_C201 : hip (fun a b c d => ctC 𝓽 a d b c) (fun a b c d => ctC 𝓽 a c d b) = 0 :=
  hip_zero₃ hJ.anti (fun a b d => chg_C4 hJ f g a d b) (fun a b d => chg_C2 hJ f g a d b) cI_ne₂

omit hJ in
lemma pu4_C202 : hip (fun a b c d => ctC 𝓽 a c b d) (fun a b c d => ctC 𝓽 a c d b) = (gramT0 𝓽 : ℂ) := by
  calc hip (fun a b c d => ctC 𝓽 a c b d) (fun a b c d => ctC 𝓽 a c d b)
      _ = hip (ctC 𝓽) (fun a b c d => ctC 𝓽 a b d c) := hip_swap23 _ _
      _ = hip (fun a b c d => ctC 𝓽 a b d c) (ctC 𝓽) := hip_swap34 _ _
      _ = _ := hipC34_C ht

omit ht in
lemma pu4_C203 : hip (fun a b c d => ctC 𝓽 b d a c) (fun a b c d => ctC 𝓽 a c d b) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_C3 hJ f g b d c) (fun b c d => chg_C1 hJ f g c d b) cI_ne₂

omit ht in
lemma pu4_C204 : hip (fun a b c d => ctC 𝓽 b c a d) (fun a b c d => ctC 𝓽 a c d b) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_C3 hJ f g b c d) (fun b c d => chg_C1 hJ f g c d b) cI_ne₂

omit ht in
lemma pu4_C210 : hip (ctD 𝓽) (fun a b c d => ctC 𝓽 b d c a) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_D1 hJ f g b c d) (fun b c d => chg_C4 hJ f g b d c) cI_ne₁

omit ht in
lemma pu4_C211 : hip (fun a b c d => ctC 𝓽 a d b c) (fun a b c d => ctC 𝓽 b d c a) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_C1 hJ f g d b c) (fun b c d => chg_C4 hJ f g b d c) cI_ne₁

omit ht in
lemma pu4_C212 : hip (fun a b c d => ctC 𝓽 a c b d) (fun a b c d => ctC 𝓽 b d c a) = 0 :=
  hip_zero₁ hJ.anti (fun b c d => chg_C1 hJ f g c b d) (fun b c d => chg_C4 hJ f g b d c) cI_ne₁

omit hJ in
lemma pu4_C213 : hip (fun a b c d => ctC 𝓽 b d a c) (fun a b c d => ctC 𝓽 b d c a) = (gramT0 𝓽 : ℂ) := by
  calc hip (fun a b c d => ctC 𝓽 b d a c) (fun a b c d => ctC 𝓽 b d c a)
      _ = hip (fun a b c d => ctC 𝓽 a d b c) (fun a b c d => ctC 𝓽 a d c b) := hip_swap12 _ _
      _ = hip (fun a b c d => ctC 𝓽 a d c b) (fun a b c d => ctC 𝓽 a d b c) := hip_swap23 _ _
      _ = hip (fun a b c d => ctC 𝓽 a c d b) (fun a b c d => ctC 𝓽 a c b d) := hip_swap34 _ _
      _ = hip (fun a b c d => ctC 𝓽 a b d c) (ctC 𝓽) := hip_swap23 _ _
      _ = _ := hipC34_C ht

omit ht in
lemma pu4_C214 : hip (fun a b c d => ctC 𝓽 b c a d) (fun a b c d => ctC 𝓽 b d c a) = 0 :=
  hip_zero₃ hJ.anti (fun a b d => chg_C2 hJ f g b a d) (fun a b d => chg_C3 hJ f g b d a) cI_ne₁

end pairings

/-! ### Assembly: `‖Sym(τ ⋆ τ)‖² = 4y/81` and `‖Sym(f ⋆ f + g ⋆ g)‖² = (h + 4n + 4b + 16T)/486` -/

section assembly

variable [DecidableEq ι] {J : ι → ι → ℝ} (hJ : IsCplx J) (f g : ι → ι → ι → ℝ)
  (hsym : ∀ a b c, tauC f g a b c = (cplxT J f g a b c + cplxT J f g a c b + cplxT J f g c b a) / 3)
  (ht : ∀ a b c, cplxT J f g a b c = cplxT J f g b a c)
include hJ hsym ht

local notation "𝓽" => cplxT J f g

omit hJ hsym ht [DecidableEq ι] in
lemma hip_perm_cdba' (X Y : ι → ι → ι → ι → ℂ) :
    hip (fun a b c d => X c d b a) (fun a b c d => Y c d b a) = hip X Y :=
  (hip_swapP (fun a b c d => X a b d c) (fun a b c d => Y a b d c)).trans (hip_swap34 X Y)

/-- **`‖Sym(τ ⋆ τ)‖² = 4y/81`**: with `τ ⋆ τ = A/9`, `A = W + W^{(34)} + W^{swP} + W^{swP(34)}`,
`Sym A` is fully symmetric, so `‖Sym A‖² = ⟨Sym A, A⟩ = 4⟨Sym A, W⟩`, and of the twelve pairings
`⟨W^σ, W⟩` in `⟨Sym A, W⟩` only three survive the charge count: `z + 2T = 3y`. -/
theorem hipV_V : (hip (csym4 (ccon (tauC f g) (tauC f g)))
    (csym4 (ccon (tauC f g) (tauC f g)))).re = 4 / 81 * gramY 𝓽 := by
  set A : ι → ι → ι → ι → ℂ := fun a b c d => ctW 𝓽 a b c d + ctW 𝓽 a b d c + ctW 𝓽 c d a b
    + ctW 𝓽 c d b a with hA
  set V := csym4 (ccon (tauC f g) (tauC f g)) with hVdef
  have hV : V = fun a b c d => csym4 A a b c d / 9 := by
    funext a b c d
    simp only [hVdef, csym4, ccon_tau_eq hJ hsym ht, hA]; ring
  have hA12 : ∀ a b c d, A b a c d = A a b c d := fun a b c d => by
    simp only [hA]; rw [ctW_symm12 ht a b c d, ctW_symm12 ht a b d c]; ring
  have hA34 : ∀ a b c d, A a b d c = A a b c d := fun a b c d => by
    simp only [hA]; rw [ctW_symm12 ht c d a b, ctW_symm12 ht c d b a]; ring
  have hAP : ∀ a b c d, A c d a b = A a b c d := fun a b c d => by simp only [hA]; ring
  obtain ⟨s12, s23, s34⟩ := csym4_symm hA12 hA34 hAP
  have V12 : ∀ a b c d, V b a c d = V a b c d := fun a b c d => by rw [hV]; simp only [s12]
  have V23 : ∀ a b c d, V a c b d = V a b c d := fun a b c d => by rw [hV]; simp only [s23]
  have V34 : ∀ a b c d, V a b d c = V a b c d := fun a b c d => by rw [hV]; simp only [s34]
  have Vcyc' : ∀ a b c d, V a d b c = V a b c d := fun a b c d => by rw [V23 a b d c, V34]
  have VP : ∀ a b c d, V c d a b = V a b c d := fun a b c d => by
    rw [V23 c a d b, V12 a c d b, V34 a c b d, V23]
  have VPr : ∀ a b c d, V c d b a = V a b c d := fun a b c d => by rw [V34 c d a b, VP]
  have h1 : hip V V = hip V (csym4 A) / 9 := by
    have e : hip V V = hip V (fun a b c d => csym4 A a b c d / 9) := by rw [← hV]
    rw [e, hip_div_right]
  have h2 : hip V (csym4 A) = hip V A := by
    have e : hip V (csym4 A) = hip V (fun a b c d => (A a b c d + A a c b d + A a d b c) / 3) := rfl
    rw [e, hip_div_right, hip_add_right, hip_add_right]
    have e2 : hip V (fun a b c d => A a c b d) = hip V A := by
      rw [← hip_swap23 V A]
      exact congrArg (fun X => hip X _) (funext fun a => funext fun b => funext fun c =>
        funext fun d => (V23 a b c d).symm)
    have e3 : hip V (fun a b c d => A a d b c) = hip V A := by
      rw [← hip_cyc' V A]
      exact congrArg (fun X => hip X _) (funext fun a => funext fun b => funext fun c =>
        funext fun d => (Vcyc' a b c d).symm)
    rw [e2, e3]; ring
  have h3 : hip V A = 4 * hip V (ctW 𝓽) := by
    have e : hip V A = hip V (fun a b c d => ctW 𝓽 a b c d + ctW 𝓽 a b d c + ctW 𝓽 c d a b
        + ctW 𝓽 c d b a) := rfl
    rw [e, hip_add_right, hip_add_right, hip_add_right]
    have e1 : hip V (fun a b c d => ctW 𝓽 a b d c) = hip V (ctW 𝓽) := by
      rw [← hip_swap34 V (ctW 𝓽)]
      exact congrArg (fun X => hip X _) (funext fun a => funext fun b => funext fun c =>
        funext fun d => (V34 a b c d).symm)
    have e2 : hip V (fun a b c d => ctW 𝓽 c d a b) = hip V (ctW 𝓽) := by
      rw [← hip_swapP V (ctW 𝓽)]
      exact congrArg (fun X => hip X _) (funext fun a => funext fun b => funext fun c =>
        funext fun d => (VP a b c d).symm)
    have e3 : hip V (fun a b c d => ctW 𝓽 c d b a) = hip V (ctW 𝓽) := by
      rw [← hip_perm_cdba' V (ctW 𝓽)]
      exact congrArg (fun X => hip X _) (funext fun a => funext fun b => funext fun c =>
        funext fun d => (VPr a b c d).symm)
    rw [e1, e2, e3]; ring
  have h4 : hip V (ctW 𝓽) = (hip A (ctW 𝓽) + hip (fun a b c d => A a c b d) (ctW 𝓽)
      + hip (fun a b c d => A a d b c) (ctW 𝓽)) / 3 / 9 := by
    rw [hV]
    have e : hip (fun a b c d => csym4 A a b c d / 9) (ctW 𝓽)
        = hip (fun a b c d => (A a b c d + A a c b d + A a d b c) / 3 / 9) (ctW 𝓽) := rfl
    rw [e, hip_div_left, hip_div_left, hip_add_left, hip_add_left]
  have hA0 : hip A (ctW 𝓽) = (gramZ 𝓽 : ℂ) := by
    rw [hA, hip_add_left, hip_add_left, hip_add_left, pv4_00 f g ht, pv4_01 hJ f g,
      pv4_02 hJ f g, pv4_03 hJ f g]
    ring
  have hA1 : hip (fun a b c d => A a c b d) (ctW 𝓽) = (gramT0 𝓽 : ℂ) := by
    simp only [hA]
    rw [hip_add_left, hip_add_left, hip_add_left, pv4_10 f g, pv4_11 hJ f g, pv4_12 hJ f g,
      pv4_13 hJ f g]
    ring
  have hA2 : hip (fun a b c d => A a d b c) (ctW 𝓽) = (gramT0 𝓽 : ℂ) := by
    simp only [hA]
    rw [hip_add_left, hip_add_left, hip_add_left, pv4_20 hJ f g, pv4_21 hJ f g, pv4_22 f g ht,
      pv4_23 hJ f g]
    ring
  have hfin : hip V V = ((4 * ((gramZ 𝓽 + gramT0 𝓽 + gramT0 𝓽) / 3 / 9) / 9 : ℝ) : ℂ) := by
    rw [h1, h2, h3, h4, hA0, hA1, hA2]; push_cast; ring
  rw [hfin, Complex.ofReal_re, gramY_eq ht]
  ring

/-- **`‖Sym(f ⋆ f + g ⋆ g)‖² = (h + 4n + 4b + 16T)/486`**: `S = Sym(Re(τ ⋆ τ̄))` is fully
symmetric, so `‖S‖² = ⟨S, Re(τ ⋆ τ̄)⟩ = Re⟨S, (D + 4C^σ)/9⟩`, the symmetrisation is moved onto `D`
and `C`, and of the sixty pairings of the sector components of `τ ⋆ τ̄` with the permuted `D`, `C`
and their conjugates, ten survive the charge count. -/
theorem sum_kerS_sq (hf : ∀ a b c, f a b c = f b a c) (hg : ∀ a b c, g a b c = g b a c) :
    ∑ a, ∑ b, ∑ c, ∑ d, (kerS f a b c d + kerS g a b c d) ^ 2
      = (gramH 𝓽 + 4 * gramN 𝓽 + 4 * gramB 𝓽 + 16 * gramT0 𝓽) / 486 := by
  set S : T4 ι := fun a b c d => kerS f a b c d + kerS g a b c d with hS
  set R : T4 ι := fun a b c d => con f f a b c d + con g g a b c d with hR
  set Zt : ι → ι → ι → ι → ℂ := ccon (tauC f g) (fun a b c => conj (tauC f g a b c)) with hZt
  set Sc : ι → ι → ι → ι → ℂ := fun a b c d => (S a b c d : ℂ) with hSc
  have hSR : ∀ a b c d, S a b c d = sym4 R a b c d := fun a b c d => by
    simp only [hS, hR, kerS, kerC_eq_con, sym4]; ring
  have hRZ : ∀ a b c d, R a b c d = (Zt a b c d).re := fun a b c d => by
    simp only [hR, hZt, ccon_tauC_conj_re]
  have S12 : ∀ a b c d, S b a c d = S a b c d := fun a b c d => by
    simp only [hS, kerS_sw12 hf, kerS_sw12 hg]
  have S23 : ∀ a b c d, S a c b d = S a b c d := fun a b c d => by
    simp only [hS, kerS_sw23 hf, kerS_sw23 hg]
  have S34 : ∀ a b c d, S a b d c = S a b c d := fun a b c d => by
    simp only [hS, kerS_sw34 hf, kerS_sw34 hg]
  have Scyc : ∀ a b c d, S a c d b = S a b c d := fun a b c d => by rw [S34 a c b d, S23]
  have Scyc' : ∀ a b c d, S a d b c = S a b c d := fun a b c d => by rw [S23 a b d c, S34]
  have Sbdac : ∀ a b c d, S b d a c = S a b c d := fun a b c d => by
    rw [S12 d b a c, S23 d a b c, S12 a d b c, Scyc']
  have Sbcad : ∀ a b c d, S b c a d = S a b c d := fun a b c d => by
    rw [S12 c b a d, S23 c a b d, S12 a c b d, S23]
  -- `Σ S² = Σ S R`
  have step1 : ∑ a, ∑ b, ∑ c, ∑ d, S a b c d ^ 2 = ∑ a, ∑ b, ∑ c, ∑ d, S a b c d * R a b c d := by
    have e23 : ∑ a, ∑ b, ∑ c, ∑ d, S a b c d * R a c b d
        = ∑ a, ∑ b, ∑ c, ∑ d, S a b c d * R a b c d :=
      (csum4_swap23 fun a b c d => S a c b d * R a b c d).trans (Finset.sum_congr rfl fun a _ =>
        Finset.sum_congr rfl fun b _ => Finset.sum_congr rfl fun c _ =>
        Finset.sum_congr rfl fun d _ => by rw [S23])
    have ecyc : ∑ a, ∑ b, ∑ c, ∑ d, S a b c d * R a d b c
        = ∑ a, ∑ b, ∑ c, ∑ d, S a b c d * R a b c d :=
      (csum4_cyc' fun a b c d => S a c d b * R a b c d).trans (Finset.sum_congr rfl fun a _ =>
        Finset.sum_congr rfl fun b _ => Finset.sum_congr rfl fun c _ =>
        Finset.sum_congr rfl fun d _ => by rw [Scyc])
    calc ∑ a, ∑ b, ∑ c, ∑ d, S a b c d ^ 2
        = ∑ a, ∑ b, ∑ c, ∑ d, (S a b c d * R a b c d + S a b c d * R a c b d
            + S a b c d * R a d b c) / 3 := by
          refine Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ =>
            Finset.sum_congr rfl fun c _ => Finset.sum_congr rfl fun d _ => ?_
          rw [sq, hSR a b c d]; simp only [sym4]; ring
      _ = _ := by
          simp only [← Finset.sum_div, Finset.sum_add_distrib, e23, ecyc]; ring
  -- `Σ S R = Re (Sc · Zt)`
  have step2 : ∑ a, ∑ b, ∑ c, ∑ d, S a b c d * R a b c d = (pip Sc Zt).re := by
    simp only [pip, hSc, Complex.re_sum, Complex.re_ofReal_mul, hRZ]
  -- `Sc · Zt = (Sc · D + 4 Sc · C)/9`
  have eZ : Zt = fun a b c d => (ctD 𝓽 a b c d + ctC 𝓽 a d b c + ctC 𝓽 a c b d + ctC 𝓽 b d a c
      + ctC 𝓽 b c a d) / 9 := funext fun a => funext fun b => funext fun c => funext fun d =>
    ccon_tau_conj_eq hJ hsym ht a b c d
  have step3 : pip Sc Zt = (pip Sc (ctD 𝓽) + 4 * pip Sc (ctC 𝓽)) / 9 := by
    rw [eZ, pip_div_right, pip_add_right, pip_add_right, pip_add_right, pip_add_right]
    have c1 : pip Sc (fun a b c d => ctC 𝓽 a d b c) = pip Sc (ctC 𝓽) := by
      rw [← pip_cyc' Sc (ctC 𝓽)]
      exact congrArg (fun X => pip X _) (funext fun a => funext fun b => funext fun c =>
        funext fun d => by simp only [hSc, Scyc'])
    have c2 : pip Sc (fun a b c d => ctC 𝓽 a c b d) = pip Sc (ctC 𝓽) := by
      rw [← pip_swap23 Sc (ctC 𝓽)]
      exact congrArg (fun X => pip X _) (funext fun a => funext fun b => funext fun c =>
        funext fun d => by simp only [hSc, S23])
    have c3 : pip Sc (fun a b c d => ctC 𝓽 b d a c) = pip Sc (ctC 𝓽) := by
      rw [← pip_perm_bdac Sc (ctC 𝓽)]
      exact congrArg (fun X => pip X _) (funext fun a => funext fun b => funext fun c =>
        funext fun d => by simp only [hSc, Sbdac])
    have c4 : pip Sc (fun a b c d => ctC 𝓽 b c a d) = pip Sc (ctC 𝓽) := by
      rw [← pip_cyc3 Sc (ctC 𝓽)]
      exact congrArg (fun X => pip X _) (funext fun a => funext fun b => funext fun c =>
        funext fun d => by simp only [hSc, Sbcad])
    rw [c1, c2, c3, c4]; ring
  -- the symmetrisation moved onto the second factor, and `Re Zt = (Zt + conj Zt)/2`
  have key : ∀ Y : ι → ι → ι → ι → ℂ, pip Sc Y
      = ((hip Zt (fun a b c d => conj (Y a b c d)) + conj (hip Zt Y))
        + (hip Zt (fun a b c d => conj (Y a c b d)) + conj (hip Zt (fun a b c d => Y a c b d)))
        + (hip Zt (fun a b c d => conj (Y a c d b)) + conj (hip Zt (fun a b c d => Y a c d b))))
        / 2 / 3 := by
    intro Y
    have eS : Sc = fun a b c d => ((Zt a b c d + conj (Zt a b c d)) + (Zt a c b d
        + conj (Zt a c b d)) + (Zt a d b c + conj (Zt a d b c))) / 2 / 3 := by
      funext a b c d
      simp only [hSc, hSR, sym4, hRZ, Complex.add_conj]
      push_cast; ring
    rw [eS, pip_div_left, pip_div_left, pip_add_left, pip_add_left, pip_add_left, pip_add_left,
      pip_add_left, pip_eq_hip Zt Y, pip_conj_left Zt Y]
    have p23 : pip (fun a b c d => Zt a c b d) Y = pip Zt (fun a b c d => Y a c b d) :=
      pip_swap23 Zt (fun a b c d => Y a c b d)
    have p23c : pip (fun a b c d => conj (Zt a c b d)) Y
        = pip (fun a b c d => conj (Zt a b c d)) (fun a b c d => Y a c b d) :=
      pip_swap23 (fun a b c d => conj (Zt a b c d)) (fun a b c d => Y a c b d)
    have pcy : pip (fun a b c d => Zt a d b c) Y = pip Zt (fun a b c d => Y a c d b) :=
      pip_cyc' Zt (fun a b c d => Y a c d b)
    have pcyc : pip (fun a b c d => conj (Zt a d b c)) Y
        = pip (fun a b c d => conj (Zt a b c d)) (fun a b c d => Y a c d b) :=
      pip_cyc' (fun a b c d => conj (Zt a b c d)) (fun a b c d => Y a c d b)
    rw [p23, p23c, pcy, pcyc, pip_eq_hip Zt, pip_eq_hip Zt, pip_conj_left, pip_conj_left]
  have expand : ∀ Y' : ι → ι → ι → ι → ℂ, hip Zt Y' = (hip (ctD 𝓽) Y'
      + hip (fun a b c d => ctC 𝓽 a d b c) Y' + hip (fun a b c d => ctC 𝓽 a c b d) Y'
      + hip (fun a b c d => ctC 𝓽 b d a c) Y' + hip (fun a b c d => ctC 𝓽 b c a d) Y') / 9 := by
    intro Y'
    rw [eZ, hip_div_left, hip_add_left, hip_add_left, hip_add_left, hip_add_left]
  have hD : pip Sc (ctD 𝓽) = ((gramH 𝓽 + 4 * gramT0 𝓽) / 54 : ℝ) := by
    rw [key (ctD 𝓽)]
    simp only [ctD_conj]
    rw [expand, expand, expand, expand, expand, expand]
    rw [pu4_D000 f g, pu4_D001 hJ f g, pu4_D002 hJ f g, pu4_D003 hJ f g, pu4_D004 hJ f g,
      pu4_D010 hJ f g, pu4_D011 hJ f g, pu4_D012 hJ f g, pu4_D013 hJ f g, pu4_D014 hJ f g,
      pu4_D100 hJ f g, pu4_D101 hJ f g, pu4_D102 f g ht, pu4_D103 hJ f g, pu4_D104 hJ f g,
      pu4_D110 hJ f g, pu4_D111 hJ f g, pu4_D112 hJ f g, pu4_D113 f g ht, pu4_D114 hJ f g,
      pu4_D200 hJ f g, pu4_D201 hJ f g, pu4_D202 f g ht, pu4_D203 hJ f g, pu4_D204 hJ f g,
      pu4_D210 hJ f g, pu4_D211 hJ f g, pu4_D212 hJ f g, pu4_D213 f g ht, pu4_D214 hJ f g]
    simp only [map_div₀, map_add, map_zero, Complex.conj_ofReal, map_ofNat]
    push_cast; ring
  have hC : pip Sc (ctC 𝓽) = ((gramN 𝓽 + gramB 𝓽 + 3 * gramT0 𝓽) / 54 : ℝ) := by
    rw [key (ctC 𝓽)]
    simp only [ctC_conj]
    rw [expand, expand, expand, expand, expand, expand]
    rw [pu4_C000 f g ht, pu4_C001 hJ f g, pu4_C002 hJ f g, pu4_C003 hJ f g, pu4_C004 hJ f g,
      pu4_C010 hJ f g, pu4_C011 hJ f g, pu4_C012 hJ f g, pu4_C013 hJ f g, pu4_C014 hJ f g,
      pu4_C100 hJ f g, pu4_C101 hJ f g, pu4_C102 f g ht, pu4_C103 hJ f g, pu4_C104 hJ f g,
      pu4_C110 hJ f g, pu4_C111 hJ f g, pu4_C112 hJ f g, pu4_C113 f g, pu4_C114 hJ f g,
      pu4_C200 hJ f g, pu4_C201 hJ f g, pu4_C202 f g ht, pu4_C203 hJ f g, pu4_C204 hJ f g,
      pu4_C210 hJ f g, pu4_C211 hJ f g, pu4_C212 hJ f g, pu4_C213 f g ht, pu4_C214 hJ f g]
    simp only [map_div₀, map_add, map_zero, Complex.conj_ofReal, map_ofNat]
    push_cast; ring
  have hfin : (pip Sc (ctD 𝓽) + 4 * pip Sc (ctC 𝓽)) / 9
      = ((gramH 𝓽 + 4 * gramN 𝓽 + 4 * gramB 𝓽 + 16 * gramT0 𝓽) / 486 : ℝ) := by
    rw [hD, hC]; push_cast; ring
  rw [step1, step2, step3, hfin, Complex.ofReal_re]

end assembly

/-! ### The spectral identities `u₄`, `v₄` for a circular cubic -/

section spectral4

variable [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ} (hE : IsGaussianExpectation E)
  {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ} (ha : Chaos3 a) (hc : Circular J a b)
  (haa : E (a * a) = 1 / 2)
include hE ha hc haa

/-- **`v₄ = 96y`** (the field `v4_eq`). -/
theorem Circular.specV4_eq : specV4 E a b = 96 * gramY (gramT J a b) := by
  have hb : Chaos3 b := hc.chaos3_right ha
  have hbb : E (b * b) = 1 / 2 := by rw [← hc.gE_sq_eq hE, haa]
  have hab : E (a * b) = 0 := hc.gE_mul hE
  have hJ := hc.isCplx
  have hsym := hc.tauC_eq
  have ht : ∀ i j k, cplxT J (cubicKernel a) (cubicKernel b) i j k
      = cplxT J (cubicKernel a) (cubicKernel b) j i k := gramT_symm12 J a b
  have hf := cubicKernel_symm12 a
  have hg := cubicKernel_symm12 b
  obtain ⟨-, p4, -⟩ := proj_radP hE ha hb (v := 1) haa hbb
  obtain ⟨-, q4, -⟩ := proj_radQ hE ha hb hab
  show specV4 E a b = 96 * gramY (cplxT J (cubicKernel a) (cubicKernel b))
  unfold specV4
  rw [p4, q4]
  have hP := eigen_sub 4 (comp4_eig hE ha ha) (comp4_eig hE hb hb)
  have hQ := eigen_two_mul 4 (comp4_eig hE ha hb)
  set f := cubicKernel a with hf_def
  set g := cubicKernel b with hg_def
  have hcP : ∀ i j k l, pderiv l (pderiv k (pderiv j (pderiv i (comp4 E a a - comp4 E b b))))
      = C (216 * (sym4 (con f f) i j k l - sym4 (con g g) i j k l)) := fun i j k l => by
    rw [map_sub, map_sub, map_sub, map_sub, pderiv4_comp4 ha ha hf hf, pderiv4_comp4 hb hb hg hg,
      ← map_sub]
    congr 1; ring
  have hcQ : ∀ i j k l, pderiv l (pderiv k (pderiv j (pderiv i (2 * comp4 E a b))))
      = C (216 * (sym4 (con f g) i j k l + sym4 (con g f) i j k l)) := fun i j k l => by
    rw [ofNat_mul_apply, ofNat_mul_apply, ofNat_mul_apply, ofNat_mul_apply,
      pderiv4_comp4 ha hb hf hg, ← C_two_mul]
    congr 1; ring
  rw [gE_sq_chaos4 hE hP _ hcP, gE_sq_chaos4 hE hQ _ hcQ]
  set V := csym4 (ccon (tauC f g) (tauC f g)) with hV
  have hre : ∀ i j k l, sym4 (con f f) i j k l - sym4 (con g g) i j k l = (V i j k l).re :=
    fun i j k l => by
      rw [hV, csym4_re]
      simp only [sym4, ccon_tauC_re]; ring
  have him : ∀ i j k l, sym4 (con f g) i j k l + sym4 (con g f) i j k l = (V i j k l).im :=
    fun i j k l => by
      rw [hV, csym4_im]
      simp only [sym4, ccon_tauC_im]; ring
  have hns : ∀ i j k l, (216 * (V i j k l).re) ^ 2 + (216 * (V i j k l).im) ^ 2
      = 46656 * Complex.normSq (V i j k l) := fun i j k l => by
    rw [Complex.normSq_apply]; ring
  have hVV := hipV_V hJ f g hsym ht
  rw [hip_self_re, ← hV] at hVV
  simp only [hre, him]
  rw [← mul_add]
  simp only [← Finset.sum_add_distrib, hns, ← Finset.mul_sum, hVV]
  ring

/-- **`u₄ = 16n + 4h + 16b + 96y − 32z`** (the field `u4_eq`). -/
theorem Circular.specU4_eq : specU4 E a b = 16 * gramN (gramT J a b) + 4 * gramH (gramT J a b)
    + 16 * gramB (gramT J a b) + 96 * gramY (gramT J a b) - 32 * gramZ (gramT J a b) := by
  have hb : Chaos3 b := hc.chaos3_right ha
  have hbb : E (b * b) = 1 / 2 := by rw [← hc.gE_sq_eq hE, haa]
  have hJ := hc.isCplx
  have hsym := hc.tauC_eq
  have ht : ∀ i j k, cplxT J (cubicKernel a) (cubicKernel b) i j k
      = cplxT J (cubicKernel a) (cubicKernel b) j i k := gramT_symm12 J a b
  have hf := cubicKernel_symm12 a
  have hg := cubicKernel_symm12 b
  obtain ⟨-, p4, -⟩ := proj_radU hE ha hb (v := 1) haa hbb
  show specU4 E a b = 16 * gramN (cplxT J (cubicKernel a) (cubicKernel b))
    + 4 * gramH (cplxT J (cubicKernel a) (cubicKernel b))
    + 16 * gramB (cplxT J (cubicKernel a) (cubicKernel b))
    + 96 * gramY (cplxT J (cubicKernel a) (cubicKernel b))
    - 32 * gramZ (cplxT J (cubicKernel a) (cubicKernel b))
  unfold specU4
  rw [p4]
  have hX := eigen_add 4 (comp4_eig hE ha ha) (comp4_eig hE hb hb)
  set f := cubicKernel a with hf_def
  set g := cubicKernel b with hg_def
  have hcd : ∀ i j k l, pderiv l (pderiv k (pderiv j (pderiv i (comp4 E a a + comp4 E b b))))
      = C (216 * (kerS f i j k l + kerS g i j k l)) := fun i j k l => by
    rw [map_add, map_add, map_add, map_add, pderiv4_comp4 ha ha hf hf, pderiv4_comp4 hb hb hg hg,
      ← map_add, kerS_eq_sym4, kerS_eq_sym4]
    congr 1; ring
  rw [gE_sq_chaos4 hE hX _ hcd]
  have e : ∀ i j k l, (216 * (kerS f i j k l + kerS g i j k l)) ^ 2
      = 46656 * (kerS f i j k l + kerS g i j k l) ^ 2 := fun i j k l => by ring
  simp only [e, ← Finset.mul_sum]
  rw [sum_kerS_sq hJ f g hsym ht hf hg, gramY_eq ht]
  ring

end spectral4

end

end Grothe.LowerAnalytic
