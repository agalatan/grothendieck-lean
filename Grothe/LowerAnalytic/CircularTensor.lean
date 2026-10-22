import Grothe.LowerAnalytic.Circular
import Grothe.LowerAnalytic.Covariance
import Grothe.LowerAnalytic.FourthMoment
import Grothe.LowerAnalytic.WickSix

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
* `tenV_le`, `cubicTrace_circular` (the field `cubicTrace`): `V = tr G³ ≤ (s + 2η) √((s − η)/2)`.
  With `G = G₀ + G₂` (commuting/anticommuting with `J`), `tr G³ = tr G₀³ + 3 tr(G₀ G₂²)` (the mixed
  traces vanish), `tr(G₀ Y Yᵀ) ≤ √(tr G₀²/2) tr(Y Yᵀ)` from `2 ‖G₀ u‖² ≤ ‖G₀‖² ‖u‖²`, which is
  Bessel's inequality for the orthogonal pair `u`, `J u` (`bessel_two`, `two_mulVec_sq_le`,
  `trace_mul_self_le`), and `tr G₀² = s − η`, `tr G₂² = η`.
* **The two sums of squares** `sos1_circular` (`h ≤ 37s/39`) and `sos2_circular`
  (`27h − 5s + 8η ≤ 216 tt`).  With `B = (J₃f) ⋆ f` (`tenB`) the charge-one relation reads
  `K₁₂ C = C − (J₁ + J₂) B` (`K12_C`), and `Ω B = (J₃g) ⋆ g`, `g ⋆ f = −K₁₂ B`, `f ⋆ g = K₃₄ B`,
  `δB = (K₃₄ − K₁₂) C`.  On the charge-zero parts `a = C₀`, `b = B₀` (`ch0`), `δ = 0` gives
  `1 = K₁₂ + K₁₃ + K₁₄` (`charge0_sum`) and `(1 − K₁₂) a = (J₁ + J₂) b` (`charge_one_ab`); the
  square-type entries reduce to `‖a‖²`, `κ = ⟨a, K₁₂ a⟩`, `‖C₂‖²`, `η` (`ip4_b_b`, `ip4_a_J1b`,
  `ip4_b_K12b`, `ip4_a_K13a`, via `‖B‖² = s − 2η` and `‖B₂‖² = ‖C₂‖²`), the tetrahedral ones to
  `Q = Q(f,f,f,f)` (`ip4_a_sw23_a = 2Q/3`, `ip4_a_K12sw23_a = Q/3`, `ip4_a_sw23_J1b = Q/6`, the
  `b`–`b` entries vanish by the vertex swap `Q4_sl₃_symm`).  The real avatars of the complex
  sectors are `x₁ = (1 + K₁₃)(a − J₁ b)/2` (the `(+,−,−,+)` sector) and `y = (1 − K₁₂) a`
  (the `(+,+,−,−)` sector), and the certificates are
  `37s − 39h = (45/8) ‖(1 − H)(1 − V) x₁‖² + 6 ‖sw24 y − (1 + H)(1 + V) x₁/4‖² + 12 ‖C₂ − V C₂‖²`
  and `216 tt − 27h + 5s − 8η = 3 ‖(1 − H) x₁‖² + ‖G₀ − 3 J M₀‖²/2` (`H = sw14`, `V = sw23`; the
  last square is the two-tensor `gsquare_nonneg`, expanded through `ip4_con_con`).
