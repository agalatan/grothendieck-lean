import Grothe.UpperQuad.ContractSound
import Grothe.UpperChaos.HermiteConjugation
import GrotheQuadExtKernel.Twist

/-!
# Soundness of the twisted operator: the exact ladders and the transposed steps

In the unnormalised basis `H_{c,d}` the ladders are integer (`X0_mul_H`, `X1_mul_H`).  A vector
`v : TwVec` *represents* an additive functional `F : CPoly →+ ℂ` on the degree `D` when every entry
encloses the real part `(F (H c d)).re` at the scale `2^KTw` (`Represents`).  Each transposed step
of `GrotheQuadExtKernel.Twist` turns a representation of `F` into one of `p ↦ F (m * p)` for the
multiplier `m ∈ {X 0, X 1, X 0 + X 1, X 0 − X 1, X 0 * X 1}` on the degree lowered by `deg m`, and
`axpy` accumulates `a · F` for an enclosed real scalar `a` (scale `2^{2 KTw}`).

Agent-ID: claude-b9ee. Refs #41, #313.
-/

namespace Grothe.UpperQuad

open GrotheQuad Grothe.UpperChaos MvPolynomial

/-! ### The exact ladders -/

lemma pderiv1_H_eq (p q : ℕ) : pderiv 1 (H p q) = q • H p (q - 1) := by
  cases q with
  | zero => rw [pderiv1_H_zero, zero_nsmul]
  | succ q => rw [pderiv1_H_succ]; rfl

lemma pderiv0_H_eq (p q : ℕ) : pderiv 0 (H p q) = p • H (p - 1) q := by
  cases p with
  | zero => rw [pderiv0_H_zero, zero_nsmul]
  | succ p => rw [pderiv0_H_succ]; rfl

/-- `w H_{p,q} = H_{p+1,q} + q H_{p,q−1}`. -/
theorem X0_mul_H (p q : ℕ) : X 0 * H p q = H (p + 1) q + q • H p (q - 1) := by
  rw [H_succ_left, A0, pderiv1_H_eq, sub_add_cancel]

/-- `w̄ H_{p,q} = H_{p,q+1} + p H_{p−1,q}`. -/
theorem X1_mul_H (p q : ℕ) : X 1 * H p q = H p (q + 1) + p • H (p - 1) q := by
  rw [H_succ_right, A1, pderiv0_H_eq, sub_add_cancel]

/-! ### Membership at the scales `2^KTw` and `2^{2 KTw}` -/

/-- `x ∈ [lo, hi] / 2^KTw`. -/
def memTw (x : ℝ) (p : ℤ × ℤ) : Prop :=
  (p.1 : ℝ) ≤ x * (2 : ℝ) ^ KTw ∧ x * (2 : ℝ) ^ KTw ≤ p.2

/-- `x ∈ [lo, hi] / 2^{2 KTw}`. -/
def memTw2 (x : ℝ) (p : ℤ × ℤ) : Prop :=
  (p.1 : ℝ) ≤ x * (2 : ℝ) ^ (2 * KTw) ∧ x * (2 : ℝ) ^ (2 * KTw) ≤ p.2

lemma memTw_toTw {x : ℝ} {a : Ival} (hx : mem x a) : memTw x (toTw a) :=
  ⟨toFixedLo_le KTw hx, le_toFixedHi KTw hx⟩

lemma memTw_zero : memTw 0 ((0 : ℤ), (0 : ℤ)) := by simp [memTw]

lemma memTw2_zero : memTw2 0 ((0 : ℤ), (0 : ℤ)) := by simp [memTw2]

lemma memTw_addPair {x y : ℝ} {p q : ℤ × ℤ} (hx : memTw x p) (hy : memTw y q) :
    memTw (x + y) (addPair p q) := by
  unfold memTw addPair at *
  push_cast
  constructor <;> nlinarith [hx.1, hx.2, hy.1, hy.2]

lemma memTw2_addPair {x y : ℝ} {p q : ℤ × ℤ} (hx : memTw2 x p) (hy : memTw2 y q) :
    memTw2 (x + y) (addPair p q) := by
  unfold memTw2 addPair at *
  push_cast
  constructor <;> nlinarith [hx.1, hx.2, hy.1, hy.2]

