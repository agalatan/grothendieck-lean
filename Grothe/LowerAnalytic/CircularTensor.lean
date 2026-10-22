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
* `TensorFactsRest` collects the eleven remaining fields; `TensorFactsRest.toTensorFacts`
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

/-- **Charge one**: if `δ² T = −T` then `J₁J₂J₃ T = δ T`. -/
lemma sl_triple_of_charge_one {T : ι → ι → ι → ℝ} (hT : der3 J (der3 J T) = -T) :
    sl₁ J (sl₂ J (sl₃ J T)) = der3 J T := by
  have h2 : sl₁ J (sl₂ J T) + sl₁ J (sl₃ J T) + sl₂ J (sl₃ J T) = T := by
    have h := der3_sq hJ T
    rw [hT] at h
    have h' : (2 : ℝ) • (sl₁ J (sl₂ J T) + sl₁ J (sl₃ J T) + sl₂ J (sl₃ J T)) = (2 : ℝ) • T := by
      rw [← sub_eq_zero]
      have : -(3 : ℝ) • T + (2 : ℝ) • (sl₁ J (sl₂ J T) + sl₁ J (sl₃ J T) + sl₂ J (sl₃ J T))
          - -T = 0 := by rw [← h]; abel
      rw [← this]; module
    exact smul_right_injective _ (two_ne_zero) h'
  have h3 := congrArg (sl₁ J) h2
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
`tt = h/6 − ‖M‖²/24 ≤ h/6`, `M = Sym(g ⋆ f + f ⋆ g)`. -/
theorem tenTT_le_sixth_of_der (hJ : IsCplx J) {f g : ι → ι → ι → ℝ}
    (hf : ∀ a b c, f a b c = f b a c) (hdf : der3 J f = -g) (hdg : der3 J g = f) :
    tenTT f J ≤ tenH f / 6 := by
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
  have hm := ip4_self_nonneg (sym4 (con g f + con f g))
  rw [tenTT_eq_ip4, ip4_kerSmm hJ, tenH_eq_ip4, ip4_K34_eq (kerS_swP' hf), h8, h5]
  linarith

/-- **The field `block`**: `tt ≤ h/6` for the kernel of the real part of a circular cubic. -/
theorem tenTT_le_sixth [DecidableEq ι] {a b : MvPolynomial ι ℝ} (hc : Circular J a b) :
    tenTT (cubicKernel a) J ≤ tenH (cubicKernel a) / 6 :=
  tenTT_le_sixth_of_der hc.isCplx (cubicKernel_symm12 a) hc.der3_left hc.der3_right

end block



/-! ### The partial constructor -/

/-- The fields of `TensorFacts` that are **not yet proved** for circular cubics. -/
structure TensorFactsRest (E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ) (J : ι → ι → ℝ) (a : MvPolynomial ι ℝ) :
    Prop where
  wick4 : E (a ^ 4) - 3 * E (a ^ 2) ^ 2
    = 1296 * (tenS (cubicKernel a) + 3 * tenH (cubicKernel a) / 2)
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
  A0nn : 0 ≤ 2 * tenS (cubicKernel a) / 3 - 2 * tenH (cubicKernel a)
    + (18 + 6 * kC) * tenTT (cubicKernel a) J
  A2nn : 0 ≤ tenS (cubicKernel a) / 3 + (2 + kC) * tenH (cubicKernel a)
    - (18 + 6 * kC) * tenTT (cubicKernel a) J
  chargeSplit : tenU2 (cubicKernel a) ≤ thetaC * tenT3 (cubicKernel a)
    + √((2 * tenS (cubicKernel a) / 3 - 2 * tenH (cubicKernel a)
          + (18 + 6 * kC) * tenTT (cubicKernel a) J)
        * (3 * tenH (cubicKernel a) ^ 2 / 8 + tenH (cubicKernel a) * tenTT (cubicKernel a) J / 2
          + 3 * tenTT (cubicKernel a) J ^ 2 / 2))
    + √((tenS (cubicKernel a) / 3 + (2 + kC) * tenH (cubicKernel a)
          - (18 + 6 * kC) * tenTT (cubicKernel a) J)
        * (9 * tenH (cubicKernel a) * tenTT (cubicKernel a) J - 54 * tenTT (cubicKernel a) J ^ 2))

/-- **The tensor facts of a circular cubic** from the remaining ones: the fields `anti`
(`tenGa_le_half`) and `block` (`tenTT_le_sixth`) are proved. -/
theorem TensorFactsRest.toTensorFacts [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ}
    {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ} (hc : Circular J a b) (hR : TensorFactsRest E J a) :
    TensorFacts E J a where
  wick4 := hR.wick4
  wick6 := hR.wick6
  sos1 := hR.sos1
  sos2 := hR.sos2
  anti := tenGa_le_half _ hc.anti hc.sq_diag hc.sq_off
  cubicTrace := hR.cubicTrace
  block := tenTT_le_sixth hc
  trace3 := hR.trace3
  trace4 := hR.trace4
  coupled := hR.coupled
  A0nn := hR.A0nn
  A2nn := hR.A2nn
  chargeSplit := hR.chargeSplit

end

end Grothe.LowerAnalytic