* **The block calculus** (`trace4_circular`, the field `trace4`): four-tensors act on pairs
  (`ap4`, `comp`, `col`, `row`), with Hilbert–Schmidt submultiplicativity (`ip4_comp_le`) and the
  complex gain `2 ‖X ∘ Y‖² ≤ ‖X‖² ‖Y‖²` for `𝒥`-linear `X` (`K₁₃ X = X`; `ip4_comp_le_half`,
  from Bessel's inequality for the pair `v`, `𝒥v` with `𝒥 = J ⊗ 1`), and the bounds
  `2 ‖(Y Yᵀ)_lin‖², 2 ‖(Y Yᵀ)_anti‖² ≤ ‖Y‖⁴` for the `𝒥`-linear/antilinear parts
  `(1 ± K₁₃)/2` (`ip4_lin_compswP_le`, `ip4_anti_compswP_le`).  The charge blocks
  `S_{ac} = P_a Q_c S` (`P₀ = (1 + K₁₂)/2` on the output pair, `Q₀ = (1 + K₃₄)/2` on the input
  pair) have `‖S₂₂‖² = 2τ`, `‖S₀₀‖² = 4τ`, `‖S₀₂‖² = ‖S₂₀‖² = (h − 6τ)/2` (`kerS_charge_data`),
  `S₂₂` is `𝒥`-linear (`K13_S22`: no charge four), blocks compose as
  `(XY)_{ac} = X_{a0} Y_{0c} + X_{a2} Y_{2c}` (`block_comp`), and
  `T₄ = ‖S²‖² ≤ (4τ + 2r)² + 2 · 18τr + 2τ² + 4τr + 4r² = h²/2 + 8hτ − 48τ²`, `r = (h − 6τ)/4`.
* **The block trace** `T₃ = ⟨S², S⟩ ≤ 10τ^{3/2} + 18r√τ = √τ (9h/2 − 17τ)` (`trace3_circular`,
  the field `trace3`): the same block walks, `tr S₂₂³ ≤ 2τ^{3/2}` and `tr S₀₀³ ≤ 8τ^{3/2}` by
  Hilbert–Schmidt bounds with the complex gain, the mixed walks by Cauchy–Schwarz.
* **The charge split** (`chargeSplit_circular`, the field `chargeSplit`): `‖U‖² = ⟨S², C⟩`
  (`tenU2_eq_ip4`) `= θ T₃ + ⟨S², C − θS⟩`, and `W = C − θS` is split into its charge-zero
  blocks `W₀₀, W₂₂` (with `‖W₀₀‖² + ‖W₂₂‖² = ‖W₀‖² = A₀`, from `sector_data`) and charge-two
  blocks `W₀₂, W₂₀` (`‖W₀₂‖² + ‖W₂₀‖² = ‖W₂‖² = A₂`).  `W₂₂` is `𝒥`-linear (`K13_C22`, from
  `Σ Kᵢⱼ C = C + Ω C`, i.e. `δ²C = −2(1 − Ω)C`, and `K13_S22`), so it only sees the `𝒥`-linear
  part of `(S²)₂₂`; Cauchy–Schwarz in each sector with the block bounds
  `‖(S²)₀₀‖² + ‖(S²)₂₂,lin‖² ≤ 3h²/8 + hτ/2 + 3τ²/2` and `‖(S²)₀₂‖² + ‖(S²)₂₀‖² ≤ 9hτ − 54τ²`.
* **The coupled `G` test** (`coupled_circular`, the field `coupled`): `Q = ⟨vec G, S vec G⟩`
  (`tenQ_eq_ip2`) with `vec G = G₀ + G₂` split by `K = J ⊗ J` on pairs (`p0v`, `p2v`;
  `G₂ = G_anti`, `kerGa_eq_p2v`, `‖G₂‖² = η`, `‖G₀‖² = s − η`), and `⟨G_a, S G_c⟩ =
  ⟨G_a, S_{ac} G_c⟩` (`ap4_P0`, `ap4_Q0`, …); `⟨G₀, S₀₀ G₀⟩ ≤ 2√τ (s − η)`,
  `⟨G₂, S₂₂ G₂⟩ ≤ √τ η` (complex gain), and the two mixed terms are each
  `≤ √(ρ η (s − η))`, `ρ = (h − 6τ)/2`.
* `Circular.tensorFacts` assembles `TensorFacts` for a circular pair; the Wick identity `wick6`
  is `Chaos3.wick6` (`WickSix.lean`).
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

/-! ### The cubic trace: the field `cubicTrace` -/

section cubic

variable (f : ι → ι → ι → ℝ)

lemma tenV_eq_trace : tenV f = (matG f * matG f * matG f).trace := by
  simp only [Matrix.trace, Matrix.diag, Matrix.mul_apply, matG, Matrix.of_apply, Finset.sum_mul, tenV]
  exact Finset.sum_congr rfl fun a _ => Finset.sum_comm

variable {J : ι → ι → ℝ} [DecidableEq ι]

omit [DecidableEq ι] in
lemma mulVec_dot_mulVec (A : Matrix ι ι ℝ) (v w : ι → ℝ) :
    (A *ᵥ v) ⬝ᵥ (A *ᵥ w) = v ⬝ᵥ ((Aᵀ * A) *ᵥ w) := by
  symm
  rw [← mulVec_mulVec, dotProduct_mulVec v Aᵀ, vecMul_transpose]

lemma matJ_tmul (hJ : IsCplx J) : (matJ J)ᵀ * matJ J = 1 := by
  rw [matJ_transpose hJ.anti, Matrix.neg_mul, matJ_sq hJ.sq_diag hJ.sq_off, neg_neg]

omit [DecidableEq ι] in
lemma dot_matJ_mulVec_self (hJ : IsCplx J) (u : ι → ℝ) : u ⬝ᵥ (matJ J *ᵥ u) = 0 := by
  have h : u ⬝ᵥ (matJ J *ᵥ u) = -(u ⬝ᵥ (matJ J *ᵥ u)) := by
    conv_lhs => rw [dotProduct_mulVec, ← mulVec_transpose, matJ_transpose hJ.anti,
      Matrix.neg_mulVec, neg_dotProduct, dotProduct_comm]
  linarith

/-- Bessel for the orthogonal pair `u`, `J u`. -/
lemma bessel_two (hJ : IsCplx J) (u r : ι → ℝ) :
    (r ⬝ᵥ u) ^ 2 + (r ⬝ᵥ (matJ J *ᵥ u)) ^ 2 ≤ (r ⬝ᵥ r) * (u ⬝ᵥ u) := by
  have hvv : (matJ J *ᵥ u) ⬝ᵥ (matJ J *ᵥ u) = u ⬝ᵥ u := by
    rw [mulVec_dot_mulVec, matJ_tmul hJ, one_mulVec]
  have huv : u ⬝ᵥ (matJ J *ᵥ u) = 0 := dot_matJ_mulVec_self hJ u
  have key : 0 ≤ ((u ⬝ᵥ u) • r - (r ⬝ᵥ u) • u - (r ⬝ᵥ (matJ J *ᵥ u)) • (matJ J *ᵥ u)) ⬝ᵥ
      ((u ⬝ᵥ u) • r - (r ⬝ᵥ u) • u - (r ⬝ᵥ (matJ J *ᵥ u)) • (matJ J *ᵥ u)) :=
    Finset.sum_nonneg fun i _ => mul_self_nonneg _
  simp only [sub_dotProduct, dotProduct_sub, smul_dotProduct, dotProduct_smul, smul_eq_mul,
    hvv, huv] at key
  rw [dotProduct_comm u r, dotProduct_comm (matJ J *ᵥ u) r, dotProduct_comm (matJ J *ᵥ u) u,
    huv] at key
  by_cases h0 : u ⬝ᵥ u = 0
  · have hu : u = 0 := dotProduct_self_eq_zero.1 h0
    simp [hu]
  · have hpos : 0 < u ⬝ᵥ u := lt_of_le_of_ne (Finset.sum_nonneg fun i _ => mul_self_nonneg _)
      (Ne.symm h0)
    have : 0 ≤ (u ⬝ᵥ u) * ((r ⬝ᵥ r) * (u ⬝ᵥ u) - (r ⬝ᵥ u) ^ 2 - (r ⬝ᵥ (matJ J *ᵥ u)) ^ 2) := by
      nlinarith [key]
    have := (mul_nonneg_iff_of_pos_left hpos).1 this
    linarith

/-- `2 ‖G u‖² ≤ tr(G²) ‖u‖²` for a symmetric `G` commuting with the complex structure. -/
lemma two_mulVec_sq_le (hJ : IsCplx J) {G : Matrix ι ι ℝ} (hG : Gᵀ = G)
    (hc : G * matJ J = matJ J * G) (u : ι → ℝ) :
    2 * ((G *ᵥ u) ⬝ᵥ (G *ᵥ u)) ≤ (G * G).trace * (u ⬝ᵥ u) := by
  -- `‖G J u‖ = ‖G u‖`
  have h1 : (G *ᵥ (matJ J *ᵥ u)) ⬝ᵥ (G *ᵥ (matJ J *ᵥ u)) = (G *ᵥ u) ⬝ᵥ (G *ᵥ u) := by
    rw [mulVec_mulVec, hc, ← mulVec_mulVec, mulVec_dot_mulVec (matJ J), matJ_tmul hJ, one_mulVec]
  have hrow : ∀ w : ι → ℝ, (G *ᵥ w) ⬝ᵥ (G *ᵥ w) = ∑ i, ((fun j => G i j) ⬝ᵥ w) ^ 2 := fun w =>
    Finset.sum_congr rfl fun i _ => by rw [sq]; rfl
  have htr : (G * G).trace = ∑ i, (fun j => G i j) ⬝ᵥ (fun j => G i j) :=
    calc (G * G).trace = (Gᵀ * G).trace := by rw [hG]
      _ = ∑ i, ∑ j, G i j ^ 2 := trace_transpose_mul_self G
      _ = _ := Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => sq _
  calc 2 * ((G *ᵥ u) ⬝ᵥ (G *ᵥ u))
      = (G *ᵥ u) ⬝ᵥ (G *ᵥ u) + (G *ᵥ (matJ J *ᵥ u)) ⬝ᵥ (G *ᵥ (matJ J *ᵥ u)) := by rw [h1]; ring
    _ = ∑ i, (((fun j => G i j) ⬝ᵥ u) ^ 2 + ((fun j => G i j) ⬝ᵥ (matJ J *ᵥ u)) ^ 2) := by
        rw [hrow, hrow, Finset.sum_add_distrib]
    _ ≤ ∑ i, ((fun j => G i j) ⬝ᵥ (fun j => G i j)) * (u ⬝ᵥ u) :=
        Finset.sum_le_sum fun i _ => bessel_two hJ u _
    _ = (G * G).trace * (u ⬝ᵥ u) := by rw [htr, Finset.sum_mul]

/-- `tr(G Y Yᵀ) ≤ √(tr(G²)/2) tr(Y Yᵀ)`. -/
lemma trace_mul_self_le (hJ : IsCplx J) {G Y : Matrix ι ι ℝ} (hG : Gᵀ = G)
    (hc : G * matJ J = matJ J * G) :
    (G * (Y * Yᵀ)).trace ≤ √((G * G).trace / 2) * (Y * Yᵀ).trace := by
  have hGG : 0 ≤ (G * G).trace := by
    have := trace_transpose_mul_self_nonneg G; rwa [hG] at this
  have hcol : ∀ u : ι → ℝ, u ⬝ᵥ (G *ᵥ u) ≤ √((G * G).trace / 2) * (u ⬝ᵥ u) := fun u => by
    have h1 : (u ⬝ᵥ (G *ᵥ u)) ^ 2 ≤ (u ⬝ᵥ u) * ((G *ᵥ u) ⬝ᵥ (G *ᵥ u)) := by
      have := Finset.sum_mul_sq_le_sq_mul_sq Finset.univ u (G *ᵥ u)
      simpa only [dotProduct, sq] using this
    have h2 := two_mulVec_sq_le hJ hG hc u
    have huu : 0 ≤ u ⬝ᵥ u := Finset.sum_nonneg fun i _ => mul_self_nonneg _
    have h3 : (u ⬝ᵥ (G *ᵥ u)) ^ 2 ≤ ((G * G).trace / 2) * (u ⬝ᵥ u) ^ 2 := by nlinarith
    have := le_sqrt_mul_sqrt_of_sq_le (by positivity) h3
    rwa [Real.sqrt_sq huu] at this
  -- `tr(G Y Yᵀ) = Σ_k ⟨Y_k, G Y_k⟩`, `tr(Y Yᵀ) = Σ_k ‖Y_k‖²`
  have e1 : (G * (Y * Yᵀ)).trace = ∑ k, (fun i => Y i k) ⬝ᵥ (G *ᵥ fun i => Y i k) := by
    rw [← Matrix.mul_assoc, Matrix.trace_mul_comm]
    simp only [Matrix.trace, Matrix.diag, Matrix.mul_apply, Matrix.transpose_apply, dotProduct,
      mulVec]
  have e2 : (Y * Yᵀ).trace = ∑ k, (fun i => Y i k) ⬝ᵥ (fun i => Y i k) := by
    rw [Matrix.trace_mul_comm]
    simp only [Matrix.trace, Matrix.diag, Matrix.mul_apply, Matrix.transpose_apply, dotProduct]
  rw [e1, e2, Finset.mul_sum]
  exact Finset.sum_le_sum fun k _ => hcol _

/-- `tr(X Y) = 0` when `X` commutes and `Y` anticommutes with `J`. -/
lemma trace_comm_anticomm {Jm X Y : Matrix ι ι ℝ} (hJJ : Jm * Jm = -1) (hX : X * Jm = Jm * X)
    (hY : Y * Jm = -(Jm * Y)) : (X * Y).trace = 0 := by
  have h : (X * Y).trace = -(X * Y).trace := by
    calc (X * Y).trace = (X * Y * -(Jm * Jm)).trace := by rw [hJJ, neg_neg, Matrix.mul_one]
      _ = -(Jm * (X * Y * Jm)).trace := by
          rw [Matrix.mul_neg, Matrix.trace_neg, ← Matrix.mul_assoc, Matrix.trace_mul_comm]
      _ = -(X * (Jm * Y) * Jm).trace := by
          rw [← Matrix.mul_assoc, ← Matrix.mul_assoc, ← hX, Matrix.mul_assoc X Jm Y]
      _ = (X * Y * (Jm * Jm)).trace := by
          have hY' : Jm * Y = -(Y * Jm) := by rw [hY, neg_neg]
          rw [hY', Matrix.mul_neg, Matrix.neg_mul, Matrix.trace_neg, neg_neg]
          simp only [Matrix.mul_assoc]
      _ = -(X * Y).trace := by rw [hJJ, Matrix.mul_neg, Matrix.mul_one, Matrix.trace_neg]
  linarith

/-- **The cubic trace**: `V ≤ (s + 2η) √((s − η)/2)`. -/
theorem tenV_le (hJ : IsCplx J) :
    tenV f ≤ (tenS f + 2 * tenGa f J) * √((tenS f - tenGa f J) / 2) := by
  have hJt := matJ_transpose hJ.anti
  have hJJ := matJ_sq hJ.sq_diag hJ.sq_off
  set Jm := matJ J with hJm
  set G := matG f with hG
  have hGt : Gᵀ = G := matG_transpose f
  set G₀ : Matrix ι ι ℝ := (1 / 2 : ℝ) • (G - Jm * G * Jm) with hG₀
  set G₂ : Matrix ι ι ℝ := (1 / 2 : ℝ) • (G + Jm * G * Jm) with hG₂
  have hsum : G = G₀ + G₂ := by rw [hG₀, hG₂, ← smul_add]; module
  have hsym : (Jm * G * Jm)ᵀ = Jm * G * Jm := by
    rw [Matrix.transpose_mul, Matrix.transpose_mul, hJt, hGt, Matrix.neg_mul, Matrix.mul_neg,
      Matrix.mul_neg, neg_neg, Matrix.mul_assoc]
  have hG₀t : G₀ᵀ = G₀ := by rw [hG₀, Matrix.transpose_smul, Matrix.transpose_sub, hGt, hsym]
  have hG₂t : G₂ᵀ = G₂ := by rw [hG₂, Matrix.transpose_smul, Matrix.transpose_add, hGt, hsym]
  have hJGJJ : Jm * G * Jm * Jm = -(Jm * G) := by
    rw [Matrix.mul_assoc, hJJ, Matrix.mul_neg, Matrix.mul_one]
  have hJJGJ : Jm * (Jm * G * Jm) = -(G * Jm) := by
    rw [← Matrix.mul_assoc, ← Matrix.mul_assoc, hJJ, Matrix.neg_mul, Matrix.one_mul,
      Matrix.neg_mul]
  have hc₀ : G₀ * Jm = Jm * G₀ := by
    rw [hG₀, Matrix.smul_mul, Matrix.mul_smul, Matrix.sub_mul, Matrix.mul_sub, hJGJJ, hJJGJ]
    congr 1; abel
  have hc₂ : G₂ * Jm = -(Jm * G₂) := by
    rw [hG₂, Matrix.smul_mul, Matrix.mul_smul, Matrix.add_mul, Matrix.mul_add, hJGJJ, hJJGJ,
      ← smul_neg]
    congr 1; abel
  have hc₂₂ : G₂ * G₂ * Jm = Jm * (G₂ * G₂) := by
    rw [Matrix.mul_assoc, hc₂, Matrix.mul_neg, ← Matrix.mul_assoc, hc₂, Matrix.neg_mul, neg_neg,
      Matrix.mul_assoc]
  have hc₀₀ : G₀ * G₀ * Jm = Jm * (G₀ * G₀) := by
    rw [Matrix.mul_assoc, hc₀, ← Matrix.mul_assoc, hc₀, Matrix.mul_assoc]
  -- the traces
  have hη : tenGa f J = (G₂ * G₂).trace := by
    rw [tenGa_eq_trace]; change (G₂ᵀ * G₂).trace = _; rw [hG₂t]
  have hs : tenS f = (G * G).trace := by rw [tenS_eq_trace, hGt]
  have h02 : (G₀ * G₂).trace = 0 := trace_comm_anticomm hJJ hc₀ hc₂
  have h20 : (G₂ * G₀).trace = 0 := by rw [Matrix.trace_mul_comm, h02]
  have hs' : (G₀ * G₀).trace = tenS f - tenGa f J := by
    rw [hs, hη, hsum, Matrix.add_mul, Matrix.mul_add, Matrix.mul_add, Matrix.trace_add,
      Matrix.trace_add, Matrix.trace_add, h02, h20]
    ring
  have hV : tenV f = (G₀ * (G₀ * G₀)).trace + 3 * (G₀ * (G₂ * G₂)).trace := by
    have z1 : (G₀ * G₀ * G₂).trace = 0 := trace_comm_anticomm hJJ hc₀₀ hc₂
    have z2 : (G₂ * G₂ * G₂).trace = 0 := trace_comm_anticomm hJJ hc₂₂ hc₂
    rw [tenV_eq_trace, ← hG, hsum]
    simp only [Matrix.add_mul, Matrix.mul_add, Matrix.trace_add]
    have c1 : (G₀ * G₂ * G₀).trace = (G₀ * G₀ * G₂).trace := by
      rw [Matrix.trace_mul_comm, ← Matrix.mul_assoc]
    have c2 : (G₂ * G₀ * G₀).trace = (G₀ * G₀ * G₂).trace := by
      rw [Matrix.mul_assoc, Matrix.trace_mul_comm]
    have c3 : (G₂ * G₀ * G₂).trace = (G₀ * G₂ * G₂).trace := by
      rw [Matrix.mul_assoc, Matrix.trace_mul_comm]
    have c4 : (G₂ * G₂ * G₀).trace = (G₀ * G₂ * G₂).trace := by
      rw [Matrix.trace_mul_comm, ← Matrix.mul_assoc]
    rw [c1, c2, c3, c4, z1, z2, Matrix.mul_assoc, Matrix.mul_assoc]
    ring
  have b1 := trace_mul_self_le hJ hG₀t hc₀ (Y := G₀)
  have b2 := trace_mul_self_le hJ hG₀t hc₀ (Y := G₂)
  rw [hG₀t, hs'] at b1
  rw [hG₂t, ← hη, hs'] at b2
  rw [hV]
  linarith [b1, b2]

/-- **The field `cubicTrace`**. -/
theorem cubicTrace_of_cplx (hJ : IsCplx J) :
    tenV f ^ 2 ≤ tenS f ^ 3 * ((1 + 2 * (tenGa f J / tenS f)) ^ 2 * (1 - tenGa f J / tenS f) / 2) := by
  have hV0 := tenV_nonneg f
  have hV := tenV_le f hJ
  have hη := tenGa_le_half f hJ.anti hJ.sq_diag hJ.sq_off
  have hη0 := tenGa_nonneg f J
  have hs0 := tenS_nonneg f
  have hd : 0 ≤ (tenS f - tenGa f J) / 2 := by linarith
  have hb : 0 ≤ (tenS f + 2 * tenGa f J) * √((tenS f - tenGa f J) / 2) := by positivity
  have hsq : tenV f ^ 2 ≤ ((tenS f + 2 * tenGa f J) * √((tenS f - tenGa f J) / 2)) ^ 2 :=
    sq_le_sq' (by linarith) hV
  rw [mul_pow, Real.sq_sqrt hd] at hsq
  by_cases hs : tenS f = 0
  · have : tenGa f J = 0 := by linarith
    rw [hs, this] at hsq ⊢
    simpa only [zero_div, mul_zero, add_zero, sub_zero, one_pow, mul_one, zero_pow two_ne_zero,
      zero_pow three_ne_zero, zero_mul] using hsq
  · have : tenS f ^ 3 * ((1 + 2 * (tenGa f J / tenS f)) ^ 2 * (1 - tenGa f J / tenS f) / 2)
        = (tenS f + 2 * tenGa f J) ^ 2 * ((tenS f - tenGa f J) / 2) := by
      field_simp
    rw [this]
    exact hsq

end cubic

/-- **The field `cubicTrace`** for the kernel of the real part of a circular cubic. -/
theorem cubicTrace_circular [DecidableEq ι] {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (hc : Circular J a b) :
    tenV (cubicKernel a) ^ 2 ≤ tenS (cubicKernel a) ^ 3
      * ((1 + 2 * (tenGa (cubicKernel a) J / tenS (cubicKernel a))) ^ 2
        * (1 - tenGa (cubicKernel a) J / tenS (cubicKernel a)) / 2) :=
  cubicTrace_of_cplx _ hc.isCplx

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

/-! ### The two sums of squares: the fields `sos1` and `sos2` -/

-- The sections below include the hypotheses of a circular pair globally; the per-lemma usage
-- varies, so the linter for unused section variables is silenced until the end of the proof.
set_option linter.unusedSectionVars false

/-! ### Slot permutations: linearity, adjointness, commutation with the slot operators -/

section permtool

variable {J : ι → ι → ℝ}

omit [Fintype ι] in
lemma sw14_eq (X : T4 ι) : sw14 X = sw23 (sw12 (sw34 (swP X))) := rfl
omit [Fintype ι] in
lemma sw24_eq (X : T4 ι) : sw24 X = sw12 (sw14 (sw12 X)) := rfl

omit [Fintype ι] in
lemma sw12_sw12 (X : T4 ι) : sw12 (sw12 X) = X := rfl
omit [Fintype ι] in
lemma sw23_sw23 (X : T4 ι) : sw23 (sw23 X) = X := rfl
omit [Fintype ι] in
lemma sw34_sw34 (X : T4 ι) : sw34 (sw34 X) = X := rfl
omit [Fintype ι] in
lemma sw14_sw14 (X : T4 ι) : sw14 (sw14 X) = X := rfl
omit [Fintype ι] in
lemma sw24_sw24 (X : T4 ι) : sw24 (sw24 X) = X := rfl
omit [Fintype ι] in
lemma swP_swP (X : T4 ι) : swP (swP X) = X := rfl

lemma ip4_sw12_adj (X Y : T4 ι) : ip4 (sw12 X) Y = ip4 X (sw12 Y) := ip4_sw12 X (sw12 Y)
lemma ip4_sw23_adj (X Y : T4 ι) : ip4 (sw23 X) Y = ip4 X (sw23 Y) := ip4_sw23 X (sw23 Y)
lemma ip4_sw34_adj (X Y : T4 ι) : ip4 (sw34 X) Y = ip4 X (sw34 Y) := ip4_sw34 X (sw34 Y)
lemma ip4_sw14_adj (X Y : T4 ι) : ip4 (sw14 X) Y = ip4 X (sw14 Y) := ip4_sw14 X (sw14 Y)
lemma ip4_sw24_adj (X Y : T4 ι) : ip4 (sw24 X) Y = ip4 X (sw24 Y) := ip4_sw24 X (sw24 Y)
lemma ip4_swP_adj (X Y : T4 ι) : ip4 (swP X) Y = ip4 X (swP Y) := ip4_swP X (swP Y)

omit [Fintype ι] in
lemma sw12_add (X Y : T4 ι) : sw12 (X + Y) = sw12 X + sw12 Y := rfl
omit [Fintype ι] in
lemma sw12_sub (X Y : T4 ι) : sw12 (X - Y) = sw12 X - sw12 Y := rfl
omit [Fintype ι] in
lemma sw12_neg (X : T4 ι) : sw12 (-X) = -sw12 X := rfl
omit [Fintype ι] in
lemma sw12_smul (r : ℝ) (X : T4 ι) : sw12 (r • X) = r • sw12 X := rfl
omit [Fintype ι] in
lemma sw23_sub (X Y : T4 ι) : sw23 (X - Y) = sw23 X - sw23 Y := rfl
omit [Fintype ι] in
lemma sw23_smul (r : ℝ) (X : T4 ι) : sw23 (r • X) = r • sw23 X := rfl
omit [Fintype ι] in
lemma sw34_add (X Y : T4 ι) : sw34 (X + Y) = sw34 X + sw34 Y := rfl
omit [Fintype ι] in
lemma sw34_sub (X Y : T4 ι) : sw34 (X - Y) = sw34 X - sw34 Y := rfl
omit [Fintype ι] in
lemma sw34_neg (X : T4 ι) : sw34 (-X) = -sw34 X := rfl
omit [Fintype ι] in
lemma sw34_smul (r : ℝ) (X : T4 ι) : sw34 (r • X) = r • sw34 X := rfl
omit [Fintype ι] in
lemma sw14_add (X Y : T4 ι) : sw14 (X + Y) = sw14 X + sw14 Y := rfl
omit [Fintype ι] in
lemma sw14_sub (X Y : T4 ι) : sw14 (X - Y) = sw14 X - sw14 Y := rfl
omit [Fintype ι] in
lemma sw14_neg (X : T4 ι) : sw14 (-X) = -sw14 X := rfl
omit [Fintype ι] in
lemma sw14_smul (r : ℝ) (X : T4 ι) : sw14 (r • X) = r • sw14 X := rfl
omit [Fintype ι] in
lemma sw24_add (X Y : T4 ι) : sw24 (X + Y) = sw24 X + sw24 Y := rfl
omit [Fintype ι] in
lemma sw24_sub (X Y : T4 ι) : sw24 (X - Y) = sw24 X - sw24 Y := rfl
omit [Fintype ι] in
lemma sw24_neg (X : T4 ι) : sw24 (-X) = -sw24 X := rfl
omit [Fintype ι] in
lemma sw24_smul (r : ℝ) (X : T4 ι) : sw24 (r • X) = r • sw24 X := rfl
omit [Fintype ι] in
lemma swP_add (X Y : T4 ι) : swP (X + Y) = swP X + swP Y := rfl
omit [Fintype ι] in
lemma swP_sub (X Y : T4 ι) : swP (X - Y) = swP X - swP Y := rfl
omit [Fintype ι] in
lemma swP_neg (X : T4 ι) : swP (-X) = -swP X := rfl
omit [Fintype ι] in
lemma swP_smul (r : ℝ) (X : T4 ι) : swP (r • X) = r • swP X := rfl

/-! Commutation of the permutations with the slot operators (all definitional). -/

lemma sw12_sq₁ (X : T4 ι) : sw12 (sq₁ J X) = sq₂ J (sw12 X) := rfl
lemma sw12_sq₂ (X : T4 ι) : sw12 (sq₂ J X) = sq₁ J (sw12 X) := rfl
lemma sw12_sq₃ (X : T4 ι) : sw12 (sq₃ J X) = sq₃ J (sw12 X) := rfl
lemma sw12_sq₄ (X : T4 ι) : sw12 (sq₄ J X) = sq₄ J (sw12 X) := rfl
lemma sw34_sq₁ (X : T4 ι) : sw34 (sq₁ J X) = sq₁ J (sw34 X) := rfl
lemma sw34_sq₂ (X : T4 ι) : sw34 (sq₂ J X) = sq₂ J (sw34 X) := rfl
lemma sw34_sq₃ (X : T4 ι) : sw34 (sq₃ J X) = sq₄ J (sw34 X) := rfl
lemma sw34_sq₄ (X : T4 ι) : sw34 (sq₄ J X) = sq₃ J (sw34 X) := rfl
lemma sw14_sq₁ (X : T4 ι) : sw14 (sq₁ J X) = sq₄ J (sw14 X) := rfl
lemma sw14_sq₂ (X : T4 ι) : sw14 (sq₂ J X) = sq₂ J (sw14 X) := rfl
lemma sw14_sq₃ (X : T4 ι) : sw14 (sq₃ J X) = sq₃ J (sw14 X) := rfl
lemma sw14_sq₄ (X : T4 ι) : sw14 (sq₄ J X) = sq₁ J (sw14 X) := rfl
lemma sw24_sq₁ (X : T4 ι) : sw24 (sq₁ J X) = sq₁ J (sw24 X) := rfl
lemma sw24_sq₂ (X : T4 ι) : sw24 (sq₂ J X) = sq₄ J (sw24 X) := rfl
lemma sw24_sq₃ (X : T4 ι) : sw24 (sq₃ J X) = sq₃ J (sw24 X) := rfl
lemma sw24_sq₄ (X : T4 ι) : sw24 (sq₄ J X) = sq₂ J (sw24 X) := rfl
lemma swP_sq₁ (X : T4 ι) : swP (sq₁ J X) = sq₃ J (swP X) := rfl
lemma swP_sq₂ (X : T4 ι) : swP (sq₂ J X) = sq₄ J (swP X) := rfl
lemma swP_sq₃ (X : T4 ι) : swP (sq₃ J X) = sq₁ J (swP X) := rfl
lemma swP_sq₄ (X : T4 ι) : swP (sq₄ J X) = sq₂ J (swP X) := rfl

lemma sw12_con (T T' : ι → ι → ι → ℝ) : sw12 (con T T') = con (fun a b c => T b a c) T' := rfl
lemma sw34_con (T T' : ι → ι → ι → ℝ) : sw34 (con T T') = con T (fun a b c => T' b a c) := rfl
lemma swP_con (T T' : ι → ι → ι → ℝ) : swP (con T T') = con T' T := by
  funext a b c d; exact Finset.sum_congr rfl fun x _ => mul_comm _ _

/-! `Ω` -/

variable (hJ : IsCplx J)
include hJ

lemma om4_om4 (X : T4 ι) : om4 J (om4 J X) = X := by
  rw [om4_apply, om4_apply, ← K12_K34, K12_sq hJ, K34_sq hJ]

omit hJ in
lemma om4_sw12 (X : T4 ι) : om4 J (sw12 X) = sw12 (om4 J X) := by
  simp only [om4_apply, sw12_sq₁, sw12_sq₂, sw12_sq₃, sw12_sq₄]; rw [sq_comm12]
omit hJ in
lemma om4_sw34 (X : T4 ι) : om4 J (sw34 X) = sw34 (om4 J X) := by
  simp only [om4_apply, sw34_sq₁, sw34_sq₂, sw34_sq₃, sw34_sq₄]; rw [sq_comm34]
omit hJ in
lemma om4_sw23 (X : T4 ι) : om4 J (sw23 X) = sw23 (om4 J X) := by
  simp only [om4_apply, sw23_sq₁, sw23_sq₂, sw23_sq₃, sw23_sq₄]; rw [sq_comm23]
omit hJ in
lemma om4_swP (X : T4 ι) : om4 J (swP X) = swP (om4 J X) := by
  simp only [om4_apply, swP_sq₁, swP_sq₂, swP_sq₃, swP_sq₄]; rw [K12_K34]
omit hJ in
lemma om4_sw14 (X : T4 ι) : om4 J (sw14 X) = sw14 (om4 J X) := by
  rw [sw14_eq, sw14_eq, om4_sw23, om4_sw12, om4_sw34, om4_swP]
omit hJ in
lemma om4_sw24 (X : T4 ι) : om4 J (sw24 X) = sw24 (om4 J X) := by
  rw [sw24_eq, sw24_eq, om4_sw12, om4_sw14, om4_sw12]
omit hJ in
lemma om4_sq₁ (X : T4 ι) : om4 J (sq₁ J X) = sq₁ J (om4 J X) := by
  simp only [om4_apply]; rw [← sq_comm14, ← sq_comm13, ← sq_comm12]
omit hJ in
lemma om4_sq₂ (X : T4 ι) : om4 J (sq₂ J X) = sq₂ J (om4 J X) := by
  simp only [om4_apply]; rw [← sq_comm24, ← sq_comm23, ← sq_comm12]
omit hJ in
lemma om4_sq₃ (X : T4 ι) : om4 J (sq₃ J X) = sq₃ J (om4 J X) := by
  simp only [om4_apply]; rw [← sq_comm34, ← sq_comm13, ← sq_comm23]
omit hJ in
lemma om4_sq₄ (X : T4 ι) : om4 J (sq₄ J X) = sq₄ J (om4 J X) := by
  simp only [om4_apply]; rw [← sq_comm14, ← sq_comm24, ← sq_comm34]

lemma K13_sq (T : T4 ι) : sq₁ J (sq₃ J (sq₁ J (sq₃ J T))) = T := by
  rw [← sq_comm13 (sq₃ J T), sq_sq1 hJ, sq_sq3 hJ, neg_neg]
lemma K14_sq (T : T4 ι) : sq₁ J (sq₄ J (sq₁ J (sq₄ J T))) = T := by
  rw [← sq_comm14 (sq₄ J T), sq_sq1 hJ, sq_sq4 hJ, neg_neg]

/-- `Ω K₁₂ = K₃₄`. -/
lemma om4_K12 (X : T4 ι) : om4 J (sq₁ J (sq₂ J X)) = sq₃ J (sq₄ J X) := by
  rw [om4_apply, ← K12_K34, K12_sq hJ]
lemma om4_K34 (X : T4 ι) : om4 J (sq₃ J (sq₄ J X)) = sq₁ J (sq₂ J X) := by
  rw [om4_apply, K34_sq hJ]
/-- `Ω K₁₃ = K₂₄`. -/
lemma om4_K13 (X : T4 ι) : om4 J (sq₁ J (sq₃ J X)) = sq₂ J (sq₄ J X) := by
  rw [om4_sq₁, om4_sq₃, om4_apply, sq_comm23, K13_sq hJ]
lemma om4_K14 (X : T4 ι) : om4 J (sq₁ J (sq₄ J X)) = sq₂ J (sq₃ J X) := by
  rw [om4_sq₁, om4_sq₄, om4_apply, sq_comm34, sq_comm24, K14_sq hJ]

/-! Adjointness of the `K`'s. -/
lemma ip4_K13 (T T' : T4 ι) : ip4 (sq₁ J (sq₃ J T)) T' = ip4 T (sq₁ J (sq₃ J T')) := by
  rw [ip4_sq₁ hJ, ip4_sq₃ hJ, neg_neg, sq_comm13]
lemma ip4_K14 (T T' : T4 ι) : ip4 (sq₁ J (sq₄ J T)) T' = ip4 T (sq₁ J (sq₄ J T')) := by
  rw [ip4_sq₁ hJ, ip4_sq₄ hJ, neg_neg, sq_comm14]
lemma ip4_K23 (T T' : T4 ι) : ip4 (sq₂ J (sq₃ J T)) T' = ip4 T (sq₂ J (sq₃ J T')) := by
  rw [ip4_sq₂ hJ, ip4_sq₃ hJ, neg_neg, sq_comm23]
lemma ip4_K24 (T T' : T4 ι) : ip4 (sq₂ J (sq₄ J T)) T' = ip4 T (sq₂ J (sq₄ J T')) := by
  rw [ip4_sq₂ hJ, ip4_sq₄ hJ, neg_neg, sq_comm24]

/-! ### Charge-zero tensors: `Ω T = T`, `δ T = 0` -/

/-- `K₃₄ T = K₁₂ T` for `Ω T = T`. -/
lemma K34_of_om (T : T4 ι) (hT : om4 J T = T) : sq₃ J (sq₄ J T) = sq₁ J (sq₂ J T) := by
  conv_rhs => rw [← hT]
  rw [om4_apply, K12_sq hJ]
lemma K24_of_om (T : T4 ι) (hT : om4 J T = T) : sq₂ J (sq₄ J T) = sq₁ J (sq₃ J T) := by
  conv_rhs => rw [← hT]
  rw [← om4_K13 hJ, om4_sq₁, om4_sq₃]
lemma K23_of_om (T : T4 ι) (hT : om4 J T = T) : sq₂ J (sq₃ J T) = sq₁ J (sq₄ J T) := by
  conv_rhs => rw [← hT]
  rw [← om4_K14 hJ, om4_sq₁, om4_sq₄]

/-- On a charge-zero tensor, `1 = K₁₂ + K₁₃ + K₁₄`. -/
lemma charge0_sum (T : T4 ι) (hT : om4 J T = T) (hd : der4 J T = 0) :
    T = sq₁ J (sq₂ J T) + sq₁ J (sq₃ J T) + sq₁ J (sq₄ J T) := by
  have h := der4_sq hJ T
  rw [hd, map_zero, K34_of_om hJ T hT, K24_of_om hJ T hT, K23_of_om hJ T hT] at h
  have key : (0 : T4 ι) = -(4 : ℝ) • T + (2 : ℝ) • (sq₁ J (sq₂ J T) + sq₁ J (sq₃ J T)
      + sq₁ J (sq₄ J T) + sq₁ J (sq₄ J T) + sq₁ J (sq₃ J T) + sq₁ J (sq₂ J T)) := h
  have h2 : (4 : ℝ) • T = (4 : ℝ) • (sq₁ J (sq₂ J T) + sq₁ J (sq₃ J T) + sq₁ J (sq₄ J T)) := by
    rw [← sub_eq_zero, show (4 : ℝ) • T - (4 : ℝ) • (sq₁ J (sq₂ J T) + sq₁ J (sq₃ J T) + sq₁ J (sq₄ J T))
      = -(-(4 : ℝ) • T + (2 : ℝ) • (sq₁ J (sq₂ J T) + sq₁ J (sq₃ J T)
      + sq₁ J (sq₄ J T) + sq₁ J (sq₄ J T) + sq₁ J (sq₃ J T) + sq₁ J (sq₂ J T))) by module, ← key,
      neg_zero]
  exact smul_right_injective _ (by norm_num : (4 : ℝ) ≠ 0) h2

end permtool

/-! ### The charge projections `(1 ± Ω)/2` -/

section charge

variable {J : ι → ι → ℝ} (hJ : IsCplx J)

/-- The charge-zero part `(X + Ω X)/2`. -/
def ch0 (J : ι → ι → ℝ) (X : T4 ι) : T4 ι := (1 / 2 : ℝ) • (X + om4 J X)
/-- The charge-`±2` part `(X − Ω X)/2`. -/
def ch2 (J : ι → ι → ℝ) (X : T4 ι) : T4 ι := (1 / 2 : ℝ) • (X - om4 J X)

lemma ch0_add_ch2 (X : T4 ι) : ch0 J X + ch2 J X = X := by
  unfold ch0 ch2; module

include hJ

lemma om4_ch0 (X : T4 ι) : om4 J (ch0 J X) = ch0 J X := by
  unfold ch0; rw [map_smul, map_add, om4_om4 hJ, add_comm]
lemma om4_ch2 (X : T4 ι) : om4 J (ch2 J X) = -ch2 J X := by
  unfold ch2; rw [map_smul, map_sub, om4_om4 hJ, ← smul_neg, neg_sub]

lemma ip4_ch0_ch2 (X Y : T4 ι) : ip4 (ch0 J X) (ch2 J Y) = 0 := by
  have h : ip4 (ch0 J X) (ch2 J Y) = -ip4 (ch0 J X) (ch2 J Y) := by
    conv_lhs => rw [← om4_ch0 hJ X, ip4_om4 hJ, om4_ch2 hJ, ip4_neg_right]
  linarith

lemma ip4_self_ch (X : T4 ι) : ip4 X X = ip4 (ch0 J X) (ch0 J X) + ip4 (ch2 J X) (ch2 J X) := by
  conv_lhs => rw [← ch0_add_ch2 (J := J) X]
  rw [ip4_add_left, ip4_add_right, ip4_add_right, ip4_ch0_ch2 hJ, ip4_comm (ch2 J X) (ch0 J X),
    ip4_ch0_ch2 hJ]
  ring

/-- `⟨X, Ω X⟩ = ‖X₀‖² − ‖X₂‖²`. -/
lemma ip4_om4_self (X : T4 ι) :
    ip4 X (om4 J X) = ip4 (ch0 J X) (ch0 J X) - ip4 (ch2 J X) (ch2 J X) := by
  have h1 := ip4_self_ch hJ X
  have hOO : ip4 (om4 J X) (om4 J X) = ip4 X X := by rw [ip4_om4 hJ, om4_om4 hJ]
  have h2 : ip4 (ch0 J X) (ch0 J X)
      = (ip4 X X + 2 * ip4 X (om4 J X) + ip4 (om4 J X) (om4 J X)) / 4 := by
    rw [ch0, ip4_smul_left, ip4_smul_right, ip4_add_left, ip4_add_right, ip4_add_right,
      ip4_comm (om4 J X) X]
    ring
  rw [hOO] at h2
  linarith

omit hJ in
lemma ch0_sq₁ (X : T4 ι) : ch0 J (sq₁ J X) = sq₁ J (ch0 J X) := by
  unfold ch0; rw [map_smul, map_add, om4_sq₁]
omit hJ in
lemma ch0_sq₂ (X : T4 ι) : ch0 J (sq₂ J X) = sq₂ J (ch0 J X) := by
  unfold ch0; rw [map_smul, map_add, om4_sq₂]
omit hJ in
lemma ch0_sq₃ (X : T4 ι) : ch0 J (sq₃ J X) = sq₃ J (ch0 J X) := by
  unfold ch0; rw [map_smul, map_add, om4_sq₃]
omit hJ in
lemma ch0_sq₄ (X : T4 ι) : ch0 J (sq₄ J X) = sq₄ J (ch0 J X) := by
  unfold ch0; rw [map_smul, map_add, om4_sq₄]
omit hJ in
lemma ch0_sw12 (X : T4 ι) : ch0 J (sw12 X) = sw12 (ch0 J X) := by
  unfold ch0; rw [om4_sw12, sw12_smul, sw12_add]
omit hJ in
lemma ch0_sw34 (X : T4 ι) : ch0 J (sw34 X) = sw34 (ch0 J X) := by
  unfold ch0; rw [om4_sw34, sw34_smul, sw34_add]
omit hJ in
lemma ch0_swP (X : T4 ι) : ch0 J (swP X) = swP (ch0 J X) := by
  unfold ch0; rw [om4_swP, swP_smul, swP_add]
omit hJ in
lemma ch0_der4 (X : T4 ι) : ch0 J (der4 J X) = der4 J (ch0 J X) := by
  unfold ch0; rw [map_smul, map_add, der4_apply, der4_apply, map_add, map_add, map_add, om4_sq₁,
    om4_sq₂, om4_sq₃, om4_sq₄]
omit hJ in
lemma ch0_add (X Y : T4 ι) : ch0 J (X + Y) = ch0 J X + ch0 J Y := by
  unfold ch0; rw [map_add]; module
omit hJ in
lemma ch0_sub (X Y : T4 ι) : ch0 J (X - Y) = ch0 J X - ch0 J Y := by
  unfold ch0; rw [map_sub]; module
omit hJ in
lemma ch0_neg (X : T4 ι) : ch0 J (-X) = -ch0 J X := by
  unfold ch0; rw [map_neg]; module

end charge

/-! ### The tensors `C = f ⋆ f`, `B = (J₃ f) ⋆ f` of a circular pair -/

/-- `B = (J₃ f) ⋆ f`: `J` on the contracted edge. -/
def tenB (J : ι → ι → ℝ) (f : ι → ι → ι → ℝ) : T4 ι := con (sl₃ J f) f

section pair

variable {J : ι → ι → ℝ} (hJ : IsCplx J) {f g : ι → ι → ι → ℝ}
  (hf : ∀ a b c, f a b c = f b a c) (hg : ∀ a b c, g a b c = g b a c)
  (hdf : der3 J f = -g) (hdg : der3 J g = f)

omit [Fintype ι] in
lemma con_sub_left (T₁ T₂ T' : ι → ι → ι → ℝ) [Fintype ι] :
    con (T₁ - T₂) T' = con T₁ T' - con T₂ T' := by
  funext a b c d; simp only [con, Pi.sub_apply, sub_mul, Finset.sum_sub_distrib]
omit [Fintype ι] in
lemma con_sub_right (T T₁ T₂ : ι → ι → ι → ℝ) [Fintype ι] :
    con T (T₁ - T₂) = con T T₁ - con T T₂ := by
  funext a b c d; simp only [con, Pi.sub_apply, mul_sub, Finset.sum_sub_distrib]

lemma der3_sl₃ (T : ι → ι → ι → ℝ) : der3 J (sl₃ J T) = sl₃ J (der3 J T) := by
  simp only [der3_apply', map_add, sl_comm13, sl_comm23]

include hJ hdf hdg

lemma sl123_f : sl₁ J (sl₂ J (sl₃ J f)) = -g := by
  have hff : der3 J (der3 J f) = -f := by rw [hdf, map_neg, hdg]
  rw [sl_triple_of_charge_one hJ hff, hdf]

lemma sl₃_g : sl₃ J g = sl₁ J (sl₂ J f) := by
  have hg' : g = -sl₁ J (sl₂ J (sl₃ J f)) := by rw [sl123_f hJ hdf hdg, neg_neg]
  rw [hg', map_neg, ← sl_comm13, ← sl_comm23, sl_sq3 hJ, map_neg, map_neg, neg_neg]

lemma sl₃_f : sl₃ J f = -sl₁ J (sl₂ J g) := by
  have hgg : der3 J (der3 J g) = -g := by rw [hdg, hdf]
  have e3 := sl_triple_of_charge_one hJ hgg
  rw [hdg] at e3
  conv_lhs => rw [← e3]
  rw [← sl_comm13, ← sl_comm23, sl_sq3 hJ, map_neg, map_neg]

lemma om4_C : om4 J (con f f) = con g g := by
  rw [om4_con hJ, sl123_f hJ hdf hdg, con_neg_left, con_neg_right, neg_neg]

lemma om4_B : om4 J (tenB J f) = con (sl₃ J g) g := by
  rw [tenB, om4_con hJ, sl_sq3 hJ, map_neg, map_neg, sl123_f hJ hdf hdg, con_neg_left,
    con_neg_right, neg_neg, ← sl₃_g hJ hdf hdg]

lemma con_gf : con g f = -sq₁ J (sq₂ J (tenB J f)) := by
  rw [tenB, sq₂_con, sq₁_con, sl123_f hJ hdf hdg, con_neg_left, neg_neg]

lemma con_fg : con f g = sq₃ J (sq₄ J (tenB J f)) := by
  rw [tenB, sq₄_con, sq₃_con, ← sl₃_g hJ hdf hdg, con_sl₃_sl₃ hJ]

include hf in
lemma K12_C : sq₁ J (sq₂ J (con f f)) = con f f - sq₁ J (tenB J f) - sq₂ J (tenB J f) := by
  have hff : der3 J (der3 J f) = -f := by rw [hdf, map_neg, hdg]
  have e2 := charge_one_e2 hJ hff
  have e : sl₁ J (sl₂ J f) = f - sl₁ J (sl₃ J f) - sl₂ J (sl₃ J f) := by
    rw [sub_sub, eq_sub_iff_add_eq, ← add_assoc]; exact e2
  rw [sq₂_con, sq₁_con, e, con_sub_left, con_sub_left, tenB, sq₁_con, sq₂_con]

include hf in
lemma K34_C : sq₃ J (sq₄ J (con f f)) = con f f + sq₃ J (tenB J f) + sq₄ J (tenB J f) := by
  have hff : der3 J (der3 J f) = -f := by rw [hdf, map_neg, hdg]
  have e2 := charge_one_e2 hJ hff
  have e : sl₁ J (sl₂ J f) = f - sl₁ J (sl₃ J f) - sl₂ J (sl₃ J f) := by
    rw [sub_sub, eq_sub_iff_add_eq, ← add_assoc]; exact e2
  rw [sq₄_con, sq₃_con, e, con_sub_right, con_sub_right, tenB, sq₃_con, sq₄_con, sl_comm13,
    sl_comm23, eq_neg_of_add_eq_zero_right (con_sl₃ hJ f (sl₁ J f)),
    eq_neg_of_add_eq_zero_right (con_sl₃ hJ f (sl₂ J f))]
  abel

lemma der4_B : der4 J (tenB J f) = sq₃ J (sq₄ J (con f f)) - sq₁ J (sq₂ J (con f f)) := by
  rw [tenB, der4_con hJ, der3_sl₃, hdf, map_neg, con_neg_left, con_neg_right, sq₂_con, sq₁_con,
    sq₄_con, sq₃_con, ← sl₃_g hJ hdf hdg, eq_neg_of_add_eq_zero_right (con_sl₃ hJ f g)]
  abel

lemma der4_C' : der4 J (con f f) = sq₁ J (sq₂ J (tenB J f)) - sq₃ J (sq₄ J (tenB J f)) := by
  rw [der4_con hJ, hdf, con_neg_left, con_neg_right, con_gf hJ hdf hdg, con_fg hJ hdf hdg]
  abel

/-! The charge-zero parts `a = C₀`, `b = B₀`. -/

lemma der4_a : der4 J (ch0 J (con f f)) = 0 := by
  rw [← ch0_der4, der4_C' hJ hdf hdg, ch0, map_sub, om4_K12 hJ, om4_K34 hJ]
  module

lemma der4_b : der4 J (ch0 J (tenB J f)) = 0 := by
  rw [← ch0_der4, der4_B hJ hdf hdg, ch0, map_sub, om4_K12 hJ, om4_K34 hJ]
  module

include hf in
/-- The charge-one relation on the charge-zero parts: `(1 − K₁₂) a = (J₁ + J₂) b`. -/
lemma charge_one_ab : ch0 J (con f f) - sq₁ J (sq₂ J (ch0 J (con f f)))
    = sq₁ J (ch0 J (tenB J f)) + sq₂ J (ch0 J (tenB J f)) := by
  rw [← ch0_sq₂, ← ch0_sq₁, K12_C hJ hf hdf hdg, ch0_sub, ch0_sub, ch0_sq₁, ch0_sq₂]
  abel

omit hJ hdf hdg in
include hf in
lemma sw12_C : sw12 (con f f) = con f f := by
  rw [sw12_con]; congr 1; funext a b c; exact hf b a c
omit hJ hdf hdg in
include hf in
lemma sw34_C : sw34 (con f f) = con f f := by
  rw [sw34_con]; congr 1; funext a b c; exact hf b a c
omit hJ hdf hdg in
lemma swP_C : swP (con f f) = con f f := swP_con f f
omit hJ hdf hdg in
include hf in
lemma sw12_B : sw12 (tenB J f) = tenB J f := by
  rw [tenB, sw12_con]; congr 1; funext a b c; simp only [sl₃_apply]
  exact Finset.sum_congr rfl fun p _ => by rw [hf b a]
omit hJ hdf hdg in
include hf in
lemma sw34_B : sw34 (tenB J f) = tenB J f := by
  rw [tenB, sw34_con]; congr 1; funext a b c; exact hf b a c
omit hdf hdg in
lemma swP_B : swP (tenB J f) = -tenB J f := by
  rw [tenB, swP_con, eq_neg_of_add_eq_zero_right (con_sl₃ hJ f f)]

end pair

/-! ### Square-type Gram entries -/

section squares

variable {J : ι → ι → ℝ} (hJ : IsCplx J)
include hJ

/-- `tr(G J G J) = 2η − s`. -/
lemma trace_GJGJ [DecidableEq ι] (f : ι → ι → ι → ℝ) :
    (matG f * (matJ J * matG f * matJ J)).trace = 2 * tenGa f J - tenS f := by
  have hJt := matJ_transpose hJ.anti
  have hJJ := matJ_sq hJ.sq_diag hJ.sq_off
  set Jm := matJ J with hJm
  set G := matG f with hG
  have hGt : Gᵀ = G := matG_transpose f
  have hsym : (Jm * G * Jm)ᵀ = Jm * G * Jm := by
    rw [Matrix.transpose_mul, Matrix.transpose_mul, hJt, hGt, Matrix.neg_mul, Matrix.mul_neg,
      Matrix.mul_neg, neg_neg, Matrix.mul_assoc]
  have h2 : ((Jm * G * Jm) * (Jm * G * Jm)).trace = (G * G).trace := by
    rw [show Jm * G * Jm * (Jm * G * Jm) = Jm * G * (Jm * Jm) * G * Jm by
      simp only [Matrix.mul_assoc], hJJ, Matrix.mul_neg, Matrix.mul_one, Matrix.neg_mul,
      Matrix.neg_mul, Matrix.trace_neg, Matrix.trace_mul_comm (Jm * G * G) Jm,
      show Jm * (Jm * G * G) = (Jm * Jm) * G * G by simp only [Matrix.mul_assoc], hJJ,
      Matrix.neg_mul, Matrix.neg_mul, Matrix.one_mul, Matrix.trace_neg, neg_neg]
  have hS : tenS f = (G * G).trace := by rw [tenS_eq_trace, hGt]
  have hM : (G + Jm * G * Jm)ᵀ = G + Jm * G * Jm := by rw [Matrix.transpose_add, hGt, hsym]
  have hGa : tenGa f J = 1 / 4 * ((G * G).trace + (G * (Jm * G * Jm)).trace
      + ((Jm * G * Jm) * G).trace + ((Jm * G * Jm) * (Jm * G * Jm)).trace) := by
    rw [tenGa_eq_trace, Matrix.transpose_smul, hM, Matrix.smul_mul, Matrix.mul_smul, smul_smul,
      Matrix.trace_smul, Matrix.add_mul, Matrix.mul_add, Matrix.mul_add, Matrix.trace_add,
      Matrix.trace_add, Matrix.trace_add, smul_eq_mul]
    ring
  rw [hGa, Matrix.trace_mul_comm (Jm * G * Jm) G, h2, hS]
  ring

omit hJ in
/-- `⟨T₁ ⋆ T₂, T₃ ⋆ T₄⟩ = Σ_{e e'} (T₁ᵀT₃)_{e e'} (T₂ᵀT₄)_{e e'}`. -/
lemma ip4_con_con (T₁ T₂ T₃ T₄ : ι → ι → ι → ℝ) :
    ip4 (con T₁ T₂) (con T₃ T₄)
      = ∑ e, ∑ e', (∑ a, ∑ b, T₁ a b e * T₃ a b e') * ∑ c, ∑ d, T₂ c d e * T₄ c d e' := by
  have e1 : ∀ a b c d, con T₁ T₂ a b c d * con T₃ T₄ a b c d
      = ∑ e, ∑ e', (T₁ a b e * T₃ a b e') * (T₂ c d e * T₄ c d e') := fun a b c d => by
    simp only [con, Finset.sum_mul_sum]
    exact Finset.sum_congr rfl fun e _ => Finset.sum_congr rfl fun e' _ => by ring
  simp only [ip4, e1]
  exact sum_factor_222 (fun a b e e' => T₁ a b e * T₃ a b e') (fun c d e e' => T₂ c d e * T₄ c d e')

/-- `‖B‖² = s − 2η`. -/
lemma ip4_B_B [DecidableEq ι] (f : ι → ι → ι → ℝ) :
    ip4 (tenB J f) (tenB J f) = tenS f - 2 * tenGa f J := by
  have h := trace_GJGJ hJ f
  have e2 : ∀ e e', (∑ a, ∑ b, sl₃ J f a b e * sl₃ J f a b e')
      = -(matJ J * matG f * matJ J) e' e := fun e e' => by
    rw [matJGJ_apply]
    simp only [sl₃_apply, Finset.sum_mul_sum]
    rw [swap4 (fun a b p q => (J e p * f a b p) * (J e' q * f a b q))]
    conv_rhs => rw [Finset.sum_comm]
    rw [← Finset.sum_neg_distrib]
    refine Finset.sum_congr rfl fun q _ => ?_
    rw [← Finset.sum_neg_distrib]
    refine Finset.sum_congr rfl fun p _ => ?_
    rw [hJ.anti q e, kerG]
    simp only [Finset.mul_sum, Finset.sum_mul, ← Finset.sum_neg_distrib]
    refine Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => by ring
  have e3 : ip4 (tenB J f) (tenB J f)
      = -∑ e, ∑ e', (matJ J * matG f * matJ J) e' e * kerG f e e' := by
    rw [tenB, ip4_con_con]
    simp only [← Finset.sum_neg_distrib]
    refine Finset.sum_congr rfl fun e _ => Finset.sum_congr rfl fun e' _ => ?_
    rw [e2, neg_mul]; rfl
  have e4 : (matG f * (matJ J * matG f * matJ J)).trace
      = ∑ e, ∑ e', (matJ J * matG f * matJ J) e' e * kerG f e e' := by
    simp only [Matrix.trace, Matrix.diag, Matrix.mul_apply, matG, Matrix.of_apply]
    exact Finset.sum_congr rfl fun e _ => Finset.sum_congr rfl fun e' _ => mul_comm _ _
  rw [e3, ← e4, h]; ring

omit hJ in
lemma der4_K12 (X : T4 ι) : der4 J (sq₁ J (sq₂ J X)) = sq₁ J (sq₂ J (der4 J X)) := by
  simp only [der4_apply, map_add, sq_comm12, sq_comm13, sq_comm14, sq_comm23, sq_comm24]
omit hJ in
lemma der4_K34 (X : T4 ι) : der4 J (sq₃ J (sq₄ J X)) = sq₃ J (sq₄ J (der4 J X)) := by
  simp only [der4_apply, map_add, sq_comm13, sq_comm14, sq_comm23, sq_comm24, sq_comm34]

variable {f g : ι → ι → ι → ℝ} (hf : ∀ a b c, f a b c = f b a c)
  (hdf : der3 J f = -g) (hdg : der3 J g = f)
include hJ hdf hdg

/-- `‖B₂‖² = ‖C₂‖²`. -/
lemma ip4_B2_B2 : ip4 (ch2 J (tenB J f)) (ch2 J (tenB J f))
    = ip4 (ch2 J (con f f)) (ch2 J (con f f)) := by
  -- `‖δB‖²` two ways
  have e34 : ip4 (sq₃ J (sq₄ J (con f f))) (sq₃ J (sq₄ J (con f f))) = ip4 (con f f) (con f f) := by
    rw [ip4_K34 hJ, K34_sq hJ]
  have e12 : ip4 (sq₁ J (sq₂ J (con f f))) (sq₁ J (sq₂ J (con f f))) = ip4 (con f f) (con f f) := by
    rw [ip4_K12 hJ, K12_sq hJ]
  have ex : ip4 (sq₃ J (sq₄ J (con f f))) (sq₁ J (sq₂ J (con f f)))
      = ip4 (con f f) (om4 J (con f f)) := by
    rw [ip4_K34 hJ, ← K12_K34, ← om4_apply]
  have h1 : ip4 (der4 J (tenB J f)) (der4 J (tenB J f))
      = 2 * ip4 (con f f) (con f f) - 2 * ip4 (con f f) (om4 J (con f f)) := by
    rw [der4_B hJ hdf hdg, ip4_sub_left, ip4_sub_right, ip4_sub_right, e34, e12, ex,
      ip4_comm (sq₁ J (sq₂ J (con f f))) (sq₃ J (sq₄ J (con f f))), ex]
    ring
  have hdd : der4 J (der4 J (tenB J f)) = om4 J (tenB J f) - tenB J f - (tenB J f - om4 J (tenB J f)) := by
    rw [der4_B hJ hdf hdg, map_sub, der4_K34, der4_K12, der4_C' hJ hdf hdg, map_sub, map_sub,
      map_sub, map_sub, K34_sq hJ, K12_sq hJ, ← K12_K34, ← om4_apply]
  have h2 : ip4 (der4 J (tenB J f)) (der4 J (tenB J f))
      = 2 * ip4 (tenB J f) (tenB J f) - 2 * ip4 (tenB J f) (om4 J (tenB J f)) := by
    rw [← neg_neg (ip4 (der4 J (tenB J f)) (der4 J (tenB J f))), ← ip4_der4_sq hJ, hdd]
    simp only [ip4_sub_right]
    ring
  rw [ip4_om4_self hJ, ip4_self_ch hJ (con f f)] at h1
  rw [ip4_om4_self hJ, ip4_self_ch hJ (tenB J f)] at h2
  linarith

end squares

/-! ### The charge-zero pair `a = C₀`, `b = B₀`: square-type entries -/

section ab

variable {J : ι → ι → ℝ} (hJ : IsCplx J) {f g : ι → ι → ι → ℝ}
  (hf : ∀ a b c, f a b c = f b a c) (hdf : der3 J f = -g) (hdg : der3 J g = f)

local notation "aC" => ch0 J (con f f)
local notation "bB" => ch0 J (tenB J f)

/-- `⟨X₀, A Y₀⟩ = (⟨X, A Y⟩ + ⟨X, A Ω Y⟩)/2` for `A` linear and commuting with `Ω`. -/
lemma ip4_ch0_op (hJ : IsCplx J) (A : T4 ι → T4 ι) (hA : ∀ Z, A (om4 J Z) = om4 J (A Z))
    (hadd : ∀ Z W, A (Z + W) = A Z + A W) (hsmul : ∀ (r : ℝ) Z, A (r • Z) = r • A Z) (X Y : T4 ι) :
    ip4 (ch0 J X) (A (ch0 J Y)) = (ip4 X (A Y) + ip4 X (A (om4 J Y))) / 2 := by
  have h1 : ip4 (om4 J X) (A Y) = ip4 X (A (om4 J Y)) := by rw [ip4_om4 hJ, hA]
  have h2 : ip4 (om4 J X) (A (om4 J Y)) = ip4 X (A Y) := by rw [ip4_om4 hJ, hA, om4_om4 hJ]
  unfold ch0
  rw [hsmul, hadd, ip4_smul_left, ip4_smul_right, ip4_add_left, ip4_add_right, ip4_add_right, h1, h2]
  ring

omit hJ in
lemma tenS_eq_ip4 : tenS f = ip4 (con f f) (con f f) := by
  rw [tenS_eq_sum_kerC_sq]; simp only [ip4, kerC_eq_con, sq]

include hJ hf hdf hdg

lemma om4_a : om4 J aC = aC := om4_ch0 hJ _
lemma om4_b : om4 J bB = bB := om4_ch0 hJ _
lemma sw12_a : sw12 aC = aC := by rw [← ch0_sw12, sw12_C hf]
lemma sw34_a : sw34 aC = aC := by rw [← ch0_sw34, sw34_C hf]
lemma swP_a : swP aC = aC := by rw [← ch0_swP, swP_C]
lemma sw12_b : sw12 bB = bB := by rw [← ch0_sw12, sw12_B hf]
lemma sw34_b : sw34 bB = bB := by rw [← ch0_sw34, sw34_B hf]
lemma swP_b : swP bB = -bB := by rw [← ch0_swP, swP_B hJ, ch0_neg]

/-- `‖b‖² = ‖a‖² − 2η`. -/
lemma ip4_b_b [DecidableEq ι] : ip4 bB bB = ip4 aC aC - 2 * tenGa f J := by
  have h1 := ip4_self_ch hJ (con f f)
  have h2 := ip4_self_ch hJ (tenB J f)
  have h3 := ip4_B2_B2 hJ hdf hdg
  have h4 := ip4_B_B hJ f
  rw [tenS_eq_ip4] at h4
  linarith

/-- `⟨a, J₁ b⟩ = ⟨a, J₂ b⟩ = (‖a‖² − κ)/2`. -/
lemma ip4_a_J1b : ip4 aC (sq₁ J bB) = (ip4 aC aC - ip4 aC (sq₁ J (sq₂ J aC))) / 2 := by
  have h := congrArg (ip4 aC) (charge_one_ab hJ hf hdf hdg)
  have e : ip4 aC (sq₂ J bB) = ip4 aC (sq₁ J bB) := by
    conv_lhs => rw [← sw12_b hJ hf hdf hdg, ← sw12_sq₁, ← ip4_sw12_adj, sw12_a hJ hf hdf hdg]
  rw [ip4_sub_right, ip4_add_right, e] at h
  linarith

lemma ip4_a_J2b : ip4 aC (sq₂ J bB) = (ip4 aC aC - ip4 aC (sq₁ J (sq₂ J aC))) / 2 := by
  rw [← ip4_a_J1b hJ hf hdf hdg]
  conv_lhs => rw [← sw12_b hJ hf hdf hdg, ← sw12_sq₁, ← ip4_sw12_adj, sw12_a hJ hf hdf hdg]

lemma ip4_a_J3b : ip4 aC (sq₃ J bB) = -((ip4 aC aC - ip4 aC (sq₁ J (sq₂ J aC))) / 2) := by
  rw [← ip4_a_J1b hJ hf hdf hdg, ← ip4_neg_right, ← map_neg, ← swP_b hJ hf hdf hdg, ← swP_sq₃,
    ← ip4_swP_adj, swP_a hJ hf hdf hdg]

lemma ip4_a_J4b : ip4 aC (sq₄ J bB) = -((ip4 aC aC - ip4 aC (sq₁ J (sq₂ J aC))) / 2) := by
  rw [← ip4_a_J2b hJ hf hdf hdg, ← ip4_neg_right, ← map_neg, ← swP_b hJ hf hdf hdg, ← swP_sq₄,
    ← ip4_swP_adj, swP_a hJ hf hdf hdg]

/-- `⟨b, K₁₂ b⟩ = ‖b‖² − ‖a‖² + κ`. -/
lemma ip4_b_K12b : ip4 bB (sq₁ J (sq₂ J bB)) = ip4 bB bB - ip4 aC aC + ip4 aC (sq₁ J (sq₂ J aC)) := by
  have h : ip4 (aC - sq₁ J (sq₂ J aC)) (aC - sq₁ J (sq₂ J aC))
      = ip4 (sq₁ J bB + sq₂ J bB) (sq₁ J bB + sq₂ J bB) := by rw [charge_one_ab hJ hf hdf hdg]
  simp only [ip4_sub_left, ip4_sub_right, ip4_add_left, ip4_add_right, ip4_sq₁ hJ, ip4_sq₂ hJ,
    sq_sq1 hJ, sq_sq2 hJ, map_neg, ip4_neg_right, neg_neg] at h
  simp only [← sq_comm12] at h
  linarith

/-- `⟨a, K₁₃ a⟩ = (‖a‖² − κ)/2`, from `1 = K₁₂ + K₁₃ + K₁₄` and the `3 ↔ 4` symmetry. -/
lemma ip4_a_K13a : ip4 aC (sq₁ J (sq₃ J aC)) = (ip4 aC aC - ip4 aC (sq₁ J (sq₂ J aC))) / 2 := by
  have h := congrArg (ip4 aC) (charge0_sum hJ aC (om4_a hJ hf hdf hdg) (der4_a hJ hdf hdg))
  have e1 : sq₁ J (sq₄ J aC) = sw34 (sq₁ J (sq₃ J aC)) := by
    rw [sw34_sq₁, sw34_sq₃, sw34_a hJ hf hdf hdg]
  have e : ip4 aC (sq₁ J (sq₄ J aC)) = ip4 aC (sq₁ J (sq₃ J aC)) := by
    rw [e1, ← ip4_sw34_adj, sw34_a hJ hf hdf hdg]
  rw [ip4_add_right, ip4_add_right, e] at h
  linarith

lemma ip4_b_K13b : ip4 bB (sq₁ J (sq₃ J bB)) = (ip4 bB bB - ip4 bB (sq₁ J (sq₂ J bB))) / 2 := by
  have h := congrArg (ip4 bB) (charge0_sum hJ bB (om4_b hJ hf hdf hdg) (der4_b hJ hdf hdg))
  have e1 : sq₁ J (sq₄ J bB) = sw34 (sq₁ J (sq₃ J bB)) := by
    rw [sw34_sq₁, sw34_sq₃, sw34_b hJ hf hdf hdg]
  have e : ip4 bB (sq₁ J (sq₄ J bB)) = ip4 bB (sq₁ J (sq₃ J bB)) := by
    rw [e1, ← ip4_sw34_adj, sw34_b hJ hf hdf hdg]
  rw [ip4_add_right, ip4_add_right, e] at h
  linarith

/-- `K₁₂ z = z` for `z = a − J₁ b`. -/
lemma K12_z : sq₁ J (sq₂ J (aC - sq₁ J bB)) = aC - sq₁ J bB := by
  have h := charge_one_ab hJ hf hdf hdg
  have h' : sq₁ J (sq₂ J aC) = aC - (sq₁ J bB + sq₂ J bB) := by rw [← h]; abel
  rw [map_sub, map_sub, sq_comm12 (sq₁ J bB), sq_sq1 hJ, map_neg, sub_neg_eq_add, h']
  abel

/-- `K₁₂ w = w` for `w = a + J₄ b`. -/
lemma K12_w : sq₁ J (sq₂ J (aC + sq₄ J bB)) = aC + sq₄ J bB := by
  have h := charge_one_ab hJ hf hdf hdg
  have h' : sq₁ J (sq₂ J aC) = aC - (sq₁ J bB + sq₂ J bB) := by rw [← h]; abel
  have hd : sq₁ J bB + sq₂ J bB + sq₃ J bB + sq₄ J bB = 0 := der4_b hJ hdf hdg
  have h4 := eq_neg_of_add_eq_zero_right hd
  have h34 : sq₃ J (sq₄ J bB) = sq₁ J (sq₂ J bB) := K34_of_om hJ _ (om4_b hJ hf hdf hdg)
  have e : sq₁ J (sq₂ J (sq₄ J bB)) = -sq₃ J bB := by
    rw [sq_comm24, sq_comm14, ← h34, sq_comm34, sq_sq4 hJ]
  rw [map_add, map_add, h', e, h4]
  abel

/-- `K₁₃ y = y` for `y = a − K₁₂ a`. -/
lemma K13_y : sq₁ J (sq₃ J (aC - sq₁ J (sq₂ J aC))) = aC - sq₁ J (sq₂ J aC) := by
  have h := charge0_sum hJ aC (om4_a hJ hf hdf hdg) (der4_a hJ hdf hdg)
  have h23 : sq₂ J (sq₃ J aC) = sq₁ J (sq₄ J aC) := K23_of_om hJ _ (om4_a hJ hf hdf hdg)
  have e : sq₁ J (sq₃ J (sq₁ J (sq₂ J aC))) = -sq₂ J (sq₃ J aC) := by
    rw [← sq_comm13 (sq₂ J aC), ← sq_comm23, sq_sq1 hJ]
  have h' : aC - sq₁ J (sq₂ J aC) = sq₁ J (sq₃ J aC) + sq₁ J (sq₄ J aC) := by
    rw [sub_eq_iff_eq_add]
    conv_lhs => rw [h]
    abel
  rw [map_sub, map_sub, e, h23, sub_neg_eq_add, h']

end ab

/-! ### Tetrahedral entries -/

section tetra2

variable {J : ι → ι → ℝ} (hJ : IsCplx J) {f g : ι → ι → ι → ℝ}
  (hf : ∀ a b c, f a b c = f b a c) (hg : ∀ a b c, g a b c = g b a c)
  (hf13 : ∀ a b c, f a b c = f c b a) (hdf : der3 J f = -g) (hdg : der3 J g = f)

omit [Fintype ι] in
lemma cQ_eq_ip4 [Fintype ι] : cQ f = ip4 (con f f) (sw23 (con f f)) := rfl

include hJ in
/-- `Q(J₃T, T, T₃, T₄) = 0` for `T₃`, `T₄` symmetric: the `J` on the edge `12` is odd under the
swap of the vertices `1`, `2`. -/
lemma Q4_sl₃_symm (T T₃ T₄ : ι → ι → ι → ℝ) (h3 : ∀ a c y, T₃ c a y = T₃ a c y)
    (h4 : ∀ b d y, T₄ d b y = T₄ b d y) : Q4 (sl₃ J T) T T₃ T₄ = 0 := by
  have h := Q4_swap12 (sl₃ J T) T T₃ T₄
  have e3 : (fun a c y => T₃ c a y) = T₃ := by funext a c y; exact h3 a c y
  have e4 : (fun b d y => T₄ d b y) = T₄ := by funext b d y; exact h4 b d y
  rw [e3, e4] at h
  have h2 := Q4_sl₃ hJ T T T₃ T₄
  linarith

include hf in
/-- The vertex swap: `⟨C, S (J₁ X ⋆ Y)⟩ = ⟨C, S (J₂ X ⋆ Y)⟩` for symmetric `X`, `Y`. -/
lemma ip4_C_sw23_sq₁_sq₂ (X Y : ι → ι → ι → ℝ) (hX : ∀ a b c, X a b c = X b a c)
    (hY : ∀ a b c, Y a b c = Y b a c) :
    ip4 (con f f) (sw23 (sq₁ J (con X Y))) = ip4 (con f f) (sw23 (sq₂ J (con X Y))) := by
  rw [sq₁_con, sq₂_con, ← Q4_eq_ip4, ← Q4_eq_ip4, Q4_swap12]
  congr 1
  · funext a c y; simp only [sl₁_apply, sl₂_apply]
    exact Finset.sum_congr rfl fun p _ => by rw [hX p a]
  · funext b d y; exact hY d b y

include hJ hdf hdg

lemma sl₁_g : sl₁ J g = sl₂ J (sl₃ J f) := by
  have hg' : g = -sl₁ J (sl₂ J (sl₃ J f)) := by rw [sl123_f hJ hdf hdg, neg_neg]
  rw [hg', map_neg, sl_sq1 hJ, neg_neg]

lemma sl₂_g : sl₂ J g = sl₁ J (sl₃ J f) := by
  have hg' : g = -sl₁ J (sl₂ J (sl₃ J f)) := by rw [sl123_f hJ hdf hdg, neg_neg]
  rw [hg', map_neg, ← sl_comm12, sl_sq2 hJ, map_neg, neg_neg]

lemma sl123_g : sl₁ J (sl₂ J (sl₃ J g)) = f := by
  have hgg : der3 J (der3 J g) = -g := by rw [hdg, hdf]
  rw [sl_triple_of_charge_one hJ hgg, hdg]

include hf hf13 in
/-- `Q(g, g, K₁₂ f, f) = Q(f,f,f,f)/3`. -/
lemma Q4_gg_K12 : Q4 g g (sl₁ J (sl₂ J f)) f = Q4 f f f f / 3 := by
  have e1 : Q4 g g (sl₁ J (sl₂ J f)) f = -Q4 (sl₁ J g) g (sl₂ J f) f := by
    rw [Q4_sl₁ hJ, neg_neg]
  have e2 : Q4 (sl₁ J g) g (sl₂ J f) f = -Q4 (sl₁ J g) (sl₁ J g) f f := by
    rw [Q4_sl₁' hJ, neg_neg]
  rw [e1, e2, neg_neg, sl₁_g hJ hdf hdg, Q4_sl₂ hJ, Q4_sl₂' hJ, neg_neg, Q4_sl₃ hJ, sl_sq3 hJ,
    Q4_neg₂, neg_neg, Q4_pairswap, Q4_swap12]
  have e3 : (fun a c y => f c a y) = f := by funext a c y; exact hf c a y
  rw [e3, ← sl_comm12, ← Q4_K12 hJ hf hf13 hdf hdg]
  ring

include hf hf13 in
/-- `Q(K₁₂ g, g, f, f) = Q(f,f,f,f)/3`. -/
lemma Q4_K12g_g : Q4 (sl₁ J (sl₂ J g)) g f f = Q4 f f f f / 3 := by
  have e : sl₁ J (sl₂ J g) = -sl₃ J f := by rw [sl₃_f hJ hdf hdg, neg_neg]
  rw [e, Q4_neg₁, Q4_sl₃ hJ, neg_neg, sl₃_g hJ hdf hdg, Q4_swap12]
  have e3 : (fun a c y => f c a y) = f := by funext a c y; exact hf c a y
  rw [e3, ← Q4_K12 hJ hf hf13 hdf hdg]
  ring

local notation "aC" => ch0 J (con f f)
local notation "bB" => ch0 J (tenB J f)
local notation "qf" => Q4 f f f f

lemma ip4_a_op_a (A : T4 ι → T4 ι) (hA : ∀ Z, A (om4 J Z) = om4 J (A Z))
    (hadd : ∀ Z W, A (Z + W) = A Z + A W) (hsmul : ∀ (r : ℝ) Z, A (r • Z) = r • A Z) :
    ip4 aC (A aC) = (ip4 (con f f) (A (con f f)) + ip4 (con f f) (A (con g g))) / 2 := by
  rw [ip4_ch0_op hJ A hA hadd hsmul, om4_C hJ hdf hdg]

lemma ip4_a_op_b (A : T4 ι → T4 ι) (hA : ∀ Z, A (om4 J Z) = om4 J (A Z))
    (hadd : ∀ Z W, A (Z + W) = A Z + A W) (hsmul : ∀ (r : ℝ) Z, A (r • Z) = r • A Z) :
    ip4 aC (A bB) = (ip4 (con f f) (A (tenB J f)) + ip4 (con f f) (A (con (sl₃ J g) g))) / 2 := by
  rw [ip4_ch0_op hJ A hA hadd hsmul, om4_B hJ hdf hdg]

lemma ip4_b_op_b (A : T4 ι → T4 ι) (hA : ∀ Z, A (om4 J Z) = om4 J (A Z))
    (hadd : ∀ Z W, A (Z + W) = A Z + A W) (hsmul : ∀ (r : ℝ) Z, A (r • Z) = r • A Z) :
    ip4 bB (A bB) = (ip4 (tenB J f) (A (tenB J f)) + ip4 (tenB J f) (A (con (sl₃ J g) g))) / 2 := by
  rw [ip4_ch0_op hJ A hA hadd hsmul, om4_B hJ hdf hdg]

include hf hf13 in
/-- `⟨C, S C_g⟩ = Q/3`. -/
lemma ip4_C_sw23_Cg : ip4 (con f f) (sw23 (con g g)) = qf / 3 := by
  rw [← Q4_eq_ip4, Q4_pairswap, ← Q4_gg hJ hf hf13 hdf hdg]; ring

include hf hf13 in
/-- `⟨C, S (K₁₂ C)⟩ = Q/3`. -/
lemma ip4_C_sw23_K12C : ip4 (con f f) (sw23 (sq₁ J (sq₂ J (con f f)))) = qf / 3 := by
  rw [← ip4_sw23_adj, ip4_comm, sq₂_con, sq₁_con, ← Q4_eq_ip4, ← Q4_K12 hJ hf hf13 hdf hdg]
  ring

include hf hf13 in
/-- `⟨C, S (K₁₂ C_g)⟩ = Q/3`. -/
lemma ip4_C_sw23_K12Cg : ip4 (con f f) (sw23 (sq₁ J (sq₂ J (con g g)))) = qf / 3 := by
  rw [← ip4_sw23_adj, ip4_comm, sq₂_con, sq₁_con, ← Q4_eq_ip4, Q4_K12g_g hJ hf hf13 hdf hdg]

include hf hf13 in
/-- `(t1)`: `⟨a, S a⟩ = (2/3) Q`. -/
lemma ip4_a_sw23_a : ip4 aC (sw23 aC) = 2 / 3 * qf := by
  rw [ip4_a_op_a hJ hdf hdg sw23 (fun Z => (om4_sw23 Z).symm) (fun _ _ => rfl) (fun _ _ => rfl),
    ip4_C_sw23_Cg hJ hf hf13 hdf hdg, ← Q4_eq_ip4]
  ring

include hf hf13 in
/-- `(t2)`: `⟨a, K₁₂ S a⟩ = Q/3`. -/
lemma ip4_a_K12sw23_a : ip4 aC (sq₁ J (sq₂ J (sw23 aC))) = qf / 3 := by
  rw [ip4_a_op_a hJ hdf hdg (fun Z => sq₁ J (sq₂ J (sw23 Z)))
    (fun Z => by simp only [om4_sw23, om4_sq₁, om4_sq₂]) (fun _ _ => by simp only [sw23_add, map_add])
    (fun _ _ => by simp only [sw23_smul, map_smul]), ← ip4_K12 hJ, ← ip4_K12 hJ, sq₂_con,
    sq₁_con, ← Q4_eq_ip4, ← Q4_eq_ip4, Q4_pairswap (sl₁ J (sl₂ J f)) f g g,
    Q4_gg_K12 hJ hf hf13 hdf hdg, ← Q4_K12 hJ hf hf13 hdf hdg]
  ring

include hf hg hf13 in
/-- `(t5)`: `⟨a, S (J₁ b)⟩ = Q/6`. -/
lemma ip4_a_sw23_J1b : ip4 aC (sw23 (sq₁ J bB)) = qf / 6 := by
  rw [ip4_a_op_b hJ hdf hdg (fun Z => sw23 (sq₁ J Z))
    (fun Z => by simp only [om4_sw23, om4_sq₁]) (fun _ _ => by simp only [map_add]; rfl)
    (fun _ _ => by simp only [map_smul]; rfl)]
  -- from the charge-one relation `K₁₂ C = C − J₁ B − J₂ B` and its `Ω`-image
  have hsf : ∀ a b c, sl₃ J f a b c = sl₃ J f b a c := fun a b c => by
    simp only [sl₃_apply]; exact Finset.sum_congr rfl fun p _ => by rw [hf a b]
  have hsg : ∀ a b c, sl₃ J g a b c = sl₃ J g b a c := fun a b c => by
    simp only [sl₃_apply]; exact Finset.sum_congr rfl fun p _ => by rw [hg a b]
  have hK : sq₁ J (sq₂ J (con g g))
      = con g g - sq₁ J (con (sl₃ J g) g) - sq₂ J (con (sl₃ J g) g) := by
    have := congrArg (om4 J) (K12_C hJ hf hdf hdg)
    simpa only [map_sub, om4_sq₁, om4_sq₂, om4_C hJ hdf hdg, om4_B hJ hdf hdg] using this
  have h1 := congrArg (fun Z => ip4 (con f f) (sw23 Z)) (K12_C hJ hf hdf hdg)
  have h2 := congrArg (fun Z => ip4 (con f f) (sw23 Z)) hK
  simp only [sw23_sub, ip4_sub_right] at h1 h2
  rw [ip4_C_sw23_K12C hJ hf hf13 hdf hdg, ← Q4_eq_ip4 f f f f, tenB,
    ip4_C_sw23_sq₁_sq₂ hf (sl₃ J f) f hsf hf] at h1
  rw [ip4_C_sw23_K12Cg hJ hf hf13 hdf hdg, ip4_C_sw23_Cg hJ hf hf13 hdf hdg,
    ip4_C_sw23_sq₁_sq₂ hf (sl₃ J g) g hsg hg] at h2
  rw [tenB, ip4_C_sw23_sq₁_sq₂ hf (sl₃ J f) f hsf hf, ip4_C_sw23_sq₁_sq₂ hf (sl₃ J g) g hsg hg]
  linarith


omit hJ hdf hdg in
/-- The vertex swap on the pairing: `S Y = P (S (sw12 (sw34 Y)))`. -/
lemma sw23_eq_swP (Y : T4 ι) : sw23 Y = swP (sw23 (sw12 (sw34 Y))) := rfl

include hf hg hf13 in
/-- `(t5')`: `⟨a, S (J₂ b)⟩ = Q/6`. -/
lemma ip4_a_sw23_J2b [DecidableEq ι] : ip4 aC (sw23 (sq₂ J bB)) = qf / 6 := by
  rw [← ip4_a_sw23_J1b hJ hf hg hf13 hdf hdg, sw23_eq_swP (sq₂ J bB), ← ip4_swP_adj,
    swP_a hJ hf hdf hdg, sw34_sq₂, sw34_b hJ hf hdf hdg, sw12_sq₂, sw12_b hJ hf hdf hdg]

include hf in
lemma ip4_a_sw23_J3b_eq_J4b [DecidableEq ι] : ip4 aC (sw23 (sq₃ J bB)) = ip4 aC (sw23 (sq₄ J bB)) := by
  rw [sw23_eq_swP (sq₃ J bB), ← ip4_swP_adj, swP_a hJ hf hdf hdg, sw34_sq₃, sw34_b hJ hf hdf hdg,
    sw12_sq₄, sw12_b hJ hf hdf hdg]

include hf hg hf13 in
/-- `⟨a, S (J₃ b)⟩ = ⟨a, S (J₄ b)⟩ = −Q/6`. -/
lemma ip4_a_sw23_J3b [DecidableEq ι] : ip4 aC (sw23 (sq₃ J bB)) = -(qf / 6) := by
  have hd : sq₁ J bB + sq₂ J bB + sq₃ J bB + sq₄ J bB = 0 := der4_b hJ hdf hdg
  have h := congrArg (fun Z => ip4 aC (sw23 Z)) hd
  simp only [sw23_add, ip4_add_right] at h
  rw [ip4_a_sw23_J1b hJ hf hg hf13 hdf hdg, ip4_a_sw23_J2b hJ hf hg hf13 hdf hdg,
    ← ip4_a_sw23_J3b_eq_J4b hJ hf hdf hdg] at h
  have h0 : ip4 aC (sw23 (0 : T4 ι)) = 0 := by simp [ip4, sw23]
  linarith

include hf hg hf13 in
lemma ip4_a_sw23_J4b [DecidableEq ι] : ip4 aC (sw23 (sq₄ J bB)) = -(qf / 6) := by
  rw [← ip4_a_sw23_J3b_eq_J4b hJ hf hdf hdg, ip4_a_sw23_J3b hJ hf hg hf13 hdf hdg]

include hf hg in
/-- `(t6)`: `⟨b, S b⟩ = 0`. -/
lemma ip4_b_sw23_b : ip4 bB (sw23 bB) = 0 := by
  have hsg : ∀ a c y, sl₃ J g c a y = sl₃ J g a c y := fun a c y => by
    simp only [sl₃_apply]; exact Finset.sum_congr rfl fun p _ => by rw [hg c a]
  rw [ip4_b_op_b hJ hdf hdg sw23 (fun Z => (om4_sw23 Z).symm) (fun _ _ => rfl) (fun _ _ => rfl),
    tenB, ← Q4_eq_ip4, ← Q4_eq_ip4, Q4_sl₃_sl₃ hJ hf, Q4_sl₃_symm hJ f (sl₃ J g) g hsg
      (fun b d y => hg d b y)]
  ring

include hf hg in
/-- `⟨b, S (K₁₂ b)⟩ = 0`. -/
lemma ip4_b_sw23_K12b : ip4 bB (sw23 (sq₁ J (sq₂ J bB))) = 0 := by
  rw [ip4_b_op_b hJ hdf hdg (fun Z => sw23 (sq₁ J (sq₂ J Z)))
    (fun Z => by simp only [om4_sw23, om4_sq₁, om4_sq₂]) (fun _ _ => by simp only [map_add]; rfl)
    (fun _ _ => by simp only [map_smul]; rfl), tenB, sq₂_con, sq₁_con, sq₂_con, sq₁_con,
    sl123_f hJ hdf hdg, sl123_g hJ hdf hdg, con_neg_left, sw23_neg, ip4_neg_right, ← Q4_eq_ip4,
    ← Q4_eq_ip4, Q4_sl₃_symm hJ f g f (fun a c y => hg c a y) (fun b d y => hf d b y),
    Q4_sl₃_symm hJ f f g (fun a c y => hf c a y) (fun b d y => hg d b y)]
  ring

include hf hg in
/-- `⟨b, S (K₁₃ b)⟩ = 0`. -/
lemma ip4_b_sw23_K13b : ip4 bB (sw23 (sq₁ J (sq₃ J bB))) = 0 := by
  rw [ip4_b_op_b hJ hdf hdg (fun Z => sw23 (sq₁ J (sq₃ J Z)))
    (fun Z => by simp only [om4_sw23, om4_sq₁, om4_sq₃]) (fun _ _ => by simp only [map_add]; rfl)
    (fun _ _ => by simp only [map_smul]; rfl), tenB, sq₃_con, sq₁_con, sq₃_con, sq₁_con,
    ← Q4_eq_ip4, ← Q4_eq_ip4]
  have e1 : Q4 (sl₃ J f) f (sl₁ J (sl₃ J f)) (sl₁ J f) = 0 := by
    have h1 := Q4_sl₁ hJ (sl₃ J f) f (sl₃ J f) (sl₁ J f)
    have h2 := Q4_sl₂ hJ (sl₁ J (sl₃ J f)) f (sl₃ J f) f
    rw [← sl_comm12, sl123_f hJ hdf hdg, Q4_neg₁, Q4_pairswap,
      Q4_sl₃_symm hJ f g f (fun a c y => hg c a y) (fun b d y => hf d b y)] at h2
    linarith
  have e2 : Q4 (sl₃ J f) f (sl₁ J (sl₃ J g)) (sl₁ J g) = 0 := by
    have h1 := Q4_sl₁ hJ (sl₃ J f) f (sl₃ J g) (sl₁ J g)
    have h2 := Q4_sl₂ hJ (sl₁ J (sl₃ J f)) f (sl₃ J g) g
    rw [← sl_comm12, sl123_f hJ hdf hdg, Q4_neg₁, Q4_pairswap,
      Q4_sl₃_symm hJ g g f (fun a c y => hg c a y) (fun b d y => hf d b y)] at h2
    linarith
  rw [e1, e2]; ring

include hf hg hf13 in
/-- `⟨b, S (K₁₄ b)⟩ = 0`. -/
lemma ip4_b_sw23_K14b : ip4 bB (sw23 (sq₁ J (sq₄ J bB))) = 0 := by
  have h := charge0_sum hJ bB (om4_b hJ hf hdf hdg) (der4_b hJ hdf hdg)
  have e : sq₁ J (sq₄ J bB) = bB - sq₁ J (sq₂ J bB) - sq₁ J (sq₃ J bB) := by
    rw [sub_sub, eq_sub_iff_add_eq, add_comm]; exact h.symm
  rw [e, sw23_sub, sw23_sub, ip4_sub_right, ip4_sub_right, ip4_b_sw23_b hJ hf hg hdf hdg,
    ip4_b_sw23_K12b hJ hf hg hdf hdg, ip4_b_sw23_K13b hJ hf hg hdf hdg]
  ring

end tetra2

/-! ### Assembly: the two sums of squares -/

section assembly

variable {J : ι → ι → ℝ} (hJ : IsCplx J) {f g : ι → ι → ι → ℝ}
  (hf : ∀ a b c, f a b c = f b a c) (hg : ∀ a b c, g a b c = g b a c)
  (hf13 : ∀ a b c, f a b c = f c b a) (hdf : der3 J f = -g) (hdg : der3 J g = f)

omit [Fintype ι] in
lemma sw14_sw23_eq (X : T4 ι) : sw14 (sw23 X) = sw12 (sw34 (swP X)) := rfl
omit [Fintype ι] in
lemma sw23_sw24_eq (X : T4 ι) : sw23 (sw24 X) = sw34 (sw23 X) := rfl
lemma sw23_K12 (X : T4 ι) : sw23 (sq₁ J (sq₂ J X)) = sq₁ J (sq₃ J (sw23 X)) := by
  rw [sw23_sq₁, sw23_sq₂]
lemma sw23_K13 (X : T4 ι) : sw23 (sq₁ J (sq₃ J X)) = sq₁ J (sq₂ J (sw23 X)) := by
  rw [sw23_sq₁, sw23_sq₃]
lemma sw23_K14 (X : T4 ι) : sw23 (sq₁ J (sq₄ J X)) = sq₁ J (sq₄ J (sw23 X)) := by
  rw [sw23_sq₁, sw23_sq₄]
lemma K12_K13_comm (X : T4 ι) : sq₁ J (sq₂ J (sq₁ J (sq₃ J X))) = sq₁ J (sq₃ J (sq₁ J (sq₂ J X))) := by
  rw [← sq_comm12 (sq₃ J X), ← sq_comm13 (sq₂ J X), sq_comm23]

/-- `⟨X, S Y⟩`-type trivial swap: `⟨J₁ X, S Y⟩ = ⟨Y, S (J₁ X)⟩`. -/
lemma ip4_sw23_swap (X Y : T4 ι) : ip4 X (sw23 Y) = ip4 Y (sw23 X) := by
  rw [← ip4_sw23_adj, ip4_comm]

include hJ

lemma ip4_ch2_op (A : T4 ι → T4 ι) (hA : ∀ Z, A (om4 J Z) = om4 J (A Z))
    (hsub : ∀ Z W, A (Z - W) = A Z - A W)
    (hsmul : ∀ (r : ℝ) Z, A (r • Z) = r • A Z) (X Y : T4 ι) :
    ip4 (ch2 J X) (A (ch2 J Y)) = (ip4 X (A Y) - ip4 X (A (om4 J Y))) / 2 := by
  have h1 : ip4 (om4 J X) (A Y) = ip4 X (A (om4 J Y)) := by rw [ip4_om4 hJ, hA]
  have h2 : ip4 (om4 J X) (A (om4 J Y)) = ip4 X (A Y) := by rw [ip4_om4 hJ, hA, om4_om4 hJ]
  unfold ch2
  rw [hsmul, hsub, ip4_smul_left, ip4_smul_right, ip4_sub_left, ip4_sub_right, ip4_sub_right, h1, h2]
  ring

omit hJ in
lemma ch2_sq₁ (X : T4 ι) : ch2 J (sq₁ J X) = sq₁ J (ch2 J X) := by
  unfold ch2; rw [map_smul, map_sub, om4_sq₁]
omit hJ in
lemma ch2_sq₂ (X : T4 ι) : ch2 J (sq₂ J X) = sq₂ J (ch2 J X) := by
  unfold ch2; rw [map_smul, map_sub, om4_sq₂]
omit hJ in
lemma ch2_swP (X : T4 ι) : ch2 J (swP X) = swP (ch2 J X) := by
  unfold ch2; rw [om4_swP, swP_smul, swP_sub]
omit hJ in
lemma ch2_neg (X : T4 ι) : ch2 J (-X) = -ch2 J X := by
  unfold ch2; rw [map_neg]; module

/-- `⟨Y, K₁₂ Y⟩ = 0` for a charge-`±2` tensor with `⟨Y, K₃₄ Y⟩ = ⟨Y, K₁₂ Y⟩`. -/
lemma ip4_K12_charge2 (Y : T4 ι) (hY : om4 J Y = -Y)
    (hs : ip4 Y (sq₃ J (sq₄ J Y)) = ip4 Y (sq₁ J (sq₂ J Y))) : ip4 Y (sq₁ J (sq₂ J Y)) = 0 := by
  have e : sq₃ J (sq₄ J Y) = -sq₁ J (sq₂ J Y) := by
    have h := om4_K34 hJ Y
    rw [om4_sq₃, om4_sq₄, hY, map_neg, map_neg] at h
    rw [← h, neg_neg]
  rw [e, ip4_neg_right] at hs
  linarith

lemma ip4_K34_eq_K12_of_swP (Y : T4 ι) (hs : swP Y = Y ∨ swP Y = -Y) :
    ip4 Y (sq₃ J (sq₄ J Y)) = ip4 Y (sq₁ J (sq₂ J Y)) := by
  have e : sq₃ J (sq₄ J Y) = swP (sq₁ J (sq₂ J (swP Y))) := by rw [swP_sq₁, swP_sq₂, swP_swP]
  rw [e, ← ip4_swP_adj]
  rcases hs with h | h
  · rw [h]
  · rw [h, map_neg, map_neg, ip4_neg_left, ip4_neg_right, neg_neg]

include hf hg hf13 hdf hdg

local notation "aC" => ch0 J (con f f)
local notation "bB" => ch0 J (tenB J f)
local notation "qf" => Q4 f f f f
local notation "zz" => ch0 J (con f f) - sq₁ J (ch0 J (tenB J f))
local notation "ww" => ch0 J (con f f) + sq₄ J (ch0 J (tenB J f))
local notation "vv" => ch0 J (con f f) + sq₃ J (ch0 J (tenB J f))
local notation "yy" => ch0 J (con f f) - sq₁ J (sq₂ J (ch0 J (con f f)))

lemma om4_w : om4 J ww = ww := by
  rw [map_add, om4_sq₄, om4_a hJ hf hdf hdg, om4_b hJ hf hdf hdg]
lemma om4_z : om4 J zz = zz := by
  rw [map_sub, om4_sq₁, om4_a hJ hf hdf hdg, om4_b hJ hf hdf hdg]

lemma K13_sq₁b : sq₁ J (sq₃ J (sq₁ J bB)) = -sq₃ J bB := by rw [← sq_comm13, sq_sq1 hJ]
lemma K13_sq₂b : sq₁ J (sq₃ J (sq₂ J bB)) = -sq₄ J bB := by
  rw [← K24_of_om hJ (sq₂ J bB) (by rw [om4_sq₂, om4_b hJ hf hdf hdg]), sq_comm24, sq_sq2 hJ, map_neg]
lemma K13_sq₃b : sq₁ J (sq₃ J (sq₃ J bB)) = -sq₁ J bB := by rw [sq_sq3 hJ, map_neg]
lemma K13_sq₄b : sq₁ J (sq₃ J (sq₄ J bB)) = -sq₂ J bB := by
  rw [← K24_of_om hJ (sq₄ J bB) (by rw [om4_sq₄, om4_b hJ hf hdf hdg]), sq_sq4 hJ, map_neg]
lemma K13_z : sq₁ J (sq₃ J zz) = sq₁ J (sq₃ J aC) + sq₃ J bB := by
  rw [map_sub, map_sub, K13_sq₁b hJ hf hg hf13 hdf hdg, sub_neg_eq_add]
lemma K13_w : sq₁ J (sq₃ J ww) = sq₁ J (sq₃ J aC) - sq₂ J bB := by
  rw [map_add, map_add, K13_sq₄b hJ hf hg hf13 hdf hdg, ← sub_eq_add_neg]
lemma K14_y : sq₁ J (sq₄ J yy) = yy := by
  have h := charge0_sum hJ aC (om4_a hJ hf hdf hdg) (der4_a hJ hdf hdg)
  have h24 : sq₂ J (sq₄ J aC) = sq₁ J (sq₃ J aC) := K24_of_om hJ _ (om4_a hJ hf hdf hdg)
  have e : sq₁ J (sq₄ J (sq₁ J (sq₂ J aC))) = -sq₂ J (sq₄ J aC) := by
    rw [← sq_comm14 (sq₂ J aC), ← sq_comm24, sq_sq1 hJ]
  have h' : aC - sq₁ J (sq₂ J aC) = sq₁ J (sq₃ J aC) + sq₁ J (sq₄ J aC) := by
    rw [sub_eq_iff_eq_add]
    conv_lhs => rw [h]
    abel
  rw [map_sub, map_sub, e, h24, sub_neg_eq_add, h', add_comm]
lemma sw12_y : sw12 yy = yy := by
  rw [sw12_sub, sw12_sq₁, sw12_sq₂, sw12_a hJ hf hdf hdg, sq_comm12]
lemma sw12_z : sw12 zz = aC - sq₂ J bB := by
  rw [sw12_sub, sw12_sq₁, sw12_a hJ hf hdf hdg, sw12_b hJ hf hdf hdg]
lemma sw12_w : sw12 ww = ww := by
  rw [sw12_add, sw12_sq₄, sw12_a hJ hf hdf hdg, sw12_b hJ hf hdf hdg]
lemma sw34_z : sw34 zz = zz := by
  rw [sw34_sub, sw34_sq₁, sw34_a hJ hf hdf hdg, sw34_b hJ hf hdf hdg]
lemma sw34_w : sw34 ww = vv := by
  rw [sw34_add, sw34_sq₄, sw34_a hJ hf hdf hdg, sw34_b hJ hf hdf hdg]
lemma swP_z : swP zz = vv := by
  rw [swP_sub, swP_sq₁, swP_a hJ hf hdf hdg, swP_b hJ hf hdf hdg, map_neg, sub_neg_eq_add]
lemma sw14_z : sw14 zz = sw23 ww := by
  rw [sw14_eq, swP_z hJ hf hg hf13 hdf hdg, sw34_add, sw34_sq₃, sw34_a hJ hf hdf hdg,
    sw34_b hJ hf hdf hdg, sw12_w hJ hf hg hf13 hdf hdg]

local notation "x₁" => (1 / 2 : ℝ) • (ch0 J (con f f) - sq₁ J (ch0 J (tenB J f))
  + sq₁ J (sq₃ J (ch0 J (con f f) - sq₁ J (ch0 J (tenB J f)))))

lemma sw14_x₁ : sw14 x₁ = (1 / 2 : ℝ) • sw23 (ww + sq₁ J (sq₃ J ww)) := by
  rw [sw14_smul, sw14_add, sw14_sq₁, sw14_sq₃, sw14_z hJ hf hg hf13 hdf hdg, ← sq_comm34,
    ← sw23_sq₄, ← sw23_sq₂, K24_of_om hJ _ (om4_w hJ hf hg hf13 hdf hdg)]
  simp only [sw23_add]

lemma sw14_sw23_x₁ : sw14 (sw23 x₁) = (1 / 2 : ℝ) • (ww + sq₁ J (sq₃ J ww)) := by
  rw [sw14_sw23_eq, swP_smul, swP_add, swP_sq₁, swP_sq₃, swP_z hJ hf hg hf13 hdf hdg, sw34_smul,
    sw34_add, sw34_sq₃, sw34_sq₁, sw34_add, sw34_sq₃, sw34_a hJ hf hdf hdg, sw34_b hJ hf hdf hdg,
    sw12_smul, sw12_add, sw12_sq₄, sw12_sq₁, sw12_w hJ hf hg hf13 hdf hdg, ← sq_comm24,
    K24_of_om hJ _ (om4_w hJ hf hg hf13 hdf hdg)]

lemma sw34_x₁ : sw34 x₁ = (1 / 2 : ℝ) • (zz + sq₁ J (sq₄ J zz)) := by
  rw [sw34_smul, sw34_add, sw34_sq₁, sw34_sq₃, sw34_z hJ hf hg hf13 hdf hdg]

omit hJ hf hg hf13 hdf hdg in
lemma sw24_x₁ : sw24 x₁ = (1 / 2 : ℝ) • (sw24 zz + sq₁ J (sq₃ J (sw24 zz))) := by
  rw [sw24_smul, sw24_add, sw24_sq₁, sw24_sq₃]

/-- `⟨y, sw24 Y⟩ = ⟨y, S (sw12 (sw34 (P (sw12 Y))))⟩`. -/
lemma ip4_y_sw24 (Y : T4 ι) : ip4 yy (sw24 Y) = ip4 yy (sw23 (sw12 (sw34 (swP (sw12 Y))))) := by
  rw [sw24_eq, ← ip4_sw12_adj, sw12_y hJ hf hg hf13 hdf hdg, sw14_eq]

/-! The square-type entries of `x₁`. -/

lemma ip4_x₁_x₁ [DecidableEq ι] :
    ip4 x₁ x₁ = (ip4 aC (sq₁ J (sq₂ J aC)) + ip4 aC aC) / 2 - tenGa f J := by
  have hγ := ip4_a_J1b hJ hf hdf hdg
  have hγ3 := ip4_a_J3b hJ hf hdf hdg
  have hβ₀ := ip4_b_b hJ hf hdf hdg
  have hβ₁ := ip4_b_K12b hJ hf hdf hdg
  have h13 := ip4_a_K13a hJ hf hdf hdg
  have hb13 := ip4_b_K13b hJ hf hdf hdg
  have f4 : ip4 (sq₁ J bB) (sq₁ J bB) = ip4 bB bB := by
    rw [ip4_sq₁ hJ, sq_sq1 hJ, ip4_neg_right, neg_neg]
  have f9 : ip4 (sq₃ J bB) (sq₃ J bB) = ip4 bB bB := by
    rw [ip4_sq₃ hJ, sq_sq3 hJ, ip4_neg_right, neg_neg]
  have f7 : ip4 (sq₁ J (sq₃ J aC)) (sq₁ J (sq₃ J aC)) = ip4 aC aC := by rw [ip4_K13 hJ, K13_sq hJ]
  have f5 : ip4 (sq₁ J bB) (sq₁ J (sq₃ J aC)) = -ip4 aC (sq₃ J bB) := by
    rw [← ip4_K13 hJ, K13_sq₁b hJ hf hg hf13 hdf hdg, ip4_neg_left, ip4_comm]
  have f5' : ip4 (sq₁ J (sq₃ J aC)) (sq₁ J bB) = -ip4 aC (sq₃ J bB) := by rw [ip4_comm, f5]
  have f6 : ip4 (sq₁ J bB) (sq₃ J bB) = -ip4 bB (sq₁ J (sq₃ J bB)) := by rw [ip4_sq₁ hJ]
  have f6' : ip4 (sq₃ J bB) (sq₁ J bB) = -ip4 bB (sq₁ J (sq₃ J bB)) := by rw [ip4_comm, f6]
  have f8 : ip4 (sq₁ J (sq₃ J aC)) (sq₃ J bB) = -ip4 aC (sq₁ J bB) := by
    rw [ip4_K13 hJ, K13_sq₃b hJ hf hg hf13 hdf hdg, ip4_neg_right]
  have f8' : ip4 (sq₃ J bB) (sq₁ J (sq₃ J aC)) = -ip4 aC (sq₁ J bB) := by rw [ip4_comm, f8]
  have c1 : ip4 (sq₁ J bB) aC = ip4 aC (sq₁ J bB) := ip4_comm _ _
  have c2 : ip4 (sq₁ J (sq₃ J aC)) aC = ip4 aC (sq₁ J (sq₃ J aC)) := ip4_comm _ _
  have c3 : ip4 (sq₃ J bB) aC = ip4 aC (sq₃ J bB) := ip4_comm _ _
  rw [K13_z hJ hf hg hf13 hdf hdg]
  simp only [ip4_smul_left, ip4_smul_right, ip4_add_left, ip4_add_right, ip4_sub_left, ip4_sub_right]
  linarith

lemma ip4_x₁_sw14sw23_x₁ [DecidableEq ι] : ip4 x₁ (sw14 (sw23 x₁)) = tenGa f J := by
  have hγ := ip4_a_J1b hJ hf hdf hdg
  have hγ2 := ip4_a_J2b hJ hf hdf hdg
  have hγ3 := ip4_a_J3b hJ hf hdf hdg
  have hγ4 := ip4_a_J4b hJ hf hdf hdg
  have hβ₀ := ip4_b_b hJ hf hdf hdg
  have hβ₁ := ip4_b_K12b hJ hf hdf hdg
  have h13 := ip4_a_K13a hJ hf hdf hdg
  have hb13 := ip4_b_K13b hJ hf hdf hdg
  have hb14 : ip4 bB (sq₁ J (sq₄ J bB)) = ip4 bB (sq₁ J (sq₃ J bB)) := by
    have e1 : sq₁ J (sq₄ J bB) = sw34 (sq₁ J (sq₃ J bB)) := by
      rw [sw34_sq₁, sw34_sq₃, sw34_b hJ hf hdf hdg]
    rw [e1, ← ip4_sw34_adj, sw34_b hJ hf hdf hdg]
  have hob := om4_b hJ hf hdf hdg
  have f1 : ip4 (sq₁ J bB) (sq₄ J bB) = -ip4 bB (sq₁ J (sq₄ J bB)) := by rw [ip4_sq₁ hJ]
  have f2 : ip4 (sq₁ J bB) (sq₂ J bB) = -ip4 bB (sq₁ J (sq₂ J bB)) := by rw [ip4_sq₁ hJ]
  have f3 : ip4 (sq₁ J bB) (sq₁ J (sq₃ J aC)) = -ip4 aC (sq₃ J bB) := by
    rw [← ip4_K13 hJ, K13_sq₁b hJ hf hg hf13 hdf hdg, ip4_neg_left, ip4_comm]
  have f4 : ip4 (sq₁ J (sq₃ J aC)) (sq₄ J bB) = -ip4 aC (sq₂ J bB) := by
    rw [ip4_K13 hJ, K13_sq₄b hJ hf hg hf13 hdf hdg, ip4_neg_right]
  have f5 : ip4 (sq₃ J bB) (sq₄ J bB) = -ip4 bB (sq₁ J (sq₂ J bB)) := by
    rw [ip4_sq₃ hJ, K34_of_om hJ _ hob]
  have f6 : ip4 (sq₃ J bB) (sq₂ J bB) = -ip4 bB (sq₁ J (sq₄ J bB)) := by
    rw [ip4_sq₃ hJ, ← sq_comm23, K23_of_om hJ _ hob]
  have f7 : ip4 (sq₃ J bB) (sq₁ J (sq₃ J aC)) = -ip4 aC (sq₁ J bB) := by
    rw [← ip4_K13 hJ, K13_sq₃b hJ hf hg hf13 hdf hdg, ip4_neg_left, ip4_comm]
  have f8 : ip4 (sq₁ J (sq₃ J aC)) (sq₂ J bB) = -ip4 aC (sq₄ J bB) := by
    rw [ip4_K13 hJ, K13_sq₂b hJ hf hg hf13 hdf hdg, ip4_neg_right]
  have f9 : ip4 (sq₁ J (sq₃ J aC)) (sq₁ J (sq₃ J aC)) = ip4 aC aC := by rw [ip4_K13 hJ, K13_sq hJ]
  have c1 : ip4 (sq₁ J bB) aC = ip4 aC (sq₁ J bB) := ip4_comm _ _
  have c2 : ip4 (sq₁ J (sq₃ J aC)) aC = ip4 aC (sq₁ J (sq₃ J aC)) := ip4_comm _ _
  have c3 : ip4 (sq₃ J bB) aC = ip4 aC (sq₃ J bB) := ip4_comm _ _
  rw [sw14_sw23_x₁ hJ hf hg hf13 hdf hdg, K13_z hJ hf hg hf13 hdf hdg, K13_w hJ hf hg hf13 hdf hdg]
  simp only [ip4_smul_left, ip4_smul_right, ip4_add_left, ip4_add_right, ip4_sub_left, ip4_sub_right]
  linarith

/-! The tetrahedral entries of `x₁` and `y`. -/

omit hJ hf hg hf13 hdf hdg in
/-- `⟨J₁ X, S Y⟩`-type reductions. -/
lemma ip4_sq₁b_sw23 (Y : T4 ι) : ip4 (sq₁ J bB) (sw23 Y) = ip4 Y (sw23 (sq₁ J bB)) := ip4_sw23_swap _ _

lemma ip4_z_sw23_z [DecidableEq ι] : ip4 zz (sw23 zz) = qf / 3 := by
  have t1 := ip4_a_sw23_a hJ hf hf13 hdf hdg
  have t5 := ip4_a_sw23_J1b hJ hf hg hf13 hdf hdg
  have t6 := ip4_b_sw23_b hJ hf hg hdf hdg
  have e : ip4 (sq₁ J bB) (sw23 (sq₁ J bB)) = ip4 bB (sw23 bB) := by
    rw [ip4_sq₁ hJ, ← sw23_sq₁, sq_sq1 hJ, sw23_neg, ip4_neg_right, neg_neg]
  rw [sw23_sub, ip4_sub_left, ip4_sub_right, ip4_sub_right, ip4_sq₁b_sw23, e, t1, t5, t6]
  ring

lemma ip4_x₁_sw23_x₁ [DecidableEq ι] : ip4 x₁ (sw23 x₁) = qf / 3 := by
  have hz := K12_z hJ hf hdf hdg
  have t2 : ip4 zz (sq₁ J (sq₂ J (sw23 zz))) = ip4 zz (sw23 zz) := by rw [← ip4_K12 hJ, hz]
  have t3 : ip4 (sq₁ J (sq₃ J zz)) (sw23 zz) = ip4 zz (sw23 zz) := by
    rw [ip4_K13 hJ, ← sw23_K12, hz]
  have t4 : ip4 (sq₁ J (sq₃ J zz)) (sq₁ J (sq₂ J (sw23 zz))) = ip4 zz (sw23 zz) := by
    rw [← ip4_K12 hJ, K12_K13_comm, hz, t3]
  rw [sw23_smul, sw23_add, sw23_K13]
  simp only [ip4_smul_left, ip4_smul_right, ip4_add_left, ip4_add_right]
  rw [t2, t3, t4, ip4_z_sw23_z hJ hf hg hf13 hdf hdg]
  ring

lemma ip4_z_sw23_w [DecidableEq ι] : ip4 zz (sw23 ww) = qf / 3 := by
  have t1 := ip4_a_sw23_a hJ hf hf13 hdf hdg
  have t5 := ip4_a_sw23_J1b hJ hf hg hf13 hdf hdg
  have t5' := ip4_a_sw23_J4b hJ hf hg hf13 hdf hdg
  have t6 := ip4_b_sw23_K14b hJ hf hg hf13 hdf hdg
  have e : ip4 (sq₁ J bB) (sw23 (sq₄ J bB)) = -ip4 bB (sw23 (sq₁ J (sq₄ J bB))) := by
    rw [ip4_sq₁ hJ, ← sw23_sq₁]
  rw [sw23_add, ip4_sub_left, ip4_add_right, ip4_add_right, ip4_sq₁b_sw23 aC, e, t1, t5, t5', t6]
  ring

lemma ip4_x₁_sw14_x₁ [DecidableEq ι] : ip4 x₁ (sw14 x₁) = qf / 3 := by
  have hz := K12_z hJ hf hdf hdg
  have hw := K12_w hJ hf hdf hdg
  have t2 : ip4 zz (sq₁ J (sq₂ J (sw23 ww))) = ip4 zz (sw23 ww) := by rw [← ip4_K12 hJ, hz]
  have t3 : ip4 (sq₁ J (sq₃ J zz)) (sw23 ww) = ip4 zz (sw23 ww) := by
    rw [ip4_K13 hJ, ← sw23_K12, hw]
  have t4 : ip4 (sq₁ J (sq₃ J zz)) (sq₁ J (sq₂ J (sw23 ww))) = ip4 zz (sw23 ww) := by
    rw [← ip4_K12 hJ, K12_K13_comm, hz, t3]
  rw [sw14_x₁ hJ hf hg hf13 hdf hdg, sw23_add, sw23_K13]
  simp only [ip4_smul_left, ip4_smul_right, ip4_add_left, ip4_add_right]
  rw [t2, t3, t4, ip4_z_sw23_w hJ hf hg hf13 hdf hdg]
  ring

lemma ip4_y_y : ip4 yy yy = 2 * ip4 aC aC - 2 * ip4 aC (sq₁ J (sq₂ J aC)) := by
  have e1 : ip4 (sq₁ J (sq₂ J aC)) aC = ip4 aC (sq₁ J (sq₂ J aC)) := ip4_comm _ _
  have e2 : ip4 (sq₁ J (sq₂ J aC)) (sq₁ J (sq₂ J aC)) = ip4 aC aC := by rw [ip4_K12 hJ, K12_sq hJ]
  simp only [ip4_sub_left, ip4_sub_right]
  linarith

lemma ip4_y_sw23_z [DecidableEq ι] : ip4 yy (sw23 zz) = qf / 3 := by
  have t1 := ip4_a_sw23_a hJ hf hf13 hdf hdg
  have t2 := ip4_a_K12sw23_a hJ hf hf13 hdf hdg
  have t5 := ip4_a_sw23_J1b hJ hf hg hf13 hdf hdg
  have t5' := ip4_a_sw23_J3b hJ hf hg hf13 hdf hdg
  have e1 : ip4 (sq₁ J (sq₂ J aC)) (sw23 aC) = ip4 aC (sq₁ J (sq₂ J (sw23 aC))) := ip4_K12 hJ _ _
  have e2 : ip4 (sq₁ J (sq₂ J aC)) (sw23 (sq₁ J bB)) = -ip4 aC (sw23 (sq₃ J bB)) := by
    rw [ip4_K12 hJ, ← sw23_K13, K13_sq₁b hJ hf hg hf13 hdf hdg, sw23_neg, ip4_neg_right]
  rw [sw23_sub, ip4_sub_left, ip4_sub_right, ip4_sub_right, e1, e2, t1, t2, t5, t5']
  ring

lemma ip4_y_sw23_v [DecidableEq ι] : ip4 yy (sw23 vv) = qf / 3 := by
  have t1 := ip4_a_sw23_a hJ hf hf13 hdf hdg
  have t2 := ip4_a_K12sw23_a hJ hf hf13 hdf hdg
  have t5 := ip4_a_sw23_J1b hJ hf hg hf13 hdf hdg
  have t5' := ip4_a_sw23_J3b hJ hf hg hf13 hdf hdg
  have e1 : ip4 (sq₁ J (sq₂ J aC)) (sw23 aC) = ip4 aC (sq₁ J (sq₂ J (sw23 aC))) := ip4_K12 hJ _ _
  have e2 : ip4 (sq₁ J (sq₂ J aC)) (sw23 (sq₃ J bB)) = -ip4 aC (sw23 (sq₁ J bB)) := by
    rw [ip4_K12 hJ, ← sw23_K13, K13_sq₃b hJ hf hg hf13 hdf hdg, sw23_neg, ip4_neg_right]
  rw [sw23_add, ip4_sub_left, ip4_add_right, ip4_add_right, e1, e2, t1, t2, t5, t5']
  ring

lemma ip4_sw24y_x₁ [DecidableEq ι] : ip4 (sw24 yy) x₁ = qf / 3 := by
  have hy := K13_y hJ hf hdf hdg
  rw [ip4_sw24_adj, sw24_x₁, ip4_smul_right, ip4_add_right, ← ip4_K13 hJ, hy,
    ip4_y_sw24 hJ hf hg hf13 hdf hdg, sw12_z hJ hf hg hf13 hdf hdg, swP_sub, swP_sq₂,
    swP_a hJ hf hdf hdg, swP_b hJ hf hdf hdg, map_neg, sub_neg_eq_add, sw34_add, sw34_sq₄,
    sw34_a hJ hf hdf hdg, sw34_b hJ hf hdf hdg, sw12_add, sw12_sq₃, sw12_a hJ hf hdf hdg,
    sw12_b hJ hf hdf hdg, ip4_y_sw23_v hJ hf hg hf13 hdf hdg]
  ring

lemma ip4_sw24y_sw23x₁ [DecidableEq ι] : ip4 (sw24 yy) (sw23 x₁) = qf / 3 := by
  have hy := K14_y hJ hf hg hf13 hdf hdg
  rw [← ip4_sw23_adj, sw23_sw24_eq, ip4_sw34_adj, ip4_sw23_adj, sw34_x₁ hJ hf hg hf13 hdf hdg,
    sw23_smul, sw23_add, sw23_K14, ip4_smul_right, ip4_add_right, ← ip4_K14 hJ, hy,
    ip4_y_sw23_z hJ hf hg hf13 hdf hdg]
  ring

lemma ip4_sw24y_sw14x₁ [DecidableEq ι] : ip4 (sw24 yy) (sw14 x₁) = qf / 3 := by
  have hy := K14_y hJ hf hg hf13 hdf hdg
  have e : sq₁ J (sq₃ J (sw34 (sw23 yy))) = sw34 (sw23 yy) := by
    rw [← sw34_sq₄, ← sw34_sq₁, ← sw23_K14, hy]
  rw [sw14_x₁ hJ hf hg hf13 hdf hdg, ip4_smul_right, ← ip4_sw23_adj, sw23_sw24_eq, ip4_add_right,
    ← ip4_K13 hJ, e, ip4_sw34_adj, ip4_sw23_adj, sw34_w hJ hf hg hf13 hdf hdg,
    ip4_y_sw23_v hJ hf hg hf13 hdf hdg]
  ring

lemma ip4_sw24y_sw14sw23x₁ [DecidableEq ι] : ip4 (sw24 yy) (sw14 (sw23 x₁)) = qf / 3 := by
  have hy := K13_y hJ hf hdf hdg
  have e : sq₁ J (sq₃ J (sw24 yy)) = sw24 yy := by rw [← sw24_sq₃, ← sw24_sq₁, hy]
  rw [sw14_sw23_x₁ hJ hf hg hf13 hdf hdg, ip4_smul_right, ip4_add_right, ← ip4_K13 hJ, e,
    ip4_sw24_adj, ip4_y_sw24 hJ hf hg hf13 hdf hdg, sw12_w hJ hf hg hf13 hdf hdg, swP_add,
    swP_sq₄, swP_a hJ hf hdf hdg, swP_b hJ hf hdf hdg, map_neg, ← sub_eq_add_neg, sw34_sub,
    sw34_sq₂, sw34_a hJ hf hdf hdg, sw34_b hJ hf hdf hdg, sw12_sub, sw12_sq₂, sw12_a hJ hf hdf hdg,
    sw12_b hJ hf hdf hdg, ip4_y_sw23_z hJ hf hg hf13 hdf hdg]
  ring

/-- `⟨C₂, S C₂⟩ = Q/3`. -/
lemma ip4_C2_sw23_C2 : ip4 (ch2 J (con f f)) (sw23 (ch2 J (con f f))) = qf / 3 := by
  rw [ip4_ch2_op hJ sw23 (fun Z => (om4_sw23 Z).symm) (fun _ _ => rfl) (fun _ _ => rfl),
    om4_C hJ hdf hdg, ip4_C_sw23_Cg hJ hf hf13 hdf hdg, ← Q4_eq_ip4]
  ring

end assembly

/-! ### The final sums of squares -/

section final

variable {J : ι → ι → ℝ} (hJ : IsCplx J) {f g : ι → ι → ι → ℝ}
  (hf : ∀ a b c, f a b c = f b a c) (hg : ∀ a b c, g a b c = g b a c)
  (hf13 : ∀ a b c, f a b c = f c b a) (hdf : der3 J f = -g) (hdg : der3 J g = f)

/-! Norm expansions for the Klein group generated by `sw14`, `sw23`. -/

omit [Fintype ι] in
lemma sw23_sw14 (X : T4 ι) : sw23 (sw14 X) = sw14 (sw23 X) := rfl

lemma norm_sq_1m14 (X : T4 ι) : ip4 (X - sw14 X) (X - sw14 X) = 2 * (ip4 X X - ip4 X (sw14 X)) := by
  have e1 : ip4 (sw14 X) X = ip4 X (sw14 X) := ip4_comm _ _
  have e2 : ip4 (sw14 X) (sw14 X) = ip4 X X := ip4_sw14 X X
  simp only [ip4_sub_left, ip4_sub_right]
  linarith

lemma norm_sq_1m23 (X : T4 ι) : ip4 (X - sw23 X) (X - sw23 X) = 2 * (ip4 X X - ip4 X (sw23 X)) := by
  have e1 : ip4 (sw23 X) X = ip4 X (sw23 X) := ip4_comm _ _
  have e2 : ip4 (sw23 X) (sw23 X) = ip4 X X := ip4_sw23 X X
  simp only [ip4_sub_left, ip4_sub_right]
  linarith

lemma norm_sq_1m14_1m23 (X : T4 ι) :
    ip4 ((X - sw14 X) - sw23 (X - sw14 X)) ((X - sw14 X) - sw23 (X - sw14 X))
      = 4 * (ip4 X X - ip4 X (sw14 X) - ip4 X (sw23 X) + ip4 X (sw14 (sw23 X))) := by
  rw [norm_sq_1m23, norm_sq_1m14, sw23_sub, ip4_sub_left, ip4_sub_right, ip4_sub_right]
  have e1 : ip4 (sw14 X) (sw23 X) = ip4 X (sw14 (sw23 X)) := ip4_sw14_adj _ _
  have e2 : ip4 X (sw23 (sw14 X)) = ip4 X (sw14 (sw23 X)) := by rw [sw23_sw14]
  have e3 : ip4 (sw14 X) (sw23 (sw14 X)) = ip4 X (sw23 X) := by
    rw [ip4_sw14_adj, sw23_sw14, sw14_sw14]
  linarith

lemma norm_sq_1p14_1p23 (X : T4 ι) :
    ip4 (X + sw14 X + sw23 X + sw14 (sw23 X)) (X + sw14 X + sw23 X + sw14 (sw23 X))
      = 4 * (ip4 X X + ip4 X (sw14 X) + ip4 X (sw23 X) + ip4 X (sw14 (sw23 X))) := by
  have a1 : ip4 (sw14 X) X = ip4 X (sw14 X) := ip4_comm _ _
  have a2 : ip4 (sw14 X) (sw14 X) = ip4 X X := ip4_sw14 X X
  have a3 : ip4 (sw14 X) (sw23 X) = ip4 X (sw14 (sw23 X)) := ip4_sw14_adj _ _
  have a4 : ip4 (sw14 X) (sw14 (sw23 X)) = ip4 X (sw23 X) := by rw [ip4_sw14_adj, sw14_sw14]
  have b1 : ip4 (sw23 X) X = ip4 X (sw23 X) := ip4_comm _ _
  have b2 : ip4 (sw23 X) (sw14 X) = ip4 X (sw14 (sw23 X)) := by
    rw [ip4_sw23_adj, sw23_sw14]
  have b3 : ip4 (sw23 X) (sw23 X) = ip4 X X := ip4_sw23 X X
  have b4 : ip4 (sw23 X) (sw14 (sw23 X)) = ip4 X (sw14 X) := by
    rw [ip4_sw23_adj, sw23_sw14, sw23_sw23]
  have c1 : ip4 (sw14 (sw23 X)) X = ip4 X (sw14 (sw23 X)) := ip4_comm _ _
  have c2 : ip4 (sw14 (sw23 X)) (sw14 X) = ip4 X (sw23 X) := by
    rw [ip4_sw14_adj, sw14_sw14, ip4_comm]
  have c3 : ip4 (sw14 (sw23 X)) (sw23 X) = ip4 X (sw14 X) := by
    rw [ip4_sw14_adj, b4]
  have c4 : ip4 (sw14 (sw23 X)) (sw14 (sw23 X)) = ip4 X X := by rw [ip4_sw14, ip4_sw23]
  simp only [ip4_add_left, ip4_add_right]
  linarith

include hJ hf hg hf13 hdf hdg

local notation "aC" => ch0 J (con f f)
local notation "bB" => ch0 J (tenB J f)
local notation "qf" => Q4 f f f f
local notation "x₁" => (1 / 2 : ℝ) • (ch0 J (con f f) - sq₁ J (ch0 J (tenB J f))
  + sq₁ J (sq₃ J (ch0 J (con f f) - sq₁ J (ch0 J (tenB J f)))))
local notation "yy" => ch0 J (con f f) - sq₁ J (sq₂ J (ch0 J (con f f)))

/-- `⟨C, K₁₂ C⟩ = ⟨a, K₁₂ a⟩`. -/
lemma ip4_C_K12C : ip4 (con f f) (sq₁ J (sq₂ J (con f f))) = ip4 aC (sq₁ J (sq₂ J aC)) := by
  have h0 : ip4 aC (sq₁ J (sq₂ J (ch2 J (con f f)))) = 0 := by
    rw [← ch2_sq₂, ← ch2_sq₁, ip4_ch0_ch2 hJ]
  have h2 : ip4 (ch2 J (con f f)) (sq₁ J (sq₂ J (ch2 J (con f f)))) = 0 :=
    ip4_K12_charge2 hJ _ (om4_ch2 hJ _) (ip4_K34_eq_K12_of_swP hJ _ (Or.inl (by
      rw [← ch2_swP, swP_C])))
  have h3 : ip4 (ch2 J (con f f)) (sq₁ J (sq₂ J aC)) = 0 := by rw [← ip4_K12 hJ, ip4_comm, h0]
  have e : ip4 (aC + ch2 J (con f f)) (sq₁ J (sq₂ J (aC + ch2 J (con f f))))
      = ip4 aC (sq₁ J (sq₂ J aC)) := by
    rw [map_add, map_add, ip4_add_left, ip4_add_right, ip4_add_right, h0, h2, h3]
    ring
  rwa [ch0_add_ch2] at e

/-- `⟨B, K₁₂ B⟩ = ⟨b, K₁₂ b⟩`. -/
lemma ip4_B_K12B : ip4 (tenB J f) (sq₁ J (sq₂ J (tenB J f))) = ip4 bB (sq₁ J (sq₂ J bB)) := by
  have h0 : ip4 bB (sq₁ J (sq₂ J (ch2 J (tenB J f)))) = 0 := by
    rw [← ch2_sq₂, ← ch2_sq₁, ip4_ch0_ch2 hJ]
  have h2 : ip4 (ch2 J (tenB J f)) (sq₁ J (sq₂ J (ch2 J (tenB J f)))) = 0 :=
    ip4_K12_charge2 hJ _ (om4_ch2 hJ _) (ip4_K34_eq_K12_of_swP hJ _ (Or.inr (by
      rw [← ch2_swP, swP_B hJ, ch2_neg])))
  have h3 : ip4 (ch2 J (tenB J f)) (sq₁ J (sq₂ J bB)) = 0 := by rw [← ip4_K12 hJ, ip4_comm, h0]
  have e : ip4 (bB + ch2 J (tenB J f)) (sq₁ J (sq₂ J (bB + ch2 J (tenB J f))))
      = ip4 bB (sq₁ J (sq₂ J bB)) := by
    rw [map_add, map_add, ip4_add_left, ip4_add_right, ip4_add_right, h0, h2, h3]
    ring
  rwa [ch0_add_ch2] at e

/-- **The `G`-level square** `‖G₀ − 3 J M₀‖² ≥ 0`, as `0 ≤ 10 ‖a‖² − 8 ‖C₂‖² − 4η − 6κ`. -/
lemma gsquare_nonneg [DecidableEq ι] :
    0 ≤ 10 * ip4 aC aC - 8 * ip4 (ch2 J (con f f)) (ch2 J (con f f)) - 4 * tenGa f J
      - 6 * ip4 aC (sq₁ J (sq₂ J aC)) := by
  -- the four 2-tensors
  have key : ∀ x y : ι, ((∑ a, ∑ b, f a b x * f a b y) + (∑ a, ∑ b, sl₃ J f a b x * sl₃ J f a b y)
      - 3 * (∑ a, ∑ b, sl₁ J (sl₂ J f) a b x * f a b y)
      - 3 * (∑ a, ∑ b, sl₁ J (sl₂ J g) a b x * g a b y)) ^ 2
      = (∑ a, ∑ b, f a b x * f a b y) * (∑ a, ∑ b, f a b x * f a b y)
        + (∑ a, ∑ b, sl₃ J f a b x * sl₃ J f a b y) * (∑ a, ∑ b, sl₃ J f a b x * sl₃ J f a b y)
        + 9 * ((∑ a, ∑ b, sl₁ J (sl₂ J f) a b x * f a b y) * (∑ a, ∑ b, sl₁ J (sl₂ J f) a b x * f a b y))
        + 9 * ((∑ a, ∑ b, sl₁ J (sl₂ J g) a b x * g a b y) * (∑ a, ∑ b, sl₁ J (sl₂ J g) a b x * g a b y))
        + 2 * ((∑ a, ∑ b, f a b x * f a b y) * (∑ a, ∑ b, sl₃ J f a b x * sl₃ J f a b y))
        - 6 * ((∑ a, ∑ b, f a b x * f a b y) * (∑ a, ∑ b, sl₁ J (sl₂ J f) a b x * f a b y))
        - 6 * ((∑ a, ∑ b, f a b x * f a b y) * (∑ a, ∑ b, sl₁ J (sl₂ J g) a b x * g a b y))
        - 6 * ((∑ a, ∑ b, sl₃ J f a b x * sl₃ J f a b y) * (∑ a, ∑ b, sl₁ J (sl₂ J f) a b x * f a b y))
        - 6 * ((∑ a, ∑ b, sl₃ J f a b x * sl₃ J f a b y) * (∑ a, ∑ b, sl₁ J (sl₂ J g) a b x * g a b y))
        + 18 * ((∑ a, ∑ b, sl₁ J (sl₂ J f) a b x * f a b y) * (∑ a, ∑ b, sl₁ J (sl₂ J g) a b x * g a b y)) :=
    fun x y => by ring
  have hsq : 0 ≤ ∑ x, ∑ y, ((∑ a, ∑ b, f a b x * f a b y) + (∑ a, ∑ b, sl₃ J f a b x * sl₃ J f a b y)
      - 3 * (∑ a, ∑ b, sl₁ J (sl₂ J f) a b x * f a b y)
      - 3 * (∑ a, ∑ b, sl₁ J (sl₂ J g) a b x * g a b y)) ^ 2 :=
    Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => sq_nonneg _
  simp only [key, Finset.sum_add_distrib, Finset.sum_sub_distrib, ← Finset.mul_sum] at hsq
  rw [← ip4_con_con f f f f, ← ip4_con_con (sl₃ J f) (sl₃ J f) (sl₃ J f) (sl₃ J f),
    ← ip4_con_con (sl₁ J (sl₂ J f)) (sl₁ J (sl₂ J f)) f f,
    ← ip4_con_con (sl₁ J (sl₂ J g)) (sl₁ J (sl₂ J g)) g g,
    ← ip4_con_con f (sl₃ J f) f (sl₃ J f), ← ip4_con_con f (sl₁ J (sl₂ J f)) f f,
    ← ip4_con_con f (sl₁ J (sl₂ J g)) f g, ← ip4_con_con (sl₃ J f) (sl₁ J (sl₂ J f)) (sl₃ J f) f,
    ← ip4_con_con (sl₃ J f) (sl₁ J (sl₂ J g)) (sl₃ J f) g,
    ← ip4_con_con (sl₁ J (sl₂ J f)) (sl₁ J (sl₂ J g)) f g] at hsq
  -- the entries
  have hs := ip4_self_ch hJ (con f f)
  have hB := ip4_B_B hJ f
  rw [tenS_eq_ip4] at hB
  have hb := ip4_b_b hJ hf hdf hdg
  have hβ₁ := ip4_b_K12b hJ hf hdf hdg
  have hB2 := ip4_B2_B2 hJ hdf hdg
  have hκ := ip4_C_K12C hJ hf hg hf13 hdf hdg
  have hβ := ip4_B_K12B hJ hf hg hf13 hdf hdg
  have hC34 : ip4 (con f f) (sq₃ J (sq₄ J (con f f))) = ip4 (con f f) (sq₁ J (sq₂ J (con f f))) :=
    ip4_K34_eq_K12_of_swP hJ _ (Or.inl (swP_C))
  have hB34 : ip4 (tenB J f) (sq₃ J (sq₄ J (tenB J f))) = ip4 (tenB J f) (sq₁ J (sq₂ J (tenB J f))) :=
    ip4_K34_eq_K12_of_swP hJ _ (Or.inr (swP_B hJ))
  have hOC := ip4_om4_self hJ (con f f)
  have hOB := ip4_om4_self hJ (tenB J f)
  have hself : ip4 (tenB J f) (tenB J f) = ip4 bB bB + ip4 (ch2 J (tenB J f)) (ch2 J (tenB J f)) :=
    ip4_self_ch hJ _
  have E12 : ip4 (con f (sl₃ J f)) (con f (sl₃ J f)) = ip4 (tenB J f) (tenB J f) := by
    rw [eq_neg_of_add_eq_zero_right (con_sl₃ hJ f f), ip4_neg_left, ip4_neg_right, neg_neg]; rfl
  have E13 : ip4 (con f (sl₁ J (sl₂ J f))) (con f f) = ip4 (con f f) (sq₁ J (sq₂ J (con f f))) := by
    rw [← sq₃_con, ← sq₄_con, ip4_K34 hJ, hC34]
  have E14 : ip4 (con f (sl₁ J (sl₂ J g))) (con f g) = ip4 (tenB J f) (sq₁ J (sq₂ J (tenB J f))) := by
    rw [← sq₃_con, ← sq₄_con, con_fg hJ hdf hdg, K34_sq hJ, hB34]
  have E22 : ip4 (con (sl₃ J f) (sl₃ J f)) (con (sl₃ J f) (sl₃ J f)) = ip4 (con f f) (con f f) := by
    rw [con_sl₃_sl₃ hJ]
  have E23 : ip4 (con (sl₃ J f) (sl₁ J (sl₂ J f))) (con (sl₃ J f) f)
      = ip4 (tenB J f) (sq₁ J (sq₂ J (tenB J f))) := by
    rw [← sq₃_con, ← sq₄_con, ← tenB, ip4_K34 hJ, hB34]
  have E24 : ip4 (con (sl₃ J f) (sl₁ J (sl₂ J g))) (con (sl₃ J f) g)
      = ip4 (con f f) (sq₁ J (sq₂ J (con f f))) := by
    rw [← sq₃_con, ← sq₄_con, eq_neg_of_add_eq_zero_left (con_sl₃ hJ f g), sl₃_g hJ hdf hdg,
      ← sq₃_con, ← sq₄_con, map_neg, map_neg, K34_sq hJ, ip4_neg_left, ip4_neg_right, neg_neg, hC34]
  have E33 : ip4 (con (sl₁ J (sl₂ J f)) (sl₁ J (sl₂ J f))) (con f f)
      = ip4 (con f f) (om4 J (con f f)) := by
    rw [← sq₁_con, ← sq₂_con, ← sq₃_con, ← sq₄_con, ← om4_apply, ip4_om4 hJ]
  have E34 : ip4 (con (sl₁ J (sl₂ J f)) (sl₁ J (sl₂ J g))) (con f g)
      = ip4 (tenB J f) (om4 J (tenB J f)) := by
    rw [← sq₁_con, ← sq₂_con, ← sq₃_con, ← sq₄_con, ← om4_apply, ip4_om4 hJ, con_fg hJ hdf hdg,
      ip4_K34 hJ, om4_K34 hJ, ← K12_K34, ← om4_apply]
  have E44 : ip4 (con (sl₁ J (sl₂ J g)) (sl₁ J (sl₂ J g))) (con g g)
      = ip4 (con f f) (om4 J (con f f)) := by
    rw [← sq₁_con, ← sq₂_con, ← sq₃_con, ← sq₄_con, ← om4_apply, ← om4_C hJ hdf hdg, om4_om4 hJ]
  rw [E12, E13, E14, E22, E23, E24, E33, E34, E44] at hsq
  linarith


/-- **The field `sos1`**: `h ≤ 37 s / 39`, from the sum of squares
`37 s − 39 h = (45/8) ‖(1 − H)(1 − V) x₁‖² + 6 ‖y' − (1 + H)(1 + V) x₁/4‖² + 12 ‖C₂ − S C₂‖²`. -/
theorem sos1_of_der [DecidableEq ι] : tenH f ≤ 37 / 39 * tenS f := by
  have hs : tenS f = ip4 aC aC + ip4 (ch2 J (con f f)) (ch2 J (con f f)) := by
    rw [tenS_eq_ip4, ip4_self_ch hJ]
  have hh : 3 * tenH f = tenS f + 2 * cQ f := three_tenH hf
  have hq : cQ f = qf := by rw [cQ_eq_ip4, Q4_eq_ip4]
  have p1 := ip4_x₁_x₁ hJ hf hg hf13 hdf hdg
  have p2 := ip4_x₁_sw14_x₁ hJ hf hg hf13 hdf hdg
  have p3 := ip4_x₁_sw23_x₁ hJ hf hg hf13 hdf hdg
  have p4 := ip4_x₁_sw14sw23_x₁ hJ hf hg hf13 hdf hdg
  have y0 := ip4_y_y hJ hf hg hf13 hdf hdg
  have y1 := ip4_sw24y_x₁ hJ hf hg hf13 hdf hdg
  have y2 := ip4_sw24y_sw14x₁ hJ hf hg hf13 hdf hdg
  have y3 := ip4_sw24y_sw23x₁ hJ hf hg hf13 hdf hdg
  have y4 := ip4_sw24y_sw14sw23x₁ hJ hf hg hf13 hdf hdg
  have c2 := ip4_C2_sw23_C2 hJ hf hg hf13 hdf hdg
  -- opaque names for `x₁` and `sw24 y`
  obtain ⟨X, hX⟩ : ∃ X : T4 ι, X = x₁ := ⟨_, rfl⟩
  obtain ⟨Y, hY⟩ : ∃ Y : T4 ι, Y = sw24 yy := ⟨_, rfl⟩
  rw [← hX] at p1 p2 p3 p4 y1 y2 y3 y4
  rw [← hY] at y1 y2 y3 y4
  have yY : ip4 Y Y = 2 * ip4 aC aC - 2 * ip4 aC (sq₁ J (sq₂ J aC)) := by rw [hY, ip4_sw24, y0]
  have y1' : ip4 X Y = qf / 3 := by rw [ip4_comm, y1]
  have y2' : ip4 (sw14 X) Y = qf / 3 := by rw [ip4_comm, y2]
  have y3' : ip4 (sw23 X) Y = qf / 3 := by rw [ip4_comm, y3]
  have y4' : ip4 (sw14 (sw23 X)) Y = qf / 3 := by rw [ip4_comm, y4]
  -- the three squares
  have L1 := ip4_self_nonneg ((X - sw14 X) - sw23 (X - sw14 X))
  rw [norm_sq_1m14_1m23] at L1
  have hU := norm_sq_1p14_1p23 X
  have L2 := ip4_self_nonneg (Y - (1 / 4 : ℝ) • (X + sw14 X + sw23 X + sw14 (sw23 X)))
  simp only [ip4_sub_left, ip4_sub_right, ip4_smul_left, ip4_smul_right] at L2
  rw [hU] at L2
  simp only [ip4_add_left, ip4_add_right] at L2
  have L3 := ip4_self_nonneg (ch2 J (con f f) - sw23 (ch2 J (con f f)))
  rw [norm_sq_1m23] at L3
  linarith [L1, L2, L3]

/-- **The field `sos2`**: `27 h − 5 s + 8 η ≤ 216 tt`, from
`216 tt − 27 h + 5 s − 8 η = 3 ‖(1 − H) x₁‖² + ‖G₀ − 3 J M₀‖²/2`. -/
theorem sos2_of_der [DecidableEq ι] :
    27 * tenH f - 5 * tenS f + 8 * tenGa f J ≤ 216 * tenTT f J := by
  obtain ⟨-, hh', hq', hm, htt, -, hC2, -, -, -, -⟩ := sector_data hJ hf hg hf13 hdf hdg
  have hs : tenS f = ip4 aC aC + ip4 (ch2 J (con f f)) (ch2 J (con f f)) := by
    rw [tenS_eq_ip4, ip4_self_ch hJ]
  have hc2 : ch2 J (con f f) = (1 / 2 : ℝ) • (con f f - con g g) := by
    unfold ch2; rw [om4_C hJ hdf hdg]
  rw [← hc2] at hC2
  have hq : ip4 (con f f) (sw23 (con f f)) = qf := (Q4_eq_ip4 f f f f).symm
  have hs' : ip4 (con f f) (con f f) = ip4 aC aC + ip4 (ch2 J (con f f)) (ch2 J (con f f)) :=
    ip4_self_ch hJ _
  have p1 := ip4_x₁_x₁ hJ hf hg hf13 hdf hdg
  have p2 := ip4_x₁_sw14_x₁ hJ hf hg hf13 hdf hdg
  have G := gsquare_nonneg hJ hf hg hf13 hdf hdg
  have L1 := ip4_self_nonneg (x₁ - sw14 x₁)
  rw [norm_sq_1m14] at L1
  linarith [L1, G]

end final

/-- **The field `sos1`** for the kernel of the real part of a circular cubic. -/
theorem sos1_circular [DecidableEq ι] {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (hc : Circular J a b) : tenH (cubicKernel a) ≤ 37 / 39 * tenS (cubicKernel a) :=
  sos1_of_der hc.isCplx (cubicKernel_symm12 a) (cubicKernel_symm12 b)
    (fun x y z => by unfold cubicKernel; rw [kern_rev]) hc.der3_left hc.der3_right

/-- **The field `sos2`** for the kernel of the real part of a circular cubic. -/
theorem sos2_circular [DecidableEq ι] {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (hc : Circular J a b) :
    27 * tenH (cubicKernel a) - 5 * tenS (cubicKernel a) + 8 * tenGa (cubicKernel a) J
      ≤ 216 * tenTT (cubicKernel a) J :=
  sos2_of_der hc.isCplx (cubicKernel_symm12 a) (cubicKernel_symm12 b)
    (fun x y z => by unfold cubicKernel; rw [kern_rev]) hc.der3_left hc.der3_right

/-! ### The block calculus of `S` on pairs: the field `trace4` -/

/-! ### Four-tensors as operators on pairs -/

section pairops

/-- Pair vectors. -/
abbrev T2 (ι : Type*) := ι → ι → ℝ

/-- The inner product of pair vectors. -/
def ip2 (v w : T2 ι) : ℝ := ∑ a, ∑ b, v a b * w a b
/-- A four-tensor acting on a pair vector. -/
def ap4 (X : T4 ι) (v : T2 ι) : T2 ι := fun a b => ∑ c, ∑ d, X a b c d * v c d
/-- Composition of four-tensors as operators on pairs. -/
def comp (X Y : T4 ι) : T4 ι := fun a b c d => ∑ e, ∑ f, X a b e f * Y e f c d
/-- The column `(c, d)` of a four-tensor. -/
def col (Y : T4 ι) (c d : ι) : T2 ι := fun e f => Y e f c d
/-- The row `(a, b)` of a four-tensor. -/
def row (X : T4 ι) (a b : ι) : T2 ι := fun c d => X a b c d
/-- The outer product of two pair vectors. -/
def outer (v w : T2 ι) : T4 ι := fun a b c d => v a b * w c d

lemma ip2_comm (v w : T2 ι) : ip2 v w = ip2 w v :=
  Finset.sum_congr rfl fun _ _ => Finset.sum_congr rfl fun _ _ => mul_comm _ _
lemma ip2_self_nonneg (v : T2 ι) : 0 ≤ ip2 v v :=
  Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => mul_self_nonneg _
lemma ip2_add_left (u v w : T2 ι) : ip2 (u + v) w = ip2 u w + ip2 v w := by
  simp only [ip2, Pi.add_apply, add_mul, Finset.sum_add_distrib]
lemma ip2_add_right (u v w : T2 ι) : ip2 u (v + w) = ip2 u v + ip2 u w := by
  simp only [ip2, Pi.add_apply, mul_add, Finset.sum_add_distrib]
lemma ip2_sub_left (u v w : T2 ι) : ip2 (u - v) w = ip2 u w - ip2 v w := by
  simp only [ip2, Pi.sub_apply, sub_mul, Finset.sum_sub_distrib]
lemma ip2_sub_right (u v w : T2 ι) : ip2 u (v - w) = ip2 u v - ip2 u w := by
  simp only [ip2, Pi.sub_apply, mul_sub, Finset.sum_sub_distrib]
lemma ip2_smul_left (r : ℝ) (v w : T2 ι) : ip2 (r • v) w = r * ip2 v w := by
  simp only [ip2, Pi.smul_apply, smul_eq_mul, Finset.mul_sum, mul_assoc]
lemma ip2_smul_right (r : ℝ) (v w : T2 ι) : ip2 v (r • w) = r * ip2 v w := by
  rw [ip2_comm, ip2_smul_left, ip2_comm]
lemma ip2_neg_left (v w : T2 ι) : ip2 (-v) w = -ip2 v w := by
  simp only [ip2, Pi.neg_apply, neg_mul, Finset.sum_neg_distrib]
lemma ip2_neg_right (v w : T2 ι) : ip2 v (-w) = -ip2 v w := by
  simp only [ip2, Pi.neg_apply, mul_neg, Finset.sum_neg_distrib]

lemma ap4_add (X Y : T4 ι) (v : T2 ι) : ap4 (X + Y) v = ap4 X v + ap4 Y v := by
  funext a b; simp only [ap4, Pi.add_apply, add_mul, Finset.sum_add_distrib]
lemma ap4_sub (X Y : T4 ι) (v : T2 ι) : ap4 (X - Y) v = ap4 X v - ap4 Y v := by
  funext a b; simp only [ap4, Pi.sub_apply, sub_mul, Finset.sum_sub_distrib]
lemma ap4_neg (X : T4 ι) (v : T2 ι) : ap4 (-X) v = -ap4 X v := by
  funext a b; simp only [ap4, Pi.neg_apply, neg_mul, Finset.sum_neg_distrib]
lemma ap4_smul (r : ℝ) (X : T4 ι) (v : T2 ι) : ap4 (r • X) v = r • ap4 X v := by
  funext a b; simp only [ap4, Pi.smul_apply, smul_eq_mul, Finset.mul_sum, mul_assoc]
lemma ap4_add_vec (X : T4 ι) (v w : T2 ι) : ap4 X (v + w) = ap4 X v + ap4 X w := by
  funext a b; simp only [ap4, Pi.add_apply, mul_add, Finset.sum_add_distrib]

lemma comp_add_left (X Y Z : T4 ι) : comp (X + Y) Z = comp X Z + comp Y Z := by
  funext a b c d; simp only [comp, Pi.add_apply, add_mul, Finset.sum_add_distrib]
lemma comp_add_right (X Y Z : T4 ι) : comp X (Y + Z) = comp X Y + comp X Z := by
  funext a b c d; simp only [comp, Pi.add_apply, mul_add, Finset.sum_add_distrib]
lemma comp_sub_left (X Y Z : T4 ι) : comp (X - Y) Z = comp X Z - comp Y Z := by
  funext a b c d; simp only [comp, Pi.sub_apply, sub_mul, Finset.sum_sub_distrib]
lemma comp_sub_right (X Y Z : T4 ι) : comp X (Y - Z) = comp X Y - comp X Z := by
  funext a b c d; simp only [comp, Pi.sub_apply, mul_sub, Finset.sum_sub_distrib]
lemma comp_smul_left (r : ℝ) (X Y : T4 ι) : comp (r • X) Y = r • comp X Y := by
  funext a b c d; simp only [comp, Pi.smul_apply, smul_eq_mul, Finset.mul_sum, mul_assoc]
lemma comp_smul_right (r : ℝ) (X Y : T4 ι) : comp X (r • Y) = r • comp X Y := by
  funext a b c d; simp only [comp, Pi.smul_apply, smul_eq_mul, Finset.mul_sum]
  exact Finset.sum_congr rfl fun _ _ => Finset.sum_congr rfl fun _ _ => by ring
lemma comp_neg_left (X Y : T4 ι) : comp (-X) Y = -comp X Y := by
  funext a b c d; simp only [comp, Pi.neg_apply, neg_mul, Finset.sum_neg_distrib]
lemma comp_neg_right (X Y : T4 ι) : comp X (-Y) = -comp X Y := by
  funext a b c d; simp only [comp, Pi.neg_apply, mul_neg, Finset.sum_neg_distrib]

lemma sum3_rot (F : ι → ι → ι → ℝ) : ∑ c, ∑ d, ∑ p, F c d p = ∑ p, ∑ c, ∑ d, F c d p :=
  (Finset.sum_congr rfl fun _ _ => Finset.sum_comm).trans Finset.sum_comm
lemma sum3_pswap13 (F : ι → ι → ι → ℝ) : ∑ c, ∑ d, ∑ p, F c d p = ∑ p, ∑ d, ∑ c, F c d p :=
  ((Finset.sum_congr rfl fun _ _ => Finset.sum_comm).trans Finset.sum_comm).trans
    (Finset.sum_congr rfl fun _ _ => Finset.sum_comm)

/-- `(X ∘ Y)` applied to `v` is `X (Y v)`. -/
lemma ap4_comp (X Y : T4 ι) (v : T2 ι) : ap4 (comp X Y) v = ap4 X (ap4 Y v) := by
  funext a b
  simp only [ap4, comp, Finset.sum_mul, Finset.mul_sum]
  rw [swap4 (fun c d e f => X a b e f * Y e f c d * v c d)]
  exact Finset.sum_congr rfl fun e _ => Finset.sum_congr rfl fun f _ =>
    Finset.sum_congr rfl fun c _ => Finset.sum_congr rfl fun d _ => by ring

/-- The columns of `X ∘ Y` are `X` applied to the columns of `Y`. -/
lemma col_comp (X Y : T4 ι) (c d : ι) : col (comp X Y) c d = ap4 X (col Y c d) := rfl

/-- `‖Y‖² = Σ_{cd} ‖col Y c d‖²`. -/
lemma ip4_eq_sum_col (Y Y' : T4 ι) : ip4 Y Y' = ∑ c, ∑ d, ip2 (col Y c d) (col Y' c d) := by
  simp only [ip4, ip2, col]
  exact swap4 (fun a b c d => Y a b c d * Y' a b c d)

/-- `(X v)_{ab} = ⟨row X a b, v⟩`. -/
lemma ap4_apply_row (X : T4 ι) (v : T2 ι) (a b : ι) : ap4 X v a b = ip2 (row X a b) v := rfl

lemma ip4_eq_sum_row (X X' : T4 ι) : ip4 X X' = ∑ a, ∑ b, ip2 (row X a b) (row X' a b) := rfl

/-- Cauchy–Schwarz for `ip2`. -/
lemma ip2_sq_le (v w : T2 ι) : ip2 v w ^ 2 ≤ ip2 v v * ip2 w w := by
  have := Finset.sum_mul_sq_le_sq_mul_sq (Finset.univ : Finset (ι × ι)) (fun p => v p.1 p.2)
    (fun p => w p.1 p.2)
  simp only [ip2, Fintype.sum_prod_type, sq] at this ⊢
  exact this

/-- `‖X v‖² ≤ ‖X‖² ‖v‖²`. -/
lemma ip2_ap4_le (X : T4 ι) (v : T2 ι) : ip2 (ap4 X v) (ap4 X v) ≤ ip4 X X * ip2 v v := by
  rw [ip4_eq_sum_row, Finset.sum_mul]
  refine Finset.sum_le_sum fun a _ => ?_
  rw [Finset.sum_mul]
  refine Finset.sum_le_sum fun b _ => ?_
  rw [ap4_apply_row, ← sq]
  exact ip2_sq_le _ _

/-- `‖X ∘ Y‖² ≤ ‖X‖² ‖Y‖²`. -/
lemma ip4_comp_le (X Y : T4 ι) : ip4 (comp X Y) (comp X Y) ≤ ip4 X X * ip4 Y Y := by
  rw [ip4_eq_sum_col (comp X Y), ip4_eq_sum_col Y Y, Finset.mul_sum]
  refine Finset.sum_le_sum fun c _ => ?_
  rw [Finset.mul_sum]
  refine Finset.sum_le_sum fun d _ => ?_
  rw [col_comp]
  exact ip2_ap4_le _ _

/-- `⟨v, X v⟩² ≤ ‖v‖² ‖X v‖²`, hence `⟨v, X v⟩ ≤ ‖X‖ ‖v‖²` style bounds. -/
lemma ip2_ap4_self_sq_le (X : T4 ι) (v : T2 ι) :
    ip2 v (ap4 X v) ^ 2 ≤ ip2 v v * (ip4 X X * ip2 v v) :=
  le_trans (ip2_sq_le _ _) (mul_le_mul_of_nonneg_left (ip2_ap4_le X v) (ip2_self_nonneg v))

/-- `⟨X, Y⟩² ≤ ‖X‖² ‖Y‖²` for four-tensors. -/
lemma ip4_sq_le (X Y : T4 ι) : ip4 X Y ^ 2 ≤ ip4 X X * ip4 Y Y := by
  have := Finset.sum_mul_sq_le_sq_mul_sq (Finset.univ : Finset (ι × ι × ι × ι))
    (fun p => X p.1 p.2.1 p.2.2.1 p.2.2.2) (fun p => Y p.1 p.2.1 p.2.2.1 p.2.2.2)
  simp only [ip4, Fintype.sum_prod_type, sq] at this ⊢
  exact this

/-- The HS pairing with a composition: `⟨Z, X ∘ Y⟩ = Σ_{cd} ⟨col Z, X (col Y)⟩`. -/
lemma ip4_comp_eq_sum_col (Z X Y : T4 ι) :
    ip4 Z (comp X Y) = ∑ c, ∑ d, ip2 (col Z c d) (ap4 X (col Y c d)) := by
  rw [ip4_eq_sum_col]; rfl

/-! The complex structure `𝒥 = J ⊗ 1` on pairs. -/

variable {J : ι → ι → ℝ}

/-- `𝒥 v = J v` on the first slot of a pair. -/
def jp (J : ι → ι → ℝ) (v : T2 ι) : T2 ι := fun a b => ∑ p, J a p * v p b

lemma ap4_sq₁ (X : T4 ι) (v : T2 ι) : ap4 (sq₁ J X) v = jp J (ap4 X v) := by
  funext a b
  simp only [ap4, jp, sq₁_apply, Finset.sum_mul, Finset.mul_sum]
  rw [sum3_rot (fun c d p => J a p * X p b c d * v c d)]
  exact Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun c _ =>
    Finset.sum_congr rfl fun d _ => by ring

lemma ap4_sq₃ (hJ : ∀ i j, J i j = -J j i) (X : T4 ι) (v : T2 ι) :
    ap4 (sq₃ J X) v = -ap4 X (jp J v) := by
  funext a b
  simp only [ap4, jp, sq₃_apply, Finset.sum_mul, Finset.mul_sum, Pi.neg_apply,
    ← Finset.sum_neg_distrib]
  rw [sum3_pswap13 (fun c d p => J c p * X a b p d * v c d)]
  refine Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun d _ =>
    Finset.sum_congr rfl fun c _ => ?_
  rw [hJ p c]; ring

variable (hJ : IsCplx J)
include hJ

lemma ip2_jp_self (v : T2 ι) : ip2 v (jp J v) = 0 := by
  have h : ip2 v (jp J v) = -ip2 v (jp J v) := by
    simp only [ip2, jp, Finset.mul_sum, ← Finset.sum_neg_distrib]
    rw [sum3_pswap13 (fun a b p => v a b * (J a p * v p b))]
    refine Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun b _ =>
      Finset.sum_congr rfl fun a _ => ?_
    rw [hJ.anti p a]; ring
  linarith

lemma jvec_dot (u u' : ι → ℝ) :
    ∑ a, (∑ p, J a p * u p) * (∑ q, J a q * u' q) = ∑ a, u a * u' a := by
  have e : ∀ a, (∑ p, J a p * u p) * (∑ q, J a q * u' q)
      = ∑ p, u p * (J a p * ∑ q, J a q * u' q) := fun a => by
    rw [Finset.sum_mul]; exact Finset.sum_congr rfl fun p _ => by ring
  simp only [e]
  rw [Finset.sum_comm]
  refine Finset.sum_congr rfl fun p _ => ?_
  rw [← Finset.mul_sum, hJ.sum_tsq (fun q => u' q) p]

lemma ip2_jp_jp (v w : T2 ι) : ip2 (jp J v) (jp J w) = ip2 v w := by
  simp only [ip2, jp]
  rw [Finset.sum_comm]
  conv_rhs => rw [Finset.sum_comm]
  refine Finset.sum_congr rfl fun b _ => ?_
  exact jvec_dot hJ (fun p => v p b) (fun q => w q b)

/-- Bessel for the orthogonal pair `v`, `𝒥 v`. -/
lemma bessel2_pair (r v : T2 ι) : ip2 r v ^ 2 + ip2 r (jp J v) ^ 2 ≤ ip2 r r * ip2 v v := by
  have hvv : ip2 (jp J v) (jp J v) = ip2 v v := ip2_jp_jp hJ v v
  have huv : ip2 v (jp J v) = 0 := ip2_jp_self hJ v
  have key : 0 ≤ ip2 ((ip2 v v) • r - (ip2 r v) • v - (ip2 r (jp J v)) • (jp J v))
      ((ip2 v v) • r - (ip2 r v) • v - (ip2 r (jp J v)) • (jp J v)) := ip2_self_nonneg _
  simp only [ip2_sub_left, ip2_sub_right, ip2_smul_left, ip2_smul_right, hvv, huv] at key
  rw [ip2_comm v r, ip2_comm (jp J v) r, ip2_comm (jp J v) v, huv] at key
  by_cases h0 : ip2 v v = 0
  · have hv : v = 0 := by
      funext a b
      have h1 := (Finset.sum_eq_zero_iff_of_nonneg
        (fun a _ => Finset.sum_nonneg fun b _ => mul_self_nonneg (v a b))).1 h0 a (Finset.mem_univ _)
      have h2 := (Finset.sum_eq_zero_iff_of_nonneg (fun b _ => mul_self_nonneg (v a b))).1 h1 b
        (Finset.mem_univ _)
      exact mul_self_eq_zero.1 h2
    subst hv
    simp [ip2, jp]
  · have hpos : 0 < ip2 v v := lt_of_le_of_ne (ip2_self_nonneg v) (Ne.symm h0)
    have : 0 ≤ ip2 v v * (ip2 r r * ip2 v v - ip2 r v ^ 2 - ip2 r (jp J v) ^ 2) := by
      nlinarith [key]
    have := (mul_nonneg_iff_of_pos_left hpos).1 this
    linarith

/-- The complex gain: `2 ‖X v‖² ≤ ‖X‖² ‖v‖²` for `K₁₃ X = X` (`X` commutes with `𝒥`). -/
lemma ip2_ap4_le_half {X : T4 ι} (hX : sq₁ J (sq₃ J X) = X) (v : T2 ι) :
    2 * ip2 (ap4 X v) (ap4 X v) ≤ ip4 X X * ip2 v v := by
  -- `X (𝒥 v) = 𝒥 (X v)`
  have h3 : sq₃ J X = -sq₁ J X := by
    have := congrArg (sq₁ J) hX
    rw [sq_sq1 hJ] at this
    rw [← this, neg_neg]
  have hc : ap4 X (jp J v) = jp J (ap4 X v) := by
    have := ap4_sq₃ hJ.anti X v
    rw [h3, ap4_neg, neg_inj, ap4_sq₁] at this
    exact this.symm
  have h1 : ip2 (ap4 X (jp J v)) (ap4 X (jp J v)) = ip2 (ap4 X v) (ap4 X v) := by
    rw [hc, ip2_jp_jp hJ]
  have hrow : ∀ w : T2 ι, ip2 (ap4 X w) (ap4 X w) = ∑ a, ∑ b, ip2 (row X a b) w ^ 2 := fun w =>
    Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => by rw [sq]; rfl
  calc 2 * ip2 (ap4 X v) (ap4 X v)
      = ip2 (ap4 X v) (ap4 X v) + ip2 (ap4 X (jp J v)) (ap4 X (jp J v)) := by rw [h1]; ring
    _ = ∑ a, ∑ b, (ip2 (row X a b) v ^ 2 + ip2 (row X a b) (jp J v) ^ 2) := by
        rw [hrow, hrow, ← Finset.sum_add_distrib]
        exact Finset.sum_congr rfl fun a _ => (Finset.sum_add_distrib).symm
    _ ≤ ∑ a, ∑ b, ip2 (row X a b) (row X a b) * ip2 v v :=
        Finset.sum_le_sum fun a _ => Finset.sum_le_sum fun b _ => bessel2_pair hJ _ _
    _ = ip4 X X * ip2 v v := by rw [ip4_eq_sum_row, Finset.sum_mul]; simp only [Finset.sum_mul]

/-- `2 ‖X ∘ Y‖² ≤ ‖X‖² ‖Y‖²` for `K₁₃ X = X`. -/
lemma ip4_comp_le_half {X : T4 ι} (hX : sq₁ J (sq₃ J X) = X) (Y : T4 ι) :
    2 * ip4 (comp X Y) (comp X Y) ≤ ip4 X X * ip4 Y Y := by
  rw [ip4_eq_sum_col (comp X Y), ip4_eq_sum_col Y Y, Finset.mul_sum, Finset.mul_sum]
  refine Finset.sum_le_sum fun c _ => ?_
  rw [Finset.mul_sum, Finset.mul_sum]
  refine Finset.sum_le_sum fun d _ => ?_
  rw [col_comp]
  exact ip2_ap4_le_half hJ hX _

end pairops

/-! ### The `𝒥`-linear and antilinear parts of `Y Yᵀ` -/

section linpart

variable {J : ι → ι → ℝ} (hJ : IsCplx J)

/-- `Y Yᵀ`. -/
lemma comp_swP_apply (Y : T4 ι) (a b c d : ι) :
    comp Y (swP Y) a b c d = ∑ e, ∑ f, Y a b e f * Y c d e f := rfl

lemma col_sq₁ (Y : T4 ι) (e f : ι) : col (sq₁ J Y) e f = jp J (col Y e f) := rfl

/-- `⟨Y Yᵀ, Y' Y'ᵀ⟩ = Σ ⟨col Y, col Y'⟩²`. -/
lemma ip4_compswP (Y Y' : T4 ι) :
    ip4 (comp Y (swP Y)) (comp Y' (swP Y'))
      = ∑ e, ∑ f, ∑ e', ∑ f', ip2 (col Y e f) (col Y' e' f') ^ 2 := by
  have e1 : ∀ a b c d, comp Y (swP Y) a b c d * comp Y' (swP Y') a b c d
      = ∑ e, ∑ f, ∑ e', ∑ f', (Y a b e f * Y' a b e' f') * (Y c d e f * Y' c d e' f') :=
    fun a b c d => by
    simp only [comp_swP_apply, Finset.sum_mul_sum]
    refine Finset.sum_congr rfl fun e _ => ?_
    rw [Finset.sum_comm]
    refine Finset.sum_congr rfl fun f _ => Finset.sum_congr rfl fun e' _ =>
      Finset.sum_congr rfl fun f' _ => by ring
  simp only [ip4, e1]
  have := sum_mul_sum_factor (α := ι × ι) (β := ι × ι) (γ := (ι × ι) × (ι × ι))
    (fun x z => Y x.1 x.2 z.1.1 z.1.2 * Y' x.1 x.2 z.2.1 z.2.2)
    (fun y z => Y y.1 y.2 z.1.1 z.1.2 * Y' y.1 y.2 z.2.1 z.2.2)
  simp only [Fintype.sum_prod_type] at this
  rw [this]
  refine Finset.sum_congr rfl fun e _ => Finset.sum_congr rfl fun f _ =>
    Finset.sum_congr rfl fun e' _ => Finset.sum_congr rfl fun f' _ => ?_
  rw [sq]; rfl

/-- `K₁₃ (Y Yᵀ) = (J₁Y)(J₁Y)ᵀ`. -/
lemma K13_compswP (Y : T4 ι) :
    sq₁ J (sq₃ J (comp Y (swP Y))) = comp (sq₁ J Y) (swP (sq₁ J Y)) := by
  funext a b c d
  have hr : ∀ e f, (∑ p, J a p * Y p b e f) * (∑ q, J c q * Y q d e f)
      = ∑ p, ∑ q, (J a p * Y p b e f) * (J c q * Y q d e f) := fun e f => Finset.sum_mul_sum _ _ _ _
  simp only [sq₁_apply, sq₃_apply, comp_swP_apply, Finset.mul_sum, hr]
  rw [swap4 (fun p q e f => J a p * (J c q * (Y p b e f * Y q d e f)))]
  exact Finset.sum_congr rfl fun e _ => Finset.sum_congr rfl fun f _ =>
    Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun q _ => by ring

include hJ

/-- `2 ‖((Y Yᵀ) + K₁₃ (Y Yᵀ))/2‖² ≤ ‖Y‖⁴`. -/
lemma ip4_lin_compswP_le (Y : T4 ι) :
    2 * ip4 ((1 / 2 : ℝ) • (comp Y (swP Y) + sq₁ J (sq₃ J (comp Y (swP Y)))))
      ((1 / 2 : ℝ) • (comp Y (swP Y) + sq₁ J (sq₃ J (comp Y (swP Y)))))
      ≤ ip4 Y Y ^ 2 := by
  have hK : ip4 (comp Y (swP Y)) (sq₁ J (sq₃ J (comp Y (swP Y))))
      = ∑ e, ∑ f, ∑ e', ∑ f', ip2 (col Y e f) (jp J (col Y e' f')) ^ 2 := by
    rw [K13_compswP, ip4_compswP]
    simp only [col_sq₁]
  have hS := ip4_compswP Y Y
  have e : ip4 ((1 / 2 : ℝ) • (comp Y (swP Y) + sq₁ J (sq₃ J (comp Y (swP Y)))))
      ((1 / 2 : ℝ) • (comp Y (swP Y) + sq₁ J (sq₃ J (comp Y (swP Y)))))
      = (ip4 (comp Y (swP Y)) (comp Y (swP Y))
        + ip4 (comp Y (swP Y)) (sq₁ J (sq₃ J (comp Y (swP Y))))) / 2 := by
    have e1 : ip4 (sq₁ J (sq₃ J (comp Y (swP Y)))) (comp Y (swP Y))
        = ip4 (comp Y (swP Y)) (sq₁ J (sq₃ J (comp Y (swP Y)))) := ip4_K13 hJ _ _
    have e2 : ip4 (sq₁ J (sq₃ J (comp Y (swP Y)))) (sq₁ J (sq₃ J (comp Y (swP Y))))
        = ip4 (comp Y (swP Y)) (comp Y (swP Y)) := by rw [ip4_K13 hJ, K13_sq hJ]
    rw [ip4_smul_left, ip4_smul_right, ip4_add_left, ip4_add_right, ip4_add_right, e1, e2]
    ring
  have hY : ip4 Y Y ^ 2 = ∑ e, ∑ f, ∑ e', ∑ f',
      ip2 (col Y e f) (col Y e f) * ip2 (col Y e' f') (col Y e' f') := by
    rw [ip4_eq_sum_col, sq, Finset.sum_mul_sum]
    refine Finset.sum_congr rfl fun e _ => ?_
    simp only [Finset.sum_mul_sum]
    rw [Finset.sum_comm]
  rw [e, hK, hS, hY, ← Finset.sum_add_distrib]
  simp only [← Finset.sum_add_distrib]
  rw [mul_div_cancel₀ _ (two_ne_zero)]
  refine Finset.sum_le_sum fun e _ => Finset.sum_le_sum fun f _ =>
    Finset.sum_le_sum fun e' _ => Finset.sum_le_sum fun f' _ => bessel2_pair hJ _ _

/-- `2 ‖((Y Yᵀ) − K₁₃ (Y Yᵀ))/2‖² ≤ ‖Y‖⁴`. -/
lemma ip4_anti_compswP_le (Y : T4 ι) :
    2 * ip4 ((1 / 2 : ℝ) • (comp Y (swP Y) - sq₁ J (sq₃ J (comp Y (swP Y)))))
      ((1 / 2 : ℝ) • (comp Y (swP Y) - sq₁ J (sq₃ J (comp Y (swP Y)))))
      ≤ ip4 Y Y ^ 2 := by
  have hK : ip4 (comp Y (swP Y)) (sq₁ J (sq₃ J (comp Y (swP Y))))
      = ∑ e, ∑ f, ∑ e', ∑ f', ip2 (col Y e f) (jp J (col Y e' f')) ^ 2 := by
    rw [K13_compswP, ip4_compswP]
    simp only [col_sq₁]
  have hS := ip4_compswP Y Y
  have e : ip4 ((1 / 2 : ℝ) • (comp Y (swP Y) - sq₁ J (sq₃ J (comp Y (swP Y)))))
      ((1 / 2 : ℝ) • (comp Y (swP Y) - sq₁ J (sq₃ J (comp Y (swP Y)))))
      = (ip4 (comp Y (swP Y)) (comp Y (swP Y))
        - ip4 (comp Y (swP Y)) (sq₁ J (sq₃ J (comp Y (swP Y))))) / 2 := by
    have e1 : ip4 (sq₁ J (sq₃ J (comp Y (swP Y)))) (comp Y (swP Y))
        = ip4 (comp Y (swP Y)) (sq₁ J (sq₃ J (comp Y (swP Y)))) := ip4_K13 hJ _ _
    have e2 : ip4 (sq₁ J (sq₃ J (comp Y (swP Y)))) (sq₁ J (sq₃ J (comp Y (swP Y))))
        = ip4 (comp Y (swP Y)) (comp Y (swP Y)) := by rw [ip4_K13 hJ, K13_sq hJ]
    rw [ip4_smul_left, ip4_smul_right, ip4_sub_left, ip4_sub_right, ip4_sub_right, e1, e2]
    ring
  have hY : ip4 Y Y ^ 2 = ∑ e, ∑ f, ∑ e', ∑ f',
      ip2 (col Y e f) (col Y e f) * ip2 (col Y e' f') (col Y e' f') := by
    rw [ip4_eq_sum_col, sq, Finset.sum_mul_sum]
    refine Finset.sum_congr rfl fun e _ => ?_
    simp only [Finset.sum_mul_sum]
    rw [Finset.sum_comm]
  rw [e, hK, hS, hY, ← Finset.sum_sub_distrib]
  simp only [← Finset.sum_sub_distrib]
  rw [mul_div_cancel₀ _ (two_ne_zero)]
  refine Finset.sum_le_sum fun e _ => Finset.sum_le_sum fun f _ =>
    Finset.sum_le_sum fun e' _ => Finset.sum_le_sum fun f' _ => ?_
  have := bessel2_pair hJ (col Y e f) (col Y e' f')
  nlinarith [sq_nonneg (ip2 (col Y e f) (jp J (col Y e' f')))]

end linpart

/-! ### The charge blocks of a four-tensor -/

section blocks

variable {J : ι → ι → ℝ} (hJ : IsCplx J)

/-- The charge-zero projection of the output pair. -/
def P0 (J : ι → ι → ℝ) (X : T4 ι) : T4 ι := (1 / 2 : ℝ) • (X + sq₁ J (sq₂ J X))
/-- The charge-`±2` projection of the output pair. -/
def P2 (J : ι → ι → ℝ) (X : T4 ι) : T4 ι := (1 / 2 : ℝ) • (X - sq₁ J (sq₂ J X))
/-- The charge-zero projection of the input pair. -/
def Q0 (J : ι → ι → ℝ) (X : T4 ι) : T4 ι := (1 / 2 : ℝ) • (X + sq₃ J (sq₄ J X))
/-- The charge-`±2` projection of the input pair. -/
def Q2 (J : ι → ι → ℝ) (X : T4 ι) : T4 ι := (1 / 2 : ℝ) • (X - sq₃ J (sq₄ J X))

lemma P0_add_P2 (X : T4 ι) : P0 J X + P2 J X = X := by unfold P0 P2; module
lemma Q0_add_Q2 (X : T4 ι) : Q0 J X + Q2 J X = X := by unfold Q0 Q2; module

lemma P0_Q0 (X : T4 ι) : P0 J (Q0 J X) = Q0 J (P0 J X) := by
  unfold P0 Q0; simp only [map_smul, map_add, K12_K34]; module
lemma P0_Q2 (X : T4 ι) : P0 J (Q2 J X) = Q2 J (P0 J X) := by
  unfold P0 Q2; simp only [map_smul, map_add, map_sub, K12_K34]; module
lemma P2_Q0 (X : T4 ι) : P2 J (Q0 J X) = Q0 J (P2 J X) := by
  unfold P2 Q0; simp only [map_smul, map_add, map_sub, K12_K34]; module
lemma P2_Q2 (X : T4 ι) : P2 J (Q2 J X) = Q2 J (P2 J X) := by
  unfold P2 Q2; simp only [map_smul, map_sub, K12_K34]; module

lemma P0_add (X Y : T4 ι) : P0 J (X + Y) = P0 J X + P0 J Y := by
  unfold P0; simp only [map_add]; module
lemma P2_add (X Y : T4 ι) : P2 J (X + Y) = P2 J X + P2 J Y := by
  unfold P2; simp only [map_add]; module
lemma Q0_add (X Y : T4 ι) : Q0 J (X + Y) = Q0 J X + Q0 J Y := by
  unfold Q0; simp only [map_add]; module
lemma Q2_add (X Y : T4 ι) : Q2 J (X + Y) = Q2 J X + Q2 J Y := by
  unfold Q2; simp only [map_add]; module
lemma P0_sub (X Y : T4 ι) : P0 J (X - Y) = P0 J X - P0 J Y := by
  unfold P0; simp only [map_sub]; module
lemma P2_sub (X Y : T4 ι) : P2 J (X - Y) = P2 J X - P2 J Y := by
  unfold P2; simp only [map_sub]; module
lemma P0_smul (r : ℝ) (X : T4 ι) : P0 J (r • X) = r • P0 J X := by
  unfold P0; simp only [map_smul]; module
lemma P2_smul (r : ℝ) (X : T4 ι) : P2 J (r • X) = r • P2 J X := by
  unfold P2; simp only [map_smul]; module
lemma Q0_sub (X Y : T4 ι) : Q0 J (X - Y) = Q0 J X - Q0 J Y := by
  unfold Q0; simp only [map_sub]; module
lemma Q2_sub (X Y : T4 ι) : Q2 J (X - Y) = Q2 J X - Q2 J Y := by
  unfold Q2; simp only [map_sub]; module
lemma Q0_smul (r : ℝ) (X : T4 ι) : Q0 J (r • X) = r • Q0 J X := by
  unfold Q0; simp only [map_smul]; module
lemma Q2_smul (r : ℝ) (X : T4 ι) : Q2 J (r • X) = r • Q2 J X := by
  unfold Q2; simp only [map_smul]; module

include hJ

lemma K12_P0 (X : T4 ι) : sq₁ J (sq₂ J (P0 J X)) = P0 J X := by
  unfold P0; simp only [map_smul, map_add]; rw [K12_sq hJ, add_comm]
lemma K12_P2 (X : T4 ι) : sq₁ J (sq₂ J (P2 J X)) = -P2 J X := by
  unfold P2; simp only [map_smul, map_sub]; rw [K12_sq hJ, ← smul_neg, neg_sub]
lemma K34_Q0 (X : T4 ι) : sq₃ J (sq₄ J (Q0 J X)) = Q0 J X := by
  unfold Q0; simp only [map_smul, map_add]; rw [K34_sq hJ, add_comm]
lemma K34_Q2 (X : T4 ι) : sq₃ J (sq₄ J (Q2 J X)) = -Q2 J X := by
  unfold Q2; simp only [map_smul, map_sub]; rw [K34_sq hJ, ← smul_neg, neg_sub]

lemma ip4_P0_P2 (X Y : T4 ι) : ip4 (P0 J X) (P2 J Y) = 0 := by
  have h : ip4 (P0 J X) (P2 J Y) = -ip4 (P0 J X) (P2 J Y) := by
    conv_lhs => rw [← K12_P0 hJ X, ip4_K12 hJ, K12_P2 hJ, ip4_neg_right]
  linarith
lemma ip4_Q0_Q2 (X Y : T4 ι) : ip4 (Q0 J X) (Q2 J Y) = 0 := by
  have h : ip4 (Q0 J X) (Q2 J Y) = -ip4 (Q0 J X) (Q2 J Y) := by
    conv_lhs => rw [← K34_Q0 hJ X, ip4_K34 hJ, K34_Q2 hJ, ip4_neg_right]
  linarith

/-- `‖X‖² = ‖X₀₀‖² + ‖X₀₂‖² + ‖X₂₀‖² + ‖X₂₂‖²`. -/
lemma ip4_self_blocks (X : T4 ι) :
    ip4 X X = ip4 (P0 J (Q0 J X)) (P0 J (Q0 J X)) + ip4 (P0 J (Q2 J X)) (P0 J (Q2 J X))
      + ip4 (P2 J (Q0 J X)) (P2 J (Q0 J X)) + ip4 (P2 J (Q2 J X)) (P2 J (Q2 J X)) := by
  have hQ : ∀ Y : T4 ι, ip4 Y Y = ip4 (Q0 J Y) (Q0 J Y) + ip4 (Q2 J Y) (Q2 J Y) := fun Y => by
    conv_lhs => rw [← Q0_add_Q2 (J := J) Y]
    rw [ip4_add_left, ip4_add_right, ip4_add_right, ip4_Q0_Q2 hJ, ip4_comm (Q2 J Y) (Q0 J Y),
      ip4_Q0_Q2 hJ]
    ring
  have hP : ∀ Y : T4 ι, ip4 Y Y = ip4 (P0 J Y) (P0 J Y) + ip4 (P2 J Y) (P2 J Y) := fun Y => by
    conv_lhs => rw [← P0_add_P2 (J := J) Y]
    rw [ip4_add_left, ip4_add_right, ip4_add_right, ip4_P0_P2 hJ, ip4_comm (P2 J Y) (P0 J Y),
      ip4_P0_P2 hJ]
    ring
  rw [hQ X, hP (Q0 J X), hP (Q2 J X)]
  ring

/-! Blocks and composition: `K₃₄` on the input of `X` is `K₁₂` on the output of `Y`. -/

omit hJ in
lemma comp_K34_left (hJa : ∀ i j, J i j = -J j i) (X Y : T4 ι) :
    comp (sq₃ J (sq₄ J X)) Y = comp X (sq₁ J (sq₂ J Y)) := by
  funext a b c d
  simp only [comp, sq₃_sq₄_apply, sq₁_sq₂_apply, Finset.sum_mul, Finset.mul_sum]
  rw [swap4 (fun e f p q => J e p * J f q * X a b p q * Y e f c d)]
  refine Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun q _ =>
    Finset.sum_congr rfl fun e _ => Finset.sum_congr rfl fun f _ => ?_
  rw [hJa e p, hJa f q]; ring

omit hJ in
lemma K12_comp (X Y : T4 ι) : sq₁ J (sq₂ J (comp X Y)) = comp (sq₁ J (sq₂ J X)) Y := by
  funext a b c d
  simp only [comp, sq₁_sq₂_apply, Finset.mul_sum, Finset.sum_mul]
  rw [swap4 (fun p q e f => J a p * J b q * (X p q e f * Y e f c d))]
  exact Finset.sum_congr rfl fun e _ => Finset.sum_congr rfl fun f _ =>
    Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun q _ => by ring

omit hJ in
lemma K34_comp (X Y : T4 ι) : sq₃ J (sq₄ J (comp X Y)) = comp X (sq₃ J (sq₄ J Y)) := by
  funext a b c d
  simp only [comp, sq₃_sq₄_apply, Finset.mul_sum]
  rw [swap4 (fun p q e f => J c p * J d q * (X a b e f * Y e f p q))]
  exact Finset.sum_congr rfl fun e _ => Finset.sum_congr rfl fun f _ =>
    Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun q _ => by ring

end blocks

/-! ### Composition and the blocks -/

section blockcomp

variable {J : ι → ι → ℝ} (hJ : IsCplx J)

omit [Fintype ι] in
lemma swP_comp [Fintype ι] (X Y : T4 ι) : swP (comp X Y) = comp (swP Y) (swP X) := by
  funext a b c d
  simp only [swP, comp]
  exact Finset.sum_congr rfl fun e _ => Finset.sum_congr rfl fun f _ => mul_comm _ _

lemma sq₁_comp (X Y : T4 ι) : sq₁ J (comp X Y) = comp (sq₁ J X) Y := by
  funext a b c d
  simp only [sq₁_apply, comp, Finset.mul_sum, Finset.sum_mul]
  rw [← sum3_rot (fun e f p => J a p * (X p b e f * Y e f c d))]
  exact Finset.sum_congr rfl fun e _ => Finset.sum_congr rfl fun f _ =>
    Finset.sum_congr rfl fun p _ => by ring

lemma sq₃_comp (X Y : T4 ι) : sq₃ J (comp X Y) = comp X (sq₃ J Y) := by
  funext a b c d
  simp only [sq₃_apply, comp, Finset.mul_sum]
  rw [← sum3_rot (fun e f p => J c p * (X a b e f * Y e f p d))]
  exact Finset.sum_congr rfl fun e _ => Finset.sum_congr rfl fun f _ =>
    Finset.sum_congr rfl fun p _ => by ring

/-- One `J` crossing the contraction: `(J₃ X) ∘ Y = −X ∘ (J₁ Y)`. -/
lemma comp_sq₃_left (hJa : ∀ i j, J i j = -J j i) (X Y : T4 ι) :
    comp (sq₃ J X) Y = -comp X (sq₁ J Y) := by
  funext a b c d
  simp only [comp, sq₃_apply, sq₁_apply, Finset.sum_mul, Finset.mul_sum, Pi.neg_apply,
    ← Finset.sum_neg_distrib]
  rw [sum3_pswap13 (fun e f p => J e p * X a b p f * Y e f c d)]
  refine Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun f _ =>
    Finset.sum_congr rfl fun e _ => ?_
  rw [hJa e p]; ring

omit hJ in
lemma K13_comp (X Y : T4 ι) : sq₁ J (sq₃ J (comp X Y)) = comp (sq₁ J X) (sq₃ J Y) := by
  rw [sq₃_comp, sq₁_comp]

include hJ

/-- `X ∘ Y` is `𝒥`-linear when `X` and `Y` are. -/
lemma K13_comp_of (X Y : T4 ι) (hX : sq₁ J (sq₃ J X) = X) (hY : sq₁ J (sq₃ J Y) = Y) :
    sq₁ J (sq₃ J (comp X Y)) = comp X Y := by
  have h3 : ∀ Z : T4 ι, sq₁ J (sq₃ J Z) = Z → sq₃ J Z = -sq₁ J Z := fun Z hZ => by
    have := congrArg (sq₁ J) hZ
    rw [sq_sq1 hJ] at this
    rw [← this, neg_neg]
  rw [K13_comp, h3 Y hY, comp_neg_right, ← comp_sq₃_left hJ.anti, ← sq_comm13, hX]

lemma comp_Q2_P0 (X Y : T4 ι) : comp (Q2 J X) (P0 J Y) = 0 := by
  unfold Q2 P0
  rw [comp_smul_left, comp_smul_right, comp_sub_left, comp_add_right, comp_add_right,
    comp_K34_left hJ.anti, comp_K34_left hJ.anti, K12_sq hJ]
  module

lemma comp_Q0_P2 (X Y : T4 ι) : comp (Q0 J X) (P2 J Y) = 0 := by
  unfold Q0 P2
  rw [comp_smul_left, comp_smul_right, comp_add_left, comp_sub_right, comp_sub_right,
    comp_K34_left hJ.anti, comp_K34_left hJ.anti, K12_sq hJ]
  module

/-- `X ∘ Y = (X Q₀)(P₀ Y) + (X Q₂)(P₂ Y)`. -/
lemma comp_blocks (X Y : T4 ι) : comp X Y = comp (Q0 J X) (P0 J Y) + comp (Q2 J X) (P2 J Y) := by
  conv_lhs => rw [← Q0_add_Q2 (J := J) X, ← P0_add_P2 (J := J) Y]
  rw [comp_add_left, comp_add_right, comp_add_right, comp_Q0_P2 hJ, comp_Q2_P0 hJ]
  abel

omit hJ in
lemma P0_comp (X Y : T4 ι) : P0 J (comp X Y) = comp (P0 J X) Y := by
  unfold P0; rw [K12_comp, comp_smul_left, comp_add_left]
omit hJ in
lemma P2_comp (X Y : T4 ι) : P2 J (comp X Y) = comp (P2 J X) Y := by
  unfold P2; rw [K12_comp, comp_smul_left, comp_sub_left]
omit hJ in
lemma Q0_comp (X Y : T4 ι) : Q0 J (comp X Y) = comp X (Q0 J Y) := by
  unfold Q0; rw [K34_comp, comp_smul_right, comp_add_right]
omit hJ in
lemma Q2_comp (X Y : T4 ι) : Q2 J (comp X Y) = comp X (Q2 J Y) := by
  unfold Q2; rw [K34_comp, comp_smul_right, comp_sub_right]

/-- The blocks of a product: `(XY)_{ac} = X_{a0} Y_{0c} + X_{a2} Y_{2c}`. -/
lemma block_comp (X Y : T4 ι) (Pa : T4 ι → T4 ι) (Qc : T4 ι → T4 ι)
    (hP : ∀ Z W, Pa (comp Z W) = comp (Pa Z) W) (hQ : ∀ Z W, Qc (comp Z W) = comp Z (Qc W)) :
    Pa (Qc (comp X Y)) = comp (Q0 J (Pa X)) (P0 J (Qc Y)) + comp (Q2 J (Pa X)) (P2 J (Qc Y)) := by
  rw [hQ, hP, comp_blocks hJ]

/-! Transposes of blocks. -/

omit hJ in
lemma swP_P0 (X : T4 ι) : swP (P0 J X) = Q0 J (swP X) := by
  unfold P0 Q0; rw [swP_smul, swP_add, swP_sq₁, swP_sq₂]
omit hJ in
lemma swP_P2 (X : T4 ι) : swP (P2 J X) = Q2 J (swP X) := by
  unfold P2 Q2; rw [swP_smul, swP_sub, swP_sq₁, swP_sq₂]
omit hJ in
lemma swP_Q0 (X : T4 ι) : swP (Q0 J X) = P0 J (swP X) := by
  unfold P0 Q0; rw [swP_smul, swP_add, swP_sq₃, swP_sq₄]
omit hJ in
lemma swP_Q2 (X : T4 ι) : swP (Q2 J X) = P2 J (swP X) := by
  unfold P2 Q2; rw [swP_smul, swP_sub, swP_sq₃, swP_sq₄]
omit hJ in
lemma sw34_P0 (X : T4 ι) : sw34 (P0 J X) = P0 J (sw34 X) := by
  unfold P0; rw [sw34_smul, sw34_add, sw34_sq₁, sw34_sq₂]
omit hJ in
lemma sw34_P2 (X : T4 ι) : sw34 (P2 J X) = P2 J (sw34 X) := by
  unfold P2; rw [sw34_smul, sw34_sub, sw34_sq₁, sw34_sq₂]
omit hJ in
lemma sw34_Q2 (X : T4 ι) : sw34 (Q2 J X) = Q2 J (sw34 X) := by
  unfold Q2; rw [sw34_smul, sw34_sub, sw34_sq₃, sw34_sq₄, sq_comm34]
omit hJ in
lemma sw34_Q0 (X : T4 ι) : sw34 (Q0 J X) = Q0 J (sw34 X) := by
  unfold Q0; rw [sw34_smul, sw34_add, sw34_sq₃, sw34_sq₄, sq_comm34]

omit hJ in
lemma K12_Q0 (X : T4 ι) : sq₁ J (sq₂ J (Q0 J X)) = Q0 J (sq₁ J (sq₂ J X)) := by
  unfold Q0; simp only [map_smul, map_add]; rw [K12_K34]
omit hJ in
lemma K12_Q2 (X : T4 ι) : sq₁ J (sq₂ J (Q2 J X)) = Q2 J (sq₁ J (sq₂ J X)) := by
  unfold Q2; simp only [map_smul, map_sub]; rw [K12_K34]

lemma ip4_P0_P0 (X Y : T4 ι) : ip4 (P0 J X) (P0 J Y) = (ip4 X Y + ip4 X (sq₁ J (sq₂ J Y))) / 2 := by
  unfold P0
  rw [ip4_smul_left, ip4_smul_right, ip4_add_left, ip4_add_right, ip4_add_right, ip4_K12 hJ,
    ip4_K12 hJ, K12_sq hJ]
  ring
lemma ip4_P2_P2 (X Y : T4 ι) : ip4 (P2 J X) (P2 J Y) = (ip4 X Y - ip4 X (sq₁ J (sq₂ J Y))) / 2 := by
  unfold P2
  rw [ip4_smul_left, ip4_smul_right, ip4_sub_left, ip4_sub_right, ip4_sub_right, ip4_K12 hJ,
    ip4_K12 hJ, K12_sq hJ]
  ring
lemma ip4_Q0_Q0 (X Y : T4 ι) : ip4 (Q0 J X) (Q0 J Y) = (ip4 X Y + ip4 X (sq₃ J (sq₄ J Y))) / 2 := by
  unfold Q0
  rw [ip4_smul_left, ip4_smul_right, ip4_add_left, ip4_add_right, ip4_add_right, ip4_K34 hJ,
    ip4_K34 hJ, K34_sq hJ]
  ring
lemma ip4_Q2_Q2 (X Y : T4 ι) : ip4 (Q2 J X) (Q2 J Y) = (ip4 X Y - ip4 X (sq₃ J (sq₄ J Y))) / 2 := by
  unfold Q2
  rw [ip4_smul_left, ip4_smul_right, ip4_sub_left, ip4_sub_right, ip4_sub_right, ip4_K34 hJ,
    ip4_K34 hJ, K34_sq hJ]
  ring

/-- The norms of the four blocks in terms of `‖X‖²`, `⟨X, K₁₂ X⟩`, `⟨X, K₃₄ X⟩`, `⟨X, Ω X⟩`. -/
lemma ip4_P0Q0_self (X : T4 ι) :
    ip4 (P0 J (Q0 J X)) (P0 J (Q0 J X))
      = (ip4 X X + ip4 X (sq₁ J (sq₂ J X)) + ip4 X (sq₃ J (sq₄ J X))
        + ip4 X (sq₁ J (sq₂ J (sq₃ J (sq₄ J X))))) / 4 := by
  rw [ip4_P0_P0 hJ, K12_Q0, ip4_Q0_Q0 hJ, ip4_Q0_Q0 hJ, K12_K34]; ring
lemma ip4_P0Q2_self (X : T4 ι) :
    ip4 (P0 J (Q2 J X)) (P0 J (Q2 J X))
      = (ip4 X X + ip4 X (sq₁ J (sq₂ J X)) - ip4 X (sq₃ J (sq₄ J X))
        - ip4 X (sq₁ J (sq₂ J (sq₃ J (sq₄ J X))))) / 4 := by
  rw [ip4_P0_P0 hJ, K12_Q2, ip4_Q2_Q2 hJ, ip4_Q2_Q2 hJ, K12_K34]; ring
lemma ip4_P2Q0_self (X : T4 ι) :
    ip4 (P2 J (Q0 J X)) (P2 J (Q0 J X))
      = (ip4 X X - ip4 X (sq₁ J (sq₂ J X)) + ip4 X (sq₃ J (sq₄ J X))
        - ip4 X (sq₁ J (sq₂ J (sq₃ J (sq₄ J X))))) / 4 := by
  rw [ip4_P2_P2 hJ, K12_Q0, ip4_Q0_Q0 hJ, ip4_Q0_Q0 hJ, K12_K34]; ring
lemma ip4_P2Q2_self (X : T4 ι) :
    ip4 (P2 J (Q2 J X)) (P2 J (Q2 J X))
      = (ip4 X X - ip4 X (sq₁ J (sq₂ J X)) - ip4 X (sq₃ J (sq₄ J X))
        + ip4 X (sq₁ J (sq₂ J (sq₃ J (sq₄ J X))))) / 4 := by
  rw [ip4_P2_P2 hJ, K12_Q2, ip4_Q2_Q2 hJ, ip4_Q2_Q2 hJ, K12_K34]; ring

end blockcomp

/-! ### The blocks of `S` -/

section Sblocks

variable {J : ι → ι → ℝ} (hJ : IsCplx J) {f g : ι → ι → ι → ℝ}
  (hf : ∀ a b c, f a b c = f b a c) (hdf : der3 J f = -g) (hdg : der3 J g = f)

lemma ip4_self_eq_zero {X : T4 ι} (h : ip4 X X = 0) : X = 0 := by
  funext a b c d
  have h1 := (Finset.sum_eq_zero_iff_of_nonneg (fun a _ => Finset.sum_nonneg fun b _ =>
    Finset.sum_nonneg fun c _ => Finset.sum_nonneg fun d _ => mul_self_nonneg (X a b c d))).1 h a
    (Finset.mem_univ _)
  have h2 := (Finset.sum_eq_zero_iff_of_nonneg (fun b _ => Finset.sum_nonneg fun c _ =>
    Finset.sum_nonneg fun d _ => mul_self_nonneg (X a b c d))).1 h1 b (Finset.mem_univ _)
  have h3 := (Finset.sum_eq_zero_iff_of_nonneg (fun c _ =>
    Finset.sum_nonneg fun d _ => mul_self_nonneg (X a b c d))).1 h2 c (Finset.mem_univ _)
  have h4 := (Finset.sum_eq_zero_iff_of_nonneg (fun d _ => mul_self_nonneg (X a b c d))).1 h3 d
    (Finset.mem_univ _)
  exact mul_self_eq_zero.1 h4

omit [Fintype ι] in
lemma K13_P2 [Fintype ι] (X : T4 ι) : sq₁ J (sq₃ J (P2 J X)) = P2 J (sq₁ J (sq₃ J X)) := by
  unfold P2; simp only [map_smul, map_sub]; rw [K12_K13_comm]
omit [Fintype ι] in
lemma K13_Q2 [Fintype ι] (X : T4 ι) : sq₁ J (sq₃ J (Q2 J X)) = Q2 J (sq₁ J (sq₃ J X)) := by
  unfold Q2; simp only [map_smul, map_sub]
  rw [← sq_comm14, ← sq_comm13, ← sq_comm34]

include hJ hf hdf hdg

/-- The charge data of `S = kerS f`: with `h = ‖S‖²` and `m = ‖M‖²`,
`⟨S, K₁₂ S⟩ = ⟨S, K₃₄ S⟩ = (4h − m)/12`, `⟨S, Ω S⟩ = h − m/2`. -/
lemma kerS_charge_data :
    ip4 (kerS f) (sq₁ J (sq₂ J (kerS f)))
        = (4 * ip4 (kerS f) (kerS f)
          - ip4 (sym4 (con g f + con f g)) (sym4 (con g f + con f g))) / 12
    ∧ ip4 (kerS f) (sq₃ J (sq₄ J (kerS f))) = ip4 (kerS f) (sq₁ J (sq₂ J (kerS f)))
    ∧ ip4 (kerS f) (sq₁ J (sq₂ J (sq₃ J (sq₄ J (kerS f)))))
        = ip4 (kerS f) (kerS f)
          - ip4 (sym4 (con g f + con f g)) (sym4 (con g f + con f g)) / 2 := by
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
  refine ⟨by linarith, ip4_K34_eq (kerS_swP' hf), ?_⟩
  rw [← om4_apply, h7, h5]

local notation "S" => kerS f
local notation "τ" => tenTT f J
local notation "hh" => ip4 (kerS f) (kerS f)
local notation "mm" => ip4 (sym4 (con g f + con f g)) (sym4 (con g f + con f g))

lemma tenTT_eq_hm : τ = hh / 6 - mm / 24 := by
  rw [tenTT_eq_of_der hJ hf hdf hdg, tenH_eq_ip4]

/-- `‖S₂₂‖² = 2τ`. -/
lemma ip4_S22 : ip4 (P2 J (Q2 J S)) (P2 J (Q2 J S)) = 2 * τ := by
  obtain ⟨hk, hk', hw⟩ := kerS_charge_data hJ hf hdf hdg
  rw [ip4_P2Q2_self hJ, hk', hk, hw, tenTT_eq_hm hJ hf hdf hdg]; ring
/-- `‖S₀₀‖² = 4τ`. -/
lemma ip4_S00 : ip4 (P0 J (Q0 J S)) (P0 J (Q0 J S)) = 4 * τ := by
  obtain ⟨hk, hk', hw⟩ := kerS_charge_data hJ hf hdf hdg
  rw [ip4_P0Q0_self hJ, hk', hk, hw, tenTT_eq_hm hJ hf hdf hdg]; ring
/-- `‖S₀₂‖² = (h − 6τ)/2`. -/
lemma ip4_S02 : ip4 (P0 J (Q2 J S)) (P0 J (Q2 J S)) = (hh - 6 * τ) / 2 := by
  obtain ⟨hk, hk', hw⟩ := kerS_charge_data hJ hf hdf hdg
  rw [ip4_P0Q2_self hJ, hk', hk, hw, tenTT_eq_hm hJ hf hdf hdg]; ring
/-- `‖S₂₀‖² = (h − 6τ)/2`. -/
lemma ip4_S20 : ip4 (P2 J (Q0 J S)) (P2 J (Q0 J S)) = (hh - 6 * τ) / 2 := by
  obtain ⟨hk, hk', hw⟩ := kerS_charge_data hJ hf hdf hdg
  rw [ip4_P2Q0_self hJ, hk', hk, hw, tenTT_eq_hm hJ hf hdf hdg]; ring

omit hJ hdf hdg in
/-- `S₀₂ = (S₂₀)ᵀ`. -/
lemma S02_eq_swP : P0 J (Q2 J S) = swP (P2 J (Q0 J S)) := by
  rw [swP_P2, swP_Q0, kerS_swP' hf, P0_Q2]

/-- **No charge four**: `K₁₃ S₂₂ = S₂₂`, i.e. the charge-`±2` block commutes with `𝒥`. -/
lemma K13_S22 : sq₁ J (sq₃ J (P2 J (Q2 J S))) = P2 J (Q2 J S) := by
  obtain ⟨hk, hk', hw⟩ := kerS_charge_data hJ hf hdf hdg
  have a1 : sq₃ J (sq₄ J (sq₁ J (sq₃ J S))) = -sq₁ J (sq₄ J S) := by
    rw [← sq_comm14, ← sq_comm13, ← sq_comm34, sq_sq3 hJ, map_neg]
  have a2 : sq₁ J (sq₂ J (sq₁ J (sq₃ J S))) = -sq₂ J (sq₃ J S) := by
    rw [← sq_comm12 (sq₃ J S), sq_sq1 hJ]
  have a3 : sq₃ J (sq₄ J (sq₁ J (sq₂ J (sq₁ J (sq₃ J S))))) = sq₂ J (sq₄ J S) := by
    rw [a2, map_neg, map_neg, ← sq_comm24, ← sq_comm23, ← sq_comm34, sq_sq3 hJ, map_neg, neg_neg]
  have e1 : ip4 (P2 J (Q2 J S)) (sq₁ J (sq₃ J (P2 J (Q2 J S)))) = ip4 S (sq₁ J (sq₂ J S)) := by
    rw [K13_P2, K13_Q2, ip4_P2_P2 hJ, K12_Q2, ip4_Q2_Q2 hJ, ip4_Q2_Q2 hJ, a1, a3, a2, ip4_neg_right,
      ip4_neg_right, ip4_K13_eq (kerS_sw23' hf), ip4_K14_eq (kerS_sw24' hf),
      ip4_K23_eq (kerS_sw13' hf), ip4_K24_eq (kerS_sw14' hf)]
    ring
  have e2 : ip4 (P2 J (Q2 J S)) (P2 J (Q2 J S)) = ip4 S (sq₁ J (sq₂ J S)) := by
    rw [ip4_P2Q2_self hJ, hk', hw, hk]; ring
  have e3 : ip4 (sq₁ J (sq₃ J (P2 J (Q2 J S)))) (sq₁ J (sq₃ J (P2 J (Q2 J S))))
      = ip4 (P2 J (Q2 J S)) (P2 J (Q2 J S)) := by rw [ip4_K13 hJ, K13_sq hJ]
  have h0 : ip4 (P2 J (Q2 J S) - sq₁ J (sq₃ J (P2 J (Q2 J S))))
      (P2 J (Q2 J S) - sq₁ J (sq₃ J (P2 J (Q2 J S)))) = 0 := by
    rw [ip4_sub_left, ip4_sub_right, ip4_sub_right, e3, e1, e2,
      ip4_comm (sq₁ J (sq₃ J (P2 J (Q2 J S)))) (P2 J (Q2 J S)), e1]
    ring
  have := ip4_self_eq_zero h0
  rw [sub_eq_zero] at this
  exact this.symm

end Sblocks

/-! ### The field `trace4` -/

section trace4

variable {J : ι → ι → ℝ} (hJ : IsCplx J) {f g : ι → ι → ι → ℝ}
  (hf : ∀ a b c, f a b c = f b a c) (hdf : der3 J f = -g) (hdg : der3 J g = f)

omit [Fintype ι] in
lemma K13_lin [Fintype ι] (Z : T4 ι) (hJ : IsCplx J) :
    sq₁ J (sq₃ J ((1 / 2 : ℝ) • (Z + sq₁ J (sq₃ J Z)))) = (1 / 2 : ℝ) • (Z + sq₁ J (sq₃ J Z)) := by
  simp only [map_smul, map_add]; rw [K13_sq hJ, add_comm]
omit [Fintype ι] in
lemma K13_anti [Fintype ι] (Z : T4 ι) (hJ : IsCplx J) :
    sq₁ J (sq₃ J ((1 / 2 : ℝ) • (Z - sq₁ J (sq₃ J Z)))) = -((1 / 2 : ℝ) • (Z - sq₁ J (sq₃ J Z))) := by
  simp only [map_smul, map_sub]; rw [K13_sq hJ, ← smul_neg, neg_sub]

/-- `⟨X, N⟩ = 0` for `K₁₃ X = X`, `K₁₃ N = −N`. -/
lemma ip4_lin_anti (hJ : IsCplx J) {X N : T4 ι} (hX : sq₁ J (sq₃ J X) = X)
    (hN : sq₁ J (sq₃ J N) = -N) : ip4 X N = 0 := by
  have h : ip4 X N = -ip4 X N := by
    conv_lhs => rw [← hX, ip4_K13 hJ, hN, ip4_neg_right]
  linarith

lemma le_of_sq_le_sq_nn {x y : ℝ} (hy : 0 ≤ y) (h : x ^ 2 ≤ y ^ 2) : x ≤ y :=
  le_trans (le_abs_self x) (abs_le_of_sq_le_sq h hy)

/-- `⟨A, B⟩ ≤ c` from `‖A‖² ≤ α`, `‖B‖² ≤ β`, `α β ≤ c²`, `c ≥ 0`. -/
lemma ip4_le_of_bounds {A B : T4 ι} {α β c : ℝ} (hA : ip4 A A ≤ α) (hB : ip4 B B ≤ β)
    (hα : 0 ≤ α) (hc : 0 ≤ c) (hαβ : α * β ≤ c ^ 2) : ip4 A B ≤ c := by
  apply le_of_sq_le_sq_nn hc
  calc ip4 A B ^ 2 ≤ ip4 A A * ip4 B B := ip4_sq_le A B
    _ ≤ α * β := mul_le_mul hA hB (ip4_self_nonneg B) hα
    _ ≤ c ^ 2 := hαβ

include hJ hf hdf hdg

local notation "S" => kerS f
local notation "τ" => tenTT f J
local notation "hh" => ip4 (kerS f) (kerS f)

set_option maxHeartbeats 1000000 in
/-- **The field `trace4`**: `T₄ = ‖S²‖² ≤ h²/2 + 8hτ − 48τ²`. -/
theorem trace4_of_der : tenT4 f ≤ tenH f ^ 2 / 2 + 8 * tenH f * tenTT f J - 48 * tenTT f J ^ 2 := by
  have hT4 : tenT4 f = ip4 (comp S S) (comp S S) := by simp only [tenT4, ip4, sq]; rfl
  have hH : tenH f = hh := tenH_eq_ip4 f
  have hτ0 : 0 ≤ τ := tenTT_nonneg f J
  -- the blocks of `S`
  have n22 := ip4_S22 hJ hf hdf hdg
  have n00 := ip4_S00 hJ hf hdf hdg
  have n02 := ip4_S02 hJ hf hdf hdg
  have n20 := ip4_S20 hJ hf hdf hdg
  have hr0 : 0 ≤ (hh - 6 * τ) / 2 := n02 ▸ ip4_self_nonneg _
  have hK := K13_S22 hJ hf hdf hdg
  have hT := S02_eq_swP (J := J) hf
  -- the blocks of `S²`
  have b00 : P0 J (Q0 J (comp S S))
      = comp (P0 J (Q0 J S)) (P0 J (Q0 J S)) + comp (P0 J (Q2 J S)) (P2 J (Q0 J S)) := by
    rw [block_comp hJ S S (P0 J) (Q0 J) P0_comp Q0_comp, ← P0_Q0, ← P0_Q2]
  have b20 : P2 J (Q0 J (comp S S))
      = comp (P2 J (Q0 J S)) (P0 J (Q0 J S)) + comp (P2 J (Q2 J S)) (P2 J (Q0 J S)) := by
    rw [block_comp hJ S S (P2 J) (Q0 J) P2_comp Q0_comp, ← P2_Q0, ← P2_Q2]
  have b22 : P2 J (Q2 J (comp S S))
      = comp (P2 J (Q0 J S)) (P0 J (Q2 J S)) + comp (P2 J (Q2 J S)) (P2 J (Q2 J S)) := by
    rw [block_comp hJ S S (P2 J) (Q2 J) P2_comp Q2_comp, ← P2_Q0, ← P2_Q2]
  have b02 : P0 J (Q2 J (comp S S)) = swP (P2 J (Q0 J (comp S S))) := by
    rw [swP_P2, swP_Q0, swP_comp, kerS_swP' hf, P0_Q2]
  -- bounds
  have B00 : ip4 (P0 J (Q0 J (comp S S))) (P0 J (Q0 J (comp S S)))
      ≤ (4 * τ + (hh - 6 * τ) / 2) ^ 2 := by
    rw [b00, ip4_add_left, ip4_add_right, ip4_add_right]
    have a1 := ip4_comp_le (P0 J (Q0 J S)) (P0 J (Q0 J S))
    have a2 := ip4_comp_le (P0 J (Q2 J S)) (P2 J (Q0 J S))
    rw [n00] at a1
    rw [n02, n20] at a2
    have a1' : ip4 (comp (P0 J (Q0 J S)) (P0 J (Q0 J S))) (comp (P0 J (Q0 J S)) (P0 J (Q0 J S)))
        ≤ (4 * τ) ^ 2 := by linarith [a1]
    have a2' : ip4 (comp (P0 J (Q2 J S)) (P2 J (Q0 J S))) (comp (P0 J (Q2 J S)) (P2 J (Q0 J S)))
        ≤ ((hh - 6 * τ) / 2) ^ 2 := by linarith [a2]
    have a3 := ip4_le_of_bounds a1' a2' (by positivity)
      (mul_nonneg (mul_nonneg (by norm_num) hτ0) hr0)
      (c := 4 * τ * ((hh - 6 * τ) / 2)) (le_of_eq (by ring))
    rw [ip4_comm (comp (P0 J (Q2 J S)) (P2 J (Q0 J S)))]
    linarith [a1', a2', a3]
  have B20 : ip4 (P2 J (Q0 J (comp S S))) (P2 J (Q0 J (comp S S)))
      ≤ 18 * τ * ((hh - 6 * τ) / 4) := by
    rw [b20, ip4_add_left, ip4_add_right, ip4_add_right]
    have a1 := ip4_comp_le (P2 J (Q0 J S)) (P0 J (Q0 J S))
    have a2 := ip4_comp_le_half hJ hK (P2 J (Q0 J S))
    rw [n20, n00] at a1
    rw [n22, n20] at a2
    have a1' : ip4 (comp (P2 J (Q0 J S)) (P0 J (Q0 J S))) (comp (P2 J (Q0 J S)) (P0 J (Q0 J S)))
        ≤ 8 * τ * ((hh - 6 * τ) / 4) := by linarith
    have a2' : ip4 (comp (P2 J (Q2 J S)) (P2 J (Q0 J S))) (comp (P2 J (Q2 J S)) (P2 J (Q0 J S)))
        ≤ 2 * τ * ((hh - 6 * τ) / 4) := by linarith
    have hr4 : 0 ≤ (hh - 6 * τ) / 4 := by linarith
    have a3 := ip4_le_of_bounds a1' a2' (mul_nonneg (mul_nonneg (by norm_num) hτ0) hr4)
      (mul_nonneg (mul_nonneg (by norm_num) hτ0) hr4)
      (c := 4 * τ * ((hh - 6 * τ) / 4)) (le_of_eq (by ring))
    rw [ip4_comm (comp (P2 J (Q2 J S)) (P2 J (Q0 J S)))]
    linarith [a1', a2', a3]
  have B02 : ip4 (P0 J (Q2 J (comp S S))) (P0 J (Q2 J (comp S S)))
      ≤ 18 * τ * ((hh - 6 * τ) / 4) := by
    rw [b02, ip4_swP]; exact B20
  have B22 : ip4 (P2 J (Q2 J (comp S S))) (P2 J (Q2 J (comp S S)))
      ≤ 2 * τ ^ 2 + 4 * τ * ((hh - 6 * τ) / 4) + 4 * ((hh - 6 * τ) / 4) ^ 2 := by
    rw [b22, hT]
    -- `Z = S₂₀ S₀₂ = L + N`, `A = S₂₂ S₂₂`
    obtain ⟨Z, hZ0⟩ : ∃ Z : T4 ι, Z = comp (P2 J (Q0 J S)) (swP (P2 J (Q0 J S))) := ⟨_, rfl⟩
    obtain ⟨A, hA0⟩ : ∃ A : T4 ι, A = comp (P2 J (Q2 J S)) (P2 J (Q2 J S)) := ⟨_, rfl⟩
    rw [← hZ0, ← hA0]
    have hZ : Z = (1 / 2 : ℝ) • (Z + sq₁ J (sq₃ J Z)) + (1 / 2 : ℝ) • (Z - sq₁ J (sq₃ J Z)) := by
      module
    have hL := ip4_lin_compswP_le hJ (P2 J (Q0 J S))
    have hN := ip4_anti_compswP_le hJ (P2 J (Q0 J S))
    rw [n20, ← hZ0] at hL hN
    have hA := ip4_comp_le_half hJ hK (P2 J (Q2 J S))
    rw [n22, ← hA0] at hA
    have hAK : sq₁ J (sq₃ J A) = A := by rw [hA0]; exact K13_comp_of hJ _ _ hK hK
    have o1 := ip4_lin_anti hJ hAK (K13_anti Z hJ)
    have o1' : ip4 ((1 / 2 : ℝ) • (Z - sq₁ J (sq₃ J Z))) A = 0 := by rw [ip4_comm, o1]
    have o2 := ip4_lin_anti hJ (K13_lin Z hJ) (K13_anti Z hJ)
    have o2' : ip4 ((1 / 2 : ℝ) • (Z - sq₁ J (sq₃ J Z))) ((1 / 2 : ℝ) • (Z + sq₁ J (sq₃ J Z))) = 0 := by
      rw [ip4_comm, o2]
    have hA' : ip4 A A ≤ 2 * τ ^ 2 := by linarith
    have hL' : ip4 ((1 / 2 : ℝ) • (Z + sq₁ J (sq₃ J Z))) ((1 / 2 : ℝ) • (Z + sq₁ J (sq₃ J Z)))
        ≤ 2 * ((hh - 6 * τ) / 4) ^ 2 := by linarith
    have hN' : ip4 ((1 / 2 : ℝ) • (Z - sq₁ J (sq₃ J Z))) ((1 / 2 : ℝ) • (Z - sq₁ J (sq₃ J Z)))
        ≤ 2 * ((hh - 6 * τ) / 4) ^ 2 := by linarith
    have hr4 : 0 ≤ (hh - 6 * τ) / 4 := by linarith
    have a3 := ip4_le_of_bounds hA' hL' (by positivity)
      (mul_nonneg (mul_nonneg (by norm_num) hτ0) hr4)
      (c := 2 * τ * ((hh - 6 * τ) / 4)) (le_of_eq (by ring))
    have a3' : ip4 ((1 / 2 : ℝ) • (Z + sq₁ J (sq₃ J Z))) A ≤ 2 * τ * ((hh - 6 * τ) / 4) := by
      rw [ip4_comm]; exact a3
    rw [hZ]
    simp only [ip4_add_left, ip4_add_right]
    linarith [hA', hL', hN', a3, a3', o1, o1', o2, o2']
  -- assemble
  rw [hT4, ip4_self_blocks hJ (comp S S), hH]
  have := add_le_add (add_le_add (add_le_add B00 B02) B20) B22
  linarith [this]

end trace4

/-- **The field `trace4`** for the kernel of the real part of a circular cubic. -/
theorem trace4_circular [DecidableEq ι] {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (hc : Circular J a b) :
    tenT4 (cubicKernel a) ≤ tenH (cubicKernel a) ^ 2 / 2
      + 8 * tenH (cubicKernel a) * tenTT (cubicKernel a) J - 48 * tenTT (cubicKernel a) J ^ 2 :=
  trace4_of_der hc.isCplx (cubicKernel_symm12 a) hc.der3_left hc.der3_right

/-! ### The block trace `T₃`, the charge split and the coupled `G` test -/

section trace3

variable {J : ι → ι → ℝ} (hJ : IsCplx J) {f g : ι → ι → ι → ℝ}
  (hf : ∀ a b c, f a b c = f b a c) (hdf : der3 J f = -g) (hdg : der3 J g = f)

include hJ in
/-- Polarisation of the block decomposition: `⟨X, Y⟩ = Σ_{ac} ⟨X_{ac}, Y_{ac}⟩`. -/
lemma ip4_blocks (X Y : T4 ι) :
    ip4 X Y = ip4 (P0 J (Q0 J X)) (P0 J (Q0 J Y)) + ip4 (P0 J (Q2 J X)) (P0 J (Q2 J Y))
      + ip4 (P2 J (Q0 J X)) (P2 J (Q0 J Y)) + ip4 (P2 J (Q2 J X)) (P2 J (Q2 J Y)) := by
  have hQ : ∀ X Y : T4 ι, ip4 X Y = ip4 (Q0 J X) (Q0 J Y) + ip4 (Q2 J X) (Q2 J Y) := fun X Y => by
    conv_lhs => rw [← Q0_add_Q2 (J := J) X, ← Q0_add_Q2 (J := J) Y]
    rw [ip4_add_left, ip4_add_right, ip4_add_right, ip4_Q0_Q2 hJ, ip4_comm (Q2 J X) (Q0 J Y),
      ip4_Q0_Q2 hJ]
    ring
  have hP : ∀ X Y : T4 ι, ip4 X Y = ip4 (P0 J X) (P0 J Y) + ip4 (P2 J X) (P2 J Y) := fun X Y => by
    conv_lhs => rw [← P0_add_P2 (J := J) X, ← P0_add_P2 (J := J) Y]
    rw [ip4_add_left, ip4_add_right, ip4_add_right, ip4_P0_P2 hJ, ip4_comm (P2 J X) (P0 J Y),
      ip4_P0_P2 hJ]
    ring
  rw [hQ X Y, hP (Q0 J X) (Q0 J Y), hP (Q2 J X) (Q2 J Y)]
  ring

include hJ hf hdf hdg

local notation "S" => kerS f
local notation "τ" => tenTT f J
local notation "hh" => ip4 (kerS f) (kerS f)

omit hJ hdf hdg in
lemma swP_S22 : swP (P2 J (Q2 J S)) = P2 J (Q2 J S) := by
  rw [swP_P2, swP_Q2, kerS_swP' hf, P2_Q2]

set_option maxHeartbeats 1000000 in
/-- **The field `trace3`**: `T₃ = ⟨S², S⟩ ≤ √τ (9h/2 − 17τ)`. -/
theorem trace3_of_der : tenT3 f ≤ √(tenTT f J) * (9 * tenH f / 2 - 17 * tenTT f J) := by
  have hT3 : tenT3 f = ip4 (comp S S) S := by
    have : tenT3 f = ip4 (comp S S) (swP S) := rfl
    rw [this, kerS_swP' hf]
  have hH : tenH f = hh := tenH_eq_ip4 f
  have hτ0 : 0 ≤ τ := tenTT_nonneg f J
  obtain ⟨t, ht⟩ : ∃ t : ℝ, t = √τ := ⟨_, rfl⟩
  have ht0 : 0 ≤ t := ht ▸ Real.sqrt_nonneg _
  have hτt : τ = t ^ 2 := by rw [ht, Real.sq_sqrt hτ0]
  rw [← ht]
  -- the blocks of `S`
  have n22 := ip4_S22 hJ hf hdf hdg
  have n00 := ip4_S00 hJ hf hdf hdg
  have n02 := ip4_S02 hJ hf hdf hdg
  have n20 := ip4_S20 hJ hf hdf hdg
  obtain ⟨ρ, hρ⟩ : ∃ ρ : ℝ, ρ = (hh - 6 * τ) / 2 := ⟨_, rfl⟩
  rw [← hρ] at n02 n20
  have hρ0 : 0 ≤ ρ := n02 ▸ ip4_self_nonneg _
  have hK := K13_S22 hJ hf hdf hdg
  have hT := S02_eq_swP (J := J) hf
  have h22T := swP_S22 (J := J) hf
  -- the blocks of `S²`
  have b00 : P0 J (Q0 J (comp S S))
      = comp (P0 J (Q0 J S)) (P0 J (Q0 J S)) + comp (P0 J (Q2 J S)) (P2 J (Q0 J S)) := by
    rw [block_comp hJ S S (P0 J) (Q0 J) P0_comp Q0_comp, ← P0_Q0, ← P0_Q2]
  have b02 : P0 J (Q2 J (comp S S))
      = comp (P0 J (Q0 J S)) (P0 J (Q2 J S)) + comp (P0 J (Q2 J S)) (P2 J (Q2 J S)) := by
    rw [block_comp hJ S S (P0 J) (Q2 J) P0_comp Q2_comp, ← P0_Q0, ← P0_Q2]
  have b20 : P2 J (Q0 J (comp S S))
      = comp (P2 J (Q0 J S)) (P0 J (Q0 J S)) + comp (P2 J (Q2 J S)) (P2 J (Q0 J S)) := by
    rw [block_comp hJ S S (P2 J) (Q0 J) P2_comp Q0_comp, ← P2_Q0, ← P2_Q2]
  have b22 : P2 J (Q2 J (comp S S))
      = comp (P2 J (Q0 J S)) (P0 J (Q2 J S)) + comp (P2 J (Q2 J S)) (P2 J (Q2 J S)) := by
    rw [block_comp hJ S S (P2 J) (Q2 J) P2_comp Q2_comp, ← P2_Q0, ← P2_Q2]
  -- `(00)`
  have C00 : ip4 (P0 J (Q0 J (comp S S))) (P0 J (Q0 J S)) ≤ 8 * t ^ 3 + 2 * t * ρ := by
    rw [b00, ip4_add_left]
    have a1 := ip4_comp_le (P0 J (Q0 J S)) (P0 J (Q0 J S))
    have a2 := ip4_comp_le (P0 J (Q2 J S)) (P2 J (Q0 J S))
    rw [n00] at a1
    rw [n02, n20] at a2
    have e1 := ip4_le_of_bounds a1 (le_of_eq n00) (by positivity) (by positivity) (c := 8 * t ^ 3)
      (le_of_eq (by rw [hτt]; ring))
    have e2 := ip4_le_of_bounds a2 (le_of_eq n00) (by positivity) (by positivity) (c := 2 * t * ρ)
      (le_of_eq (by rw [hτt]; ring))
    linarith
  -- `(22)`
  have C22 : ip4 (P2 J (Q2 J (comp S S))) (P2 J (Q2 J S)) ≤ 2 * t ^ 3 + t * ρ := by
    rw [b22, hT]
    obtain ⟨Z, hZ0⟩ : ∃ Z : T4 ι, Z = comp (P2 J (Q0 J S)) (swP (P2 J (Q0 J S))) := ⟨_, rfl⟩
    obtain ⟨A, hA0⟩ : ∃ A : T4 ι, A = comp (P2 J (Q2 J S)) (P2 J (Q2 J S)) := ⟨_, rfl⟩
    rw [← hZ0, ← hA0]
    have hZ : Z = (1 / 2 : ℝ) • (Z + sq₁ J (sq₃ J Z)) + (1 / 2 : ℝ) • (Z - sq₁ J (sq₃ J Z)) := by
      module
    have hL := ip4_lin_compswP_le hJ (P2 J (Q0 J S))
    rw [n20, ← hZ0] at hL
    have hA := ip4_comp_le_half hJ hK (P2 J (Q2 J S))
    rw [n22, ← hA0] at hA
    have o1 : ip4 ((1 / 2 : ℝ) • (Z - sq₁ J (sq₃ J Z))) (P2 J (Q2 J S)) = 0 := by
      rw [ip4_comm]; exact ip4_lin_anti hJ hK (K13_anti Z hJ)
    have hA' : ip4 A A ≤ 2 * t ^ 4 := by rw [hτt] at hA; linarith
    have hL' : ip4 ((1 / 2 : ℝ) • (Z + sq₁ J (sq₃ J Z))) ((1 / 2 : ℝ) • (Z + sq₁ J (sq₃ J Z)))
        ≤ ρ ^ 2 / 2 := by linarith
    have e1 := ip4_le_of_bounds hA' (le_of_eq n22) (by positivity) (by positivity) (c := 2 * t ^ 3)
      (le_of_eq (by rw [hτt]; ring))
    have e2 := ip4_le_of_bounds hL' (le_of_eq n22) (by positivity) (by positivity) (c := t * ρ)
      (le_of_eq (by rw [hτt]; ring))
    rw [hZ, ip4_add_left, ip4_add_left, o1]
    linarith
  -- `(02)`
  have C02 : ip4 (P0 J (Q2 J (comp S S))) (P0 J (Q2 J S)) ≤ 2 * t * ρ + t * ρ := by
    rw [b02, ip4_add_left]
    have a1 := ip4_comp_le (P0 J (Q0 J S)) (P0 J (Q2 J S))
    rw [n00, n02] at a1
    have a2 : ip4 (comp (P0 J (Q2 J S)) (P2 J (Q2 J S))) (comp (P0 J (Q2 J S)) (P2 J (Q2 J S)))
        ≤ t ^ 2 * ρ := by
      have := ip4_comp_le_half hJ hK (P2 J (Q0 J S))
      rw [n22, n20] at this
      rw [← ip4_swP, swP_comp, h22T, hT, swP_swP]
      rw [hτt] at this; linarith
    have e1 := ip4_le_of_bounds a1 (le_of_eq n02) (by positivity) (by positivity) (c := 2 * t * ρ)
      (le_of_eq (by rw [hτt]; ring))
    have e2 := ip4_le_of_bounds a2 (le_of_eq n02) (by positivity) (by positivity) (c := t * ρ)
      (le_of_eq (by ring))
    linarith
  -- `(20)`
  have C20 : ip4 (P2 J (Q0 J (comp S S))) (P2 J (Q0 J S)) ≤ 2 * t * ρ + t * ρ := by
    rw [b20, ip4_add_left]
    have a1 := ip4_comp_le (P2 J (Q0 J S)) (P0 J (Q0 J S))
    rw [n20, n00] at a1
    have a2 := ip4_comp_le_half hJ hK (P2 J (Q0 J S))
    rw [n22, n20] at a2
    have a2' : ip4 (comp (P2 J (Q2 J S)) (P2 J (Q0 J S))) (comp (P2 J (Q2 J S)) (P2 J (Q0 J S)))
        ≤ t ^ 2 * ρ := by rw [hτt] at a2; linarith
    have e1 := ip4_le_of_bounds a1 (le_of_eq n20) (by positivity) (by positivity) (c := 2 * t * ρ)
      (le_of_eq (by rw [hτt]; ring))
    have e2 := ip4_le_of_bounds a2' (le_of_eq n20) (by positivity) (by positivity) (c := t * ρ)
      (le_of_eq (by ring))
    linarith
  rw [hT3, ip4_blocks hJ (comp S S) S, hH]
  have := add_le_add (add_le_add (add_le_add C00 C02) C20) C22
  have hρ' : ρ = (hh - 6 * t ^ 2) / 2 := by rw [hρ, hτt]
  rw [hτt]
  nlinarith [this, hρ']

end trace3

/-! ### The charge split -/

section chargesplit

variable {J : ι → ι → ℝ} (hJ : IsCplx J) {f g : ι → ι → ι → ℝ}
  (hf : ∀ a b c, f a b c = f b a c) (hg : ∀ a b c, g a b c = g b a c)
  (hf13 : ∀ a b c, f a b c = f c b a) (hdf : der3 J f = -g) (hdg : der3 J g = f)

/-- Two-term Cauchy–Schwarz: `(x₁ + x₂)² ≤ (a₁ + a₂)(b₁ + b₂)` from `xᵢ² ≤ aᵢ bᵢ`. -/
lemma sq_add_le_of_sq_le {x₁ x₂ a₁ a₂ b₁ b₂ : ℝ} (h₁ : x₁ ^ 2 ≤ a₁ * b₁) (h₂ : x₂ ^ 2 ≤ a₂ * b₂)
    (ha₁ : 0 ≤ a₁) (ha₂ : 0 ≤ a₂) (hb₁ : 0 ≤ b₁) (hb₂ : 0 ≤ b₂) :
    (x₁ + x₂) ^ 2 ≤ (a₁ + a₂) * (b₁ + b₂) := by
  have h3 : (2 * x₁ * x₂) ^ 2 ≤ (a₁ * b₂ + a₂ * b₁) ^ 2 := by
    have := mul_le_mul h₁ h₂ (sq_nonneg x₂) (mul_nonneg ha₁ hb₁)
    nlinarith [sq_nonneg (a₁ * b₂ - a₂ * b₁)]
  have h4 : 2 * x₁ * x₂ ≤ a₁ * b₂ + a₂ * b₁ :=
    le_trans (le_abs_self _) (abs_le_of_sq_le_sq h3 (by positivity))
  nlinarith

/-- `x ≤ √y` from `x² ≤ y`. -/
lemma le_sqrt_of_sq_le {x y : ℝ} (h : x ^ 2 ≤ y) : x ≤ √y :=
  le_trans (le_abs_self x) (by rw [← Real.sqrt_sq_eq_abs]; exact Real.sqrt_le_sqrt h)

include hJ

/-- The blocks of `(1 + Ω)/2` and `(1 − Ω)/2`. -/
lemma om4_P0Q0 (X : T4 ι) : om4 J (P0 J (Q0 J X)) = P0 J (Q0 J X) := by
  rw [om4_apply, P0_Q0, K34_Q0 hJ, ← P0_Q0, K12_P0 hJ]
lemma om4_P2Q2 (X : T4 ι) : om4 J (P2 J (Q2 J X)) = P2 J (Q2 J X) := by
  rw [om4_apply, P2_Q2, K34_Q2 hJ, map_neg, map_neg, ← P2_Q2, K12_P2 hJ, neg_neg]
lemma om4_P0Q2 (X : T4 ι) : om4 J (P0 J (Q2 J X)) = -P0 J (Q2 J X) := by
  rw [om4_apply, P0_Q2, K34_Q2 hJ, map_neg, map_neg, ← P0_Q2, K12_P0 hJ]
lemma om4_P2Q0 (X : T4 ι) : om4 J (P2 J (Q0 J X)) = -P2 J (Q0 J X) := by
  rw [om4_apply, P2_Q0, K34_Q0 hJ, ← P2_Q0, K12_P2 hJ]

omit hJ in
lemma P0Q0_om4 (X : T4 ι) : P0 J (Q0 J (om4 J X)) = om4 J (P0 J (Q0 J X)) := by
  unfold P0 Q0; simp only [map_smul, map_add, om4_sq₁, om4_sq₂, om4_sq₃, om4_sq₄]
omit hJ in
lemma P0Q2_om4 (X : T4 ι) : P0 J (Q2 J (om4 J X)) = om4 J (P0 J (Q2 J X)) := by
  unfold P0 Q2; simp only [map_smul, map_add, map_sub, om4_sq₁, om4_sq₂, om4_sq₃, om4_sq₄]
omit hJ in
lemma P2Q0_om4 (X : T4 ι) : P2 J (Q0 J (om4 J X)) = om4 J (P2 J (Q0 J X)) := by
  unfold P2 Q0; simp only [map_smul, map_add, map_sub, om4_sq₁, om4_sq₂, om4_sq₃, om4_sq₄]
omit hJ in
lemma P2Q2_om4 (X : T4 ι) : P2 J (Q2 J (om4 J X)) = om4 J (P2 J (Q2 J X)) := by
  unfold P2 Q2; simp only [map_smul, map_sub, om4_sq₁, om4_sq₂, om4_sq₃, om4_sq₄]

lemma P0Q0_ch0 (X : T4 ι) : P0 J (Q0 J (ch0 J X)) = P0 J (Q0 J X) := by
  unfold ch0; rw [Q0_smul, P0_smul, Q0_add, P0_add, P0Q0_om4, om4_P0Q0 hJ]; module
lemma P2Q2_ch0 (X : T4 ι) : P2 J (Q2 J (ch0 J X)) = P2 J (Q2 J X) := by
  unfold ch0; rw [Q2_smul, P2_smul, Q2_add, P2_add, P2Q2_om4, om4_P2Q2 hJ]; module
lemma P0Q2_ch0 (X : T4 ι) : P0 J (Q2 J (ch0 J X)) = 0 := by
  unfold ch0; rw [Q2_smul, P0_smul, Q2_add, P0_add, P0Q2_om4, om4_P0Q2 hJ]; module
lemma P2Q0_ch0 (X : T4 ι) : P2 J (Q0 J (ch0 J X)) = 0 := by
  unfold ch0; rw [Q0_smul, P2_smul, Q0_add, P2_add, P2Q0_om4, om4_P2Q0 hJ]; module
lemma P0Q0_ch2 (X : T4 ι) : P0 J (Q0 J (ch2 J X)) = 0 := by
  unfold ch2; rw [Q0_smul, P0_smul, Q0_sub, P0_sub, P0Q0_om4, om4_P0Q0 hJ]; module
lemma P2Q2_ch2 (X : T4 ι) : P2 J (Q2 J (ch2 J X)) = 0 := by
  unfold ch2; rw [Q2_smul, P2_smul, Q2_sub, P2_sub, P2Q2_om4, om4_P2Q2 hJ]; module
lemma P0Q2_ch2 (X : T4 ι) : P0 J (Q2 J (ch2 J X)) = P0 J (Q2 J X) := by
  unfold ch2; rw [Q2_smul, P0_smul, Q2_sub, P0_sub, P0Q2_om4, om4_P0Q2 hJ]; module
lemma P2Q0_ch2 (X : T4 ι) : P2 J (Q0 J (ch2 J X)) = P2 J (Q0 J X) := by
  unfold ch2; rw [Q0_smul, P2_smul, Q0_sub, P2_sub, P2Q0_om4, om4_P2Q0 hJ]; module

/-- `‖X₀‖² = ‖X₀₀‖² + ‖X₂₂‖²`, `‖X₂‖² = ‖X₀₂‖² + ‖X₂₀‖²`. -/
lemma ip4_ch0_blocks (X : T4 ι) :
    ip4 (ch0 J X) (ch0 J X) = ip4 (P0 J (Q0 J X)) (P0 J (Q0 J X)) + ip4 (P2 J (Q2 J X)) (P2 J (Q2 J X)) := by
  rw [ip4_self_blocks hJ (ch0 J X), P0Q0_ch0 hJ, P2Q2_ch0 hJ, P0Q2_ch0 hJ, P2Q0_ch0 hJ]
  simp only [ip4, Pi.zero_apply, mul_zero, Finset.sum_const_zero]
  ring
lemma ip4_ch2_blocks (X : T4 ι) :
    ip4 (ch2 J X) (ch2 J X) = ip4 (P0 J (Q2 J X)) (P0 J (Q2 J X)) + ip4 (P2 J (Q0 J X)) (P2 J (Q0 J X)) := by
  rw [ip4_self_blocks hJ (ch2 J X), P0Q0_ch2 hJ, P2Q2_ch2 hJ, P0Q2_ch2 hJ, P2Q0_ch2 hJ]
  simp only [ip4, Pi.zero_apply, mul_zero, Finset.sum_const_zero]
  ring

/-- **No charge four**, generally: for `X` with `⟨X, K₃₄ X⟩ = ⟨X, K₁₂ X⟩`, the three
`⟨X, K₁₃ X⟩ = ⟨X, K₂₃ X⟩ = ⟨X, K₂₄ X⟩ = ⟨X, K₁₄ X⟩`, and `Σ Kᵢⱼ X = X + Ω X`,
the block `X₂₂` commutes with `𝒥`. -/
lemma K13_P2Q2_of (X : T4 ι) (h34 : ip4 X (sq₃ J (sq₄ J X)) = ip4 X (sq₁ J (sq₂ J X)))
    (h13 : ip4 X (sq₁ J (sq₃ J X)) = ip4 X (sq₁ J (sq₄ J X)))
    (h23 : ip4 X (sq₂ J (sq₃ J X)) = ip4 X (sq₁ J (sq₄ J X)))
    (h24 : ip4 X (sq₂ J (sq₄ J X)) = ip4 X (sq₁ J (sq₄ J X)))
    (hsum : sq₁ J (sq₂ J X) + sq₁ J (sq₃ J X) + sq₁ J (sq₄ J X) + sq₂ J (sq₃ J X)
      + sq₂ J (sq₄ J X) + sq₃ J (sq₄ J X) = X + om4 J X) :
    sq₁ J (sq₃ J (P2 J (Q2 J X))) = P2 J (Q2 J X) := by
  have a1 : sq₃ J (sq₄ J (sq₁ J (sq₃ J X))) = -sq₁ J (sq₄ J X) := by
    rw [← sq_comm14, ← sq_comm13, ← sq_comm34, sq_sq3 hJ, map_neg]
  have a2 : sq₁ J (sq₂ J (sq₁ J (sq₃ J X))) = -sq₂ J (sq₃ J X) := by
    rw [← sq_comm12 (sq₃ J X), sq_sq1 hJ]
  have a3 : sq₃ J (sq₄ J (sq₁ J (sq₂ J (sq₁ J (sq₃ J X))))) = sq₂ J (sq₄ J X) := by
    rw [a2, map_neg, map_neg, ← sq_comm24, ← sq_comm23, ← sq_comm34, sq_sq3 hJ, map_neg, neg_neg]
  have e1 : ip4 (P2 J (Q2 J X)) (sq₁ J (sq₃ J (P2 J (Q2 J X)))) = ip4 X (sq₁ J (sq₄ J X)) := by
    rw [K13_P2, K13_Q2, ip4_P2_P2 hJ, K12_Q2, ip4_Q2_Q2 hJ, ip4_Q2_Q2 hJ, a1, a3, a2, ip4_neg_right,
      ip4_neg_right, h13, h23, h24]
    ring
  have hs := congrArg (ip4 X) hsum
  simp only [ip4_add_right] at hs
  rw [h13, h23, h24, h34] at hs
  have e2 : ip4 (P2 J (Q2 J X)) (P2 J (Q2 J X)) = ip4 X (sq₁ J (sq₄ J X)) := by
    rw [ip4_P2Q2_self hJ, h34, ← om4_apply]; linarith
  have e3 : ip4 (sq₁ J (sq₃ J (P2 J (Q2 J X)))) (sq₁ J (sq₃ J (P2 J (Q2 J X))))
      = ip4 (P2 J (Q2 J X)) (P2 J (Q2 J X)) := by rw [ip4_K13 hJ, K13_sq hJ]
  have h0 : ip4 (P2 J (Q2 J X) - sq₁ J (sq₃ J (P2 J (Q2 J X))))
      (P2 J (Q2 J X) - sq₁ J (sq₃ J (P2 J (Q2 J X)))) = 0 := by
    rw [ip4_sub_left, ip4_sub_right, ip4_sub_right, e3, e1, e2,
      ip4_comm (sq₁ J (sq₃ J (P2 J (Q2 J X)))) (P2 J (Q2 J X)), e1]
    ring
  have := ip4_self_eq_zero h0
  rw [sub_eq_zero] at this
  exact this.symm

include hf hdf hdg

local notation "S" => kerS f
local notation "C" => con f f
local notation "τ" => tenTT f J
local notation "hh" => ip4 (kerS f) (kerS f)

omit hf in
/-- `Σ Kᵢⱼ C = C + Ω C` (`δ² C = −2 (1 − Ω) C`). -/
lemma sumK_C : sq₁ J (sq₂ J C) + sq₁ J (sq₃ J C) + sq₁ J (sq₄ J C) + sq₂ J (sq₃ J C)
      + sq₂ J (sq₄ J C) + sq₃ J (sq₄ J C) = C + om4 J C := by
  have h1 := der4_sq hJ C
  have h2 : der4 J (der4 J C) = -(2 : ℝ) • C + (2 : ℝ) • om4 J C := by
    rw [der4_C' hJ hdf hdg, map_sub, der4_K12, der4_K34, der4_B hJ hdf hdg, map_sub, map_sub,
      map_sub, map_sub, K12_sq hJ, K34_sq hJ, ← om4_apply, ← K12_K34, ← om4_apply]
    module
  rw [h2] at h1
  have h3 : (2 : ℝ) • (sq₁ J (sq₂ J C) + sq₁ J (sq₃ J C) + sq₁ J (sq₄ J C) + sq₂ J (sq₃ J C)
      + sq₂ J (sq₄ J C) + sq₃ J (sq₄ J C)) = (2 : ℝ) • (C + om4 J C) := by
    rw [← sub_eq_zero]
    have : (2 : ℝ) • (sq₁ J (sq₂ J C) + sq₁ J (sq₃ J C) + sq₁ J (sq₄ J C) + sq₂ J (sq₃ J C)
        + sq₂ J (sq₄ J C) + sq₃ J (sq₄ J C)) - (2 : ℝ) • (C + om4 J C)
        = (-(4 : ℝ) • C + (2 : ℝ) • (sq₁ J (sq₂ J C)
          + sq₁ J (sq₃ J C) + sq₁ J (sq₄ J C) + sq₂ J (sq₃ J C) + sq₂ J (sq₄ J C)
          + sq₃ J (sq₄ J C))) - (-(2 : ℝ) • C + (2 : ℝ) • om4 J C) := by module
    rw [this, ← h1, sub_self]
  exact smul_right_injective _ (two_ne_zero) h3

/-- `K₁₃ C₂₂ = C₂₂`. -/
lemma K13_C22 : sq₁ J (sq₃ J (P2 J (Q2 J C))) = P2 J (Q2 J C) := by
  apply K13_P2Q2_of hJ C
  · exact ip4_K34_eq_K12_of_swP hJ _ (Or.inl (swP_C))
  · -- `K₁₃ ~ K₁₄` by `sw34`
    have e : sq₁ J (sq₄ J C) = sw34 (sq₁ J (sq₃ J C)) := by rw [sw34_sq₁, sw34_sq₃, sw34_C hf]
    rw [e, ← ip4_sw34_adj, sw34_C hf]
  · have e : sq₂ J (sq₃ J C) = swP (sq₁ J (sq₄ J C)) := by rw [swP_sq₁, swP_sq₄, swP_C, sq_comm23]
    rw [e, ← ip4_swP_adj, swP_C]
  · have e : sq₂ J (sq₄ J C) = sw12 (sq₁ J (sq₄ J C)) := by rw [sw12_sq₁, sw12_sq₄, sw12_C hf]
    rw [e, ← ip4_sw12_adj, sw12_C hf]
  · exact sumK_C hJ hdf hdg

omit hJ hdf hdg in
/-- `‖U‖² = ⟨S², C⟩`: `U = S F` and `C = F Fᵀ`. -/
lemma tenU2_eq_ip4 : tenU2 f = ip4 (comp S S) C := by
  have hS : ∀ a b c d, S a b c d = S c d a b := fun a b c d =>
    congrFun (congrFun (congrFun (congrFun (kerS_swP' hf) c) d) a) b
  have sum_comm_4 : ∀ g : ι → ι → ι → ι → ι → ℝ,
      ∑ e, ∑ p, ∑ q, ∑ r, ∑ s, g e p q r s = ∑ p, ∑ q, ∑ r, ∑ s, ∑ e, g e p q r s := by
    intro g
    rw [Finset.sum_comm]; refine Finset.sum_congr rfl fun p _ => ?_
    rw [Finset.sum_comm]; refine Finset.sum_congr rfl fun q _ => ?_
    rw [Finset.sum_comm]; refine Finset.sum_congr rfl fun r _ => ?_
    rw [Finset.sum_comm]
  calc tenU2 f = ∑ e, ∑ e', ∑ x, ∑ p, ∑ q, ∑ r, ∑ s,
        S e e' p q * f p q x * (S e e' r s * f r s x) := by
        simp only [tenU2, kerU]
        refine Finset.sum_congr rfl fun e _ => Finset.sum_congr rfl fun e' _ =>
          Finset.sum_congr rfl fun x _ => ?_
        rw [sq, Finset.sum_mul]; refine Finset.sum_congr rfl fun p _ => ?_
        rw [Finset.sum_mul]; refine Finset.sum_congr rfl fun q _ => ?_
        rw [Finset.mul_sum]; refine Finset.sum_congr rfl fun r _ => ?_
        rw [Finset.mul_sum]
    _ = ∑ e, ∑ e', ∑ p, ∑ q, ∑ r, ∑ s, ∑ x, S e e' p q * f p q x * (S e e' r s * f r s x) :=
        Finset.sum_congr rfl fun e _ => Finset.sum_congr rfl fun e' _ => sum_comm_4 _
    _ = ∑ e, ∑ p, ∑ q, ∑ r, ∑ s, ∑ e', ∑ x, S e e' p q * f p q x * (S e e' r s * f r s x) :=
        Finset.sum_congr rfl fun e _ => sum_comm_4 _
    _ = ∑ p, ∑ q, ∑ r, ∑ s, ∑ e, ∑ e', ∑ x, S e e' p q * f p q x * (S e e' r s * f r s x) :=
        sum_comm_4 _
    _ = ip4 (comp S S) C := by
        simp only [ip4, comp, con]
        refine Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun q _ =>
          Finset.sum_congr rfl fun r _ => Finset.sum_congr rfl fun s _ => ?_
        rw [Finset.sum_mul]; refine Finset.sum_congr rfl fun e _ => ?_
        rw [Finset.sum_mul]; refine Finset.sum_congr rfl fun e' _ => ?_
        rw [Finset.mul_sum]; refine Finset.sum_congr rfl fun x _ => ?_
        rw [hS e e' p q]; ring

include hg hf13 in
set_option maxHeartbeats 2000000 in
/-- **The field `chargeSplit`**: `‖U‖² ≤ θ T₃ + √(A₀ B₀) + √(A₂ B₂)`. -/
theorem chargeSplit_of_der : tenU2 f ≤ thetaC * tenT3 f
    + √((2 * tenS f / 3 - 2 * tenH f + (18 + 6 * kC) * tenTT f J)
        * (3 * tenH f ^ 2 / 8 + tenH f * tenTT f J / 2 + 3 * tenTT f J ^ 2 / 2))
    + √((tenS f / 3 + (2 + kC) * tenH f - (18 + 6 * kC) * tenTT f J)
        * (9 * tenH f * tenTT f J - 54 * tenTT f J ^ 2)) := by
  obtain ⟨hs, hhS, hq, hm, htt, hC0, hC2, hS0, hS2, hS0n, hS2n⟩ :=
    sector_data hJ hf hg hf13 hdf hdg
  have hk : kC = thetaC ^ 2 - 2 * thetaC := rfl
  have hH : tenH f = hh := tenH_eq_ip4 f
  have hτ0 : 0 ≤ τ := tenTT_nonneg f J
  -- `W = C − θ S`
  obtain ⟨W, hW⟩ : ∃ W : T4 ι, W = C - thetaC • S := ⟨_, rfl⟩
  have hU : tenU2 f = thetaC * tenT3 f + ip4 (comp S S) W := by
    rw [tenU2_eq_ip4 hf, hW, ip4_sub_right, ip4_smul_right]
    have e : tenT3 f = ip4 (comp S S) (swP S) := rfl
    rw [e, kerS_swP' hf]; ring
  -- the charge-zero and charge-two norms of `W`: the sector quantities `A₀`, `A₂`
  have hA0 : ip4 (ch0 J W) (ch0 J W)
      = 2 * tenS f / 3 - 2 * tenH f + (18 + 6 * kC) * tenTT f J := by
    obtain ⟨X, hX0⟩ : ∃ X : T4 ι, X = (1 / 2 : ℝ) • (C + con g g) := ⟨_, rfl⟩
    rw [← hX0] at hC0 hS0
    rw [← hS0] at hS0n
    have e0 : ch0 J W = X - thetaC • sym4 X := by
      rw [hW, hS0, hX0]; unfold ch0
      rw [map_sub, map_smul, kerS_eq_sym4, om4_sym4, om4_C hJ hdf hdg]; module
    have hXs : ∀ a b c d, X a b d c = X a b c d := fun a b c d => by
      rw [hX0]; simp only [Pi.smul_apply, Pi.add_apply, con, hf d c, hg d c]
    have h1 := three_ip4_sym4 hXs
    have h2 := nine_sym4_sq hXs
    have e2 : ip4 X (sym4 X) = ip4 (sym4 X) (sym4 X) := by linarith
    rw [e0]
    simp only [ip4_sub_left, ip4_sub_right, ip4_smul_left, ip4_smul_right]
    rw [ip4_comm (sym4 X) X, e2, hS0n, hC0, hs, hhS, htt, hk]
    linarith [hq, hm]
  have hA2 : ip4 (ch2 J W) (ch2 J W)
      = tenS f / 3 + (2 + kC) * tenH f - (18 + 6 * kC) * tenTT f J := by
    obtain ⟨X, hX0⟩ : ∃ X : T4 ι, X = (1 / 2 : ℝ) • (C - con g g) := ⟨_, rfl⟩
    rw [← hX0] at hC2 hS2
    rw [← hS2] at hS2n
    have e0 : ch2 J W = X - thetaC • sym4 X := by
      rw [hW, hS2, hX0]; unfold ch2
      rw [map_sub, map_smul, kerS_eq_sym4, om4_sym4, om4_C hJ hdf hdg]; module
    have hXs : ∀ a b c d, X a b d c = X a b c d := fun a b c d => by
      rw [hX0]; simp only [Pi.smul_apply, Pi.sub_apply, con, hf d c, hg d c]
    have h1 := three_ip4_sym4 hXs
    have h2 := nine_sym4_sq hXs
    have e2 : ip4 X (sym4 X) = ip4 (sym4 X) (sym4 X) := by linarith
    rw [e0]
    simp only [ip4_sub_left, ip4_sub_right, ip4_smul_left, ip4_smul_right]
    rw [ip4_comm (sym4 X) X, e2, hS2n, hC2, hs, hhS, htt, hk]
    linarith [hq, hm]
  have hA0nn : 0 ≤ ip4 (ch0 J W) (ch0 J W) := ip4_self_nonneg _
  have hA2nn : 0 ≤ ip4 (ch2 J W) (ch2 J W) := ip4_self_nonneg _
  -- the blocks of `S`
  have n22 := ip4_S22 hJ hf hdf hdg
  have n00 := ip4_S00 hJ hf hdf hdg
  have n02 := ip4_S02 hJ hf hdf hdg
  have n20 := ip4_S20 hJ hf hdf hdg
  obtain ⟨ρ, hρ⟩ : ∃ ρ : ℝ, ρ = (hh - 6 * τ) / 2 := ⟨_, rfl⟩
  rw [← hρ] at n02 n20
  have hρ0 : 0 ≤ ρ := n02 ▸ ip4_self_nonneg _
  have hK := K13_S22 hJ hf hdf hdg
  have hT := S02_eq_swP (J := J) hf
  -- the blocks of `S²`
  have b00 : P0 J (Q0 J (comp S S))
      = comp (P0 J (Q0 J S)) (P0 J (Q0 J S)) + comp (P0 J (Q2 J S)) (P2 J (Q0 J S)) := by
    rw [block_comp hJ S S (P0 J) (Q0 J) P0_comp Q0_comp, ← P0_Q0, ← P0_Q2]
  have b20 : P2 J (Q0 J (comp S S))
      = comp (P2 J (Q0 J S)) (P0 J (Q0 J S)) + comp (P2 J (Q2 J S)) (P2 J (Q0 J S)) := by
    rw [block_comp hJ S S (P2 J) (Q0 J) P2_comp Q0_comp, ← P2_Q0, ← P2_Q2]
  have b22 : P2 J (Q2 J (comp S S))
      = comp (P2 J (Q0 J S)) (P0 J (Q2 J S)) + comp (P2 J (Q2 J S)) (P2 J (Q2 J S)) := by
    rw [block_comp hJ S S (P2 J) (Q2 J) P2_comp Q2_comp, ← P2_Q0, ← P2_Q2]
  have b02 : P0 J (Q2 J (comp S S)) = swP (P2 J (Q0 J (comp S S))) := by
    rw [swP_P2, swP_Q0, swP_comp, kerS_swP' hf, P0_Q2]
  -- bounds on the blocks of `S²`
  have B00 : ip4 (P0 J (Q0 J (comp S S))) (P0 J (Q0 J (comp S S))) ≤ (4 * τ + ρ) ^ 2 := by
    rw [b00, ip4_add_left, ip4_add_right, ip4_add_right]
    have a1 := ip4_comp_le (P0 J (Q0 J S)) (P0 J (Q0 J S))
    have a2 := ip4_comp_le (P0 J (Q2 J S)) (P2 J (Q0 J S))
    rw [n00] at a1
    rw [n02, n20] at a2
    have a1' : ip4 (comp (P0 J (Q0 J S)) (P0 J (Q0 J S))) (comp (P0 J (Q0 J S)) (P0 J (Q0 J S)))
        ≤ (4 * τ) ^ 2 := by linarith [a1]
    have a2' : ip4 (comp (P0 J (Q2 J S)) (P2 J (Q0 J S))) (comp (P0 J (Q2 J S)) (P2 J (Q0 J S)))
        ≤ ρ ^ 2 := by linarith [a2]
    have a3 := ip4_le_of_bounds a1' a2' (by positivity)
      (mul_nonneg (mul_nonneg (by norm_num) hτ0) hρ0)
      (c := 4 * τ * ρ) (le_of_eq (by ring))
    rw [ip4_comm (comp (P0 J (Q2 J S)) (P2 J (Q0 J S)))]
    linarith [a1', a2', a3]
  have B20 : ip4 (P2 J (Q0 J (comp S S))) (P2 J (Q0 J (comp S S))) ≤ 9 * τ * ρ := by
    rw [b20, ip4_add_left, ip4_add_right, ip4_add_right]
    have a1 := ip4_comp_le (P2 J (Q0 J S)) (P0 J (Q0 J S))
    have a2 := ip4_comp_le_half hJ hK (P2 J (Q0 J S))
    rw [n20, n00] at a1
    rw [n22, n20] at a2
    have a1' : ip4 (comp (P2 J (Q0 J S)) (P0 J (Q0 J S))) (comp (P2 J (Q0 J S)) (P0 J (Q0 J S)))
        ≤ 4 * τ * ρ := by linarith
    have a2' : ip4 (comp (P2 J (Q2 J S)) (P2 J (Q0 J S))) (comp (P2 J (Q2 J S)) (P2 J (Q0 J S)))
        ≤ τ * ρ := by linarith
    have a3 := ip4_le_of_bounds a1' a2' (mul_nonneg (mul_nonneg (by norm_num) hτ0) hρ0)
      (mul_nonneg (mul_nonneg (by norm_num) hτ0) hρ0)
      (c := 2 * τ * ρ) (le_of_eq (by ring))
    rw [ip4_comm (comp (P2 J (Q2 J S)) (P2 J (Q0 J S)))]
    linarith [a1', a2', a3]
  have B02 : ip4 (P0 J (Q2 J (comp S S))) (P0 J (Q2 J (comp S S))) ≤ 9 * τ * ρ := by
    rw [b02, ip4_swP]; exact B20
  -- the `𝒥`-linear part of the `(22)` block
  obtain ⟨Z2, hZ2⟩ : ∃ Z2 : T4 ι, Z2 = P2 J (Q2 J (comp S S)) := ⟨_, rfl⟩
  obtain ⟨L, hL0⟩ : ∃ L : T4 ι, L = (1 / 2 : ℝ) • (Z2 + sq₁ J (sq₃ J Z2)) := ⟨_, rfl⟩
  have BL : ip4 L L ≤ ρ ^ 2 / 2 + 2 * τ * ρ + 2 * τ ^ 2 := by
    obtain ⟨Y, hY0⟩ : ∃ Y : T4 ι, Y = comp (P2 J (Q0 J S)) (swP (P2 J (Q0 J S))) := ⟨_, rfl⟩
    obtain ⟨A, hA0'⟩ : ∃ A : T4 ι, A = comp (P2 J (Q2 J S)) (P2 J (Q2 J S)) := ⟨_, rfl⟩
    have hAK : sq₁ J (sq₃ J A) = A := by rw [hA0']; exact K13_comp_of hJ _ _ hK hK
    have hLe : L = (1 / 2 : ℝ) • (Y + sq₁ J (sq₃ J Y)) + A := by
      rw [hL0, hZ2, b22, hT, ← hY0, ← hA0', map_add, map_add, hAK]; module
    have hL := ip4_lin_compswP_le hJ (P2 J (Q0 J S))
    rw [n20, ← hY0] at hL
    have hA := ip4_comp_le_half hJ hK (P2 J (Q2 J S))
    rw [n22, ← hA0'] at hA
    have hLy : ip4 ((1 / 2 : ℝ) • (Y + sq₁ J (sq₃ J Y))) ((1 / 2 : ℝ) • (Y + sq₁ J (sq₃ J Y)))
        ≤ ρ ^ 2 / 2 := by linarith
    have hA' : ip4 A A ≤ 2 * τ ^ 2 := by linarith
    have a3 := ip4_le_of_bounds hLy hA' (by positivity)
      (mul_nonneg hτ0 hρ0) (c := τ * ρ) (le_of_eq (by ring))
    rw [hLe, ip4_add_left, ip4_add_right, ip4_add_right, ip4_comm A ((1 / 2 : ℝ) • (Y + sq₁ J (sq₃ J Y)))]
    linarith
  -- `W₂₂` is `𝒥`-linear, so only the linear part of `(S²)₂₂` sees it
  have hKW : sq₁ J (sq₃ J (P2 J (Q2 J W))) = P2 J (Q2 J W) := by
    rw [hW, Q2_sub, P2_sub, Q2_smul, P2_smul, map_sub, map_sub, map_smul, map_smul,
      K13_C22 hJ hf hdf hdg, hK]
  have split : ip4 (P2 J (Q2 J (comp S S))) (P2 J (Q2 J W)) = ip4 L (P2 J (Q2 J W)) := by
    have hd : Z2 = L + (1 / 2 : ℝ) • (Z2 - sq₁ J (sq₃ J Z2)) := by rw [hL0]; module
    rw [← hZ2]
    calc ip4 Z2 (P2 J (Q2 J W)) = ip4 (L + (1 / 2 : ℝ) • (Z2 - sq₁ J (sq₃ J Z2))) (P2 J (Q2 J W)) := by
          rw [← hd]
      _ = ip4 L (P2 J (Q2 J W)) := by
          rw [ip4_add_left, ip4_comm ((1 / 2 : ℝ) • (Z2 - sq₁ J (sq₃ J Z2))),
            ip4_lin_anti hJ hKW (K13_anti Z2 hJ), add_zero]
  -- Cauchy–Schwarz in the two charge sectors
  have X0 : ip4 (P0 J (Q0 J (comp S S))) (P0 J (Q0 J W)) + ip4 L (P2 J (Q2 J W))
      ≤ √((2 * tenS f / 3 - 2 * tenH f + (18 + 6 * kC) * tenTT f J)
        * (3 * tenH f ^ 2 / 8 + tenH f * tenTT f J / 2 + 3 * tenTT f J ^ 2 / 2)) := by
    apply le_sqrt_of_sq_le
    rw [← hA0]
    calc (ip4 (P0 J (Q0 J (comp S S))) (P0 J (Q0 J W)) + ip4 L (P2 J (Q2 J W))) ^ 2
        ≤ (ip4 (P0 J (Q0 J (comp S S))) (P0 J (Q0 J (comp S S))) + ip4 L L)
          * (ip4 (P0 J (Q0 J W)) (P0 J (Q0 J W)) + ip4 (P2 J (Q2 J W)) (P2 J (Q2 J W))) :=
          sq_add_le_of_sq_le (ip4_sq_le _ _) (ip4_sq_le _ _) (ip4_self_nonneg _)
            (ip4_self_nonneg _) (ip4_self_nonneg _) (ip4_self_nonneg _)
      _ ≤ ((4 * τ + ρ) ^ 2 + (ρ ^ 2 / 2 + 2 * τ * ρ + 2 * τ ^ 2))
          * (ip4 (P0 J (Q0 J W)) (P0 J (Q0 J W)) + ip4 (P2 J (Q2 J W)) (P2 J (Q2 J W))) :=
          mul_le_mul_of_nonneg_right (add_le_add B00 BL)
            (add_nonneg (ip4_self_nonneg _) (ip4_self_nonneg _))
      _ = ip4 (ch0 J W) (ch0 J W)
          * (3 * tenH f ^ 2 / 8 + tenH f * tenTT f J / 2 + 3 * tenTT f J ^ 2 / 2) := by
          rw [ip4_ch0_blocks hJ W, hρ, hH]; ring
  have X2 : ip4 (P0 J (Q2 J (comp S S))) (P0 J (Q2 J W)) + ip4 (P2 J (Q0 J (comp S S))) (P2 J (Q0 J W))
      ≤ √((tenS f / 3 + (2 + kC) * tenH f - (18 + 6 * kC) * tenTT f J)
        * (9 * tenH f * tenTT f J - 54 * tenTT f J ^ 2)) := by
    apply le_sqrt_of_sq_le
    rw [← hA2]
    calc (ip4 (P0 J (Q2 J (comp S S))) (P0 J (Q2 J W))
          + ip4 (P2 J (Q0 J (comp S S))) (P2 J (Q0 J W))) ^ 2
        ≤ (ip4 (P0 J (Q2 J (comp S S))) (P0 J (Q2 J (comp S S)))
            + ip4 (P2 J (Q0 J (comp S S))) (P2 J (Q0 J (comp S S))))
          * (ip4 (P0 J (Q2 J W)) (P0 J (Q2 J W)) + ip4 (P2 J (Q0 J W)) (P2 J (Q0 J W))) :=
          sq_add_le_of_sq_le (ip4_sq_le _ _) (ip4_sq_le _ _) (ip4_self_nonneg _)
            (ip4_self_nonneg _) (ip4_self_nonneg _) (ip4_self_nonneg _)
      _ ≤ (9 * τ * ρ + 9 * τ * ρ)
          * (ip4 (P0 J (Q2 J W)) (P0 J (Q2 J W)) + ip4 (P2 J (Q0 J W)) (P2 J (Q0 J W))) :=
          mul_le_mul_of_nonneg_right (add_le_add B02 B20)
            (add_nonneg (ip4_self_nonneg _) (ip4_self_nonneg _))
      _ = ip4 (ch2 J W) (ch2 J W) * (9 * tenH f * tenTT f J - 54 * tenTT f J ^ 2) := by
          rw [ip4_ch2_blocks hJ W, hρ, hH]; ring
  rw [hU, ip4_blocks hJ (comp S S) W, split]
  linarith [X0, X2]

end chargesplit

/-! ### The coupled `G` test -/

section coupled

variable {J : ι → ι → ℝ}

/-- `1 ⊗ J` on pairs: `J` on the second slot. -/
def jq (J : ι → ι → ℝ) (v : T2 ι) : T2 ι := fun a b => ∑ p, J b p * v a p
/-- `K = J ⊗ J` on pairs. -/
def k2 (J : ι → ι → ℝ) (v : T2 ι) : T2 ι := jp J (jq J v)
/-- The charge-zero projection of a pair vector, `(1 + K)/2`. -/
def p0v (J : ι → ι → ℝ) (v : T2 ι) : T2 ι := (1 / 2 : ℝ) • (v + k2 J v)
/-- The charge-`±2` projection of a pair vector, `(1 − K)/2`. -/
def p2v (J : ι → ι → ℝ) (v : T2 ι) : T2 ι := (1 / 2 : ℝ) • (v - k2 J v)

lemma ap4_sq₂ (X : T4 ι) (v : T2 ι) : ap4 (sq₂ J X) v = jq J (ap4 X v) := by
  funext a b
  simp only [ap4, jq, sq₂_apply, Finset.sum_mul, Finset.mul_sum]
  rw [sum3_rot (fun c d p => J b p * X a p c d * v c d)]
  exact Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun c _ =>
    Finset.sum_congr rfl fun d _ => by ring

lemma ap4_sq₄ (hJ : ∀ i j, J i j = -J j i) (X : T4 ι) (v : T2 ι) :
    ap4 (sq₄ J X) v = -ap4 X (jq J v) := by
  funext a b
  simp only [ap4, jq, sq₄_apply, Finset.sum_mul, Finset.mul_sum, Pi.neg_apply,
    ← Finset.sum_neg_distrib]
  refine Finset.sum_congr rfl fun c _ => ?_
  rw [Finset.sum_comm]
  refine Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun d _ => ?_
  rw [hJ p d]; ring

lemma jp_jq (v : T2 ι) : jp J (jq J v) = jq J (jp J v) := by
  funext a b
  simp only [jp, jq, Finset.mul_sum]
  rw [Finset.sum_comm]
  exact Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun q _ => by ring

lemma jp_add (v w : T2 ι) : jp J (v + w) = jp J v + jp J w := by
  funext a b; simp only [jp, Pi.add_apply, mul_add, Finset.sum_add_distrib]
lemma jp_sub (v w : T2 ι) : jp J (v - w) = jp J v - jp J w := by
  funext a b; simp only [jp, Pi.sub_apply, mul_sub, Finset.sum_sub_distrib]
lemma jp_smul (r : ℝ) (v : T2 ι) : jp J (r • v) = r • jp J v := by
  funext a b; simp only [jp, Pi.smul_apply, smul_eq_mul, Finset.mul_sum]
  exact Finset.sum_congr rfl fun p _ => by ring
lemma jq_add (v w : T2 ι) : jq J (v + w) = jq J v + jq J w := by
  funext a b; simp only [jq, Pi.add_apply, mul_add, Finset.sum_add_distrib]
lemma jq_sub (v w : T2 ι) : jq J (v - w) = jq J v - jq J w := by
  funext a b; simp only [jq, Pi.sub_apply, mul_sub, Finset.sum_sub_distrib]
lemma jq_smul (r : ℝ) (v : T2 ι) : jq J (r • v) = r • jq J v := by
  funext a b; simp only [jq, Pi.smul_apply, smul_eq_mul, Finset.mul_sum]
  exact Finset.sum_congr rfl fun p _ => by ring
lemma k2_add (v w : T2 ι) : k2 J (v + w) = k2 J v + k2 J w := by
  unfold k2; rw [jq_add, jp_add]
lemma k2_sub (v w : T2 ι) : k2 J (v - w) = k2 J v - k2 J w := by
  unfold k2; rw [jq_sub, jp_sub]
lemma k2_smul (r : ℝ) (v : T2 ι) : k2 J (r • v) = r • k2 J v := by
  unfold k2; rw [jq_smul, jp_smul]

lemma ap4_sub_vec (X : T4 ι) (v w : T2 ι) : ap4 X (v - w) = ap4 X v - ap4 X w := by
  funext a b; simp only [ap4, Pi.sub_apply, mul_sub, Finset.sum_sub_distrib]
lemma ap4_smul_vec (r : ℝ) (X : T4 ι) (v : T2 ι) : ap4 X (r • v) = r • ap4 X v := by
  funext a b; simp only [ap4, Pi.smul_apply, smul_eq_mul, Finset.mul_sum]
  exact Finset.sum_congr rfl fun c _ => Finset.sum_congr rfl fun d _ => by ring

lemma ap4_K12 (X : T4 ι) (v : T2 ι) : ap4 (sq₁ J (sq₂ J X)) v = k2 J (ap4 X v) := by
  rw [ap4_sq₁, ap4_sq₂]; rfl
lemma ap4_K34 (hJ : ∀ i j, J i j = -J j i) (X : T4 ι) (v : T2 ι) :
    ap4 (sq₃ J (sq₄ J X)) v = ap4 X (k2 J v) := by
  rw [ap4_sq₃ hJ, ap4_sq₄ hJ, neg_neg]; unfold k2; rw [jp_jq]

lemma ap4_P0 (X : T4 ι) (v : T2 ι) : ap4 (P0 J X) v = p0v J (ap4 X v) := by
  unfold P0 p0v; rw [ap4_smul, ap4_add, ap4_K12]
lemma ap4_P2 (X : T4 ι) (v : T2 ι) : ap4 (P2 J X) v = p2v J (ap4 X v) := by
  unfold P2 p2v; rw [ap4_smul, ap4_sub, ap4_K12]
lemma ap4_Q0 (hJ : ∀ i j, J i j = -J j i) (X : T4 ι) (v : T2 ι) :
    ap4 (Q0 J X) v = ap4 X (p0v J v) := by
  unfold Q0 p0v; rw [ap4_smul, ap4_add, ap4_K34 hJ, ap4_smul_vec, ap4_add_vec]
lemma ap4_Q2 (hJ : ∀ i j, J i j = -J j i) (X : T4 ι) (v : T2 ι) :
    ap4 (Q2 J X) v = ap4 X (p2v J v) := by
  unfold Q2 p2v; rw [ap4_smul, ap4_sub, ap4_K34 hJ, ap4_smul_vec, ap4_sub_vec]

lemma ip2_le_of_bounds {u w : T2 ι} {α β c : ℝ} (hu : ip2 u u ≤ α) (hw : ip2 w w ≤ β)
    (hα : 0 ≤ α) (hc : 0 ≤ c) (hαβ : α * β ≤ c ^ 2) : ip2 u w ≤ c := by
  apply le_of_sq_le_sq_nn hc
  calc ip2 u w ^ 2 ≤ ip2 u u * ip2 w w := ip2_sq_le u w
    _ ≤ α * β := mul_le_mul hu hw (ip2_self_nonneg _) hα
    _ ≤ c ^ 2 := hαβ

variable (hJ : IsCplx J)
include hJ

lemma jp_jp (v : T2 ι) : jp J (jp J v) = -v := by
  funext a b
  show ∑ p, J a p * ∑ q, J p q * v q b = -v a b
  have h : ∑ p, J p a * ∑ q, J p q * v q b = v a b := hJ.sum_tsq (fun q => v q b) a
  rw [← h, ← Finset.sum_neg_distrib]
  exact Finset.sum_congr rfl fun p _ => by rw [hJ.anti a p]; ring
lemma jq_jq (v : T2 ι) : jq J (jq J v) = -v := by
  funext a b
  show ∑ p, J b p * ∑ q, J p q * v a q = -v a b
  have h : ∑ p, J p b * ∑ q, J p q * v a q = v a b := hJ.sum_tsq (fun q => v a q) b
  rw [← h, ← Finset.sum_neg_distrib]
  exact Finset.sum_congr rfl fun p _ => by rw [hJ.anti b p]; ring
lemma k2_k2 (v : T2 ι) : k2 J (k2 J v) = v := by
  unfold k2; rw [← jp_jq (jq J v), jp_jp hJ, jq_jq hJ, neg_neg]

lemma ip2_jp_left (v w : T2 ι) : ip2 (jp J v) w = -ip2 v (jp J w) := by
  simp only [ip2, jp, Finset.sum_mul, Finset.mul_sum, ← Finset.sum_neg_distrib]
  rw [sum3_pswap13 (fun a b p => J a p * v p b * w a b)]
  refine Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun b _ =>
    Finset.sum_congr rfl fun a _ => ?_
  rw [hJ.anti p a]; ring
lemma ip2_jq_left (v w : T2 ι) : ip2 (jq J v) w = -ip2 v (jq J w) := by
  simp only [ip2, jq, Finset.sum_mul, Finset.mul_sum, ← Finset.sum_neg_distrib]
  refine Finset.sum_congr rfl fun a _ => ?_
  rw [Finset.sum_comm]
  refine Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun b _ => ?_
  rw [hJ.anti p b]; ring
lemma ip2_k2_left (v w : T2 ι) : ip2 (k2 J v) w = ip2 v (k2 J w) := by
  unfold k2; rw [ip2_jp_left hJ, ip2_jq_left hJ, neg_neg, jp_jq]
lemma ip2_k2_k2 (v w : T2 ι) : ip2 (k2 J v) (k2 J w) = ip2 v w := by
  rw [ip2_k2_left hJ, k2_k2 hJ]

omit hJ in
lemma p0v_add_p2v (v : T2 ι) : p0v J v + p2v J v = v := by unfold p0v p2v; module
lemma ip2_p0v_p2v (v w : T2 ι) : ip2 (p0v J v) (p2v J w) = 0 := by
  unfold p0v p2v
  simp only [ip2_smul_left, ip2_smul_right, ip2_add_left, ip2_sub_right, ip2_k2_k2 hJ]
  rw [ip2_k2_left hJ]; ring
lemma ip2_self_p (v : T2 ι) :
    ip2 v v = ip2 (p0v J v) (p0v J v) + ip2 (p2v J v) (p2v J v) := by
  conv_lhs => rw [← p0v_add_p2v (J := J) v]
  rw [ip2_add_left, ip2_add_right, ip2_add_right, ip2_p0v_p2v hJ,
    ip2_comm (p2v J v) (p0v J v), ip2_p0v_p2v hJ]
  ring
lemma k2_p0v (v : T2 ι) : k2 J (p0v J v) = p0v J v := by
  unfold p0v; rw [k2_smul, k2_add, k2_k2 hJ, add_comm]
lemma k2_p2v (v : T2 ι) : k2 J (p2v J v) = -p2v J v := by
  unfold p2v; rw [k2_smul, k2_sub, k2_k2 hJ, ← smul_neg, neg_sub]
lemma p0v_p0v (v : T2 ι) : p0v J (p0v J v) = p0v J v := by
  rw [show p0v J (p0v J v) = (1 / 2 : ℝ) • (p0v J v + k2 J (p0v J v)) from rfl, k2_p0v hJ]
  module
lemma p2v_p2v (v : T2 ι) : p2v J (p2v J v) = p2v J v := by
  rw [show p2v J (p2v J v) = (1 / 2 : ℝ) • (p2v J v - k2 J (p2v J v)) from rfl, k2_p2v hJ]
  module
lemma ip2_p0v_adj (v w : T2 ι) : ip2 (p0v J v) w = ip2 v (p0v J w) := by
  unfold p0v
  simp only [ip2_smul_left, ip2_smul_right, ip2_add_left, ip2_add_right, ip2_k2_left hJ]
lemma ip2_p2v_adj (v w : T2 ι) : ip2 (p2v J v) w = ip2 v (p2v J w) := by
  unfold p2v
  simp only [ip2_smul_left, ip2_smul_right, ip2_sub_left, ip2_sub_right, ip2_k2_left hJ]
lemma ip2_p0v_p0v (v w : T2 ι) : ip2 (p0v J v) (p0v J w) = ip2 (p0v J v) w := by
  rw [← ip2_p0v_adj hJ, p0v_p0v hJ]
lemma ip2_p2v_p2v (v w : T2 ι) : ip2 (p2v J v) (p2v J w) = ip2 (p2v J v) w := by
  rw [← ip2_p2v_adj hJ, p2v_p2v hJ]

variable {f g : ι → ι → ι → ℝ}
  (hf : ∀ a b c, f a b c = f b a c) (hdf : der3 J f = -g) (hdg : der3 J g = f)

omit hJ in
lemma tenQ_eq_ip2 : tenQ f = ip2 (kerG f) (ap4 (kerS f) (kerG f)) := by
  simp only [tenQ, ip2, ap4, Finset.mul_sum]
  refine Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ =>
    Finset.sum_congr rfl fun c _ => Finset.sum_congr rfl fun d _ => ?_
  ring
omit hJ in
lemma tenS_eq_ip2 : tenS f = ip2 (kerG f) (kerG f) := by simp only [tenS, ip2, sq]

/-- `G_anti = (G + JGJ)/2` is the charge-`±2` part of `vec G`. -/
lemma kerGa_eq_p2v : kerGa f J = p2v J (kerG f) := by
  funext c d
  have e : ∑ e, ∑ e', J c e * kerG f e e' * J e' d
      = -(∑ p, J c p * ∑ q, J d q * kerG f p q) := by
    simp only [Finset.mul_sum, ← Finset.sum_neg_distrib]
    refine Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun q _ => ?_
    rw [hJ.anti q d]; ring
  show (kerG f c d + ∑ e, ∑ e', J c e * kerG f e e' * J e' d) / 2
    = (1 / 2 : ℝ) * (kerG f c d - ∑ p, J c p * ∑ q, J d q * kerG f p q)
  rw [e]; ring

lemma tenGa_eq_ip2 : tenGa f J = ip2 (p2v J (kerG f)) (p2v J (kerG f)) := by
  unfold tenGa; rw [kerGa_eq_p2v hJ]; simp only [ip2, sq]

include hf hdf hdg

local notation "S" => kerS f
local notation "τ" => tenTT f J
local notation "hh" => ip4 (kerS f) (kerS f)

set_option maxHeartbeats 1000000 in
/-- **The field `coupled`**: `Q = ⟨vec G, S vec G⟩ ≤ (2s − η)√τ + √(2η(s − η)(h − 6τ))`. -/
theorem coupled_of_der : tenQ f ≤ (2 * tenS f - tenGa f J) * √(tenTT f J)
    + √(2 * tenGa f J * (tenS f - tenGa f J) * (tenH f - 6 * tenTT f J)) := by
  have hH : tenH f = hh := tenH_eq_ip4 f
  have hτ0 : 0 ≤ τ := tenTT_nonneg f J
  obtain ⟨t, ht⟩ : ∃ t : ℝ, t = √τ := ⟨_, rfl⟩
  have ht0 : 0 ≤ t := ht ▸ Real.sqrt_nonneg _
  have hτt : τ = t ^ 2 := by rw [ht, Real.sq_sqrt hτ0]
  rw [← ht]
  obtain ⟨u, hu⟩ : ∃ u : T2 ι, u = kerG f := ⟨_, rfl⟩
  have hQ : tenQ f = ip2 u (ap4 S u) := by rw [tenQ_eq_ip2, hu]
  have hs : tenS f = ip2 u u := by rw [tenS_eq_ip2, hu]
  have hη : tenGa f J = ip2 (p2v J u) (p2v J u) := by rw [tenGa_eq_ip2 hJ, hu]
  have hσ : ip2 (p0v J u) (p0v J u) = tenS f - tenGa f J := by
    rw [hs, hη, ip2_self_p hJ u]; ring
  have hη0 : 0 ≤ tenGa f J := tenGa_nonneg f J
  have hσ0 : 0 ≤ tenS f - tenGa f J := hσ ▸ ip2_self_nonneg _
  -- the blocks of `S`
  have n22 := ip4_S22 hJ hf hdf hdg
  have n00 := ip4_S00 hJ hf hdf hdg
  have n02 := ip4_S02 hJ hf hdf hdg
  have n20 := ip4_S20 hJ hf hdf hdg
  obtain ⟨ρ, hρ⟩ : ∃ ρ : ℝ, ρ = (hh - 6 * τ) / 2 := ⟨_, rfl⟩
  rw [← hρ] at n02 n20
  have hρ0 : 0 ≤ ρ := n02 ▸ ip4_self_nonneg _
  have hK := K13_S22 hJ hf hdf hdg
  -- the block decomposition of `⟨u, S u⟩`
  have hdec : ip2 u (ap4 S u)
      = ip2 (p0v J u) (ap4 (P0 J (Q0 J S)) (p0v J u))
        + ip2 (p0v J u) (ap4 (P0 J (Q2 J S)) (p2v J u))
        + ip2 (p2v J u) (ap4 (P2 J (Q0 J S)) (p0v J u))
        + ip2 (p2v J u) (ap4 (P2 J (Q2 J S)) (p2v J u)) := by
    simp only [ap4_P0, ap4_P2, ap4_Q0 hJ.anti, ap4_Q2 hJ.anti, p0v_p0v hJ, p2v_p2v hJ]
    rw [ip2_p0v_p0v hJ, ip2_p0v_p0v hJ, ip2_p2v_p2v hJ, ip2_p2v_p2v hJ]
    conv_lhs => rw [← p0v_add_p2v (J := J) u]
    rw [ap4_add_vec, ip2_add_left, ip2_add_right, ip2_add_right]; ring
  -- the four bounds
  have B1 : ip2 (p0v J u) (ap4 (P0 J (Q0 J S)) (p0v J u)) ≤ 2 * t * (tenS f - tenGa f J) := by
    have a := ip2_ap4_le (P0 J (Q0 J S)) (p0v J u)
    rw [n00, hσ] at a
    exact ip2_le_of_bounds (le_of_eq hσ) a hσ0 (by positivity)
      (le_of_eq (by rw [hτt]; ring))
  have B4 : ip2 (p2v J u) (ap4 (P2 J (Q2 J S)) (p2v J u)) ≤ t * tenGa f J := by
    have a := ip2_ap4_le_half hJ hK (p2v J u)
    rw [n22, ← hη] at a
    have a' : ip2 (ap4 (P2 J (Q2 J S)) (p2v J u)) (ap4 (P2 J (Q2 J S)) (p2v J u))
        ≤ τ * tenGa f J := by linarith
    exact ip2_le_of_bounds (le_of_eq hη.symm) a' hη0 (by positivity)
      (le_of_eq (by rw [hτt]; ring))
  have hpos : 0 ≤ 2 * tenGa f J * (tenS f - tenGa f J) * (tenH f - 6 * τ) := by
    have : 0 ≤ tenH f - 6 * τ := by rw [hH]; linarith
    positivity
  obtain ⟨c, hc⟩ : ∃ c : ℝ,
      c = √(2 * tenGa f J * (tenS f - tenGa f J) * (tenH f - 6 * τ)) / 2 := ⟨_, rfl⟩
  have hc0 : 0 ≤ c := by rw [hc]; positivity
  have hc2 : (tenS f - tenGa f J) * (ρ * tenGa f J) = c ^ 2 := by
    rw [hc, div_pow, Real.sq_sqrt hpos, hρ, ← hH]; ring
  have B2 : ip2 (p0v J u) (ap4 (P0 J (Q2 J S)) (p2v J u)) ≤ c := by
    have a := ip2_ap4_le (P0 J (Q2 J S)) (p2v J u)
    rw [n02, ← hη] at a
    exact ip2_le_of_bounds (le_of_eq hσ) a hσ0 hc0 (le_of_eq hc2)
  have B3 : ip2 (p2v J u) (ap4 (P2 J (Q0 J S)) (p0v J u)) ≤ c := by
    have a := ip2_ap4_le (P2 J (Q0 J S)) (p0v J u)
    rw [n20, hσ] at a
    exact ip2_le_of_bounds (le_of_eq hη.symm) a hη0 hc0 (le_of_eq (by rw [← hc2]; ring))
  have hcc : c + c = √(2 * tenGa f J * (tenS f - tenGa f J) * (tenH f - 6 * τ)) := by
    rw [hc]; ring
  rw [hQ, hdec]
  linarith [B1, B2, B3, B4]

end coupled

/-- **The field `trace3`** for the kernel of the real part of a circular cubic. -/
theorem trace3_circular [DecidableEq ι] {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (hc : Circular J a b) :
    tenT3 (cubicKernel a)
      ≤ √(tenTT (cubicKernel a) J) * (9 * tenH (cubicKernel a) / 2 - 17 * tenTT (cubicKernel a) J) :=
  trace3_of_der hc.isCplx (cubicKernel_symm12 a) hc.der3_left hc.der3_right

/-- **The field `coupled`** for the kernel of the real part of a circular cubic. -/
theorem coupled_circular [DecidableEq ι] {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (hc : Circular J a b) :
    tenQ (cubicKernel a)
      ≤ (2 * tenS (cubicKernel a) - tenGa (cubicKernel a) J) * √(tenTT (cubicKernel a) J)
        + √(2 * tenGa (cubicKernel a) J * (tenS (cubicKernel a) - tenGa (cubicKernel a) J)
            * (tenH (cubicKernel a) - 6 * tenTT (cubicKernel a) J)) :=
  coupled_of_der hc.isCplx (cubicKernel_symm12 a) hc.der3_left hc.der3_right

/-- **The field `chargeSplit`** for the kernel of the real part of a circular cubic. -/
theorem chargeSplit_circular [DecidableEq ι] {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (hc : Circular J a b) :
    tenU2 (cubicKernel a) ≤ thetaC * tenT3 (cubicKernel a)
      + √((2 * tenS (cubicKernel a) / 3 - 2 * tenH (cubicKernel a)
            + (18 + 6 * kC) * tenTT (cubicKernel a) J)
          * (3 * tenH (cubicKernel a) ^ 2 / 8 + tenH (cubicKernel a) * tenTT (cubicKernel a) J / 2
            + 3 * tenTT (cubicKernel a) J ^ 2 / 2))
      + √((tenS (cubicKernel a) / 3 + (2 + kC) * tenH (cubicKernel a)
            - (18 + 6 * kC) * tenTT (cubicKernel a) J)
          * (9 * tenH (cubicKernel a) * tenTT (cubicKernel a) J - 54 * tenTT (cubicKernel a) J ^ 2)) :=
  chargeSplit_of_der hc.isCplx (cubicKernel_symm12 a) (cubicKernel_symm12 b)
    (fun x y z => by unfold cubicKernel; rw [kern_rev]) hc.der3_left hc.der3_right

set_option linter.unusedSectionVars true

/-! ### The tensor facts of a circular cubic -/

/-- **The tensor facts of a circular cubic**: `Chaos3.wick4`, `Chaos3.wick6`, `sos1_circular`,
`sos2_circular`, `tenGa_le_half`, `tenTT_le_sixth`, `cubicTrace_circular`, `trace3_circular`,
`trace4_circular`, `coupled_circular`, `A0nn_circular`, `A2nn_circular`,
`chargeSplit_circular`. -/
theorem Circular.tensorFacts [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ}
    (hE : IsGaussianExpectation E) {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ} (ha : Chaos3 a)
    (hc : Circular J a b) : TensorFacts E J a where
  wick4 := ha.wick4 hE
  wick6 := ha.wick6 hE
  sos1 := sos1_circular hc
  sos2 := sos2_circular hc
  anti := tenGa_le_half _ hc.anti hc.sq_diag hc.sq_off
  cubicTrace := cubicTrace_circular hc
  block := tenTT_le_sixth hc
  trace3 := trace3_circular hc
  trace4 := trace4_circular hc
  coupled := coupled_circular hc
  A0nn := A0nn_circular hc
  A2nn := A2nn_circular hc
  chargeSplit := chargeSplit_circular hc

end

end Grothe.LowerAnalytic
