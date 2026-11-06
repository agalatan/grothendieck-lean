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

lemma memTw2_negPair {x : ℝ} {p : ℤ × ℤ} (hx : memTw2 x p) : memTw2 (-x) (negPair p) := by
  unfold memTw2 negPair at *
  push_cast
  constructor <;> nlinarith [hx.1, hx.2]

lemma memTw2_scalePair {x : ℝ} {p : ℤ × ℤ} (n : ℕ) (hx : memTw2 x p) :
    memTw2 (n * x) (scalePair n p) := by
  unfold memTw2 scalePair at *
  push_cast
  have hn : (0 : ℝ) ≤ n := by positivity
  constructor
  · calc ((n : ℝ) * p.1) ≤ n * (x * 2 ^ (2 * KTw)) := by gcongr; exact hx.1
      _ = n * x * 2 ^ (2 * KTw) := by ring
  · calc (n : ℝ) * x * 2 ^ (2 * KTw) = n * (x * 2 ^ (2 * KTw)) := by ring
      _ ≤ n * p.2 := by gcongr; exact hx.2

/-- The transposed `w − w̄` on an accumulator (scale `2^{2 KTw}`). -/
theorem stepY_sound2 {F : CPoly →+ ℂ} {D : ℕ} (hD : 1 ≤ D) {v : TwVec} (hv : Represents2 F D v) :
    Represents2 (mulLeft (X 0 - X 1) F) (D - 1) (stepY D v) := by
  intro c d hcd
  unfold stepY stepYPair
  rw [twGet_twOfFn _ _ c d hcd, mulLeft_apply, sub_mul, map_sub, Complex.sub_re, X0_mul_H, X1_mul_H,
    map_add, map_add, Complex.add_re, Complex.add_re, re_map_nsmul, re_map_nsmul, sub_eq_add_neg]
  exact memTw2_addPair
    (memTw2_addPair (hv (c + 1) d (by omega)) (memTw2_scalePair d (hv c (d - 1) (by omega))))
    (memTw2_negPair (memTw2_addPair (hv c (d + 1) (by omega))
      (memTw2_scalePair c (hv (c - 1) d (by omega)))))

/-! ### The loops of `applyQ` -/

