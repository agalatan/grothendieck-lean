import HaagerupKernel.FastHead
import Haagerup.CellOverlap

set_option warningAsError true
set_option maxRecDepth 4096

/-!
# Soundness of the Kronecker-packed 80-bit head convolution checker (`FastHead`)

Proves that `HaagerupKernel.FastHead.fastHeadOK ... = true` rigorously implies the 251-term
weighted 6-channel head residual inequality:
`∑ n ∈ Finset.range 251, |(∑ p : Fin 6, w p * h p n) - (if n = 0 then c else 0)| ≤ headCap`,
and packages `convex_transfer_head` for `CertCheck.lean`.

Architecture:
1. Equivalence of fast `Nat`-dispatched `Int` arithmetic (`iAdd`, `iSub`, `iMul`, `tdivNat`, etc.)
   with standard `ℤ` arithmetic, plus `tdivNat` magnitude-shrinking and `≤ 1` ULP error bounds.
2. Exactness of balanced base-`B1 = 2^224` splitting (`balDivMod`, `trunc251`, `sd8`, `l1_8`)
   for polynomials with coefficients bounded by `B1 / 4 = 2^222`.
3. `kronRep S M err F z` invariant and closure under `kronMul`, `buildPows16L`, `hornerD128`,
   `hornerD80`, `evalSmoothed`, `eval1D_D80`, `eval1D_D128`.
4. Exact table soundness for `encPolyAux`, `haagMu80`, `tigMu128Acc`, and `packRowsNat`, plus
   the algebraic identity equating `bivarKernel P (-X) μ` on `n < 251` to the `E`/`O` split.
5. Master theorems `head_residual_of_fastHeadOK` and `convex_transfer_head`.

-/

namespace Haagerup

open Finset Polynomial Real
open HaagerupKernel HaagerupKernel.FastHead

noncomputable section

/-! ### 1. Constants and fast `Int` arithmetic equivalences -/

private lemma D48N_eq : D48N = 2 ^ 48 := rfl
private lemma D80N_eq : D80N = 2 ^ 80 := rfl
private lemma D128N_eq : D128N = 2 ^ 128 := rfl

private lemma nat_ble_iff {a b : ℕ} : Nat.ble a b = true ↔ a ≤ b :=
  Nat.ble_eq ▸ Iff.rfl

private lemma nat_beq_iff {a b : ℕ} : Nat.beq a b = true ↔ a = b :=
  Nat.beq_eq ▸ Iff.rfl

private lemma nat_add_eq (a b : ℕ) : Nat.add a b = a + b := rfl
private lemma nat_mul_eq (a b : ℕ) : Nat.mul a b = a * b := rfl
private lemma nat_sub_eq (a b : ℕ) : Nat.sub a b = a - b := rfl
private lemma nat_div_eq (a b : ℕ) : Nat.div a b = a / b := rfl
private lemma nat_mod_eq (a b : ℕ) : Nat.mod a b = a % b := rfl

private lemma getD_map_range {α : Type*} (f : ℕ → α) (N k : ℕ) (d : α) (hk : k < N) :
    ((List.range N).map f).getD k d = f k := by
  simp [List.getD_eq_getElem?_getD, List.getElem?_map, List.getElem?_range hk]

private lemma iNatAbs_cast_R (a : ℤ) : (iNatAbs a : ℝ) = |(a : ℝ)| := by
  cases a with
  | ofNat n => simp [iNatAbs]
  | negSucc n =>
    simp only [iNatAbs, Int.cast_negSucc, abs_neg]
    rw [abs_of_nonneg (Nat.cast_nonneg (α := ℝ) _)]

private lemma D48N_pos : 0 < D48N := by rw [D48N_eq]; positivity
private lemma D80N_pos : 0 < D80N := by rw [D80N_eq]; positivity
private lemma D128N_pos : 0 < D128N := by rw [D128N_eq]; positivity

private lemma D128N_eq_mul : D128N = D80N * D48N := by
  rw [D128N_eq, D80N_eq, D48N_eq, ← pow_add]

private lemma D128_eq_D : (D128N : ℝ) = (D : ℝ) := by
  rw [D128N_eq]; unfold D K; norm_num

private lemma B1N_eq : B1N = 2 ^ 224 := rfl
private lemma B1N_pos : 0 < B1N := by rw [B1N_eq]; positivity
private lemma B1I_ge_four : (4 : ℤ) ≤ B1I := by
  unfold B1I; rw [B1N_eq]; norm_num

private lemma B2N_eq : B2N = B1N ^ 2 := by unfold B2N; change B1N * B1N = _; ring
private lemma B3N_eq : B3N = B1N ^ 3 := by unfold B3N; change B2N * B1N = _; rw [B2N_eq]; ring
private lemma B4N_eq : B4N = B1N ^ 4 := by unfold B4N; change B2N * B2N = _; rw [B2N_eq]; ring
private lemma B8N_eq : B8N = B1N ^ 8 := by unfold B8N; change B4N * B4N = _; rw [B4N_eq]; ring
private lemma B16N_eq : B16N = B1N ^ 16 := by unfold B16N; change B8N * B8N = _; rw [B8N_eq]; ring
private lemma B32N_eq : B32N = B1N ^ 32 := by unfold B32N; change B16N * B16N = _; rw [B16N_eq]; ring
private lemma B64N_eq : B64N = B1N ^ 64 := by unfold B64N; change B32N * B32N = _; rw [B32N_eq]; ring
private lemma B128N_eq : B128N = B1N ^ 128 := by unfold B128N; change B64N * B64N = _; rw [B64N_eq]; ring
private lemma B251N_eq : B251N = B1N ^ 251 := rfl

private lemma even_B1N_pow {k : ℕ} (hk : 1 ≤ k) : 2 ∣ B1N ^ k := by
  have h2 : 2 ∣ B1N := by rw [B1N_eq]; exact dvd_pow_self 2 (by omega)
  exact dvd_pow h2 (by omega)

private lemma two_mul_div_two_B1N_pow {k : ℕ} (hk : 1 ≤ k) :
    2 * ((Nat.div (B1N ^ k) 2 : ℕ) : ℤ) = ((B1N ^ k : ℕ) : ℤ) := by
  exact_mod_cast Nat.mul_div_cancel' (even_B1N_pow hk)

private lemma two_mul_H1I : 2 * H1I = (B1N : ℤ) := by
  unfold H1I H1N; simpa using two_mul_div_two_B1N_pow (k := 1) (by omega)
private lemma two_mul_H2I : 2 * H2I = (B2N : ℤ) := by
  unfold H2I; rw [B2N_eq]; exact two_mul_div_two_B1N_pow (by omega)
private lemma two_mul_H4I : 2 * H4I = (B4N : ℤ) := by
  unfold H4I; rw [B4N_eq]; exact two_mul_div_two_B1N_pow (by omega)
private lemma two_mul_H8I : 2 * H8I = (B8N : ℤ) := by
  unfold H8I; rw [B8N_eq]; exact two_mul_div_two_B1N_pow (by omega)
private lemma two_mul_H16I : 2 * H16I = (B16N : ℤ) := by
  unfold H16I; rw [B16N_eq]; exact two_mul_div_two_B1N_pow (by omega)
private lemma two_mul_H32I : 2 * H32I = (B32N : ℤ) := by
  unfold H32I; rw [B32N_eq]; exact two_mul_div_two_B1N_pow (by omega)
private lemma two_mul_H64I : 2 * H64I = (B64N : ℤ) := by
  unfold H64I; rw [B64N_eq]; exact two_mul_div_two_B1N_pow (by omega)
private lemma two_mul_H128I : 2 * H128I = (B128N : ℤ) := by
  unfold H128I; rw [B128N_eq]; exact two_mul_div_two_B1N_pow (by omega)
private lemma two_mul_H251I : 2 * H251I = (B251N : ℤ) := by
  unfold H251I; rw [B251N_eq]; exact two_mul_div_two_B1N_pow (by omega)

private lemma iNeg_eq (a : ℤ) : iNeg a = -a := by
  cases a with
  | ofNat n => cases n <;> rfl
  | negSucc n => rfl

private lemma iNatAbs_eq (a : ℤ) : iNatAbs a = a.natAbs := by
  cases a <;> rfl

private lemma iAbs_eq (a : ℤ) : iAbs a = |a| := by
  cases a with
  | ofNat n => simp [iAbs, iNatAbs]
  | negSucc n =>
    simp only [iAbs, iNatAbs]
    rw [abs_of_neg (Int.negSucc_lt_zero n)]
    change ((n + 1 : ℕ) : ℤ) = -Int.negSucc n; omega

private lemma toNat0_eq {a : ℤ} (h : 0 ≤ a) : (toNat0 a : ℤ) = a := by
  cases a with
  | ofNat n => rfl
  | negSucc n => omega

