import Grothe.LowerAnalytic.Circular
import Grothe.LowerAnalytic.Covariance
import Grothe.LowerAnalytic.FourthMoment

/-!
# The tensor facts of circular cubics

Proofs of the fields of `TensorFacts` (`Circular.lean`) for the kernel `f = ∂³a/6` of the real
part of a circular cubic.  The pure linear-algebra facts are stated for an arbitrary kernel
`f : ι → ι → ι → ℝ` and a complex structure `J`.

* `ouL_rotD`: the Ornstein–Uhlenbeck generator commutes with `D_J` for antisymmetric `J`, so
  the imaginary part `b = −D_J a` of a circular cubic is a cubic chaos (`Circular.chaos3_right`).
* `tenGa_le_half` (the field `anti`): `‖G_anti‖² ≤ s/2`.  With `G = FᵀF` and
  `G_anti = (G + JGJ)/2`, `4 ‖G_anti‖² = 2 tr G² + 2 tr(G J G J)` (`J` orthogonal) and
  `tr(G J G J) = tr(N²) = −‖N‖² ≤ 0` for the antisymmetric `N = F J Fᵀ`.
* **The charge calculus.**  `J` acts on each slot of a tensor (`sl₁ sl₂ sl₃` on 3-tensors,
  `sq₁ … sq₄` on 4-tensors); the slot operators commute, square to `−1` (`IsCplx J`) and are
  antisymmetric for the Frobenius inner product `ip4`.  The derivation `δ = Σᵢ Jᵢ` (`der3`,
  `der4`) satisfies the Leibniz rule for the contraction `con T T' = Σₓ T_{abx} T'_{cdx}`
  (`der4_con`), commutes with the symmetrisation `sym4` and with `Ω = J₁J₂J₃J₄` (`om4`),
  and `Ω (T ⋆ T') = (J₁J₂J₃ T) ⋆ (J₁J₂J₃ T')`.  The kernels `f`, `g` of a circular pair satisfy
  `δ f = −g`, `δ g = f` (`Circular.der3_left`, `Circular.der3_right`, from
  `kern (D_J P) = δ (kern P)`), hence `δ² f = −f` and `J₁J₂J₃ f = δ f` (`sl_triple_of_charge_one`,
  via `δ² = −3 + 2(J₁J₂ + J₁J₃ + J₂J₃)`).
* `tenTT_le_sixth` (the field `block`): `tt ≤ h/6`.  With `S = Sym(f ⋆ f)`, `S_g = Sym(g ⋆ g)`,
  `M = Sym(g ⋆ f + f ⋆ g)`: `δ S = −M`, `δ M = 2(S − S_g)`, so `⟨S, S_g⟩ = h − ‖M‖²/2`;
  `δ² = −4 + 2 Σ_{i<j} JᵢJⱼ` and the symmetry of `S` give `⟨S, J₁J₂ S⟩ = (4h − ‖M‖²)/12`;
  `Ω S = S_g`; and `‖S₋₋‖² = (h − ⟨S,J₁J₂S⟩ − ⟨S,J₃J₄S⟩ + ⟨S,ΩS⟩)/4`, whence
  `tt = h/6 − ‖M‖²/24`.
* `Chaos3.wick4` (the field `wick4`): `κ₄ = E F⁴ − 3 (E F²)² = 1296 (s + 3h/2)` for any cubic
  chaos `F` with kernel `f`.  `E F⁴ = E (F² Γ)` by integration by parts, `F² = Π₆ + Π₄ + Π₂ + E F²`
  and `Γ = Π₄ + 2Π₂ + 3 E F²` (`mul_eq_comps`, `J4`, `comp2`), the chaos components are
  orthogonal, and `E Γ²`, `E Γ₂²` are computed exactly from the pairing formula `quad_four` for
  the second-chaos derivatives `∂ᵢF` and Wick's formula `gE_four_chaos1` for their first-chaos
  derivatives, whose constant derivatives are `6 f`; the resulting index sums are `s = ‖C‖²`,
  the tetrahedral contraction `cQ = ⟨C, C^{(23)}⟩` (`3h = s + 2 cQ`, `three_tenH`) and `‖f‖²`.
* **The tetrahedral contraction** `Q4 T₁ T₂ T₃ T₄ = Σ T₁_{abx} T₂_{cdx} T₃_{acy} T₄_{bdy}`
  (`= ⟨T₁ ⋆ T₂, (T₃ ⋆ T₄)^{(23)}⟩`): `J` transfers along the six edges with a sign
  (`Q4_sl₁`, …), the vertices can be relabelled (`Q4_swap12`, `Q4_swap23`, `Q4_swap24`,
  `Q4_pairswap`), and `Σᵢ Q(…, δTᵢ, …) = 0` (`Q4_der`).  For a circular pair the
  charge-one relation `(J₁J₂ + J₁J₃ + J₂J₃) f = f` gives `3 Q(J₁J₂ f, f, f, f) = Q(f,f,f,f)`,
  `J`'s on two disjoint edges give `0`, and `3 Q(g,g,f,f) = Q(f,f,f,f)` (`Q4_gg`), whence
  `⟨N, N^{(23)}⟩ = (4/3) Q(f,f,f,f)` for `N = g ⋆ f + f ⋆ g` (`ip4_N_sw23`).
* `A0nn_circular`, `A2nn_circular` (the fields `A0nn`, `A2nn`): with `C₀ = (C + C_g)/2`,
  `C₂ = (C − C_g)/2` and `S₀ = Sym C₀`, `S₂ = Sym C₂`, the quantities `A₀`, `A₂` of the
  certificate are `‖C₀ − θ S₀‖²` and `‖C₂ − θ S₂‖²` (`sector_nonneg`, `sector_data`:
  `⟨C, C_g⟩ = s − ‖N‖²/2`, `‖C_g‖² = s`, `⟨S, S_g⟩ = h − ‖M‖²/2`, `‖S_g‖² = h`,
  `3 ‖M‖² = ‖N‖² + (8/3) Q(f,f,f,f)`, `3h = s + 2 Q(f,f,f,f)`, `tt = h/6 − ‖M‖²/24`).
* `TensorFactsRest` collects the eight remaining fields; `TensorFactsRest.toTensorFacts`
  assembles `TensorFacts` from them for a circular pair.
-/

open MvPolynomial Matrix

namespace Grothe.LowerAnalytic

noncomputable section

variable {ι : Type*} [Fintype ι]

/-! ### The rotation generator commutes with the Ornstein–Uhlenbeck generator -/

section rotation

variable (J : ι → ι → ℝ)

lemma rotD_sum {κ : Type*} (s : Finset κ) (P : κ → MvPolynomial ι ℝ) :
    rotD J (∑ k ∈ s, P k) = ∑ k ∈ s, rotD J (P k) := by
  simp only [rotD, map_sum, Finset.mul_sum]
  exact (Finset.sum_congr rfl fun _ _ => Finset.sum_comm).trans Finset.sum_comm