lemma mulLeft_mulLeft (m m' : CPoly) (F : CPoly →+ ℂ) :
    mulLeft m (mulLeft m' F) = mulLeft (m' * m) F :=
  AddMonoidHom.ext fun p => by simp only [mulLeft_apply, mul_assoc]

lemma mulLeft_one' (F : CPoly →+ ℂ) : mulLeft 1 F = F :=
  AddMonoidHom.ext fun p => by simp only [mulLeft_apply, one_mul]

/-- The functional accumulated by one phase row: `Σ_{k ≤ kMax} a_k · F((w + w̄)^k ·)`. -/
noncomputable def rowFun (a : ℕ → ℝ) (kMax : ℕ) (F : CPoly →+ ℂ) : CPoly →+ ℂ :=
  ∑ k ∈ Finset.range (kMax + 1), (a k : ℂ) • mulLeft ((X 0 + X 1) ^ k) F

/-- The state of the row loop after the first `n` steps. -/
lemma rowLoop_state (coefs : Array (ℤ × ℤ)) (kMax DV Dacc : ℕ) {F G : CPoly →+ ℂ} {a : ℕ → ℝ}
    {V acc : TwVec} (hV : Represents F DV V) (hacc : Represents2 G Dacc acc)
    (ha : ∀ k, k ≤ kMax → memTw (a k) (coefs.getD k (0, 0))) (hD : Dacc + kMax ≤ DV) :
    ∀ n, n ≤ kMax + 1 →
      let st := (List.range n).foldl (fun (st : TwVec × TwVec) k =>
        if k = 0 then (st.1, axpy (coefs.getD 0 (0, 0)) Dacc st.1 st.2)
        else
          let X := stepX (DV - (k - 1)) st.1
          (X, axpy (coefs.getD k (0, 0)) Dacc X st.2)) (V, acc)
      Represents (mulLeft ((X 0 + X 1) ^ (n - 1)) F) (DV - (n - 1)) st.1 ∧
        Represents2 (G + ∑ k ∈ Finset.range n, (a k : ℂ) • mulLeft ((X 0 + X 1) ^ k) F) Dacc st.2 := by
  intro n
  induction n with
  | zero =>
    intro _
    simp only [List.range_zero, List.foldl_nil, Nat.zero_sub, pow_zero, mulLeft_one',
      Nat.sub_zero, Finset.range_zero, Finset.sum_empty, add_zero]
    exact ⟨hV, hacc⟩
  | succ n ih =>
    intro hn
    obtain ⟨h1, h2⟩ := ih (by omega)
    rw [List.range_succ, List.foldl_append, List.foldl_cons, List.foldl_nil]
    generalize ((List.range n).foldl _ (V, acc)) = st at h1 h2 ⊢
    by_cases h0 : n = 0
    · subst h0
      simp only [↓reduceIte, Nat.sub_self, Nat.zero_sub, pow_zero, mulLeft_one',
        Nat.sub_zero] at h1 h2 ⊢
      simp only [Finset.range_zero, Finset.sum_empty, add_zero] at h2
      refine ⟨h1, ?_⟩
      have := axpy_sound (ha 0 (by omega)) h1 h2 (by omega)
      rw [zero_add, Finset.sum_range_one, pow_zero, mulLeft_one', add_comm]
      exact this
    · simp only [h0, ↓reduceIte, Nat.add_sub_cancel]
      have hX := stepX_sound (D := DV - (n - 1)) (by omega) h1
      rw [mulLeft_mulLeft, ← pow_succ, Nat.sub_add_cancel (by omega : 1 ≤ n)] at hX
      have hX' : Represents (mulLeft ((X 0 + X 1) ^ n) F) (DV - n) (stepX (DV - (n - 1)) st.1) := by
        have he : DV - (n - 1) - 1 = DV - n := by omega
        rwa [he] at hX
      refine ⟨hX', ?_⟩
      have := axpy_sound (ha n (by omega)) hX' h2 (by omega)
      rw [Finset.sum_range_succ]
      convert this using 1
      abel

/-- The row loop accumulates `rowFun`. -/
theorem rowLoop_sound (coefs : Array (ℤ × ℤ)) (kMax DV Dacc : ℕ) {F G : CPoly →+ ℂ} {a : ℕ → ℝ}
    {V acc : TwVec} (hV : Represents F DV V) (hacc : Represents2 G Dacc acc)
    (ha : ∀ k, k ≤ kMax → memTw (a k) (coefs.getD k (0, 0))) (hD : Dacc + kMax ≤ DV) :
    Represents2 (G + rowFun a kMax F) Dacc (rowLoop coefs kMax DV Dacc V acc) :=
  (rowLoop_state coefs kMax DV Dacc hV hacc ha hD (kMax + 1) le_rfl).2

/-- The functional accumulated by the row loops: `Σ_{j' ≤ 17} Σ_{k ≤ 17 − j'} a_{j'k} ·
F((w w̄)^{j'} (w + w̄)^k ·)`. -/
noncomputable def rowsFun (a : ℕ → ℕ → ℝ) (F : CPoly →+ ℂ) : CPoly →+ ℂ :=
  ∑ j ∈ Finset.range 18, rowFun (a j) (17 - j) (mulLeft ((X 0 * X 1) ^ j) F)

lemma rowsLoop_state (coefs : Array (Array (ℤ × ℤ))) (Din Dacc : ℕ) {F : CPoly →+ ℂ}
    {a : ℕ → ℕ → ℝ} {K : TwVec} (hK : Represents F Din K)
    (ha : ∀ j k, j + k ≤ 17 → memTw (a j k) ((coefs.getD j #[]).getD k (0, 0)))
    (hD : Dacc + 17 + 17 ≤ Din) :
    ∀ n, n ≤ 18 →
      let st := (List.range n).foldl (fun (st : TwVec × TwVec) j' =>
        if j' = 0 then (st.1, rowLoop (coefs.getD 0 #[]) 17 Din Dacc st.1 st.2)
        else
          let V := stepV (Din - 2 * (j' - 1)) st.1
          (V, rowLoop (coefs.getD j' #[]) (17 - j') (Din - 2 * j') Dacc V st.2)) (K, twZero Dacc)
      Represents (mulLeft ((X 0 * X 1) ^ (n - 1)) F) (Din - 2 * (n - 1)) st.1 ∧
        Represents2 (∑ j ∈ Finset.range n, rowFun (a j) (17 - j) (mulLeft ((X 0 * X 1) ^ j) F))
          Dacc st.2 := by
  intro n
  induction n with
  | zero =>
    intro _
    simp only [List.range_zero, List.foldl_nil, Nat.zero_sub, pow_zero, mulLeft_one', mul_zero,
      Nat.sub_zero, Finset.range_zero, Finset.sum_empty]
    exact ⟨hK, twZero_sound Dacc⟩
  | succ n ih =>
    intro hn
    obtain ⟨h1, h2⟩ := ih (by omega)
    rw [List.range_succ, List.foldl_append, List.foldl_cons, List.foldl_nil]
    generalize ((List.range n).foldl _ (K, twZero Dacc)) = st at h1 h2 ⊢
    rw [Finset.sum_range_succ]
    by_cases h0 : n = 0
    · subst h0
      simp only [↓reduceIte, Nat.sub_self, Nat.zero_sub, pow_zero, mulLeft_one', mul_zero,
        Nat.sub_zero, Finset.range_zero, Finset.sum_empty, zero_add] at h1 h2 ⊢
      refine ⟨h1, ?_⟩
      have := rowLoop_sound (coefs.getD 0 #[]) 17 Din Dacc h1 h2 (a := a 0)
        (fun k hk => ha 0 k (by omega)) (by omega)
      simpa only [zero_add] using this
    · simp only [h0, ↓reduceIte, Nat.add_sub_cancel]
      have hV := stepV_sound (D := Din - 2 * (n - 1)) (by omega) h1
      rw [mulLeft_mulLeft, ← pow_succ, Nat.sub_add_cancel (by omega : 1 ≤ n)] at hV
      have hV' : Represents (mulLeft ((X 0 * X 1) ^ n) F) (Din - 2 * n)
          (stepV (Din - 2 * (n - 1)) st.1) := by
        have he : Din - 2 * (n - 1) - 2 = Din - 2 * n := by omega
        rwa [he] at hV
      exact ⟨hV', rowLoop_sound (coefs.getD n #[]) (17 - n) (Din - 2 * n) Dacc hV' h2 (a := a n)
        (fun k hk => ha n k (by omega)) (by omega)⟩

theorem rowsLoop_sound (coefs : Array (Array (ℤ × ℤ))) (Din Dacc : ℕ) {F : CPoly →+ ℂ}
    {a : ℕ → ℕ → ℝ} {K : TwVec} (hK : Represents F Din K)
    (ha : ∀ j k, j + k ≤ 17 → memTw (a j k) ((coefs.getD j #[]).getD k (0, 0)))
    (hD : Dacc + 17 + 17 ≤ Din) :
    Represents2 (rowsFun a F) Dacc (rowsLoop coefs Din Dacc K) :=
  (rowsLoop_state coefs Din Dacc hK ha hD 18 le_rfl).2

/-! ### One application of `Q_rᵀ` and its powers -/

/-- The polynomial of the node operator: `Q = h (w − w̄) Σ_{j' + k ≤ 17} a_{j'k} (w w̄)^{j'} (w + w̄)^k`
(with `a_{j'k} = P_{j'k}(s) (r/2)^k` and `h = r/2` this is `Q_r`). -/
noncomputable def qPoly (h : ℝ) (a : ℕ → ℕ → ℝ) : CPoly :=
  C (h : ℂ) * (X 0 - X 1) * ∑ j ∈ Finset.range 18, ∑ k ∈ Finset.range (17 - j + 1),
    C (a j k : ℂ) * (X 0 * X 1) ^ j * (X 0 + X 1) ^ k

/-- A functional is real-homogeneous when real scalars pass through it (`K_s` is conjugate-linear). -/
def RealHom (F : CPoly →+ ℂ) : Prop := ∀ (x : ℝ) (p : CPoly), F (C (x : ℂ) * p) = (x : ℂ) * F p

lemma RealHom.mulLeft {F : CPoly →+ ℂ} (hF : RealHom F) (m : CPoly) : RealHom (mulLeft m F) := by
  intro x p
  simp only [mulLeft_apply]
  rw [← hF x (m * p)]
  congr 1
  ring

/-- The functional built by `applyQ` is `F (Q ·)`. -/
lemma applyQ_fun_eq {F : CPoly →+ ℂ} (hF : RealHom F) (h : ℝ) (a : ℕ → ℕ → ℝ) :
    (h : ℂ) • mulLeft (X 0 - X 1) (rowsFun a F) = mulLeft (qPoly h a) F := by
  refine AddMonoidHom.ext fun p => ?_
  simp only [AddMonoidHom.smul_apply, mulLeft_apply, rowsFun, rowFun, AddMonoidHom.finsetSum_apply,
    smul_eq_mul, qPoly]
  have e : C (h : ℂ) * (X 0 - X 1) * (∑ j ∈ Finset.range 18, ∑ k ∈ Finset.range (17 - j + 1),
      C (a j k : ℂ) * (X 0 * X 1) ^ j * (X 0 + X 1) ^ k) * p =
      C (h : ℂ) * ∑ j ∈ Finset.range 18, ∑ k ∈ Finset.range (17 - j + 1),
        C (a j k : ℂ) * ((X 0 * X 1) ^ j * ((X 0 + X 1) ^ k * ((X 0 - X 1) * p))) := by
    simp only [Finset.mul_sum, Finset.sum_mul]
    apply Finset.sum_congr rfl
    intro j _
    apply Finset.sum_congr rfl
    intro k _
    ring
  rw [e, hF, map_sum]
  congr 1
  apply Finset.sum_congr rfl
  intro j _
  rw [map_sum]
  apply Finset.sum_congr rfl
  intro k _
  rw [hF]

/-- One application of the node operator. -/
theorem applyQ_sound (coefs : Array (Array (ℤ × ℤ))) (half : ℤ × ℤ) (Dout : ℕ) {F : CPoly →+ ℂ}
    (hF : RealHom F) {a : ℕ → ℕ → ℝ} {h : ℝ} {K : TwVec} (hK : Represents F (Dout + 35) K)
    (ha : ∀ j k, j + k ≤ 17 → memTw (a j k) ((coefs.getD j #[]).getD k (0, 0)))
    (hh : memTw h half) :
    Represents (mulLeft (qPoly h a) F) Dout (applyQ coefs half Dout K) := by
  rw [← applyQ_fun_eq hF h a]
  unfold applyQ
  apply scaleTw_sound hh
  apply roundVec_sound
  have h1 := rowsLoop_sound coefs (Dout + 35) (Dout + 1) hK ha (by omega)
  have h2 := stepY_sound2 (F := rowsFun a F) (D := Dout + 1) (by omega) h1
  simpa only [Nat.add_sub_cancel] using h2

/-- `(Q_rᵀ)^j`: `j` applications, the input on the degree `Dout + 35 j`. -/
theorem applyQPow_sound (coefs : Array (Array (ℤ × ℤ))) (half : ℤ × ℤ) {a : ℕ → ℕ → ℝ} {h : ℝ}
    (ha : ∀ j k, j + k ≤ 17 → memTw (a j k) ((coefs.getD j #[]).getD k (0, 0)))
    (hh : memTw h half) :
    ∀ (j Dout : ℕ) {F : CPoly →+ ℂ} {K : TwVec}, RealHom F → Represents F (Dout + 35 * j) K →
      Represents (mulLeft (qPoly h a ^ j) F) Dout (applyQPow coefs half Dout j K) := by
  intro j
  induction j with
  | zero =>
    intro Dout F K _ hK
    simpa only [pow_zero, mulLeft_one', mul_zero, add_zero, applyQPow] using hK
  | succ j ih =>
    intro Dout F K hF hK
    have h1 := ih (Dout + 35) hF (by
      have he : Dout + 35 + 35 * j = Dout + 35 * (j + 1) := by ring
      rw [he]; exact hK)
    have h2 := applyQ_sound coefs half Dout (hF.mulLeft (qPoly h a ^ j)) h1 ha hh
    rw [mulLeft_mulLeft, ← pow_succ] at h2
    exact h2

end Grothe.UpperQuad