lemma memTw_negPair {x : ℝ} {p : ℤ × ℤ} (hx : memTw x p) : memTw (-x) (negPair p) := by
  unfold memTw negPair at *
  push_cast
  constructor <;> nlinarith [hx.1, hx.2]

lemma memTw_scalePair {x : ℝ} {p : ℤ × ℤ} (n : ℕ) (hx : memTw x p) :
    memTw (n * x) (scalePair n p) := by
  unfold memTw scalePair at *
  push_cast
  have hn : (0 : ℝ) ≤ n := by positivity
  constructor
  · calc ((n : ℝ) * p.1) ≤ n * (x * 2 ^ KTw) := by gcongr; exact hx.1
      _ = n * x * 2 ^ KTw := by ring
  · calc (n : ℝ) * x * 2 ^ KTw = n * (x * 2 ^ KTw) := by ring
      _ ≤ n * p.2 := by gcongr; exact hx.2

/-- The product of two scale-`2^KTw` enclosures is a scale-`2^{2 KTw}` enclosure (`mulFx`'s cases). -/
lemma memTw2_mulPair {x y : ℝ} {p q : ℤ × ℤ} (hx : memTw x p) (hy : memTw y q) :
    memTw2 (x * y) (mulPair p q) := by
  have hsc : x * y * (2 : ℝ) ^ (2 * KTw) = (x * (2 : ℝ) ^ KTw) * (y * (2 : ℝ) ^ KTw) := by
    rw [two_mul, pow_add]; ring
  unfold memTw2 mulPair
  rw [hsc]
  exact mulFx_bounds (a := ⟨p.1, p.2⟩) (b := ⟨q.1, q.2⟩) hx.1 hx.2 hy.1 hy.2

/-- Rounding a scale-`2^{2 KTw}` pair outward to the scale `2^KTw`. -/
lemma memTw_roundTw {x : ℝ} {p : ℤ × ℤ} (hx : memTw2 x p) : memTw x (roundTw p) := by
  unfold memTw2 at hx
  unfold memTw roundTw
  have hK : x * (2 : ℝ) ^ (2 * KTw) = (x * 2 ^ KTw) * 2 ^ KTw := by rw [two_mul, pow_add]; ring
  have hpos : (0 : ℝ) < 2 ^ KTw := by positivity
  constructor
  · have h1 : ((shDown KTw p.1 : ℤ) : ℝ) * 2 ^ KTw ≤ (x * 2 ^ KTw) * 2 ^ KTw :=
      (shDown_mul_le KTw p.1).trans (hK ▸ hx.1)
    exact le_of_mul_le_mul_right h1 hpos
  · have h2 : (x * 2 ^ KTw) * 2 ^ KTw ≤ ((shUp KTw p.2 : ℤ) : ℝ) * 2 ^ KTw :=
      (hK ▸ hx.2).trans (le_shUp_mul KTw p.2)
    exact le_of_mul_le_mul_right h2 hpos

/-! ### Representations of additive functionals -/

/-- `v` represents the additive functional `F` on the degree `D`: every entry of the triangle encloses
`(F (H c d)).re` at the scale `2^KTw`. -/
def Represents (F : CPoly →+ ℂ) (D : ℕ) (v : TwVec) : Prop :=
  ∀ c d, c + d ≤ D → memTw (F (H c d)).re (twGet v c d)

/-- The same at the scale `2^{2 KTw}` (accumulators). -/
def Represents2 (F : CPoly →+ ℂ) (D : ℕ) (v : TwVec) : Prop :=
  ∀ c d, c + d ≤ D → memTw2 (F (H c d)).re (twGet v c d)

/-- The functional `p ↦ F (m * p)`. -/
noncomputable def mulLeft (m : CPoly) (F : CPoly →+ ℂ) : CPoly →+ ℂ :=
  F.comp (AddMonoidHom.mulLeft m)

@[simp] lemma mulLeft_apply (m : CPoly) (F : CPoly →+ ℂ) (p : CPoly) : mulLeft m F p = F (m * p) := rfl

lemma twGet_twOfFn (D : ℕ) (f : ℕ → ℕ → ℤ × ℤ) (c d : ℕ) (h : c + d ≤ D) :
    twGet (twOfFn D f) c d = f c d := by
  unfold twGet twOfFn
  have hc : c < D + 1 := by omega
  have hd : d < D + 1 - c := by omega
  simp [Array.getD_eq_getD_getElem?, hc, hd]

/-- `(F (n • p)).re = n * (F p).re`. -/
lemma re_map_nsmul (F : CPoly →+ ℂ) (n : ℕ) (p : CPoly) : (F (n • p)).re = n * (F p).re := by
  rw [map_nsmul, nsmul_eq_mul, Complex.mul_re]
  simp

/-- The transposed `w` ladder. -/
theorem stepW_sound {F : CPoly →+ ℂ} {D : ℕ} (hD : 1 ≤ D) {v : TwVec} (hv : Represents F D v) :
    Represents (mulLeft (X 0) F) (D - 1) (stepW D v) := by
  intro c d hcd
  unfold stepW
  rw [twGet_twOfFn _ _ c d hcd, mulLeft_apply, X0_mul_H, map_add, Complex.add_re, re_map_nsmul]
  exact memTw_addPair (hv (c + 1) d (by omega)) (memTw_scalePair d (hv c (d - 1) (by omega)))

/-- The transposed `w̄` ladder. -/
theorem stepWbar_sound {F : CPoly →+ ℂ} {D : ℕ} (hD : 1 ≤ D) {v : TwVec} (hv : Represents F D v) :
    Represents (mulLeft (X 1) F) (D - 1) (stepWbar D v) := by
  intro c d hcd
  unfold stepWbar
  rw [twGet_twOfFn _ _ c d hcd, mulLeft_apply, X1_mul_H, map_add, Complex.add_re, re_map_nsmul]
  exact memTw_addPair (hv c (d + 1) (by omega)) (memTw_scalePair c (hv (c - 1) d (by omega)))

/-- The transposed `w + w̄`. -/
theorem stepX_sound {F : CPoly →+ ℂ} {D : ℕ} (hD : 1 ≤ D) {v : TwVec} (hv : Represents F D v) :
    Represents (mulLeft (X 0 + X 1) F) (D - 1) (stepX D v) := by
  intro c d hcd
  unfold stepX stepXPair
  rw [twGet_twOfFn _ _ c d hcd, mulLeft_apply, add_mul, map_add, Complex.add_re, X0_mul_H, X1_mul_H,
    map_add, map_add, Complex.add_re, Complex.add_re, re_map_nsmul, re_map_nsmul]
  exact memTw_addPair
    (memTw_addPair (hv (c + 1) d (by omega)) (memTw_scalePair d (hv c (d - 1) (by omega))))
    (memTw_addPair (hv c (d + 1) (by omega)) (memTw_scalePair c (hv (c - 1) d (by omega))))

/-- The transposed `w − w̄`. -/
theorem stepY_sound {F : CPoly →+ ℂ} {D : ℕ} (hD : 1 ≤ D) {v : TwVec} (hv : Represents F D v) :
    Represents (mulLeft (X 0 - X 1) F) (D - 1) (stepY D v) := by
  intro c d hcd
  unfold stepY stepYPair
  rw [twGet_twOfFn _ _ c d hcd, mulLeft_apply, sub_mul, map_sub, Complex.sub_re, X0_mul_H, X1_mul_H,
    map_add, map_add, Complex.add_re, Complex.add_re, re_map_nsmul, re_map_nsmul, sub_eq_add_neg]
  exact memTw_addPair
    (memTw_addPair (hv (c + 1) d (by omega)) (memTw_scalePair d (hv c (d - 1) (by omega))))
    (memTw_negPair (memTw_addPair (hv c (d + 1) (by omega)) (memTw_scalePair c (hv (c - 1) d (by omega)))))

/-- `w w̄ H_{c,d} = H_{c+1,d+1} + (d+1) H_{c,d} + c H_{c,d} + c d H_{c−1,d−1}` through the two ladders. -/
lemma X0_X1_mul_H (c d : ℕ) :
    X 0 * X 1 * H c d =
      H (c + 1) (d + 1) + (d + 1) • H c d + c • H c d + (c * d) • H (c - 1) (d - 1) := by
  rw [mul_assoc, X1_mul_H, mul_add, X0_mul_H, mul_smul_comm, X0_mul_H, smul_add, smul_smul,
    Nat.add_sub_cancel]
  rcases Nat.eq_zero_or_pos c with rfl | hc
  · simp
  · rw [Nat.sub_add_cancel hc]
    simp only [add_assoc]

/-- The same as a real identity on the functional's values. -/
lemma re_mulLeft_X0X1 (F : CPoly →+ ℂ) (c d : ℕ) :
    (F (X 0 * X 1 * H c d)).re =
      (F (H (c + 1) (d + 1))).re + (c + d + 1 : ℕ) * (F (H c d)).re +
        (c * d : ℕ) * (F (H (c - 1) (d - 1))).re := by
  rw [X0_X1_mul_H, map_add, map_add, map_add, Complex.add_re, Complex.add_re, Complex.add_re,
    re_map_nsmul, re_map_nsmul, re_map_nsmul]
  push_cast
  ring

/-- The transposed `w w̄`. -/
theorem stepV_sound {F : CPoly →+ ℂ} {D : ℕ} (hD : 2 ≤ D) {v : TwVec} (hv : Represents F D v) :
    Represents (mulLeft (X 0 * X 1) F) (D - 2) (stepV D v) := by
  intro c d hcd
  unfold stepV
  rw [twGet_twOfFn _ _ c d hcd, mulLeft_apply, re_mulLeft_X0X1]
  exact memTw_addPair
    (memTw_addPair (hv (c + 1) (d + 1) (by omega)) (memTw_scalePair (c + d + 1) (hv c d (by omega))))
    (memTw_scalePair (c * d) (hv (c - 1) (d - 1) (by omega)))

/-- The scaled sum `a • F + G` (`G` the accumulated functional at the scale `2^{2 KTw}`). -/
theorem axpy_sound {F G : CPoly →+ ℂ} {a : ℝ} {coef : ℤ × ℤ} (ha : memTw a coef) {D DX : ℕ}
    {X acc : TwVec} (hX : Represents F DX X) (hacc : Represents2 G D acc) (hD : D ≤ DX) :
    Represents2 ((a : ℂ) • F + G) D (axpy coef D X acc) := by
  intro c d hcd
  unfold axpy
  rw [twGet_twOfFn _ _ c d hcd]
  have h : (((a : ℂ) • F + G) (H c d)).re = (G (H c d)).re + a * (F (H c d)).re := by
    simp only [AddMonoidHom.add_apply, AddMonoidHom.smul_apply, Complex.add_re, smul_eq_mul,
      Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im]
    ring
  rw [h]
  exact memTw2_addPair (hacc c d hcd) (memTw2_mulPair ha (hX c d (by omega)))

/-- The zero accumulator represents the zero functional. -/
theorem twZero_sound (D : ℕ) : Represents2 (0 : CPoly →+ ℂ) D (twZero D) := by
  intro c d hcd
  unfold twZero
  rw [twGet_twOfFn _ _ c d hcd]
  simpa using memTw2_zero

/-- Rounding an accumulator. -/
theorem roundVec_sound {G : CPoly →+ ℂ} {D : ℕ} {acc : TwVec} (hacc : Represents2 G D acc) :
    Represents G D (roundVec D acc) := by
  intro c d hcd
  unfold roundVec
  rw [twGet_twOfFn _ _ c d hcd]
  exact memTw_roundTw (hacc c d hcd)

/-- The scalar multiple `a • F`. -/
theorem scaleTw_sound {F : CPoly →+ ℂ} {a : ℝ} {f : ℤ × ℤ} (ha : memTw a f) {D : ℕ} {v : TwVec}
    (hv : Represents F D v) : Represents ((a : ℂ) • F) D (scaleTw f D v) := by
  intro c d hcd
  unfold scaleTw
  rw [twGet_twOfFn _ _ c d hcd]
  have h : (((a : ℂ) • F) (H c d)).re = a * (F (H c d)).re := by
    simp only [AddMonoidHom.smul_apply, smul_eq_mul, Complex.mul_re, Complex.ofReal_re,
      Complex.ofReal_im]
    ring
  rw [h]
  exact memTw_roundTw (memTw2_mulPair ha (hv c d hcd))

end Grothe.UpperQuad