lemma rotD_X [DecidableEq ι] (i : ι) : rotD J (X i : MvPolynomial ι ℝ) = ∑ j, C (J j i) * X j := by
  simp only [rotD, pderiv_X, Pi.single_apply]
  rw [Finset.sum_eq_single i (fun i' _ hi' => by simp [hi'.symm]) (fun h => absurd (Finset.mem_univ i) h)]
  simp

lemma pderiv_rotD [DecidableEq ι] (i : ι) (P : MvPolynomial ι ℝ) :
    pderiv i (rotD J P) = rotD J (pderiv i P) + ∑ p, C (J i p) * pderiv p P := by
  simp only [rotD, map_sum, pderiv_mul, pderiv_C, zero_mul, zero_add, pderiv_X, Pi.single_apply,
    mul_add, Finset.sum_add_distrib, pderiv_pderiv_comm i]
  rw [add_comm]
  congr 1
  refine Finset.sum_congr rfl fun p _ => ?_
  simp [Finset.sum_ite_eq']

/-- The generator commutes with the rotation generator of an antisymmetric `J`. -/
lemma ouL_rotD [DecidableEq ι] (hJ : ∀ i j, J i j = -J j i) (P : MvPolynomial ι ℝ) :
    ouL (rotD J P) = rotD J (ouL P) := by
  have h0 : ∑ i, ∑ p, C (J i p) * pderiv i (pderiv p P) = (0 : MvPolynomial ι ℝ) := by
    have h : ∑ i, ∑ p, C (J i p) * pderiv i (pderiv p P)
        = -∑ i, ∑ p, C (J i p) * pderiv i (pderiv p P) := by
      conv_lhs => rw [Finset.sum_comm]
      rw [← Finset.sum_neg_distrib]
      refine Finset.sum_congr rfl fun i _ => ?_
      rw [← Finset.sum_neg_distrib]
      refine Finset.sum_congr rfl fun p _ => ?_
      rw [hJ p i, pderiv_pderiv_comm, map_neg]; ring
    have h2 : (2 : ℝ) • ∑ i, ∑ p, C (J i p) * pderiv i (pderiv p P) = 0 := by
      rw [two_smul]; linear_combination h
    exact (smul_eq_zero.1 h2).resolve_left two_ne_zero
  have hA : ∀ i, pderiv i (pderiv i (rotD J P)) = rotD J (pderiv i (pderiv i P))
      + (∑ p, C (J i p) * pderiv p (pderiv i P) + ∑ p, C (J i p) * pderiv i (pderiv p P)) :=
    fun i => by
    rw [pderiv_rotD, map_add, pderiv_rotD, map_sum, add_assoc]; simp only [pderiv_C_mul]
  have hB : ∀ i, X i * pderiv i (rotD J P)
      = X i * rotD J (pderiv i P) + ∑ p, C (J i p) * (X i * pderiv p P) := fun i => by
    rw [pderiv_rotD, mul_add, Finset.mul_sum]
    congr 1
    exact Finset.sum_congr rfl fun p _ => by ring
  have hsym : ∀ i, ∑ p, C (J i p) * pderiv p (pderiv i P)
      = ∑ p, C (J i p) * pderiv i (pderiv p P) :=
    fun i => Finset.sum_congr rfl fun p _ => by rw [pderiv_pderiv_comm]
  have hswap : ∑ i, pderiv i P * ∑ j, C (J j i) * X j
      = ∑ i, ∑ p, C (J i p) * (X i * pderiv p P) := by
    simp only [Finset.mul_sum]
    rw [Finset.sum_comm]
    exact Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun p _ => by ring
  rw [ouL_apply, ouL_apply, rotD_sum]
  simp only [hA, hB, rotD_sub, rotD_mul, rotD_X, hsym, Finset.sum_sub_distrib,
    Finset.sum_add_distrib, hswap, h0]
  ring

/-- Third derivatives of `rotD J P` are constant when those of `P` are. -/
lemma rotD_cubic [DecidableEq ι] {P : MvPolynomial ι ℝ}
    (hP : ∀ i j k, ∃ t : ℝ, pderiv i (pderiv j (pderiv k P)) = C t) (i j k : ι) :
    ∃ t : ℝ, pderiv i (pderiv j (pderiv k (rotD J P))) = C t := by
  choose t ht using hP
  refine ⟨∑ p, J i p * t p j k + ∑ p, J j p * t i p k + ∑ p, J k p * t i j p, ?_⟩
  simp only [pderiv_rotD, map_add, map_sum, pderiv_C_mul, ht, rotD_C, zero_add, ← C_mul, map_add,
    map_sum]

/-- The imaginary part of a circular cubic is a cubic chaos. -/
theorem Circular.chaos3_right [DecidableEq ι] {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (hc : Circular J a b)
    (ha : Chaos3 a) : Chaos3 b where
  eig := by
    have hb : b = -rotD J a := by rw [hc.da, neg_neg]
    rw [hb, map_neg, ouL_rotD J hc.anti, ha.eig, rotD_neg,
      show (3 : MvPolynomial ι ℝ) * a = C 3 * a by rw [map_ofNat], rotD_C_mul, hc.da, map_ofNat]
    ring
  cubic i j k := by
    have hb : b = -rotD J a := by rw [hc.da, neg_neg]
    obtain ⟨t, ht⟩ := rotD_cubic J ha.cubic i j k
    exact ⟨-t, by rw [hb, map_neg, map_neg, map_neg, ht, map_neg]⟩

end rotation

/-! ### `‖G_anti‖² ≤ s/2` -/

/-- `tr(Aᵀ A) = Σ A_{ij}²`. -/
lemma trace_transpose_mul_self {m n : Type*} [Fintype m] [Fintype n] (A : Matrix m n ℝ) :
    (Aᵀ * A).trace = ∑ i, ∑ j, A i j ^ 2 := by
  simp only [Matrix.trace, Matrix.diag, Matrix.mul_apply, Matrix.transpose_apply, sq]
  exact Finset.sum_comm

lemma trace_transpose_mul_self_nonneg {m n : Type*} [Fintype m] [Fintype n] (A : Matrix m n ℝ) :
    0 ≤ (Aᵀ * A).trace := by
  rw [trace_transpose_mul_self]; positivity

section matrices

variable (f : ι → ι → ι → ℝ) (J : ι → ι → ℝ)

/-- `F` as a matrix on pairs. -/
def matF : Matrix (ι × ι) ι ℝ := Matrix.of fun p c => f p.1 p.2 c

/-- `G` as a matrix. -/
def matG : Matrix ι ι ℝ := Matrix.of fun c d => kerG f c d

def matJ : Matrix ι ι ℝ := Matrix.of J

lemma matG_eq : matG f = (matF f)ᵀ * matF f := by
  ext c d
  simp only [matG, matF, kerG, Matrix.of_apply, Matrix.mul_apply, Matrix.transpose_apply,
    Fintype.sum_prod_type]

lemma matG_transpose : (matG f)ᵀ = matG f := by
  ext c d; simp only [matG, Matrix.transpose_apply, Matrix.of_apply, kerG_symm f c d]

lemma tenS_eq_trace : tenS f = ((matG f)ᵀ * matG f).trace := by
  rw [trace_transpose_mul_self]; rfl

lemma matJGJ_apply (c d : ι) :
    (matJ J * matG f * matJ J) c d = ∑ e, ∑ e', J c e * kerG f e e' * J e' d := by
  simp only [Matrix.mul_apply, matJ, matG, Matrix.of_apply, Finset.sum_mul]
  rw [Finset.sum_comm]

lemma tenGa_eq_trace :
    tenGa f J = (((1 / 2 : ℝ) • (matG f + matJ J * matG f * matJ J))ᵀ
      * ((1 / 2 : ℝ) • (matG f + matJ J * matG f * matJ J))).trace := by
  rw [trace_transpose_mul_self]
  unfold tenGa kerGa
  refine Finset.sum_congr rfl fun c _ => Finset.sum_congr rfl fun d _ => ?_
  rw [Matrix.smul_apply, Matrix.add_apply, matJGJ_apply, smul_eq_mul, matG]
  simp only [Matrix.of_apply]
  ring

variable {J} [DecidableEq ι]

omit [Fintype ι] [DecidableEq ι] in
lemma matJ_transpose (hJ : ∀ i j, J i j = -J j i) : (matJ J)ᵀ = -matJ J := by
  ext i j; simp only [matJ, Matrix.transpose_apply, Matrix.neg_apply, Matrix.of_apply]; exact hJ j i

lemma matJ_sq (hd : ∀ i, ∑ j, J i j * J j i = -1) (ho : ∀ i k, i ≠ k → ∑ j, J i j * J j k = 0) :
    matJ J * matJ J = -1 := by
  ext i k
  simp only [Matrix.mul_apply, matJ, Matrix.of_apply, Matrix.neg_apply, Matrix.one_apply]
  by_cases h : i = k
  · subst h; simp [hd i]
  · simp [h, ho i k h]

/-- **`‖G_anti‖² ≤ s/2`**: `2 tenGa − s = tr(G J G J) = tr(N²)` with `N = F J Fᵀ` antisymmetric. -/
theorem tenGa_le_half (hJ : ∀ i j, J i j = -J j i) (hd : ∀ i, ∑ j, J i j * J j i = -1)
    (ho : ∀ i k, i ≠ k → ∑ j, J i j * J j k = 0) : tenGa f J ≤ tenS f / 2 := by
  have hJt := matJ_transpose hJ
  have hJJ := matJ_sq hd ho
  set Jm := matJ J with hJm
  set G := matG f with hG
  set F := matF f with hF
  have hGt : Gᵀ = G := matG_transpose f
  have hJJt : Jm * Jmᵀ = 1 := by rw [hJt, Matrix.mul_neg, hJJ, neg_neg]
  have hJtJ : Jmᵀ * Jm = 1 := by rw [hJt, Matrix.neg_mul, hJJ, neg_neg]
  -- `(JGJ)ᵀ = JGJ`
  have hsym : (Jm * G * Jm)ᵀ = Jm * G * Jm := by
    rw [Matrix.transpose_mul, Matrix.transpose_mul, hJt, hGt, Matrix.neg_mul, Matrix.mul_neg,
      Matrix.mul_neg, neg_neg, Matrix.mul_assoc]
  -- `tr((JGJ)ᵀ JGJ) = tr(G G)`
  have h2 : ((Jm * G * Jm)ᵀ * (Jm * G * Jm)).trace = (G * G).trace := by
    rw [hsym, show Jm * G * Jm * (Jm * G * Jm) = Jm * G * (Jm * Jm) * G * Jm by
      simp only [Matrix.mul_assoc], hJJ, Matrix.mul_neg, Matrix.mul_one, Matrix.neg_mul,
      Matrix.neg_mul, Matrix.trace_neg, Matrix.trace_mul_comm (Jm * G * G) Jm,
      show Jm * (Jm * G * G) = (Jm * Jm) * G * G by simp only [Matrix.mul_assoc], hJJ,
      Matrix.neg_mul, Matrix.neg_mul, Matrix.one_mul, Matrix.trace_neg, neg_neg]
  -- `tr(G J G J) = tr(N N)`, `N = F J Fᵀ`
  have h3 : (G * (Jm * G * Jm)).trace = ((F * Jm * Fᵀ) * (F * Jm * Fᵀ)).trace := by
    rw [hG, matG_eq, ← hF, show Fᵀ * F * (Jm * (Fᵀ * F) * Jm) = Fᵀ * (F * Jm * Fᵀ * (F * Jm)) by
      simp only [Matrix.mul_assoc], Matrix.trace_mul_comm]
    simp only [Matrix.mul_assoc]
  have hN : (F * Jm * Fᵀ)ᵀ = -(F * Jm * Fᵀ) := by
    rw [Matrix.transpose_mul, Matrix.transpose_mul, Matrix.transpose_transpose, hJt,
      Matrix.neg_mul, Matrix.mul_neg, Matrix.mul_assoc]
  have h4 : ((F * Jm * Fᵀ) * (F * Jm * Fᵀ)).trace ≤ 0 := by
    have := trace_transpose_mul_self_nonneg (F * Jm * Fᵀ)
    rw [hN, Matrix.neg_mul, Matrix.trace_neg] at this
    linarith
  have hS : tenS f = (G * G).trace := by rw [tenS_eq_trace, hGt]
  have hM : (G + Jm * G * Jm)ᵀ = G + Jm * G * Jm := by rw [Matrix.transpose_add, hGt, hsym]
  have hGa : tenGa f J = 1 / 4 * ((G * G).trace + (G * (Jm * G * Jm)).trace
      + ((Jm * G * Jm) * G).trace + ((Jm * G * Jm) * (Jm * G * Jm)).trace) := by
    rw [tenGa_eq_trace, Matrix.transpose_smul, hM, Matrix.smul_mul, Matrix.mul_smul, smul_smul,
      Matrix.trace_smul, Matrix.add_mul, Matrix.mul_add, Matrix.mul_add, Matrix.trace_add,
      Matrix.trace_add, Matrix.trace_add, smul_eq_mul]
    ring
  rw [hsym] at h2
  rw [hGa, Matrix.trace_mul_comm (Jm * G * Jm) G, h2, h3, hS]
  linarith

end matrices

/-! ### A complex structure -/

/-- `J` is a complex structure: antisymmetric with `J² = −1`. -/
structure IsCplx (J : ι → ι → ℝ) : Prop where
  anti : ∀ i j, J i j = -J j i
  sq_diag : ∀ i, ∑ j, J i j * J j i = -1
  sq_off : ∀ i k, i ≠ k → ∑ j, J i j * J j k = 0

lemma Circular.isCplx {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ} (hc : Circular J a b) : IsCplx J :=
  ⟨hc.anti, hc.sq_diag, hc.sq_off⟩

namespace IsCplx

variable {J : ι → ι → ℝ} (hJ : IsCplx J)
include hJ

/-- `Σ_p J a p (Σ_q J p q v q) = −v a`. -/
lemma sum_sq (v : ι → ℝ) (a : ι) : ∑ p, J a p * ∑ q, J p q * v q = -v a := by
  classical
  simp only [Finset.mul_sum]
  rw [Finset.sum_comm]
  have e : ∀ q, ∑ p, J a p * (J p q * v q) = (∑ p, J a p * J p q) * v q := fun q => by
    rw [Finset.sum_mul]; exact Finset.sum_congr rfl fun p _ => by ring
  simp only [e]
  rw [Finset.sum_eq_single a (fun q _ hq => by rw [hJ.sq_off a q (Ne.symm hq), zero_mul])
    (fun h => absurd (Finset.mem_univ a) h), hJ.sq_diag a]
  ring

/-- `Σ_p J p a (Σ_q J p q v q) = v a` (`JᵀJ = 1`). -/
lemma sum_tsq (v : ι → ℝ) (a : ι) : ∑ p, J p a * ∑ q, J p q * v q = v a := by
  calc ∑ p, J p a * ∑ q, J p q * v q = -∑ p, J a p * ∑ q, J p q * v q := by
        rw [← Finset.sum_neg_distrib]
        exact Finset.sum_congr rfl fun p _ => by rw [hJ.anti p a]; ring
    _ = v a := by rw [hJ.sum_sq v a, neg_neg]

end IsCplx

/-! ### Slot operators on 3-tensors -/

section slots3

variable (J : ι → ι → ℝ)

/-- `J` acting on the first slot. -/
def sl₁ : (ι → ι → ι → ℝ) →ₗ[ℝ] (ι → ι → ι → ℝ) where
  toFun T a b c := ∑ p, J a p * T p b c
  map_add' T T' := by funext a b c; simp only [Pi.add_apply, mul_add, Finset.sum_add_distrib]
  map_smul' r T := by
    funext a b c; simp only [Pi.smul_apply, smul_eq_mul, RingHom.id_apply, Finset.mul_sum]
    exact Finset.sum_congr rfl fun p _ => by ring

/-- `J` acting on the second slot. -/
def sl₂ : (ι → ι → ι → ℝ) →ₗ[ℝ] (ι → ι → ι → ℝ) where
  toFun T a b c := ∑ p, J b p * T a p c
  map_add' T T' := by funext a b c; simp only [Pi.add_apply, mul_add, Finset.sum_add_distrib]
  map_smul' r T := by
    funext a b c; simp only [Pi.smul_apply, smul_eq_mul, RingHom.id_apply, Finset.mul_sum]
    exact Finset.sum_congr rfl fun p _ => by ring

/-- `J` acting on the third slot. -/
def sl₃ : (ι → ι → ι → ℝ) →ₗ[ℝ] (ι → ι → ι → ℝ) where
  toFun T a b c := ∑ p, J c p * T a b p
  map_add' T T' := by funext a b c; simp only [Pi.add_apply, mul_add, Finset.sum_add_distrib]
  map_smul' r T := by
    funext a b c; simp only [Pi.smul_apply, smul_eq_mul, RingHom.id_apply, Finset.mul_sum]
    exact Finset.sum_congr rfl fun p _ => by ring

/-- The derivation `δ = J₁ + J₂ + J₃` on 3-tensors. -/
def der3 : (ι → ι → ι → ℝ) →ₗ[ℝ] (ι → ι → ι → ℝ) := sl₁ J + sl₂ J + sl₃ J

variable {J}

lemma sl₁_apply (T : ι → ι → ι → ℝ) (a b c : ι) : sl₁ J T a b c = ∑ p, J a p * T p b c := rfl
lemma sl₂_apply (T : ι → ι → ι → ℝ) (a b c : ι) : sl₂ J T a b c = ∑ p, J b p * T a p c := rfl
lemma sl₃_apply (T : ι → ι → ι → ℝ) (a b c : ι) : sl₃ J T a b c = ∑ p, J c p * T a b p := rfl
lemma der3_apply (T : ι → ι → ι → ℝ) (a b c : ι) :
    der3 J T a b c = ∑ p, J a p * T p b c + ∑ p, J b p * T a p c + ∑ p, J c p * T a b p := rfl

lemma der3_apply' (T : ι → ι → ι → ℝ) : der3 J T = sl₁ J T + sl₂ J T + sl₃ J T := rfl

lemma sl_comm12 (T : ι → ι → ι → ℝ) : sl₁ J (sl₂ J T) = sl₂ J (sl₁ J T) := by
  funext a b c
  simp only [sl₁_apply, sl₂_apply, Finset.mul_sum]
  rw [Finset.sum_comm]
  exact Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun q _ => by ring

lemma sl_comm13 (T : ι → ι → ι → ℝ) : sl₁ J (sl₃ J T) = sl₃ J (sl₁ J T) := by
  funext a b c
  simp only [sl₁_apply, sl₃_apply, Finset.mul_sum]
  rw [Finset.sum_comm]
  exact Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun q _ => by ring

lemma sl_comm23 (T : ι → ι → ι → ℝ) : sl₂ J (sl₃ J T) = sl₃ J (sl₂ J T) := by
  funext a b c
  simp only [sl₂_apply, sl₃_apply, Finset.mul_sum]
  rw [Finset.sum_comm]
  exact Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun q _ => by ring

variable (hJ : IsCplx J)
include hJ

lemma sl_sq1 (T : ι → ι → ι → ℝ) : sl₁ J (sl₁ J T) = -T := by
  funext a b c
  simp only [sl₁_apply, Pi.neg_apply]
  exact hJ.sum_sq (fun p => T p b c) a

lemma sl_sq2 (T : ι → ι → ι → ℝ) : sl₂ J (sl₂ J T) = -T := by
  funext a b c
  simp only [sl₂_apply, Pi.neg_apply]
  exact hJ.sum_sq (fun p => T a p c) b

lemma sl_sq3 (T : ι → ι → ι → ℝ) : sl₃ J (sl₃ J T) = -T := by
  funext a b c
  simp only [sl₃_apply, Pi.neg_apply]
  exact hJ.sum_sq (fun p => T a b p) c

/-- `δ² T = −3T + 2(J₁J₂ + J₁J₃ + J₂J₃) T`. -/
lemma der3_sq (T : ι → ι → ι → ℝ) : der3 J (der3 J T)
    = -(3 : ℝ) • T + (2 : ℝ) • (sl₁ J (sl₂ J T) + sl₁ J (sl₃ J T) + sl₂ J (sl₃ J T)) := by
  simp only [der3_apply', map_add, sl_sq1 hJ, sl_sq2 hJ, sl_sq3 hJ, ← sl_comm12, ← sl_comm13,
    ← sl_comm23]
  module

/-- **Charge one**: if `δ² T = −T` then `(J₁J₂ + J₁J₃ + J₂J₃) T = T`. -/
lemma charge_one_e2 {T : ι → ι → ι → ℝ} (hT : der3 J (der3 J T) = -T) :
    sl₁ J (sl₂ J T) + sl₁ J (sl₃ J T) + sl₂ J (sl₃ J T) = T := by
  have h := der3_sq hJ T
  rw [hT] at h
  have h' : (2 : ℝ) • (sl₁ J (sl₂ J T) + sl₁ J (sl₃ J T) + sl₂ J (sl₃ J T)) = (2 : ℝ) • T := by
    rw [← sub_eq_zero]
    have : -(3 : ℝ) • T + (2 : ℝ) • (sl₁ J (sl₂ J T) + sl₁ J (sl₃ J T) + sl₂ J (sl₃ J T))
        - -T = 0 := by rw [← h]; abel
    rw [← this]; module
  exact smul_right_injective _ (two_ne_zero) h'

/-- **Charge one**: if `δ² T = −T` then `J₁J₂J₃ T = δ T`. -/
lemma sl_triple_of_charge_one {T : ι → ι → ι → ℝ} (hT : der3 J (der3 J T) = -T) :
    sl₁ J (sl₂ J (sl₃ J T)) = der3 J T := by
  have h3 := congrArg (sl₁ J) (charge_one_e2 hJ hT)
  rw [map_add, map_add, sl_sq1 hJ, sl_sq1 hJ] at h3
  rw [der3_apply', ← h3]
  abel

end slots3

/-! ### The kernel of `D_J a` -/

section kernel

variable {J : ι → ι → ℝ}

omit [Fintype ι] in
lemma constantCoeff_rotD [Fintype ι] (J : ι → ι → ℝ) (Q : MvPolynomial ι ℝ) :
    constantCoeff (rotD J Q) = 0 := by
  simp [rotD]

/-- `kern (D_J P) = δ (kern P)`: the third derivative of `D_J P` is the derivation action of
`J` on the three slots of the third derivative of `P`. -/
lemma kern_rotD [DecidableEq ι] (J : ι → ι → ℝ) (P : MvPolynomial ι ℝ) (i j k : ι) :
    kern (rotD J P) i j k
      = ∑ p, J i p * kern P p j k + ∑ p, J j p * kern P i p k + ∑ p, J k p * kern P i j p := by
  unfold kern
  simp only [pderiv_rotD, map_add, map_sum, pderiv_C_mul, constantCoeff_rotD, zero_add, map_mul,
    constantCoeff_C]

lemma cubicKernel_rotD [DecidableEq ι] (J : ι → ι → ℝ) (P : MvPolynomial ι ℝ) :
    cubicKernel (rotD J P) = der3 J (cubicKernel P) := by
  funext i j k
  simp only [cubicKernel, kern_rotD, der3_apply, add_div, Finset.sum_div]
  simp only [mul_div_assoc]

omit [Fintype ι] in
lemma kern_neg (P : MvPolynomial ι ℝ) (i j k : ι) : kern (-P) i j k = -kern P i j k := by
  simp [kern]

omit [Fintype ι] in
lemma cubicKernel_neg (P : MvPolynomial ι ℝ) : cubicKernel (-P) = -cubicKernel P := by
  funext i j k; simp [cubicKernel, kern_neg, neg_div]

variable [DecidableEq ι] {a b : MvPolynomial ι ℝ} (hc : Circular J a b)
include hc

/-- `δ f = −g` for the kernels `f`, `g` of a circular pair. -/
lemma Circular.der3_left : der3 J (cubicKernel a) = -cubicKernel b := by
  rw [← cubicKernel_rotD, hc.da, cubicKernel_neg]

/-- `δ g = f`. -/
lemma Circular.der3_right : der3 J (cubicKernel b) = cubicKernel a := by
  rw [← cubicKernel_rotD, hc.db]

end kernel

/-! ### Slot operators on 4-tensors -/

section slots4

variable (J : ι → ι → ℝ)

/-- 4-tensors. -/
abbrev T4 (ι : Type*) := ι → ι → ι → ι → ℝ

def sq₁ : T4 ι →ₗ[ℝ] T4 ι where
  toFun T a b c d := ∑ p, J a p * T p b c d
  map_add' T T' := by funext a b c d; simp only [Pi.add_apply, mul_add, Finset.sum_add_distrib]
  map_smul' r T := by
    funext a b c d; simp only [Pi.smul_apply, smul_eq_mul, RingHom.id_apply, Finset.mul_sum]
    exact Finset.sum_congr rfl fun p _ => by ring

def sq₂ : T4 ι →ₗ[ℝ] T4 ι where
  toFun T a b c d := ∑ p, J b p * T a p c d
  map_add' T T' := by funext a b c d; simp only [Pi.add_apply, mul_add, Finset.sum_add_distrib]
  map_smul' r T := by
    funext a b c d; simp only [Pi.smul_apply, smul_eq_mul, RingHom.id_apply, Finset.mul_sum]
    exact Finset.sum_congr rfl fun p _ => by ring

def sq₃ : T4 ι →ₗ[ℝ] T4 ι where
  toFun T a b c d := ∑ p, J c p * T a b p d
  map_add' T T' := by funext a b c d; simp only [Pi.add_apply, mul_add, Finset.sum_add_distrib]
  map_smul' r T := by
    funext a b c d; simp only [Pi.smul_apply, smul_eq_mul, RingHom.id_apply, Finset.mul_sum]
    exact Finset.sum_congr rfl fun p _ => by ring

def sq₄ : T4 ι →ₗ[ℝ] T4 ι where
  toFun T a b c d := ∑ p, J d p * T a b c p
  map_add' T T' := by funext a b c d; simp only [Pi.add_apply, mul_add, Finset.sum_add_distrib]
  map_smul' r T := by
    funext a b c d; simp only [Pi.smul_apply, smul_eq_mul, RingHom.id_apply, Finset.mul_sum]
    exact Finset.sum_congr rfl fun p _ => by ring

/-- The derivation `δ = J₁ + J₂ + J₃ + J₄` on 4-tensors. -/
def der4 : T4 ι →ₗ[ℝ] T4 ι := sq₁ J + sq₂ J + sq₃ J + sq₄ J

/-- `Ω = J₁J₂J₃J₄`. -/
def om4 : T4 ι →ₗ[ℝ] T4 ι := sq₁ J * sq₂ J * sq₃ J * sq₄ J

/-- The Frobenius inner product of 4-tensors. -/
def ip4 (T T' : T4 ι) : ℝ := ∑ a, ∑ b, ∑ c, ∑ d, T a b c d * T' a b c d

/-- The contraction `(T ⋆ T')_{ab,cd} = Σₓ T_{abx} T'_{cdx}` (`kerC f = f ⋆ f`). -/
def con (T T' : ι → ι → ι → ℝ) : T4 ι := fun a b c d => ∑ x, T a b x * T' c d x

/-- The partial symmetrisation of `kerS`. -/
def sym4 (T : T4 ι) : T4 ι := fun a b c d => (T a b c d + T a c b d + T a d b c) / 3

variable {J}

lemma sq₁_apply (T : T4 ι) (a b c d : ι) : sq₁ J T a b c d = ∑ p, J a p * T p b c d := rfl
lemma sq₂_apply (T : T4 ι) (a b c d : ι) : sq₂ J T a b c d = ∑ p, J b p * T a p c d := rfl
lemma sq₃_apply (T : T4 ι) (a b c d : ι) : sq₃ J T a b c d = ∑ p, J c p * T a b p d := rfl
lemma sq₄_apply (T : T4 ι) (a b c d : ι) : sq₄ J T a b c d = ∑ p, J d p * T a b c p := rfl
lemma der4_apply (T : T4 ι) : der4 J T = sq₁ J T + sq₂ J T + sq₃ J T + sq₄ J T := rfl
lemma om4_apply (T : T4 ι) : om4 J T = sq₁ J (sq₂ J (sq₃ J (sq₄ J T))) := rfl

lemma kerC_eq_con (f : ι → ι → ι → ℝ) : kerC f = con f f := rfl
lemma kerS_eq_sym4 (f : ι → ι → ι → ℝ) : kerS f = sym4 (con f f) := rfl
lemma tenH_eq_ip4 (f : ι → ι → ι → ℝ) : tenH f = ip4 (kerS f) (kerS f) := by
  simp only [tenH, ip4, sq]

lemma con_add_left (T₁ T₂ T' : ι → ι → ι → ℝ) : con (T₁ + T₂) T' = con T₁ T' + con T₂ T' := by
  funext a b c d; simp only [con, Pi.add_apply, add_mul, Finset.sum_add_distrib]
lemma con_add_right (T T₁ T₂ : ι → ι → ι → ℝ) : con T (T₁ + T₂) = con T T₁ + con T T₂ := by
  funext a b c d; simp only [con, Pi.add_apply, mul_add, Finset.sum_add_distrib]
lemma con_neg_left (T T' : ι → ι → ι → ℝ) : con (-T) T' = -con T T' := by
  funext a b c d; simp only [con, Pi.neg_apply, neg_mul, Finset.sum_neg_distrib]
lemma con_neg_right (T T' : ι → ι → ι → ℝ) : con T (-T') = -con T T' := by
  funext a b c d; simp only [con, Pi.neg_apply, mul_neg, Finset.sum_neg_distrib]

omit [Fintype ι] in
lemma sym4_add (T T' : T4 ι) : sym4 (T + T') = sym4 T + sym4 T' := by
  funext a b c d; simp only [sym4, Pi.add_apply]; ring
omit [Fintype ι] in
lemma sym4_sub (T T' : T4 ι) : sym4 (T - T') = sym4 T - sym4 T' := by
  funext a b c d; simp only [sym4, Pi.sub_apply]; ring
omit [Fintype ι] in
lemma sym4_neg (T : T4 ι) : sym4 (-T) = -sym4 T := by
  funext a b c d; simp only [sym4, Pi.neg_apply]; ring
omit [Fintype ι] in
lemma sym4_smul (r : ℝ) (T : T4 ι) : sym4 (r • T) = r • sym4 T := by
  funext a b c d; simp only [sym4, Pi.smul_apply, smul_eq_mul]; ring

/-! Bilinearity of `ip4`. -/

lemma ip4_comm (T T' : T4 ι) : ip4 T T' = ip4 T' T := by
  unfold ip4
  exact Finset.sum_congr rfl fun _ _ => Finset.sum_congr rfl fun _ _ =>
    Finset.sum_congr rfl fun _ _ => Finset.sum_congr rfl fun _ _ => mul_comm _ _
lemma ip4_add_left (T₁ T₂ T' : T4 ι) : ip4 (T₁ + T₂) T' = ip4 T₁ T' + ip4 T₂ T' := by
  simp only [ip4, Pi.add_apply, add_mul, Finset.sum_add_distrib]
lemma ip4_add_right (T T₁ T₂ : T4 ι) : ip4 T (T₁ + T₂) = ip4 T T₁ + ip4 T T₂ := by
  simp only [ip4, Pi.add_apply, mul_add, Finset.sum_add_distrib]
lemma ip4_sub_left (T₁ T₂ T' : T4 ι) : ip4 (T₁ - T₂) T' = ip4 T₁ T' - ip4 T₂ T' := by
  simp only [ip4, Pi.sub_apply, sub_mul, Finset.sum_sub_distrib]
lemma ip4_sub_right (T T₁ T₂ : T4 ι) : ip4 T (T₁ - T₂) = ip4 T T₁ - ip4 T T₂ := by
  simp only [ip4, Pi.sub_apply, mul_sub, Finset.sum_sub_distrib]
lemma ip4_neg_left (T T' : T4 ι) : ip4 (-T) T' = -ip4 T T' := by
  simp only [ip4, Pi.neg_apply, neg_mul, Finset.sum_neg_distrib]
lemma ip4_neg_right (T T' : T4 ι) : ip4 T (-T') = -ip4 T T' := by
  simp only [ip4, Pi.neg_apply, mul_neg, Finset.sum_neg_distrib]
lemma ip4_smul_left (r : ℝ) (T T' : T4 ι) : ip4 (r • T) T' = r * ip4 T T' := by
  simp only [ip4, Pi.smul_apply, smul_eq_mul, Finset.mul_sum, mul_assoc]
lemma ip4_smul_right (r : ℝ) (T T' : T4 ι) : ip4 T (r • T') = r * ip4 T T' := by
  rw [ip4_comm, ip4_smul_left, ip4_comm]
lemma ip4_self_nonneg (T : T4 ι) : 0 ≤ ip4 T T := by
  unfold ip4
  exact Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ =>
    Finset.sum_nonneg fun _ _ => mul_self_nonneg _

/-! Antisymmetry of the slot operators. -/

/-- One-slot antisymmetry: `Σₐ (Σₚ Jₐₚ Fₚ) Gₐ = −Σₐ Fₐ (Σₚ Jₐₚ Gₚ)`. -/
lemma anti_slot0 (hJ : ∀ i j, J i j = -J j i) (F G : ι → ℝ) :
    ∑ a, (∑ p, J a p * F p) * G a = -∑ a, F a * ∑ p, J a p * G p := by
  simp only [Finset.sum_mul, Finset.mul_sum, ← Finset.sum_neg_distrib]
  rw [Finset.sum_comm]
  refine Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun p _ => ?_
  rw [hJ p a]; ring

lemma anti_slot (hJ : ∀ i j, J i j = -J j i) {κ : Type*} [Fintype κ] (F G : κ → ι → ℝ) :
    ∑ a, ∑ k, (∑ p, J a p * F k p) * G k a = -∑ a, ∑ k, F k a * ∑ p, J a p * G k p := by
  calc ∑ a, ∑ k, (∑ p, J a p * F k p) * G k a
      = ∑ k, ∑ a, (∑ p, J a p * F k p) * G k a := Finset.sum_comm
    _ = ∑ k, -∑ a, F k a * ∑ p, J a p * G k p :=
        Finset.sum_congr rfl fun k _ => anti_slot0 hJ (F k) (G k)
    _ = -∑ a, ∑ k, F k a * ∑ p, J a p * G k p := by rw [Finset.sum_neg_distrib, Finset.sum_comm]

variable (hJ : IsCplx J)
include hJ

lemma ip4_sq₁ (T T' : T4 ι) : ip4 (sq₁ J T) T' = -ip4 T (sq₁ J T') := by
  simp only [ip4, sq₁_apply]
  have := anti_slot hJ.anti (κ := ι × ι × ι) (fun k p => T p k.1 k.2.1 k.2.2)
    (fun k a => T' a k.1 k.2.1 k.2.2)
  simpa only [Fintype.sum_prod_type] using this

lemma ip4_sq₂ (T T' : T4 ι) : ip4 (sq₂ J T) T' = -ip4 T (sq₂ J T') := by
  simp only [ip4, sq₂_apply]
  rw [← Finset.sum_neg_distrib]
  refine Finset.sum_congr rfl fun a _ => ?_
  have := anti_slot hJ.anti (κ := ι × ι) (fun k p => T a p k.1 k.2) (fun k b => T' a b k.1 k.2)
  simpa only [Fintype.sum_prod_type] using this

lemma ip4_sq₃ (T T' : T4 ι) : ip4 (sq₃ J T) T' = -ip4 T (sq₃ J T') := by
  simp only [ip4, sq₃_apply]
  rw [← Finset.sum_neg_distrib]
  refine Finset.sum_congr rfl fun a _ => ?_
  rw [← Finset.sum_neg_distrib]
  refine Finset.sum_congr rfl fun b _ => ?_
  exact anti_slot hJ.anti (κ := ι) (fun k p => T a b p k) (fun k c => T' a b c k)

lemma ip4_sq₄ (T T' : T4 ι) : ip4 (sq₄ J T) T' = -ip4 T (sq₄ J T') := by
  simp only [ip4, sq₄_apply]
  rw [← Finset.sum_neg_distrib]
  refine Finset.sum_congr rfl fun a _ => ?_
  rw [← Finset.sum_neg_distrib]
  refine Finset.sum_congr rfl fun b _ => ?_
  rw [← Finset.sum_neg_distrib]
  refine Finset.sum_congr rfl fun c _ => ?_
  exact anti_slot0 hJ.anti (fun p => T a b c p) (fun d => T' a b c d)

lemma ip4_der4 (T T' : T4 ι) : ip4 (der4 J T) T' = -ip4 T (der4 J T') := by
  simp only [der4_apply, ip4_add_left, ip4_add_right, ip4_sq₁ hJ, ip4_sq₂ hJ, ip4_sq₃ hJ,
    ip4_sq₄ hJ]
  ring

/-- `⟨T, δ² T⟩ = −‖δ T‖²`. -/
lemma ip4_der4_sq (T : T4 ι) : ip4 T (der4 J (der4 J T)) = -ip4 (der4 J T) (der4 J T) := by
  rw [ip4_der4 hJ, neg_neg, ip4_comm]

/-! Commutation and squares. -/

omit hJ in
lemma sq_comm12 (T : T4 ι) : sq₁ J (sq₂ J T) = sq₂ J (sq₁ J T) := by
  funext a b c d; simp only [sq₁_apply, sq₂_apply, Finset.mul_sum]; rw [Finset.sum_comm]
  exact Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun q _ => by ring
omit hJ in
lemma sq_comm13 (T : T4 ι) : sq₁ J (sq₃ J T) = sq₃ J (sq₁ J T) := by
  funext a b c d; simp only [sq₁_apply, sq₃_apply, Finset.mul_sum]; rw [Finset.sum_comm]
  exact Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun q _ => by ring
omit hJ in
lemma sq_comm14 (T : T4 ι) : sq₁ J (sq₄ J T) = sq₄ J (sq₁ J T) := by
  funext a b c d; simp only [sq₁_apply, sq₄_apply, Finset.mul_sum]; rw [Finset.sum_comm]
  exact Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun q _ => by ring
omit hJ in
lemma sq_comm23 (T : T4 ι) : sq₂ J (sq₃ J T) = sq₃ J (sq₂ J T) := by
  funext a b c d; simp only [sq₂_apply, sq₃_apply, Finset.mul_sum]; rw [Finset.sum_comm]
  exact Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun q _ => by ring
omit hJ in
lemma sq_comm24 (T : T4 ι) : sq₂ J (sq₄ J T) = sq₄ J (sq₂ J T) := by
  funext a b c d; simp only [sq₂_apply, sq₄_apply, Finset.mul_sum]; rw [Finset.sum_comm]
  exact Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun q _ => by ring
omit hJ in
lemma sq_comm34 (T : T4 ι) : sq₃ J (sq₄ J T) = sq₄ J (sq₃ J T) := by
  funext a b c d; simp only [sq₃_apply, sq₄_apply, Finset.mul_sum]; rw [Finset.sum_comm]
  exact Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun q _ => by ring

lemma sq_sq1 (T : T4 ι) : sq₁ J (sq₁ J T) = -T := by
  funext a b c d; simp only [sq₁_apply, Pi.neg_apply]; exact hJ.sum_sq (fun p => T p b c d) a
lemma sq_sq2 (T : T4 ι) : sq₂ J (sq₂ J T) = -T := by
  funext a b c d; simp only [sq₂_apply, Pi.neg_apply]; exact hJ.sum_sq (fun p => T a p c d) b
lemma sq_sq3 (T : T4 ι) : sq₃ J (sq₃ J T) = -T := by
  funext a b c d; simp only [sq₃_apply, Pi.neg_apply]; exact hJ.sum_sq (fun p => T a b p d) c
lemma sq_sq4 (T : T4 ι) : sq₄ J (sq₄ J T) = -T := by
  funext a b c d; simp only [sq₄_apply, Pi.neg_apply]; exact hJ.sum_sq (fun p => T a b c p) d

/-- `δ² T = −4T + 2 Σ_{i<j} JᵢJⱼ T`. -/
lemma der4_sq (T : T4 ι) : der4 J (der4 J T)
    = -(4 : ℝ) • T + (2 : ℝ) • (sq₁ J (sq₂ J T) + sq₁ J (sq₃ J T) + sq₁ J (sq₄ J T)
      + sq₂ J (sq₃ J T) + sq₂ J (sq₄ J T) + sq₃ J (sq₄ J T)) := by
  simp only [der4_apply, map_add, sq_sq1 hJ, sq_sq2 hJ, sq_sq3 hJ, sq_sq4 hJ, ← sq_comm12,
    ← sq_comm13, ← sq_comm14, ← sq_comm23, ← sq_comm24, ← sq_comm34]
  module

/-- `K₁₂ = J₁J₂` is symmetric and squares to one. -/
lemma ip4_K12 (T T' : T4 ι) : ip4 (sq₁ J (sq₂ J T)) T' = ip4 T (sq₁ J (sq₂ J T')) := by
  rw [ip4_sq₁ hJ, ip4_sq₂ hJ, neg_neg, sq_comm12]
lemma ip4_K34 (T T' : T4 ι) : ip4 (sq₃ J (sq₄ J T)) T' = ip4 T (sq₃ J (sq₄ J T')) := by
  rw [ip4_sq₃ hJ, ip4_sq₄ hJ, neg_neg, sq_comm34]
lemma K12_sq (T : T4 ι) : sq₁ J (sq₂ J (sq₁ J (sq₂ J T))) = T := by
  rw [← sq_comm12 (sq₂ J T), sq_sq1 hJ, sq_sq2 hJ, neg_neg]
lemma K34_sq (T : T4 ι) : sq₃ J (sq₄ J (sq₃ J (sq₄ J T))) = T := by
  rw [← sq_comm34 (sq₄ J T), sq_sq3 hJ, sq_sq4 hJ, neg_neg]
omit hJ in
lemma K12_K34 (T : T4 ι) : sq₁ J (sq₂ J (sq₃ J (sq₄ J T))) = sq₃ J (sq₄ J (sq₁ J (sq₂ J T))) := by
  rw [sq_comm23, sq_comm13, sq_comm24, sq_comm14]

/-! The derivation and the contraction. -/

omit hJ in
lemma sq₁_con (T T' : ι → ι → ι → ℝ) : sq₁ J (con T T') = con (sl₁ J T) T' := by
  funext a b c d; simp only [sq₁_apply, con, sl₁_apply, Finset.mul_sum, Finset.sum_mul]
  rw [Finset.sum_comm]
  exact Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun q _ => by ring
omit hJ in
lemma sq₂_con (T T' : ι → ι → ι → ℝ) : sq₂ J (con T T') = con (sl₂ J T) T' := by
  funext a b c d; simp only [sq₂_apply, con, sl₂_apply, Finset.mul_sum, Finset.sum_mul]
  rw [Finset.sum_comm]
  exact Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun q _ => by ring
omit hJ in
lemma sq₃_con (T T' : ι → ι → ι → ℝ) : sq₃ J (con T T') = con T (sl₁ J T') := by
  funext a b c d; simp only [sq₃_apply, con, sl₁_apply, Finset.mul_sum]
  rw [Finset.sum_comm]
  exact Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun q _ => by ring
omit hJ in
lemma sq₄_con (T T' : ι → ι → ι → ℝ) : sq₄ J (con T T') = con T (sl₂ J T') := by
  funext a b c d; simp only [sq₄_apply, con, sl₂_apply, Finset.mul_sum]
  rw [Finset.sum_comm]
  exact Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun q _ => by ring

/-- The contracted slot: `(J₃T) ⋆ T' + T ⋆ (J₃T') = 0`. -/
lemma con_sl₃ (T T' : ι → ι → ι → ℝ) : con (sl₃ J T) T' + con T (sl₃ J T') = 0 := by
  funext a b c d
  simp only [con, sl₃_apply, Pi.add_apply, Pi.zero_apply]
  have h := anti_slot0 hJ.anti (fun p => T a b p) (fun x => T' c d x)
  have e : ∑ x, T a b x * ∑ p, J x p * T' c d p = -∑ x, (∑ p, J x p * T a b p) * T' c d x := by
    rw [h, neg_neg]
  rw [e]; ring

/-- `(J₃U) ⋆ (J₃U') = U ⋆ U'` (`JᵀJ = 1`). -/
lemma con_sl₃_sl₃ (T T' : ι → ι → ι → ℝ) : con (sl₃ J T) (sl₃ J T') = con T T' := by
  funext a b c d
  simp only [con, sl₃_apply]
  have e1 : ∀ x, (∑ p, J x p * T a b p) * (∑ q, J x q * T' c d q)
      = ∑ p, T a b p * (J x p * ∑ q, J x q * T' c d q) := fun x => by
    rw [Finset.sum_mul]; exact Finset.sum_congr rfl fun p _ => by ring
  simp only [e1]
  rw [Finset.sum_comm]
  refine Finset.sum_congr rfl fun p _ => ?_
  rw [← Finset.mul_sum]
  congr 1
  exact hJ.sum_tsq (fun q => T' c d q) p

/-- **Leibniz**: `δ (T ⋆ T') = (δT) ⋆ T' + T ⋆ (δT')`. -/
lemma der4_con (T T' : ι → ι → ι → ℝ) :
    der4 J (con T T') = con (der3 J T) T' + con T (der3 J T') := by
  rw [der4_apply, sq₁_con, sq₂_con, sq₃_con, sq₄_con, der3_apply', der3_apply', con_add_left,
    con_add_left, con_add_right, con_add_right]
  have h := con_sl₃ hJ T T'
  calc con (sl₁ J T) T' + con (sl₂ J T) T' + con T (sl₁ J T') + con T (sl₂ J T')
      = con (sl₁ J T) T' + con (sl₂ J T) T' + con T (sl₁ J T') + con T (sl₂ J T')
        + (con (sl₃ J T) T' + con T (sl₃ J T')) := by rw [h, add_zero]
    _ = _ := by abel

omit hJ in
/-- `δ` commutes with the symmetrisation. -/
lemma der4_sym4 (T : T4 ι) : der4 J (sym4 T) = sym4 (der4 J T) := by
  funext a b c d
  have key : ∀ (u v w x : ι → ℝ), ∑ p, u p * ((v p + w p + x p) / 3)
      = (∑ p, u p * v p + ∑ p, u p * w p + ∑ p, u p * x p) / 3 := fun u v w x => by
    rw [← Finset.sum_add_distrib, ← Finset.sum_add_distrib, Finset.sum_div]
    exact Finset.sum_congr rfl fun p _ => by ring
  simp only [der4_apply, sym4, Pi.add_apply, sq₁_apply, sq₂_apply, sq₃_apply, sq₄_apply, key]
  ring

/-! `Ω = J₁J₂J₃J₄`. -/

/-- `Ω (T ⋆ T') = (J₁J₂J₃ T) ⋆ (J₁J₂J₃ T')`. -/
lemma om4_con (T T' : ι → ι → ι → ℝ) :
    om4 J (con T T') = con (sl₁ J (sl₂ J (sl₃ J T))) (sl₁ J (sl₂ J (sl₃ J T'))) := by
  rw [om4_apply, sq₄_con, sq₃_con, sq₂_con, sq₁_con, ← con_sl₃_sl₃ hJ]
  simp only [← sl_comm13, ← sl_comm23]

lemma ip4_om4 (T T' : T4 ι) : ip4 (om4 J T) T' = ip4 T (om4 J T') := by
  rw [om4_apply, om4_apply, ip4_sq₁ hJ, ip4_sq₂ hJ, ip4_sq₃ hJ, ip4_sq₄ hJ, neg_neg, neg_neg]
  congr 1
  rw [← sq_comm12, ← sq_comm13, ← sq_comm14, ← sq_comm23, ← sq_comm24, ← sq_comm34]

omit hJ in
/-- `Ω` commutes with the symmetrisation. -/
lemma om4_sym4 (T : T4 ι) : om4 J (sym4 T) = sym4 (om4 J T) := by
  have e23 : ∀ T : T4 ι, om4 J (fun a b c d => T a c b d) = fun a b c d => om4 J T a c b d := by
    intro T; funext a b c d
    simp only [om4_apply, sq₁_apply, sq₂_apply, sq₃_apply, sq₄_apply, Finset.mul_sum]
    refine Finset.sum_congr rfl fun p _ => ?_
    rw [Finset.sum_comm]
    exact Finset.sum_congr rfl fun q _ => Finset.sum_congr rfl fun r _ =>
      Finset.sum_congr rfl fun s _ => by ring
  have e234 : ∀ T : T4 ι, om4 J (fun a b c d => T a d b c) = fun a b c d => om4 J T a d b c := by
    intro T; funext a b c d
    simp only [om4_apply, sq₁_apply, sq₂_apply, sq₃_apply, sq₄_apply, Finset.mul_sum]
    refine Finset.sum_congr rfl fun p _ => ?_
    conv_rhs => rw [Finset.sum_comm]
    refine Finset.sum_congr rfl fun q _ => ?_
    conv_rhs => rw [Finset.sum_comm]
    exact Finset.sum_congr rfl fun r _ => Finset.sum_congr rfl fun s _ => by ring
  have hs : sym4 T = (1 / 3 : ℝ) • (T + (fun a b c d => T a c b d) + fun a b c d => T a d b c) := by
    funext a b c d; simp only [sym4, Pi.smul_apply, Pi.add_apply, smul_eq_mul]; ring
  have hs' : sym4 (om4 J T) = (1 / 3 : ℝ) • (om4 J T + (fun a b c d => om4 J T a c b d)
      + fun a b c d => om4 J T a d b c) := by
    funext a b c d; simp only [sym4, Pi.smul_apply, Pi.add_apply, smul_eq_mul]; ring
  rw [hs, hs', map_smul, map_add, map_add, e23 T, e234 T]

/-! Slot permutations. -/

omit hJ in
lemma sq₁_sq₂_apply (T : T4 ι) (a b c d : ι) :
    sq₁ J (sq₂ J T) a b c d = ∑ e, ∑ e', J a e * J b e' * T e e' c d := by
  simp only [sq₁_apply, sq₂_apply, Finset.mul_sum, mul_assoc]

omit hJ in
lemma sq₃_sq₄_apply (T : T4 ι) (a b c d : ι) :
    sq₃ J (sq₄ J T) a b c d = ∑ e, ∑ e', J c e * J d e' * T a b e e' := by
  simp only [sq₃_apply, sq₄_apply, Finset.mul_sum, mul_assoc]

end slots4

section perms

/-- Slot transpositions of 4-tensors. -/
def sw12 (T : T4 ι) : T4 ι := fun a b c d => T b a c d
def sw23 (T : T4 ι) : T4 ι := fun a b c d => T a c b d
def sw34 (T : T4 ι) : T4 ι := fun a b c d => T a b d c
def sw13 (T : T4 ι) : T4 ι := fun a b c d => T c b a d
def sw14 (T : T4 ι) : T4 ι := fun a b c d => T d b c a
def sw24 (T : T4 ι) : T4 ι := fun a b c d => T a d c b
/-- The pair swap `(13)(24)`. -/
def swP (T : T4 ι) : T4 ι := fun a b c d => T c d a b

lemma ip4_sw12 (T T' : T4 ι) : ip4 (sw12 T) (sw12 T') = ip4 T T' := Finset.sum_comm
lemma ip4_sw23 (T T' : T4 ι) : ip4 (sw23 T) (sw23 T') = ip4 T T' :=
  Finset.sum_congr rfl fun _ _ => Finset.sum_comm
lemma ip4_sw34 (T T' : T4 ι) : ip4 (sw34 T) (sw34 T') = ip4 T T' :=
  Finset.sum_congr rfl fun _ _ => Finset.sum_congr rfl fun _ _ => Finset.sum_comm
lemma ip4_sw13 (T T' : T4 ι) : ip4 (sw13 T) (sw13 T') = ip4 T T' := by
  show ip4 (sw23 (sw12 (sw23 T))) (sw23 (sw12 (sw23 T'))) = ip4 T T'
  rw [ip4_sw23, ip4_sw12, ip4_sw23]
lemma ip4_sw14 (T T' : T4 ι) : ip4 (sw14 T) (sw14 T') = ip4 T T' := by
  show ip4 (sw34 (sw13 (sw34 T))) (sw34 (sw13 (sw34 T'))) = ip4 T T'
  rw [ip4_sw34, ip4_sw13, ip4_sw34]
lemma ip4_sw24 (T T' : T4 ι) : ip4 (sw24 T) (sw24 T') = ip4 T T' := by
  show ip4 (sw34 (sw23 (sw34 T))) (sw34 (sw23 (sw34 T'))) = ip4 T T'
  rw [ip4_sw34, ip4_sw23, ip4_sw34]
lemma ip4_swP (T T' : T4 ι) : ip4 (swP T) (swP T') = ip4 T T' := by
  show ip4 (sw13 (sw24 T)) (sw13 (sw24 T')) = ip4 T T'
  rw [ip4_sw13, ip4_sw24]

variable {J : ι → ι → ℝ} {S : T4 ι}

/-- `⟨S, J₁J₃ S⟩ = ⟨S, J₁J₂ S⟩` for a symmetric `S`: `J₁J₃ = (23) J₁J₂ (23)`. -/
lemma ip4_K13_eq (hS : sw23 S = S) : ip4 S (sq₁ J (sq₃ J S)) = ip4 S (sq₁ J (sq₂ J S)) := by
  have e : sq₁ J (sq₃ J S) = sw23 (sq₁ J (sq₂ J (sw23 S))) := rfl
  rw [e, hS, ← ip4_sw23 S (sq₁ J (sq₂ J S)), hS]
lemma ip4_K14_eq (hS : sw24 S = S) : ip4 S (sq₁ J (sq₄ J S)) = ip4 S (sq₁ J (sq₂ J S)) := by
  have e : sq₁ J (sq₄ J S) = sw24 (sq₁ J (sq₂ J (sw24 S))) := rfl
  rw [e, hS, ← ip4_sw24 S (sq₁ J (sq₂ J S)), hS]
lemma ip4_K23_eq (hS : sw13 S = S) : ip4 S (sq₂ J (sq₃ J S)) = ip4 S (sq₁ J (sq₂ J S)) := by
  have e : sq₂ J (sq₃ J S) = sw13 (sq₁ J (sq₂ J (sw13 S))) := by
    rw [sq_comm23]; rfl
  rw [e, hS, ← ip4_sw13 S (sq₁ J (sq₂ J S)), hS]
lemma ip4_K24_eq (hS : sw14 S = S) : ip4 S (sq₂ J (sq₄ J S)) = ip4 S (sq₁ J (sq₂ J S)) := by
  have e : sq₂ J (sq₄ J S) = sw14 (sq₁ J (sq₂ J (sw14 S))) := by
    rw [sq_comm24]; rfl
  rw [e, hS, ← ip4_sw14 S (sq₁ J (sq₂ J S)), hS]
lemma ip4_K34_eq (hS : swP S = S) : ip4 S (sq₃ J (sq₄ J S)) = ip4 S (sq₁ J (sq₂ J S)) := by
  have e : sq₃ J (sq₄ J S) = swP (sq₁ J (sq₂ J (swP S))) := rfl
  rw [e, hS, ← ip4_swP S (sq₁ J (sq₂ J S)), hS]

end perms

/-! ### The symmetry of `kerS` -/

section kerSsymm

variable {f : ι → ι → ι → ℝ} (hf : ∀ a b c, f a b c = f b a c)
include hf

lemma kerS_sw12 (a b c d : ι) : kerS f b a c d = kerS f a b c d := by
  have e1 : kerC f b a c d = kerC f a b c d := Finset.sum_congr rfl fun e _ => by rw [hf b a]
  have e2 : kerC f b c a d = kerC f a d b c := Finset.sum_congr rfl fun e _ => by rw [mul_comm]
  have e3 : kerC f b d a c = kerC f a c b d := Finset.sum_congr rfl fun e _ => by rw [mul_comm]
  unfold kerS; rw [e1, e2, e3]; ring

lemma kerS_sw23 (a b c d : ι) : kerS f a c b d = kerS f a b c d := by
  have e1 : kerC f a d c b = kerC f a d b c := Finset.sum_congr rfl fun e _ => by rw [hf c b]
  unfold kerS; rw [e1]; ring

lemma kerS_sw34 (a b c d : ι) : kerS f a b d c = kerS f a b c d := by
  have e1 : kerC f a b d c = kerC f a b c d := Finset.sum_congr rfl fun e _ => by rw [hf d c]
  unfold kerS; rw [e1]; ring

lemma kerS_sw12' : sw12 (kerS f) = kerS f := funext fun a => funext fun b => funext fun c =>
  funext fun d => kerS_sw12 hf a b c d
lemma kerS_sw23' : sw23 (kerS f) = kerS f := funext fun a => funext fun b => funext fun c =>
  funext fun d => kerS_sw23 hf a b c d
lemma kerS_sw34' : sw34 (kerS f) = kerS f := funext fun a => funext fun b => funext fun c =>
  funext fun d => kerS_sw34 hf a b c d
lemma kerS_sw13' : sw13 (kerS f) = kerS f := by
  show sw23 (sw12 (sw23 (kerS f))) = kerS f
  rw [kerS_sw23' hf, kerS_sw12' hf, kerS_sw23' hf]
lemma kerS_sw14' : sw14 (kerS f) = kerS f := by
  show sw34 (sw13 (sw34 (kerS f))) = kerS f
  rw [kerS_sw34' hf, kerS_sw13' hf, kerS_sw34' hf]
lemma kerS_sw24' : sw24 (kerS f) = kerS f := by
  show sw34 (sw23 (sw34 (kerS f))) = kerS f
  rw [kerS_sw34' hf, kerS_sw23' hf, kerS_sw34' hf]
lemma kerS_swP' : swP (kerS f) = kerS f := by
  show sw13 (sw24 (kerS f)) = kerS f
  rw [kerS_sw24' hf, kerS_sw13' hf]

end kerSsymm

/-! ### The charge-two block: `tt ≤ h/6` -/

section block

variable {J : ι → ι → ℝ}

lemma kerSm_eq (f : ι → ι → ι → ℝ) :
    kerSm f J = (1 / 2 : ℝ) • (kerS f - sq₁ J (sq₂ J (kerS f))) := by
  funext a b c d
  simp only [kerSm, Pi.smul_apply, Pi.sub_apply, sq₁_sq₂_apply, smul_eq_mul]
  ring

lemma kerSmm_eq (f : ι → ι → ι → ℝ) :
    kerSmm f J = (1 / 2 : ℝ) • (kerSm f J - sq₃ J (sq₄ J (kerSm f J))) := by
  funext a b c d
  simp only [kerSmm, Pi.smul_apply, Pi.sub_apply, sq₃_sq₄_apply, smul_eq_mul]
  ring

lemma tenTT_eq_ip4 (f : ι → ι → ι → ℝ) : tenTT f J = ip4 (kerSmm f J) (kerSmm f J) / 2 := by
  simp only [tenTT, ip4, sq]

/-- `‖S₋₋‖²` in terms of `h`, `⟨S, K₁₂ S⟩`, `⟨S, K₃₄ S⟩` and `⟨S, Ω S⟩`, for `J` a complex
structure. -/
lemma ip4_kerSmm (hJ : IsCplx J) (f : ι → ι → ι → ℝ) :
    ip4 (kerSmm f J) (kerSmm f J)
      = (ip4 (kerS f) (kerS f) - ip4 (kerS f) (sq₁ J (sq₂ J (kerS f)))
        - ip4 (kerS f) (sq₃ J (sq₄ J (kerS f)))
        + ip4 (kerS f) (sq₃ J (sq₄ J (sq₁ J (sq₂ J (kerS f)))))) / 4 := by
  rw [kerSmm_eq, kerSm_eq]
  simp only [map_smul, map_sub, ip4_smul_left, ip4_smul_right, ip4_sub_left, ip4_sub_right,
    ip4_K12 hJ, ip4_K34 hJ, K12_sq hJ, K34_sq hJ, K12_K34]
  ring

/-- **The charge-two block of `S`** for a pair of symmetric kernels with `δf = −g`, `δg = f`:
`tt = h/6 − ‖M‖²/24`, `M = Sym(g ⋆ f + f ⋆ g)`. -/
theorem tenTT_eq_of_der (hJ : IsCplx J) {f g : ι → ι → ι → ℝ}
    (hf : ∀ a b c, f a b c = f b a c) (hdf : der3 J f = -g) (hdg : der3 J g = f) :
    tenTT f J = tenH f / 6
      - ip4 (sym4 (con g f + con f g)) (sym4 (con g f + con f g)) / 24 := by
  have h1 : der4 J (kerS f) = -sym4 (con g f + con f g) := by
    rw [kerS_eq_sym4, der4_sym4, der4_con hJ, hdf, con_neg_left, con_neg_right, ← neg_add,
      sym4_neg]
  have h2 : der4 J (sym4 (con g f + con f g)) = (2 : ℝ) • (kerS f - sym4 (con g g)) := by
    rw [der4_sym4, map_add, der4_con hJ, der4_con hJ, hdf, hdg, con_neg_left, con_neg_right,
      show con f f + -con g g + (-con g g + con f f) = (2 : ℝ) • (con f f - con g g) by module,
      sym4_smul, sym4_sub, kerS_eq_sym4]
  have h3 : der4 J (der4 J (kerS f)) = -(2 : ℝ) • kerS f + (2 : ℝ) • sym4 (con g g) := by
    rw [h1, map_neg, h2]; module
  have h4 : ip4 (kerS f) (der4 J (der4 J (kerS f)))
      = -ip4 (sym4 (con g f + con f g)) (sym4 (con g f + con f g)) := by
    rw [ip4_der4_sq hJ, h1, ip4_neg_left, ip4_neg_right, neg_neg]
  have h5 : ip4 (kerS f) (sym4 (con g g))
      = ip4 (kerS f) (kerS f) - ip4 (sym4 (con g f + con f g)) (sym4 (con g f + con f g)) / 2 := by
    have := h4
    rw [h3, ip4_add_right, ip4_smul_right, ip4_smul_right] at this
    linarith
  have h6 : ip4 (kerS f) (der4 J (der4 J (kerS f)))
      = -4 * ip4 (kerS f) (kerS f) + 12 * ip4 (kerS f) (sq₁ J (sq₂ J (kerS f))) := by
    rw [der4_sq hJ, ip4_add_right, ip4_smul_right, ip4_smul_right, ip4_add_right, ip4_add_right,
      ip4_add_right, ip4_add_right, ip4_add_right, ip4_K13_eq (kerS_sw23' hf),
      ip4_K14_eq (kerS_sw24' hf), ip4_K23_eq (kerS_sw13' hf), ip4_K24_eq (kerS_sw14' hf),
      ip4_K34_eq (kerS_swP' hf)]
    ring
  have hff : der3 J (der3 J f) = -f := by rw [hdf, map_neg, hdg]
  have h7 : om4 J (kerS f) = sym4 (con g g) := by
    rw [kerS_eq_sym4, om4_sym4, om4_con hJ, sl_triple_of_charge_one hJ hff, hdf, con_neg_left,
      con_neg_right, neg_neg]
  have h8 : ip4 (kerS f) (sq₃ J (sq₄ J (sq₁ J (sq₂ J (kerS f))))) = ip4 (kerS f) (sym4 (con g g)) := by
    rw [← K12_K34, ← om4_apply, h7]
  rw [tenTT_eq_ip4, ip4_kerSmm hJ, tenH_eq_ip4, ip4_K34_eq (kerS_swP' hf), h8, h5]
  linarith

/-- `tt ≤ h/6` for a pair of symmetric kernels with `δf = −g`, `δg = f`. -/
theorem tenTT_le_sixth_of_der (hJ : IsCplx J) {f g : ι → ι → ι → ℝ}
    (hf : ∀ a b c, f a b c = f b a c) (hdf : der3 J f = -g) (hdg : der3 J g = f) :
    tenTT f J ≤ tenH f / 6 := by
  rw [tenTT_eq_of_der hJ hf hdf hdg]
  linarith [ip4_self_nonneg (sym4 (con g f + con f g))]

/-- **The field `block`**: `tt ≤ h/6` for the kernel of the real part of a circular cubic. -/
theorem tenTT_le_sixth [DecidableEq ι] {a b : MvPolynomial ι ℝ} (hc : Circular J a b) :
    tenTT (cubicKernel a) J ≤ tenH (cubicKernel a) / 6 :=
  tenTT_le_sixth_of_der hc.isCplx (cubicKernel_symm12 a) hc.der3_left hc.der3_right

end block



/-! ### Sum bookkeeping -/

section sums

lemma sum4_swap23 (F : ι → ι → ι → ι → ℝ) :
    ∑ a, ∑ b, ∑ c, ∑ d, F a c b d = ∑ a, ∑ b, ∑ c, ∑ d, F a b c d :=
  Finset.sum_congr rfl fun _ _ => Finset.sum_comm

lemma sum4_swap34 (F : ι → ι → ι → ι → ℝ) :
    ∑ a, ∑ b, ∑ c, ∑ d, F a b d c = ∑ a, ∑ b, ∑ c, ∑ d, F a b c d :=
  Finset.sum_congr rfl fun _ _ => Finset.sum_congr rfl fun _ _ => Finset.sum_comm

/-- `(b c d) ↦ (c d b)`. -/
lemma sum4_cyc (F : ι → ι → ι → ι → ℝ) :
    ∑ a, ∑ b, ∑ c, ∑ d, F a c d b = ∑ a, ∑ b, ∑ c, ∑ d, F a b c d :=
  (sum4_swap23 fun a b c d => F a b d c).trans (sum4_swap34 F)

/-- `(b c d) ↦ (d b c)`. -/
lemma sum4_cyc' (F : ι → ι → ι → ι → ℝ) :
    ∑ a, ∑ b, ∑ c, ∑ d, F a d b c = ∑ a, ∑ b, ∑ c, ∑ d, F a b c d :=
  (sum4_swap34 fun a b c d => F a c b d).trans (sum4_swap23 F)

/-- `Σᵢ Σₗ Σₚ Σ_q F p i q l = Σₐ Σ_b Σ_c Σ_d F a b c d`. -/
lemma sum4_reorder (F : ι → ι → ι → ι → ℝ) :
    ∑ i, ∑ l, ∑ p, ∑ q, F p i q l = ∑ a, ∑ b, ∑ c, ∑ d, F a b c d :=
  ((swap4 fun p q i l => F p i q l).symm).trans (sum4_swap23 F)

lemma sum4_mul_sum4 (A B : ι → ι → ℝ) :
    ∑ i, ∑ l, ∑ p, ∑ q, A p i * B q l = (∑ i, ∑ p, A p i) * ∑ l, ∑ q, B q l := by
  rw [Finset.sum_mul_sum]
  exact Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun l _ => (Finset.sum_mul_sum _ _ _ _).symm

variable {f : ι → ι → ι → ℝ}

lemma kerC_sym34 (hf : ∀ a b c, f a b c = f b a c) (a b c d : ι) :
    kerC f a b d c = kerC f a b c d :=
  Finset.sum_congr rfl fun e _ => by rw [hf d c]

lemma sum_kerC_diag : ∑ p, ∑ i, kerC f p i p i = ∑ i, ∑ j, ∑ k, f i j k ^ 2 :=
  Finset.sum_congr rfl fun _ _ => Finset.sum_congr rfl fun _ _ =>
    Finset.sum_congr rfl fun _ _ => (sq _).symm

lemma sum_kerC_trace (hf23 : ∀ a b c, f a c b = f a b c) (i l : ι) :
    ∑ p, kerC f p i p l = kerG f i l := by
  unfold kerC kerG
  refine Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun e _ => ?_
  rw [hf23 p e i, hf23 p e l]

lemma sum_kerC_trace' (hcyc : ∀ a b c, f a b c = f b c a) (p q : ι) :
    ∑ i, kerC f p i q i = kerG f p q := by
  unfold kerC kerG
  refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun e _ => ?_
  rw [hcyc p i e, hcyc q i e]

/-- The tetrahedral contraction `⟨C, C^{(23)}⟩`. -/
def cQ (f : ι → ι → ι → ℝ) : ℝ := ∑ a, ∑ b, ∑ c, ∑ d, kerC f a b c d * kerC f a c b d

lemma sum_C13 (hf : ∀ a b c, f a b c = f b a c) :
    ∑ a, ∑ b, ∑ c, ∑ d, kerC f a b c d * kerC f a d b c = cQ f :=
  (Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => Finset.sum_congr rfl fun c _ =>
    Finset.sum_congr rfl fun d _ => by rw [← kerC_sym34 hf a b c d]).trans
    (sum4_swap34 fun a b c d => kerC f a b c d * kerC f a c b d)

lemma sum_C23 (hf : ∀ a b c, f a b c = f b a c) :
    ∑ a, ∑ b, ∑ c, ∑ d, kerC f a c b d * kerC f a d b c = cQ f :=
  (Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => Finset.sum_congr rfl fun c _ =>
    Finset.sum_congr rfl fun d _ => by rw [← kerC_sym34 hf a d c b]).trans
    ((sum4_cyc fun a b c d => kerC f a b d c * kerC f a c b d).trans
    (Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => Finset.sum_congr rfl fun c _ =>
      Finset.sum_congr rfl fun d _ => by rw [kerC_sym34 hf a b c d]))

lemma sum_C2sq : ∑ a, ∑ b, ∑ c, ∑ d, kerC f a c b d ^ 2 = tenS f :=
  (sum4_swap23 fun a b c d => kerC f a b c d ^ 2).trans (tenS_eq_sum_kerC_sq f).symm

lemma sum_C3sq : ∑ a, ∑ b, ∑ c, ∑ d, kerC f a d b c ^ 2 = tenS f :=
  (sum4_cyc' fun a b c d => kerC f a b c d ^ 2).trans (tenS_eq_sum_kerC_sq f).symm

/-- `3h = s + 2⟨C, C^{(23)}⟩`. -/
lemma three_tenH (hf : ∀ a b c, f a b c = f b a c) : 3 * tenH f = tenS f + 2 * cQ f := by
  have e : ∀ a b c d, kerS f a b c d ^ 2
      = (kerC f a b c d ^ 2 + kerC f a c b d ^ 2 + kerC f a d b c ^ 2
        + 2 * (kerC f a b c d * kerC f a c b d) + 2 * (kerC f a b c d * kerC f a d b c)
        + 2 * (kerC f a c b d * kerC f a d b c)) / 9 := fun a b c d => by
    unfold kerS; ring
  unfold tenH
  simp only [e, ← Finset.sum_div, Finset.sum_add_distrib, ← Finset.mul_sum]
  rw [← tenS_eq_sum_kerC_sq, sum_C2sq, sum_C3sq, sum_C13 hf, sum_C23 hf]
  unfold cQ
  ring

lemma sum_split (X1 X2 Y1 X4 X5 X6 Y2 : ι → ι → ℝ) :
    ∑ i, ∑ l, (1 / 2 * X1 i l + X2 i l - 1 / 4 * Y1 i l + X4 i l + X5 i l + X6 i l - 1 / 2 * Y2 i l)
      = 1 / 2 * (∑ i, ∑ l, X1 i l) + ∑ i, ∑ l, X2 i l - 1 / 4 * (∑ i, ∑ l, Y1 i l)
        + ∑ i, ∑ l, X4 i l + ∑ i, ∑ l, X5 i l + ∑ i, ∑ l, X6 i l - 1 / 2 * (∑ i, ∑ l, Y2 i l) := by
  simp only [Finset.sum_add_distrib, Finset.sum_sub_distrib, ← Finset.mul_sum]

/-- The sum appearing in `E Γ²`. -/
lemma sumK_identity (hf : ∀ a b c, f a b c = f b a c) (hf13 : ∀ a b c, f a b c = f c b a) :
    ∑ i, ∑ l, (1 / 2 * ((∑ p, ∑ q, (36 * kerC f p i p i * (36 * kerC f q l q l)
        + 36 * kerC f p i q l * (36 * kerC f p i q l) + 36 * kerC f p i q l * (36 * kerC f p i q l))
        - 1 / 2 * (∑ p, 36 * kerC f p i p i) * (∑ q, 36 * kerC f q l q l))
      + (∑ p, ∑ q, (36 * kerC f p i p l * (36 * kerC f q i q l)
        + 36 * kerC f p i q i * (36 * kerC f p l q l) + 36 * kerC f p i q l * (36 * kerC f p l q i))
        - 1 / 2 * (∑ p, 36 * kerC f p i p l) * (∑ q, 36 * kerC f q i q l))
      + (∑ p, ∑ q, (36 * kerC f p i p l * (36 * kerC f q i q l)
        + 36 * kerC f p i q i * (36 * kerC f p l q l) + 36 * kerC f p i q l * (36 * kerC f p l q i))
        - 1 / 2 * (∑ p, 36 * kerC f p i p l) * (∑ q, 36 * kerC f q i q l))))
    = 324 * (∑ i, ∑ j, ∑ k, f i j k ^ 2) ^ 2 + 3240 * tenS f + 1296 * cQ f := by
  have hf23 : ∀ a b c, f a c b = f a b c := fun a b c => by
    rw [hf13 a c b, hf b c a, ← hf13 a b c]
  have hcyc : ∀ a b c, f a b c = f b c a := fun a b c => by rw [hf a b c, hf23 b a c]
  -- the seven sums
  have T1 : ∑ i, ∑ l, ∑ p, ∑ q, 36 * kerC f p i p i * (36 * kerC f q l q l)
      = (36 * ∑ i, ∑ j, ∑ k, f i j k ^ 2) ^ 2 := by
    rw [sum4_mul_sum4 (fun p i => 36 * kerC f p i p i) (fun q l => 36 * kerC f q l q l)]
    simp only [← Finset.mul_sum]
    rw [Finset.sum_comm, sum_kerC_diag]; ring
  have T2 : ∑ i, ∑ l, ∑ p, ∑ q, 36 * kerC f p i q l * (36 * kerC f p i q l) = 1296 * tenS f := by
    rw [sum4_reorder (fun a b c d => 36 * kerC f a b c d * (36 * kerC f a b c d)),
      tenS_eq_sum_kerC_sq]
    simp only [Finset.mul_sum]
    exact Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ =>
      Finset.sum_congr rfl fun c _ => Finset.sum_congr rfl fun d _ => by ring
  have T3 : ∑ i, ∑ l, (∑ p, 36 * kerC f p i p i) * (∑ q, 36 * kerC f q l q l)
      = (36 * ∑ i, ∑ j, ∑ k, f i j k ^ 2) ^ 2 := by
    simp only [Finset.sum_mul_sum]; exact T1
  have T4 : ∑ i, ∑ l, ∑ p, ∑ q, 36 * kerC f p i p l * (36 * kerC f q i q l) = 1296 * tenS f := by
    have e : ∀ i l, ∑ p, ∑ q, 36 * kerC f p i p l * (36 * kerC f q i q l)
        = (36 * kerG f i l) * (36 * kerG f i l) := fun i l => by
      rw [← Finset.sum_mul_sum, ← Finset.mul_sum, sum_kerC_trace hf23]
    simp only [e]
    unfold tenS
    simp only [Finset.mul_sum]
    exact Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun l _ => by ring
  have T5 : ∑ i, ∑ l, ∑ p, ∑ q, 36 * kerC f p i q i * (36 * kerC f p l q l) = 1296 * tenS f := by
    rw [← swap4 (fun p q i l => 36 * kerC f p i q i * (36 * kerC f p l q l))]
    have e : ∀ p q, ∑ i, ∑ l, 36 * kerC f p i q i * (36 * kerC f p l q l)
        = (36 * kerG f p q) * (36 * kerG f p q) := fun p q => by
      rw [← Finset.sum_mul_sum, ← Finset.mul_sum, sum_kerC_trace' hcyc]
    simp only [e]
    unfold tenS
    simp only [Finset.mul_sum]
    exact Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun l _ => by ring
  have T6 : ∑ i, ∑ l, ∑ p, ∑ q, 36 * kerC f p i q l * (36 * kerC f p l q i) = 1296 * cQ f := by
    rw [sum4_reorder (fun a b c d => 36 * kerC f a b c d * (36 * kerC f a d c b)), ← sum_C13 hf]
    simp only [Finset.mul_sum]
    exact Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ =>
      Finset.sum_congr rfl fun c _ => Finset.sum_congr rfl fun d _ => by
        rw [kerC_sym34 hf a d b c]; ring
  have T7 : ∑ i, ∑ l, (∑ p, 36 * kerC f p i p l) * (∑ q, 36 * kerC f q i q l) = 1296 * tenS f := by
    have e : ∀ i l, (∑ p, 36 * kerC f p i p l) * (∑ q, 36 * kerC f q i q l)
        = (36 * kerG f i l) * (36 * kerG f i l) := fun i l => by
      rw [← Finset.mul_sum, sum_kerC_trace hf23]
    simp only [e]
    unfold tenS
    simp only [Finset.mul_sum]
    exact Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun l _ => by ring
  -- split the sum
  have split : ∀ i l, (1 / 2 * ((∑ p, ∑ q, (36 * kerC f p i p i * (36 * kerC f q l q l)
        + 36 * kerC f p i q l * (36 * kerC f p i q l) + 36 * kerC f p i q l * (36 * kerC f p i q l))
        - 1 / 2 * (∑ p, 36 * kerC f p i p i) * (∑ q, 36 * kerC f q l q l))
      + (∑ p, ∑ q, (36 * kerC f p i p l * (36 * kerC f q i q l)
        + 36 * kerC f p i q i * (36 * kerC f p l q l) + 36 * kerC f p i q l * (36 * kerC f p l q i))
        - 1 / 2 * (∑ p, 36 * kerC f p i p l) * (∑ q, 36 * kerC f q i q l))
      + (∑ p, ∑ q, (36 * kerC f p i p l * (36 * kerC f q i q l)
        + 36 * kerC f p i q i * (36 * kerC f p l q l) + 36 * kerC f p i q l * (36 * kerC f p l q i))
        - 1 / 2 * (∑ p, 36 * kerC f p i p l) * (∑ q, 36 * kerC f q i q l))))
      = 1 / 2 * (∑ p, ∑ q, 36 * kerC f p i p i * (36 * kerC f q l q l))
        + ∑ p, ∑ q, 36 * kerC f p i q l * (36 * kerC f p i q l)
        - 1 / 4 * ((∑ p, 36 * kerC f p i p i) * (∑ q, 36 * kerC f q l q l))
        + ∑ p, ∑ q, 36 * kerC f p i p l * (36 * kerC f q i q l)
        + ∑ p, ∑ q, 36 * kerC f p i q i * (36 * kerC f p l q l)
        + ∑ p, ∑ q, 36 * kerC f p i q l * (36 * kerC f p l q i)
        - 1 / 2 * ((∑ p, 36 * kerC f p i p l) * (∑ q, 36 * kerC f q i q l)) := fun i l => by
    simp only [Finset.sum_add_distrib]
    ring
  have key := sum_split (fun i l => ∑ p, ∑ q, 36 * kerC f p i p i * (36 * kerC f q l q l))
    (fun i l => ∑ p, ∑ q, 36 * kerC f p i q l * (36 * kerC f p i q l))
    (fun i l => (∑ p, 36 * kerC f p i p i) * (∑ q, 36 * kerC f q l q l))
    (fun i l => ∑ p, ∑ q, 36 * kerC f p i p l * (36 * kerC f q i q l))
    (fun i l => ∑ p, ∑ q, 36 * kerC f p i q i * (36 * kerC f p l q l))
    (fun i l => ∑ p, ∑ q, 36 * kerC f p i q l * (36 * kerC f p l q i))
    (fun i l => (∑ p, 36 * kerC f p i p l) * (∑ q, 36 * kerC f q i q l))
  rw [Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun l _ => split i l, key, T1, T2, T3,
    T4, T5, T6, T7]
  ring

end sums

/-! ### Wick's formula for the fourth moment -/

section wick4

variable {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ} (hE : IsGaussianExpectation E)
include hE

lemma gE_pair_chaos1 {Y Y' : MvPolynomial ι ℝ} {u u' : ι → ℝ} (hY' : ouL Y' = -Y')
    (hu : ∀ k, pderiv k Y = C (u k)) (hu' : ∀ k, pderiv k Y' = C (u' k)) :
    E (Y * Y') = ∑ k, u k * u' k := by
  rw [gE_mul_chaos1 hE hY', gam]
  simp only [hu, hu', ← map_mul, ← map_sum, gE_C hE]

omit hE in
lemma gam_chaos1 {Y Y' : MvPolynomial ι ℝ} {u u' : ι → ℝ}
    (hu : ∀ k, pderiv k Y = C (u k)) (hu' : ∀ k, pderiv k Y' = C (u' k)) :
    gam Y Y' = C (∑ k, u k * u' k) := by
  simp only [gam, hu, hu', ← map_mul, ← map_sum]

/-- **Wick's formula** for four first-chaos polynomials with constant derivatives. -/
lemma gE_four_chaos1 {Y₁ Y₂ Y₃ Y₄ : MvPolynomial ι ℝ} {u₁ u₂ u₃ u₄ : ι → ℝ}
    (h₂ : ouL Y₂ = -Y₂) (h₃ : ouL Y₃ = -Y₃) (h₄ : ouL Y₄ = -Y₄)
    (hu₁ : ∀ k, pderiv k Y₁ = C (u₁ k)) (hu₂ : ∀ k, pderiv k Y₂ = C (u₂ k))
    (hu₃ : ∀ k, pderiv k Y₃ = C (u₃ k)) (hu₄ : ∀ k, pderiv k Y₄ = C (u₄ k)) :
    E (Y₁ * Y₂ * Y₃ * Y₄) = (∑ k, u₁ k * u₂ k) * (∑ k, u₃ k * u₄ k)
      + (∑ k, u₁ k * u₃ k) * (∑ k, u₂ k * u₄ k) + (∑ k, u₁ k * u₄ k) * (∑ k, u₂ k * u₃ k) := by
  rw [gE_mul_chaos1 hE h₄, gam_mul_left, gam_mul_left, gam_chaos1 hu₃ hu₄, gam_chaos1 hu₂ hu₄,
    gam_chaos1 hu₁ hu₄,
    show Y₁ * Y₂ * C (∑ k, u₃ k * u₄ k) + Y₃ * (Y₁ * C (∑ k, u₂ k * u₄ k) + Y₂ * C (∑ k, u₁ k * u₄ k))
      = C (∑ k, u₃ k * u₄ k) * (Y₁ * Y₂) + C (∑ k, u₂ k * u₄ k) * (Y₁ * Y₃)
        + C (∑ k, u₁ k * u₄ k) * (Y₂ * Y₃) by ring,
    map_add, map_add, C_mul_apply, C_mul_apply, C_mul_apply, gE_pair_chaos1 hE h₂ hu₁ hu₂,
    gE_pair_chaos1 hE h₃ hu₁ hu₃, gE_pair_chaos1 hE h₃ hu₂ hu₃]
  ring

variable [DecidableEq ι]

/-- **The fourth cumulant of a cubic chaos**: `κ₄ = 1296 (s + 3h/2)` (the field `wick4`). -/
theorem Chaos3.wick4 {F : MvPolynomial ι ℝ} (hF : Chaos3 F) :
    E (F ^ 4) - 3 * E (F ^ 2) ^ 2 = 1296 * (tenS (cubicKernel F) + 3 * tenH (cubicKernel F) / 2) := by
  have hf12 : ∀ a b c, cubicKernel F a b c = cubicKernel F b a c := cubicKernel_symm12 F
  have hf13 : ∀ a b c, cubicKernel F a b c = cubicKernel F c b a := fun a b c => by
    unfold cubicKernel; rw [kern_rev]
  have hf23 : ∀ a b c, cubicKernel F a c b = cubicKernel F a b c := fun a b c => by
    rw [hf13 a c b, hf12 b c a, ← hf13 a b c]
  have hcyc : ∀ a b c, cubicKernel F a b c = cubicKernel F b c a := fun a b c => by
    rw [hf12 a b c, hf23 b a c]
  -- first-chaos data
  have hY : ∀ p i, ouL (pderiv p (pderiv i F)) = -pderiv p (pderiv i F) := hF.ouL_pderiv2
  have hu : ∀ p i k, pderiv k (pderiv p (pderiv i F)) = C (6 * cubicKernel F k p i) :=
    fun p i k => by rw [hF.pderiv3_eq]; congr 1; unfold cubicKernel; ring
  have hK : ∀ p i q l, (∑ k, 6 * cubicKernel F k p i * (6 * cubicKernel F k q l))
      = 36 * kerC (cubicKernel F) p i q l := fun p i q l => by
    unfold kerC
    rw [Finset.mul_sum]
    refine Finset.sum_congr rfl fun k _ => ?_
    rw [hcyc k p i, hcyc k q l]; ring
  have hpair : ∀ p i q l, E (pderiv p (pderiv i F) * pderiv q (pderiv l F))
      = 36 * kerC (cubicKernel F) p i q l := fun p i q l => by
    rw [gE_pair_chaos1 hE (hY q l) (hu p i) (hu q l), hK]
  have hfour : ∀ p i q l p' i' q' l', E (pderiv p (pderiv i F) * pderiv q (pderiv l F)
      * pderiv p' (pderiv i' F) * pderiv q' (pderiv l' F))
      = 36 * kerC (cubicKernel F) p i q l * (36 * kerC (cubicKernel F) p' i' q' l')
        + 36 * kerC (cubicKernel F) p i p' i' * (36 * kerC (cubicKernel F) q l q' l')
        + 36 * kerC (cubicKernel F) p i q' l' * (36 * kerC (cubicKernel F) q l p' i') :=
    fun p i q l p' i' q' l' => by
    rw [gE_four_chaos1 hE (hY _ _) (hY _ _) (hY _ _) (hu p i) (hu q l) (hu p' i') (hu q' l'), hK,
      hK, hK, hK, hK, hK]
  have hfour' : ∀ p i q l p' i' q' l', E (pderiv p (pderiv i F) * pderiv q (pderiv l F)
      * (pderiv p' (pderiv i' F) * pderiv q' (pderiv l' F)))
      = 36 * kerC (cubicKernel F) p i q l * (36 * kerC (cubicKernel F) p' i' q' l')
        + 36 * kerC (cubicKernel F) p i p' i' * (36 * kerC (cubicKernel F) q l q' l')
        + 36 * kerC (cubicKernel F) p i q' l' * (36 * kerC (cubicKernel F) q l p' i') :=
    fun p i q l p' i' q' l' => by rw [← mul_assoc, hfour]
  -- the carré du champ of two first derivatives
  have hΓΓ : ∀ i l i' l', E (gam (pderiv i F) (pderiv l F) * gam (pderiv i' F) (pderiv l' F))
      = ∑ p, ∑ q, (36 * kerC (cubicKernel F) p i p l * (36 * kerC (cubicKernel F) q i' q l')
        + 36 * kerC (cubicKernel F) p i q i' * (36 * kerC (cubicKernel F) p l q l')
        + 36 * kerC (cubicKernel F) p i q l' * (36 * kerC (cubicKernel F) p l q i')) :=
    fun i l i' l' => by
    rw [gam, gam, Finset.sum_mul_sum, map_sum]
    refine Finset.sum_congr rfl fun p _ => ?_
    rw [map_sum]
    refine Finset.sum_congr rfl fun q _ => ?_
    rw [← mul_assoc, hfour]
  have hΓ : ∀ i l, E (gam (pderiv i F) (pderiv l F)) = ∑ p, 36 * kerC (cubicKernel F) p i p l :=
    fun i l => by
    rw [gam, map_sum]; exact Finset.sum_congr rfl fun p _ => hpair p i p l
  -- `E Γ²`
  have hGG : E (gam F F * gam F F)
      = 324 * (∑ i, ∑ j, ∑ k, cubicKernel F i j k ^ 2) ^ 2 + 3240 * tenS (cubicKernel F)
        + 1296 * cQ (cubicKernel F) := by
    rw [← sumK_identity hf12 hf13, gam, Finset.sum_mul_sum, map_sum]
    refine Finset.sum_congr rfl fun i _ => ?_
    rw [map_sum]
    refine Finset.sum_congr rfl fun l _ => ?_
    rw [← mul_assoc, quad_four hE (hF.quad i) (hF.quad i) (hF.quad l) (hF.quad l)]
    simp only [hΓΓ, hΓ]
  -- `E Γ₂²`
  have hC2 : ∑ a, ∑ b, ∑ c, ∑ d, 36 * kerC (cubicKernel F) a b c d * (36 * kerC (cubicKernel F) a b c d)
      = 1296 * tenS (cubicKernel F) := by
    rw [tenS_eq_sum_kerC_sq]
    simp only [Finset.mul_sum]
    exact Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ =>
      Finset.sum_congr rfl fun c _ => Finset.sum_congr rfl fun d _ => by ring
  have hdiag : ∑ i, ∑ p, 36 * kerC (cubicKernel F) p i p i
      = 36 * ∑ i, ∑ j, ∑ k, cubicKernel F i j k ^ 2 := by
    simp only [← Finset.mul_sum]
    rw [Finset.sum_comm, sum_kerC_diag]
  have hG2 : E (gam2 F * gam2 F)
      = (36 * ∑ i, ∑ j, ∑ k, cubicKernel F i j k ^ 2) ^ 2 + 2592 * tenS (cubicKernel F) := by
    have e : gam2 F = ∑ j, ∑ p, pderiv p (pderiv j F) * pderiv p (pderiv j F) := rfl
    rw [e]
    simp only [Finset.sum_mul_sum, map_sum, hfour']
    simp only [Finset.sum_add_distrib]
    rw [sum4_mul_sum4 (fun p j => 36 * kerC (cubicKernel F) p j p j)
        (fun p' j' => 36 * kerC (cubicKernel F) p' j' p' j'),
      sum4_reorder (fun a b c d => 36 * kerC (cubicKernel F) a b c d
        * (36 * kerC (cubicKernel F) a b c d)), hC2, hdiag]
    ring
  -- the chaos components of `F²` and `Γ`
  have hS : E (F * F) = 6 * ∑ i, ∑ j, ∑ k, cubicKernel F i j k ^ 2 := hF.gE_sq_eq_kernel hE
  have hJ4 : ouL (J4 E F) = -(4 * J4 E F) := hF.ouL_J4 hE
  have hc2 : ouL (comp2 E F F) = -(2 * comp2 E F F) := comp2_eig hE hF hF
  have hc6 : ouL (comp6 E F F) = -(6 * comp6 E F F) := comp6_eig hE hF hF
  have o64 : E (comp6 E F F * J4 E F) = 0 := gE_eigen_orth hE 6 4 (by norm_num) hc6 hJ4
  have o62 : E (comp6 E F F * comp2 E F F) = 0 := gE_eigen_orth hE 6 2 (by norm_num) hc6 hc2
  have o42 : E (J4 E F * comp2 E F F) = 0 := gE_eigen_orth hE 4 2 (by norm_num) hJ4 hc2
  have m6 : E (comp6 E F F) = 0 := gE_eigen_mean hE 6 (by norm_num) hc6
  have m4 : E (J4 E F) = 0 := gE_eigen_mean hE 4 (by norm_num) hJ4
  have m2 : E (comp2 E F F) = 0 := gE_eigen_mean hE 2 (by norm_num) hc2
  have hF2 : F * F = comp6 E F F + J4 E F + comp2 E F F + C (E (F * F)) := by
    have := mul_eq_comps E F F
    rwa [comp4_self] at this
  have hΓd : gam F F = J4 E F + 2 * comp2 E F F + C (3 * E (F * F)) := by
    unfold J4 comp2
    rw [gam2c_self]
    have h := two_mul_C_half (ι := ι)
    linear_combination (-(gam2 F)) * h
  have hEΓ : E (gam F F) = 3 * E (F * F) := hF.gE_gam hE
  have hF4 : E (F ^ 4) = E (F * F * gam F F) := by
    have h := gE_mul_ouL hE (F * F * F) F
    rw [hF.eig, gam_mul_left, gam_mul_left, show F * F * F * -(3 * F) = -(3 * F ^ 4) by ring,
      map_neg, ofNat_mul_apply,
      show F * F * gam F F + F * (F * gam F F + F * gam F F) = 3 * (F * F * gam F F) by ring,
      ofNat_mul_apply] at h
    linarith
  -- `E comp2²`
  have hc2sq : E (comp2 E F F * comp2 E F F) = 648 * tenS (cubicKernel F) := by
    have e : comp2 E F F * comp2 E F F
        = C (1 / 4) * (gam2 F * gam2 F) - C (3 * E (F * F)) * gam2 F
          + C (3 * E (F * F)) * C (3 * E (F * F)) := by
      unfold comp2
      rw [gam2c_self, show (C (3 * E (F * F)) : MvPolynomial ι ℝ) * gam2 F
          = 2 * C (1 / 2) * (C (3 * E (F * F)) * gam2 F) by rw [two_mul_C_half, one_mul],
        show (C (1 / 4) : MvPolynomial ι ℝ) = C (1 / 2) * C (1 / 2) by rw [← C_mul]; norm_num]
      ring
    rw [e, map_add, map_sub, C_mul_apply, C_mul_apply, C_mul_apply, gE_C hE, hG2, hF.gE_gam2 hE, hS]
    ring
  -- `E (F² Γ)` and `E J₄²`
  have hF2Γ : E (F * F * gam F F) = E (J4 E F * J4 E F) + 2 * E (comp2 E F F * comp2 E F F)
      + 3 * E (F * F) ^ 2 := by
    have key : ∀ S : ℝ, (comp6 E F F + J4 E F + comp2 E F F + C S)
        * (J4 E F + 2 * comp2 E F F + C (3 * S))
        = J4 E F * J4 E F + (comp2 E F F * comp2 E F F + comp2 E F F * comp2 E F F)
          + C S * C (3 * S)
          + (comp6 E F F * J4 E F + (comp6 E F F * comp2 E F F + comp6 E F F * comp2 E F F)
            + C (3 * S) * comp6 E F F + (J4 E F * comp2 E F F + J4 E F * comp2 E F F)
            + C (3 * S) * J4 E F + J4 E F * comp2 E F F + C (3 * S) * comp2 E F F + C S * J4 E F
            + (C S * comp2 E F F + C S * comp2 E F F)) := fun S => by ring
    conv_lhs => rw [hF2, hΓd, key]
    simp only [map_add, C_mul_apply, o64, o62, o42, m6, m4, m2, gE_C hE]
    ring
  have hJ4sq : E (J4 E F * J4 E F) = E (gam F F * gam F F) - 4 * E (comp2 E F F * comp2 E F F)
      - 9 * E (F * F) ^ 2 := by
    have e1 : J4 E F = gam F F - 2 * comp2 E F F - C (3 * E (F * F)) := by rw [hΓd]; ring
    have h1 : E (J4 E F * J4 E F) = E (J4 E F * gam F F) := by
      conv_lhs => rw [show J4 E F * J4 E F
        = J4 E F * (gam F F - 2 * comp2 E F F - C (3 * E (F * F))) by rw [← e1]]
      rw [mul_sub, mul_sub, map_sub, map_sub,
        show J4 E F * (2 * comp2 E F F) = 2 * (J4 E F * comp2 E F F) by ring, ofNat_mul_apply,
        o42, mul_comm (J4 E F) (C _), C_mul_apply, m4]
      ring
    have h2 : E (comp2 E F F * gam F F) = 2 * E (comp2 E F F * comp2 E F F) := by
      rw [hΓd, mul_add, mul_add, map_add, map_add, mul_comm (comp2 E F F) (J4 E F), o42,
        show comp2 E F F * (2 * comp2 E F F) = 2 * (comp2 E F F * comp2 E F F) by ring,
        ofNat_mul_apply, mul_comm _ (C _), C_mul_apply, m2]
      ring
    rw [h1, e1, sub_mul, sub_mul, map_sub, map_sub,
      show 2 * comp2 E F F * gam F F = 2 * (comp2 E F F * gam F F) by ring, ofNat_mul_apply, h2,
      C_mul_apply, hEΓ]
    ring
  -- assemble
  have h3 : 3 * tenH (cubicKernel F) = tenS (cubicKernel F) + 2 * cQ (cubicKernel F) :=
    three_tenH hf12
  rw [hF4, hF2Γ, hJ4sq, hGG, hc2sq, show F ^ 2 = F * F from sq F, hS]
  linarith

end wick4

/-! ### The tetrahedral contraction -/

section tetra

/-- The tetrahedral contraction `Q(T₁,T₂,T₃,T₄) = Σ T₁_{abx} T₂_{cdx} T₃_{acy} T₄_{bdy}`: the four
tensors sit at the vertices of `K₄`, the six indices on its edges. -/
def Q4 (T₁ T₂ T₃ T₄ : ι → ι → ι → ℝ) : ℝ :=
  ∑ a, ∑ b, ∑ c, ∑ d, ∑ x, ∑ y, T₁ a b x * T₂ c d x * (T₃ a c y * T₄ b d y)

lemma Q4_eq_ip4 (T₁ T₂ T₃ T₄ : ι → ι → ι → ℝ) :
    Q4 T₁ T₂ T₃ T₄ = ip4 (con T₁ T₂) (sw23 (con T₃ T₄)) := by
  unfold Q4 ip4 con sw23
  simp only [Finset.sum_mul_sum]

omit [Fintype ι] in
lemma sw23_add (X Y : T4 ι) : sw23 (X + Y) = sw23 X + sw23 Y := rfl
omit [Fintype ι] in
lemma sw23_neg (X : T4 ι) : sw23 (-X) = -sw23 X := rfl
lemma sw23_sq₁ {J : ι → ι → ℝ} (X : T4 ι) : sw23 (sq₁ J X) = sq₁ J (sw23 X) := rfl
lemma sw23_sq₂ {J : ι → ι → ℝ} (X : T4 ι) : sw23 (sq₂ J X) = sq₃ J (sw23 X) := rfl
lemma sw23_sq₃ {J : ι → ι → ℝ} (X : T4 ι) : sw23 (sq₃ J X) = sq₂ J (sw23 X) := rfl
lemma sw23_sq₄ {J : ι → ι → ℝ} (X : T4 ι) : sw23 (sq₄ J X) = sq₄ J (sw23 X) := rfl

variable (T₁ T₂ T₃ T₄ T T' : ι → ι → ι → ℝ)

lemma Q4_add₁ : Q4 (T + T') T₂ T₃ T₄ = Q4 T T₂ T₃ T₄ + Q4 T' T₂ T₃ T₄ := by
  simp only [Q4_eq_ip4, con_add_left, ip4_add_left]
lemma Q4_add₂ : Q4 T₁ (T + T') T₃ T₄ = Q4 T₁ T T₃ T₄ + Q4 T₁ T' T₃ T₄ := by
  simp only [Q4_eq_ip4, con_add_right, ip4_add_left]
lemma Q4_add₃ : Q4 T₁ T₂ (T + T') T₄ = Q4 T₁ T₂ T T₄ + Q4 T₁ T₂ T' T₄ := by
  simp only [Q4_eq_ip4, con_add_left, sw23_add, ip4_add_right]
lemma Q4_add₄ : Q4 T₁ T₂ T₃ (T + T') = Q4 T₁ T₂ T₃ T + Q4 T₁ T₂ T₃ T' := by
  simp only [Q4_eq_ip4, con_add_right, sw23_add, ip4_add_right]
lemma Q4_neg₁ : Q4 (-T) T₂ T₃ T₄ = -Q4 T T₂ T₃ T₄ := by
  simp only [Q4_eq_ip4, con_neg_left, ip4_neg_left]
lemma Q4_neg₂ : Q4 T₁ (-T) T₃ T₄ = -Q4 T₁ T T₃ T₄ := by
  simp only [Q4_eq_ip4, con_neg_right, ip4_neg_left]
lemma Q4_neg₃ : Q4 T₁ T₂ (-T) T₄ = -Q4 T₁ T₂ T T₄ := by
  simp only [Q4_eq_ip4, con_neg_left, sw23_neg, ip4_neg_right]
lemma Q4_neg₄ : Q4 T₁ T₂ T₃ (-T) = -Q4 T₁ T₂ T₃ T := by
  simp only [Q4_eq_ip4, con_neg_right, sw23_neg, ip4_neg_right]
lemma Q4_sub₁ : Q4 (T - T') T₂ T₃ T₄ = Q4 T T₂ T₃ T₄ - Q4 T' T₂ T₃ T₄ := by
  rw [sub_eq_add_neg, Q4_add₁, Q4_neg₁, sub_eq_add_neg]

/-- The pair swap `(T₁T₂)(T₃T₄)`. -/
lemma Q4_pairswap : Q4 T₁ T₂ T₃ T₄ = Q4 T₃ T₄ T₁ T₂ := by
  rw [Q4_eq_ip4, Q4_eq_ip4, ← ip4_sw23 (con T₁ T₂), ip4_comm]; rfl

/-- The transposition `(T₁T₂)`. -/
lemma Q4_swap12 : Q4 T₁ T₂ T₃ T₄ = Q4 T₂ T₁ (fun a c y => T₃ c a y) (fun b d y => T₄ d b y) := by
  unfold Q4
  rw [swap4 (fun a b c d => ∑ x, ∑ y, T₁ a b x * T₂ c d x * (T₃ a c y * T₄ b d y))]
  refine Finset.sum_congr rfl fun c _ => Finset.sum_congr rfl fun d _ => Finset.sum_congr rfl
    fun a _ => Finset.sum_congr rfl fun b _ => Finset.sum_congr rfl fun x _ =>
    Finset.sum_congr rfl fun y _ => by ring

lemma sum6_eq (F : ι → ι → ι → ι → ι → ι → ℝ) :
    ∑ a, ∑ b, ∑ c, ∑ d, ∑ x, ∑ y, F a b c d x y
      = ∑ p : ι × ι × ι × ι × ι × ι, F p.1 p.2.1 p.2.2.1 p.2.2.2.1 p.2.2.2.2.1 p.2.2.2.2.2 := by
  simp only [Fintype.sum_prod_type]

/-- The transposition `(T₂T₃)` (`a ↔ x`, `d ↔ y`). -/
lemma Q4_swap23 : Q4 T₁ T₂ T₃ T₄
    = Q4 (fun a b x => T₁ x b a) (fun c d x => T₃ x c d) (fun a c y => T₂ c y a)
      (fun b d y => T₄ b y d) := by
  unfold Q4
  rw [sum6_eq, sum6_eq]
  exact Fintype.sum_equiv
    ⟨fun p => (p.2.2.2.2.1, p.2.1, p.2.2.1, p.2.2.2.2.2, p.1, p.2.2.2.1),
     fun p => (p.2.2.2.2.1, p.2.1, p.2.2.1, p.2.2.2.2.2, p.1, p.2.2.2.1),
     fun _ => rfl, fun _ => rfl⟩ _ _ (fun p => by simp only [Equiv.coe_fn_mk]; ring)

/-- The transposition `(T₂T₄)` (`b ↔ x`, `c ↔ y`). -/
lemma Q4_swap24 : Q4 T₁ T₂ T₃ T₄
    = Q4 (fun a b x => T₁ a x b) (fun c d x => T₄ x d c) (fun a c y => T₃ a y c)
      (fun b d y => T₂ y d b) := by
  unfold Q4
  rw [sum6_eq, sum6_eq]
  exact Fintype.sum_equiv
    ⟨fun p => (p.1, p.2.2.2.2.1, p.2.2.2.2.2, p.2.2.2.1, p.2.1, p.2.2.1),
     fun p => (p.1, p.2.2.2.2.1, p.2.2.2.2.2, p.2.2.2.1, p.2.1, p.2.2.1),
     fun _ => rfl, fun _ => rfl⟩ _ _ (fun p => by simp only [Equiv.coe_fn_mk]; ring)

end tetra

section transfer

variable {J : ι → ι → ℝ} (hJ : IsCplx J)
include hJ

/-- Transfer along the edges of `K₄`. -/
lemma Q4_sl₁ (T₁ T₂ T₃ T₄ : ι → ι → ι → ℝ) :
    Q4 (sl₁ J T₁) T₂ T₃ T₄ = -Q4 T₁ T₂ (sl₁ J T₃) T₄ := by
  rw [Q4_eq_ip4, Q4_eq_ip4, ← sq₁_con, ip4_sq₁ hJ, ← sq₁_con, sw23_sq₁]
lemma Q4_sl₂ (T₁ T₂ T₃ T₄ : ι → ι → ι → ℝ) :
    Q4 (sl₂ J T₁) T₂ T₃ T₄ = -Q4 T₁ T₂ T₃ (sl₁ J T₄) := by
  rw [Q4_eq_ip4, Q4_eq_ip4, ← sq₂_con, ip4_sq₂ hJ, ← sq₃_con, ← sw23_sq₃]
lemma Q4_sl₁' (T₁ T₂ T₃ T₄ : ι → ι → ι → ℝ) :
    Q4 T₁ (sl₁ J T₂) T₃ T₄ = -Q4 T₁ T₂ (sl₂ J T₃) T₄ := by
  rw [Q4_eq_ip4, Q4_eq_ip4, ← sq₃_con, ip4_sq₃ hJ, ← sq₂_con, ← sw23_sq₂]
lemma Q4_sl₂' (T₁ T₂ T₃ T₄ : ι → ι → ι → ℝ) :
    Q4 T₁ (sl₂ J T₂) T₃ T₄ = -Q4 T₁ T₂ T₃ (sl₂ J T₄) := by
  rw [Q4_eq_ip4, Q4_eq_ip4, ← sq₄_con, ip4_sq₄ hJ, ← sq₄_con, sw23_sq₄]
lemma Q4_sl₃ (T₁ T₂ T₃ T₄ : ι → ι → ι → ℝ) :
    Q4 (sl₃ J T₁) T₂ T₃ T₄ = -Q4 T₁ (sl₃ J T₂) T₃ T₄ := by
  rw [Q4_eq_ip4, Q4_eq_ip4, eq_neg_of_add_eq_zero_left (con_sl₃ hJ T₁ T₂), ip4_neg_left]
lemma Q4_sl₃' (T₁ T₂ T₃ T₄ : ι → ι → ι → ℝ) :
    Q4 T₁ T₂ (sl₃ J T₃) T₄ = -Q4 T₁ T₂ T₃ (sl₃ J T₄) := by
  rw [Q4_eq_ip4, Q4_eq_ip4, eq_neg_of_add_eq_zero_left (con_sl₃ hJ T₃ T₄), sw23_neg, ip4_neg_right]

/-- The derivation identity: `Σᵢ Q(…, δTᵢ, …) = 0`. -/
lemma Q4_der (T₁ T₂ T₃ T₄ : ι → ι → ι → ℝ) :
    Q4 (der3 J T₁) T₂ T₃ T₄ + Q4 T₁ (der3 J T₂) T₃ T₄ + Q4 T₁ T₂ (der3 J T₃) T₄
      + Q4 T₁ T₂ T₃ (der3 J T₄) = 0 := by
  simp only [der3_apply', Q4_add₁, Q4_add₂, Q4_add₃, Q4_add₄, Q4_sl₁ hJ, Q4_sl₂ hJ, Q4_sl₁' hJ,
    Q4_sl₂' hJ, Q4_sl₃ hJ, Q4_sl₃' hJ]
  ring

end transfer

/-! ### The tetrahedral invariants of a circular pair -/

section invariants

variable {J : ι → ι → ℝ} (hJ : IsCplx J) {f g : ι → ι → ι → ℝ}
  (hf : ∀ a b c, f a b c = f b a c) (hf13 : ∀ a b c, f a b c = f c b a)
  (hdf : der3 J f = -g) (hdg : der3 J g = f)
include hJ hf hf13 hdf hdg

omit hJ hdf hdg in
lemma Q4_K13_eq : Q4 (sl₁ J (sl₃ J f)) f f f = Q4 (sl₁ J (sl₂ J f)) f f f := by
  have hf23 : ∀ a b c, f a c b = f a b c := fun a b c => by
    rw [hf13 a c b, hf b c a, ← hf13 a b c]
  rw [Q4_swap24 (sl₁ J (sl₂ J f)) f f f]
  congr 1
  · funext a b x
    simp only [sl₁_apply, sl₂_apply, sl₃_apply, Finset.mul_sum]
    refine Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun q _ => ?_
    rw [hf23 p q b]
  · funext c d x; exact hf13 c d x
  · funext a c y; exact hf23 a y c
  · funext b d y; exact hf13 b d y

omit hJ hdf hdg in
lemma Q4_K23_eq : Q4 (sl₂ J (sl₃ J f)) f f f = Q4 (sl₁ J (sl₂ J f)) f f f := by
  have hf23 : ∀ a b c, f a c b = f a b c := fun a b c => by
    rw [hf13 a c b, hf b c a, ← hf13 a b c]
  rw [Q4_swap23 (sl₁ J (sl₂ J f)) f f f]
  congr 1
  · funext a b x
    simp only [sl₁_apply, sl₂_apply, sl₃_apply, Finset.mul_sum]
    rw [Finset.sum_comm]
    refine Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun q _ => ?_
    rw [hf13 a q p]; ring
  · funext c d x; rw [hf c d x, hf13 d c x]
  · funext a c y; rw [hf13 a c y, hf y c a]
  · funext b d y; exact hf23 b y d

/-- `Q(J₁J₂ f, f, f, f) = Q(f,f,f,f)/3`: the three pairs of slots of `T₁` are equivalent. -/
lemma Q4_K12 : 3 * Q4 (sl₁ J (sl₂ J f)) f f f = Q4 f f f f := by
  have hff : der3 J (der3 J f) = -f := by rw [hdf, map_neg, hdg]
  have := congrArg (fun T => Q4 T f f f) (charge_one_e2 hJ hff)
  simp only [Q4_add₁, Q4_K13_eq hf hf13, Q4_K23_eq hf hf13] at this
  linarith

omit hf13 hdf hdg in
/-- `Q(J₃ f, f, J₃ f, f) = 0`: `J`'s on two disjoint edges. -/
lemma Q4_sl₃_sl₃ : Q4 (sl₃ J f) f (sl₃ J f) f = 0 := by
  have h := Q4_swap12 (sl₃ J f) f (sl₃ J f) f
  have e1 : (fun a c y => sl₃ J f c a y) = sl₃ J f := by
    funext a c y; simp only [sl₃_apply]; exact Finset.sum_congr rfl fun p _ => by rw [hf c a]
  have e2 : (fun b d y => f d b y) = f := by funext b d y; exact hf d b y
  rw [e1, e2] at h
  have h' := Q4_sl₃ hJ f f (sl₃ J f) f
  linarith

omit hdf hdg in
lemma Q4_sl₁_sl₂ : Q4 (sl₁ J f) (sl₂ J f) f f = 0 := by
  have hf23 : ∀ a b c, f a c b = f a b c := fun a b c => by
    rw [hf13 a c b, hf b c a, ← hf13 a b c]
  rw [Q4_swap23, ← Q4_sl₃_sl₃ hJ hf]
  congr 1
  · funext a b x; simp only [sl₁_apply, sl₃_apply]
    exact Finset.sum_congr rfl fun p _ => by rw [hf13 p b a]
  · funext c d x; rw [hf x c d, hf23 c d x]
  · funext a c y; simp only [sl₂_apply, sl₃_apply]
    exact Finset.sum_congr rfl fun p _ => by rw [hf13 c p a, hf23 a c p]
  · funext b d y; exact hf23 b d y

omit hdf hdg in
lemma Q4_sl₂_sl₁ : Q4 (sl₂ J f) (sl₁ J f) f f = 0 := by
  have hf23 : ∀ a b c, f a c b = f a b c := fun a b c => by
    rw [hf13 a c b, hf b c a, ← hf13 a b c]
  have h0 : Q4 (sl₃ J f) f f (sl₃ J f) = 0 := by
    have := Q4_sl₃' hJ (sl₃ J f) f f f
    rw [Q4_sl₃_sl₃ hJ hf] at this
    linarith
  rw [Q4_swap24, ← h0]
  congr 1
  · funext a b x; simp only [sl₂_apply, sl₃_apply]
    exact Finset.sum_congr rfl fun p _ => by rw [hf23 a p b]
  · funext c d x; exact hf13 x d c
  · funext a c y; exact hf23 a c y
  · funext b d y; simp only [sl₁_apply, sl₃_apply]
    exact Finset.sum_congr rfl fun p _ => by rw [hf13 p d b]

/-- **`3 Q(g,g,f,f) = Q(f,f,f,f)`**. -/
lemma Q4_gg : 3 * Q4 g g f f = Q4 f f f f := by
  have hff : der3 J (der3 J f) = -f := by rw [hdf, map_neg, hdg]
  have e2 := charge_one_e2 hJ hff
  have e3 := sl_triple_of_charge_one hJ hff
  have hq := Q4_K12 hJ hf hf13 hdf hdg
  have h13 := Q4_K13_eq (J := J) hf hf13
  have h23 := Q4_K23_eq (J := J) hf hf13
  have hX : sl₁ J (sl₂ J (sl₃ J f)) = sl₃ J (sl₁ J (sl₂ J f)) := by rw [sl_comm23, sl_comm13]
  have hg : g = -sl₁ J (sl₂ J (sl₃ J f)) := by rw [e3, hdf, neg_neg]
  have h1 : Q4 g g f f = Q4 (sl₁ J (sl₂ J f)) (sl₁ J (sl₂ J f)) f f := by
    rw [hg, Q4_neg₁, Q4_neg₂, neg_neg, hX, Q4_sl₃ hJ, sl_sq3 hJ, Q4_neg₂, neg_neg]
  have h2 : Q4 f (sl₁ J (sl₂ J f)) f f = Q4 (sl₁ J (sl₂ J f)) f f f := by
    rw [Q4_swap12 f]
    congr 1
    · funext a c y; exact hf c a y
    · funext b d y; exact hf d b y
  have h3 : Q4 (sl₁ J f) (sl₁ J f) f f = Q4 (sl₁ J (sl₂ J f)) f f f := by
    rw [Q4_sl₁ hJ, Q4_sl₁' hJ, neg_neg, Q4_pairswap, ← sl_comm12]
  have h4 : Q4 (sl₂ J f) (sl₂ J f) f f = Q4 (sl₁ J (sl₂ J f)) f f f := by
    rw [Q4_sl₂ hJ, Q4_sl₂' hJ, neg_neg, Q4_pairswap, ← sl_comm12, h2]
  have h5 : Q4 (sl₁ J f) (sl₃ J f) f f = -Q4 (sl₁ J (sl₂ J f)) f f f := by
    rw [← h13, sl_comm13, Q4_sl₃ hJ, neg_neg]
  have h6 : Q4 (sl₂ J f) (sl₃ J f) f f = -Q4 (sl₁ J (sl₂ J f)) f f f := by
    rw [← h23, sl_comm23, Q4_sl₃ hJ, neg_neg]
  have hd : sl₃ J (sl₁ J (sl₂ J f)) = sl₁ J f + sl₂ J f + sl₃ J f := by
    rw [← hX, e3, der3_apply']
  have hii : Q4 (sl₁ J (sl₃ J f)) (sl₁ J (sl₂ J f)) f f = 0 := by
    rw [sl_comm13, Q4_sl₃ hJ, hd, Q4_add₂, Q4_add₂, h3, Q4_sl₁_sl₂ hJ hf hf13, h5]
    ring
  have hiii : Q4 (sl₂ J (sl₃ J f)) (sl₁ J (sl₂ J f)) f f = 0 := by
    rw [sl_comm23, Q4_sl₃ hJ, hd, Q4_add₂, Q4_add₂, h4, Q4_sl₂_sl₁ hJ hf hf13, h6]
    ring
  have hK : sl₁ J (sl₂ J f) = f - sl₁ J (sl₃ J f) - sl₂ J (sl₃ J f) := by linear_combination e2
  rw [h1]
  conv_lhs => arg 2; arg 1; rw [hK]
  rw [Q4_sub₁, Q4_sub₁, h2, hii, hiii]
  linarith

/-- `Q(g,f,g,f) + Q(g,f,f,g) = (2/3) Q(f,f,f,f)`. -/
lemma Q4_gf : Q4 g f g f + Q4 g f f g = 2 / 3 * Q4 f f f f := by
  have h := Q4_der hJ g f f f
  rw [hdg, hdf, Q4_neg₂, Q4_neg₃, Q4_neg₄] at h
  have := Q4_gg hJ hf hf13 hdf hdg
  linarith

/-- `⟨N, N^{(23)}⟩ = (4/3) Q(f,f,f,f)` for `N = g ⋆ f + f ⋆ g`. -/
lemma ip4_N_sw23 (hg : ∀ a b c, g a b c = g b a c) :
    ip4 (con g f + con f g) (sw23 (con g f + con f g)) = 4 / 3 * Q4 f f f f := by
  rw [sw23_add, ip4_add_left, ip4_add_right, ip4_add_right, ← Q4_eq_ip4, ← Q4_eq_ip4,
    ← Q4_eq_ip4, ← Q4_eq_ip4]
  have e1 : Q4 f g g f = Q4 g f g f := by
    rw [Q4_swap12 f g]
    congr 1
    · funext a c y; exact hg c a y
    · funext b d y; exact hf d b y
  have e2 : Q4 f g f g = Q4 g f f g := by
    rw [Q4_swap12 f g]
    congr 1
    · funext a c y; exact hf c a y
    · funext b d y; exact hg d b y
  have := Q4_gf hJ hf hf13 hdf hdg
  linarith

end invariants

/-! ### The charge sectors of `C` and `S`: the fields `A0nn` and `A2nn` -/

section sector

lemma ip4_sw23_eq (X : T4 ι) : ip4 X (sw23 X) = ∑ a, ∑ b, ∑ c, ∑ d, X a b c d * X a c b d := rfl

lemma sum_X13 {X : T4 ι} (hX : ∀ a b c d, X a b d c = X a b c d) :
    ∑ a, ∑ b, ∑ c, ∑ d, X a b c d * X a d b c = ∑ a, ∑ b, ∑ c, ∑ d, X a b c d * X a c b d :=
  (Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => Finset.sum_congr rfl fun c _ =>
    Finset.sum_congr rfl fun d _ => by rw [← hX a b c d]).trans
    (sum4_swap34 fun a b c d => X a b c d * X a c b d)

lemma sum_X23 {X : T4 ι} (hX : ∀ a b c d, X a b d c = X a b c d) :
    ∑ a, ∑ b, ∑ c, ∑ d, X a c b d * X a d b c = ∑ a, ∑ b, ∑ c, ∑ d, X a b c d * X a c b d :=
  (Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => Finset.sum_congr rfl fun c _ =>
    Finset.sum_congr rfl fun d _ => by rw [← hX a d c b]).trans
    ((sum4_cyc fun a b c d => X a b d c * X a c b d).trans
    (Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => Finset.sum_congr rfl fun c _ =>
      Finset.sum_congr rfl fun d _ => by rw [hX a b c d]))

/-- `9 ‖Sym X‖² = 3 ‖X‖² + 6 ⟨X, X^{(23)}⟩` for `X` symmetric in its second pair. -/
lemma nine_sym4_sq {X : T4 ι} (hX : ∀ a b c d, X a b d c = X a b c d) :
    9 * ip4 (sym4 X) (sym4 X) = 3 * ip4 X X + 6 * ip4 X (sw23 X) := by
  have e : ∀ a b c d, sym4 X a b c d * sym4 X a b c d
      = (X a b c d ^ 2 + X a c b d ^ 2 + X a d b c ^ 2
        + 2 * (X a b c d * X a c b d) + 2 * (X a b c d * X a d b c)
        + 2 * (X a c b d * X a d b c)) / 9 := fun a b c d => by
    unfold sym4; ring
  have e2 : ∑ a, ∑ b, ∑ c, ∑ d, X a c b d ^ 2 = ip4 X X :=
    (sum4_swap23 fun a b c d => X a b c d ^ 2).trans (by simp only [ip4, sq])
  have e3 : ∑ a, ∑ b, ∑ c, ∑ d, X a d b c ^ 2 = ip4 X X :=
    (sum4_cyc' fun a b c d => X a b c d ^ 2).trans (by simp only [ip4, sq])
  have e1 : ∑ a, ∑ b, ∑ c, ∑ d, X a b c d ^ 2 = ip4 X X := by simp only [ip4, sq]
  rw [ip4_sw23_eq]
  unfold ip4
  simp only [e, ← Finset.sum_div, Finset.sum_add_distrib, ← Finset.mul_sum]
  rw [e1, e2, e3, sum_X13 hX, sum_X23 hX]
  unfold ip4
  ring

/-- `3 ⟨X, Sym X⟩ = ‖X‖² + 2 ⟨X, X^{(23)}⟩` for `X` symmetric in its second pair. -/
lemma three_ip4_sym4 {X : T4 ι} (hX : ∀ a b c d, X a b d c = X a b c d) :
    3 * ip4 X (sym4 X) = ip4 X X + 2 * ip4 X (sw23 X) := by
  have e : ∀ a b c d, X a b c d * sym4 X a b c d
      = (X a b c d * X a b c d + X a b c d * X a c b d + X a b c d * X a d b c) / 3 :=
    fun a b c d => by unfold sym4; ring
  rw [ip4_sw23_eq]
  unfold ip4
  simp only [e, ← Finset.sum_div, Finset.sum_add_distrib]
  rw [sum_X13 hX]
  ring

/-- `0 ≤ ‖X − θ Sym X‖² = ‖X‖² + k_θ ‖Sym X‖²`. -/
lemma sector_nonneg {X : T4 ι} (hX : ∀ a b c d, X a b d c = X a b c d) :
    0 ≤ ip4 X X + kC * ip4 (sym4 X) (sym4 X) := by
  have h := ip4_self_nonneg (X - thetaC • sym4 X)
  rw [ip4_sub_left, ip4_sub_right, ip4_sub_right, ip4_smul_left, ip4_smul_right, ip4_smul_left,
    ip4_smul_right, ip4_comm (sym4 X) X] at h
  have h1 := three_ip4_sym4 hX
  have h2 := nine_sym4_sq hX
  have hXP : ip4 X (sym4 X) = ip4 (sym4 X) (sym4 X) := by linarith
  rw [hXP] at h
  unfold kC
  linarith

variable {J : ι → ι → ℝ} (hJ : IsCplx J) {f g : ι → ι → ι → ℝ}
  (hf : ∀ a b c, f a b c = f b a c) (hg : ∀ a b c, g a b c = g b a c)
  (hf13 : ∀ a b c, f a b c = f c b a) (hdf : der3 J f = -g) (hdg : der3 J g = f)
include hJ hdf hdg

omit hdg in
lemma der4_C : der4 J (con f f) = -(con g f + con f g) := by
  rw [der4_con hJ, hdf, con_neg_left, con_neg_right, neg_add]
omit hdf in
lemma der4_Cg : der4 J (con g g) = con g f + con f g := by
  rw [der4_con hJ, hdg, add_comm]
lemma der4_N : der4 J (con g f + con f g) = (2 : ℝ) • (con f f - con g g) := by
  rw [map_add, der4_con hJ, der4_con hJ, hdf, hdg, con_neg_left, con_neg_right]
  module

/-- `⟨C, C_g⟩ = s − ‖N‖²/2`. -/
lemma ip4_C_Cg : ip4 (con f f) (con g g)
    = ip4 (con f f) (con f f) - ip4 (con g f + con f g) (con g f + con f g) / 2 := by
  have h := ip4_der4_sq hJ (con f f)
  simp only [der4_C hJ hdf, map_neg, der4_N hJ hdf hdg, ip4_neg_left, ip4_neg_right,
    ip4_smul_right, ip4_sub_right, neg_neg] at h
  linarith

/-- `‖C_g‖² = s`. -/
lemma ip4_Cg_Cg : ip4 (con g g) (con g g) = ip4 (con f f) (con f f) := by
  have h := ip4_der4_sq hJ (con g g)
  simp only [der4_Cg hJ hdg, der4_N hJ hdf hdg, ip4_smul_right, ip4_sub_right] at h
  rw [ip4_comm (con g g) (con f f), ip4_C_Cg hJ hdf hdg] at h
  linarith

/-- `⟨S, S_g⟩ = h − ‖M‖²/2`. -/
lemma ip4_S_Sg : ip4 (sym4 (con f f)) (sym4 (con g g))
    = ip4 (sym4 (con f f)) (sym4 (con f f))
      - ip4 (sym4 (con g f + con f g)) (sym4 (con g f + con f g)) / 2 := by
  have h := ip4_der4_sq hJ (sym4 (con f f))
  simp only [der4_sym4, der4_C hJ hdf, map_neg, der4_N hJ hdf hdg, sym4_neg, sym4_smul,
    sym4_sub, ip4_neg_left, ip4_neg_right, ip4_smul_right, ip4_sub_right, neg_neg] at h
  linarith

/-- `‖S_g‖² = h`. -/
lemma ip4_Sg_Sg : ip4 (sym4 (con g g)) (sym4 (con g g)) = ip4 (sym4 (con f f)) (sym4 (con f f)) := by
  have h := ip4_der4_sq hJ (sym4 (con g g))
  simp only [der4_sym4, der4_Cg hJ hdg, der4_N hJ hdf hdg, sym4_smul, sym4_sub,
    ip4_smul_right, ip4_sub_right] at h
  rw [ip4_comm (sym4 (con g g)) (sym4 (con f f)), ip4_S_Sg hJ hdf hdg] at h
  linarith

include hf hg hf13

/-- The sector identities needed for `A0nn`, `A2nn`. -/
lemma sector_data :
    tenS f = ip4 (con f f) (con f f) ∧ tenH f = ip4 (sym4 (con f f)) (sym4 (con f f))
    ∧ 3 * ip4 (sym4 (con f f)) (sym4 (con f f))
        = ip4 (con f f) (con f f) + 2 * ip4 (con f f) (sw23 (con f f))
    ∧ 3 * ip4 (sym4 (con g f + con f g)) (sym4 (con g f + con f g))
        = ip4 (con g f + con f g) (con g f + con f g) + 8 / 3 * ip4 (con f f) (sw23 (con f f))
    ∧ tenTT f J = ip4 (sym4 (con f f)) (sym4 (con f f)) / 6
        - ip4 (sym4 (con g f + con f g)) (sym4 (con g f + con f g)) / 24
    ∧ ip4 ((1 / 2 : ℝ) • (con f f + con g g)) ((1 / 2 : ℝ) • (con f f + con g g))
        = ip4 (con f f) (con f f) - ip4 (con g f + con f g) (con g f + con f g) / 4
    ∧ ip4 ((1 / 2 : ℝ) • (con f f - con g g)) ((1 / 2 : ℝ) • (con f f - con g g))
        = ip4 (con g f + con f g) (con g f + con f g) / 4
    ∧ sym4 ((1 / 2 : ℝ) • (con f f + con g g)) = (1 / 2 : ℝ) • (sym4 (con f f) + sym4 (con g g))
    ∧ sym4 ((1 / 2 : ℝ) • (con f f - con g g)) = (1 / 2 : ℝ) • (sym4 (con f f) - sym4 (con g g))
    ∧ ip4 ((1 / 2 : ℝ) • (sym4 (con f f) + sym4 (con g g)))
        ((1 / 2 : ℝ) • (sym4 (con f f) + sym4 (con g g)))
        = ip4 (sym4 (con f f)) (sym4 (con f f))
          - ip4 (sym4 (con g f + con f g)) (sym4 (con g f + con f g)) / 4
    ∧ ip4 ((1 / 2 : ℝ) • (sym4 (con f f) - sym4 (con g g)))
        ((1 / 2 : ℝ) • (sym4 (con f f) - sym4 (con g g)))
        = ip4 (sym4 (con g f + con f g)) (sym4 (con g f + con f g)) / 4 := by
  have hN : ∀ a b c d, (con g f + con f g) a b d c = (con g f + con f g) a b c d :=
    fun a b c d => by simp only [Pi.add_apply, con, hf d c, hg d c]
  have hs : tenS f = ip4 (con f f) (con f f) := by
    rw [tenS_eq_sum_kerC_sq]; simp only [ip4, kerC_eq_con, sq]
  have hh : tenH f = ip4 (sym4 (con f f)) (sym4 (con f f)) := tenH_eq_ip4 f
  have hq : 3 * ip4 (sym4 (con f f)) (sym4 (con f f))
      = ip4 (con f f) (con f f) + 2 * ip4 (con f f) (sw23 (con f f)) := by
    have := three_tenH hf; rw [hs, hh] at this; exact this
  have hm : 3 * ip4 (sym4 (con g f + con f g)) (sym4 (con g f + con f g))
      = ip4 (con g f + con f g) (con g f + con f g) + 8 / 3 * ip4 (con f f) (sw23 (con f f)) := by
    have h1 := nine_sym4_sq hN
    have h2 := ip4_N_sw23 hJ hf hf13 hdf hdg hg
    rw [Q4_eq_ip4] at h2
    linarith
  have htt := tenTT_eq_of_der hJ hf hdf hdg
  rw [hh] at htt
  have hCg := ip4_Cg_Cg hJ hdf hdg
  have hCCg := ip4_C_Cg hJ hdf hdg
  have hSg := ip4_Sg_Sg hJ hdf hdg
  have hSSg := ip4_S_Sg hJ hdf hdg
  refine ⟨hs, hh, hq, hm, htt, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · rw [ip4_smul_left, ip4_smul_right, ip4_add_left, ip4_add_right, ip4_add_right, hCg,
      ip4_comm (con g g) (con f f), hCCg]; ring
  · rw [ip4_smul_left, ip4_smul_right, ip4_sub_left, ip4_sub_right, ip4_sub_right, hCg,
      ip4_comm (con g g) (con f f), hCCg]; ring
  · rw [sym4_smul, sym4_add]
  · rw [sym4_smul, sym4_sub]
  · rw [ip4_smul_left, ip4_smul_right, ip4_add_left, ip4_add_right, ip4_add_right, hSg,
      ip4_comm (sym4 (con g g)) (sym4 (con f f)), hSSg]; ring
  · rw [ip4_smul_left, ip4_smul_right, ip4_sub_left, ip4_sub_right, ip4_sub_right, hSg,
      ip4_comm (sym4 (con g g)) (sym4 (con f f)), hSSg]; ring

/-- **The field `A0nn`**: `A₀ = ‖C₀ − θ S₀‖² ≥ 0`. -/
theorem A0nn_of_der : 0 ≤ 2 * tenS f / 3 - 2 * tenH f + (18 + 6 * kC) * tenTT f J := by
  obtain ⟨hs, hh, hq, hm, htt, hC0, -, hS0, -, hS0n, -⟩ := sector_data hJ hf hg hf13 hdf hdg
  have hX : ∀ a b c d, ((1 / 2 : ℝ) • (con f f + con g g)) a b d c
      = ((1 / 2 : ℝ) • (con f f + con g g)) a b c d := fun a b c d => by
    simp only [Pi.smul_apply, Pi.add_apply, con, hf d c, hg d c]
  have h0 := sector_nonneg hX
  rw [hC0, hS0, hS0n] at h0
  rw [hs, hh, htt]
  nlinarith

/-- **The field `A2nn`**: `A₂ = ‖C₂ − θ S₂‖² ≥ 0`. -/
theorem A2nn_of_der : 0 ≤ tenS f / 3 + (2 + kC) * tenH f - (18 + 6 * kC) * tenTT f J := by
  obtain ⟨hs, hh, hq, hm, htt, -, hC2, -, hS2, -, hS2n⟩ := sector_data hJ hf hg hf13 hdf hdg
  have hX : ∀ a b c d, ((1 / 2 : ℝ) • (con f f - con g g)) a b d c
      = ((1 / 2 : ℝ) • (con f f - con g g)) a b c d := fun a b c d => by
    simp only [Pi.smul_apply, Pi.sub_apply, con, hf d c, hg d c]
  have h0 := sector_nonneg hX
  rw [hC2, hS2, hS2n] at h0
  rw [hs, hh, htt]
  nlinarith

end sector

/-- **The field `A0nn`** for the kernel of the real part of a circular cubic. -/
theorem A0nn_circular [DecidableEq ι] {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (hc : Circular J a b) :
    0 ≤ 2 * tenS (cubicKernel a) / 3 - 2 * tenH (cubicKernel a)
      + (18 + 6 * kC) * tenTT (cubicKernel a) J :=
  A0nn_of_der hc.isCplx (cubicKernel_symm12 a) (cubicKernel_symm12 b)
    (fun x y z => by unfold cubicKernel; rw [kern_rev]) hc.der3_left hc.der3_right

/-- **The field `A2nn`** for the kernel of the real part of a circular cubic. -/
theorem A2nn_circular [DecidableEq ι] {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (hc : Circular J a b) :
    0 ≤ tenS (cubicKernel a) / 3 + (2 + kC) * tenH (cubicKernel a)
      - (18 + 6 * kC) * tenTT (cubicKernel a) J :=
  A2nn_of_der hc.isCplx (cubicKernel_symm12 a) (cubicKernel_symm12 b)
    (fun x y z => by unfold cubicKernel; rw [kern_rev]) hc.der3_left hc.der3_right

/-! ### The partial constructor -/

/-- The fields of `TensorFacts` that are **not yet proved** for circular cubics. -/
structure TensorFactsRest (E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ) (J : ι → ι → ℝ) (a : MvPolynomial ι ℝ) :
    Prop where
  wick6 : (E (a ^ 6) - 15 * E (a ^ 4) * E (a ^ 2) + 30 * E (a ^ 2) ^ 3) / 46656
    = 135 / 2 * tenT3 (cubicKernel a) - 20 * tenV (cubicKernel a)
      + 135 / 2 * tenQ (cubicKernel a) + 165 / 2 * tenDU (cubicKernel a)
      + 45 * tenU2 (cubicKernel a)
  sos1 : tenH (cubicKernel a) ≤ 37 / 39 * tenS (cubicKernel a)
  sos2 : 27 * tenH (cubicKernel a) - 5 * tenS (cubicKernel a) + 8 * tenGa (cubicKernel a) J
    ≤ 216 * tenTT (cubicKernel a) J
  cubicTrace : tenV (cubicKernel a) ^ 2 ≤ tenS (cubicKernel a) ^ 3
    * ((1 + 2 * (tenGa (cubicKernel a) J / tenS (cubicKernel a))) ^ 2
      * (1 - tenGa (cubicKernel a) J / tenS (cubicKernel a)) / 2)
  trace3 : tenT3 (cubicKernel a)
    ≤ √(tenTT (cubicKernel a) J) * (9 * tenH (cubicKernel a) / 2 - 17 * tenTT (cubicKernel a) J)
  trace4 : tenT4 (cubicKernel a) ≤ tenH (cubicKernel a) ^ 2 / 2
    + 8 * tenH (cubicKernel a) * tenTT (cubicKernel a) J - 48 * tenTT (cubicKernel a) J ^ 2
  coupled : tenQ (cubicKernel a)
    ≤ (2 * tenS (cubicKernel a) - tenGa (cubicKernel a) J) * √(tenTT (cubicKernel a) J)
      + √(2 * tenGa (cubicKernel a) J * (tenS (cubicKernel a) - tenGa (cubicKernel a) J)
          * (tenH (cubicKernel a) - 6 * tenTT (cubicKernel a) J))
  chargeSplit : tenU2 (cubicKernel a) ≤ thetaC * tenT3 (cubicKernel a)
    + √((2 * tenS (cubicKernel a) / 3 - 2 * tenH (cubicKernel a)
          + (18 + 6 * kC) * tenTT (cubicKernel a) J)
        * (3 * tenH (cubicKernel a) ^ 2 / 8 + tenH (cubicKernel a) * tenTT (cubicKernel a) J / 2
          + 3 * tenTT (cubicKernel a) J ^ 2 / 2))
    + √((tenS (cubicKernel a) / 3 + (2 + kC) * tenH (cubicKernel a)
          - (18 + 6 * kC) * tenTT (cubicKernel a) J)
        * (9 * tenH (cubicKernel a) * tenTT (cubicKernel a) J - 54 * tenTT (cubicKernel a) J ^ 2))

/-- **The tensor facts of a circular cubic** from the remaining ones: the fields `wick4`
(`Chaos3.wick4`), `anti` (`tenGa_le_half`), `block` (`tenTT_le_sixth`), `A0nn`
(`A0nn_circular`) and `A2nn` (`A2nn_circular`) are proved. -/
theorem TensorFactsRest.toTensorFacts [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ}
    (hE : IsGaussianExpectation E) {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ} (ha : Chaos3 a)
    (hc : Circular J a b) (hR : TensorFactsRest E J a) : TensorFacts E J a where
  wick4 := ha.wick4 hE
  wick6 := hR.wick6
  sos1 := hR.sos1
  sos2 := hR.sos2
  anti := tenGa_le_half _ hc.anti hc.sq_diag hc.sq_off
  cubicTrace := hR.cubicTrace
  block := tenTT_le_sixth hc
  trace3 := hR.trace3
  trace4 := hR.trace4
  coupled := hR.coupled
  A0nn := A0nn_circular hc
  A2nn := A2nn_circular hc
  chargeSplit := hR.chargeSplit

end

end Grothe.LowerAnalytic
