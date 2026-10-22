import Grothe.LowerAnalytic.GramTensor
import Grothe.LowerAnalytic.CircularTensor

/-!
# The spectral identities of the contraction-Gram budget

The chaos energies `u₂ = ‖U₂‖²`, `v₂ = ‖(q²)₂‖²` (and, below, `u₄`, `v₄`) of a circular cubic
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



end

end Grothe.LowerAnalytic