private lemma natSubInt_eq (a b : ℕ) : natSubInt a b = (a : ℤ) - (b : ℤ) := by
  unfold natSubInt
  by_cases h : b ≤ a
  · have hb : Nat.ble b a = true := nat_ble_iff.2 h
    rw [hb]; change ((a - b : ℕ) : ℤ) = (a : ℤ) - (b : ℤ); omega
  · have hb : Nat.ble b a = false := by
      cases h' : Nat.ble b a
      · rfl
      · exact absurd (nat_ble_iff.1 h') h
    rw [hb]; change Int.negSucc (b - a - 1) = (a : ℤ) - (b : ℤ); omega

private lemma iAdd_eq (a b : ℤ) : iAdd a b = a + b := by
  cases a with
  | ofNat m =>
    cases b with
    | ofNat n => rfl
    | negSucc n =>
      change natSubInt m (n + 1) = (m : ℤ) + Int.negSucc n
      rw [natSubInt_eq]; omega
  | negSucc m =>
    cases b with
    | ofNat n =>
      change natSubInt n (m + 1) = Int.negSucc m + (n : ℤ)
      rw [natSubInt_eq]; omega
    | negSucc n => change Int.negSucc (m + (n + 1)) = _; omega

private lemma iSub_eq (a b : ℤ) : iSub a b = a - b := by
  unfold iSub; rw [iAdd_eq, iNeg_eq]; ring

private lemma negNatInt_eq (n : ℕ) : negNatInt n = -(n : ℤ) := by
  unfold negNatInt
  cases n with
  | zero => rfl
  | succ k =>
    change (if Nat.beq (k + 1) 0 = true then (0 : ℤ) else Int.negSucc (k + 1 - 1)) = -((k + 1 : ℕ) : ℤ)
    have hne : Nat.beq (k + 1) 0 = false := by
      cases h : Nat.beq (k + 1) 0
      · rfl
      · exact absurd (nat_beq_iff.1 h) (Nat.succ_ne_zero k)
    rw [hne]
    have hsub : k + 1 - 1 = k := Nat.add_sub_cancel k 1
    change Int.negSucc (k + 1 - 1) = -((k + 1 : ℕ) : ℤ)
    rw [hsub]; omega

private lemma iMul_eq (a b : ℤ) : iMul a b = a * b := by
  cases a with
  | ofNat m =>
    cases b with
    | ofNat n => rfl
    | negSucc n =>
      change negNatInt (m * (n + 1)) = _
      rw [negNatInt_eq]; push_cast
      change -((m : ℤ) * ((n : ℤ) + 1)) = (m : ℤ) * -((n : ℤ) + 1); ring
  | negSucc m =>
    cases b with
    | ofNat n =>
      change negNatInt ((m + 1) * n) = _
      rw [negNatInt_eq]; push_cast
      change -(((m : ℤ) + 1) * (n : ℤ)) = -((m : ℤ) + 1) * (n : ℤ); ring
    | negSucc n =>
      change (((m + 1) * (n + 1) : ℕ) : ℤ) = Int.negSucc m * Int.negSucc n
      push_cast
      change (((m : ℤ) + 1) * ((n : ℤ) + 1)) = -((m : ℤ) + 1) * -((n : ℤ) + 1); ring

private lemma iLe_iff (a b : ℤ) : iLe a b = true ↔ a ≤ b := by
  cases a with
  | ofNat m =>
    cases b with
    | ofNat n => change Nat.ble m n = true ↔ (m : ℤ) ≤ (n : ℤ); rw [nat_ble_iff]; omega
    | negSucc n => unfold iLe; simp; omega
  | negSucc m =>
    cases b with
    | ofNat n => unfold iLe; simp; omega
    | negSucc n => change Nat.ble n m = true ↔ Int.negSucc m ≤ Int.negSucc n; rw [nat_ble_iff]; omega

private lemma tdivNat_zero {d : ℕ} : tdivNat 0 d = 0 := by
  change Int.ofNat (0 / d) = 0; simp

private lemma tdivNat_nonneg {x : ℤ} (hx : 0 ≤ x) (d : ℕ) : 0 ≤ tdivNat x d := by
  cases x with
  | ofNat n => unfold tdivNat; exact Int.natCast_nonneg _
  | negSucc n => omega

private lemma tdivNat_abs_le (x : ℤ) {d : ℕ} (hd : 0 < d) :
    |(tdivNat x d : ℝ)| ≤ |(x : ℝ)| / (d : ℝ) := by
  have hdR : (0 : ℝ) < (d : ℝ) := by exact_mod_cast hd
  rw [le_div_iff₀ hdR]
  cases x with
  | ofNat n =>
    change |((n / d : ℕ) : ℝ)| * (d : ℝ) ≤ |(n : ℝ)|
    rw [abs_of_nonneg (Nat.cast_nonneg _), abs_of_nonneg (Nat.cast_nonneg _)]
    exact_mod_cast Nat.div_mul_le_self n d
  | negSucc n =>
    change |(negNatInt ((n + 1) / d) : ℝ)| * (d : ℝ) ≤ |((Int.negSucc n : ℤ) : ℝ)|
    rw [negNatInt_eq, Int.cast_neg, abs_neg, Int.cast_natCast, abs_of_nonneg (Nat.cast_nonneg _)]
    have hneg : ((Int.negSucc n : ℤ) : ℝ) = -((n + 1 : ℕ) : ℝ) := by
      rw [Int.cast_negSucc]
    rw [hneg, abs_neg, abs_of_nonneg (Nat.cast_nonneg _)]
    exact_mod_cast Nat.div_mul_le_self (n + 1) d

private lemma tdivNat_err (x : ℤ) {d : ℕ} (hd : 0 < d) :
    |(x : ℝ) / (d : ℝ) - (tdivNat x d : ℝ)| ≤ 1 := by
  have hdR : (0 : ℝ) < (d : ℝ) := by exact_mod_cast hd
  have nat_bound : ∀ n : ℕ, |(n : ℝ) / (d : ℝ) - ((n / d : ℕ) : ℝ)| ≤ 1 := fun n => by
    have h1 : ((n / d : ℕ) : ℝ) * (d : ℝ) ≤ (n : ℝ) := by exact_mod_cast Nat.div_mul_le_self n d
    have h2 : (n : ℝ) < (((n / d : ℕ) : ℝ) + 1) * (d : ℝ) := by
      have hm := Nat.div_add_mod n d
      have hr := Nat.mod_lt n hd
      have : n < d * (n / d) + d := by omega
      have hcast : (n : ℝ) < ((d * (n / d) + d : ℕ) : ℝ) := by exact_mod_cast this
      push_cast at hcast; linarith
    rw [abs_le]
    constructor
    · have : ((n / d : ℕ) : ℝ) ≤ (n : ℝ) / (d : ℝ) := (le_div_iff₀ hdR).2 h1
      linarith
    · have : (n : ℝ) / (d : ℝ) < ((n / d : ℕ) : ℝ) + 1 := (div_lt_iff₀ hdR).2 h2
      linarith
  cases x with
  | ofNat n =>
    change |(n : ℝ) / (d : ℝ) - ((n / d : ℕ) : ℝ)| ≤ 1; exact nat_bound n
  | negSucc n =>
    change |((Int.negSucc n : ℤ) : ℝ) / (d : ℝ) - (negNatInt ((n + 1) / d) : ℝ)| ≤ 1
    rw [negNatInt_eq]
    have hneg : ((Int.negSucc n : ℤ) : ℝ) = -((n + 1 : ℕ) : ℝ) := by
      rw [Int.cast_negSucc]
    rw [hneg, Int.cast_neg, Int.cast_natCast, neg_div, sub_neg_eq_add]
    have h := nat_bound (n + 1)
    rw [← abs_neg] at h
    simpa [sub_eq_add_neg, add_comm] using h

private lemma tdivNat_ofNat_le (n : ℕ) {d : ℕ} (hd : 0 < d) :
    ((tdivNat (Int.ofNat n) d : ℤ) : ℝ) ≤ (n : ℝ) / (d : ℝ) := by
  have hdR : (0 : ℝ) < (d : ℝ) := by exact_mod_cast hd
  change ((n / d : ℕ) : ℝ) ≤ (n : ℝ) / (d : ℝ)
  rw [le_div_iff₀ hdR]
  exact_mod_cast Nat.div_mul_le_self n d

/-! ### 2. Balanced base-`B1` splitting, `trunc251`, `sd8`, and `l1_8` -/

private lemma balDivMod_spec {bN : ℕ} {hI : ℤ} (hb : 0 < bN) (hh : 2 * hI = (bN : ℤ)) (x : ℤ) :
    x = (balDivMod bN hI x).1 * (bN : ℤ) + (balDivMod bN hI x).2 ∧
      -hI ≤ (balDivMod bN hI x).2 ∧ (balDivMod bN hI x).2 < hI := by
  unfold balDivMod
  rw [iAdd_eq]
  cases hy : x + hI with
  | ofNat n =>
    dsimp only
    rw [iSub_eq]
    change x = ((n / bN : ℕ) : ℤ) * (bN : ℤ) + (((n % bN : ℕ) : ℤ) - hI) ∧
      -hI ≤ ((n % bN : ℕ) : ℤ) - hI ∧ ((n % bN : ℕ) : ℤ) - hI < hI
    have hdmZ : (bN : ℤ) * ((n / bN : ℕ) : ℤ) + ((n % bN : ℕ) : ℤ) = (n : ℤ) := by
      exact_mod_cast Nat.div_add_mod n bN
    have hlt : n % bN < bN := Nat.mod_lt n hb
    have hyZ : x + hI = (n : ℤ) := by simpa only [Int.ofNat_eq_natCast] using hy
    refine ⟨?_, ?_, ?_⟩
    · linarith [mul_comm (bN : ℤ) ((n / bN : ℕ) : ℤ)]
    · omega
    · omega
  | negSucc n =>
    dsimp only
    rw [iSub_eq]
    change x = (Int.negSucc (n / bN)) * (bN : ℤ) + (((bN - 1 - n % bN : ℕ) : ℤ) - hI) ∧
      -hI ≤ ((bN - 1 - n % bN : ℕ) : ℤ) - hI ∧ ((bN - 1 - n % bN : ℕ) : ℤ) - hI < hI
    have hdmZ : (bN : ℤ) * ((n / bN : ℕ) : ℤ) + ((n % bN : ℕ) : ℤ) = (n : ℤ) := by
      exact_mod_cast Nat.div_add_mod n bN
    have hlt : n % bN < bN := Nat.mod_lt n hb
    have hneg : Int.negSucc (n / bN) = -((n / bN : ℕ) : ℤ) - 1 := by omega
    have hyZ : x + hI = -(n : ℤ) - 1 := by omega
    have hsubZ : ((bN - 1 - n % bN : ℕ) : ℤ) = (bN : ℤ) - 1 - ((n % bN : ℕ) : ℤ) := by omega
    rw [hneg, hsubZ]
    refine ⟨?_, by omega, by omega⟩
    nlinarith [mul_comm (bN : ℤ) ((n / bN : ℕ) : ℤ)]

private lemma balDivMod_unique {bN : ℕ} {hI : ℤ} (hb : 0 < bN) (hh : 2 * hI = (bN : ℤ))
    {x q r : ℤ} (heq : x = q * (bN : ℤ) + r) (hlo : -hI ≤ r) (hhi : r < hI) :
    balDivMod bN hI x = (q, r) := by
  obtain ⟨heq', hlo', hhi'⟩ := balDivMod_spec hb hh x
  set q' := (balDivMod bN hI x).1
  set r' := (balDivMod bN hI x).2
  have hq : q' = q := by
    by_contra hne
    rcases lt_or_gt_of_ne hne with hlt | hgt
    · have : (q - q') * (bN : ℤ) ≥ (bN : ℤ) := by nlinarith
      linarith
    · have : (q' - q) * (bN : ℤ) ≥ (bN : ℤ) := by nlinarith
      linarith
  have hr : r' = r := by subst hq; linarith
  exact Prod.ext hq hr

private def polyTrunc (N : ℕ) (Q : ℤ[X]) : ℤ[X] :=
  ∑ j ∈ range N, Polynomial.monomial j (Q.coeff j)

private lemma coeff_polyTrunc (N : ℕ) (Q : ℤ[X]) (j : ℕ) :
    (polyTrunc N Q).coeff j = if j < N then Q.coeff j else 0 := by
  unfold polyTrunc
  rw [finsetSum_coeff]
  simp only [coeff_monomial]
  by_cases hj : j < N
  · rw [ite_eq_left hj, sum_eq_single j]
    · simp
    · intro b _ hbj; simp [hbj]
    · intro h; exact absurd (mem_range.2 hj) h
  · rw [ite_eq_right hj, sum_eq_zero]
    intro b hb
    have hbN : b < N := mem_range.1 hb
    have : b ≠ j := by omega
    simp [this]

private lemma eval_polyTrunc (N : ℕ) (Q : ℤ[X]) (x : ℤ) :
    (polyTrunc N Q).eval x = ∑ j ∈ range N, Q.coeff j * x ^ j := by
  unfold polyTrunc
  rw [eval_finsetSum]
  refine sum_congr rfl fun j _ => ?_
  rw [eval_monomial]

private def polyShiftDown (k : ℕ) (Q : ℤ[X]) : ℤ[X] :=
  ∑ j ∈ range (Q.natDegree + 1), Polynomial.monomial j (Q.coeff (j + k))

private lemma coeff_polyShiftDown (k : ℕ) (Q : ℤ[X]) (j : ℕ) :
    (polyShiftDown k Q).coeff j = Q.coeff (j + k) := by
  unfold polyShiftDown
  rw [finsetSum_coeff]
  simp only [coeff_monomial]
  by_cases hj : j < Q.natDegree + 1
  · rw [sum_eq_single j]
    · simp
    · intro b _ hbj; simp [hbj]
    · intro h; exact absurd (mem_range.2 hj) h
  · rw [sum_eq_zero]
    · symm; exact Polynomial.coeff_eq_zero_of_natDegree_lt (by omega)
    · intro b hb
      have hb' : b < Q.natDegree + 1 := mem_range.1 hb
      have : b ≠ j := by omega
      simp [this]

private lemma poly_split (k : ℕ) (Q : ℤ[X]) :
    Q = polyTrunc k Q + Polynomial.X ^ k * polyShiftDown k Q := by
  ext j
  rw [coeff_add, coeff_polyTrunc, coeff_X_pow_mul']
  by_cases hj : j < k
  · rw [ite_eq_left hj, ite_eq_right (by omega), add_zero]
  · rw [ite_eq_right hj, ite_eq_left (by omega), zero_add, coeff_polyShiftDown, Nat.sub_add_cancel (by omega)]

private lemma abs_eval_polyTrunc_lt {k : ℕ} {hI : ℤ} (_hk : 1 ≤ k)
    (hh : 2 * hI = ((B1N ^ k : ℕ) : ℤ)) {Q : ℤ[X]}
    (hQ : ∀ j < k, |Q.coeff j| ≤ B1I / 4) :
    |(polyTrunc k Q).eval B1I| < hI := by
  rw [eval_polyTrunc]
  have hB4 : (4 : ℤ) ≤ B1I := B1I_ge_four
  have hB0 : (0 : ℤ) ≤ B1I := by omega
  have hB1 : (1 : ℤ) < B1I := by omega
  have hdiv : 4 * (B1I / 4) ≤ B1I := by omega
  have hsum : |∑ j ∈ range k, Q.coeff j * B1I ^ j| ≤ (B1I / 4) * ∑ j ∈ range k, B1I ^ j := by
    calc |∑ j ∈ range k, Q.coeff j * B1I ^ j|
        ≤ ∑ j ∈ range k, |Q.coeff j * B1I ^ j| := abs_sum_le_sum_abs _ _
      _ = ∑ j ∈ range k, |Q.coeff j| * B1I ^ j := by
          refine sum_congr rfl fun j _ => ?_
          rw [abs_mul, abs_of_nonneg (pow_nonneg hB0 j)]
      _ ≤ ∑ j ∈ range k, (B1I / 4) * B1I ^ j :=
          sum_le_sum fun j hj => mul_le_mul_of_nonneg_right (hQ j (mem_range.1 hj)) (pow_nonneg hB0 j)
      _ = (B1I / 4) * ∑ j ∈ range k, B1I ^ j := (mul_sum _ _ _).symm
  have hgeom : (∑ j ∈ range k, B1I ^ j) * (B1I - 1) = B1I ^ k - 1 := geom_sum_mul B1I k
  have hBpow : ((B1N ^ k : ℕ) : ℤ) = B1I ^ k := by unfold B1I; push_cast; rfl
  rw [hBpow] at hh
  have hpow_pos : (1 : ℤ) ≤ B1I ^ k := one_le_pow₀ (by omega)
  have hmul : 4 * ((B1I / 4) * ∑ j ∈ range k, B1I ^ j) * (B1I - 1) < (4 * hI) * (B1I - 1) := by
    calc 4 * ((B1I / 4) * ∑ j ∈ range k, B1I ^ j) * (B1I - 1)
        = (4 * (B1I / 4)) * ((∑ j ∈ range k, B1I ^ j) * (B1I - 1)) := by ring
      _ = (4 * (B1I / 4)) * (B1I ^ k - 1) := by rw [hgeom]
      _ ≤ B1I * (B1I ^ k - 1) := by nlinarith
      _ < 2 * B1I ^ k * (B1I - 1) := by nlinarith
      _ = (4 * hI) * (B1I - 1) := by rw [← hh]; ring
  have hlt : 4 * ((B1I / 4) * ∑ j ∈ range k, B1I ^ j) < 4 * hI :=
    lt_of_mul_lt_mul_right hmul (by omega)
  omega

private lemma balDivMod_eval_poly {k bN : ℕ} {hI : ℤ} (hk : 1 ≤ k)
    (hbN : bN = B1N ^ k) (hh : 2 * hI = (bN : ℤ)) {Q : ℤ[X]}
    (hQ : ∀ j < k, |Q.coeff j| ≤ B1I / 4) :
    balDivMod bN hI (Q.eval B1I) = ((polyShiftDown k Q).eval B1I, (polyTrunc k Q).eval B1I) := by
  have hb_pos : 0 < bN := by rw [hbN]; exact pow_pos B1N_pos k
  have hh' : 2 * hI = ((B1N ^ k : ℕ) : ℤ) := by rwa [← hbN]
  have habs := abs_eval_polyTrunc_lt hk hh' hQ
  have hlo : -hI ≤ (polyTrunc k Q).eval B1I := by linarith [(abs_lt.1 habs).1]
  have hhi : (polyTrunc k Q).eval B1I < hI := (abs_lt.1 habs).2
  have heq : Q.eval B1I = (polyShiftDown k Q).eval B1I * (bN : ℤ) + (polyTrunc k Q).eval B1I := by
    conv_lhs => rw [poly_split k Q]
    rw [eval_add, eval_mul, eval_pow, eval_X, hbN]
    have hBpow : ((B1N ^ k : ℕ) : ℤ) = B1I ^ k := by unfold B1I; push_cast; rfl
    rw [hBpow]; ring
  exact balDivMod_unique hb_pos hh heq hlo hhi

private lemma trunc251_eval {Q : ℤ[X]} (hQ : ∀ j < 251, |Q.coeff j| ≤ B1I / 4) :
    trunc251 (Q.eval B1I) = (polyTrunc 251 Q).eval B1I := by
  unfold trunc251
  rw [balDivMod_eval_poly (k := 251) (by omega) B251N_eq two_mul_H251I hQ]

private def polyTdiv (d : ℕ) (Q : ℤ[X]) : ℤ[X] :=
  ∑ j ∈ range (Q.natDegree + 1), Polynomial.monomial j (tdivNat (Q.coeff j) d)

private lemma coeff_polyTdiv {d : ℕ} (Q : ℤ[X]) (j : ℕ) :
    (polyTdiv d Q).coeff j = tdivNat (Q.coeff j) d := by
  unfold polyTdiv
  rw [finsetSum_coeff]
  simp only [coeff_monomial]
  by_cases hj : j < Q.natDegree + 1
  · rw [sum_eq_single j]
    · simp
    · intro b _ hbj; simp [hbj]
    · intro h; exact absurd (mem_range.2 hj) h
  · rw [sum_eq_zero]
    · rw [Polynomial.coeff_eq_zero_of_natDegree_lt (by omega), tdivNat_zero]
    · intro b hb
      have hb' : b < Q.natDegree + 1 := mem_range.1 hb
      have : b ≠ j := by omega
      simp [this]

private lemma sdStep_eval {k bN : ℕ} {bI hI : ℤ} {f : ℤ → ℕ → ℤ} {d : ℕ}
    (hk : 1 ≤ k) (hbN : bN = B1N ^ k) (hbI : bI = (bN : ℤ)) (hh : 2 * hI = (bN : ℤ))
    (hf : ∀ Q : ℤ[X], (∀ j ≥ k, Q.coeff j = 0) → (∀ j < k, |Q.coeff j| ≤ B1I / 4) →
      f (Q.eval B1I) d = (polyTdiv d Q).eval B1I) :
    ∀ Q : ℤ[X], (∀ j ≥ 2 * k, Q.coeff j = 0) → (∀ j < 2 * k, |Q.coeff j| ≤ B1I / 4) →
      sdStep bN bI hI f (Q.eval B1I) d = (polyTdiv d Q).eval B1I := by
  intro Q hsupp hQ
  unfold sdStep
  rw [balDivMod_eval_poly hk hbN hh (fun j hj => hQ j (by omega))]
  dsimp only
  rw [iAdd_eq, iMul_eq]
  have hlo_supp : ∀ j ≥ k, (polyTrunc k Q).coeff j = 0 := fun j hj => by
    rw [coeff_polyTrunc, ite_eq_right (by omega)]
  have hlo_bnd : ∀ j < k, |(polyTrunc k Q).coeff j| ≤ B1I / 4 := fun j hj => by
    rw [coeff_polyTrunc, ite_eq_left hj]; exact hQ j (by omega)
  have hhi_supp : ∀ j ≥ k, (polyShiftDown k Q).coeff j = 0 := fun j hj => by
    rw [coeff_polyShiftDown]; exact hsupp (j + k) (by omega)
  have hhi_bnd : ∀ j < k, |(polyShiftDown k Q).coeff j| ≤ B1I / 4 := fun j hj => by
    rw [coeff_polyShiftDown]; exact hQ (j + k) (by omega)
  rw [hf _ hlo_supp hlo_bnd, hf _ hhi_supp hhi_bnd, hbI, hbN]
  have hBpow : ((B1N ^ k : ℕ) : ℤ) = B1I ^ k := by unfold B1I; push_cast; rfl
  rw [hBpow]
  have hpoly : polyTdiv d Q = polyTdiv d (polyTrunc k Q) +
      Polynomial.X ^ k * polyTdiv d (polyShiftDown k Q) := by
    ext j
    rw [coeff_add, coeff_X_pow_mul', coeff_polyTdiv, coeff_polyTdiv, coeff_polyTrunc]
    by_cases hj : j < k
    · rw [ite_eq_left hj, ite_eq_right (by omega), add_zero]
    · rw [ite_eq_right hj, ite_eq_left (by omega), tdivNat_zero, zero_add,
        coeff_polyTdiv, coeff_polyShiftDown, Nat.sub_add_cancel (by omega)]
  conv_rhs => rw [hpoly, eval_add, eval_mul, eval_pow, eval_X]
  ring

private lemma sd0_eval {d : ℕ} :
    ∀ Q : ℤ[X], (∀ j ≥ 1, Q.coeff j = 0) → (∀ j < 1, |Q.coeff j| ≤ B1I / 4) →
      sd0 (Q.eval B1I) d = (polyTdiv d Q).eval B1I := by
  intro Q hsupp _
  have hQeq : Q = Polynomial.C (Q.coeff 0) := by
    ext j; cases j with
    | zero => simp
    | succ j => rw [coeff_C, ite_eq_right (Nat.succ_ne_zero j), hsupp (j + 1) (by omega)]
  have hTeq : polyTdiv d Q = Polynomial.C (tdivNat (Q.coeff 0) d) := by
    ext j; rw [coeff_polyTdiv]; cases j with
    | zero => simp
    | succ j => rw [coeff_C, ite_eq_right (Nat.succ_ne_zero j), hsupp (j + 1) (by omega), tdivNat_zero]
  rw [hTeq, eval_C]
  conv_lhs => rw [hQeq, eval_C]
  rfl

private lemma sd8_eval {d : ℕ} {Q : ℤ[X]}
    (hsupp : ∀ j ≥ 256, Q.coeff j = 0) (hQ : ∀ j < 256, |Q.coeff j| ≤ B1I / 4) :
    sd8 (Q.eval B1I) d = (polyTdiv d Q).eval B1I := by
  have h1 := sdStep_eval (k := 1) (by omega) (by ring) rfl two_mul_H1I (sd0_eval (d := d))
  have h2 := sdStep_eval (k := 2) (by omega) B2N_eq rfl two_mul_H2I h1
  have h3 := sdStep_eval (k := 4) (by omega) B4N_eq rfl two_mul_H4I h2
  have h4 := sdStep_eval (k := 8) (by omega) B8N_eq rfl two_mul_H8I h3
  have h5 := sdStep_eval (k := 16) (by omega) B16N_eq rfl two_mul_H16I h4
  have h6 := sdStep_eval (k := 32) (by omega) B32N_eq rfl two_mul_H32I h5
  have h7 := sdStep_eval (k := 64) (by omega) B64N_eq rfl two_mul_H64I h6
  have h8 := sdStep_eval (k := 128) (by omega) B128N_eq rfl two_mul_H128I h7
  exact h8 Q hsupp hQ

private lemma l1Step_eval {k bN : ℕ} {hI : ℤ} {f : ℤ → ℤ}
    (hk : 1 ≤ k) (hbN : bN = B1N ^ k) (hh : 2 * hI = (bN : ℤ))
    (hf : ∀ Q : ℤ[X], (∀ j ≥ k, Q.coeff j = 0) → (∀ j < k, |Q.coeff j| ≤ B1I / 4) →
      f (Q.eval B1I) = ∑ j ∈ range k, |Q.coeff j|) :
    ∀ Q : ℤ[X], (∀ j ≥ 2 * k, Q.coeff j = 0) → (∀ j < 2 * k, |Q.coeff j| ≤ B1I / 4) →
      l1Step bN hI f (Q.eval B1I) = ∑ j ∈ range (2 * k), |Q.coeff j| := by
  intro Q hsupp hQ
  unfold l1Step
  rw [balDivMod_eval_poly hk hbN hh (fun j hj => hQ j (by omega))]
  dsimp only
  rw [iAdd_eq]
  have hlo_supp : ∀ j ≥ k, (polyTrunc k Q).coeff j = 0 := fun j hj => by
    rw [coeff_polyTrunc, ite_eq_right (by omega)]
  have hlo_bnd : ∀ j < k, |(polyTrunc k Q).coeff j| ≤ B1I / 4 := fun j hj => by
    rw [coeff_polyTrunc, ite_eq_left hj]; exact hQ j (by omega)
  have hhi_supp : ∀ j ≥ k, (polyShiftDown k Q).coeff j = 0 := fun j hj => by
    rw [coeff_polyShiftDown]; exact hsupp (j + k) (by omega)
  have hhi_bnd : ∀ j < k, |(polyShiftDown k Q).coeff j| ≤ B1I / 4 := fun j hj => by
    rw [coeff_polyShiftDown]; exact hQ (j + k) (by omega)
  rw [hf _ hlo_supp hlo_bnd, hf _ hhi_supp hhi_bnd]
  have h1 : ∑ j ∈ range k, |(polyTrunc k Q).coeff j| = ∑ j ∈ range k, |Q.coeff j| :=
    sum_congr rfl fun j hj => by rw [coeff_polyTrunc, ite_eq_left (mem_range.1 hj)]
  have h2 : ∑ j ∈ range k, |(polyShiftDown k Q).coeff j| = ∑ j ∈ range k, |Q.coeff (k + j)| :=
    sum_congr rfl fun j _ => by rw [coeff_polyShiftDown, add_comm]
  rw [h1, h2, show 2 * k = k + k by omega, Finset.sum_range_add]

private lemma l1_0_eval :
    ∀ Q : ℤ[X], (∀ j ≥ 1, Q.coeff j = 0) → (∀ j < 1, |Q.coeff j| ≤ B1I / 4) →
      l1_0 (Q.eval B1I) = ∑ j ∈ range 1, |Q.coeff j| := by
  intro Q hsupp _
  have hQeq : Q = Polynomial.C (Q.coeff 0) := by
    ext j; cases j with
    | zero => simp
    | succ j => rw [coeff_C, ite_eq_right (Nat.succ_ne_zero j), hsupp (j + 1) (by omega)]
  unfold l1_0; rw [iAbs_eq, hQeq, eval_C]; simp

private lemma l1_8_eval {Q : ℤ[X]}
    (hsupp : ∀ j ≥ 251, Q.coeff j = 0) (hQ : ∀ j < 251, |Q.coeff j| ≤ B1I / 4) :
    l1_8 (Q.eval B1I) = ∑ j ∈ range 251, |Q.coeff j| := by
  have h1 := l1Step_eval (k := 1) (by omega) (by ring) two_mul_H1I l1_0_eval
  have h2 := l1Step_eval (k := 2) (by omega) B2N_eq two_mul_H2I h1
  have h3 := l1Step_eval (k := 4) (by omega) B4N_eq two_mul_H4I h2
  have h4 := l1Step_eval (k := 8) (by omega) B8N_eq two_mul_H8I h3
  have h5 := l1Step_eval (k := 16) (by omega) B16N_eq two_mul_H16I h4
  have h6 := l1Step_eval (k := 32) (by omega) B32N_eq two_mul_H32I h5
  have h7 := l1Step_eval (k := 64) (by omega) B64N_eq two_mul_H64I h6
  have h8 := l1Step_eval (k := 128) (by omega) B128N_eq two_mul_H128I h7
  have h256 : l1_8 (Q.eval B1I) = ∑ j ∈ range 256, |Q.coeff j| :=
    h8 Q (fun j hj => hsupp j (by omega)) (fun j hj => by
      by_cases hlt : j < 251
      · exact hQ j hlt
      · rw [hsupp j (by omega), abs_zero]; have := B1I_ge_four; omega)
  rw [h256, show (256 : ℕ) = 251 + 5 by rfl, Finset.sum_range_add]
  have hzero : ∑ j ∈ range 5, |Q.coeff (251 + j)| = 0 :=
    sum_eq_zero fun j _ => by rw [hsupp (251 + j) (by omega), abs_zero]
  omega

/-! ### 3. The `kronRep` invariant and polynomial arithmetic closure -/

/-- `z` encodes a degree-`< 251` integer polynomial `Q` evaluated at `B1I` whose L1 norm is `≤ M`
and which approximates the truncated real polynomial `F` at scale `S` with total L1 error `≤ err`. -/
private def kronRep (S : ℕ) (M err : ℝ) (F : ℝ[X]) (z : ℤ) : Prop :=
  ∃ Q : ℤ[X], (∀ j ≥ 251, Q.coeff j = 0) ∧
    Q.eval B1I = z ∧
    (∑ j ∈ range 251, |(Q.coeff j : ℝ)|) ≤ M ∧
    (∑ j ∈ range 251, |F.coeff j * (S : ℝ) - (Q.coeff j : ℝ)|) ≤ err

private lemma kronRep.mono {S : ℕ} {M M' err err' : ℝ} {F : ℝ[X]} {z : ℤ}
    (h : kronRep S M err F z) (hM : M ≤ M') (herr : err ≤ err') : kronRep S M' err' F z := by
  obtain ⟨Q, hs, hev, hm, he⟩ := h
  exact ⟨Q, hs, hev, hm.trans hM, he.trans herr⟩

private lemma kronRep_zero (S : ℕ) : kronRep S 0 0 0 0 :=
  ⟨0, fun _ _ => coeff_zero _, eval_zero, by simp, by simp⟩

private lemma kronRep_const (S : ℕ) (x : ℝ) (z : ℤ) :
    kronRep S |(z : ℝ)| |x * (S : ℝ) - (z : ℝ)| (Polynomial.C x) z := by
  refine ⟨Polynomial.C z, fun j hj => by rw [coeff_C, ite_eq_right (by omega)], eval_C, ?_, ?_⟩
  · rw [show (251 : ℕ) = 1 + 250 by rfl, Finset.sum_range_add]
    have h0 : ∑ j ∈ range 1, |((Polynomial.C z).coeff j : ℝ)| = |(z : ℝ)| := by simp
    have h1 : ∑ j ∈ range 250, |((Polynomial.C z).coeff (1 + j) : ℝ)| = 0 :=
      sum_eq_zero fun j _ => by rw [coeff_C, ite_eq_right (by omega), Int.cast_zero, abs_zero]
    linarith
  · rw [show (251 : ℕ) = 1 + 250 by rfl, Finset.sum_range_add]
    have h0 : ∑ j ∈ range 1, |(Polynomial.C x).coeff j * (S : ℝ) - ((Polynomial.C z).coeff j : ℝ)| =
        |x * (S : ℝ) - (z : ℝ)| := by simp
    have h1 : ∑ j ∈ range 250,
        |(Polynomial.C x).coeff (1 + j) * (S : ℝ) - ((Polynomial.C z).coeff (1 + j) : ℝ)| = 0 :=
      sum_eq_zero fun j _ => by
        rw [coeff_C, coeff_C, ite_eq_right (by omega), ite_eq_right (by omega)]; simp
    linarith

private lemma kronRep_add {S : ℕ} {M₁ M₂ e₁ e₂ : ℝ} {F₁ F₂ : ℝ[X]} {z₁ z₂ : ℤ}
    (h₁ : kronRep S M₁ e₁ F₁ z₁) (h₂ : kronRep S M₂ e₂ F₂ z₂) :
    kronRep S (M₁ + M₂) (e₁ + e₂) (F₁ + F₂) (iAdd z₁ z₂) := by
  obtain ⟨Q₁, hs₁, hev₁, hm₁, he₁⟩ := h₁
  obtain ⟨Q₂, hs₂, hev₂, hm₂, he₂⟩ := h₂
  refine ⟨Q₁ + Q₂, fun j hj => by rw [coeff_add, hs₁ j hj, hs₂ j hj, add_zero],
    by rw [iAdd_eq, eval_add, hev₁, hev₂], ?_, ?_⟩
  · calc ∑ j ∈ range 251, |((Q₁ + Q₂).coeff j : ℝ)|
        ≤ ∑ j ∈ range 251, (|(Q₁.coeff j : ℝ)| + |(Q₂.coeff j : ℝ)|) :=
          sum_le_sum fun j _ => by rw [coeff_add, Int.cast_add]; exact abs_add_le _ _
      _ = (∑ j ∈ range 251, |(Q₁.coeff j : ℝ)|) + ∑ j ∈ range 251, |(Q₂.coeff j : ℝ)| :=
          sum_add_distrib
      _ ≤ M₁ + M₂ := add_le_add hm₁ hm₂
  · calc ∑ j ∈ range 251, |(F₁ + F₂).coeff j * (S : ℝ) - ((Q₁ + Q₂).coeff j : ℝ)|
        ≤ ∑ j ∈ range 251, (|F₁.coeff j * (S : ℝ) - (Q₁.coeff j : ℝ)| +
            |F₂.coeff j * (S : ℝ) - (Q₂.coeff j : ℝ)|) :=
          sum_le_sum fun j _ => by
            rw [coeff_add, coeff_add, Int.cast_add]
            have : (F₁.coeff j + F₂.coeff j) * (S : ℝ) - ((Q₁.coeff j : ℝ) + (Q₂.coeff j : ℝ)) =
                (F₁.coeff j * (S : ℝ) - (Q₁.coeff j : ℝ)) +
                (F₂.coeff j * (S : ℝ) - (Q₂.coeff j : ℝ)) := by ring
            rw [this]; exact abs_add_le _ _
      _ = (∑ j ∈ range 251, |F₁.coeff j * (S : ℝ) - (Q₁.coeff j : ℝ)|) +
          ∑ j ∈ range 251, |F₂.coeff j * (S : ℝ) - (Q₂.coeff j : ℝ)| := sum_add_distrib
      _ ≤ e₁ + e₂ := add_le_add he₁ he₂

private lemma kronRep_sub {S : ℕ} {M₁ M₂ e₁ e₂ : ℝ} {F₁ F₂ : ℝ[X]} {z₁ z₂ : ℤ}
    (h₁ : kronRep S M₁ e₁ F₁ z₁) (h₂ : kronRep S M₂ e₂ F₂ z₂) :
    kronRep S (M₁ + M₂) (e₁ + e₂) (F₁ - F₂) (iSub z₁ z₂) := by
  obtain ⟨Q₁, hs₁, hev₁, hm₁, he₁⟩ := h₁
  obtain ⟨Q₂, hs₂, hev₂, hm₂, he₂⟩ := h₂
  refine ⟨Q₁ - Q₂, fun j hj => by rw [coeff_sub, hs₁ j hj, hs₂ j hj, sub_zero],
    by rw [iSub_eq, eval_sub, hev₁, hev₂], ?_, ?_⟩
  · calc ∑ j ∈ range 251, |((Q₁ - Q₂).coeff j : ℝ)|
        ≤ ∑ j ∈ range 251, (|(Q₁.coeff j : ℝ)| + |(Q₂.coeff j : ℝ)|) :=
          sum_le_sum fun j _ => by rw [coeff_sub, Int.cast_sub]; exact abs_sub _ _
      _ = (∑ j ∈ range 251, |(Q₁.coeff j : ℝ)|) + ∑ j ∈ range 251, |(Q₂.coeff j : ℝ)| :=
          sum_add_distrib
      _ ≤ M₁ + M₂ := add_le_add hm₁ hm₂
  · calc ∑ j ∈ range 251, |(F₁ - F₂).coeff j * (S : ℝ) - ((Q₁ - Q₂).coeff j : ℝ)|
        ≤ ∑ j ∈ range 251, (|F₁.coeff j * (S : ℝ) - (Q₁.coeff j : ℝ)| +
            |F₂.coeff j * (S : ℝ) - (Q₂.coeff j : ℝ)|) :=
          sum_le_sum fun j _ => by
            rw [coeff_sub, coeff_sub, Int.cast_sub]
            have : (F₁.coeff j - F₂.coeff j) * (S : ℝ) - ((Q₁.coeff j : ℝ) - (Q₂.coeff j : ℝ)) =
                (F₁.coeff j * (S : ℝ) - (Q₁.coeff j : ℝ)) -
                (F₂.coeff j * (S : ℝ) - (Q₂.coeff j : ℝ)) := by ring
            rw [this]; exact abs_sub _ _
      _ = (∑ j ∈ range 251, |F₁.coeff j * (S : ℝ) - (Q₁.coeff j : ℝ)|) +
          ∑ j ∈ range 251, |F₂.coeff j * (S : ℝ) - (Q₂.coeff j : ℝ)| := sum_add_distrib
      _ ≤ e₁ + e₂ := add_le_add he₁ he₂

/-- Core L1 convolution inequality on `range 251`. -/
private lemma sum_abs_coeff_mul_le (A B : ℝ[X]) :
    ∑ j ∈ range 251, |(A * B).coeff j| ≤
      (∑ i ∈ range 251, |A.coeff i|) * (∑ k ∈ range 251, |B.coeff k|) := by
  have h1 : ∀ j ∈ range 251, |(A * B).coeff j| ≤
      ∑ p ∈ Finset.antidiagonal j, |A.coeff p.1| * |B.coeff p.2| := fun j _ => by
    rw [coeff_mul]
    exact (abs_sum_le_sum_abs _ _).trans (sum_le_sum fun p _ => by rw [abs_mul])
  calc ∑ j ∈ range 251, |(A * B).coeff j|
      ≤ ∑ j ∈ range 251, ∑ p ∈ Finset.antidiagonal j, |A.coeff p.1| * |B.coeff p.2| :=
        sum_le_sum h1
    _ = ∑ p ∈ (range 251).biUnion Finset.antidiagonal, |A.coeff p.1| * |B.coeff p.2| := by
        rw [Finset.sum_biUnion]
        intro j₁ _ j₂ _ hne
        dsimp only [Function.onFun]
        rw [Finset.disjoint_left]
        intro p hp₁ hp₂
        rw [Finset.mem_antidiagonal] at hp₁ hp₂
        exact hne (hp₁.symm.trans hp₂)
    _ ≤ ∑ p ∈ range 251 ×ˢ range 251, |A.coeff p.1| * |B.coeff p.2| := by
        refine Finset.sum_le_sum_of_subset_of_nonneg ?_ (fun _ _ _ => mul_nonneg (abs_nonneg _) (abs_nonneg _))
        rintro ⟨i, k⟩ hp
        rcases Finset.mem_biUnion.1 hp with ⟨j, hj, hpj⟩
        rw [Finset.mem_antidiagonal] at hpj
        rw [Finset.mem_range] at hj
        rw [Finset.mem_product, Finset.mem_range, Finset.mem_range]
        exact ⟨by omega, by omega⟩
    _ = (∑ i ∈ range 251, |A.coeff i|) * (∑ k ∈ range 251, |B.coeff k|) := by
        rw [Finset.sum_product, Finset.sum_mul_sum]

private lemma coeff_abs_le_of_sum_abs_le {Q : ℤ[X]} {M : ℝ}
    (hM : ∑ j ∈ range 251, |(Q.coeff j : ℝ)| ≤ M) {j : ℕ} (hj : j < 251) :
    |(Q.coeff j : ℝ)| ≤ M :=
  (Finset.single_le_sum (fun _ _ => abs_nonneg _) (mem_range.2 hj)).trans hM

private lemma int_abs_le_B1_div4 {x : ℤ} (hx : |(x : ℝ)| ≤ ((B1I / 4 : ℤ) : ℝ)) :
    |x| ≤ B1I / 4 := by
  exact_mod_cast hx

private lemma kronRep_shiftX {S : ℕ} {M err : ℝ} {F : ℝ[X]} {z : ℤ}
    (h : kronRep S M err F z) (hM : M ≤ ((B1I / 4 : ℤ) : ℝ)) :
    kronRep S M err (Polynomial.X * F) (trunc251 (iMul B1I z)) := by
  obtain ⟨Q, hs, hev, hm, he⟩ := h
  have hXQ_bnd : ∀ j < 251, |(Polynomial.X * Q).coeff j| ≤ B1I / 4 := fun j hj => by
    cases j with
    | zero =>
      rw [coeff_X_mul_zero, abs_zero]
      have := B1I_ge_four; omega
    | succ k =>
      rw [coeff_X_mul]
      exact int_abs_le_B1_div4 ((coeff_abs_le_of_sum_abs_le hm (by omega)).trans hM)
  have htr : trunc251 (iMul B1I z) = (polyTrunc 251 (Polynomial.X * Q)).eval B1I := by
    have heq : iMul B1I z = (Polynomial.X * Q).eval B1I := by
      rw [iMul_eq, eval_mul, eval_X, hev]
    rw [heq]
    exact trunc251_eval hXQ_bnd
  refine ⟨polyTrunc 251 (Polynomial.X * Q),
    fun j hj => by rw [coeff_polyTrunc, ite_eq_right (by omega)], htr.symm, ?_, ?_⟩
  · have hsum : ∑ j ∈ range 251, |((polyTrunc 251 (Polynomial.X * Q)).coeff j : ℝ)| =
        ∑ k ∈ range 250, |(Q.coeff k : ℝ)| := by
      rw [show (251 : ℕ) = 1 + 250 by rfl, Finset.sum_range_add]
      have h0 : ∑ j ∈ range 1, |((polyTrunc 251 (Polynomial.X * Q)).coeff j : ℝ)| = 0 := by
        simp [coeff_polyTrunc]
      rw [h0, zero_add]
      refine sum_congr rfl fun k hk => ?_
      have hk' : k < 250 := mem_range.1 hk
      rw [coeff_polyTrunc, ite_eq_left (by omega), show 1 + k = k + 1 by omega, coeff_X_mul]
    rw [hsum]
    exact (Finset.sum_le_sum_of_subset_of_nonneg (Finset.range_mono (by omega))
      (fun _ _ _ => abs_nonneg _)).trans hm
  · have hsum : ∑ j ∈ range 251,
        |(Polynomial.X * F).coeff j * (S : ℝ) - ((polyTrunc 251 (Polynomial.X * Q)).coeff j : ℝ)| =
        ∑ k ∈ range 250, |F.coeff k * (S : ℝ) - (Q.coeff k : ℝ)| := by
      rw [show (251 : ℕ) = 1 + 250 by rfl, Finset.sum_range_add]
      have h0 : ∑ j ∈ range 1,
          |(Polynomial.X * F).coeff j * (S : ℝ) - ((polyTrunc 251 (Polynomial.X * Q)).coeff j : ℝ)| = 0 := by
        simp [coeff_polyTrunc]
      rw [h0, zero_add]
      refine sum_congr rfl fun k hk => ?_
      have hk' : k < 250 := mem_range.1 hk
      rw [coeff_polyTrunc, ite_eq_left (by omega), show 1 + k = k + 1 by omega, coeff_X_mul, coeff_X_mul]
    rw [hsum]
    exact (Finset.sum_le_sum_of_subset_of_nonneg (Finset.range_mono (by omega))
      (fun _ _ _ => abs_nonneg _)).trans he

/-- Bilinear product error bound on `range 251`. -/
private lemma mul_prod_kron_bounds {S₁ S₂ : ℕ} {M₁ M₂ e₁ e₂ : ℝ} {F G : ℝ[X]}
    {Q₁ Q₂ : ℤ[X]}
    (hG1 : l1 G ≤ 1)
    (hm₁ : ∑ j ∈ range 251, |(Q₁.coeff j : ℝ)| ≤ M₁)
    (hm₂ : ∑ j ∈ range 251, |(Q₂.coeff j : ℝ)| ≤ M₂)
    (he₁ : ∑ j ∈ range 251, |F.coeff j * (S₁ : ℝ) - (Q₁.coeff j : ℝ)| ≤ e₁)
    (he₂ : ∑ j ∈ range 251, |G.coeff j * (S₂ : ℝ) - (Q₂.coeff j : ℝ)| ≤ e₂) :
    (∑ j ∈ range 251, |((Q₁ * Q₂).coeff j : ℝ)|) ≤ M₁ * M₂ ∧
    (∑ j ∈ range 251, |(F * G).coeff j * ((S₁ : ℝ) * (S₂ : ℝ)) - ((Q₁ * Q₂).coeff j : ℝ)|) ≤
      e₁ * (S₂ : ℝ) + M₁ * e₂ := by
  let Q₁R : ℝ[X] := Q₁.map (Int.castRingHom ℝ)
  let Q₂R : ℝ[X] := Q₂.map (Int.castRingHom ℝ)
  have hQ₁_c : ∀ j, Q₁R.coeff j = (Q₁.coeff j : ℝ) := fun j => Polynomial.coeff_map _ _
  have hQ₂_c : ∀ j, Q₂R.coeff j = (Q₂.coeff j : ℝ) := fun j => Polynomial.coeff_map _ _
  have hprod_c : ∀ j, (Q₁R * Q₂R).coeff j = ((Q₁ * Q₂).coeff j : ℝ) := fun j => by
    have : Q₁R * Q₂R = (Q₁ * Q₂).map (Int.castRingHom ℝ) := (Polynomial.map_mul _).symm
    rw [this, Polynomial.coeff_map]; rfl
  constructor
  · simp_rw [← hprod_c]
    exact (sum_abs_coeff_mul_le Q₁R Q₂R).trans (by
      simp_rw [hQ₁_c, hQ₂_c]
      exact mul_le_mul hm₁ hm₂ (sum_nonneg fun _ _ => abs_nonneg _)
        ((sum_nonneg fun _ _ => abs_nonneg _).trans hm₁))
  · let A₁ : ℝ[X] := Polynomial.C (S₁ : ℝ) * F - Q₁R
    let A₂ : ℝ[X] := Polynomial.C (S₂ : ℝ) * G - Q₂R
    have hsplit : ∀ j, (F * G).coeff j * ((S₁ : ℝ) * (S₂ : ℝ)) - ((Q₁ * Q₂).coeff j : ℝ) =
        (A₁ * (Polynomial.C (S₂ : ℝ) * G)).coeff j + (Q₁R * A₂).coeff j := fun j => by
      rw [← hprod_c j, ← coeff_add]
      have hpoly : Polynomial.C ((S₁ : ℝ) * (S₂ : ℝ)) * (F * G) - Q₁R * Q₂R =
          A₁ * (Polynomial.C (S₂ : ℝ) * G) + Q₁R * A₂ := by
        dsimp only [A₁, A₂]; rw [map_mul]; ring
      have hc := congrArg (fun p : ℝ[X] => p.coeff j) hpoly
      rw [coeff_sub, coeff_C_mul] at hc
      linarith [mul_comm ((S₁ : ℝ) * (S₂ : ℝ)) ((F * G).coeff j)]
    calc ∑ j ∈ range 251, |(F * G).coeff j * ((S₁ : ℝ) * (S₂ : ℝ)) - ((Q₁ * Q₂).coeff j : ℝ)|
        ≤ ∑ j ∈ range 251, (|(A₁ * (Polynomial.C (S₂ : ℝ) * G)).coeff j| + |(Q₁R * A₂).coeff j|) :=
          sum_le_sum fun j _ => by rw [hsplit j]; exact abs_add_le _ _
      _ = (∑ j ∈ range 251, |(A₁ * (Polynomial.C (S₂ : ℝ) * G)).coeff j|) +
          (∑ j ∈ range 251, |(Q₁R * A₂).coeff j|) := sum_add_distrib
      _ ≤ (∑ i ∈ range 251, |A₁.coeff i|) * (∑ k ∈ range 251, |(Polynomial.C (S₂ : ℝ) * G).coeff k|) +
          (∑ i ∈ range 251, |Q₁R.coeff i|) * (∑ k ∈ range 251, |A₂.coeff k|) :=
          add_le_add (sum_abs_coeff_mul_le _ _) (sum_abs_coeff_mul_le _ _)
      _ ≤ e₁ * (S₂ : ℝ) + M₁ * e₂ := by
          have hA₁ : ∑ i ∈ range 251, |A₁.coeff i| ≤ e₁ := by
            simpa [A₁, coeff_sub, coeff_C_mul, hQ₁_c, mul_comm] using he₁
          have hA₂ : ∑ k ∈ range 251, |A₂.coeff k| ≤ e₂ := by
            simpa [A₂, coeff_sub, coeff_C_mul, hQ₂_c, mul_comm] using he₂
          have hQ₁m : ∑ i ∈ range 251, |Q₁R.coeff i| ≤ M₁ := by
            simpa [hQ₁_c] using hm₁
          have hGS : ∑ k ∈ range 251, |(Polynomial.C (S₂ : ℝ) * G).coeff k| ≤ (S₂ : ℝ) := by
            calc ∑ k ∈ range 251, |(Polynomial.C (S₂ : ℝ) * G).coeff k|
                = (S₂ : ℝ) * ∑ k ∈ range 251, |G.coeff k| := by
                  rw [mul_sum]; refine sum_congr rfl fun k _ => ?_
                  rw [coeff_C_mul, abs_mul, abs_of_nonneg (Nat.cast_nonneg _)]
              _ ≤ (S₂ : ℝ) * l1 G :=
                  mul_le_mul_of_nonneg_left (sum_abs_coeff_le_l1 G 251) (Nat.cast_nonneg _)
              _ ≤ (S₂ : ℝ) * 1 := mul_le_mul_of_nonneg_left hG1 (Nat.cast_nonneg _)
              _ = (S₂ : ℝ) := mul_one _
          exact add_le_add
            (mul_le_mul hA₁ hGS (sum_nonneg fun _ _ => abs_nonneg _)
              ((sum_nonneg fun _ _ => abs_nonneg _).trans hA₁))
            (mul_le_mul hQ₁m hA₂ (sum_nonneg fun _ _ => abs_nonneg _)
              ((sum_nonneg fun _ _ => abs_nonneg _).trans hQ₁m))

/-- General `sd8 (trunc251 z) den` soundness for a degree-`< 251` integer polynomial. -/
private lemma kronRep_of_sd8_trunc251 {S_out den : ℕ} {M_in err_in : ℝ}
    {F : ℝ[X]} {Q_in : ℤ[X]}
    (hden : 0 < den)
    (hM_in : ∑ j ∈ range 251, |(Q_in.coeff j : ℝ)| ≤ M_in)
    (hM_safe : M_in ≤ ((B1I / 4 : ℤ) : ℝ))
    (herr_in : ∑ j ∈ range 251, |F.coeff j * ((S_out : ℝ) * (den : ℝ)) - (Q_in.coeff j : ℝ)| ≤ err_in) :
    kronRep S_out (M_in / (den : ℝ)) (err_in / (den : ℝ) + 251) F
      (sd8 (trunc251 (Q_in.eval B1I)) den) := by
  have hdenR : (0 : ℝ) < (den : ℝ) := by exact_mod_cast hden
  have hQ_bnd : ∀ j < 251, |Q_in.coeff j| ≤ B1I / 4 := fun j hj =>
    int_abs_le_B1_div4 ((coeff_abs_le_of_sum_abs_le hM_in hj).trans hM_safe)
  rw [trunc251_eval hQ_bnd]
  set Qt := polyTrunc 251 Q_in
  have hQt_supp : ∀ j ≥ 251, Qt.coeff j = 0 := fun j hj => by
    rw [coeff_polyTrunc, ite_eq_right (by omega)]
  have hQt_bnd : ∀ j < 256, |Qt.coeff j| ≤ B1I / 4 := fun j hj => by
    by_cases hlt : j < 251
    · rw [coeff_polyTrunc, ite_eq_left hlt]; exact hQ_bnd j hlt
    · rw [hQt_supp j (by omega), abs_zero]; have := B1I_ge_four; omega
  rw [sd8_eval (fun j hj => hQt_supp j (by omega)) hQt_bnd]
  refine ⟨polyTdiv den Qt, fun j hj => by rw [coeff_polyTdiv, hQt_supp j hj, tdivNat_zero], rfl, ?_, ?_⟩
  · calc ∑ j ∈ range 251, |((polyTdiv den Qt).coeff j : ℝ)|
        ≤ ∑ j ∈ range 251, |(Q_in.coeff j : ℝ)| / (den : ℝ) :=
          sum_le_sum fun j hj => by
            rw [coeff_polyTdiv, coeff_polyTrunc, ite_eq_left (mem_range.1 hj)]
            exact tdivNat_abs_le _ hden
      _ = (∑ j ∈ range 251, |(Q_in.coeff j : ℝ)|) / (den : ℝ) := (sum_div _ _ _).symm
      _ ≤ M_in / (den : ℝ) := div_le_div_of_nonneg_right hM_in hdenR.le
  · calc ∑ j ∈ range 251, |F.coeff j * (S_out : ℝ) - ((polyTdiv den Qt).coeff j : ℝ)|
        ≤ ∑ j ∈ range 251,
            (|F.coeff j * ((S_out : ℝ) * (den : ℝ)) - (Q_in.coeff j : ℝ)| / (den : ℝ) + 1) :=
          sum_le_sum fun j hj => by
            rw [coeff_polyTdiv, coeff_polyTrunc, ite_eq_left (mem_range.1 hj)]
            have htri : |F.coeff j * (S_out : ℝ) - (tdivNat (Q_in.coeff j) den : ℝ)| ≤
                |F.coeff j * (S_out : ℝ) - (Q_in.coeff j : ℝ) / (den : ℝ)| +
                |(Q_in.coeff j : ℝ) / (den : ℝ) - (tdivNat (Q_in.coeff j) den : ℝ)| :=
              abs_sub_le _ _ _
            have hdiv_eq : F.coeff j * (S_out : ℝ) - (Q_in.coeff j : ℝ) / (den : ℝ) =
                (F.coeff j * ((S_out : ℝ) * (den : ℝ)) - (Q_in.coeff j : ℝ)) / (den : ℝ) := by
              field_simp
            rw [hdiv_eq, abs_div, abs_of_pos hdenR] at htri
            linarith [tdivNat_err (Q_in.coeff j) hden]
      _ = (∑ j ∈ range 251, |F.coeff j * ((S_out : ℝ) * (den : ℝ)) - (Q_in.coeff j : ℝ)|) / (den : ℝ) +
          ∑ _j ∈ range 251, (1 : ℝ) := by rw [sum_add_distrib, sum_div]
      _ ≤ err_in / (den : ℝ) + 251 := by
          simp only [sum_const, card_range, nsmul_eq_mul, mul_one, Nat.cast_ofNat]
          linarith [div_le_div_of_nonneg_right herr_in hdenR.le]

private lemma kronRep_kronMul {M₁ M₂ e₁ e₂ : ℝ} {F G : ℝ[X]} {a b : ℤ}
    (ha : kronRep D80N M₁ e₁ F a) (hb : kronRep D80N M₂ e₂ G b)
    (hG1 : l1 G ≤ 1) (hM_safe : M₁ * M₂ ≤ ((B1I / 4 : ℤ) : ℝ)) :
    kronRep D80N (M₁ * M₂ / (D80N : ℝ)) (e₁ + (M₁ / (D80N : ℝ)) * e₂ + 251) (F * G) (kronMul a b) := by
  obtain ⟨Q₁, _, hev₁, hm₁, he₁⟩ := ha
  obtain ⟨Q₂, _, hev₂, hm₂, he₂⟩ := hb
  obtain ⟨hprod_m, hprod_e⟩ := mul_prod_kron_bounds hG1 hm₁ hm₂ he₁ he₂
  have hev : iMul a b = (Q₁ * Q₂).eval B1I := by rw [iMul_eq, eval_mul, hev₁, hev₂]
  unfold kronMul; rw [hev]
  have hres := kronRep_of_sd8_trunc251 (S_out := D80N) (den := D80N) D80N_pos
    hprod_m hM_safe hprod_e
  have hD80_ne : (D80N : ℝ) ≠ 0 := by exact_mod_cast D80N_pos.ne'
  refine hres.mono le_rfl ?_
  have heq : (e₁ * (D80N : ℝ) + M₁ * e₂) / (D80N : ℝ) + 251 =
      e₁ + M₁ / (D80N : ℝ) * e₂ + 251 := by field_simp
  linarith

private lemma D80_sq_le_B1_div4 : (D80N : ℝ) * (D80N : ℝ) ≤ ((B1I / 4 : ℤ) : ℝ) := by
  have h1 : B1I / 4 = (2 : ℤ) ^ 222 := by unfold B1I; rw [B1N_eq]; norm_num
  rw [h1, D80N_eq]; norm_num

private lemma two_D208_le_B1_div4 :
    (D80N : ℝ) * (D80N : ℝ) * (D48N : ℝ) + (D128N : ℝ) * (D80N : ℝ) ≤ ((B1I / 4 : ℤ) : ℝ) := by
  have h1 : B1I / 4 = (2 : ℤ) ^ 222 := by unfold B1I; rw [B1N_eq]; norm_num
  rw [h1, D80N_eq, D48N_eq, D128N_eq]; norm_num

private lemma two_D160_le_B1_div4 :
    (D80N : ℝ) * (D80N : ℝ) + (D80N : ℝ) * (D80N : ℝ) ≤ ((B1I / 4 : ℤ) : ℝ) := by
  have h1 : B1I / 4 = (2 : ℤ) ^ 222 := by unfold B1I; rw [B1N_eq]; norm_num
  rw [h1, D80N_eq]; norm_num

private lemma kronRep_kronMul_D80 {e₁ e₂ : ℝ} {F G : ℝ[X]} {a b : ℤ}
    (ha : kronRep D80N (D80N : ℝ) e₁ F a) (hb : kronRep D80N (D80N : ℝ) e₂ G b)
    (hG1 : l1 G ≤ 1) :
    kronRep D80N (D80N : ℝ) (e₁ + e₂ + 251) (F * G) (kronMul a b) := by
  have hD80_ne : (D80N : ℝ) ≠ 0 := by exact_mod_cast D80N_pos.ne'
  have h := kronRep_kronMul ha hb hG1 D80_sq_le_B1_div4
  refine h.mono (by field_simp; rfl) (by field_simp; linarith)

attribute [local irreducible] kronMul

private lemma kronRep_buildPows16L {Q : ℝ[X]} {qEnc : ℤ}
    (hQ1 : l1 Q ≤ 1) (hq : kronRep D80N (D80N : ℝ) 300 Q qEnc) :
    let (qows16, q16) := buildPows16L qEnc
    qows16.length = 16 ∧
    (∀ r < 16, kronRep D80N (D80N : ℝ) 9000 (Q ^ r) (qows16.getD r 0)) ∧
    kronRep D80N (D80N : ℝ) 9000 (Q ^ 16) q16 := by
  unfold buildPows16L
  dsimp only
  have h0 : kronRep D80N (D80N : ℝ) 0 (Q ^ 0) D80I := by
    rw [pow_zero]
    have hc := kronRep_const D80N 1 D80I
    have hD : (D80I : ℝ) = (D80N : ℝ) := rfl
    rw [hD, one_mul, sub_self, abs_zero, abs_of_nonneg (Nat.cast_nonneg _)] at hc
    simpa [Polynomial.C_1] using hc
  have step : ∀ {k : ℕ} {e : ℝ} {z : ℤ},
      kronRep D80N (D80N : ℝ) e (Q ^ k) z →
      kronRep D80N (D80N : ℝ) (e + 551) (Q ^ (k + 1)) (kronMul z qEnc) := fun h => by
    rw [pow_succ]
    exact (kronRep_kronMul_D80 h hq hQ1).mono le_rfl (by linarith)
  have h1 : kronRep D80N (D80N : ℝ) 300 (Q ^ 1) qEnc := by simpa [pow_one] using hq
  have h2 := step h1
  have h3 := step h2
  have h4 := step h3
  have h5 := step h4
  have h6 := step h5
  have h7 := step h6
  have h8 := step h7
  have h9 := step h8
  have h10 := step h9
  have h11 := step h10
  have h12 := step h11
  have h13 := step h12
  have h14 := step h13
  have h15 := step h14
  have h16 := step h15
  refine ⟨rfl, ?_, h16.mono le_rfl (by norm_num)⟩
  intro r hr
  match r with
  | 0 => exact h0.mono le_rfl (by norm_num)
  | 1 => exact h1.mono le_rfl (by norm_num)
  | 2 => exact h2.mono le_rfl (by norm_num)
  | 3 => exact h3.mono le_rfl (by norm_num)
  | 4 => exact h4.mono le_rfl (by norm_num)
  | 5 => exact h5.mono le_rfl (by norm_num)
  | 6 => exact h6.mono le_rfl (by norm_num)
  | 7 => exact h7.mono le_rfl (by norm_num)
  | 8 => exact h8.mono le_rfl (by norm_num)
  | 9 => exact h9.mono le_rfl (by norm_num)
  | 10 => exact h10.mono le_rfl (by norm_num)
  | 11 => exact h11.mono le_rfl (by norm_num)
  | 12 => exact h12.mono le_rfl (by norm_num)
  | 13 => exact h13.mono le_rfl (by norm_num)
  | 14 => exact h14.mono le_rfl (by norm_num)
  | 15 => exact h15.mono le_rfl (by norm_num)
  | _ + 16 => omega

/-! ### 4. Baby-step / giant-step Horner (`dot16`, `chunk16Rev`, `hornerD128`, `hornerD80`) -/

private lemma revL_eq {α : Type} (xs acc : List α) : revL xs acc = xs.reverse ++ acc := by
  induction xs generalizing acc with
  | nil => simp [revL]
  | cons x xs ih => simp [revL, ih]

/-- Specification of `dot16`: returns the exact sum of products `acc + ∑_{r < min a.len b.len} a[r] * b[r]`. -/
private lemma dot16_kronRep {S_blk : ℕ} {Q : ℝ[X]} (hQ1 : l1 Q ≤ 1)
    {qows : List ℤ}
    (hq : ∀ r < qows.length, kronRep D80N (D80N : ℝ) 9000 (Q ^ r) (qows.getD r 0))
    {blk : List ℤ} {Cs : List ℝ[X]} {Ms Es : List ℝ}
    (hlen_le : blk.length ≤ qows.length)
    (hlenC : Cs.length = blk.length) (hlenM : Ms.length = blk.length) (hlenE : Es.length = blk.length)
    (hrep : ∀ r < blk.length,
      kronRep S_blk (Ms.getD r 0) (Es.getD r 0) (Cs.getD r 0) (blk.getD r 0))
    (hM0 : ∀ r < blk.length, 0 ≤ Ms.getD r 0) :
    ∃ Qdot : ℤ[X],
      Qdot.eval B1I = dot16 blk qows 0 ∧
      (∑ j ∈ range 251, |(Qdot.coeff j : ℝ)|) ≤ (∑ r ∈ range blk.length, Ms.getD r 0) * (D80N : ℝ) ∧
      (∑ j ∈ range 251,
        |(∑ r ∈ range blk.length, Cs.getD r 0 * Q ^ r).coeff j * ((S_blk : ℝ) * (D80N : ℝ)) -
          (Qdot.coeff j : ℝ)|) ≤
        (∑ r ∈ range blk.length, Es.getD r 0) * (D80N : ℝ) +
          (∑ r ∈ range blk.length, Ms.getD r 0) * 9000 := by
  suffices hgen : ∀ (k : ℕ) (blk' qows' : List ℤ) (Cs' : List ℝ[X]) (Ms' Es' : List ℝ)
      (accZ : ℤ) (Qacc : ℤ[X]) (Facc : ℝ[X]) (Macc Eacc : ℝ),
      blk'.length ≤ qows'.length →
      Cs'.length = blk'.length → Ms'.length = blk'.length → Es'.length = blk'.length →
      (∀ r < qows'.length, kronRep D80N (D80N : ℝ) 9000 (Q ^ (k + r)) (qows'.getD r 0)) →
      (∀ r < blk'.length, kronRep S_blk (Ms'.getD r 0) (Es'.getD r 0) (Cs'.getD r 0) (blk'.getD r 0)) →
      (∀ r < blk'.length, 0 ≤ Ms'.getD r 0) →
      Qacc.eval B1I = accZ →
      (∑ j ∈ range 251, |(Qacc.coeff j : ℝ)|) ≤ Macc →
      (∑ j ∈ range 251, |Facc.coeff j * ((S_blk : ℝ) * (D80N : ℝ)) - (Qacc.coeff j : ℝ)|) ≤ Eacc →
      ∃ Qdot : ℤ[X],
        Qdot.eval B1I = dot16 blk' qows' accZ ∧
        (∑ j ∈ range 251, |(Qdot.coeff j : ℝ)|) ≤
          Macc + (∑ r ∈ range blk'.length, Ms'.getD r 0) * (D80N : ℝ) ∧
        (∑ j ∈ range 251,
          |(Facc + ∑ r ∈ range blk'.length, Cs'.getD r 0 * Q ^ (k + r)).coeff j *
            ((S_blk : ℝ) * (D80N : ℝ)) - (Qdot.coeff j : ℝ)|) ≤
          Eacc + (∑ r ∈ range blk'.length, Es'.getD r 0) * (D80N : ℝ) +
            (∑ r ∈ range blk'.length, Ms'.getD r 0) * 9000 by
    obtain ⟨Qdot, hev, hm, he⟩ := hgen 0 blk qows Cs Ms Es 0 0 0 0 0 hlen_le hlenC hlenM hlenE
      (by simpa using hq) hrep hM0 eval_zero (by simp) (by simp)
    exact ⟨Qdot, hev, by simpa using hm, by simpa using he⟩
  intro k blk'
  induction blk' generalizing k with
  | nil =>
    intro qows' Cs' Ms' Es' accZ Qacc Facc Macc Eacc _ _ _ _ _ _ _ hev hm he
    cases qows' <;> exact ⟨Qacc, hev, by simpa using hm, by simpa using he⟩
  | cons a as ih =>
    intro qows' Cs' Ms' Es' accZ Qacc Facc Macc Eacc hle hC hM hE hq' hr' hM0' hev hm he
    cases qows' with
    | nil => simp at hle
    | cons b bs =>
      cases Cs' with
      | nil => simp at hC
      | cons c cs =>
        cases Ms' with
        | nil => simp at hM
        | cons m ms =>
          cases Es' with
          | nil => simp at hE
          | cons e es =>
            have ha := hr' 0 (by simp)
            have hb := hq' 0 (by simp)
            simp only [List.getD_cons_zero, add_zero] at ha hb
            obtain ⟨Qa, _, heva, hma, hea⟩ := ha
            obtain ⟨Qb, _, hevb, hmb, heb⟩ := hb
            have hQk1 : l1 (Q ^ k) ≤ 1 :=
              (l1_pow_le Q k).trans (pow_le_one₀ (l1_nonneg Q) hQ1)
            obtain ⟨hpm, hpe⟩ := mul_prod_kron_bounds hQk1 hma hmb hea heb
            have hev' : (Qacc + Qa * Qb).eval B1I = iAdd accZ (iMul a b) := by
              rw [iAdd_eq, iMul_eq, eval_add, eval_mul, hev, heva, hevb]
            have hm' : ∑ j ∈ range 251, |((Qacc + Qa * Qb).coeff j : ℝ)| ≤ Macc + m * (D80N : ℝ) := by
              calc ∑ j ∈ range 251, |((Qacc + Qa * Qb).coeff j : ℝ)|
                  ≤ ∑ j ∈ range 251, (|(Qacc.coeff j : ℝ)| + |((Qa * Qb).coeff j : ℝ)|) :=
                    sum_le_sum fun j _ => by rw [coeff_add, Int.cast_add]; exact abs_add_le _ _
                _ = (∑ j ∈ range 251, |(Qacc.coeff j : ℝ)|) + ∑ j ∈ range 251, |((Qa * Qb).coeff j : ℝ)| :=
                    sum_add_distrib
                _ ≤ Macc + m * (D80N : ℝ) := add_le_add hm hpm
            have he' : ∑ j ∈ range 251,
                |(Facc + c * Q ^ k).coeff j * ((S_blk : ℝ) * (D80N : ℝ)) -
                  ((Qacc + Qa * Qb).coeff j : ℝ)| ≤
                Eacc + (e * (D80N : ℝ) + m * 9000) := by
              calc ∑ j ∈ range 251,
                    |(Facc + c * Q ^ k).coeff j * ((S_blk : ℝ) * (D80N : ℝ)) -
                      ((Qacc + Qa * Qb).coeff j : ℝ)|
                  ≤ ∑ j ∈ range 251,
                      (|Facc.coeff j * ((S_blk : ℝ) * (D80N : ℝ)) - (Qacc.coeff j : ℝ)| +
                       |(c * Q ^ k).coeff j * ((S_blk : ℝ) * (D80N : ℝ)) - ((Qa * Qb).coeff j : ℝ)|) :=
                    sum_le_sum fun j _ => by
                      rw [coeff_add, coeff_add, Int.cast_add]
                      have : (Facc.coeff j + (c * Q ^ k).coeff j) * ((S_blk : ℝ) * (D80N : ℝ)) -
                          ((Qacc.coeff j : ℝ) + ((Qa * Qb).coeff j : ℝ)) =
                          (Facc.coeff j * ((S_blk : ℝ) * (D80N : ℝ)) - (Qacc.coeff j : ℝ)) +
                          ((c * Q ^ k).coeff j * ((S_blk : ℝ) * (D80N : ℝ)) - ((Qa * Qb).coeff j : ℝ)) := by
                        ring
                      rw [this]; exact abs_add_le _ _
                _ = (∑ j ∈ range 251, |Facc.coeff j * ((S_blk : ℝ) * (D80N : ℝ)) - (Qacc.coeff j : ℝ)|) +
                    (∑ j ∈ range 251, |(c * Q ^ k).coeff j * ((S_blk : ℝ) * (D80N : ℝ)) -
                      ((Qa * Qb).coeff j : ℝ)|) := sum_add_distrib
                _ ≤ Eacc + (e * (D80N : ℝ) + m * 9000) := add_le_add he hpe
            obtain ⟨Qdot, hdot_ev, hdot_m, hdot_e⟩ := ih (k + 1) bs cs ms es
              (iAdd accZ (iMul a b)) (Qacc + Qa * Qb) (Facc + c * Q ^ k)
              (Macc + m * (D80N : ℝ)) (Eacc + (e * (D80N : ℝ) + m * 9000))
              (by simp at hle; omega) (by simpa using hC) (by simpa using hM) (by simpa using hE)
              (fun r hr => by
                have := hq' (r + 1) (by simp; omega)
                simpa [show k + (r + 1) = k + 1 + r by omega] using this)
              (fun r hr => by simpa using hr' (r + 1) (by simp; omega))
              (fun r hr => by simpa using hM0' (r + 1) (by simp; omega))
              hev' hm' he'
            refine ⟨Qdot, hdot_ev, ?_, ?_⟩
            · rw [List.length_cons]
              conv_rhs => rw [Finset.sum_range_succ']
              simp only [List.getD_cons_zero, List.getD_cons_succ]
              linarith
            · have hpoly_eq : Facc + ∑ r ∈ range (as.length + 1),
                  (c :: cs).getD r 0 * Q ^ (k + r) =
                  (Facc + c * Q ^ k) + ∑ r ∈ range as.length, cs.getD r 0 * Q ^ (k + 1 + r) := by
                rw [Finset.sum_range_succ']
                simp only [List.getD_cons_zero, List.getD_cons_succ, add_zero]
                have hcongr : ∑ r ∈ range as.length, cs.getD r 0 * Q ^ (k + (r + 1)) =
                    ∑ r ∈ range as.length, cs.getD r 0 * Q ^ (k + 1 + r) :=
                  sum_congr rfl fun r _ => by rw [show k + (r + 1) = k + 1 + r by omega]
                rw [hcongr]; ring
              simp only [List.length_cons] at hdot_e ⊢
              rw [hpoly_eq]
              conv_rhs => rw [Finset.sum_range_succ', Finset.sum_range_succ']
              simp only [List.getD_cons_zero, List.getD_cons_succ]
              linarith

private def split16G {α : Type*} : ℕ → List α → List α → List α × List α
  | 0, xs, acc => (acc.reverse, xs)
  | _, [], acc => (acc.reverse, [])
  | k + 1, x :: xs, acc => split16G k xs (x :: acc)

private lemma split16Acc_eq (k : ℕ) (xs acc : List ℤ) :
    split16Acc k xs acc = split16G k xs acc := by
  induction k generalizing xs acc with
  | zero => simp [split16Acc, split16G, revL_eq]
  | succ k ih =>
    cases xs with
    | nil => simp [split16Acc, split16G, revL_eq]
    | cons x xs => simp [split16Acc, split16G, ih]

private lemma split16G_spec {α : Type*} (k : ℕ) (xs acc : List α) :
    (split16G k xs acc).1 = acc.reverse ++ xs.take k ∧
    (split16G k xs acc).2 = xs.drop k := by
  induction k generalizing xs acc with
  | zero => simp [split16G]
  | succ k ih =>
    cases xs with
    | nil => simp [split16G]
    | cons x xs =>
      simp only [split16G, List.take_succ_cons, List.drop_succ_cons]
      obtain ⟨h1, h2⟩ := ih xs (x :: acc)
      exact ⟨by simpa [List.append_assoc] using h1, h2⟩

/-- Splitting a list `xs` of length `≤ 16 * n` via `chunk16Rev n xs []` yields chunks whose
concatenation (in reverse order) equals `xs`, with every non-last chunk of length 16. -/
private def chunk16RevG {α : Type*} : ℕ → List α → List (List α) → List (List α)
  | 0, _, acc => acc
  | _ + 1, [], acc => acc
  | n + 1, xs, acc =>
    let (hd, tl) := split16G 16 xs []
    chunk16RevG n tl (hd :: acc)

private lemma chunk16Rev_eq (n : ℕ) (xs : List ℤ) (acc : List (List ℤ)) :
    chunk16Rev n xs acc = chunk16RevG n xs acc := by
  induction n generalizing xs acc with
  | zero => rfl
  | succ n ih =>
    cases xs with
    | nil => rfl
    | cons x xs =>
      simp only [chunk16Rev, chunk16RevG, split16Acc_eq]
      exact ih _ _

private lemma chunk16RevG_map {α β : Type*} (f : α → β) (n : ℕ) (xs : List α) (acc : List (List α)) :
    (chunk16RevG n xs acc).map (List.map f) = chunk16RevG n (xs.map f) (acc.map (List.map f)) := by
  induction n generalizing xs acc with
  | zero => rfl
  | succ n ih =>
    cases xs with
    | nil => rfl
    | cons x xs =>
      simp only [chunk16RevG, List.map_cons]
      obtain ⟨h1, h2⟩ := split16G_spec 16 (x :: xs) []
      obtain ⟨h1', h2'⟩ := split16G_spec 16 (f x :: xs.map f) []
      simp only [List.reverse_nil, List.nil_append] at h1 h1'
      have hhd : (split16G 16 (x :: xs) []).1.map f = (split16G 16 (f x :: xs.map f) []).1 := by
        rw [h1, h1', ← List.map_cons, List.map_take]
      have htl : (split16G 16 (x :: xs) []).2.map f = (split16G 16 (f x :: xs.map f) []).2 := by
        rw [h2, h2', ← List.map_cons, List.map_drop]
      rw [ih, List.map_cons, hhd, htl]

/-- Horner polynomial evaluation over reversed chunks of `≤ 16` elements. -/
private def hornerPoly (Q : ℝ[X]) : List (List ℝ[X]) → ℝ[X] → ℝ[X]
  | [], acc => acc
  | blk :: rest, acc =>
    hornerPoly Q rest (acc * Q ^ 16 + ∑ r ∈ range blk.length, blk.getD r 0 * Q ^ r)

private lemma hornerPoly_cons (Q : ℝ[X]) (blk : List ℝ[X]) (rest : List (List ℝ[X])) (acc : ℝ[X]) :
    hornerPoly Q (blk :: rest) acc =
      hornerPoly Q rest (acc * Q ^ 16 + ∑ r ∈ range blk.length, blk.getD r 0 * Q ^ r) := rfl

private lemma hornerPoly_chunk16RevG (Q : ℝ[X]) (n : ℕ) (Cs : List ℝ[X]) (acc : List (List ℝ[X]))
    (hlen : Cs.length ≤ 16 * n) :
    ∀ A : ℝ[X],
      hornerPoly Q (chunk16RevG n Cs acc) A =
        hornerPoly Q acc (A * Q ^ (16 * n) +
          ∑ k ∈ range Cs.length, Cs.getD k 0 * Q ^ k) ∨
      ∃ m ≤ n,
        hornerPoly Q (chunk16RevG n Cs acc) A =
          hornerPoly Q acc (A * Q ^ (16 * m) +
            ∑ k ∈ range Cs.length, Cs.getD k 0 * Q ^ k) := by
  -- Even simpler: prove directly with A = 0!
  intro A
  right
  induction n generalizing Cs acc A with
  | zero =>
    have hnil : Cs = [] := List.eq_nil_of_length_eq_zero (by omega)
    subst hnil
    exact ⟨0, le_rfl, by simp [chunk16RevG]⟩
  | succ n ih =>
    cases Cs with
    | nil =>
      exact ⟨0, Nat.zero_le _, by simp [chunk16RevG]⟩
    | cons c cs =>
      simp only [chunk16RevG]
      obtain ⟨h1, h2⟩ := split16G_spec 16 (c :: cs) []
      simp only [List.reverse_nil, List.nil_append] at h1
      rw [h1, h2]
      have hlen_drop : ((c :: cs).drop 16).length ≤ 16 * n := by
        simp only [List.length_drop, List.length_cons] at hlen ⊢; omega
      obtain ⟨m, hm, heq⟩ := ih ((c :: cs).drop 16) (((c :: cs).take 16) :: acc) hlen_drop A
      rw [heq, hornerPoly_cons]
      refine ⟨m + 1, by omega, ?_⟩
      refine congrArg (hornerPoly Q acc) ?_
      by_cases h16 : (c :: cs).length ≤ 16
      · have hdrop : (c :: cs).drop 16 = [] := List.drop_eq_nil_of_le h16
        have htake : (c :: cs).take 16 = c :: cs := List.take_of_length_le h16
        rw [hdrop, htake]
        simp only [List.length_nil, Finset.range_zero, Finset.sum_empty, add_zero]
        rw [mul_assoc A, ← pow_add, show 16 * m + 16 = 16 * (m + 1) by omega]
      · push Not at h16
        have htake_len : ((c :: cs).take 16).length = 16 := List.length_take_of_le (by omega)
        have hdrop_len : ((c :: cs).drop 16).length = (c :: cs).length - 16 := List.length_drop
        have hsplit_sum : ∑ k ∈ range (c :: cs).length, (c :: cs).getD k 0 * Q ^ k =
            (∑ k ∈ range ((c :: cs).drop 16).length, ((c :: cs).drop 16).getD k 0 * Q ^ k) * Q ^ 16 +
            ∑ r ∈ range ((c :: cs).take 16).length, ((c :: cs).take 16).getD r 0 * Q ^ r := by
          rw [htake_len, hdrop_len]
          conv_lhs => rw [show (c :: cs).length = 16 + ((c :: cs).length - 16) by omega]
          rw [Finset.sum_range_add, Finset.sum_mul, add_comm]
          refine congrArg₂ (· + ·) ?_ ?_
          · refine sum_congr rfl fun k _ => ?_
            rw [mul_assoc, ← pow_add, add_comm k 16]
            refine congrArg (· * _) ?_
            simp only [List.getD_eq_getElem?_getD, List.getElem?_drop]
          · refine sum_congr rfl fun r hr => ?_
            refine congrArg (· * _) ?_
            simp only [List.getD_eq_getElem?_getD, List.getElem?_take_of_lt (mem_range.1 hr)]
        rw [hsplit_sum, add_mul, mul_assoc A, ← pow_add, show 16 * m + 16 = 16 * (m + 1) by omega,
          add_assoc]

private lemma hornerPoly_chunk16RevG_zero (Q : ℝ[X]) (Cs : List ℝ[X]) (hlen : Cs.length ≤ 256) :
    hornerPoly Q (chunk16RevG 16 Cs []) 0 = ∑ k ∈ range Cs.length, Cs.getD k 0 * Q ^ k := by
  rcases hornerPoly_chunk16RevG Q 16 Cs [] (by omega) 0 with h | ⟨m, _, h⟩ <;>
    simpa [hornerPoly] using h

private lemma chunk16RevG_len_le {α : Type*} (n : ℕ) (xs : List α) (acc : List (List α))
    (hacc : ∀ b ∈ acc, b.length ≤ 16) :
    (chunk16RevG n xs acc).length ≤ n + acc.length ∧
    ∀ b ∈ chunk16RevG n xs acc, b.length ≤ 16 := by
  induction n generalizing xs acc with
  | zero => exact ⟨by simp [chunk16RevG], hacc⟩
  | succ n ih =>
    cases xs with
    | nil => exact ⟨by simp [chunk16RevG], hacc⟩
    | cons x xs =>
      simp only [chunk16RevG]
      obtain ⟨h1, _⟩ := split16G_spec 16 (x :: xs) []
      simp only [List.reverse_nil, List.nil_append] at h1
      have hhd_le : (split16G 16 (x :: xs) []).1.length ≤ 16 := by rw [h1]; exact List.length_take_le _ _
      have hacc' : ∀ b ∈ (split16G 16 (x :: xs) []).1 :: acc, b.length ≤ 16 := fun b hb => by
        rcases List.mem_cons.1 hb with rfl | hb'
        · exact hhd_le
        · exact hacc b hb'
      obtain ⟨hL, hB⟩ := ih _ _ hacc'
      exact ⟨by simp only [List.length_cons] at hL; omega, hB⟩

private lemma chunk16RevG_sum_eq {α : Type*} (f : α → ℝ) (n : ℕ) (xs : List α) (acc : List (List α))
    (hlen : xs.length ≤ 16 * n) :
    ((chunk16RevG n xs acc).map fun b => (b.map f).sum).sum =
      (xs.map f).sum + (acc.map fun b => (b.map f).sum).sum := by
  induction n generalizing xs acc with
  | zero =>
    have hnil : xs = [] := List.eq_nil_of_length_eq_zero (by omega)
    subst hnil; simp [chunk16RevG]
  | succ n ih =>
    cases xs with
    | nil => simp [chunk16RevG]
    | cons x xs =>
      simp only [chunk16RevG]
      obtain ⟨h1, h2⟩ := split16G_spec 16 (x :: xs) []
      simp only [List.reverse_nil, List.nil_append] at h1
      rw [h1, h2]
      have hlen_drop : ((x :: xs).drop 16).length ≤ 16 * n := by
        simp only [List.length_drop, List.length_cons] at hlen ⊢; omega
      rw [ih _ _ hlen_drop]
      simp only [List.map_cons, List.sum_cons]
      have hsplit : ((x :: xs).take 16).map f ++ ((x :: xs).drop 16).map f = (x :: xs).map f := by
        rw [← List.map_append, List.take_append_drop]
      have hsum := congrArg List.sum hsplit
      rw [List.sum_append] at hsum
      simp only [List.map_cons, List.sum_cons] at hsum ⊢
      linarith

private lemma list_sum_eq_range (xs : List ℝ) :
    xs.sum = ∑ k ∈ range xs.length, xs.getD k 0 := by
  induction xs with
  | nil => simp
  | cons x xs ih =>
    rw [List.sum_cons, List.length_cons, Finset.sum_range_succ']
    simp only [List.getD_cons_zero, List.getD_cons_succ, ih, add_comm]

/-- Master soundness lemma for `hornerD128` on a packed list `xs` of length `≤ 256`. -/
private lemma kronRep_hornerD128 {Q : ℝ[X]} {qows16 : List ℤ} {q16 : ℤ}
    (hQ1 : l1 Q ≤ 1)
    (hq_len : qows16.length = 16)
    (hqows : ∀ r < 16, kronRep D80N (D80N : ℝ) 9000 (Q ^ r) (qows16.getD r 0))
    (hq16 : kronRep D80N (D80N : ℝ) 9000 (Q ^ 16) q16)
    {xs : List ℤ} {Cs : List ℝ[X]} {Ms Es : List ℝ}
    (hlen256 : xs.length ≤ 256)
    (hC : Cs.length = xs.length) (hM : Ms.length = xs.length) (hE : Es.length = xs.length)
    (hrep : ∀ k < xs.length, kronRep D128N (Ms.getD k 0) (Es.getD k 0) (Cs.getD k 0) (xs.getD k 0))
    (hM0 : ∀ k < xs.length, 0 ≤ Ms.getD k 0)
    (hMtot : ∑ k ∈ range xs.length, Ms.getD k 0 ≤ (D128N : ℝ))
    (hEtot : ∑ k ∈ range xs.length, Es.getD k 0 ≤ 21168 * (D48N : ℝ)) :
    kronRep D80N (D80N : ℝ) 200000
      (∑ k ∈ range xs.length, Cs.getD k 0 * Q ^ k)
      (hornerD128 qows16 q16 (chunk16Rev 16 xs []) 0) := by
  let zip4 : List (ℤ × ℝ[X] × ℝ × ℝ) :=
    (List.range xs.length).map fun k => (xs.getD k 0, Cs.getD k 0, Ms.getD k 0, Es.getD k 0)
  have hzip_len : zip4.length = xs.length := by simp [zip4]
  have hzip_xs : zip4.map Prod.fst = xs := by
    refine List.ext_getElem (by simp [zip4]) fun i hi hix => ?_
    simp [zip4, List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hix]
  have hzip_Cs : zip4.map (fun t => t.2.1) = Cs := by
    refine List.ext_getElem (by simp [zip4, hC]) fun i hi hiC => ?_
    simp [zip4, List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hiC]
  have hzip_Ms : zip4.map (fun t => t.2.2.1) = Ms := by
    refine List.ext_getElem (by simp [zip4, hM]) fun i hi hiM => ?_
    simp [zip4, List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hiM]
  have hzip_Es : zip4.map (fun t => t.2.2.2) = Es := by
    refine List.ext_getElem (by simp [zip4, hE]) fun i hi hiE => ?_
    simp [zip4, List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hiE]
  set chunks := chunk16RevG 16 zip4 []
  have hch_xs : chunk16Rev 16 xs [] = chunks.map (List.map Prod.fst) := by
    rw [chunk16Rev_eq, ← hzip_xs, chunk16RevG_map]; rfl
  have hch_Cs : chunk16RevG 16 Cs [] = chunks.map (List.map fun t => t.2.1) := by
    rw [← hzip_Cs, chunk16RevG_map]; rfl
  have hch_len_all := chunk16RevG_len_le 16 zip4 [] (by simp)
  have hch_cnt : chunks.length ≤ 16 := by simpa using hch_len_all.1
  have hch_blk_le : ∀ b ∈ chunks, b.length ≤ 16 := hch_len_all.2
  have hch_prop : ∀ b ∈ chunks, ∀ t ∈ b,
      kronRep D128N t.2.2.1 t.2.2.2 t.2.1 t.1 ∧ 0 ≤ t.2.2.1 := by
    have hmem_zip : ∀ b ∈ chunks, ∀ t ∈ b, t ∈ zip4 := by
      have hgen : ∀ (n : ℕ) (zs : List (ℤ × ℝ[X] × ℝ × ℝ)) (acc : List (List (ℤ × ℝ[X] × ℝ × ℝ))),
          (∀ b ∈ acc, ∀ t ∈ b, t ∈ zip4) → (∀ t ∈ zs, t ∈ zip4) →
          ∀ b ∈ chunk16RevG n zs acc, ∀ t ∈ b, t ∈ zip4 := by
        intro n
        induction n with
        | zero => intro zs acc hacc _ b hb; exact hacc b hb
        | succ n ih =>
          intro zs acc hacc hzs
          cases zs with
          | nil => exact hacc
          | cons z zs =>
            simp only [chunk16RevG]
            obtain ⟨h1, h2⟩ := split16G_spec 16 (z :: zs) []
            simp only [List.reverse_nil, List.nil_append] at h1
            rw [h1, h2]
            refine ih _ _ (fun b hb t ht => ?_) (fun t ht => hzs t (List.mem_of_mem_drop ht))
            rcases List.mem_cons.1 hb with rfl | hb'
            · exact hzs t (List.mem_of_mem_take ht)
            · exact hacc b hb' t ht
      exact hgen 16 zip4 [] (by simp) (fun _ h => h)
    intro b hb t ht
    have htz := hmem_zip b hb t ht
    rcases List.mem_map.1 htz with ⟨k, hk, rfl⟩
    have hk' : k < xs.length := List.mem_range.1 hk
    exact ⟨hrep k hk', hM0 k hk'⟩
  have hMsum_ch : (chunks.map fun b => (b.map fun t => t.2.2.1).sum).sum ≤ (D128N : ℝ) := by
    rw [chunk16RevG_sum_eq (fun t => t.2.2.1) 16 zip4 [] (by omega)]
    simp only [List.map_nil, List.sum_nil, add_zero]
    rw [hzip_Ms, list_sum_eq_range Ms, hM]
    exact hMtot
  have hEsum_ch : (chunks.map fun b => (b.map fun t => t.2.2.2).sum).sum ≤ 21168 * (D48N : ℝ) := by
    rw [chunk16RevG_sum_eq (fun t => t.2.2.2) 16 zip4 [] (by omega)]
    simp only [List.map_nil, List.sum_nil, add_zero]
    rw [hzip_Es, list_sum_eq_range Es, hE]
    exact hEtot
  -- Inductive Horner step over `chunks`!
  have hQ16_1 : l1 (Q ^ 16) ≤ 1 := (l1_pow_le Q 16).trans (pow_le_one₀ (l1_nonneg Q) hQ1)
  have hD48R : (0 : ℝ) < (D48N : ℝ) := by exact_mod_cast D48N_pos
  have hD80R : (0 : ℝ) < (D80N : ℝ) := by exact_mod_cast D80N_pos
  have hD128R : (0 : ℝ) < (D128N : ℝ) := by exact_mod_cast D128N_pos
  have hDmul : (D128N : ℝ) = (D80N : ℝ) * (D48N : ℝ) := by exact_mod_cast D128N_eq_mul
  have hstep : ∀ (cs : List (List (ℤ × ℝ[X] × ℝ × ℝ))) (accZ : ℤ) (accF : ℝ[X]) (S_acc E_acc : ℝ),
      0 ≤ S_acc →
      S_acc + (cs.map fun b => (b.map fun t => t.2.2.1).sum).sum ≤ (D128N : ℝ) →
      (∀ b ∈ cs, b.length ≤ 16) →
      (∀ b ∈ cs, ∀ t ∈ b, kronRep D128N t.2.2.1 t.2.2.2 t.2.1 t.1 ∧ 0 ≤ t.2.2.1) →
      kronRep D80N (S_acc / (D48N : ℝ)) E_acc accF accZ →
      kronRep D80N ((S_acc + (cs.map fun b => (b.map fun t => t.2.2.1).sum).sum) / (D48N : ℝ))
        (E_acc + (cs.length : ℝ) * 9251 +
          (cs.map fun b => (b.map fun t => t.2.2.2).sum).sum / (D48N : ℝ) +
          (cs.map fun b => (b.map fun t => t.2.2.1).sum).sum / (D128N : ℝ) * 9000)
        (hornerPoly Q (cs.map (List.map fun t => t.2.1)) accF)
        (hornerD128 qows16 q16 (cs.map (List.map Prod.fst)) accZ) := by
    intro cs
    induction cs with
    | nil =>
      intro accZ accF S_acc E_acc _ _ _ _ hacc
      simpa [hornerPoly, hornerD128] using hacc
    | cons b rest ih =>
      intro accZ accF S_acc E_acc hS0 hStot hble hbp hacc
      simp only [List.map_cons, hornerPoly, hornerD128]
      have hb_le : b.length ≤ 16 := hble b (List.mem_cons_self)
      have hbm_nonneg : ∀ r < b.length, 0 ≤ (b.map fun t => t.2.2.1).getD r 0 := fun r hr => by
        rw [List.getD_eq_getElem?_getD, List.getElem?_map,
          List.getElem?_eq_getElem hr]
        exact (hbp b (List.mem_cons_self) b[r] (List.getElem_mem hr)).2
      have hb_Msum : 0 ≤ (b.map fun t => t.2.2.1).sum :=
        List.sum_nonneg fun x hx => by
          rcases List.mem_map.1 hx with ⟨t, ht, rfl⟩
          exact (hbp b (List.mem_cons_self) t ht).2
      have hrest_Msum : 0 ≤ (rest.map fun b' => (b'.map fun t => t.2.2.1).sum).sum :=
        List.sum_nonneg fun x hx => by
          rcases List.mem_map.1 hx with ⟨b', hb', rfl⟩
          exact List.sum_nonneg fun y hy => by
            rcases List.mem_map.1 hy with ⟨t, ht, rfl⟩
            exact (hbp b' (List.mem_cons_of_mem _ hb') t ht).2
      simp only [List.map_cons, List.sum_cons] at hStot
      have hS_le_D128 : S_acc ≤ (D128N : ℝ) := by linarith
      have hbM_le_D128 : (b.map fun t => t.2.2.1).sum ≤ (D128N : ℝ) := by linarith
      have hS_div_le : S_acc / (D48N : ℝ) ≤ (D80N : ℝ) := by
        rw [div_le_iff₀ hD48R, ← hDmul]; exact hS_le_D128
      -- 1. `dot16` on block `b`
      obtain ⟨Qdot, hdot_ev, hdot_m, hdot_e⟩ := dot16_kronRep (S_blk := D128N) hQ1
        (qows := qows16) (fun r hr => hqows r (by omega))
        (blk := b.map Prod.fst) (Cs := b.map fun t => t.2.1)
        (Ms := b.map fun t => t.2.2.1) (Es := b.map fun t => t.2.2.2)
        (by simp [hq_len]; exact hb_le) (by simp) (by simp) (by simp)
        (fun r hr => by
          have hr' : r < b.length := by simpa using hr
          simp only [List.getD_eq_getElem?_getD, List.getElem?_map, List.getElem?_eq_getElem hr']
          exact (hbp b (List.mem_cons_self) b[r] (List.getElem_mem hr')).1)
        (fun r hr => by simpa using hbm_nonneg r (by simpa using hr))
      -- 2. `acc * q16 * D48I`
      obtain ⟨Qacc, _, hacc_ev, hacc_m, hacc_e⟩ := hacc
      obtain ⟨Qq16, _, hq16_ev, hq16_m, hq16_e⟩ := hq16
      obtain ⟨hpm, hpe⟩ := mul_prod_kron_bounds hQ16_1 hacc_m hq16_m hacc_e hq16_e
      -- Scale `Qacc * Qq16` by `D48I`
      let Qleft : ℤ[X] := Polynomial.C D48I * (Qacc * Qq16)
      let Qsum : ℤ[X] := Qleft + Qdot
      have hQsum_ev : Qsum.eval B1I =
          iAdd (iMul (iMul accZ q16) D48I) (dot16 (b.map Prod.fst) qows16 0) := by
        rw [iAdd_eq, iMul_eq, iMul_eq]
        simp only [Qsum, Qleft, eval_add, eval_mul, eval_C, hacc_ev, hq16_ev, hdot_ev]
        ring
      have hD48I_R : (D48I : ℝ) = (D48N : ℝ) := rfl
      have hQleft_m : ∑ j ∈ range 251, |(Qleft.coeff j : ℝ)| ≤ S_acc * (D80N : ℝ) := by
        calc ∑ j ∈ range 251, |(Qleft.coeff j : ℝ)|
            = (D48N : ℝ) * ∑ j ∈ range 251, |((Qacc * Qq16).coeff j : ℝ)| := by
              rw [mul_sum]; refine sum_congr rfl fun j _ => ?_
              simp only [Qleft, coeff_C_mul, Int.cast_mul, hD48I_R, abs_mul,
                abs_of_nonneg hD48R.le]
          _ ≤ (D48N : ℝ) * (S_acc / (D48N : ℝ) * (D80N : ℝ)) :=
              mul_le_mul_of_nonneg_left hpm hD48R.le
          _ = S_acc * (D80N : ℝ) := by field_simp
      have hQleft_e : ∑ j ∈ range 251,
          |(accF * Q ^ 16).coeff j * ((D80N : ℝ) * (D128N : ℝ)) - (Qleft.coeff j : ℝ)| ≤
          E_acc * (D128N : ℝ) + S_acc * (D80N : ℝ) / (D80N : ℝ) * 9000 := by
        calc ∑ j ∈ range 251,
              |(accF * Q ^ 16).coeff j * ((D80N : ℝ) * (D128N : ℝ)) - (Qleft.coeff j : ℝ)|
            = (D48N : ℝ) * ∑ j ∈ range 251,
                |(accF * Q ^ 16).coeff j * ((D80N : ℝ) * (D80N : ℝ)) - ((Qacc * Qq16).coeff j : ℝ)| := by
              rw [mul_sum]; refine sum_congr rfl fun j _ => ?_
              simp only [Qleft, coeff_C_mul, Int.cast_mul, hD48I_R]
              have : (accF * Q ^ 16).coeff j * ((D80N : ℝ) * (D128N : ℝ)) -
                  (D48N : ℝ) * ((Qacc * Qq16).coeff j : ℝ) =
                  (D48N : ℝ) * ((accF * Q ^ 16).coeff j * ((D80N : ℝ) * (D80N : ℝ)) -
                    ((Qacc * Qq16).coeff j : ℝ)) := by rw [hDmul]; ring
              rw [this, abs_mul, abs_of_nonneg hD48R.le]
          _ ≤ (D48N : ℝ) * (E_acc * (D80N : ℝ) + S_acc / (D48N : ℝ) * 9000) :=
              mul_le_mul_of_nonneg_left hpe hD48R.le
          _ = E_acc * (D128N : ℝ) + S_acc * (D80N : ℝ) / (D80N : ℝ) * 9000 := by
              rw [hDmul]; field_simp
      -- Combine Qleft + Qdot
      have hM_sum_eq : ∑ r ∈ range (b.map Prod.fst).length, (b.map fun t => t.2.2.1).getD r 0 =
          (b.map fun t => t.2.2.1).sum := by
        rw [list_sum_eq_range (b.map fun t => t.2.2.1)]; simp
      have hE_sum_eq : ∑ r ∈ range (b.map Prod.fst).length, (b.map fun t => t.2.2.2).getD r 0 =
          (b.map fun t => t.2.2.2).sum := by
        rw [list_sum_eq_range (b.map fun t => t.2.2.2)]; simp
      rw [hM_sum_eq] at hdot_m hdot_e
      rw [hE_sum_eq] at hdot_e
      have hQsum_m : ∑ j ∈ range 251, |(Qsum.coeff j : ℝ)| ≤
          (S_acc + (b.map fun t => t.2.2.1).sum) * (D80N : ℝ) := by
        calc ∑ j ∈ range 251, |(Qsum.coeff j : ℝ)|
            ≤ ∑ j ∈ range 251, (|(Qleft.coeff j : ℝ)| + |(Qdot.coeff j : ℝ)|) :=
              sum_le_sum fun j _ => by simp only [Qsum, coeff_add, Int.cast_add]; exact abs_add_le _ _
          _ = (∑ j ∈ range 251, |(Qleft.coeff j : ℝ)|) + ∑ j ∈ range 251, |(Qdot.coeff j : ℝ)| :=
              sum_add_distrib
          _ ≤ S_acc * (D80N : ℝ) + (b.map fun t => t.2.2.1).sum * (D80N : ℝ) :=
              add_le_add hQleft_m hdot_m
          _ = (S_acc + (b.map fun t => t.2.2.1).sum) * (D80N : ℝ) := by ring
      have hQsum_safe : (S_acc + (b.map fun t => t.2.2.1).sum) * (D80N : ℝ) ≤ ((B1I / 4 : ℤ) : ℝ) := by
        have h1 : S_acc + (b.map fun t => t.2.2.1).sum ≤ (D128N : ℝ) := by linarith
        calc (S_acc + (b.map fun t => t.2.2.1).sum) * (D80N : ℝ)
            ≤ (D128N : ℝ) * (D80N : ℝ) := mul_le_mul_of_nonneg_right h1 hD80R.le
          _ ≤ (D80N : ℝ) * (D80N : ℝ) * (D48N : ℝ) + (D128N : ℝ) * (D80N : ℝ) :=
              le_add_of_nonneg_left (by positivity)
          _ ≤ ((B1I / 4 : ℤ) : ℝ) := two_D208_le_B1_div4
      let Fnext : ℝ[X] := accF * Q ^ 16 +
        ∑ r ∈ range (b.map fun t => t.2.1).length, (b.map fun t => t.2.1).getD r 0 * Q ^ r
      have hdot_e' : ∑ j ∈ range 251,
          |(∑ r ∈ range (b.map fun t => t.2.1).length, (b.map fun t => t.2.1).getD r 0 * Q ^ r).coeff j *
              ((D80N : ℝ) * (D128N : ℝ)) - (Qdot.coeff j : ℝ)| ≤
          (b.map fun t => t.2.2.2).sum * (D80N : ℝ) + (b.map fun t => t.2.2.1).sum * 9000 := by
        simpa [mul_comm (D80N : ℝ) (D128N : ℝ)] using hdot_e
      have hQsum_e : ∑ j ∈ range 251,
          |Fnext.coeff j * ((D80N : ℝ) * (D128N : ℝ)) - (Qsum.coeff j : ℝ)| ≤
          E_acc * (D128N : ℝ) + S_acc * 9000 +
          (b.map fun t => t.2.2.2).sum * (D80N : ℝ) + (b.map fun t => t.2.2.1).sum * 9000 := by
        calc ∑ j ∈ range 251, |Fnext.coeff j * ((D80N : ℝ) * (D128N : ℝ)) - (Qsum.coeff j : ℝ)|
            ≤ ∑ j ∈ range 251,
                (|(accF * Q ^ 16).coeff j * ((D80N : ℝ) * (D128N : ℝ)) - (Qleft.coeff j : ℝ)| +
                 |(∑ r ∈ range (b.map fun t => t.2.1).length,
                    (b.map fun t => t.2.1).getD r 0 * Q ^ r).coeff j * ((D80N : ℝ) * (D128N : ℝ)) -
                    (Qdot.coeff j : ℝ)|) :=
              sum_le_sum fun j _ => by
                simp only [Fnext, Qsum, coeff_add, Int.cast_add]
                have : ((accF * Q ^ 16).coeff j +
                    (∑ r ∈ range (b.map fun t => t.2.1).length,
                      (b.map fun t => t.2.1).getD r 0 * Q ^ r).coeff j) *
                      ((D80N : ℝ) * (D128N : ℝ)) -
                    ((Qleft.coeff j : ℝ) + (Qdot.coeff j : ℝ)) =
                    ((accF * Q ^ 16).coeff j * ((D80N : ℝ) * (D128N : ℝ)) - (Qleft.coeff j : ℝ)) +
                    ((∑ r ∈ range (b.map fun t => t.2.1).length,
                      (b.map fun t => t.2.1).getD r 0 * Q ^ r).coeff j *
                        ((D80N : ℝ) * (D128N : ℝ)) - (Qdot.coeff j : ℝ)) := by ring
                rw [this]; exact abs_add_le _ _
          _ = (∑ j ∈ range 251,
                |(accF * Q ^ 16).coeff j * ((D80N : ℝ) * (D128N : ℝ)) - (Qleft.coeff j : ℝ)|) +
              (∑ j ∈ range 251,
                |(∑ r ∈ range (b.map fun t => t.2.1).length,
                    (b.map fun t => t.2.1).getD r 0 * Q ^ r).coeff j *
                    ((D80N : ℝ) * (D128N : ℝ)) - (Qdot.coeff j : ℝ)|) := sum_add_distrib
          _ ≤ (E_acc * (D128N : ℝ) + S_acc * (D80N : ℝ) / (D80N : ℝ) * 9000) +
              ((b.map fun t => t.2.2.2).sum * (D80N : ℝ) + (b.map fun t => t.2.2.1).sum * 9000) :=
              add_le_add hQleft_e hdot_e'
          _ = _ := by field_simp; ring
      have hsd := kronRep_of_sd8_trunc251 (S_out := D80N) (den := D128N) D128N_pos
        hQsum_m hQsum_safe hQsum_e
      rw [hQsum_ev] at hsd
      have hacc' : kronRep D80N ((S_acc + (b.map fun t => t.2.2.1).sum) / (D48N : ℝ))
          (E_acc + 9251 + (b.map fun t => t.2.2.2).sum / (D48N : ℝ) +
            (b.map fun t => t.2.2.1).sum / (D128N : ℝ) * 9000)
          Fnext (sd8 (trunc251 (iAdd (iMul (iMul accZ q16) D48I) (dot16 (b.map Prod.fst) qows16 0))) D128N) := by
        refine hsd.mono ?_ ?_
        · rw [hDmul]; field_simp; rfl
        · have hS_rat : S_acc / (D128N : ℝ) ≤ 1 := (div_le_one hD128R).2 hS_le_D128
          have heq : (E_acc * (D128N : ℝ) + S_acc * 9000 +
              (b.map fun t => t.2.2.2).sum * (D80N : ℝ) + (b.map fun t => t.2.2.1).sum * 9000) /
              (D128N : ℝ) + 251 =
              E_acc + S_acc / (D128N : ℝ) * 9000 +
              (b.map fun t => t.2.2.2).sum / (D48N : ℝ) +
              (b.map fun t => t.2.2.1).sum / (D128N : ℝ) * 9000 + 251 := by
            rw [hDmul]; field_simp
          rw [heq]; linarith
      have hrec := ih
        (sd8 (trunc251 (iAdd (iMul (iMul accZ q16) D48I) (dot16 (b.map Prod.fst) qows16 0))) D128N)
        Fnext (S_acc + (b.map fun t => t.2.2.1).sum)
        (E_acc + 9251 + (b.map fun t => t.2.2.2).sum / (D48N : ℝ) +
          (b.map fun t => t.2.2.1).sum / (D128N : ℝ) * 9000)
        (by linarith) (by linarith)
        (fun b' hb' => hble b' (List.mem_cons_of_mem _ hb'))
        (fun b' hb' => hbp b' (List.mem_cons_of_mem _ hb'))
        hacc'
      refine hrec.mono (by simp [add_assoc]) ?_
      simp only [List.length_cons, Nat.cast_add, Nat.cast_one, List.sum_cons]
      ring_nf; linarith
  have hfinal := hstep chunks 0 0 0 0 le_rfl (by simpa using hMsum_ch) hch_blk_le hch_prop
    (by simpa using kronRep_zero D80N)
  rw [← hch_xs, ← hch_Cs, hornerPoly_chunk16RevG_zero Q Cs (by omega), hC] at hfinal
  refine hfinal.mono ?_ ?_
  · rw [zero_add, div_le_iff₀ hD48R, ← hDmul]; exact hMsum_ch
  · have hcl : (chunks.length : ℝ) ≤ 16 := by exact_mod_cast hch_cnt
    have hEdiv : (chunks.map fun b => (b.map fun t => t.2.2.2).sum).sum / (D48N : ℝ) ≤ 21168 := by
      rw [div_le_iff₀ hD48R]; exact hEsum_ch
    have hMdiv : (chunks.map fun b => (b.map fun t => t.2.2.1).sum).sum / (D128N : ℝ) ≤ 1 :=
      (div_le_one hD128R).2 hMsum_ch
    linarith

/-- Master soundness lemma for `hornerD80` on a scale-`D80` list `xs` of length `≤ 256` (`haagMu80`). -/
private lemma kronRep_hornerD80 {Q : ℝ[X]} {qows16 : List ℤ} {q16 : ℤ}
    (hQ1 : l1 Q ≤ 1)
    (hq_len : qows16.length = 16)
    (hqows : ∀ r < 16, kronRep D80N (D80N : ℝ) 9000 (Q ^ r) (qows16.getD r 0))
    (hq16 : kronRep D80N (D80N : ℝ) 9000 (Q ^ 16) q16)
    {xs : List ℤ} {Cs : List ℝ[X]} {Ms Es : List ℝ}
    (hlen256 : xs.length ≤ 256)
    (hC : Cs.length = xs.length) (hM : Ms.length = xs.length) (hE : Es.length = xs.length)
    (hrep : ∀ k < xs.length, kronRep D80N (Ms.getD k 0) (Es.getD k 0) (Cs.getD k 0) (xs.getD k 0))
    (hM0 : ∀ k < xs.length, 0 ≤ Ms.getD k 0)
    (hMtot : ∑ k ∈ range xs.length, Ms.getD k 0 ≤ (D80N : ℝ))
    (hEtot : ∑ k ∈ range xs.length, Es.getD k 0 ≤ 800000) :
    kronRep D80N (D80N : ℝ) 1000000
      (∑ k ∈ range xs.length, Cs.getD k 0 * Q ^ k)
      (hornerD80 qows16 q16 (chunk16Rev 16 xs []) 0) := by
  let zip4 : List (ℤ × ℝ[X] × ℝ × ℝ) :=
    (List.range xs.length).map fun k => (xs.getD k 0, Cs.getD k 0, Ms.getD k 0, Es.getD k 0)
  have hzip_len : zip4.length = xs.length := by simp [zip4]
  have hzip_xs : zip4.map Prod.fst = xs := by
    refine List.ext_getElem (by simp [zip4]) fun i hi hix => ?_
    simp [zip4, List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hix]
  have hzip_Cs : zip4.map (fun t => t.2.1) = Cs := by
    refine List.ext_getElem (by simp [zip4, hC]) fun i hi hiC => ?_
    simp [zip4, List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hiC]
  have hzip_Ms : zip4.map (fun t => t.2.2.1) = Ms := by
    refine List.ext_getElem (by simp [zip4, hM]) fun i hi hiM => ?_
    simp [zip4, List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hiM]
  have hzip_Es : zip4.map (fun t => t.2.2.2) = Es := by
    refine List.ext_getElem (by simp [zip4, hE]) fun i hi hiE => ?_
    simp [zip4, List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hiE]
  set chunks := chunk16RevG 16 zip4 []
  have hch_xs : chunk16Rev 16 xs [] = chunks.map (List.map Prod.fst) := by
    rw [chunk16Rev_eq, ← hzip_xs, chunk16RevG_map]; rfl
  have hch_Cs : chunk16RevG 16 Cs [] = chunks.map (List.map fun t => t.2.1) := by
    rw [← hzip_Cs, chunk16RevG_map]; rfl
  have hch_len_all := chunk16RevG_len_le 16 zip4 [] (by simp)
  have hch_cnt : chunks.length ≤ 16 := by simpa using hch_len_all.1
  have hch_blk_le : ∀ b ∈ chunks, b.length ≤ 16 := hch_len_all.2
  have hch_prop : ∀ b ∈ chunks, ∀ t ∈ b,
      kronRep D80N t.2.2.1 t.2.2.2 t.2.1 t.1 ∧ 0 ≤ t.2.2.1 := by
    have hmem_zip : ∀ b ∈ chunks, ∀ t ∈ b, t ∈ zip4 := by
      have hgen : ∀ (n : ℕ) (zs : List (ℤ × ℝ[X] × ℝ × ℝ)) (acc : List (List (ℤ × ℝ[X] × ℝ × ℝ))),
          (∀ b ∈ acc, ∀ t ∈ b, t ∈ zip4) → (∀ t ∈ zs, t ∈ zip4) →
          ∀ b ∈ chunk16RevG n zs acc, ∀ t ∈ b, t ∈ zip4 := by
        intro n
        induction n with
        | zero => intro zs acc hacc _ b hb; exact hacc b hb
        | succ n ih =>
          intro zs acc hacc hzs
          cases zs with
          | nil => exact hacc
          | cons z zs =>
            simp only [chunk16RevG]
            obtain ⟨h1, h2⟩ := split16G_spec 16 (z :: zs) []
            simp only [List.reverse_nil, List.nil_append] at h1
            rw [h1, h2]
            refine ih _ _ (fun b hb t ht => ?_) (fun t ht => hzs t (List.mem_of_mem_drop ht))
            rcases List.mem_cons.1 hb with rfl | hb'
            · exact hzs t (List.mem_of_mem_take ht)
            · exact hacc b hb' t ht
      exact hgen 16 zip4 [] (by simp) (fun _ h => h)
    intro b hb t ht
    have htz := hmem_zip b hb t ht
    rcases List.mem_map.1 htz with ⟨k, hk, rfl⟩
    have hk' : k < xs.length := List.mem_range.1 hk
    exact ⟨hrep k hk', hM0 k hk'⟩
  have hMsum_ch : (chunks.map fun b => (b.map fun t => t.2.2.1).sum).sum ≤ (D80N : ℝ) := by
    rw [chunk16RevG_sum_eq (fun t => t.2.2.1) 16 zip4 [] (by omega)]
    simp only [List.map_nil, List.sum_nil, add_zero]
    rw [hzip_Ms, list_sum_eq_range Ms, hM]; exact hMtot
  have hEsum_ch : (chunks.map fun b => (b.map fun t => t.2.2.2).sum).sum ≤ 800000 := by
    rw [chunk16RevG_sum_eq (fun t => t.2.2.2) 16 zip4 [] (by omega)]
    simp only [List.map_nil, List.sum_nil, add_zero]
    rw [hzip_Es, list_sum_eq_range Es, hE]; exact hEtot
  have hQ16_1 : l1 (Q ^ 16) ≤ 1 := (l1_pow_le Q 16).trans (pow_le_one₀ (l1_nonneg Q) hQ1)
  have hD80R : (0 : ℝ) < (D80N : ℝ) := by exact_mod_cast D80N_pos
  have hstep : ∀ (cs : List (List (ℤ × ℝ[X] × ℝ × ℝ))) (accZ : ℤ) (accF : ℝ[X]) (S_acc E_acc : ℝ),
      0 ≤ S_acc →
      S_acc + (cs.map fun b => (b.map fun t => t.2.2.1).sum).sum ≤ (D80N : ℝ) →
      (∀ b ∈ cs, b.length ≤ 16) →
      (∀ b ∈ cs, ∀ t ∈ b, kronRep D80N t.2.2.1 t.2.2.2 t.2.1 t.1 ∧ 0 ≤ t.2.2.1) →
      kronRep D80N S_acc E_acc accF accZ →
      kronRep D80N (S_acc + (cs.map fun b => (b.map fun t => t.2.2.1).sum).sum)
        (E_acc + (cs.length : ℝ) * 9251 +
          (cs.map fun b => (b.map fun t => t.2.2.2).sum).sum +
          (cs.map fun b => (b.map fun t => t.2.2.1).sum).sum / (D80N : ℝ) * 9000)
        (hornerPoly Q (cs.map (List.map fun t => t.2.1)) accF)
        (hornerD80 qows16 q16 (cs.map (List.map Prod.fst)) accZ) := by
    intro cs
    induction cs with
    | nil =>
      intro accZ accF S_acc E_acc _ _ _ _ hacc
      simpa [hornerPoly, hornerD80] using hacc
    | cons b rest ih =>
      intro accZ accF S_acc E_acc hS0 hStot hble hbp hacc
      simp only [List.map_cons, hornerPoly, hornerD80]
      have hb_le : b.length ≤ 16 := hble b (List.mem_cons_self)
      have hbm_nonneg : ∀ r < b.length, 0 ≤ (b.map fun t => t.2.2.1).getD r 0 := fun r hr => by
        rw [List.getD_eq_getElem?_getD, List.getElem?_map, List.getElem?_eq_getElem hr]
        exact (hbp b (List.mem_cons_self) b[r] (List.getElem_mem hr)).2
      have hb_Msum : 0 ≤ (b.map fun t => t.2.2.1).sum :=
        List.sum_nonneg fun x hx => by
          rcases List.mem_map.1 hx with ⟨t, ht, rfl⟩
          exact (hbp b (List.mem_cons_self) t ht).2
      have hrest_Msum : 0 ≤ (rest.map fun b' => (b'.map fun t => t.2.2.1).sum).sum :=
        List.sum_nonneg fun x hx => by
          rcases List.mem_map.1 hx with ⟨b', hb', rfl⟩
          exact List.sum_nonneg fun y hy => by
            rcases List.mem_map.1 hy with ⟨t, ht, rfl⟩
            exact (hbp b' (List.mem_cons_of_mem _ hb') t ht).2
      simp only [List.map_cons, List.sum_cons] at hStot
      have hS_le_D80 : S_acc ≤ (D80N : ℝ) := by linarith
      obtain ⟨Qdot, hdot_ev, hdot_m, hdot_e⟩ := dot16_kronRep (S_blk := D80N) hQ1
        (qows := qows16) (fun r hr => hqows r (by omega))
        (blk := b.map Prod.fst) (Cs := b.map fun t => t.2.1)
        (Ms := b.map fun t => t.2.2.1) (Es := b.map fun t => t.2.2.2)
        (by simp [hq_len]; exact hb_le) (by simp) (by simp) (by simp)
        (fun r hr => by
          have hr' : r < b.length := by simpa using hr
          simp only [List.getD_eq_getElem?_getD, List.getElem?_map, List.getElem?_eq_getElem hr']
          exact (hbp b (List.mem_cons_self) b[r] (List.getElem_mem hr')).1)
        (fun r hr => by simpa using hbm_nonneg r (by simpa using hr))
      obtain ⟨Qacc, _, hacc_ev, hacc_m, hacc_e⟩ := hacc
      obtain ⟨Qq16, _, hq16_ev, hq16_m, hq16_e⟩ := hq16
      obtain ⟨hpm, hpe⟩ := mul_prod_kron_bounds hQ16_1 hacc_m hq16_m hacc_e hq16_e
      let Qleft : ℤ[X] := Qacc * Qq16
      let Qsum : ℤ[X] := Qleft + Qdot
      have hQsum_ev : Qsum.eval B1I =
          iAdd (iMul accZ q16) (dot16 (b.map Prod.fst) qows16 0) := by
        rw [iAdd_eq, iMul_eq]
        simp only [Qsum, Qleft, eval_add, eval_mul, hacc_ev, hq16_ev, hdot_ev]
      have hM_sum_eq : ∑ r ∈ range (b.map Prod.fst).length, (b.map fun t => t.2.2.1).getD r 0 =
          (b.map fun t => t.2.2.1).sum := by
        rw [list_sum_eq_range (b.map fun t => t.2.2.1)]; simp
      have hE_sum_eq : ∑ r ∈ range (b.map Prod.fst).length, (b.map fun t => t.2.2.2).getD r 0 =
          (b.map fun t => t.2.2.2).sum := by
        rw [list_sum_eq_range (b.map fun t => t.2.2.2)]; simp
      rw [hM_sum_eq] at hdot_m hdot_e
      rw [hE_sum_eq] at hdot_e
      have hQsum_m : ∑ j ∈ range 251, |(Qsum.coeff j : ℝ)| ≤
          (S_acc + (b.map fun t => t.2.2.1).sum) * (D80N : ℝ) := by
        calc ∑ j ∈ range 251, |(Qsum.coeff j : ℝ)|
            ≤ ∑ j ∈ range 251, (|(Qleft.coeff j : ℝ)| + |(Qdot.coeff j : ℝ)|) :=
              sum_le_sum fun j _ => by simp only [Qsum, coeff_add, Int.cast_add]; exact abs_add_le _ _
          _ = (∑ j ∈ range 251, |(Qleft.coeff j : ℝ)|) + ∑ j ∈ range 251, |(Qdot.coeff j : ℝ)| :=
              sum_add_distrib
          _ ≤ S_acc * (D80N : ℝ) + (b.map fun t => t.2.2.1).sum * (D80N : ℝ) :=
              add_le_add hpm hdot_m
          _ = (S_acc + (b.map fun t => t.2.2.1).sum) * (D80N : ℝ) := by ring
      have hQsum_safe : (S_acc + (b.map fun t => t.2.2.1).sum) * (D80N : ℝ) ≤ ((B1I / 4 : ℤ) : ℝ) := by
        have h1 : S_acc + (b.map fun t => t.2.2.1).sum ≤ (D80N : ℝ) := by linarith
        exact (mul_le_mul_of_nonneg_right h1 hD80R.le).trans D80_sq_le_B1_div4
      let Fnext : ℝ[X] := accF * Q ^ 16 +
        ∑ r ∈ range (b.map fun t => t.2.1).length, (b.map fun t => t.2.1).getD r 0 * Q ^ r
      have hQsum_e : ∑ j ∈ range 251,
          |Fnext.coeff j * ((D80N : ℝ) * (D80N : ℝ)) - (Qsum.coeff j : ℝ)| ≤
          E_acc * (D80N : ℝ) + S_acc * 9000 +
          (b.map fun t => t.2.2.2).sum * (D80N : ℝ) + (b.map fun t => t.2.2.1).sum * 9000 := by
        calc ∑ j ∈ range 251, |Fnext.coeff j * ((D80N : ℝ) * (D80N : ℝ)) - (Qsum.coeff j : ℝ)|
            ≤ ∑ j ∈ range 251,
                (|(accF * Q ^ 16).coeff j * ((D80N : ℝ) * (D80N : ℝ)) - (Qleft.coeff j : ℝ)| +
                 |(∑ r ∈ range (b.map fun t => t.2.1).length,
                    (b.map fun t => t.2.1).getD r 0 * Q ^ r).coeff j * ((D80N : ℝ) * (D80N : ℝ)) -
                    (Qdot.coeff j : ℝ)|) :=
              sum_le_sum fun j _ => by
                simp only [Fnext, Qsum, coeff_add, Int.cast_add]
                have : ((accF * Q ^ 16).coeff j +
                    (∑ r ∈ range (b.map fun t => t.2.1).length,
                      (b.map fun t => t.2.1).getD r 0 * Q ^ r).coeff j) *
                      ((D80N : ℝ) * (D80N : ℝ)) -
                    ((Qleft.coeff j : ℝ) + (Qdot.coeff j : ℝ)) =
                    ((accF * Q ^ 16).coeff j * ((D80N : ℝ) * (D80N : ℝ)) - (Qleft.coeff j : ℝ)) +
                    ((∑ r ∈ range (b.map fun t => t.2.1).length,
                      (b.map fun t => t.2.1).getD r 0 * Q ^ r).coeff j *
                        ((D80N : ℝ) * (D80N : ℝ)) - (Qdot.coeff j : ℝ)) := by ring
                rw [this]; exact abs_add_le _ _
          _ = (∑ j ∈ range 251,
                |(accF * Q ^ 16).coeff j * ((D80N : ℝ) * (D80N : ℝ)) - (Qleft.coeff j : ℝ)|) +
              (∑ j ∈ range 251,
                |(∑ r ∈ range (b.map fun t => t.2.1).length,
                    (b.map fun t => t.2.1).getD r 0 * Q ^ r).coeff j *
                    ((D80N : ℝ) * (D80N : ℝ)) - (Qdot.coeff j : ℝ)|) := sum_add_distrib
          _ ≤ (E_acc * (D80N : ℝ) + S_acc * 9000) +
              ((b.map fun t => t.2.2.2).sum * (D80N : ℝ) + (b.map fun t => t.2.2.1).sum * 9000) :=
              add_le_add hpe (by simpa using hdot_e)
          _ = _ := by ring
      have hsd := kronRep_of_sd8_trunc251 (S_out := D80N) (den := D80N) D80N_pos
        hQsum_m hQsum_safe hQsum_e
      rw [hQsum_ev] at hsd
      have hacc' : kronRep D80N (S_acc + (b.map fun t => t.2.2.1).sum)
          (E_acc + 9251 + (b.map fun t => t.2.2.2).sum +
            (b.map fun t => t.2.2.1).sum / (D80N : ℝ) * 9000)
          Fnext (sd8 (trunc251 (iAdd (iMul accZ q16) (dot16 (b.map Prod.fst) qows16 0))) D80N) := by
        refine hsd.mono (by field_simp; rfl) ?_
        have hS_rat : S_acc / (D80N : ℝ) ≤ 1 := (div_le_one hD80R).2 hS_le_D80
        have heq : (E_acc * (D80N : ℝ) + S_acc * 9000 +
            (b.map fun t => t.2.2.2).sum * (D80N : ℝ) + (b.map fun t => t.2.2.1).sum * 9000) /
            (D80N : ℝ) + 251 =
            E_acc + S_acc / (D80N : ℝ) * 9000 +
            (b.map fun t => t.2.2.2).sum +
            (b.map fun t => t.2.2.1).sum / (D80N : ℝ) * 9000 + 251 := by field_simp
        rw [heq]; linarith
      have hrec := ih
        (sd8 (trunc251 (iAdd (iMul accZ q16) (dot16 (b.map Prod.fst) qows16 0))) D80N)
        Fnext (S_acc + (b.map fun t => t.2.2.1).sum)
        (E_acc + 9251 + (b.map fun t => t.2.2.2).sum +
          (b.map fun t => t.2.2.1).sum / (D80N : ℝ) * 9000)
        (by linarith) (by linarith)
        (fun b' hb' => hble b' (List.mem_cons_of_mem _ hb'))
        (fun b' hb' => hbp b' (List.mem_cons_of_mem _ hb'))
        hacc'
      refine hrec.mono (by simp [add_assoc]) ?_
      simp only [List.length_cons, Nat.cast_add, Nat.cast_one, List.sum_cons]
      ring_nf; linarith
  have hfinal := hstep chunks 0 0 0 0 le_rfl (by simpa using hMsum_ch) hch_blk_le hch_prop
    (by simpa using kronRep_zero D80N)
  rw [← hch_xs, ← hch_Cs, hornerPoly_chunk16RevG_zero Q Cs (by omega), hC] at hfinal
  refine hfinal.mono (by linarith) ?_
  have hcl : (chunks.length : ℝ) ≤ 16 := by exact_mod_cast hch_cnt
  have hMdiv : (chunks.map fun b => (b.map fun t => t.2.2.1).sum).sum / (D80N : ℝ) ≤ 1 :=
    (div_le_one hD80R).2 hMsum_ch
  linarith

/-! ### 5. Soundness of `encPolyAux`, `haagMu80`, `tigMu128Acc`, and `packRowsNat` -/

/-- Exact real polynomial represented by a sparse `(degree, numerator)` list with denominator `den`. -/
def sparsePoly (l : List (Nat × Int)) (den : ℕ) : ℝ[X] :=
  (l.map fun p => Polynomial.monomial p.1 ((p.2 : ℝ) / (den : ℝ))).sum

private lemma kronRep_encPolyAux {l : List (Nat × Int)} {den : ℕ}
    (hok : checkSparse l den = true) :
    l1 (sparsePoly l den) ≤ 1 ∧
    kronRep D80N (D80N : ℝ) 16 (sparsePoly l den) (encPolyAux l den 0) := by
  unfold checkSparse at hok
  rw [Bool.and_eq_true, nat_ble_iff] at hok
  obtain ⟨hden1, hgo⟩ := hok
  have hden0 : 0 < den := by omega
  have hdenR : (0 : ℝ) < (den : ℝ) := by exact_mod_cast hden0
  suffices hgen : ∀ (minD maxLen : ℕ) (ls : List (Nat × Int)) (tot : ℕ)
      (accZ : ℤ) (accF : ℝ[X]) (Macc Eacc : ℝ),
      checkSparseGo minD maxLen ls den tot = true →
      kronRep D80N Macc Eacc accF accZ →
      l1 (sparsePoly ls den) ≤ ((den - tot : ℕ) : ℝ) / (den : ℝ) ∧
      kronRep D80N (Macc + ((den - tot : ℕ) : ℝ) / (den : ℝ) * (D80N : ℝ))
        (Eacc + (maxLen : ℝ)) (accF + sparsePoly ls den) (encPolyAux ls den accZ) by
    obtain ⟨hl1, hrep⟩ := hgen 0 16 l 0 0 0 0 0 hgo (kronRep_zero D80N)
    rw [Nat.sub_zero, div_self hdenR.ne'] at hl1 hrep
    rw [one_mul, zero_add, zero_add, zero_add] at hrep
    exact ⟨hl1, hrep⟩
  intro minD maxLen ls
  induction ls generalizing minD maxLen with
  | nil =>
    intro tot accZ accF Macc Eacc hok' hacc
    unfold checkSparseGo at hok'
    have hle : tot ≤ den := nat_ble_iff.1 hok'
    refine ⟨by simp [sparsePoly]; positivity, ?_⟩
    simpa [sparsePoly, encPolyAux] using hacc.mono (by linarith [show 0 ≤ ((den - tot : ℕ) : ℝ) / (den : ℝ) * (D80N : ℝ) by positivity])
      (by linarith [show (0 : ℝ) ≤ (maxLen : ℝ) by positivity])
  | cons p rest ih =>
    intro tot accZ accF Macc Eacc hok' hacc
    rcases p with ⟨d, c⟩
    cases maxLen with
    | zero => simp [checkSparseGo] at hok'
    | succ k =>
      simp only [checkSparseGo] at hok'
      split_ifs at hok' with hcond
      rw [Bool.and_eq_true, nat_ble_iff, nat_ble_iff, nat_add_eq] at hcond
      have hd251 : d < 251 := by omega
      set cd : ℤ := tdivNat (iMul c D80I) den
      have hcd_m : |(cd : ℝ)| ≤ (iNatAbs c : ℝ) / (den : ℝ) * (D80N : ℝ) := by
        have h1 := tdivNat_abs_le (iMul c D80I) hden0
        change |(cd : ℝ)| ≤ |(iMul c D80I : ℝ)| / (den : ℝ) at h1
        rw [iMul_eq, Int.cast_mul, abs_mul, show (D80I : ℝ) = (D80N : ℝ) from rfl,
          abs_of_nonneg (Nat.cast_nonneg (α := ℝ) D80N), ← iNatAbs_cast_R c] at h1
        linarith [show (iNatAbs c : ℝ) * (D80N : ℝ) / (den : ℝ) = (iNatAbs c : ℝ) / (den : ℝ) * (D80N : ℝ) by ring]
      have hcd_e : |((c : ℝ) / (den : ℝ)) * (D80N : ℝ) - (cd : ℝ)| ≤ 1 := by
        have h1 := tdivNat_err (iMul c D80I) hden0
        change |(iMul c D80I : ℝ) / (den : ℝ) - (cd : ℝ)| ≤ 1 at h1
        rw [iMul_eq, Int.cast_mul, show (D80I : ℝ) = (D80N : ℝ) from rfl] at h1
        simpa [mul_div_right_comm] using h1
      have hmono : kronRep D80N ((iNatAbs c : ℝ) / (den : ℝ) * (D80N : ℝ)) 1
          (Polynomial.monomial d ((c : ℝ) / (den : ℝ)))
          (iMul cd (Int.ofNat (Nat.pow B1N d))) := by
        refine ⟨Polynomial.monomial d cd,
          fun j hj => by rw [coeff_monomial, ite_eq_right (by omega)],
          by rw [iMul_eq, eval_monomial]; unfold B1I; rfl, ?_, ?_⟩
        · rw [sum_eq_single d (fun b _ hbd => by rw [coeff_monomial, ite_eq_right hbd.symm]; simp)
            (fun h => absurd (mem_range.2 hd251) h)]
          rw [coeff_monomial, ite_eq_left rfl]; exact hcd_m
        · rw [sum_eq_single d (fun b _ hbd => by rw [coeff_monomial, coeff_monomial, ite_eq_right hbd.symm, ite_eq_right hbd.symm]; simp)
            (fun h => absurd (mem_range.2 hd251) h)]
          rw [coeff_monomial, coeff_monomial, ite_eq_left rfl, ite_eq_left rfl]; exact hcd_e
      have hacc' := kronRep_add hacc hmono
      obtain ⟨hl1_rest, hrep_rest⟩ := ih (d + 1) k (tot + iNatAbs c)
        (iAdd accZ (iMul cd (Int.ofNat (Nat.pow B1N d))))
        (accF + Polynomial.monomial d ((c : ℝ) / (den : ℝ)))
        (Macc + (iNatAbs c : ℝ) / (den : ℝ) * (D80N : ℝ))
        (Eacc + 1) hok' hacc'
      have htot_le : tot + iNatAbs c ≤ den := by
        have hgo_le : ∀ (mD mL : ℕ) (ls' : List (Nat × Int)) (t : ℕ),
            checkSparseGo mD mL ls' den t = true → t ≤ den := by
          intro mD mL ls'
          induction ls' generalizing mD mL with
          | nil => intro t ht; simp only [checkSparseGo] at ht; exact nat_ble_iff.1 ht
          | cons q qs ihq =>
            intro t ht
            cases mL with
            | zero => simp [checkSparseGo] at ht
            | succ k' =>
              simp only [checkSparseGo] at ht
              split_ifs at ht
              exact le_trans (Nat.le_add_right _ _) (ihq _ _ _ ht)
        exact hgo_le _ _ _ _ hok'
      have hsub_split : ((den - tot : ℕ) : ℝ) = (iNatAbs c : ℝ) + ((den - (tot + iNatAbs c) : ℕ) : ℝ) := by
        exact_mod_cast (show den - tot = iNatAbs c + (den - (tot + iNatAbs c)) by omega)
      have hl1_mono : l1 (Polynomial.monomial d ((c : ℝ) / (den : ℝ))) ≤ (iNatAbs c : ℝ) / (den : ℝ) := by
        unfold l1
        by_cases hc0 : (c : ℝ) / (den : ℝ) = 0
        · rw [hc0, map_zero, Polynomial.sum_zero_index]; positivity
        · rw [Polynomial.sum_def, Polynomial.support_monomial d hc0, Finset.sum_singleton,
            coeff_monomial, ite_eq_left rfl, abs_div, abs_of_pos hdenR, ← iNatAbs_cast_R]
      have hsp_cons : sparsePoly ((d, c) :: rest) den =
          Polynomial.monomial d ((c : ℝ) / (den : ℝ)) + sparsePoly rest den := by
        simp [sparsePoly]
      constructor
      · rw [hsp_cons]
        calc l1 (Polynomial.monomial d ((c : ℝ) / (den : ℝ)) + sparsePoly rest den)
            ≤ l1 (Polynomial.monomial d ((c : ℝ) / (den : ℝ))) + l1 (sparsePoly rest den) :=
              l1_add_le _ _
          _ ≤ (iNatAbs c : ℝ) / (den : ℝ) + ((den - (tot + iNatAbs c) : ℕ) : ℝ) / (den : ℝ) :=
              add_le_add hl1_mono hl1_rest
          _ = ((den - tot : ℕ) : ℝ) / (den : ℝ) := by rw [hsub_split, add_div]
      · rw [hsp_cons]
        simp only [encPolyAux]
        have hF : accF + (Polynomial.monomial d ((c : ℝ) / (den : ℝ)) + sparsePoly rest den) =
            (accF + Polynomial.monomial d ((c : ℝ) / (den : ℝ))) + sparsePoly rest den := by ring
        rw [hF]
        refine hrep_rest.mono ?_ ?_
        · rw [hsub_split]; ring_nf; linarith
        · push_cast; linarith

/-! #### Haagerup phase moments `haagMu80` -/

private lemma abs_piQuarter80 :
    |(Real.pi / 4) * (D80N : ℝ) - (piQuarter80 : ℝ)| ≤ 3025 := by
  have hlo : (314159265358979323846 : ℝ) / (4 * 10 ^ 20) ≤ Real.pi / 4 := by
    have := Real.pi_gt_d20; linarith
  have hhi : Real.pi / 4 ≤ (314159265358979323847 : ℝ) / (4 * 10 ^ 20) := by
    have := Real.pi_lt_d20; linarith
  have hden : 0 < Nat.mul 4 (Nat.pow 10 20) := by
    change 0 < 4 * 10 ^ 20; positivity
  have htd := tdivNat_err (iMul 314159265358979323846 D80I) hden
  have htd' : |(314159265358979323846 : ℝ) / (4 * 10 ^ 20) * (D80N : ℝ) - (piQuarter80 : ℝ)| ≤ 1 := by
    change |((iMul 314159265358979323846 D80I : ℤ) : ℝ) / ((Nat.mul 4 (Nat.pow 10 20) : ℕ) : ℝ) -
      (piQuarter80 : ℝ)| ≤ 1 at htd
    rw [iMul_eq, Int.cast_mul, show (D80I : ℝ) = (D80N : ℝ) from rfl] at htd
    have hcast : ((Nat.mul 4 (Nat.pow 10 20) : ℕ) : ℝ) = 4 * 10 ^ 20 := by
      change ((4 * 10 ^ 20 : ℕ) : ℝ) = 4 * 10 ^ 20; norm_num
    rw [hcast] at htd
    simpa [mul_div_right_comm] using htd
  have hdiff : |(Real.pi / 4) * (D80N : ℝ) - (314159265358979323846 : ℝ) / (4 * 10 ^ 20) * (D80N : ℝ)| ≤ 3024 := by
    have hD80 : (D80N : ℝ) = 2 ^ 80 := by rw [D80N_eq]; norm_num
    rw [abs_le]; constructor <;> (rw [hD80]; linarith)
  calc |(Real.pi / 4) * (D80N : ℝ) - (piQuarter80 : ℝ)|
      ≤ |(Real.pi / 4) * (D80N : ℝ) - (314159265358979323846 : ℝ) / (4 * 10 ^ 20) * (D80N : ℝ)| +
        |(314159265358979323846 : ℝ) / (4 * 10 ^ 20) * (D80N : ℝ) - (piQuarter80 : ℝ)| :=
        abs_sub_le _ _ _
    _ ≤ 3024 + 1 := add_le_add hdiff htd'
    _ = 3025 := by norm_num

private lemma haagMu80_spec :
    haagMu80.length = 251 ∧
    ∀ k < 251, 0 ≤ haagMu80.getD k 0 ∧
      |haagCoeff k * (D80N : ℝ) - (haagMu80.getD k 0 : ℝ)| ≤ 3025 + (k : ℝ) := by
  have hgo : ∀ (rem k : ℕ) (cur : ℤ) (acc : List ℤ),
      acc.length = k →
      0 ≤ cur →
      |haagCoeff k * (D80N : ℝ) - (cur : ℝ)| ≤ 3025 + (k : ℝ) →
      (∀ i < k, 0 ≤ acc.reverse.getD i 0 ∧
        |haagCoeff i * (D80N : ℝ) - (acc.reverse.getD i 0 : ℝ)| ≤ 3025 + (i : ℝ)) →
      (haagMu80Go rem k cur acc).length = k + rem ∧
      ∀ i < k + rem, 0 ≤ (haagMu80Go rem k cur acc).getD i 0 ∧
        |haagCoeff i * (D80N : ℝ) - ((haagMu80Go rem k cur acc).getD i 0 : ℝ)| ≤ 3025 + (i : ℝ) := by
    intro rem
    induction rem with
    | zero =>
      intro k cur acc hlen _ _ hacc
      simp only [haagMu80Go, revL_eq, List.append_nil, List.length_reverse, add_zero]
      exact ⟨hlen, hacc⟩
    | succ rem ih =>
      intro k cur acc hlen hcur0 hcur_err hacc
      unfold haagMu80Go
      dsimp only
      set oddN : ℕ := Nat.add (Nat.mul 2 k) 1
      set numI : ℤ := Int.ofNat (Nat.mul oddN oddN)
      set denN : ℕ := Nat.mul (Nat.mul 4 (Nat.add k 1)) (Nat.add k 2)
      set nextCur : ℤ := tdivNat (iMul numI cur) denN
      have hodd_eq : oddN = 2 * k + 1 := rfl
      have hden_eq : denN = 4 * (k + 1) * (k + 2) := rfl
      have hden_pos : 0 < denN := by rw [hden_eq]; positivity
      have hdenR : (0 : ℝ) < (denN : ℝ) := by exact_mod_cast hden_pos
      have hnum0 : (0 : ℤ) ≤ numI := Int.natCast_nonneg _
      have hnext0 : 0 ≤ nextCur := tdivNat_nonneg (by rw [iMul_eq]; exact mul_nonneg hnum0 hcur0) _
      have hratio_le : ((oddN * oddN : ℕ) : ℝ) / (denN : ℝ) ≤ 1 := by
        rw [div_le_one hdenR]
        have : oddN * oddN ≤ denN := by rw [hodd_eq, hden_eq]; nlinarith
        exact_mod_cast this
      have hhaag_step : haagCoeff (k + 1) = haagCoeff k * (((oddN * oddN : ℕ) : ℝ) / (denN : ℝ)) := by
        simp only [haagCoeff, haagR, Rat.cast_div, Rat.cast_mul, Rat.cast_natCast]
        rw [hodd_eq, hden_eq]
        push_cast; ring
      have hnext_err : |haagCoeff (k + 1) * (D80N : ℝ) - (nextCur : ℝ)| ≤ 3025 + ((k + 1 : ℕ) : ℝ) := by
        have htd := tdivNat_err (iMul numI cur) hden_pos
        change |((iMul numI cur : ℤ) : ℝ) / (denN : ℝ) - (nextCur : ℝ)| ≤ 1 at htd
        rw [iMul_eq, Int.cast_mul] at htd
        have hnumR : (numI : ℝ) = ((oddN * oddN : ℕ) : ℝ) := rfl
        rw [hnumR] at htd
        have htri : |haagCoeff (k + 1) * (D80N : ℝ) - (nextCur : ℝ)| ≤
            |haagCoeff (k + 1) * (D80N : ℝ) - ((oddN * oddN : ℕ) : ℝ) * (cur : ℝ) / (denN : ℝ)| +
            |((oddN * oddN : ℕ) : ℝ) * (cur : ℝ) / (denN : ℝ) - (nextCur : ℝ)| :=
          abs_sub_le _ _ _
        have h1 : |haagCoeff (k + 1) * (D80N : ℝ) - ((oddN * oddN : ℕ) : ℝ) * (cur : ℝ) / (denN : ℝ)| =
            (((oddN * oddN : ℕ) : ℝ) / (denN : ℝ)) * |haagCoeff k * (D80N : ℝ) - (cur : ℝ)| := by
          rw [hhaag_step]
          have : haagCoeff k * (((oddN * oddN : ℕ) : ℝ) / (denN : ℝ)) * (D80N : ℝ) -
              ((oddN * oddN : ℕ) : ℝ) * (cur : ℝ) / (denN : ℝ) =
              (((oddN * oddN : ℕ) : ℝ) / (denN : ℝ)) * (haagCoeff k * (D80N : ℝ) - (cur : ℝ)) := by ring
          rw [this, abs_mul, abs_of_nonneg (by positivity)]
        have h2 : (((oddN * oddN : ℕ) : ℝ) / (denN : ℝ)) * |haagCoeff k * (D80N : ℝ) - (cur : ℝ)| ≤
            3025 + (k : ℝ) := by
          calc (((oddN * oddN : ℕ) : ℝ) / (denN : ℝ)) * |haagCoeff k * (D80N : ℝ) - (cur : ℝ)|
              ≤ 1 * |haagCoeff k * (D80N : ℝ) - (cur : ℝ)| :=
                mul_le_mul_of_nonneg_right hratio_le (abs_nonneg _)
            _ = |haagCoeff k * (D80N : ℝ) - (cur : ℝ)| := one_mul _
            _ ≤ 3025 + (k : ℝ) := hcur_err
        push_cast; linarith
      have hacc' : ∀ i < k + 1, 0 ≤ (cur :: acc).reverse.getD i 0 ∧
          |haagCoeff i * (D80N : ℝ) - ((cur :: acc).reverse.getD i 0 : ℝ)| ≤ 3025 + (i : ℝ) := by
        intro i hi
        rw [List.reverse_cons]
        by_cases hlt : i < k
        · have hget : (acc.reverse ++ [cur]).getD i 0 = acc.reverse.getD i 0 := by
            simp only [List.getD_eq_getElem?_getD]
            rw [List.getElem?_append_left (by simp [hlen]; exact hlt)]
          rw [hget]; exact hacc i hlt
        · have heq : i = k := by omega
          subst heq
          have hget : (acc.reverse ++ [cur]).getD i 0 = cur := by
            simp only [List.getD_eq_getElem?_getD]
            rw [List.getElem?_append_right (by simp [hlen])]
            simp [hlen]
          rw [hget]; exact ⟨hcur0, hcur_err⟩
      obtain ⟨hL, hP⟩ := ih (k + 1) nextCur (cur :: acc) (by simp [hlen]) hnext0 hnext_err hacc'
      rw [show k + 1 + rem = k + (rem + 1) by omega] at hL hP
      exact ⟨hL, hP⟩
  have hpi0 : 0 ≤ piQuarter80 := by
    unfold piQuarter80
    exact tdivNat_nonneg (by rw [iMul_eq]; exact mul_nonneg (by norm_num) (Int.natCast_nonneg _)) _
  have hpi_err : |haagCoeff 0 * (D80N : ℝ) - (piQuarter80 : ℝ)| ≤ 3025 + ((0 : ℕ) : ℝ) := by
    simpa [haagCoeff, haagR] using abs_piQuarter80
  simpa [haagMu80] using hgo 251 0 piQuarter80 [] rfl hpi0 hpi_err (fun _ h => absurd h (Nat.not_lt_zero _))

attribute [local irreducible] haagMu80

private lemma sumNatAbs_eq (xs : List ℤ) (acc : ℕ) :
    (sumNatAbs xs acc : ℝ) = (acc : ℝ) + ∑ k ∈ range xs.length, |(xs.getD k 0 : ℝ)| := by
  induction xs generalizing acc with
  | nil => simp [sumNatAbs]
  | cons x xs ih =>
    rw [sumNatAbs, ih, List.length_cons, Finset.sum_range_succ', nat_add_eq, Nat.cast_add,
      iNatAbs_cast_R]
    simp only [List.getD_cons_zero, List.getD_cons_succ]
    ring

/-! #### 1D `tigMuList` extraction -/

private lemma tigMu128Acc_eq (xs : List Ival) (acc : List ℤ) :
    tigMu128Acc xs acc = acc.reverse ++ xs.map Ival.lo := by
  induction xs generalizing acc with
  | nil => simp [tigMu128Acc, revL_eq]
  | cons x xs ih => simp [tigMu128Acc, ih, List.append_assoc]

private lemma checkTigMu_spec {n : ℕ} {xs : List Ival} {tot : ℕ}
    (hok : checkTigMu n xs tot = true) :
    xs.length = n ∧
    (∀ k < n, |(xs.getD k zeroI).lo| ≤ D128N ∧ (xs.getD k zeroI).hi - (xs.getD k zeroI).lo ≤ D48I) ∧
    (tot : ℝ) + ∑ k ∈ range n, |((xs.getD k zeroI).lo : ℝ)| ≤ (D128N : ℝ) := by
  induction n generalizing xs tot with
  | zero =>
    cases xs with
    | nil =>
      simp only [checkTigMu, nat_ble_iff] at hok
      exact ⟨rfl, fun _ h => absurd h (Nat.not_lt_zero _), by simpa using (Nat.cast_le (α := ℝ)).2 hok⟩
    | cons _ _ => simp [checkTigMu] at hok
  | succ n ih =>
    cases xs with
    | nil => simp [checkTigMu] at hok
    | cons iv rest =>
      simp only [checkTigMu] at hok
      split_ifs at hok with hc
      rw [Bool.and_eq_true, nat_ble_iff, iLe_iff, iSub_eq, iNatAbs_eq] at hc
      obtain ⟨hlen, hpt, hsum⟩ := ih hok
      refine ⟨by simp [hlen], ?_, ?_⟩
      · intro k hk
        cases k with
        | zero =>
          simp only [List.getD_cons_zero]
          refine ⟨?_, hc.2⟩
          have h1 : (iv.lo.natAbs : ℤ) ≤ (D128N : ℤ) := by exact_mod_cast hc.1
          have h2 : |iv.lo| = (iv.lo.natAbs : ℤ) := by
            cases iv.lo with
            | ofNat m => simp
            | negSucc m => rw [abs_of_neg (Int.negSucc_lt_zero m)]; omega
          omega
        | succ k =>
          simp only [List.getD_cons_succ]
          exact hpt k (by omega)
      · rw [Finset.sum_range_succ']
        simp only [List.getD_cons_zero, List.getD_cons_succ]
        rw [nat_add_eq, Nat.cast_add, iNatAbs_cast_R] at hsum
        linarith

/-! #### 2D `tcellRows` validation and unsigned `Nat` packing (`packRowsNat`) -/

private lemma natListToIntAcc_eq (ns : List ℕ) (acc : List ℤ) :
    natListToIntAcc ns acc = acc.reverse ++ ns.map Int.ofNat := by
  induction ns generalizing acc with
  | nil => simp [natListToIntAcc, revL_eq]
  | cons n ns ih => simp [natListToIntAcc, ih, List.append_assoc]

private lemma checkEntries_spec {expN len : ℕ} {es : List (ℕ × Ival)} {tot tot' : ℕ}
    (hok : checkEntries expN len es tot = some tot') :
    es.length = len ∧
    (∀ j < len,
      (es.getD j (0, zeroI)).1 = expN + 2 * j ∧
      0 ≤ (es.getD j (0, zeroI)).2.lo ∧
      (es.getD j (0, zeroI)).2.lo ≤ D128I ∧
      (es.getD j (0, zeroI)).2.hi - (es.getD j (0, zeroI)).2.lo ≤ D48I) ∧
    tot' = tot + ∑ j ∈ range len, toNat0 (es.getD j (0, zeroI)).2.lo := by
  induction len generalizing expN es tot with
  | zero =>
    cases es with
    | nil =>
      simp only [checkEntries, Option.some.injEq] at hok
      exact ⟨rfl, fun _ h => absurd h (Nat.not_lt_zero _), by simp [hok]⟩
    | cons _ _ => simp [checkEntries] at hok
  | succ len ih =>
    cases es with
    | nil => simp [checkEntries] at hok
    | cons e es =>
      rcases e with ⟨n, iv⟩
      simp only [checkEntries] at hok
      split_ifs at hok with hc
      simp only [Bool.and_eq_true, nat_beq_iff, iLe_iff, iSub_eq] at hc
      obtain ⟨⟨⟨hn, hlo0⟩, hlo128⟩, hwid⟩ := hc
      obtain ⟨hlen, hpt, htot⟩ := ih hok
      rw [nat_add_eq] at htot
      refine ⟨by simp [hlen], ?_, ?_⟩
      · intro j hj
        cases j with
        | zero =>
          simp only [List.getD_cons_zero, mul_zero, add_zero]
          exact ⟨hn, hlo0, hlo128, hwid⟩
        | succ j =>
          simp only [List.getD_cons_succ]
          obtain ⟨h1, h2, h3, h4⟩ := hpt j (by omega)
          rw [nat_add_eq] at h1
          exact ⟨by omega, h2, h3, h4⟩
      · rw [Finset.sum_range_succ']
        simp only [List.getD_cons_zero, List.getD_cons_succ]
        omega

private lemma zipNat_prefix (es : List (ℕ × Ival)) (bs acc : List ℕ) (k : ℕ)
    (hk : k < acc.length) :
    (zipNat es bs acc).getD k 0 = acc.reverse.getD k 0 := by
  induction es generalizing bs acc with
  | nil => simp [zipNat, revL_eq]
  | cons e es ih =>
    rcases e with ⟨_, iv⟩
    cases bs with
    | nil =>
      simp only [zipNat]
      rw [ih [] (toNat0 iv.lo :: acc) (by simp; omega), List.reverse_cons]
      simp only [List.getD_eq_getElem?_getD, List.getElem?_append_left (by rw [List.length_reverse]; exact hk)]
    | cons b bs =>
      simp only [zipNat]
      rw [ih bs (Nat.add (Nat.mul b B3N) (toNat0 iv.lo) :: acc) (by simp; omega), List.reverse_cons]
      simp only [List.getD_eq_getElem?_getD, List.getElem?_append_left (by rw [List.length_reverse]; exact hk)]

private lemma zipNat_spec (es : List (ℕ × Ival)) (bs : List ℕ) (acc : List ℕ)
    (hle : bs.length ≤ es.length) :
    (zipNat es bs acc).length = acc.length + es.length ∧
    ∀ j < es.length,
      (zipNat es bs acc).getD (acc.length + j) 0 =
        (if j < bs.length then bs.getD j 0 * B3N else 0) + toNat0 (es.getD j (0, zeroI)).2.lo := by
  induction es generalizing bs acc with
  | nil =>
    simp only [zipNat, revL_eq, List.append_nil, List.length_reverse, List.length_nil, add_zero]
    exact ⟨trivial, fun _ h => absurd h (Nat.not_lt_zero _)⟩
  | cons e es ih =>
    rcases e with ⟨n, iv⟩
    cases bs with
    | nil =>
      simp only [zipNat]
      obtain ⟨hL, hG⟩ := ih [] (toNat0 iv.lo :: acc) (by simp)
      refine ⟨by simp only [List.length_cons] at hL ⊢; omega, ?_⟩
      intro j hj
      cases j with
      | zero =>
        simp only [add_zero, List.length_nil, Nat.not_lt_zero, ↓reduceIte, zero_add, List.getD_cons_zero]
        rw [zipNat_prefix es [] (toNat0 iv.lo :: acc) acc.length (by simp), List.reverse_cons]
        have hleR : acc.reverse.length ≤ acc.length := by simp
        simp only [List.getD_eq_getElem?_getD, List.getElem?_append_right hleR,
          List.length_reverse, Nat.sub_self, List.getElem?_cons_zero, Option.getD_some]
      | succ j =>
        have h1 := hG j (by simp at hj; omega)
        simp only [List.length_cons, List.length_nil, Nat.not_lt_zero, ↓reduceIte, zero_add] at h1 ⊢
        simpa [show acc.length + 1 + j = acc.length + (j + 1) by omega] using h1
    | cons b bs =>
      simp only [zipNat, nat_add_eq, nat_mul_eq]
      obtain ⟨hL, hG⟩ := ih bs ((b * B3N + toNat0 iv.lo) :: acc) (by simp at hle; omega)
      refine ⟨by simp only [List.length_cons] at hL ⊢; omega, ?_⟩
      intro j hj
      cases j with
      | zero =>
        simp only [add_zero, List.length_cons, Nat.zero_lt_succ, ↓reduceIte, List.getD_cons_zero]
        rw [zipNat_prefix es bs ((b * B3N + toNat0 iv.lo) :: acc) acc.length (by simp), List.reverse_cons]
        have hleR : acc.reverse.length ≤ acc.length := by simp
        simp only [List.getD_eq_getElem?_getD, List.getElem?_append_right hleR,
          List.length_reverse, Nat.sub_self, List.getElem?_cons_zero, Option.getD_some]
      | succ j =>
        have h1 := hG j (by simp at hj; omega)
        simp only [List.length_cons, Nat.succ_lt_succ_iff, List.getD_cons_succ] at h1 ⊢
        simpa [show acc.length + 1 + j = acc.length + (j + 1) by omega] using h1

/-- Exact `E` polynomial for bucket `j < 251`: `∑_{a : 2j+1+6a ≤ 501} μ(2j+1, 2a) X^{3a}`. -/
private def EPoly (μ : ℕ × ℕ → ℝ) (j : ℕ) : ℝ[X] :=
  ∑ a ∈ range ((250 - j) / 3 + 1), Polynomial.C (μ (2 * j + 1, 2 * a)) * Polynomial.X ^ (3 * a)

/-- Exact `O` polynomial for bucket `j < 250`: `∑_{a : 2j+6a+3 ≤ 501} μ(2j, 2a+1) X^{3a}`. -/
private def OPoly (μ : ℕ × ℕ → ℝ) (j : ℕ) : ℝ[X] :=
  ∑ a ∈ range ((249 - j) / 3 + 1), Polynomial.C (μ (2 * j, 2 * a + 1)) * Polynomial.X ^ (3 * a)

private def kronRepDeg (deg S : ℕ) (M err : ℝ) (F : ℝ[X]) (z : ℤ) : Prop :=
  ∃ Q : ℤ[X], (∀ j ≥ deg, Q.coeff j = 0) ∧
    Q.eval B1I = z ∧
    (∑ j ∈ range 251, |(Q.coeff j : ℝ)|) ≤ M ∧
    (∑ j ∈ range 251, |F.coeff j * (S : ℝ) - (Q.coeff j : ℝ)|) ≤ err

private lemma kronRepDeg_to_kronRep {deg S : ℕ} {M err : ℝ} {F : ℝ[X]} {z : ℤ}
    (hd : deg ≤ 251) (h : kronRepDeg deg S M err F z) : kronRep S M err F z := by
  obtain ⟨Q, hs, hev, hm, he⟩ := h
  exact ⟨Q, fun j hj => hs j (by omega), hev, hm, he⟩

private lemma kronRepDeg_const_mem {deg : ℕ} (hd : 1 ≤ deg) {v : ℝ} {iv : Ival}
    (hlo0 : 0 ≤ iv.lo) (hwid : iv.hi - iv.lo ≤ D48I) (hmem : mem v iv) :
    kronRepDeg deg D128N (toNat0 iv.lo : ℝ) (D48N : ℝ)
      (Polynomial.C v) (Int.ofNat (toNat0 iv.lo)) := by
  have hlo_eq : (toNat0 iv.lo : ℤ) = iv.lo := toNat0_eq hlo0
  have hloR : (toNat0 iv.lo : ℝ) = (iv.lo : ℝ) := by exact_mod_cast hlo_eq
  have herr : |v * (D128N : ℝ) - (iv.lo : ℝ)| ≤ (D48N : ℝ) := by
    obtain ⟨h1, h2⟩ := hmem
    rw [← D128_eq_D] at h1 h2
    have hwidR : (iv.hi : ℝ) - (iv.lo : ℝ) ≤ (D48N : ℝ) := by exact_mod_cast hwid
    rw [abs_le]; constructor <;> linarith
  refine ⟨Polynomial.C iv.lo, fun j hj => by rw [coeff_C, ite_eq_right (by omega)],
    by rw [eval_C, Int.ofNat_eq_natCast, hlo_eq], ?_, ?_⟩
  · rw [show (251 : ℕ) = 1 + 250 by rfl, Finset.sum_range_add]
    have h0 : ∑ j ∈ range 1, |((Polynomial.C iv.lo).coeff j : ℝ)| = (toNat0 iv.lo : ℝ) := by
      simp only [Finset.range_one, Finset.sum_singleton, coeff_C_zero, ← hloR,
        abs_of_nonneg (Nat.cast_nonneg (α := ℝ) _)]
    have h1 : ∑ j ∈ range 250, |((Polynomial.C iv.lo).coeff (1 + j) : ℝ)| = 0 :=
      sum_eq_zero fun j _ => by rw [coeff_C, ite_eq_right (by omega), Int.cast_zero, abs_zero]
    linarith
  · rw [show (251 : ℕ) = 1 + 250 by rfl, Finset.sum_range_add]
    have h0 : ∑ j ∈ range 1, |(Polynomial.C v).coeff j * (D128N : ℝ) - ((Polynomial.C iv.lo).coeff j : ℝ)| =
        |v * (D128N : ℝ) - (iv.lo : ℝ)| := by simp
    have h1 : ∑ j ∈ range 250,
        |(Polynomial.C v).coeff (1 + j) * (D128N : ℝ) - ((Polynomial.C iv.lo).coeff (1 + j) : ℝ)| = 0 :=
      sum_eq_zero fun j _ => by rw [coeff_C, coeff_C, ite_eq_right (by omega), ite_eq_right (by omega)]; simp
    linarith

private lemma kronRepDeg_B3_add {d : ℕ} (hd : d + 3 ≤ 251)
    {F_old : ℝ[X]} {v : ℝ} {b_old : ℕ} {iv : Ival} {M_old E_old : ℝ}
    (hlo0 : 0 ≤ iv.lo) (hwid : iv.hi - iv.lo ≤ D48I) (hmem : mem v iv)
    (hold : kronRepDeg d D128N M_old E_old F_old (Int.ofNat b_old)) :
    kronRepDeg (d + 3) D128N (M_old + (toNat0 iv.lo : ℝ)) (E_old + (D48N : ℝ))
      (Polynomial.C v + Polynomial.X ^ 3 * F_old) (Int.ofNat (b_old * B3N + toNat0 iv.lo)) := by
  obtain ⟨Q_old, hs, hev, hm, he⟩ := hold
  have hlo_eq : (toNat0 iv.lo : ℤ) = iv.lo := toNat0_eq hlo0
  have hloR : (toNat0 iv.lo : ℝ) = (iv.lo : ℝ) := by exact_mod_cast hlo_eq
  have herr : |v * (D128N : ℝ) - (iv.lo : ℝ)| ≤ (D48N : ℝ) := by
    obtain ⟨h1, h2⟩ := hmem
    rw [← D128_eq_D] at h1 h2
    have hwidR : (iv.hi : ℝ) - (iv.lo : ℝ) ≤ (D48N : ℝ) := by exact_mod_cast hwid
    rw [abs_le]; constructor <;> linarith
  let Q' : ℤ[X] := Polynomial.C iv.lo + Polynomial.X ^ 3 * Q_old
  refine ⟨Q', ?_, ?_, ?_, ?_⟩
  · intro j hj
    simp only [Q', coeff_add, coeff_C, ite_eq_right (by omega : j ≠ 0), zero_add,
      coeff_X_pow_mul', ite_eq_left (by omega : 3 ≤ j)]
    exact hs (j - 3) (by omega)
  · simp only [Q', eval_add, eval_C, eval_mul, eval_pow, eval_X, hev]
    have hB3 : B1I ^ 3 = (B3N : ℤ) := by unfold B1I; rw [B3N_eq]; push_cast; rfl
    rw [hB3, Int.ofNat_eq_natCast, Int.ofNat_eq_natCast, Nat.cast_add, Nat.cast_mul, hlo_eq]
    ring
  · rw [show (251 : ℕ) = 3 + 248 by rfl, Finset.sum_range_add]
    have h03 : ∑ j ∈ range 3, |(Q'.coeff j : ℝ)| = (toNat0 iv.lo : ℝ) := by
      rw [Finset.sum_range_succ, Finset.sum_range_succ, Finset.sum_range_one]
      have hc0 : Q'.coeff 0 = iv.lo := by simp [Q']
      have hc1 : Q'.coeff 1 = 0 := by simp only [Q', coeff_add, coeff_C, coeff_X_pow_mul']; norm_num
      have hc2 : Q'.coeff 2 = 0 := by simp only [Q', coeff_add, coeff_C, coeff_X_pow_mul']; norm_num
      rw [hc0, hc1, hc2, Int.cast_zero, abs_zero, add_zero, add_zero, ← hloR,
        abs_of_nonneg (Nat.cast_nonneg (α := ℝ) _)]
    have hrest : ∑ k ∈ range 248, |(Q'.coeff (3 + k) : ℝ)| = ∑ k ∈ range 248, |(Q_old.coeff k : ℝ)| :=
      sum_congr rfl fun k _ => by
        simp only [Q', coeff_add, coeff_C, ite_eq_right (by omega : 3 + k ≠ 0), zero_add,
          coeff_X_pow_mul', ite_eq_left (by omega : 3 ≤ 3 + k), Nat.add_sub_cancel_left]
    rw [h03, hrest]
    have hle : ∑ k ∈ range 248, |(Q_old.coeff k : ℝ)| ≤ M_old :=
      (Finset.sum_le_sum_of_subset_of_nonneg (Finset.range_mono (by omega))
        (fun _ _ _ => abs_nonneg _)).trans hm
    linarith
  · rw [show (251 : ℕ) = 3 + 248 by rfl, Finset.sum_range_add]
    have h03 : ∑ j ∈ range 3,
        |(Polynomial.C v + Polynomial.X ^ 3 * F_old).coeff j * (D128N : ℝ) - (Q'.coeff j : ℝ)| =
        |v * (D128N : ℝ) - (iv.lo : ℝ)| := by
      rw [Finset.sum_range_succ, Finset.sum_range_succ, Finset.sum_range_one]
      have hf0 : (Polynomial.C v + Polynomial.X ^ 3 * F_old).coeff 0 = v := by simp
      have hf1 : (Polynomial.C v + Polynomial.X ^ 3 * F_old).coeff 1 = 0 := by
        simp only [coeff_add, coeff_C, coeff_X_pow_mul']; norm_num
      have hf2 : (Polynomial.C v + Polynomial.X ^ 3 * F_old).coeff 2 = 0 := by
        simp only [coeff_add, coeff_C, coeff_X_pow_mul']; norm_num
      have hc0 : Q'.coeff 0 = iv.lo := by simp [Q']
      have hc1 : Q'.coeff 1 = 0 := by simp only [Q', coeff_add, coeff_C, coeff_X_pow_mul']; norm_num
      have hc2 : Q'.coeff 2 = 0 := by simp only [Q', coeff_add, coeff_C, coeff_X_pow_mul']; norm_num
      rw [hf0, hf1, hf2, hc0, hc1, hc2]; simp
    have hrest : ∑ k ∈ range 248,
        |(Polynomial.C v + Polynomial.X ^ 3 * F_old).coeff (3 + k) * (D128N : ℝ) - (Q'.coeff (3 + k) : ℝ)| =
        ∑ k ∈ range 248, |F_old.coeff k * (D128N : ℝ) - (Q_old.coeff k : ℝ)| :=
      sum_congr rfl fun k _ => by
        simp only [Q', coeff_add, coeff_C, ite_eq_right (by omega : 3 + k ≠ 0), zero_add,
          coeff_X_pow_mul', ite_eq_left (by omega : 3 ≤ 3 + k), Nat.add_sub_cancel_left]
    rw [h03, hrest]
    have hle : ∑ k ∈ range 248, |F_old.coeff k * (D128N : ℝ) - (Q_old.coeff k : ℝ)| ≤ E_old :=
      (Finset.sum_le_sum_of_subset_of_nonneg (Finset.range_mono (by omega))
        (fun _ _ _ => abs_nonneg _)).trans he
    linarith

private def EPolyFrom (μ : ℕ × ℕ → ℝ) (a0 j : ℕ) : ℝ[X] :=
  ∑ t ∈ range ((250 - j) / 3 + 1 - a0),
    Polynomial.C (μ (2 * j + 1, 2 * (a0 + t))) * Polynomial.X ^ (3 * t)

private def OPolyFrom (μ : ℕ × ℕ → ℝ) (a0 j : ℕ) : ℝ[X] :=
  ∑ t ∈ range ((249 - j) / 3 + 1 - a0),
    Polynomial.C (μ (2 * j, 2 * (a0 + t) + 1)) * Polynomial.X ^ (3 * t)

private def lenE (a0 : ℕ) : ℕ := if a0 ≤ 83 then 251 - 3 * a0 else 0
private def lenO (a0 : ℕ) : ℕ := if a0 ≤ 83 then 250 - 3 * a0 else 0

private lemma EPolyFrom_step (μ : ℕ × ℕ → ℝ) (a j : ℕ)
    (ha : a ≤ 83) (hj : j < 251 - 3 * a) :
    EPolyFrom μ a j =
      Polynomial.C (μ (2 * j + 1, 2 * a)) + Polynomial.X ^ 3 * EPolyFrom μ (a + 1) j := by
  have hsplit : (250 - j) / 3 + 1 - a = ((250 - j) / 3 + 1 - (a + 1)) + 1 := by omega
  unfold EPolyFrom
  rw [hsplit, Finset.sum_range_succ', mul_zero, pow_zero, mul_one, add_zero, add_comm,
    Finset.mul_sum]
  congr 1
  refine sum_congr rfl fun t _ => ?_
  rw [show a + (t + 1) = a + 1 + t by omega, show 3 * (t + 1) = 3 + 3 * t by omega, pow_add]
  ring

private lemma OPolyFrom_step (μ : ℕ × ℕ → ℝ) (a j : ℕ)
    (ha : a ≤ 83) (hj : j < 250 - 3 * a) :
    OPolyFrom μ a j =
      Polynomial.C (μ (2 * j, 2 * a + 1)) + Polynomial.X ^ 3 * OPolyFrom μ (a + 1) j := by
  have hsplit : (249 - j) / 3 + 1 - a = ((249 - j) / 3 + 1 - (a + 1)) + 1 := by omega
  unfold OPolyFrom
  rw [hsplit, Finset.sum_range_succ', mul_zero, pow_zero, mul_one, add_zero, add_comm,
    Finset.mul_sum]
  congr 1
  refine sum_congr rfl fun t _ => ?_
  rw [show a + (t + 1) = a + 1 + t by omega, show 3 * (t + 1) = 3 + 3 * t by omega, pow_add]
  ring

private lemma EPolyFrom_single (μ : ℕ × ℕ → ℝ) (a j : ℕ)
    (ha : a ≤ 83) (hge : lenE (a + 1) ≤ j) (hlt : j < 251 - 3 * a) :
    EPolyFrom μ a j = Polynomial.C (μ (2 * j + 1, 2 * a)) := by
  have h1 : (250 - j) / 3 + 1 - a = 1 := by unfold lenE at hge; split_ifs at hge <;> omega
  unfold EPolyFrom
  rw [h1, Finset.sum_range_one]
  simp

private lemma OPolyFrom_single (μ : ℕ × ℕ → ℝ) (a j : ℕ)
    (ha : a ≤ 83) (hge : lenO (a + 1) ≤ j) (hlt : j < 250 - 3 * a) :
    OPolyFrom μ a j = Polynomial.C (μ (2 * j, 2 * a + 1)) := by
  have h1 : (249 - j) / 3 + 1 - a = 1 := by unfold lenO at hge; split_ifs at hge <;> omega
  unfold OPolyFrom
  rw [h1, Finset.sum_range_one]
  simp

private lemma packRowsNat_kronRep_go (μ : ℕ × ℕ → ℝ) :
    ∀ (rem : ℕ) (rs : List RowI) (tot : ℕ) (ev od : List ℕ)
      (ME EE MO EO : List ℝ),
      rem ≤ 168 →
      checkRowsShape rem rs tot = true →
      (∀ r ∈ rs, ∀ e ∈ r.2, mem (μ (e.1, r.1)) e.2) →
      od.length = lenE ((rem + 1) / 2) →
      ev.length = lenO (rem / 2) →
      ME.length = od.length → EE.length = od.length →
      MO.length = ev.length → EO.length = ev.length →
      (∀ j < od.length, 0 ≤ ME.getD j 0 ∧
        kronRepDeg (251 - 3 * ((rem + 1) / 2)) D128N (ME.getD j 0) (EE.getD j 0)
          (EPolyFrom μ ((rem + 1) / 2) j) (Int.ofNat (od.getD j 0))) →
      (∀ j < ev.length, 0 ≤ MO.getD j 0 ∧
        kronRepDeg (251 - 3 * (rem / 2)) D128N (MO.getD j 0) (EO.getD j 0)
          (OPolyFrom μ (rem / 2) j) (Int.ofNat (ev.getD j 0))) →
      (∑ j ∈ range od.length, ME.getD j 0) + (∑ j ∈ range ev.length, MO.getD j 0) = (tot : ℝ) →
      (∀ j < od.length, EE.getD j 0 = (((250 - j) / 3 + 1 - (rem + 1) / 2 : ℕ) : ℝ) * (D48N : ℝ)) →
      (∀ j < ev.length, EO.getD j 0 = (((249 - j) / 3 + 1 - rem / 2 : ℕ) : ℝ) * (D48N : ℝ)) →
      let (evF, odF) := packRowsNat rs ev od
      evF.length = 250 ∧ odF.length = 251 ∧
      ∃ (ME' EE' MO' EO' : List ℝ),
        ME'.length = 251 ∧ EE'.length = 251 ∧ MO'.length = 250 ∧ EO'.length = 250 ∧
        (∀ j < 251, 0 ≤ ME'.getD j 0 ∧
          kronRepDeg 251 D128N (ME'.getD j 0) (EE'.getD j 0) (EPolyFrom μ 0 j) (Int.ofNat (odF.getD j 0))) ∧
        (∀ j < 250, 0 ≤ MO'.getD j 0 ∧
          kronRepDeg 251 D128N (MO'.getD j 0) (EO'.getD j 0) (OPolyFrom μ 0 j) (Int.ofNat (evF.getD j 0))) ∧
        (∑ j ∈ range 251, ME'.getD j 0) + (∑ j ∈ range 250, MO'.getD j 0) ≤ (D128N : ℝ) ∧
        (∀ j < 251, EE'.getD j 0 = (((250 - j) / 3 + 1 : ℕ) : ℝ) * (D48N : ℝ)) ∧
        (∀ j < 250, EO'.getD j 0 = (((249 - j) / 3 + 1 : ℕ) : ℝ) * (D48N : ℝ)) := by
  intro rem
  induction rem with
  | zero =>
    intro rs tot ev od ME EE MO EO _ hsh _ hodL hevL hME hEE hMO hEO hE hO htot hEEv hEOv
    cases rs with
    | cons _ _ => simp [checkRowsShape] at hsh
    | nil =>
      simp only [checkRowsShape, nat_ble_iff] at hsh
      simp only [packRowsNat]
      have hod251 : od.length = 251 := by simpa [lenE] using hodL
      have hev250 : ev.length = 250 := by simpa [lenO] using hevL
      refine ⟨hev250, hod251, ME, EE, MO, EO, by omega, by omega, by omega, by omega, ?_, ?_, ?_, ?_, ?_⟩
      · intro j hj; simpa [hod251] using hE j (by omega)
      · intro j hj; simpa [hev250] using hO j (by omega)
      · rw [← hod251, ← hev250, htot]; exact_mod_cast hsh
      · intro j hj; simpa [hod251] using hEEv j (by omega)
      · intro j hj; simpa [hev250] using hEOv j (by omega)
  | succ rem ih =>
    intro rs tot ev od ME EE MO EO hrem168 hsh hmr hodL hevL hME hEE hMO hEO hE hO htot hEEv hEOv
    cases rs with
    | nil => simp [checkRowsShape] at hsh
    | cons r rest =>
      rcases r with ⟨m, es⟩
      simp only [checkRowsShape] at hsh
      have hm_eq : Nat.beq m rem = true := by
        by_contra hne; rw [ite_eq_right hne] at hsh; simp at hsh
      rw [ite_eq_left hm_eq] at hsh
      have hm : m = rem := nat_beq_iff.1 hm_eq
      subst hm
      cases hce : checkEntries (if Nat.beq (Nat.mod m 2) 1 then 0 else 1) (expectedRowLen m) es tot with
      | none => rw [hce] at hsh; simp at hsh
      | some tot' =>
        rw [hce] at hsh
        obtain ⟨hes_len, hes_pt, htot'⟩ := checkEntries_spec hce
        have hes_mem : ∀ j < expectedRowLen m,
            mem (μ ((es.getD j (0, zeroI)).1, m)) (es.getD j (0, zeroI)).2 := fun j hj => by
          have hj' : j < es.length := by omega
          have hget : es.getD j (0, zeroI) = es[j] := by simp [List.getD, hj']
          rw [hget]
          exact hmr (m, es) (List.mem_cons_self) es[j] (List.getElem_mem hj')
        simp only [packRowsNat]
        set a := m / 2
        have ha83 : a ≤ 83 := by omega
        by_cases hodd : m % 2 = 1
        · -- Odd row `m = 2*a + 1`: updates `ev`, leaves `od` unchanged!
          have hb_odd : Nat.beq (Nat.mod m 2) 1 = true := nat_beq_iff.2 hodd
          rw [ite_eq_left hb_odd]
          have hrem_o_old : (m + 1) / 2 = a + 1 := by omega
          have hlen_exp : expectedRowLen m = 250 - 3 * a := by
            unfold expectedRowLen; rw [ite_eq_left hb_odd]; rfl
          have hev_le : ev.length ≤ es.length := by
            rw [hevL, hes_len, hlen_exp, hrem_o_old]; unfold lenO; split_ifs <;> omega
          obtain ⟨hz_len, hz_get⟩ := zipNat_spec es ev [] hev_le
          simp only [List.length_nil, zero_add] at hz_len hz_get
          let MO_new : List ℝ := (List.range es.length).map fun j =>
            (if j < ev.length then MO.getD j 0 else 0) + (toNat0 (es.getD j (0, zeroI)).2.lo : ℝ)
          let EO_new : List ℝ := (List.range es.length).map fun j =>
            (((249 - j) / 3 + 1 - a : ℕ) : ℝ) * (D48N : ℝ)
          have hMO_get : ∀ j < es.length, MO_new.getD j 0 =
              (if j < ev.length then MO.getD j 0 else 0) + (toNat0 (es.getD j (0, zeroI)).2.lo : ℝ) :=
            fun j hj => getD_map_range _ _ _ _ hj
          have hEO_get : ∀ j < es.length, EO_new.getD j 0 =
              (((249 - j) / 3 + 1 - a : ℕ) : ℝ) * (D48N : ℝ) :=
            fun j hj => getD_map_range _ _ _ _ hj
          have hMO_sum : ∑ j ∈ range (zipNat es ev []).length, MO_new.getD j 0 =
              (∑ j ∈ range ev.length, MO.getD j 0) +
              ∑ j ∈ range (expectedRowLen m), (toNat0 (es.getD j (0, zeroI)).2.lo : ℝ) := by
            rw [hz_len]
            calc ∑ j ∈ range es.length, MO_new.getD j 0
                = ∑ j ∈ range es.length, ((if j < ev.length then MO.getD j 0 else 0) +
                    (toNat0 (es.getD j (0, zeroI)).2.lo : ℝ)) :=
                  sum_congr rfl fun j hj => hMO_get j (mem_range.1 hj)
              _ = (∑ j ∈ range es.length, if j < ev.length then MO.getD j 0 else 0) +
                  ∑ j ∈ range es.length, (toNat0 (es.getD j (0, zeroI)).2.lo : ℝ) := sum_add_distrib
              _ = (∑ j ∈ range ev.length, MO.getD j 0) +
                  ∑ j ∈ range (expectedRowLen m), (toNat0 (es.getD j (0, zeroI)).2.lo : ℝ) := by
                  rw [hes_len]; congr 1
                  rw [← Finset.sum_filter]
                  refine sum_congr ?_ (fun _ _ => rfl)
                  ext j; simp only [Finset.mem_filter, Finset.mem_range]; omega
          refine ih rest tot' (zipNat es ev []) od ME EE MO_new EO_new (by omega) hsh
            (fun r hr => hmr r (List.mem_cons_of_mem _ hr))
            (by rw [hodL, show (m + 1 + 1) / 2 = (m + 1) / 2 by omega])
            (by rw [hz_len, hes_len, hlen_exp]; unfold lenO; rw [ite_eq_left ha83])
            hME hEE (by simp [MO_new, hz_len]) (by simp [EO_new, hz_len])
            (by intro j hj; simpa [show (m + 1 + 1) / 2 = (m + 1) / 2 by omega] using hE j hj)
            ?_ ?_
            (by intro j hj; simpa [show (m + 1 + 1) / 2 = (m + 1) / 2 by omega] using hEEv j hj)
            (by intro j hj; exact hEO_get j (by omega))
          · intro j hj
            have hjes : j < es.length := by omega
            have hj_exp : j < expectedRowLen m := by omega
            rw [hMO_get j hjes, hEO_get j hjes, hz_get j hjes]
            obtain ⟨hn_eq, hlo0, _, hwid⟩ := hes_pt j hj_exp
            have hstart0 : (if Nat.beq (Nat.mod m 2) 1 then 0 else 1) = 0 := ite_eq_left hb_odd
            rw [hstart0, zero_add] at hn_eq
            have hmem_j : mem (μ (2 * j, 2 * a + 1)) (es.getD j (0, zeroI)).2 := by
              have hm_eq' : m = 2 * a + 1 := by omega
              have h := hes_mem j hj_exp
              rwa [hn_eq, hm_eq'] at h
            by_cases hj_old : j < ev.length
            · rw [ite_eq_left hj_old, ite_eq_left hj_old]
              obtain ⟨hMO0, hOold⟩ := hO j hj_old
              refine ⟨by linarith [show (0 : ℝ) ≤ (toNat0 (es.getD j (0, zeroI)).2.lo : ℝ) by positivity], ?_⟩
              have hstep_poly := OPolyFrom_step μ a j ha83 (by omega)
              rw [hrem_o_old] at hOold
              have hEOold := hEOv j hj_old
              rw [hrem_o_old] at hEOold
              have ha82 : a + 1 ≤ 83 := by
                rw [hevL, hrem_o_old] at hj_old; unfold lenO at hj_old; split_ifs at hj_old <;> omega
              have hdeg_eq : 251 - 3 * (a + 1) + 3 = 251 - 3 * a := by omega
              have hstep := kronRepDeg_B3_add (d := 251 - 3 * (a + 1)) (by omega)
                hlo0 hwid hmem_j hOold
              rw [hdeg_eq, ← hstep_poly] at hstep
              have hEO_eq : EO.getD j 0 + (D48N : ℝ) =
                  (((249 - j) / 3 + 1 - a : ℕ) : ℝ) * (D48N : ℝ) := by
                rw [hEOold]
                have hnat : ((249 - j) / 3 + 1 - (a + 1)) + 1 = (249 - j) / 3 + 1 - a := by
                  rw [hevL, hrem_o_old] at hj_old; unfold lenO at hj_old; rw [ite_eq_left ha82] at hj_old; omega
                have hcast : (((249 - j) / 3 + 1 - (a + 1) : ℕ) : ℝ) + 1 =
                    (((249 - j) / 3 + 1 - a : ℕ) : ℝ) := by exact_mod_cast hnat
                rw [← hcast]; ring
              rw [hEO_eq] at hstep; exact hstep
            · rw [ite_eq_right hj_old, ite_eq_right hj_old, zero_add, zero_add]
              refine ⟨Nat.cast_nonneg _, ?_⟩
              have hge : lenO (a + 1) ≤ j := by rw [hevL, hrem_o_old] at hj_old; omega
              have hsing := OPolyFrom_single μ a j ha83 hge (by omega)
              have h1 : (249 - j) / 3 + 1 - a = 1 := by
                unfold lenO at hge; split_ifs at hge <;> omega
              rw [hsing, h1, Nat.cast_one, one_mul]
              exact kronRepDeg_const_mem (by omega) hlo0 hwid hmem_j
          · rw [hMO_sum, htot', Nat.cast_add, Nat.cast_sum]
            linarith
        · -- Even row `m = 2*a`: updates `od`, leaves `ev` unchanged!
          have hb_ev : Nat.beq (Nat.mod m 2) 1 = false := by
            cases h : Nat.beq (Nat.mod m 2) 1
            · rfl
            · exact absurd (nat_beq_iff.1 h) hodd
          rw [ite_eq_right (by rw [hb_ev]; decide)]
          have hrem_e_old : (m + 1 + 1) / 2 = a + 1 := by omega
          have hrem_e_new : (m + 1) / 2 = a := by omega
          have hrem_o_eq : (m + 1) / 2 = m / 2 := by omega
          have hlen_exp : expectedRowLen m = 251 - 3 * a := by
            unfold expectedRowLen; rw [ite_eq_right (by rw [hb_ev]; decide)]; rfl
          have hod_le : od.length ≤ es.length := by
            rw [hodL, hes_len, hlen_exp, hrem_e_old]; unfold lenE; split_ifs <;> omega
          obtain ⟨hz_len, hz_get⟩ := zipNat_spec es od [] hod_le
          simp only [List.length_nil, zero_add] at hz_len hz_get
          let ME_new : List ℝ := (List.range es.length).map fun j =>
            (if j < od.length then ME.getD j 0 else 0) + (toNat0 (es.getD j (0, zeroI)).2.lo : ℝ)
          let EE_new : List ℝ := (List.range es.length).map fun j =>
            (((250 - j) / 3 + 1 - a : ℕ) : ℝ) * (D48N : ℝ)
          have hME_get : ∀ j < es.length, ME_new.getD j 0 =
              (if j < od.length then ME.getD j 0 else 0) + (toNat0 (es.getD j (0, zeroI)).2.lo : ℝ) :=
            fun j hj => getD_map_range _ _ _ _ hj
          have hEE_get : ∀ j < es.length, EE_new.getD j 0 =
              (((250 - j) / 3 + 1 - a : ℕ) : ℝ) * (D48N : ℝ) :=
            fun j hj => getD_map_range _ _ _ _ hj
          have hME_sum : ∑ j ∈ range (zipNat es od []).length, ME_new.getD j 0 =
              (∑ j ∈ range od.length, ME.getD j 0) +
              ∑ j ∈ range (expectedRowLen m), (toNat0 (es.getD j (0, zeroI)).2.lo : ℝ) := by
            rw [hz_len]
            calc ∑ j ∈ range es.length, ME_new.getD j 0
                = ∑ j ∈ range es.length, ((if j < od.length then ME.getD j 0 else 0) +
                    (toNat0 (es.getD j (0, zeroI)).2.lo : ℝ)) :=
                  sum_congr rfl fun j hj => hME_get j (mem_range.1 hj)
              _ = (∑ j ∈ range es.length, if j < od.length then ME.getD j 0 else 0) +
                  ∑ j ∈ range es.length, (toNat0 (es.getD j (0, zeroI)).2.lo : ℝ) := sum_add_distrib
              _ = (∑ j ∈ range od.length, ME.getD j 0) +
                  ∑ j ∈ range (expectedRowLen m), (toNat0 (es.getD j (0, zeroI)).2.lo : ℝ) := by
                  rw [hes_len]; congr 1
                  rw [← Finset.sum_filter]
                  refine sum_congr ?_ (fun _ _ => rfl)
                  ext j; simp only [Finset.mem_filter, Finset.mem_range]; omega
          refine ih rest tot' ev (zipNat es od []) ME_new EE_new MO EO (by omega) hsh
            (fun r hr => hmr r (List.mem_cons_of_mem _ hr))
            (by rw [hz_len, hes_len, hlen_exp, hrem_e_new]; unfold lenE; rw [ite_eq_left ha83])
            (by rw [hevL, hrem_o_eq])
            (by simp [ME_new, hz_len]) (by simp [EE_new, hz_len]) hMO hEO
            ?_
            (by intro j hj; simpa [hrem_o_eq] using hO j hj)
            ?_
            (by intro j hj; rw [hrem_e_new]; exact hEE_get j (by omega))
            (by intro j hj; simpa [hrem_o_eq] using hEOv j hj)
          · intro j hj
            have hjes : j < es.length := by omega
            have hj_exp : j < expectedRowLen m := by omega
            rw [hME_get j hjes, hEE_get j hjes, hz_get j hjes, hrem_e_new]
            obtain ⟨hn_eq, hlo0, _, hwid⟩ := hes_pt j hj_exp
            have hstart1 : (if Nat.beq (Nat.mod m 2) 1 then 0 else 1) = 1 :=
              ite_eq_right (by rw [hb_ev]; decide)
            rw [hstart1] at hn_eq
            have hmem_j : mem (μ (2 * j + 1, 2 * a)) (es.getD j (0, zeroI)).2 := by
              have hm_eq' : m = 2 * a := by omega
              have hn_eq' : (es.getD j (0, zeroI)).1 = 2 * j + 1 := by omega
              have h := hes_mem j hj_exp
              rwa [hn_eq', hm_eq'] at h
            by_cases hj_old : j < od.length
            · rw [ite_eq_left hj_old, ite_eq_left hj_old]
              obtain ⟨hME0, hEold⟩ := hE j hj_old
              refine ⟨by linarith [show (0 : ℝ) ≤ (toNat0 (es.getD j (0, zeroI)).2.lo : ℝ) by positivity], ?_⟩
              have hstep_poly := EPolyFrom_step μ a j ha83 (by omega)
              rw [hrem_e_old] at hEold
              have hEEold := hEEv j hj_old
              rw [hrem_e_old] at hEEold
              have ha82 : a + 1 ≤ 83 := by
                rw [hodL, hrem_e_old] at hj_old; unfold lenE at hj_old; split_ifs at hj_old <;> omega
              have hdeg_eq : 251 - 3 * (a + 1) + 3 = 251 - 3 * a := by omega
              have hstep := kronRepDeg_B3_add (d := 251 - 3 * (a + 1)) (by omega)
                hlo0 hwid hmem_j hEold
              rw [hdeg_eq, ← hstep_poly] at hstep
              have hEE_eq : EE.getD j 0 + (D48N : ℝ) =
                  (((250 - j) / 3 + 1 - a : ℕ) : ℝ) * (D48N : ℝ) := by
                rw [hEEold]
                have hnat : ((250 - j) / 3 + 1 - (a + 1)) + 1 = (250 - j) / 3 + 1 - a := by
                  rw [hodL, hrem_e_old] at hj_old; unfold lenE at hj_old; rw [ite_eq_left ha82] at hj_old; omega
                have hcast : (((250 - j) / 3 + 1 - (a + 1) : ℕ) : ℝ) + 1 =
                    (((250 - j) / 3 + 1 - a : ℕ) : ℝ) := by exact_mod_cast hnat
                rw [← hcast]; ring
              rw [hEE_eq] at hstep; exact hstep
            · rw [ite_eq_right hj_old, ite_eq_right hj_old, zero_add, zero_add]
              refine ⟨Nat.cast_nonneg _, ?_⟩
              have hge : lenE (a + 1) ≤ j := by rw [hodL, hrem_e_old] at hj_old; omega
              have hsing := EPolyFrom_single μ a j ha83 hge (by omega)
              have h1 : (250 - j) / 3 + 1 - a = 1 := by
                unfold lenE at hge; split_ifs at hge <;> omega
              rw [hsing, h1, Nat.cast_one, one_mul]
              exact kronRepDeg_const_mem (by omega) hlo0 hwid hmem_j
          · rw [hME_sum, htot', Nat.cast_add, Nat.cast_sum]
            linarith

/-- Soundness of `packRowsNat`: produces `(evN, odN)` encoding `OPoly μ` and `EPoly μ`
at scale `D128` with total L1 norm `≤ D128` and total error `≤ 21168 * D48`. -/
private lemma packRowsNat_kronRep {rows : List RowI} {μ : ℕ × ℕ → ℝ}
    (hshape : checkRowsShape 168 (revL rows []) 0 = true)
    (hmem : ∀ r ∈ rows, ∀ e ∈ r.2, mem (μ (e.1, r.1)) e.2) :
    let (evN, odN) := packRowsNat (revL rows []) [] []
    evN.length = 250 ∧ odN.length = 251 ∧
    ∃ (ME EE MO EO : List ℝ),
      ME.length = 251 ∧ EE.length = 251 ∧ MO.length = 250 ∧ EO.length = 250 ∧
      (∀ j < 251, 0 ≤ ME.getD j 0 ∧
        kronRep D128N (ME.getD j 0) (EE.getD j 0) (EPoly μ j) (Int.ofNat (odN.getD j 0))) ∧
      (∀ j < 250, 0 ≤ MO.getD j 0 ∧
        kronRep D128N (MO.getD j 0) (EO.getD j 0) (OPoly μ j) (Int.ofNat (evN.getD j 0))) ∧
      (∑ j ∈ range 251, ME.getD j 0) ≤ (D128N : ℝ) ∧
      (∑ j ∈ range 250, MO.getD j 0) ≤ (D128N : ℝ) ∧
      (∑ j ∈ range 251, EE.getD j 0) ≤ 21168 * (D48N : ℝ) ∧
      (∑ j ∈ range 250, EO.getD j 0) ≤ 21168 * (D48N : ℝ) := by
  have hmem_rev : ∀ r ∈ revL rows [], ∀ e ∈ r.2, mem (μ (e.1, r.1)) e.2 := by
    intro r hr e he
    rw [revL_eq, List.append_nil, List.mem_reverse] at hr
    exact hmem r hr e he
  obtain ⟨hevL, hodL, ME, EE, MO, EO, hME, hEE, hMO, hEO, hE, hO, hMsum, hEEv, hEOv⟩ :=
    packRowsNat_kronRep_go μ 168 (revL rows []) 0 [] [] [] [] [] [] le_rfl hshape hmem_rev
      (by simp [lenE]) (by simp [lenO]) rfl rfl rfl rfl
      (fun _ h => absurd h (Nat.not_lt_zero _)) (fun _ h => absurd h (Nat.not_lt_zero _))
      (by simp) (fun _ h => absurd h (Nat.not_lt_zero _)) (fun _ h => absurd h (Nat.not_lt_zero _))
  have hE0_eq : ∀ j, EPolyFrom μ 0 j = EPoly μ j := fun j => by
    simp only [EPolyFrom, EPoly, Nat.sub_zero, zero_add]
  have hO0_eq : ∀ j, OPolyFrom μ 0 j = OPoly μ j := fun j => by
    simp only [OPolyFrom, OPoly, Nat.sub_zero, zero_add]
  have hME_nn : 0 ≤ ∑ j ∈ range 251, ME.getD j 0 := sum_nonneg fun j hj => (hE j (mem_range.1 hj)).1
  have hMO_nn : 0 ≤ ∑ j ∈ range 250, MO.getD j 0 := sum_nonneg fun j hj => (hO j (mem_range.1 hj)).1
  have hEE_sum : ∑ j ∈ range 251, EE.getD j 0 ≤ 21168 * (D48N : ℝ) := by
    calc ∑ j ∈ range 251, EE.getD j 0
        = ∑ j ∈ range 251, (((250 - j) / 3 + 1 : ℕ) : ℝ) * (D48N : ℝ) :=
          sum_congr rfl fun j hj => hEEv j (mem_range.1 hj)
      _ ≤ ∑ _j ∈ range 251, (84 : ℝ) * (D48N : ℝ) :=
          sum_le_sum fun j _ => mul_le_mul_of_nonneg_right
            (by exact_mod_cast (show (250 - j) / 3 + 1 ≤ 84 by omega)) (Nat.cast_nonneg _)
      _ = 251 * (84 * (D48N : ℝ)) := by simp [Finset.sum_const]
      _ ≤ 21168 * (D48N : ℝ) := by linarith [show (0 : ℝ) ≤ (D48N : ℝ) by positivity]
  have hEO_sum : ∑ j ∈ range 250, EO.getD j 0 ≤ 21168 * (D48N : ℝ) := by
    calc ∑ j ∈ range 250, EO.getD j 0
        = ∑ j ∈ range 250, (((249 - j) / 3 + 1 : ℕ) : ℝ) * (D48N : ℝ) :=
          sum_congr rfl fun j hj => hEOv j (mem_range.1 hj)
      _ ≤ ∑ _j ∈ range 250, (84 : ℝ) * (D48N : ℝ) :=
          sum_le_sum fun j _ => mul_le_mul_of_nonneg_right
            (by exact_mod_cast (show (249 - j) / 3 + 1 ≤ 84 by omega)) (Nat.cast_nonneg _)
      _ = 250 * (84 * (D48N : ℝ)) := by simp [Finset.sum_const]
      _ ≤ 21168 * (D48N : ℝ) := by linarith [show (0 : ℝ) ≤ (D48N : ℝ) by positivity]
  refine ⟨hevL, hodL, ME, EE, MO, EO, hME, hEE, hMO, hEO, ?_, ?_, by linarith, by linarith, hEE_sum, hEO_sum⟩
  · intro j hj
    refine ⟨(hE j hj).1, ?_⟩
    rw [← hE0_eq j]
    exact kronRepDeg_to_kronRep le_rfl (hE j hj).2
  · intro j hj
    refine ⟨(hO j hj).1, ?_⟩
    rw [← hO0_eq j]
    exact kronRepDeg_to_kronRep le_rfl (hO j hj).2

/-! ### 6. Algebraic identity equating `bivarKernel P (-X) μ` to the `E`/`O` split -/

private lemma smoothed_bivarKernel_eq_EO (P : ℝ[X]) (μ : ℕ × ℕ → ℝ)
    (hpar : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → μ p = 0) {n : ℕ} (hn : n < 251) :
    bivarKernel P (-Polynomial.X) μ n =
      ((∑ j ∈ range 251, EPoly μ j * (Polynomial.X * P ^ 2) ^ j) * P -
       Polynomial.X * ∑ j ∈ range 250, OPoly μ j * (Polynomial.X * P ^ 2) ^ j).coeff n := by
  have hQ0 : (-Polynomial.X : ℝ[X]).coeff 0 = 0 := by simp
  rw [bivarKernel_eq_head P (-Polynomial.X) hQ0 μ hpar (N := 501) (by omega)]
  have hmemH : ∀ p : ℕ × ℕ, p ∈ headIdx 501 ↔ p.1 + 3 * p.2 ≤ 501 := fun _ => mem_headIdx
  generalize headIdx 501 = H at hmemH ⊢
  -- Split `H` into even-m/odd-n pairs and odd-m/even-n pairs (all other pairs have `μ p = 0`)
  let S_E : Finset (ℕ × ℕ) := H.filter fun p => p.2 % 2 = 0 ∧ p.1 % 2 = 1
  let S_O : Finset (ℕ × ℕ) := H.filter fun p => p.2 % 2 = 1 ∧ p.1 % 2 = 0
  have hdisj : Disjoint S_E S_O := Finset.disjoint_left.2 fun p h1 h2 => by
    rw [mem_filter] at h1 h2; omega
  have hsupp : ∑ p ∈ H, μ p * (termOf P (-Polynomial.X) p).coeff n =
      (∑ p ∈ S_E, μ p * (termOf P (-Polynomial.X) p).coeff n) +
      (∑ p ∈ S_O, μ p * (termOf P (-Polynomial.X) p).coeff n) := by
    rw [← Finset.sum_union hdisj]
    symm
    refine Finset.sum_subset (Finset.union_subset (Finset.filter_subset _ _) (Finset.filter_subset _ _)) ?_
    intro p hp hnot
    have heven : (p.1 + p.2) % 2 = 0 := by
      by_contra hne
      apply hnot
      by_cases hm : p.2 % 2 = 0
      · exact Finset.mem_union_left S_O (Finset.mem_filter.2 ⟨hp, hm, by omega⟩)
      · exact Finset.mem_union_right S_E (Finset.mem_filter.2 ⟨hp, by omega, by omega⟩)
    rw [hpar p heven, zero_mul]
  rw [hsupp, coeff_sub]
  -- Evaluate `S_E` via bijection `(j, a) ↦ (2*j+1, 2*a)`
  have hE_eq : ∑ p ∈ S_E, μ p * (termOf P (-Polynomial.X) p).coeff n =
      ((∑ j ∈ range 251, EPoly μ j * (Polynomial.X * P ^ 2) ^ j) * P).coeff n := by
    have hpoly : (∑ j ∈ range 251, EPoly μ j * (Polynomial.X * P ^ 2) ^ j) * P =
        ∑ j ∈ range 251, ∑ a ∈ range ((250 - j) / 3 + 1),
          Polynomial.C (μ (2 * j + 1, 2 * a)) * termOf P (-Polynomial.X) (2 * j + 1, 2 * a) := by
      rw [Finset.sum_mul]
      refine sum_congr rfl fun j _ => ?_
      unfold EPoly
      rw [Finset.sum_mul, Finset.sum_mul]
      refine sum_congr rfl fun a _ => ?_
      unfold termOf shiftOf
      have hsh : (2 * j + 1) / 2 + 2 * a / 2 = j + a := by omega
      rw [hsh, neg_pow, even_two.mul_right a |>.neg_one_pow, one_mul, mul_pow, ← pow_mul]
      ring
    rw [hpoly, finsetSum_coeff]
    simp_rw [finsetSum_coeff, coeff_C_mul]
    have hsigE : ∑ x ∈ (range 251).sigma (fun j => range ((250 - j) / 3 + 1)),
        μ (2 * x.1 + 1, 2 * x.2) * (termOf P (-Polynomial.X) (2 * x.1 + 1, 2 * x.2)).coeff n =
        ∑ j ∈ range 251, ∑ a ∈ range ((250 - j) / 3 + 1),
          μ (2 * j + 1, 2 * a) * (termOf P (-Polynomial.X) (2 * j + 1, 2 * a)).coeff n :=
      Finset.sum_sigma (range 251) (fun j => range ((250 - j) / 3 + 1))
        (fun x => μ (2 * x.1 + 1, 2 * x.2) * (termOf P (-Polynomial.X) (2 * x.1 + 1, 2 * x.2)).coeff n)
    rw [← hsigE]
    symm
    refine Finset.sum_nbij (fun x => (2 * x.1 + 1, 2 * x.2)) ?_ ?_ ?_ (fun _ _ => rfl)
    · intro x hx
      rw [Finset.mem_sigma, mem_range, mem_range] at hx
      rw [mem_filter, hmemH]
      exact ⟨by omega, by omega, by omega⟩
    · intro x _ y _ heq
      simp only [Prod.mk.injEq] at heq
      exact Sigma.ext (by omega) (heq_of_eq (by omega))
    · intro p hp
      rw [Finset.mem_coe] at hp
      obtain ⟨hp1, hp2, hp3⟩ := Finset.mem_filter.1 hp
      rw [hmemH] at hp1
      refine ⟨⟨p.1 / 2, p.2 / 2⟩, ?_, ?_⟩
      · rw [Finset.mem_coe, Finset.mem_sigma, mem_range, mem_range]; dsimp only; omega
      · ext <;> dsimp only <;> omega
  -- Evaluate `S_O` via bijection `(j, a) ↦ (2*j, 2*a+1)`
  have hO_eq : ∑ p ∈ S_O, μ p * (termOf P (-Polynomial.X) p).coeff n =
      -(Polynomial.X * ∑ j ∈ range 250, OPoly μ j * (Polynomial.X * P ^ 2) ^ j).coeff n := by
    have hpoly : -(Polynomial.X * ∑ j ∈ range 250, OPoly μ j * (Polynomial.X * P ^ 2) ^ j) =
        ∑ j ∈ range 250, ∑ a ∈ range ((249 - j) / 3 + 1),
          Polynomial.C (μ (2 * j, 2 * a + 1)) * termOf P (-Polynomial.X) (2 * j, 2 * a + 1) := by
      rw [Finset.mul_sum, ← Finset.sum_neg_distrib]
      refine sum_congr rfl fun j _ => ?_
      unfold OPoly
      rw [Finset.sum_mul, Finset.mul_sum, ← Finset.sum_neg_distrib]
      refine sum_congr rfl fun a _ => ?_
      unfold termOf shiftOf
      have hsh : 2 * j / 2 + (2 * a + 1) / 2 = j + a := by omega
      rw [hsh, neg_pow, Odd.neg_one_pow ⟨a, rfl⟩, mul_pow, ← pow_mul]
      ring
    rw [← coeff_neg, hpoly, finsetSum_coeff]
    simp_rw [finsetSum_coeff, coeff_C_mul]
    have hsigO : ∑ x ∈ (range 250).sigma (fun j => range ((249 - j) / 3 + 1)),
        μ (2 * x.1, 2 * x.2 + 1) * (termOf P (-Polynomial.X) (2 * x.1, 2 * x.2 + 1)).coeff n =
        ∑ j ∈ range 250, ∑ a ∈ range ((249 - j) / 3 + 1),
          μ (2 * j, 2 * a + 1) * (termOf P (-Polynomial.X) (2 * j, 2 * a + 1)).coeff n :=
      Finset.sum_sigma (range 250) (fun j => range ((249 - j) / 3 + 1))
        (fun x => μ (2 * x.1, 2 * x.2 + 1) * (termOf P (-Polynomial.X) (2 * x.1, 2 * x.2 + 1)).coeff n)
    rw [← hsigO]
    symm
    refine Finset.sum_nbij (fun x => (2 * x.1, 2 * x.2 + 1)) ?_ ?_ ?_ (fun _ _ => rfl)
    · intro x hx
      rw [Finset.mem_sigma, mem_range, mem_range] at hx
      rw [mem_filter, hmemH]
      exact ⟨by omega, by omega, by omega⟩
    · intro x _ y _ heq
      simp only [Prod.mk.injEq] at heq
      exact Sigma.ext (by omega) (heq_of_eq (by omega))
    · intro p hp
      rw [Finset.mem_coe] at hp
      obtain ⟨hp1, hp2, hp3⟩ := Finset.mem_filter.1 hp
      rw [hmemH] at hp1
      refine ⟨⟨p.1 / 2, p.2 / 2⟩, ?_, ?_⟩
      · rw [Finset.mem_coe, Finset.mem_sigma, mem_range, mem_range]; dsimp only; omega
      · ext <;> dsimp only <;> omega
  rw [hE_eq, hO_eq]; ring

/-! ### 7. Channel-level `evalSmoothed`, `eval1D_D80`, `eval1D_D128` soundness -/

private lemma kronRep_qEnc {P : ℝ[X]} {pEnc : ℤ}
    (hP1 : l1 P ≤ 1) (hp : kronRep D80N (D80N : ℝ) 16 P pEnc) :
    l1 (Polynomial.X * P ^ 2) ≤ 1 ∧
    kronRep D80N (D80N : ℝ) 300 (Polynomial.X * P ^ 2) (kronMul (trunc251 (iMul B1I pEnc)) pEnc) := by
  have hXP1 : l1 (Polynomial.X * P) ≤ 1 := by
    exact (l1_mul_le _ _).trans (by rw [l1_X, one_mul]; exact hP1)
  have hQ1 : l1 (Polynomial.X * P ^ 2) ≤ 1 := by
    rw [sq, ← mul_assoc]
    exact (l1_mul_le _ _).trans (by nlinarith [l1_nonneg (Polynomial.X * P), l1_nonneg P])
  have hD80_safe : (D80N : ℝ) ≤ ((B1I / 4 : ℤ) : ℝ) := by
    have h1 : B1I / 4 = (2 : ℤ) ^ 222 := by unfold B1I; rw [B1N_eq]; norm_num
    rw [h1, D80N_eq]; norm_num
  have hsh := kronRep_shiftX hp hD80_safe
  have hmul := kronRep_kronMul_D80 hsh hp hP1
  refine ⟨hQ1, ?_⟩
  rw [show Polynomial.X * P ^ 2 = Polynomial.X * P * P by ring]
  exact hmul.mono le_rfl (by norm_num)

private lemma kronRep_evalSmoothed {rows : List RowI} {μ : ℕ × ℕ → ℝ} {P : ℝ[X]} {pEnc : ℤ}
    (hshape : checkRowsShape 168 (revL rows []) 0 = true)
    (hmem : ∀ r ∈ rows, ∀ e ∈ r.2, mem (μ (e.1, r.1)) e.2)
    (hP1 : l1 P ≤ 1) (hp : kronRep D80N (D80N : ℝ) 16 P pEnc) :
    let (evN, odN) := packRowsNat (revL rows []) [] []
    let revO := chunk16Rev 16 (natListToIntAcc evN []) []
    let revE := chunk16Rev 16 (natListToIntAcc odN []) []
    kronRep D80N (2 * (D80N : ℝ)) 1100000
      ((∑ j ∈ range 251, EPoly μ j * (Polynomial.X * P ^ 2) ^ j) * P -
       Polynomial.X * ∑ j ∈ range 250, OPoly μ j * (Polynomial.X * P ^ 2) ^ j)
      (evalSmoothed revE revO pEnc) := by
  have hpack := packRowsNat_kronRep hshape hmem
  generalize hp_eq : packRowsNat (revL rows []) [] [] = evod at hpack ⊢
  obtain ⟨evN, odN⟩ := evod
  dsimp only at hpack ⊢
  obtain ⟨hevL, hodL, ME, EE, MO, EO, hME, hEE, hMO, hEO, hE, hO, hMEsum, hMOsum, hEEsum, hEOsum⟩ := hpack
  obtain ⟨hQ1, hqEnc⟩ := kronRep_qEnc hP1 hp
  have hbp := kronRep_buildPows16L hQ1 hqEnc
  unfold evalSmoothed
  dsimp only
  generalize hbp_eq : buildPows16L (kronMul (trunc251 (iMul B1I pEnc)) pEnc) = qp at hbp ⊢
  obtain ⟨qows16, q16⟩ := qp
  dsimp only at hbp ⊢
  obtain ⟨hqlen, hqows, hq16⟩ := hbp
  -- Evaluate `sE`
  let xsE : List ℤ := natListToIntAcc odN []
  have hxsE_eq : xsE = odN.map Int.ofNat := by simp [xsE, natListToIntAcc_eq]
  have hxsE_len : xsE.length = 251 := by rw [hxsE_eq, List.length_map, hodL]
  let CsE : List ℝ[X] := (List.range 251).map (EPoly μ)
  have hsE : kronRep D80N (D80N : ℝ) 200000
      (∑ j ∈ range 251, EPoly μ j * (Polynomial.X * P ^ 2) ^ j)
      (hornerD128 qows16 q16 (chunk16Rev 16 xsE []) 0) := by
    have h := kronRep_hornerD128 (Q := Polynomial.X * P ^ 2) hQ1 hqlen hqows hq16
      (xs := xsE) (Cs := CsE) (Ms := ME) (Es := EE)
      (by omega) (by simp [CsE, hxsE_len]) (by omega) (by omega)
      (fun k hk => by
        have hk' : k < 251 := by omega
        have hgetC : CsE.getD k 0 = EPoly μ k := getD_map_range _ _ _ _ hk'
        have hgetX : xsE.getD k 0 = Int.ofNat (odN.getD k 0) := by
          rw [hxsE_eq]; simp [List.getD_eq_getElem?_getD, List.getElem?_map,
            List.getElem?_eq_getElem (by omega : k < odN.length)]
        rw [hgetC, hgetX]; exact (hE k hk').2)
      (fun k hk => (hE k (by omega)).1)
      (by rw [hxsE_len]; exact hMEsum)
      (by rw [hxsE_len]; exact hEEsum)
    have hsum_eq : ∑ k ∈ range xsE.length, CsE.getD k 0 * (Polynomial.X * P ^ 2) ^ k =
        ∑ j ∈ range 251, EPoly μ j * (Polynomial.X * P ^ 2) ^ j := by
      rw [hxsE_len]
      refine sum_congr rfl fun j hj => ?_
      rw [getD_map_range (EPoly μ) 251 j 0 (mem_range.1 hj)]
    rwa [hsum_eq] at h
  -- Evaluate `sO`
  let xsO : List ℤ := natListToIntAcc evN []
  have hxsO_eq : xsO = evN.map Int.ofNat := by simp [xsO, natListToIntAcc_eq]
  have hxsO_len : xsO.length = 250 := by rw [hxsO_eq, List.length_map, hevL]
  let CsO : List ℝ[X] := (List.range 250).map (OPoly μ)
  have hsO : kronRep D80N (D80N : ℝ) 200000
      (∑ j ∈ range 250, OPoly μ j * (Polynomial.X * P ^ 2) ^ j)
      (hornerD128 qows16 q16 (chunk16Rev 16 xsO []) 0) := by
    have h := kronRep_hornerD128 (Q := Polynomial.X * P ^ 2) hQ1 hqlen hqows hq16
      (xs := xsO) (Cs := CsO) (Ms := MO) (Es := EO)
      (by omega) (by simp [CsO, hxsO_len]) (by omega) (by omega)
      (fun k hk => by
        have hk' : k < 250 := by omega
        have hgetC : CsO.getD k 0 = OPoly μ k := getD_map_range _ _ _ _ hk'
        have hgetX : xsO.getD k 0 = Int.ofNat (evN.getD k 0) := by
          rw [hxsO_eq]; simp [List.getD_eq_getElem?_getD, List.getElem?_map,
            List.getElem?_eq_getElem (by omega : k < evN.length)]
        rw [hgetC, hgetX]; exact (hO k hk').2)
      (fun k hk => (hO k (by omega)).1)
      (by rw [hxsO_len]; exact hMOsum)
      (by rw [hxsO_len]; exact hEOsum)
    have hsum_eq : ∑ k ∈ range xsO.length, CsO.getD k 0 * (Polynomial.X * P ^ 2) ^ k =
        ∑ j ∈ range 250, OPoly μ j * (Polynomial.X * P ^ 2) ^ j := by
      rw [hxsO_len]
      refine sum_congr rfl fun j hj => ?_
      rw [getD_map_range (OPoly μ) 250 j 0 (mem_range.1 hj)]
    rwa [hsum_eq] at h
  have h1 := kronRep_kronMul_D80 hsE hp hP1
  have hD80_safe : (D80N : ℝ) ≤ ((B1I / 4 : ℤ) : ℝ) := by
    have h1' : B1I / 4 = (2 : ℤ) ^ 222 := by unfold B1I; rw [B1N_eq]; norm_num
    rw [h1', D80N_eq]; norm_num
  have h2 := kronRep_shiftX hsO hD80_safe
  exact (kronRep_sub h1 h2).mono (by ring_nf; rfl) (by norm_num)

private lemma kronRep_eval1D_haag {P : ℝ[X]} {pEnc : ℤ}
    (hsum_ok : Nat.ble (sumNatAbs haagMu80 0) D80N = true)
    (hP1 : l1 P ≤ 1) (hp : kronRep D80N (D80N : ℝ) 16 P pEnc) :
    kronRep D80N (2 * (D80N : ℝ)) 1100000
      (∑ k ∈ range 251, Polynomial.C (haagCoeff k) * (Polynomial.X ^ k * P ^ (2 * k + 1)))
      (eval1D_D80 (chunk16Rev 16 haagMu80 []) pEnc) := by
  obtain ⟨hQ1, hqEnc⟩ := kronRep_qEnc hP1 hp
  have hbp := kronRep_buildPows16L hQ1 hqEnc
  unfold eval1D_D80
  dsimp only
  generalize hbp_eq : buildPows16L (kronMul (trunc251 (iMul B1I pEnc)) pEnc) = qp at hbp ⊢
  obtain ⟨qows16, q16⟩ := qp
  dsimp only at hbp ⊢
  obtain ⟨hqlen, hqows, hq16⟩ := hbp
  obtain ⟨hL, hpt⟩ := haagMu80_spec
  let Cs : List ℝ[X] := (List.range 251).map fun (k : ℕ) => Polynomial.C (haagCoeff k)
  let Ms : List ℝ := (List.range 251).map fun (k : ℕ) => |(haagMu80.getD k 0 : ℝ)|
  let Es : List ℝ := (List.range 251).map fun (k : ℕ) => (3025 : ℝ) + (k : ℝ)
  have hMsum : ∑ k ∈ range haagMu80.length, Ms.getD k 0 ≤ (D80N : ℝ) := by
    have h1 : (sumNatAbs haagMu80 0 : ℝ) ≤ (D80N : ℝ) := by
      exact_mod_cast nat_ble_iff.1 hsum_ok
    rw [sumNatAbs_eq, Nat.cast_zero, zero_add] at h1
    refine (le_of_eq ?_).trans h1
    refine sum_congr rfl fun k hk => ?_
    have hk' : k < 251 := by rw [hL] at hk; exact mem_range.1 hk
    exact getD_map_range _ 251 k 0 hk'
  have hEsum : ∑ k ∈ range haagMu80.length, Es.getD k 0 ≤ 800000 := by
    rw [hL]
    have h1 : ∑ k ∈ range 251, Es.getD k 0 = ∑ k ∈ range 251, (3025 + (k : ℝ)) :=
      sum_congr rfl fun k hk => getD_map_range _ 251 k 0 (mem_range.1 hk)
    rw [h1]
    calc ∑ k ∈ range 251, (3025 + (k : ℝ))
        = (∑ _k ∈ range 251, (3025 : ℝ)) + ∑ k ∈ range 251, (k : ℝ) := sum_add_distrib
      _ = 251 * 3025 + ((∑ k ∈ range 251, k : ℕ) : ℝ) := by simp [Finset.sum_const]
      _ ≤ 800000 := by
          have hsum : ∑ k ∈ range 251, k = 31375 := by rw [Finset.sum_range_id]
          rw [hsum]; norm_num
  have hs := kronRep_hornerD80 (Q := Polynomial.X * P ^ 2) hQ1 hqlen hqows hq16
    (xs := haagMu80) (Cs := Cs) (Ms := Ms) (Es := Es)
    (by omega) (by simp [Cs, hL]) (by simp [Ms, hL]) (by simp [Es, hL])
    (fun k hk => by
      have hk' : k < 251 := by omega
      rw [getD_map_range _ 251 k 0 hk', getD_map_range _ 251 k 0 hk', getD_map_range _ 251 k 0 hk']
      exact (kronRep_const D80N (haagCoeff k) (haagMu80.getD k 0)).mono le_rfl (hpt k hk').2)
    (fun k hk => by
      have hk' : k < 251 := by omega
      rw [getD_map_range _ 251 k 0 hk']; exact abs_nonneg _)
    hMsum hEsum
  have hmul := kronRep_kronMul_D80 hs hp hP1
  have hpoly_eq : (∑ k ∈ range haagMu80.length, Cs.getD k 0 * (Polynomial.X * P ^ 2) ^ k) * P =
      ∑ k ∈ range 251, Polynomial.C (haagCoeff k) * (Polynomial.X ^ k * P ^ (2 * k + 1)) := by
    rw [hL, Finset.sum_mul]
    refine sum_congr rfl fun k hk => ?_
    rw [getD_map_range _ 251 k 0 (mem_range.1 hk), mul_pow, ← pow_mul, pow_succ]; ring
  rw [hpoly_eq] at hmul
  exact hmul.mono (by linarith [show (0 : ℝ) ≤ (D80N : ℝ) by positivity]) (by norm_num)

private lemma kronRep_eval1D_tig {tigMu : List Ival} {ν : ℕ → ℝ} {P : ℝ[X]} {pEnc : ℤ}
    (htig_ok : checkTigMu 251 tigMu 0 = true)
    (hν : ∀ k < 251, mem (ν k) (tigMu.getD k zeroI))
    (hP1 : l1 P ≤ 1) (hp : kronRep D80N (D80N : ℝ) 16 P pEnc) :
    kronRep D80N (2 * (D80N : ℝ)) 1100000
      (∑ k ∈ range 251, Polynomial.C (ν k) * (Polynomial.X ^ k * P ^ (2 * k + 1)))
      (eval1D_D128 (chunk16Rev 16 (tigMu128Acc tigMu []) []) pEnc) := by
  obtain ⟨hQ1, hqEnc⟩ := kronRep_qEnc hP1 hp
  have hbp := kronRep_buildPows16L hQ1 hqEnc
  unfold eval1D_D128
  dsimp only
  generalize hbp_eq : buildPows16L (kronMul (trunc251 (iMul B1I pEnc)) pEnc) = qp at hbp ⊢
  obtain ⟨qows16, q16⟩ := qp
  dsimp only at hbp ⊢
  obtain ⟨hqlen, hqows, hq16⟩ := hbp
  obtain ⟨hL, hpt, hMsum⟩ := checkTigMu_spec htig_ok
  simp only [Nat.cast_zero, zero_add] at hMsum
  let xs : List ℤ := tigMu128Acc tigMu []
  have hxs_eq : xs = tigMu.map Ival.lo := by simp [xs, tigMu128Acc_eq]
  have hxs_len : xs.length = 251 := by rw [hxs_eq, List.length_map, hL]
  let Cs : List ℝ[X] := (List.range 251).map fun k => Polynomial.C (ν k)
  let Ms : List ℝ := (List.range 251).map fun k => |((tigMu.getD k zeroI).lo : ℝ)|
  let Es : List ℝ := (List.range 251).map fun _ => (D48N : ℝ)
  have hs := kronRep_hornerD128 (Q := Polynomial.X * P ^ 2) hQ1 hqlen hqows hq16
    (xs := xs) (Cs := Cs) (Ms := Ms) (Es := Es)
    (by omega) (by simp [Cs, hxs_len]) (by simp [Ms, hxs_len]) (by simp [Es, hxs_len])
    (fun k hk => by
      have hk' : k < 251 := by omega
      have hgetX : xs.getD k 0 = (tigMu.getD k zeroI).lo := by
        rw [hxs_eq]
        simp [List.getD_eq_getElem?_getD, List.getElem?_map,
          List.getElem?_eq_getElem (by omega : k < tigMu.length)]
      rw [hgetX, getD_map_range _ 251 k 0 hk', getD_map_range _ 251 k 0 hk',
        getD_map_range _ 251 k 0 hk']
      have herr : |ν k * (D128N : ℝ) - ((tigMu.getD k zeroI).lo : ℝ)| ≤ (D48N : ℝ) := by
        obtain ⟨h1, h2⟩ := hν k hk'
        rw [← D128_eq_D] at h1 h2
        have hwidR : ((tigMu.getD k zeroI).hi : ℝ) - ((tigMu.getD k zeroI).lo : ℝ) ≤ (D48N : ℝ) := by
          exact_mod_cast (hpt k hk').2
        rw [abs_le]; constructor <;> linarith
      exact (kronRep_const D128N (ν k) (tigMu.getD k zeroI).lo).mono le_rfl herr)
    (fun k hk => by
      have hk' : k < 251 := by omega
      rw [getD_map_range _ 251 k 0 hk']; exact abs_nonneg _)
    (by
      rw [hxs_len]
      refine (le_of_eq ?_).trans hMsum
      refine sum_congr rfl fun k hk => getD_map_range _ 251 k 0 (mem_range.1 hk))
    (by
      rw [hxs_len]
      have h1 : ∑ k ∈ range 251, Es.getD k 0 = 251 * (D48N : ℝ) := by
        have hcongr : ∑ k ∈ range 251, Es.getD k 0 = ∑ _k ∈ range 251, (D48N : ℝ) :=
          sum_congr rfl fun k hk => getD_map_range _ 251 k 0 (mem_range.1 hk)
        rw [hcongr, Finset.sum_const, Finset.card_range, nsmul_eq_mul, Nat.cast_ofNat]
      rw [h1]; linarith [show (0 : ℝ) ≤ (D48N : ℝ) by positivity])
  have hmul := kronRep_kronMul_D80 hs hp hP1
  have hpoly_eq : (∑ k ∈ range xs.length, Cs.getD k 0 * (Polynomial.X * P ^ 2) ^ k) * P =
      ∑ k ∈ range 251, Polynomial.C (ν k) * (Polynomial.X ^ k * P ^ (2 * k + 1)) := by
    rw [hxs_len, Finset.sum_mul]
    refine sum_congr rfl fun k hk => ?_
    rw [getD_map_range _ 251 k 0 (mem_range.1 hk), mul_pow, ← pow_mul, pow_succ]; ring
  rw [hpoly_eq] at hmul
  exact hmul.mono (by linarith [show (0 : ℝ) ≤ (D80N : ℝ) by positivity]) (by norm_num)

/-! ### 8. Master soundness theorems: `head_residual_of_fastHeadOK` and `convex_transfer_head` -/

private lemma abs_add6_le (a0 a1 a2 a3 a4 a5 : ℝ) :
    |a0 + a1 + a2 + a3 + a4 + a5| ≤ |a0| + |a1| + |a2| + |a3| + |a4| + |a5| := by
  linarith [abs_add_le (a0 + a1 + a2 + a3 + a4) a5, abs_add_le (a0 + a1 + a2 + a3) a4,
    abs_add_le (a0 + a1 + a2) a3, abs_add_le (a0 + a1) a2, abs_add_le a0 a1]

private lemma kronRep_comb6 {w0 w1 w2 w3 w4 w5 wDen : ℕ}
    (hwDen_pos : 0 < wDen) (hwDen_le_D80 : wDen ≤ D80N)
    (hw_eq_nat : w0 + w1 + w2 + w3 + w4 + w5 = wDen)
    {F0 F1 F2 F3 F4 F5 : ℝ[X]} {z0 z1 z2 z3 z4 z5 : ℤ}
    (hrep0 : kronRep D80N (2 * (D80N : ℝ)) 1100000 F0 z0)
    (hrep1 : kronRep D80N (2 * (D80N : ℝ)) 1100000 F1 z1)
    (hrep2 : kronRep D80N (2 * (D80N : ℝ)) 1100000 F2 z2)
    (hrep3 : kronRep D80N (2 * (D80N : ℝ)) 1100000 F3 z3)
    (hrep4 : kronRep D80N (2 * (D80N : ℝ)) 1100000 F4 z4)
    (hrep5 : kronRep D80N (2 * (D80N : ℝ)) 1100000 F5 z5) :
    kronRep D80N (2 * (D80N : ℝ)) 1100251
      (Polynomial.C ((w0 : ℝ) / wDen) * F0 + Polynomial.C ((w1 : ℝ) / wDen) * F1 +
       Polynomial.C ((w2 : ℝ) / wDen) * F2 + Polynomial.C ((w3 : ℝ) / wDen) * F3 +
       Polynomial.C ((w4 : ℝ) / wDen) * F4 + Polynomial.C ((w5 : ℝ) / wDen) * F5)
      (sd8 (iAdd (iMul (Int.ofNat w0) z0)
           (iAdd (iMul (Int.ofNat w1) z1)
           (iAdd (iMul (Int.ofNat w2) z2)
           (iAdd (iMul (Int.ofNat w3) z3)
           (iAdd (iMul (Int.ofNat w4) z4)
                 (iMul (Int.ofNat w5) z5)))))) wDen) := by
  have hwDen_R : (0 : ℝ) < (wDen : ℝ) := by exact_mod_cast hwDen_pos
  obtain ⟨Q0, hs0, hev0, hm0, he0⟩ := hrep0
  obtain ⟨Q1, hs1, hev1, hm1, he1⟩ := hrep1
  obtain ⟨Q2, hs2, hev2, hm2, he2⟩ := hrep2
  obtain ⟨Q3, hs3, hev3, hm3, he3⟩ := hrep3
  obtain ⟨Q4, hs4, hev4, hm4, he4⟩ := hrep4
  obtain ⟨Q5, hs5, hev5, hm5, he5⟩ := hrep5
  let Qw : ℤ[X] :=
    Polynomial.C (Int.ofNat w0) * Q0 + Polynomial.C (Int.ofNat w1) * Q1 +
    Polynomial.C (Int.ofNat w2) * Q2 + Polynomial.C (Int.ofNat w3) * Q3 +
    Polynomial.C (Int.ofNat w4) * Q4 + Polynomial.C (Int.ofNat w5) * Q5
  let Fcomb : ℝ[X] :=
    Polynomial.C ((w0 : ℝ) / wDen) * F0 + Polynomial.C ((w1 : ℝ) / wDen) * F1 +
    Polynomial.C ((w2 : ℝ) / wDen) * F2 + Polynomial.C ((w3 : ℝ) / wDen) * F3 +
    Polynomial.C ((w4 : ℝ) / wDen) * F4 + Polynomial.C ((w5 : ℝ) / wDen) * F5
  have hQw_supp : ∀ j ≥ 251, Qw.coeff j = 0 := fun j hj => by
    simp only [Qw, coeff_add, coeff_C_mul, hs0 j hj, hs1 j hj, hs2 j hj, hs3 j hj, hs4 j hj, hs5 j hj]
    ring
  have hQw_ev : Qw.eval B1I =
      iAdd (iMul (Int.ofNat w0) z0)
      (iAdd (iMul (Int.ofNat w1) z1)
      (iAdd (iMul (Int.ofNat w2) z2)
      (iAdd (iMul (Int.ofNat w3) z3)
      (iAdd (iMul (Int.ofNat w4) z4)
            (iMul (Int.ofNat w5) z5))))) := by
    simp only [iAdd_eq, iMul_eq, Qw, eval_add, eval_mul, eval_C, hev0, hev1, hev2, hev3, hev4, hev5]
    ring
  have hterm_m : ∀ (wk : ℕ) (Qk : ℤ[X]),
      (∑ j ∈ range 251, |(Qk.coeff j : ℝ)|) ≤ 2 * (D80N : ℝ) →
      (∑ j ∈ range 251, |((Polynomial.C (Int.ofNat wk) * Qk).coeff j : ℝ)|) ≤ (wk : ℝ) * (2 * (D80N : ℝ)) := by
    intro wk Qk hmk
    calc ∑ j ∈ range 251, |((Polynomial.C (Int.ofNat wk) * Qk).coeff j : ℝ)|
        = (wk : ℝ) * ∑ j ∈ range 251, |(Qk.coeff j : ℝ)| := by
          rw [mul_sum]; refine sum_congr rfl fun j _ => ?_
          rw [coeff_C_mul, Int.cast_mul, abs_mul]
          have : ((Int.ofNat wk : ℤ) : ℝ) = (wk : ℝ) := rfl
          rw [this, abs_of_nonneg (Nat.cast_nonneg _)]
      _ ≤ (wk : ℝ) * (2 * (D80N : ℝ)) := mul_le_mul_of_nonneg_left hmk (Nat.cast_nonneg _)
  have hwR_sum : (w0 : ℝ) + (w1 : ℝ) + (w2 : ℝ) + (w3 : ℝ) + (w4 : ℝ) + (w5 : ℝ) = (wDen : ℝ) := by
    exact_mod_cast hw_eq_nat
  have hQw_m : ∑ j ∈ range 251, |(Qw.coeff j : ℝ)| ≤ (wDen : ℝ) * (2 * (D80N : ℝ)) := by
    have htri : ∀ j, |(Qw.coeff j : ℝ)| ≤
        |((Polynomial.C (Int.ofNat w0) * Q0).coeff j : ℝ)| +
        |((Polynomial.C (Int.ofNat w1) * Q1).coeff j : ℝ)| +
        |((Polynomial.C (Int.ofNat w2) * Q2).coeff j : ℝ)| +
        |((Polynomial.C (Int.ofNat w3) * Q3).coeff j : ℝ)| +
        |((Polynomial.C (Int.ofNat w4) * Q4).coeff j : ℝ)| +
        |((Polynomial.C (Int.ofNat w5) * Q5).coeff j : ℝ)| := fun j => by
      simp only [Qw, coeff_add, Int.cast_add]
      exact abs_add6_le _ _ _ _ _ _
    calc ∑ j ∈ range 251, |(Qw.coeff j : ℝ)|
        ≤ (∑ j ∈ range 251, |((Polynomial.C (Int.ofNat w0) * Q0).coeff j : ℝ)|) +
          (∑ j ∈ range 251, |((Polynomial.C (Int.ofNat w1) * Q1).coeff j : ℝ)|) +
          (∑ j ∈ range 251, |((Polynomial.C (Int.ofNat w2) * Q2).coeff j : ℝ)|) +
          (∑ j ∈ range 251, |((Polynomial.C (Int.ofNat w3) * Q3).coeff j : ℝ)|) +
          (∑ j ∈ range 251, |((Polynomial.C (Int.ofNat w4) * Q4).coeff j : ℝ)|) +
          (∑ j ∈ range 251, |((Polynomial.C (Int.ofNat w5) * Q5).coeff j : ℝ)|) := by
            simp only [← sum_add_distrib]; exact sum_le_sum fun j _ => htri j
      _ ≤ (w0 : ℝ) * (2 * (D80N : ℝ)) + (w1 : ℝ) * (2 * (D80N : ℝ)) +
          (w2 : ℝ) * (2 * (D80N : ℝ)) + (w3 : ℝ) * (2 * (D80N : ℝ)) +
          (w4 : ℝ) * (2 * (D80N : ℝ)) + (w5 : ℝ) * (2 * (D80N : ℝ)) :=
            add_le_add (add_le_add (add_le_add (add_le_add (add_le_add
              (hterm_m w0 Q0 hm0) (hterm_m w1 Q1 hm1)) (hterm_m w2 Q2 hm2))
              (hterm_m w3 Q3 hm3)) (hterm_m w4 Q4 hm4)) (hterm_m w5 Q5 hm5)
      _ = (wDen : ℝ) * (2 * (D80N : ℝ)) := by rw [← hwR_sum]; ring
  have hQw_safe : (wDen : ℝ) * (2 * (D80N : ℝ)) ≤ ((B1I / 4 : ℤ) : ℝ) := by
    have h1 : (wDen : ℝ) ≤ (D80N : ℝ) := by exact_mod_cast hwDen_le_D80
    have h2 : (D80N : ℝ) * (2 * (D80N : ℝ)) ≤ ((B1I / 4 : ℤ) : ℝ) := by
      have := two_D160_le_B1_div4; linarith
    exact (mul_le_mul_of_nonneg_right h1 (by positivity)).trans h2
  have hterm_e : ∀ (wk : ℕ) (Fk : ℝ[X]) (Qk : ℤ[X]),
      (∑ j ∈ range 251, |Fk.coeff j * (D80N : ℝ) - (Qk.coeff j : ℝ)|) ≤ 1100000 →
      (∑ j ∈ range 251,
        |(Polynomial.C ((wk : ℝ) / wDen) * Fk).coeff j * ((D80N : ℝ) * (wDen : ℝ)) -
          ((Polynomial.C (Int.ofNat wk) * Qk).coeff j : ℝ)|) ≤ (wk : ℝ) * 1100000 := by
    intro wk Fk Qk hek
    calc ∑ j ∈ range 251,
          |(Polynomial.C ((wk : ℝ) / wDen) * Fk).coeff j * ((D80N : ℝ) * (wDen : ℝ)) -
            ((Polynomial.C (Int.ofNat wk) * Qk).coeff j : ℝ)|
        = (wk : ℝ) * ∑ j ∈ range 251, |Fk.coeff j * (D80N : ℝ) - (Qk.coeff j : ℝ)| := by
          rw [mul_sum]; refine sum_congr rfl fun j _ => ?_
          rw [coeff_C_mul, coeff_C_mul, Int.cast_mul]
          have hwcast : ((Int.ofNat wk : ℤ) : ℝ) = (wk : ℝ) := rfl
          rw [hwcast]
          have heq : (wk : ℝ) / (wDen : ℝ) * Fk.coeff j * ((D80N : ℝ) * (wDen : ℝ)) -
              (wk : ℝ) * (Qk.coeff j : ℝ) = (wk : ℝ) * (Fk.coeff j * (D80N : ℝ) - (Qk.coeff j : ℝ)) := by
            field_simp
          rw [heq, abs_mul, abs_of_nonneg (Nat.cast_nonneg _)]
      _ ≤ (wk : ℝ) * 1100000 := mul_le_mul_of_nonneg_left hek (Nat.cast_nonneg _)
  have hQw_e : ∑ j ∈ range 251, |Fcomb.coeff j * ((D80N : ℝ) * (wDen : ℝ)) - (Qw.coeff j : ℝ)| ≤
      (wDen : ℝ) * 1100000 := by
    have htri : ∀ j, |Fcomb.coeff j * ((D80N : ℝ) * (wDen : ℝ)) - (Qw.coeff j : ℝ)| ≤
        |(Polynomial.C ((w0 : ℝ) / wDen) * F0).coeff j * ((D80N : ℝ) * (wDen : ℝ)) - ((Polynomial.C (Int.ofNat w0) * Q0).coeff j : ℝ)| +
        |(Polynomial.C ((w1 : ℝ) / wDen) * F1).coeff j * ((D80N : ℝ) * (wDen : ℝ)) - ((Polynomial.C (Int.ofNat w1) * Q1).coeff j : ℝ)| +
        |(Polynomial.C ((w2 : ℝ) / wDen) * F2).coeff j * ((D80N : ℝ) * (wDen : ℝ)) - ((Polynomial.C (Int.ofNat w2) * Q2).coeff j : ℝ)| +
        |(Polynomial.C ((w3 : ℝ) / wDen) * F3).coeff j * ((D80N : ℝ) * (wDen : ℝ)) - ((Polynomial.C (Int.ofNat w3) * Q3).coeff j : ℝ)| +
        |(Polynomial.C ((w4 : ℝ) / wDen) * F4).coeff j * ((D80N : ℝ) * (wDen : ℝ)) - ((Polynomial.C (Int.ofNat w4) * Q4).coeff j : ℝ)| +
        |(Polynomial.C ((w5 : ℝ) / wDen) * F5).coeff j * ((D80N : ℝ) * (wDen : ℝ)) - ((Polynomial.C (Int.ofNat w5) * Q5).coeff j : ℝ)| := fun j => by
      have heq : Fcomb.coeff j * ((D80N : ℝ) * (wDen : ℝ)) - (Qw.coeff j : ℝ) =
          ((Polynomial.C ((w0 : ℝ) / wDen) * F0).coeff j * ((D80N : ℝ) * (wDen : ℝ)) - ((Polynomial.C (Int.ofNat w0) * Q0).coeff j : ℝ)) +
          ((Polynomial.C ((w1 : ℝ) / wDen) * F1).coeff j * ((D80N : ℝ) * (wDen : ℝ)) - ((Polynomial.C (Int.ofNat w1) * Q1).coeff j : ℝ)) +
          ((Polynomial.C ((w2 : ℝ) / wDen) * F2).coeff j * ((D80N : ℝ) * (wDen : ℝ)) - ((Polynomial.C (Int.ofNat w2) * Q2).coeff j : ℝ)) +
          ((Polynomial.C ((w3 : ℝ) / wDen) * F3).coeff j * ((D80N : ℝ) * (wDen : ℝ)) - ((Polynomial.C (Int.ofNat w3) * Q3).coeff j : ℝ)) +
          ((Polynomial.C ((w4 : ℝ) / wDen) * F4).coeff j * ((D80N : ℝ) * (wDen : ℝ)) - ((Polynomial.C (Int.ofNat w4) * Q4).coeff j : ℝ)) +
          ((Polynomial.C ((w5 : ℝ) / wDen) * F5).coeff j * ((D80N : ℝ) * (wDen : ℝ)) - ((Polynomial.C (Int.ofNat w5) * Q5).coeff j : ℝ)) := by
        simp only [Fcomb, Qw, coeff_add, Int.cast_add]; ring
      rw [heq]; exact abs_add6_le _ _ _ _ _ _
    calc ∑ j ∈ range 251, |Fcomb.coeff j * ((D80N : ℝ) * (wDen : ℝ)) - (Qw.coeff j : ℝ)|
        ≤ (∑ j ∈ range 251, |(Polynomial.C ((w0 : ℝ) / wDen) * F0).coeff j * ((D80N : ℝ) * (wDen : ℝ)) - ((Polynomial.C (Int.ofNat w0) * Q0).coeff j : ℝ)|) +
          (∑ j ∈ range 251, |(Polynomial.C ((w1 : ℝ) / wDen) * F1).coeff j * ((D80N : ℝ) * (wDen : ℝ)) - ((Polynomial.C (Int.ofNat w1) * Q1).coeff j : ℝ)|) +
          (∑ j ∈ range 251, |(Polynomial.C ((w2 : ℝ) / wDen) * F2).coeff j * ((D80N : ℝ) * (wDen : ℝ)) - ((Polynomial.C (Int.ofNat w2) * Q2).coeff j : ℝ)|) +
          (∑ j ∈ range 251, |(Polynomial.C ((w3 : ℝ) / wDen) * F3).coeff j * ((D80N : ℝ) * (wDen : ℝ)) - ((Polynomial.C (Int.ofNat w3) * Q3).coeff j : ℝ)|) +
          (∑ j ∈ range 251, |(Polynomial.C ((w4 : ℝ) / wDen) * F4).coeff j * ((D80N : ℝ) * (wDen : ℝ)) - ((Polynomial.C (Int.ofNat w4) * Q4).coeff j : ℝ)|) +
          (∑ j ∈ range 251, |(Polynomial.C ((w5 : ℝ) / wDen) * F5).coeff j * ((D80N : ℝ) * (wDen : ℝ)) - ((Polynomial.C (Int.ofNat w5) * Q5).coeff j : ℝ)|) := by
            simp only [← sum_add_distrib]; exact sum_le_sum fun j _ => htri j
      _ ≤ (w0 : ℝ) * 1100000 + (w1 : ℝ) * 1100000 + (w2 : ℝ) * 1100000 +
          (w3 : ℝ) * 1100000 + (w4 : ℝ) * 1100000 + (w5 : ℝ) * 1100000 :=
            add_le_add (add_le_add (add_le_add (add_le_add (add_le_add
              (hterm_e w0 F0 Q0 he0) (hterm_e w1 F1 Q1 he1)) (hterm_e w2 F2 Q2 he2))
              (hterm_e w3 F3 Q3 he3)) (hterm_e w4 F4 Q4 he4)) (hterm_e w5 F5 Q5 he5)
      _ = (wDen : ℝ) * 1100000 := by rw [← hwR_sum]; ring
  have hQw_bnd : ∀ j < 251, |Qw.coeff j| ≤ B1I / 4 := fun j hj =>
    int_abs_le_B1_div4 ((coeff_abs_le_of_sum_abs_le hQw_m hj).trans hQw_safe)
  have htr_id : trunc251 (Qw.eval B1I) = Qw.eval B1I := by
    rw [trunc251_eval hQw_bnd]
    congr 1; ext j; rw [coeff_polyTrunc]
    by_cases hlt : j < 251
    · rw [ite_eq_left hlt]
    · rw [ite_eq_right hlt, hQw_supp j (by omega)]
  have h := kronRep_of_sd8_trunc251 (S_out := D80N) (den := wDen) hwDen_pos hQw_m hQw_safe hQw_e
  rw [htr_id, hQw_ev] at h
  refine h.mono ?_ ?_
  · rw [mul_div_cancel_left₀ _ (ne_of_gt hwDen_R)]
  · rw [mul_div_cancel_left₀ _ (ne_of_gt hwDen_R)]; norm_num

/-- **Main Kronecker soundness theorem**: if `fastHeadOK ... = true` and the tables enclose
`μ_sm` (smoothed 2D channel) and `ν_tig` (1D antisymmetric channel), then the 251-term weighted
6-channel head residual is bounded by `capNum / capDen`. -/
theorem head_residual_of_fastHeadOK
    {rows : List RowI} {tigMu : List Ival}
    {p0 p1 p2 r3 r4 p5 : List (Nat × Int)}
    {d0 d1 d2 d3 d4 d5 : ℕ}
    {w0 w1 w2 w3 w4 w5 wDen cNum cDen capNum capDen : ℕ}
    (hok : fastHeadOK rows tigMu p0 p1 p2 r3 r4 p5 d0 d1 d2 d3 d4 d5
      w0 w1 w2 w3 w4 w5 wDen cNum cDen capNum capDen = true)
    {μ_sm : ℕ × ℕ → ℝ} {ν_tig : ℕ → ℝ}
    (hpar : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → μ_sm p = 0)
    (hrows_mem : ∀ r ∈ rows, ∀ e ∈ r.2, mem (μ_sm (e.1, r.1)) e.2)
    (htig_mem : ∀ k < 251, mem (ν_tig k) (tigMu.getD k zeroI))
    {w : Fin 6 → ℝ}
    (hw : w 0 = (w0 : ℝ) / wDen ∧ w 1 = (w1 : ℝ) / wDen ∧ w 2 = (w2 : ℝ) / wDen ∧
      w 3 = (w3 : ℝ) / wDen ∧ w 4 = (w4 : ℝ) / wDen ∧ w 5 = (w5 : ℝ) / wDen)
    {h : Fin 6 → ℕ → ℝ}
    (hh0 : ∀ n < 251, h 0 n = bivarKernel (sparsePoly p0 d0) (-Polynomial.X) μ_sm n)
    (hh1 : ∀ n < 251, h 1 n = bivarKernel (sparsePoly p1 d1) (-Polynomial.X) μ_sm n)
    (hh2 : ∀ n < 251, h 2 n = bivarKernel (sparsePoly p2 d2) 0 (onedTable haagCoeff) n)
    (hh3 : ∀ n < 251, h 3 n = bivarKernel (sparsePoly r3 d3) 0 (onedTable ν_tig) n)
    (hh4 : ∀ n < 251, h 4 n = bivarKernel (sparsePoly r4 d4) 0 (onedTable ν_tig) n)
    (hh5 : ∀ n < 251, h 5 n = bivarKernel (sparsePoly p5 d5) (-Polynomial.X) μ_sm n) :
    ∑ n ∈ range 251, |(∑ p : Fin 6, w p * h p n) -
        (if n = 0 then (cNum : ℝ) / (cDen : ℝ) else 0)| ≤ (capNum : ℝ) / (capDen : ℝ) := by
  unfold fastHeadOK at hok
  dsimp only at hok
  split_ifs at hok with hguards
  simp only [Bool.and_eq_true] at hguards
  obtain ⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨hshape, htig_ok⟩, hhaag_sum⟩, hp0_ok⟩, hp1_ok⟩, hp2_ok⟩,
    hr3_ok⟩, hr4_ok⟩, hp5_ok⟩, hwDen1⟩, hwDen_le⟩, hw_sum⟩, hcDen1⟩, hc_le⟩, hcapDen1⟩ := hguards
  have hwDen_pos : 0 < wDen := by have := nat_ble_iff.1 hwDen1; omega
  have hwDen_le_D80 : wDen ≤ D80N := nat_ble_iff.1 hwDen_le
  have hw_eq_nat : w0 + w1 + w2 + w3 + w4 + w5 = wDen := by
    have h := nat_beq_iff.1 hw_sum
    simp only [nat_add_eq] at h; omega
  have hcDen_pos : 0 < cDen := by have := nat_ble_iff.1 hcDen1; omega
  have hcDen_R : (0 : ℝ) < (cDen : ℝ) := by exact_mod_cast hcDen_pos
  have hc_le_den : cNum ≤ cDen := nat_ble_iff.1 hc_le
  have hcapDen_pos : 0 < capDen := by have := nat_ble_iff.1 hcapDen1; omega
  -- Encode all 6 preprocessors
  obtain ⟨hP0_1, hP0_rep⟩ := kronRep_encPolyAux hp0_ok
  obtain ⟨hP1_1, hP1_rep⟩ := kronRep_encPolyAux hp1_ok
  obtain ⟨hP2_1, hP2_rep⟩ := kronRep_encPolyAux hp2_ok
  obtain ⟨hR3_1, hR3_rep⟩ := kronRep_encPolyAux hr3_ok
  obtain ⟨hR4_1, hR4_rep⟩ := kronRep_encPolyAux hr4_ok
  obtain ⟨hP5_1, hP5_rep⟩ := kronRep_encPolyAux hp5_ok
  -- Channel polynomials `F0..F5`
  let F0 : ℝ[X] := (∑ j ∈ range 251, EPoly μ_sm j * (Polynomial.X * sparsePoly p0 d0 ^ 2) ^ j) * sparsePoly p0 d0 -
    Polynomial.X * ∑ j ∈ range 250, OPoly μ_sm j * (Polynomial.X * sparsePoly p0 d0 ^ 2) ^ j
  let F1 : ℝ[X] := (∑ j ∈ range 251, EPoly μ_sm j * (Polynomial.X * sparsePoly p1 d1 ^ 2) ^ j) * sparsePoly p1 d1 -
    Polynomial.X * ∑ j ∈ range 250, OPoly μ_sm j * (Polynomial.X * sparsePoly p1 d1 ^ 2) ^ j
  let F2 : ℝ[X] := ∑ k ∈ range 251, Polynomial.C (haagCoeff k) * (Polynomial.X ^ k * sparsePoly p2 d2 ^ (2 * k + 1))
  let F3 : ℝ[X] := ∑ k ∈ range 251, Polynomial.C (ν_tig k) * (Polynomial.X ^ k * sparsePoly r3 d3 ^ (2 * k + 1))
  let F4 : ℝ[X] := ∑ k ∈ range 251, Polynomial.C (ν_tig k) * (Polynomial.X ^ k * sparsePoly r4 d4 ^ (2 * k + 1))
  let F5 : ℝ[X] := (∑ j ∈ range 251, EPoly μ_sm j * (Polynomial.X * sparsePoly p5 d5 ^ 2) ^ j) * sparsePoly p5 d5 -
    Polynomial.X * ∑ j ∈ range 250, OPoly μ_sm j * (Polynomial.X * sparsePoly p5 d5 ^ 2) ^ j
  let Fcomb : ℝ[X] :=
    Polynomial.C ((w0 : ℝ) / wDen) * F0 + Polynomial.C ((w1 : ℝ) / wDen) * F1 +
    Polynomial.C ((w2 : ℝ) / wDen) * F2 + Polynomial.C ((w3 : ℝ) / wDen) * F3 +
    Polynomial.C ((w4 : ℝ) / wDen) * F4 + Polynomial.C ((w5 : ℝ) / wDen) * F5
  -- Channel `kronRep` bounds
  have hrep0 := kronRep_evalSmoothed hshape hrows_mem hP0_1 hP0_rep
  have hrep1 := kronRep_evalSmoothed hshape hrows_mem hP1_1 hP1_rep
  have hrep5 := kronRep_evalSmoothed hshape hrows_mem hP5_1 hP5_rep
  have hrep2 := kronRep_eval1D_haag hhaag_sum hP2_1 hP2_rep
  have hrep3 := kronRep_eval1D_tig htig_ok htig_mem hR3_1 hR3_rep
  have hrep4 := kronRep_eval1D_tig htig_ok htig_mem hR4_1 hR4_rep
  generalize hpack_eq : packRowsNat (revL rows []) [] [] = evod at hrep0 hrep1 hrep5 hok
  obtain ⟨evN, odN⟩ := evod
  dsimp only at hrep0 hrep1 hrep5 hok
  set wSum : ℤ :=
    iAdd (iMul (Int.ofNat w0) (evalSmoothed (chunk16Rev 16 (natListToIntAcc odN []) []) (chunk16Rev 16 (natListToIntAcc evN []) []) (encPolyAux p0 d0 0)))
    (iAdd (iMul (Int.ofNat w1) (evalSmoothed (chunk16Rev 16 (natListToIntAcc odN []) []) (chunk16Rev 16 (natListToIntAcc evN []) []) (encPolyAux p1 d1 0)))
    (iAdd (iMul (Int.ofNat w2) (eval1D_D80 (chunk16Rev 16 haagMu80 []) (encPolyAux p2 d2 0)))
    (iAdd (iMul (Int.ofNat w3) (eval1D_D128 (chunk16Rev 16 (tigMu128Acc tigMu []) []) (encPolyAux r3 d3 0)))
    (iAdd (iMul (Int.ofNat w4) (eval1D_D128 (chunk16Rev 16 (tigMu128Acc tigMu []) []) (encPolyAux r4 d4 0)))
          (iMul (Int.ofNat w5) (evalSmoothed (chunk16Rev 16 (natListToIntAcc odN []) []) (chunk16Rev 16 (natListToIntAcc evN []) []) (encPolyAux p5 d5 0)))))))
  have hsd_wSum : kronRep D80N (2 * (D80N : ℝ)) 1100251 Fcomb (sd8 wSum wDen) :=
    kronRep_comb6 hwDen_pos hwDen_le_D80 hw_eq_nat hrep0 hrep1 hrep2 hrep3 hrep4 hrep5
  -- Subtract `c80`
  set c80 := tdivNat (iMul (Int.ofNat cNum) D80I) cDen
  have hc80_m : |(c80 : ℝ)| ≤ (D80N : ℝ) := by
    have h1 := tdivNat_abs_le (iMul (Int.ofNat cNum) D80I) hcDen_pos
    change |(c80 : ℝ)| ≤ |((iMul (Int.ofNat cNum) D80I : ℤ) : ℝ)| / (cDen : ℝ) at h1
    rw [iMul_eq, Int.cast_mul, abs_mul, show ((Int.ofNat cNum : ℤ) : ℝ) = (cNum : ℝ) from rfl,
      show (D80I : ℝ) = (D80N : ℝ) from rfl, abs_of_nonneg (Nat.cast_nonneg (α := ℝ) cNum),
      abs_of_nonneg (Nat.cast_nonneg (α := ℝ) D80N)] at h1
    have hle : (cNum : ℝ) * (D80N : ℝ) / (cDen : ℝ) ≤ (D80N : ℝ) := by
      rw [div_le_iff₀ hcDen_R]
      have hcd : (cNum : ℝ) ≤ (cDen : ℝ) := by exact_mod_cast hc_le_den
      nlinarith [Nat.cast_nonneg (α := ℝ) D80N]
    exact h1.trans hle
  have hc80_e : |((cNum : ℝ) / (cDen : ℝ)) * (D80N : ℝ) - (c80 : ℝ)| ≤ 1 := by
    have h1 := tdivNat_err (iMul (Int.ofNat cNum) D80I) hcDen_pos
    change |((iMul (Int.ofNat cNum) D80I : ℤ) : ℝ) / (cDen : ℝ) - (c80 : ℝ)| ≤ 1 at h1
    rw [iMul_eq, Int.cast_mul, show ((Int.ofNat cNum : ℤ) : ℝ) = (cNum : ℝ) from rfl,
      show (D80I : ℝ) = (D80N : ℝ) from rfl] at h1
    simpa [mul_div_right_comm] using h1
  have hc80_rep : kronRep D80N (D80N : ℝ) 1 (Polynomial.C ((cNum : ℝ) / (cDen : ℝ))) c80 :=
    (kronRep_const D80N ((cNum : ℝ) / (cDen : ℝ)) c80).mono hc80_m hc80_e
  have hres_rep := kronRep_sub hsd_wSum hc80_rep
  obtain ⟨Qres, hQres_supp, hQres_ev, hQres_m, hQres_e⟩ := hres_rep
  have h3D80_safe : 2 * (D80N : ℝ) + (D80N : ℝ) ≤ ((B1I / 4 : ℤ) : ℝ) := by
    have h1 : B1I / 4 = (2 : ℤ) ^ 222 := by unfold B1I; rw [B1N_eq]; norm_num
    rw [h1, D80N_eq]; norm_num
  have hQres_bnd : ∀ j < 251, |Qres.coeff j| ≤ B1I / 4 := fun j hj =>
    int_abs_le_B1_div4 ((coeff_abs_le_of_sum_abs_le hQres_m hj).trans h3D80_safe)
  have hl1_eq : l1_8 (iSub (sd8 wSum wDen) c80) = ∑ j ∈ range 251, |Qres.coeff j| := by
    rw [← hQres_ev]; exact l1_8_eval hQres_supp hQres_bnd
  -- Extract the final inequality from `hok`
  rw [iLe_iff, iAdd_eq] at hok
  change l1_8 (iSub (sd8 wSum wDen) c80) + errBudget80 ≤
    tdivNat (iMul (Int.ofNat capNum) D80I) capDen at hok
  rw [hl1_eq] at hok
  have hok_R : (∑ j ∈ range 251, |(Qres.coeff j : ℝ)|) + (errBudget80 : ℝ) ≤
      (capNum : ℝ) / (capDen : ℝ) * (D80N : ℝ) := by
    have h1 : ((∑ j ∈ range 251, |Qres.coeff j| + errBudget80 : ℤ) : ℝ) ≤
        ((tdivNat (iMul (Int.ofNat capNum) D80I) capDen : ℤ) : ℝ) := by exact_mod_cast hok
    push_cast at h1
    have hcap_le : ((tdivNat (iMul (Int.ofNat capNum) D80I) capDen : ℤ) : ℝ) ≤
        (capNum : ℝ) / (capDen : ℝ) * (D80N : ℝ) := by
      have hmul : iMul (Int.ofNat capNum) D80I = Int.ofNat (capNum * D80N) := by
        rw [iMul_eq]; rfl
      rw [hmul]
      have h2 := tdivNat_ofNat_le (capNum * D80N) hcapDen_pos
      push_cast at h2
      linarith [show (capNum : ℝ) * (D80N : ℝ) / (capDen : ℝ) = (capNum : ℝ) / (capDen : ℝ) * (D80N : ℝ) by ring]
    exact h1.trans hcap_le
  -- Connect `(Fcomb - C (cNum / cDen)).coeff n` to `(∑ p : Fin 6, w p * h p n) - if n = 0 then c else 0`
  have hF_coeff : ∀ n < 251,
      (Fcomb - Polynomial.C ((cNum : ℝ) / (cDen : ℝ))).coeff n =
        (∑ p : Fin 6, w p * h p n) - (if n = 0 then (cNum : ℝ) / (cDen : ℝ) else 0) := by
    intro n hn
    have hF0c : F0.coeff n = h 0 n := by
      rw [hh0 n hn, smoothed_bivarKernel_eq_EO _ _ hpar hn]
    have hF1c : F1.coeff n = h 1 n := by
      rw [hh1 n hn, smoothed_bivarKernel_eq_EO _ _ hpar hn]
    have hF2c : F2.coeff n = h 2 n := by
      rw [hh2 n hn, bivarKernel_oned_eq_head _ _ _ hn]
      simp only [F2, finsetSum_coeff, coeff_C_mul]
    have hF3c : F3.coeff n = h 3 n := by
      rw [hh3 n hn, bivarKernel_oned_eq_head _ _ _ hn]
      simp only [F3, finsetSum_coeff, coeff_C_mul]
    have hF4c : F4.coeff n = h 4 n := by
      rw [hh4 n hn, bivarKernel_oned_eq_head _ _ _ hn]
      simp only [F4, finsetSum_coeff, coeff_C_mul]
    have hF5c : F5.coeff n = h 5 n := by
      rw [hh5 n hn, smoothed_bivarKernel_eq_EO _ _ hpar hn]
    rw [coeff_sub, coeff_C, Fin.sum_univ_six]
    simp only [Fcomb, coeff_add, coeff_C_mul, hF0c, hF1c, hF2c, hF3c, hF4c, hF5c,
      hw.1, hw.2.1, hw.2.2.1, hw.2.2.2.1, hw.2.2.2.2.1, hw.2.2.2.2.2]
  -- Finish by triangle inequality and dividing by `D80N > 0`
  have hD80R : (0 : ℝ) < (D80N : ℝ) := by exact_mod_cast D80N_pos
  refine le_of_mul_le_mul_right ?_ hD80R
  calc (∑ n ∈ range 251, |(∑ p : Fin 6, w p * h p n) -
          (if n = 0 then (cNum : ℝ) / (cDen : ℝ) else 0)|) * (D80N : ℝ)
      = ∑ n ∈ range 251, |(Fcomb - Polynomial.C ((cNum : ℝ) / (cDen : ℝ))).coeff n * (D80N : ℝ)| := by
        rw [sum_mul]; refine sum_congr rfl fun n hn => ?_
        rw [hF_coeff n (mem_range.1 hn), abs_mul, abs_of_pos hD80R]
    _ ≤ ∑ n ∈ range 251,
          (|(Fcomb - Polynomial.C ((cNum : ℝ) / (cDen : ℝ))).coeff n * (D80N : ℝ) - (Qres.coeff n : ℝ)| +
           |(Qres.coeff n : ℝ)|) :=
        sum_le_sum fun n _ => by
          have := abs_add_le ((Fcomb - Polynomial.C ((cNum : ℝ) / (cDen : ℝ))).coeff n * (D80N : ℝ) - (Qres.coeff n : ℝ)) (Qres.coeff n : ℝ)
          simpa using this
    _ = (∑ n ∈ range 251, |(Fcomb - Polynomial.C ((cNum : ℝ) / (cDen : ℝ))).coeff n * (D80N : ℝ) - (Qres.coeff n : ℝ)|) +
        (∑ n ∈ range 251, |(Qres.coeff n : ℝ)|) := sum_add_distrib
    _ ≤ (1100251 + 1) + (∑ n ∈ range 251, |(Qres.coeff n : ℝ)|) := add_le_add hQres_e le_rfl
    _ ≤ (∑ n ∈ range 251, |(Qres.coeff n : ℝ)|) + (errBudget80 : ℝ) := by
        have herr : (1100251 : ℝ) + 1 ≤ (errBudget80 : ℝ) := by unfold errBudget80; norm_num
        linarith
    _ ≤ (capNum : ℝ) / (capDen : ℝ) * (D80N : ℝ) := hok_R

/-- **Multi-channel convex transfer directly from a real head-residual bound + Hardy tail bounds.** -/
theorem convex_transfer_head {k : ℕ} {w : Fin k → ℝ} {h : Fin k → ℕ → ℝ}
    {tl : Fin k → ℝ} {K : ℕ} {c headCap δ : ℝ}
    (hw0 : ∀ p, 0 ≤ w p) (hw1 : ∑ p, w p = 1)
    (hs : ∀ p, Summable fun n => |h p n|)
    (hdom : ∀ p, DominatedKernel (radialKernel (h p)))
    (hhead : ∑ n ∈ range (K + 1), |(∑ p, w p * h p n) - (if n = 0 then c else 0)| ≤ headCap)
    (htail : ∀ p, ∑' n, |h p (n + (K + 1))| ≤ tl p)
    (hδ : headCap + ∑ p, w p * tl p ≤ δ)
    (hδc : δ < c) :
    Statement.IsBound (1 / (c - δ)) := by
  let H : ℕ → ℝ := fun n => ∑ p, w p * h p n
  have hsH : Summable fun n => |H n| := summable_convex_comb w hs
  have hdomH : DominatedKernel (radialKernel H) :=
    dominatedKernel_congr_ball (dominatedKernel_convex_comb hw0 hw1 hdom) fun _ hz =>
      (radialKernel_convex_comb w hs hz).symm
  refine transfer H hsH hdomH hδc ?_
  rw [residual_split H hsH c K]
  have hH_tail : ∑' n, |H (n + (K + 1))| ≤ ∑ p, w p * tl p := by
    refine Real.tsum_le_of_sum_range_le (fun _ => abs_nonneg _) fun J => ?_
    calc ∑ n ∈ range J, |H (n + (K + 1))|
        ≤ ∑ n ∈ range J, ∑ p, w p * |h p (n + (K + 1))| :=
          sum_le_sum fun n _ => (abs_sum_le_sum_abs _ _).trans
            (le_of_eq (sum_congr rfl fun p _ => by rw [abs_mul, abs_of_nonneg (hw0 p)]))
      _ = ∑ p, w p * ∑ n ∈ range J, |h p (n + (K + 1))| := by
          rw [sum_comm]; exact sum_congr rfl fun _ _ => (mul_sum _ _ _).symm
      _ ≤ ∑ p, w p * tl p :=
          sum_le_sum fun p _ => mul_le_mul_of_nonneg_left
            ((((summable_nat_add_iff (K + 1)).2 (hs p)).sum_le_tsum (range J)
              fun _ _ => abs_nonneg _).trans (htail p)) (hw0 p)
  linarith

end

end Haagerup
