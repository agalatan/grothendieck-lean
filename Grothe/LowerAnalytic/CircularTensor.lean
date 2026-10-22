import Grothe.LowerAnalytic.Circular

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
theorem Circular.chaos3_right [DecidableEq ι] {a b : MvPolynomial ι ℝ} (hc : Circular J a b)
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

end

end Grothe.LowerAnalytic
