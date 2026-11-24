import Grothe.LowerAnalytic.RadiusRowCheck
import Grothe.LowerAnalytic.AntiStein
import Grothe.LowerAnalytic.Bernstein2
import Grothe.LowerAnalytic.SixthMoment
import Mathlib.Data.Rat.BigOperators

/-!
# Soundness of the cubic radius row checker

This file proves the analytic soundness of `checkRadiusRow` (`Grothe/LowerAnalytic/RadiusRowCheck.lean`)
for every circular cubic Gaussian chaos `q = a + i b` (`Circular J a b`, `Chaos3 a`, `E a² = 1/2`):

* **Integer polynomial and 1D Bernstein soundness** (`segOK_sound`, `rayOK_sound`): pure-integer
  de Casteljau subdivision (`bernCoverOK`) certifies nonnegativity on `[a, b]` and `[a, ∞)` via
  `R = a + 10 t / (1 − t)`.
* **Pointwise majorant `(C1)`–`(C2)`** (`checkPieces_sound`): lockstep induction along the knot
  mesh certifies both dual-cone membership `(xi2, xi1, xia) ∈ C*` on every piece and the
  completed-square majorant `√u ≤ maj(u, c₁, c₂, ρ)` for all `u ≥ 0` and `c₁, c₂ ≥ 0, ρ² ≤ c₁ c₂`.
* **Expectation and weak-duality soundness `(C3)`** (`radiusRow_sound`): integrating the pointwise
  majorant via `antiStein_I`, `antiStein_II`, the exact contraction variances of `AntiStein.lean`,
  `Circular.gaussian_sixth` and `Circular.joint_sixth`, and reducing to the `s`-endpoints via
  `cubic_endpoint_le` yields `E|q| < target` whenever `s = E|q|⁴ − 2 ∈ [r.sLo, r.sHi]`.
-/

open Finset MeasureTheory MvPolynomial Grothe.Lower

namespace Grothe.LowerAnalytic

noncomputable section

/-! ### Real evaluation of integer polynomials -/

/-- Horner evaluation of a little-endian `List Int` over `ℝ`. -/
def evalInt : List Int → ℝ → ℝ
  | [], _ => 0
  | a :: p, x => (a : ℝ) + x * evalInt p x

@[simp] lemma evalInt_nil (x : ℝ) : evalInt [] x = 0 := rfl

@[simp] lemma evalInt_cons (a : Int) (p : List Int) (x : ℝ) :
    evalInt (a :: p) x = (a : ℝ) + x * evalInt p x := rfl

private lemma evalInt_lin (c : Int) (x : ℝ) : evalInt [0, c] x = (c : ℝ) * x := by
  simp [evalInt]; ring

private lemma evalInt_pow5 (c : Int) (x : ℝ) : evalInt [0, 0, 0, 0, 0, c] x = (c : ℝ) * x ^ 5 := by
  simp [evalInt]; ring

lemma evalInt_add : ∀ (p q : List Int) (x : ℝ),
    evalInt (pAdd p q) x = evalInt p x + evalInt q x
  | [], q, _ => by simp [pAdd]
  | _ :: _, [], _ => by simp [pAdd]
  | a :: p, b :: q, x => by simp only [pAdd, evalInt_cons, Int.cast_add, evalInt_add p q x]; ring

lemma evalInt_map_neg : ∀ (q : List Int) (x : ℝ),
    evalInt (q.map (- ·)) x = -evalInt q x
  | [], _ => by simp
  | b :: q, x => by simp only [List.map_cons, evalInt_cons, Int.cast_neg, evalInt_map_neg q x]; ring

lemma evalInt_sub : ∀ (p q : List Int) (x : ℝ),
    evalInt (pSub p q) x = evalInt p x - evalInt q x
  | [], q, x => by simp [pSub, evalInt_map_neg]
  | _ :: _, [], _ => by simp [pSub]
  | a :: p, b :: q, x => by simp only [pSub, evalInt_cons, Int.cast_sub, evalInt_sub p q x]; ring

lemma evalInt_scale (c : Int) : ∀ (p : List Int) (x : ℝ),
    evalInt (pScale c p) x = (c : ℝ) * evalInt p x
  | [], _ => by simp [pScale]
  | a :: p, x => by
    simp only [pScale, List.map_cons, evalInt_cons, Int.cast_mul]
    rw [← pScale, evalInt_scale]
    ring

lemma evalInt_mul : ∀ (p q : List Int) (x : ℝ),
    evalInt (pMul p q) x = evalInt p x * evalInt q x
  | [], _, _ => by simp [pMul]
  | a :: p, q, x => by
    simp only [pMul, evalInt_add, evalInt_scale, evalInt_cons, Int.cast_zero, zero_add,
      evalInt_mul p q x]
    ring

lemma evalInt_shift : ∀ (k : ℕ) (p : List Int) (x : ℝ),
    evalInt (pShift k p) x = x ^ k * evalInt p x
  | 0, _, _ => by simp [pShift]
  | k + 1, p, x => by
    simp only [pShift, evalInt_cons, Int.cast_zero, zero_add, evalInt_shift k p x, pow_succ]; ring

lemma evalInt_inSq : ∀ (p : List Int) (x : ℝ),
    evalInt (pInSq p) x = evalInt p (x ^ 2)
  | [], _ => by simp [pInSq]
  | [a], _ => by simp [pInSq]
  | a :: b :: p, x => by
    simp only [pInSq, evalInt_cons, Int.cast_zero, zero_add, evalInt_inSq (b :: p) x]; ring

lemma evalInt_drop2 (p : List Int) (h0 : p.getD 0 0 = 0) (h1 : p.getD 1 0 = 0) (x : ℝ) :
    evalInt p x = x ^ 2 * evalInt (p.drop 2) x := by
  cases p with
  | nil => simp
  | cons a p =>
    simp only [List.getD_cons_zero] at h0
    cases p with
    | nil => simp [h0]
    | cons b p =>
      simp only [List.getD_cons_succ, List.getD_cons_zero] at h1
      simp only [List.drop_succ_cons, List.drop_zero, evalInt_cons, h0, h1, Int.cast_zero, zero_add]
      ring

lemma evalInt_eq_sum : ∀ (p : List Int) (x : ℝ),
    evalInt p x = ∑ k ∈ range p.length, (p.getD k 0 : ℝ) * x ^ k
  | [], _ => by simp
  | a :: p, x => by
    simp only [evalInt_cons, List.length_cons, evalInt_eq_sum p x, Finset.sum_range_succ',
      List.getD_cons_zero, List.getD_cons_succ, pow_zero, mul_one, pow_succ]
    rw [Finset.mul_sum, add_comm]
    congr 1
    exact Finset.sum_congr rfl fun k _ ↦ by ring

lemma getD_eq_zero_of_trim {d : ℕ} {p : List Int} (ht : pTrimOK d p = true) {k : ℕ}
    (hk : d + 1 ≤ k) : p.getD k 0 = 0 := by
  unfold pTrimOK at ht
  rw [List.all_eq_true] at ht
  by_cases hlt : k < p.length
  · have hmem : p[k] ∈ p.drop (d + 1) := by
      have hidx : k - (d + 1) < (p.drop (d + 1)).length := by simp; omega
      have hget : (p.drop (d + 1))[k - (d + 1)] = p[k] := by
        simp [Nat.add_sub_cancel' hk]
      rw [← hget]
      exact List.getElem_mem hidx
    have h0 := ht p[k] hmem
    simp only [beq_iff_eq] at h0
    rw [List.getD_eq_getElem _ _ hlt, h0]
  · exact List.getD_eq_default _ _ (Nat.le_of_not_lt hlt)

lemma evalInt_eq_sum_of_trim {d : ℕ} {p : List Int} (ht : pTrimOK d p = true) (x : ℝ) :
    evalInt p x = ∑ k ∈ range (d + 1), (p.getD k 0 : ℝ) * x ^ k := by
  rw [evalInt_eq_sum]
  by_cases hle : p.length ≤ d + 1
  · refine Finset.sum_subset (Finset.range_mono hle) fun k hk hkn ↦ ?_
    simp only [Finset.mem_range] at hk hkn
    rw [List.getD_eq_default _ _ (Nat.le_of_not_lt hkn), Int.cast_zero, zero_mul]
  · refine (Finset.sum_subset (Finset.range_mono (Nat.not_le.1 hle).le) fun k hk hkn ↦ ?_).symm
    simp only [Finset.mem_range] at hk hkn
    rw [getD_eq_zero_of_trim ht (Nat.le_of_not_lt hkn), Int.cast_zero, zero_mul]

lemma pAdd_length_le : ∀ (p q : List Int), (pAdd p q).length ≤ max p.length q.length
  | [], _ => by simp [pAdd]
  | _ :: _, [] => by simp [pAdd]
  | _ :: p, _ :: q => by
    simp only [pAdd, List.length_cons]
    have := pAdd_length_le p q
    omega

lemma pScale_length (c : Int) (p : List Int) : (pScale c p).length = p.length := by
  simp [pScale]

lemma pMul_pair_length_le (a w : Int) : ∀ (p : List Int),
    (pMul p [a, w]).length ≤ p.length + 1
  | [] => by simp [pMul]
  | x :: p => by
    simp only [pMul]
    have h1 := pAdd_length_le (pScale x [a, w]) (0 :: pMul p [a, w])
    have h2 := pMul_pair_length_le a w p
    simp only [pScale_length, List.length_cons, List.length_nil] at h1 ⊢
    omega

lemma pAffineAux_length_le (p : List Int) (a w : Int) : ∀ (n : ℕ) (acc : List Int),
    (pAffineAux p a w n acc).length ≤ acc.length + n
  | 0, acc => by simp [pAffineAux]
  | j + 1, acc => by
    simp only [pAffineAux]
    have h1 := pAffineAux_length_le p a w j (pAdd (pMul acc [a, w]) [p.getD j 0])
    have h2 := pAdd_length_le (pMul acc [a, w]) [p.getD j 0]
    have h3 := pMul_pair_length_le a w acc
    simp only [List.length_singleton] at h2
    omega

lemma pAffine_length_le (p : List Int) (d : ℕ) (a w : Int) :
    (pAffine p d a w).length ≤ d + 1 := by
  simpa [pAffine] using pAffineAux_length_le p a w (d + 1) []

lemma evalInt_pAffineAux (p : List Int) (a w : Int) (t : ℝ) : ∀ (n : ℕ) (acc : List Int),
    evalInt (pAffineAux p a w n acc) t
      = evalInt acc t * ((a : ℝ) + (w : ℝ) * t) ^ n
        + ∑ k ∈ range n, (p.getD k 0 : ℝ) * ((a : ℝ) + (w : ℝ) * t) ^ k
  | 0, acc => by simp [pAffineAux]
  | j + 1, acc => by
    simp only [pAffineAux, evalInt_pAffineAux p a w t j, evalInt_add, evalInt_mul, evalInt_cons,
      evalInt_nil, mul_zero, add_zero, Finset.sum_range_succ, pow_succ]
    ring

lemma evalInt_pAffine {d : ℕ} {p : List Int} (ht : pTrimOK d p = true) (a w : Int) (t : ℝ) :
    evalInt (pAffine p d a w) t = evalInt p ((a : ℝ) + (w : ℝ) * t) := by
  rw [pAffine, evalInt_pAffineAux, evalInt_nil, zero_mul, zero_add, evalInt_eq_sum_of_trim ht]

lemma evalInt_pAffine_eq_sum (p : List Int) (d : ℕ) (a w : Int) (t : ℝ) :
    evalInt (pAffine p d a w) t
      = ∑ k ∈ range (d + 1), ((pAffine p d a w).getD k 0 : ℝ) * t ^ k := by
  rw [evalInt_eq_sum]
  refine Finset.sum_subset (Finset.range_mono (pAffine_length_le p d a w)) fun k hk hkn ↦ ?_
  simp only [Finset.mem_range] at hk hkn
  rw [List.getD_eq_default _ _ (Nat.le_of_not_lt hkn), Int.cast_zero, zero_mul]

/-! ### Exact integer Bernstein basis and de Casteljau soundness -/

/-- `lcmChoose d > 0` and every `C(d, k)` (`k ≤ d`) divides `lcmChoose d`. -/
lemma foldl_lcm_pos : ∀ (l : List ℕ) (acc : ℕ), 0 < acc → (∀ x ∈ l, 0 < x) →
    0 < l.foldl Nat.lcm acc
  | [], _, ha, _ => ha
  | x :: xs, _, ha, hx =>
    foldl_lcm_pos xs _ (Nat.lcm_pos ha (hx x (List.mem_cons_self ..)))
      fun y hy ↦ hx y (List.mem_cons_of_mem _ hy)

lemma dvd_foldl_lcm_acc : ∀ (l : List ℕ) (acc : ℕ), acc ∣ l.foldl Nat.lcm acc
  | [], _ => dvd_refl _
  | x :: xs, acc => (Nat.dvd_lcm_left acc x).trans (dvd_foldl_lcm_acc xs _)

lemma mem_dvd_foldl_lcm : ∀ (l : List ℕ) (acc x : ℕ), x ∈ l → x ∣ l.foldl Nat.lcm acc
  | [], _, _, h => absurd h List.not_mem_nil
  | y :: ys, acc, x, h => by
    rcases List.mem_cons.1 h with rfl | hx
    · exact (Nat.dvd_lcm_right acc x).trans (dvd_foldl_lcm_acc ys _)
    · exact mem_dvd_foldl_lcm ys _ x hx

lemma lcmChoose_eq_map (d : ℕ) :
    lcmChoose d = ((List.range (d + 1)).map (d.choose ·)).foldl Nat.lcm 1 := by
  unfold lcmChoose
  rw [List.foldl_map]

lemma lcmChoose_pos (d : ℕ) : 0 < lcmChoose d := by
  rw [lcmChoose_eq_map]
  refine foldl_lcm_pos _ 1 Nat.one_pos fun x hx ↦ ?_
  obtain ⟨j, hj, rfl⟩ := List.mem_map.1 hx
  rw [List.mem_range] at hj
  exact Nat.choose_pos (Nat.lt_succ_iff.1 hj)

lemma choose_dvd_lcmChoose (d k : ℕ) (hk : k ≤ d) : d.choose k ∣ lcmChoose d := by
  rw [lcmChoose_eq_map]
  exact mem_dvd_foldl_lcm _ 1 _ (List.mem_map.2 ⟨k, List.mem_range.2 (Nat.lt_succ_of_le hk), rfl⟩)

/-- Real value of a Bernstein coefficient list `b` of length `d + 1` at `t ∈ [0, 1]`. -/
def evalBern (b : List Int) (t : ℝ) : ℝ :=
  ∑ m ∈ range b.length, (b.getD m 0 : ℝ) * bbasis (b.length - 1) m t

lemma foldl_add_range (f : ℕ → Int) : ∀ (n : ℕ) (acc : Int),
    (List.range n).foldl (fun a k ↦ a + f k) acc = acc + ∑ k ∈ range n, f k
  | 0, acc => by simp
  | n + 1, acc => by
    rw [List.range_succ, List.foldl_append, List.foldl_cons, List.foldl_nil,
      foldl_add_range f n acc, Finset.sum_range_succ]
    ring

lemma evalBern_toBernSeg {d : ℕ} {p : List Int} (ht : pTrimOK d p = true) (a w : Int) (t : ℝ) :
    evalBern (toBernSeg p d a w) t = (lcmChoose d : ℝ) * evalInt p ((a : ℝ) + (w : ℝ) * t) := by
  set q := pAffine p d a w
  set M := lcmChoose d
  have hlen : (toBernSeg p d a w).length = d + 1 := by simp [toBernSeg]
  rw [evalBern, hlen, Nat.add_sub_cancel, ← evalInt_pAffine ht a w t, evalInt_pAffine_eq_sum]
  have hget : ∀ m ∈ range (d + 1),
      ((toBernSeg p d a w).getD m 0 : ℝ)
        = ∑ k ∈ range (m + 1), (q.getD k 0 : ℝ) * ((m.choose k : ℝ) * ((M / d.choose k : ℕ) : ℝ)) := by
    intro m hm
    have hm' : m < d + 1 := Finset.mem_range.1 hm
    have hidx : (toBernSeg p d a w).getD m 0
        = (List.range (m + 1)).foldl (fun acc k ↦
            acc + q.getD k 0 * ((m.choose k * (M / d.choose k) : ℕ) : Int)) 0 := by
      rw [List.getD_eq_getElem _ _ (by rw [hlen]; exact hm')]
      simp [toBernSeg, q, M]
    rw [hidx, foldl_add_range, zero_add, Int.cast_sum]
    refine Finset.sum_congr rfl fun k _ ↦ ?_
    simp only [Int.cast_mul, Int.cast_natCast, Nat.cast_mul]
  have hL : ∑ m ∈ range (d + 1), ((toBernSeg p d a w).getD m 0 : ℝ) * bbasis d m t
      = ∑ m ∈ range (d + 1), ∑ k ∈ range (d + 1),
          if k ≤ m then (q.getD k 0 : ℝ) * ((m.choose k : ℝ) * ((M / d.choose k : ℕ) : ℝ))
            * bbasis d m t else 0 := by
    refine Finset.sum_congr rfl fun m hm ↦ ?_
    have hm' : m ≤ d := Nat.lt_succ_iff.1 (Finset.mem_range.1 hm)
    rw [hget m hm, Finset.sum_mul, ← Finset.sum_filter, filter_le_range' hm']
  rw [hL, Finset.sum_comm, Finset.mul_sum]
  refine Finset.sum_congr rfl fun k hk ↦ ?_
  have hk' : k ≤ d := Nat.lt_succ_iff.1 (Finset.mem_range.1 hk)
  have hck : (d.choose k : ℝ) ≠ 0 := by exact_mod_cast (Nat.choose_pos hk').ne'
  have hdvd : (d.choose k : ℝ) * ((M / d.choose k : ℕ) : ℝ) = (M : ℝ) := by
    exact_mod_cast Nat.mul_div_cancel' (choose_dvd_lcmChoose d k hk')
  have hdiv : ((M / d.choose k : ℕ) : ℝ) = (M : ℝ) / (d.choose k : ℝ) := by
    rw [eq_div_iff hck, mul_comm, hdvd]
  rw [pow_eq_bbasis d k hk' t, Finset.mul_sum, Finset.mul_sum]
  refine Finset.sum_congr rfl fun m _ ↦ ?_
  split_ifs with hkm
  · rw [hdiv]; ring
  · ring

lemma evalBern_toBernRay {d : ℕ} {p : List Int} (ht : pTrimOK d p = true) (a w : Int) {t : ℝ}
    (ht1 : t ≠ 1) :
    evalBern (toBernRay p d a w) t
      = (lcmChoose d : ℝ) * (1 - t) ^ d * evalInt p ((a : ℝ) + (w : ℝ) * (t / (1 - t))) := by
  set q := pAffine p d a w
  set M := lcmChoose d
  have h1t : 1 - t ≠ 0 := sub_ne_zero.2 (Ne.symm ht1)
  have hlen : (toBernRay p d a w).length = d + 1 := by simp [toBernRay]
  rw [evalBern, hlen, Nat.add_sub_cancel, ← evalInt_pAffine ht a w (t / (1 - t)),
    evalInt_pAffine_eq_sum, Finset.mul_sum]
  refine Finset.sum_congr rfl fun k hk ↦ ?_
  have hk' : k ≤ d := Nat.lt_succ_iff.1 (Finset.mem_range.1 hk)
  have hidx : (toBernRay p d a w).getD k 0 = q.getD k 0 * ((M / d.choose k : ℕ) : Int) := by
    rw [List.getD_eq_getElem _ _ (by rw [hlen]; exact Finset.mem_range.1 hk)]
    simp [toBernRay, q, M]
  have hdvd : (d.choose k : ℝ) * ((M / d.choose k : ℕ) : ℝ) = (M : ℝ) := by
    exact_mod_cast Nat.mul_div_cancel' (choose_dvd_lcmChoose d k hk')
  rw [hidx, bbasis, Int.cast_mul, Int.cast_natCast, div_pow]
  have hpow : (1 - t) ^ d = (1 - t) ^ k * (1 - t) ^ (d - k) := by
    rw [← pow_add, Nat.add_sub_of_le hk']
  have h1 : (q.getD k 0 : ℝ) * ((M / d.choose k : ℕ) : ℝ)
      * ((d.choose k : ℝ) * t ^ k * (1 - t) ^ (d - k))
      = (M : ℝ) * (q.getD k 0 : ℝ) * t ^ k * (1 - t) ^ (d - k) := by
    linear_combination (q.getD k 0 : ℝ) * t ^ k * (1 - t) ^ (d - k) * hdvd
  rw [hpow, h1]
  field_simp [h1t]
  ring

lemma dcStep_length : ∀ (b : List Int), (dcStep b).length = b.length - 1
  | [] => rfl
  | [_] => rfl
  | _ :: y :: rest => by
    simp only [dcStep, List.length_cons, dcStep_length (y :: rest)]
    omega

lemma dcStep_getD : ∀ (b : List Int) (i : ℕ), i + 1 < b.length →
    (dcStep b).getD i 0 = b.getD i 0 + b.getD (i + 1) 0
  | [], _, h => by simp at h
  | [_], _, h => by simp at h
  | x :: y :: rest, 0, _ => by simp [dcStep]
  | _ :: y :: rest, i + 1, h => by
    simp only [dcStep, List.getD_cons_succ]
    exact dcStep_getD (y :: rest) i (by simp only [List.length_cons] at h ⊢; omega)

lemma dcStep_iter_length : ∀ (k : ℕ) (b : List Int), (dcStep^[k] b).length = b.length - k
  | 0, _ => by simp
  | k + 1, b => by
    rw [Function.iterate_succ_apply', dcStep_length, dcStep_iter_length k b]; omega

lemma dcStep_iter_getD : ∀ (k : ℕ) (b : List Int) (i : ℕ), i + k < b.length →
    (dcStep^[k] b).getD i 0 = ∑ j ∈ range (k + 1), (k.choose j : Int) * b.getD (i + j) 0
  | 0, b, i, _ => by simp
  | k + 1, b, i, hi => by
    rw [Function.iterate_succ_apply', dcStep_getD _ i (by rw [dcStep_iter_length]; omega),
      dcStep_iter_getD k b i (by omega), dcStep_iter_getD k b (i + 1) (by omega)]
    conv_lhs =>
      arg 1
      rw [Finset.sum_range_succ']
    conv_lhs =>
      arg 2
      rw [Finset.sum_range_succ]
    conv_rhs =>
      rw [Finset.sum_range_succ, Finset.sum_range_succ']
    simp only [Nat.choose_zero_right, Nat.choose_self, Nat.cast_one, one_mul, add_zero]
    have hmid : ∑ j ∈ range k, ((k + 1).choose (j + 1) : Int) * b.getD (i + (j + 1)) 0
        = ∑ j ∈ range k, (k.choose (j + 1) : Int) * b.getD (i + (j + 1)) 0
          + ∑ j ∈ range k, (k.choose j : Int) * b.getD (i + 1 + j) 0 := by
      rw [← Finset.sum_add_distrib]
      refine Finset.sum_congr rfl fun j _ ↦ ?_
      rw [Nat.choose_succ_succ, Nat.cast_add, show i + 1 + j = i + (j + 1) by omega]; ring
    rw [hmid, show i + 1 + k = i + (k + 1) by omega]; ring

private lemma getLastD_cons_cons {α : Type*} (a b : α) (l : List α) (d : α) :
    (a :: b :: l).getLastD d = (b :: l).getLastD d := rfl

private lemma getLastD_eq_getLast {α : Type*} :
    ∀ (l : List α) (d : α) (h : l ≠ []), l.getLastD d = l.getLast h
  | [], _, h => absurd rfl h
  | [_], _, _ => rfl
  | _ :: b :: l, d, _ => getLastD_eq_getLast (b :: l) d (List.cons_ne_nil _ _)

lemma dcSplitAux_spec : ∀ (k : ℕ) (cur rAcc : List Int), cur.length = k + 1 →
    (dcSplitAux k cur rAcc).1.length = k + 1 ∧
    (∀ m ≤ k, (dcSplitAux k cur rAcc).1.getD m 0
      = (dcStep^[m] cur).getD 0 0 * (2 : Int) ^ (k - m)) ∧
    (dcSplitAux k cur rAcc).2
      = ((List.range (k + 1)).map fun j ↦
          (dcStep^[k - j] cur).getD j 0 * (2 : Int) ^ j) ++ rAcc
  | 0, cur, rAcc, hlen => by
    cases cur with
    | nil => simp at hlen
    | cons x rest =>
      cases rest with
      | nil =>
        refine ⟨rfl, fun m hm ↦ ?_, ?_⟩
        · have : m = 0 := Nat.eq_zero_of_le_zero hm
          subst this; simp [dcSplitAux]
        · simp [dcSplitAux]
      | cons _ _ => simp at hlen
  | k + 1, cur, rAcc, hlen => by
    have hne : cur ≠ [] := by intro h; simp [h] at hlen
    have hstep_len : (dcStep cur).length = k + 1 := by rw [dcStep_length, hlen]; omega
    have ih := dcSplitAux_spec k (dcStep cur) ((cur.getLastD 0 * (2 : Int) ^ (k + 1)) :: rAcc)
      hstep_len
    obtain ⟨ih1, ih2, ih3⟩ := ih
    have hhead : cur.headD 0 = cur.getD 0 0 := by cases cur <;> simp
    have hlast : cur.getLastD 0 = cur.getD (k + 1) 0 := by
      rw [getLastD_eq_getLast cur 0 hne, List.getLast_eq_getElem,
        List.getD_eq_getElem _ _ (by omega)]
      congr 1; omega
    simp only [dcSplitAux]
    refine ⟨by rw [List.length_cons, ih1], fun m hm ↦ ?_, ?_⟩
    · cases m with
      | zero => simp only [List.getD_cons_zero, hhead, Nat.sub_zero, Function.iterate_zero_apply]
      | succ m =>
        simp only [List.getD_cons_succ, ih2 m (by omega), Nat.succ_sub_succ_eq_sub,
          Function.iterate_succ_apply]
    · rw [ih3]
      conv_rhs =>
        rw [List.range_succ, List.map_append, List.map_singleton, List.append_assoc,
          List.singleton_append]
      congr 1
      · refine List.map_congr_left fun j hj ↦ ?_
        have hj' : j < k + 1 := List.mem_range.1 hj
        rw [show k + 1 - j = (k - j) + 1 by omega, Function.iterate_succ_apply]
      · simp only [Nat.sub_self, Function.iterate_zero_apply, hlast]

lemma evalBern_dcSplit_left {b : List Int} (hb : b ≠ []) (s : ℝ) :
    evalBern (dcSplit b).1 s = (2 : ℝ) ^ (b.length - 1) * evalBern b (s / 2) := by
  obtain ⟨d, hd⟩ : ∃ d, b.length = d + 1 := Nat.exists_eq_succ_of_ne_zero (List.length_pos_iff.2 hb).ne'
  have hspec : (dcSplit b).1.length = d + 1 ∧
      ∀ m ≤ d, (dcSplit b).1.getD m 0 = (dcStep^[m] b).getD 0 0 * (2 : Int) ^ (d - m) := by
    cases b with
    | nil => exact absurd rfl hb
    | cons x xs =>
      simp only [dcSplit, List.length_cons, Nat.add_sub_cancel] at hd ⊢
      have h := dcSplitAux_spec d (x :: xs) [] (by simp [hd])
      rw [show xs.length = d by omega]
      exact ⟨h.1, h.2.1⟩
  rw [evalBern, evalBern, hspec.1, hd, Nat.add_sub_cancel]
  have hL : ∑ m ∈ range (d + 1), ((dcSplit b).1.getD m 0 : ℝ) * bbasis d m s
      = ∑ m ∈ range (d + 1), ∑ j ∈ range (d + 1),
          if j ≤ m then (b.getD j 0 : ℝ) * ((m.choose j : ℝ) * (2 : ℝ) ^ (d - m)) * bbasis d m s
          else 0 := by
    refine Finset.sum_congr rfl fun m hm ↦ ?_
    have hm' : m ≤ d := Nat.lt_succ_iff.1 (Finset.mem_range.1 hm)
    rw [hspec.2 m hm', dcStep_iter_getD m b 0 (by omega), Int.cast_mul, Int.cast_sum, Int.cast_pow,
      Int.cast_ofNat, Finset.sum_mul, Finset.sum_mul, ← Finset.sum_filter, filter_le_range' hm']
    refine Finset.sum_congr rfl fun j _ ↦ ?_
    simp only [zero_add, Int.cast_mul, Int.cast_natCast]; ring
  rw [hL, Finset.sum_comm, Finset.mul_sum]
  refine Finset.sum_congr rfl fun j hj ↦ ?_
  have hj' : j ≤ d := Nat.lt_succ_iff.1 (Finset.mem_range.1 hj)
  rw [← Finset.sum_filter, filter_ge_range', Finset.sum_Ico_eq_sum_range,
    show d + 1 - j = d - j + 1 by omega]
  have hterm : ∀ r ∈ range (d - j + 1),
      (b.getD j 0 : ℝ) * (((j + r).choose j : ℝ) * (2 : ℝ) ^ (d - (j + r))) * bbasis d (j + r) s
        = (b.getD j 0 : ℝ) * ((d.choose j : ℝ) * s ^ j)
          * (((d - j).choose r : ℝ) * s ^ r * (2 * (1 - s)) ^ (d - j - r)) := by
    intro r hr
    have hr' : r ≤ d - j := Nat.lt_succ_iff.1 (Finset.mem_range.1 hr)
    have hcm := Nat.choose_mul (n := d) (k := j + r) (s := j) (by omega)
    rw [show j + r - j = r by omega] at hcm
    have hcmR : (d.choose (j + r) : ℝ) * ((j + r).choose j : ℝ)
        = (d.choose j : ℝ) * ((d - j).choose r : ℝ) := by exact_mod_cast hcm
    simp only [bbasis]
    rw [show d - (j + r) = d - j - r by omega, pow_add, mul_pow]
    linear_combination (b.getD j 0 : ℝ) * s ^ j * s ^ r * (2 : ℝ) ^ (d - j - r)
      * (1 - s) ^ (d - j - r) * hcmR
  rw [Finset.sum_congr rfl hterm, ← Finset.mul_sum]
  have hbin : ∑ r ∈ range (d - j + 1), ((d - j).choose r : ℝ) * s ^ r * (2 * (1 - s)) ^ (d - j - r)
      = (s + 2 * (1 - s)) ^ (d - j) := by
    rw [add_pow]
    refine Finset.sum_congr rfl fun r _ ↦ by ring
  rw [hbin, bbasis]
  have h2pow : (2 : ℝ) ^ d = (2 : ℝ) ^ j * (2 : ℝ) ^ (d - j) := by
    rw [← pow_add, Nat.add_sub_of_le hj']
  rw [h2pow, div_pow, show (1 - s / 2) = (s + 2 * (1 - s)) / 2 by ring, div_pow]
  field_simp

lemma evalBern_dcSplit_right {b : List Int} (hb : b ≠ []) (s : ℝ) :
    evalBern (dcSplit b).2 s = (2 : ℝ) ^ (b.length - 1) * evalBern b ((1 + s) / 2) := by
  obtain ⟨d, hd⟩ : ∃ d, b.length = d + 1 := Nat.exists_eq_succ_of_ne_zero (List.length_pos_iff.2 hb).ne'
  have hspec : (dcSplit b).2
      = (List.range (d + 1)).map fun j ↦ (dcStep^[d - j] b).getD j 0 * (2 : Int) ^ j := by
    cases b with
    | nil => exact absurd rfl hb
    | cons x xs =>
      simp only [dcSplit, List.length_cons, Nat.add_sub_cancel] at hd ⊢
      have h := dcSplitAux_spec d (x :: xs) [] (by simp [hd])
      rw [show xs.length = d by omega, h.2.2, List.append_nil]
  have hlen2 : (dcSplit b).2.length = d + 1 := by rw [hspec]; simp
  rw [evalBern, evalBern, hlen2, hd, Nat.add_sub_cancel]
  have hL : ∑ j ∈ range (d + 1), ((dcSplit b).2.getD j 0 : ℝ) * bbasis d j s
      = ∑ j ∈ range (d + 1), ∑ m ∈ range (d + 1),
          if j ≤ m then (b.getD m 0 : ℝ) * (((d - j).choose (m - j) : ℝ) * (2 : ℝ) ^ j)
            * bbasis d j s
          else 0 := by
    refine Finset.sum_congr rfl fun j hj ↦ ?_
    have hj' : j ≤ d := Nat.lt_succ_iff.1 (Finset.mem_range.1 hj)
    have hget : (dcSplit b).2.getD j 0 = (dcStep^[d - j] b).getD j 0 * (2 : Int) ^ j := by
      rw [List.getD_eq_getElem _ _ (by rw [hlen2]; exact Finset.mem_range.1 hj)]
      simp [hspec]
    rw [hget, dcStep_iter_getD (d - j) b j (by omega), Int.cast_mul, Int.cast_sum, Int.cast_pow,
      Int.cast_ofNat, Finset.sum_mul, Finset.sum_mul, ← Finset.sum_filter, filter_ge_range',
      Finset.sum_Ico_eq_sum_range, show d + 1 - j = d - j + 1 by omega]
    refine Finset.sum_congr rfl fun r _ ↦ ?_
    simp only [Nat.add_sub_cancel_left, Int.cast_mul, Int.cast_natCast]; ring
  rw [hL, Finset.sum_comm, Finset.mul_sum]
  refine Finset.sum_congr rfl fun m hm ↦ ?_
  have hm' : m ≤ d := Nat.lt_succ_iff.1 (Finset.mem_range.1 hm)
  rw [← Finset.sum_filter, filter_le_range' hm']
  have hterm : ∀ j ∈ range (m + 1),
      (b.getD m 0 : ℝ) * (((d - j).choose (m - j) : ℝ) * (2 : ℝ) ^ j) * bbasis d j s
        = (b.getD m 0 : ℝ) * ((d.choose m : ℝ) * (1 - s) ^ (d - m))
          * ((m.choose j : ℝ) * (2 * s) ^ j * (1 - s) ^ (m - j)) := by
    intro j hj
    have hj' : j ≤ m := Nat.lt_succ_iff.1 (Finset.mem_range.1 hj)
    have hcm : d.choose j * (d - j).choose (m - j) = d.choose m * m.choose j :=
      (Nat.choose_mul (n := d) (k := m) (s := j) hj').symm
    have hcmR : (d.choose j : ℝ) * ((d - j).choose (m - j) : ℝ)
        = (d.choose m : ℝ) * (m.choose j : ℝ) := by exact_mod_cast hcm
    simp only [bbasis]
    have hpow : (1 - s) ^ (d - j) = (1 - s) ^ (d - m) * (1 - s) ^ (m - j) := by
      rw [← pow_add, show d - m + (m - j) = d - j by omega]
    rw [hpow, mul_pow]
    linear_combination (b.getD m 0 : ℝ) * (2 : ℝ) ^ j * s ^ j * (1 - s) ^ (d - m)
      * (1 - s) ^ (m - j) * hcmR
  rw [Finset.sum_congr rfl hterm, ← Finset.mul_sum]
  have hbin : ∑ j ∈ range (m + 1), (m.choose j : ℝ) * (2 * s) ^ j * (1 - s) ^ (m - j)
      = (2 * s + (1 - s)) ^ m := by
    rw [add_pow]
    refine Finset.sum_congr rfl fun j _ ↦ by ring
  rw [hbin, bbasis]
  have h2pow : (2 : ℝ) ^ d = (2 : ℝ) ^ m * (2 : ℝ) ^ (d - m) := by
    rw [← pow_add, Nat.add_sub_of_le hm']
  rw [h2pow, show 1 - (1 + s) / 2 = (1 - s) / 2 by ring, show 2 * s + (1 - s) = 1 + s by ring,
    div_pow, div_pow]
  field_simp

theorem bernCoverOK_sound : ∀ (cov : Cover1) (b : List Int), b ≠ [] →
    bernCoverOK cov b = true → ∀ t : ℝ, 0 ≤ t → t ≤ 1 → 0 ≤ evalBern b t
  | .leaf, b, _, hok, t, ht0, ht1 => by
    simp only [bernCoverOK, List.all_eq_true, decide_eq_true_eq] at hok
    unfold evalBern
    refine Finset.sum_nonneg fun m hm ↦ ?_
    have hm' : m < b.length := Finset.mem_range.1 hm
    have hbm : (0 : ℝ) ≤ (b.getD m 0 : ℝ) := by
      rw [List.getD_eq_getElem _ _ hm']
      exact_mod_cast hok b[m] (List.getElem_mem hm')
    exact mul_nonneg hbm (bbasis_nonneg _ _ ht0 ht1)
  | .split l r, b, hb, hok, t, ht0, ht1 => by
    simp only [bernCoverOK, Bool.and_eq_true] at hok
    have hne : (dcSplit b).1 ≠ [] ∧ (dcSplit b).2 ≠ [] := by
      obtain ⟨d, hd⟩ : ∃ d, b.length = d + 1 :=
        Nat.exists_eq_succ_of_ne_zero (List.length_pos_iff.2 hb).ne'
      cases b with
      | nil => exact absurd rfl hb
      | cons x xs =>
        simp only [dcSplit, List.length_cons, Nat.add_sub_cancel] at hd ⊢
        have hs := dcSplitAux_spec d (x :: xs) [] (by simp [hd])
        rw [show xs.length = d by omega]
        constructor
        · intro h; simp [h] at hs
        · intro h; rw [hs.2.2, List.append_nil] at h; simp at h
    have h2pos : (0 : ℝ) < (2 : ℝ) ^ (b.length - 1) := by positivity
    by_cases hmid : t ≤ 1 / 2
    · have hl := bernCoverOK_sound l (dcSplit b).1 hne.1 hok.1 (2 * t) (by linarith) (by linarith)
      rw [evalBern_dcSplit_left hb, show 2 * t / 2 = t by ring] at hl
      exact nonneg_of_mul_nonneg_right hl h2pos
    · have hr := bernCoverOK_sound r (dcSplit b).2 hne.2 hok.2 (2 * t - 1) (by linarith)
        (by linarith)
      rw [evalBern_dcSplit_right hb, show (1 + (2 * t - 1)) / 2 = t by ring] at hr
      exact nonneg_of_mul_nonneg_right hr h2pos

theorem segOK_sound {d a b : ℕ} {cov : Cover1} {p : List Int} (hab : a < b)
    (hok : segOK d a b cov p = true) {x : ℝ} (hx0 : (a : ℝ) ≤ x) (hx1 : x ≤ (b : ℝ)) :
    0 ≤ evalInt p x := by
  simp only [segOK, Bool.and_eq_true] at hok
  have hne : toBernSeg p d (a : Int) ((b : Int) - (a : Int)) ≠ [] := by
    intro h; have := congrArg List.length h; simp [toBernSeg] at this
  have hba : (0 : ℝ) < (b : ℝ) - (a : ℝ) := by
    have : (a : ℝ) < (b : ℝ) := by exact_mod_cast hab
    linarith
  set t := (x - (a : ℝ)) / ((b : ℝ) - (a : ℝ))
  have ht0 : 0 ≤ t := div_nonneg (by linarith) hba.le
  have ht1 : t ≤ 1 := (div_le_one hba).2 (by linarith)
  have hB := bernCoverOK_sound cov _ hne hok.2 t ht0 ht1
  rw [evalBern_toBernSeg hok.1] at hB
  have hx : ((a : Int) : ℝ) + (((b : Int) - (a : Int) : Int) : ℝ) * t = x := by
    push_cast; simp only [t]; field_simp [hba.ne']; ring
  rw [hx] at hB
  have hM : (0 : ℝ) < (lcmChoose d : ℝ) := by exact_mod_cast lcmChoose_pos d
  exact nonneg_of_mul_nonneg_right hB hM

theorem rayOK_sound {d a : ℕ} {cov : Cover1} {p : List Int}
    (hok : rayOK d a cov p = true) {x : ℝ} (hx0 : (a : ℝ) ≤ x) :
    0 ≤ evalInt p x := by
  simp only [rayOK, Bool.and_eq_true] at hok
  have hne : toBernRay p d (a : Int) 10 ≠ [] := by
    intro h; have := congrArg List.length h; simp [toBernRay] at this
  set y := (x - (a : ℝ)) / 10
  have hy : 0 ≤ y := div_nonneg (by linarith) (by norm_num)
  set t := y / (1 + y)
  have h1y : 0 < 1 + y := by linarith
  have ht0 : 0 ≤ t := div_nonneg hy h1y.le
  have ht1 : t < 1 := (div_lt_one h1y).2 (by linarith)
  have h1mt : 0 < 1 - t := by linarith
  have hB := bernCoverOK_sound cov _ hne hok.2 t ht0 ht1.le
  rw [evalBern_toBernRay hok.1 _ _ ht1.ne] at hB
  have hx : ((a : Int) : ℝ) + ((10 : Int) : ℝ) * (t / (1 - t)) = x := by
    push_cast
    have ht_eq : t / (1 - t) = y := by
      simp only [t]; field_simp [h1y.ne']; ring
    rw [ht_eq]; simp only [y]; ring
  rw [hx] at hB
  have hpos : (0 : ℝ) < (lcmChoose d : ℝ) * (1 - t) ^ d :=
    mul_pos (by exact_mod_cast lcmChoose_pos d) (pow_pos h1mt d)
  exact nonneg_of_mul_nonneg_right hB hpos

/-! ### Dual cone convexity and completed-square pointwise bound -/

lemma cone_dot_nonneg {x y z c1 c2 ρ : ℝ} (hx : 0 ≤ x) (hy : 0 ≤ y) (hcone : z ^ 2 ≤ 4 * x * y)
    (hc1 : 0 ≤ c1) (hc2 : 0 ≤ c2) (hρ : ρ ^ 2 ≤ c1 * c2) :
    0 ≤ x * c2 + y * c1 + z * ρ := by
  have hsum : 0 ≤ x * c2 + y * c1 := by positivity
  have hsq : (z * ρ) ^ 2 ≤ (x * c2 + y * c1) ^ 2 := by
    have h1 : (z * ρ) ^ 2 = z ^ 2 * ρ ^ 2 := by ring
    have h2 : z ^ 2 * ρ ^ 2 ≤ (4 * x * y) * (c1 * c2) :=
      mul_le_mul hcone hρ (sq_nonneg ρ) (by positivity)
    nlinarith [sq_nonneg (x * c2 - y * c1)]
  nlinarith [sq_nonneg (x * c2 + y * c1 + z * ρ)]

lemma cone_convex {x0 y0 z0 x1 y1 z1 t : ℝ}
    (hx0 : 0 ≤ x0) (hy0 : 0 ≤ y0) (h0 : z0 ^ 2 ≤ 4 * x0 * y0)
    (hx1 : 0 ≤ x1) (hy1 : 0 ≤ y1) (h1 : z1 ^ 2 ≤ 4 * x1 * y1)
    (ht0 : 0 ≤ t) (ht1 : t ≤ 1) :
    0 ≤ (1 - t) * x0 + t * x1 ∧ 0 ≤ (1 - t) * y0 + t * y1 ∧
      ((1 - t) * z0 + t * z1) ^ 2 ≤ 4 * ((1 - t) * x0 + t * x1) * ((1 - t) * y0 + t * y1) := by
  have h1t : 0 ≤ 1 - t := by linarith
  refine ⟨by positivity, by positivity, ?_⟩
  have hcross_sq : (z0 * z1) ^ 2 ≤ (2 * (x0 * y1 + x1 * y0)) ^ 2 := by
    have ha : (z0 * z1) ^ 2 = z0 ^ 2 * z1 ^ 2 := by ring
    have hb : z0 ^ 2 * z1 ^ 2 ≤ (4 * x0 * y0) * (4 * x1 * y1) :=
      mul_le_mul h0 h1 (sq_nonneg z1) (by positivity)
    nlinarith [sq_nonneg (x0 * y1 - x1 * y0)]
  have hcross_pos : 0 ≤ 2 * (x0 * y1 + x1 * y0) := by positivity
  have hcross : z0 * z1 ≤ 2 * (x0 * y1 + x1 * y0) := by
    nlinarith [sq_nonneg (2 * (x0 * y1 + x1 * y0) - z0 * z1)]
  have hkey : 4 * ((1 - t) * x0 + t * x1) * ((1 - t) * y0 + t * y1)
      - ((1 - t) * z0 + t * z1) ^ 2
      = (1 - t) ^ 2 * (4 * x0 * y0 - z0 ^ 2) + t ^ 2 * (4 * x1 * y1 - z1 ^ 2)
        + 2 * (1 - t) * t * (2 * (x0 * y1 + x1 * y0) - z0 * z1) := by ring
  nlinarith [mul_nonneg (sq_nonneg (1 - t)) (sub_nonneg.2 h0),
    mul_nonneg (sq_nonneg t) (sub_nonneg.2 h1),
    mul_nonneg (mul_nonneg (mul_nonneg (by norm_num : (0 : ℝ) ≤ 2) h1t) ht0)
      (sub_nonneg.2 hcross)]

/-- Pointwise square-completion identity for the five variance budgets plus dual cone. -/
lemma complete_squares_pointwise
    {u c1 c2 ρ lamP phi1 phi2 G1 G2 Y1 Y2 xi2 xi1 xia th2 th4 sigma mu1 mu2 mu3 mu4 mu5 : ℝ}
    (hmu1 : 0 < mu1) (hmu2 : 0 < mu2) (hmu3 : 0 < mu3) (hmu4 : 0 < mu4) (hmu5 : 0 < mu5)
    (hc1 : 0 ≤ c1) (hc2 : 0 ≤ c2) (hρ : ρ ^ 2 ≤ c1 * c2)
    (hxi2 : 0 ≤ xi2) (hxi1 : 0 ≤ xi1) (hcone : xia ^ 2 ≤ 4 * xi1 * xi2) :
    let th3 := xi1 + phi2 / 2 - th2 - th4
    let th1 := xi2 + phi1 + th2 - th3
    let th5 := xia + Y1 + Y2 / 2 - sigma * u
    (lamP + G1 + G2 - (th1 + th2 + 3 * th3 + 2 * th4)
      - (th1 ^ 2 / (4 * mu1) + th2 ^ 2 / (4 * mu2) + th3 ^ 2 / (4 * mu3)
        + th4 ^ 2 / (4 * mu4) + th5 ^ 2 / (4 * mu5)))
      ≤ lamP + (G1 - c2 * phi1 - ρ * Y1) + (G2 - (1 / 2) * c1 * phi2 - (1 / 2) * ρ * Y2)
        + mu1 * (c2 - 1) ^ 2 + mu2 * (c1 - c2 - 1) ^ 2 + mu3 * (c1 + c2 - 3) ^ 2
        + mu4 * (c1 - 2) ^ 2 + mu5 * ρ ^ 2 + sigma * u * ρ := by
  intro th3 th1 th5
  have hcd := cone_dot_nonneg hxi2 hxi1 (by linarith : xia ^ 2 ≤ 4 * xi2 * xi1) hc1 hc2 hρ
  have hs1 : 0 ≤ mu1 * (c2 - 1 - th1 / (2 * mu1)) ^ 2 := mul_nonneg hmu1.le (sq_nonneg _)
  have hs2 : 0 ≤ mu2 * (c1 - c2 - 1 - th2 / (2 * mu2)) ^ 2 := mul_nonneg hmu2.le (sq_nonneg _)
  have hs3 : 0 ≤ mu3 * (c1 + c2 - 3 - th3 / (2 * mu3)) ^ 2 := mul_nonneg hmu3.le (sq_nonneg _)
  have hs4 : 0 ≤ mu4 * (c1 - 2 - th4 / (2 * mu4)) ^ 2 := mul_nonneg hmu4.le (sq_nonneg _)
  have hs5 : 0 ≤ mu5 * (ρ - th5 / (2 * mu5)) ^ 2 := mul_nonneg hmu5.le (sq_nonneg _)
  have hid : lamP + (G1 - c2 * phi1 - ρ * Y1) + (G2 - (1 / 2) * c1 * phi2 - (1 / 2) * ρ * Y2)
        + mu1 * (c2 - 1) ^ 2 + mu2 * (c1 - c2 - 1) ^ 2 + mu3 * (c1 + c2 - 3) ^ 2
        + mu4 * (c1 - 2) ^ 2 + mu5 * ρ ^ 2 + sigma * u * ρ
      - (lamP + G1 + G2 - (th1 + th2 + 3 * th3 + 2 * th4)
        - (th1 ^ 2 / (4 * mu1) + th2 ^ 2 / (4 * mu2) + th3 ^ 2 / (4 * mu3)
          + th4 ^ 2 / (4 * mu4) + th5 ^ 2 / (4 * mu5)))
      = (xi2 * c2 + xi1 * c1 + xia * ρ)
        + mu1 * (c2 - 1 - th1 / (2 * mu1)) ^ 2
        + mu2 * (c1 - c2 - 1 - th2 / (2 * mu2)) ^ 2
        + mu3 * (c1 + c2 - 3 - th3 / (2 * mu3)) ^ 2
        + mu4 * (c1 - 2 - th4 / (2 * mu4)) ^ 2
        + mu5 * (ρ - th5 / (2 * mu5)) ^ 2 := by
    have h1 : mu1 ≠ 0 := hmu1.ne'
    have h2 : mu2 ≠ 0 := hmu2.ne'
    have h3 : mu3 ≠ 0 := hmu3.ne'
    have h4 : mu4 ≠ 0 := hmu4.ne'
    have h5 : mu5 ≠ 0 := hmu5.ne'
    simp only [th1, th3, th5]
    field_simp
    ring
  linarith

/-! ### Rational helpers and piecewise lockstep soundness `(C1)`–`(C2)` -/

/-- Knot mesh `vs = (e_1, ..., e_K)` in `ℚ` with `e_i = knots[i] / 10`. -/
def rowVs (r : RadiusRow) : List ℚ :=
  r.knots.tail.map fun (k : ℕ) ↦ (k : ℚ) / 10

/-- Knot array `vals` scaled down by `arrScale = 2^36`. -/
def rowVals (xs : List Int) : List ℚ :=
  xs.map fun (x : Int) ↦ (x : ℚ) / (arrScale : ℚ)

def rowSlope1 (r : RadiusRow) : ℚ := (r.slope1 : ℚ) / (muScale : ℚ)
def rowSlope2 (r : RadiusRow) : ℚ := (r.slope2 : ℚ) / (muScale : ℚ)

/-- Pointwise majorant expression whose expectation bounds `E|q|` on row `r`. -/
def rowMaj (r : RadiusRow) (u c1 c2 ρ : ℝ) : ℝ :=
  let vs := rowVs r
  let v1 := rowVals r.phi1
  let v2 := rowVals r.phi2
  let sl1 := rowSlope1 r
  let sl2 := rowSlope2 r
  let sL : ℝ := (lamScale : ℝ)
  let sM : ℝ := (muScale : ℝ)
  let l0 : ℝ := (r.lam0 : ℝ) / sL
  let l1 : ℝ := (r.lam1 : ℝ) / sL
  let l2 : ℝ := (r.lam2 : ℝ) / sL
  let l3 : ℝ := ((r.l3s + r.l3a + r.l3b : Int) : ℝ) / sL
  let m1 : ℝ := (r.mu1 : ℝ) / sM
  let m2 : ℝ := (r.mu2 : ℝ) / sM
  let m3 : ℝ := (r.mu3 : ℝ) / sM
  let m4 : ℝ := (r.mu4 : ℝ) / sM
  let m5 : ℝ := (r.mu5 : ℝ) / sM
  let sig : ℝ := (r.sigma : ℝ) / sM
  l0 + l1 * u + l2 * u ^ 2 + l3 * u ^ 3
    + (plPrim vs v1 sl1 u - c2 * plPhi vs v1 sl1 u - ρ * plY vs v1 sl1 u)
    + (plPrim vs v2 sl2 u - (1 / 2) * c1 * plPhi vs v2 sl2 u - (1 / 2) * ρ * plY vs v2 sl2 u)
    + m1 * (c2 - 1) ^ 2 + m2 * (c1 - c2 - 1) ^ 2 + m3 * (c1 + c2 - 3) ^ 2
    + m4 * (c1 - 2) ^ 2 + m5 * ρ ^ 2 + sig * u * ρ

/-- Exact algebraic bridge between `evalInt (pieceFvW ...)` and the real bracket formula. -/
private lemma evalInt_pieceFvW_eq (r : RadiusRow) (tail : Bool) (k0 k1 : ℕ)
    (p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b g1 g2 : Int)
    (hm1 : 0 < r.mu1) (hm2 : 0 < r.mu2) (hm3 : 0 < r.mu3) (hm4 : 0 < r.mu4) (hm5 : 0 < r.mu5)
    (hdu_pos : tail = true ∨ k0 < k1) (u : ℝ) :
    let m1 := r.mu2 * r.mu3 * r.mu4 * r.mu5
    let m2 := r.mu1 * r.mu3 * r.mu4 * r.mu5
    let m3 := r.mu1 * r.mu2 * r.mu4 * r.mu5
    let m4 := r.mu1 * r.mu2 * r.mu3 * r.mu5
    let m5 := r.mu1 * r.mu2 * r.mu3 * r.mu4
    let mAll := r.mu1 * m1
    let U0 : ℝ := ((k0 : ℝ) ^ 2)
    let U1 : ℝ := if tail then U0 else ((k1 : ℝ) ^ 2)
    let du : ℝ := if tail then 1 else U1 - U0
    let interp (a0 a1 : Int) : ℝ :=
      if tail then (a0 : ℝ) / (arrScale : ℝ)
      else ((a0 : ℝ) * U1 - (a1 : ℝ) * U0 + ((a1 : ℝ) - (a0 : ℝ)) * (100 * u))
        / ((arrScale : ℝ) * du)
    let phi1 := interp p1a p1b + ((r.slope1 : ℝ) / (muScale : ℝ)) * u
    let phi2 := interp p2a p2b + ((r.slope2 : ℝ) / (muScale : ℝ)) * u
    let c0_1 := if tail then (100 * rMA : ℝ) * p1a else (100 * rMA : ℝ) * (p1a * U1 - p1b * U0)
    let c1_1 := (if tail then 0 else (100 * rMA : ℝ) * (p1b - p1a)) + (r.slope1 : ℝ) * du
    let c0_2 := if tail then (100 * rMA : ℝ) * p2a else (100 * rMA : ℝ) * (p2a * U1 - p2b * U0)
    let c1_2 := (if tail then 0 else (100 * rMA : ℝ) * (p2b - p2a)) + (r.slope2 : ℝ) * du
    let G1 := (du * g1 + 2 * c0_1 * (100 * u - U0) + c1_1 * ((100 * u) ^ 2 - U0 ^ 2))
      / (20000 * (muScale : ℝ) * du)
    let G2 := (du * g2 + 2 * c0_2 * (100 * u - U0) + c1_2 * ((100 * u) ^ 2 - U0 ^ 2))
      / (20000 * (muScale : ℝ) * du)
    let xi2 := interp x2a x2b
    let xi1 := interp x1a x1b
    let xia := interp xaa xab
    let th2 := interp t2a t2b
    let th4 := interp t4a t4b
    let th3 := xi1 + phi2 / 2 - th2 - th4
    let th1 := xi2 + phi1 + th2 - th3
    let vth5 := u * xia + (u * phi1 - G1) + (u * phi2 - G2) / 2
      - ((r.sigma : ℝ) / (muScale : ℝ)) * u ^ 2
    let sL : ℝ := (lamScale : ℝ)
    let sM : ℝ := (muScale : ℝ)
    let lamP := (r.lam0 : ℝ) / sL + (r.lam1 : ℝ) / sL * u + (r.lam2 : ℝ) / sL * u ^ 2
      + ((r.l3s + r.l3a + r.l3b : Int) : ℝ) / sL * u ^ 3
    let mu1R : ℝ := (r.mu1 : ℝ) / sM
    let mu2R : ℝ := (r.mu2 : ℝ) / sM
    let mu3R : ℝ := (r.mu3 : ℝ) / sM
    let mu4R : ℝ := (r.mu4 : ℝ) / sM
    let mu5R : ℝ := (r.mu5 : ℝ) / sM
    let Wden : ℝ := 10000000000 * sL * du ^ 2 * (mAll : ℝ)
    evalInt (pieceFvW r mAll m1 m2 m3 m4 m5 tail k0 k1
      p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b g1 g2) (100 * u)
      = Wden * (u ^ 2 * (lamP + G1 + G2 - (th1 + th2 + 3 * th3 + 2 * th4)
          - (th1 ^ 2 / (4 * mu1R) + th2 ^ 2 / (4 * mu2R)
            + th3 ^ 2 / (4 * mu3R) + th4 ^ 2 / (4 * mu4R)))
        - vth5 ^ 2 / (4 * mu5R)) := by
  intro m1 m2 m3 m4 m5 mAll U0 U1 du interp phi1 phi2 c0_1 c1_1 c0_2 c1_2 G1 G2
    xi2 xi1 xia th2 th4 th3 th1 vth5 sL sM lamP mu1R mu2R mu3R mu4R mu5R Wden
  have hm1R : (r.mu1 : ℝ) ≠ 0 := by exact_mod_cast hm1.ne'
  have hm2R : (r.mu2 : ℝ) ≠ 0 := by exact_mod_cast hm2.ne'
  have hm3R : (r.mu3 : ℝ) ≠ 0 := by exact_mod_cast hm3.ne'
  have hm4R : (r.mu4 : ℝ) ≠ 0 := by exact_mod_cast hm4.ne'
  have hm5R : (r.mu5 : ℝ) ≠ 0 := by exact_mod_cast hm5.ne'
  have hS_A : (arrScale : ℝ) = 68719476736 := by norm_num [arrScale]
  have hS_M : (muScale : ℝ) = 1125899906842624 := by norm_num [muScale]
  have hS_L : (lamScale : ℝ) = 4611686018427387904 := by norm_num [lamScale]
  have hR_MA : (rMA : ℝ) = 16384 := by norm_num [rMA]
  have hR_LM : (rLM : ℝ) = 4096 := by norm_num [rLM]
  have hdu : du ≠ 0 := by
    cases tail with
    | true => simp [du]
    | false =>
      rcases hdu_pos with h | hlt
      · cases h
      · have hk : (k0 : ℝ) < (k1 : ℝ) := by exact_mod_cast hlt
        have hk0 : (0 : ℝ) ≤ (k0 : ℝ) := Nat.cast_nonneg k0
        simp only [du, U1, U0, Bool.false_eq_true, ↓reduceIte]
        nlinarith
  let U0I : Int := (k0 : Int) * (k0 : Int)
  let U1I : Int := if tail then U0I else (k1 : Int) * (k1 : Int)
  let duI : Int := if tail then 1 else U1I - U0I
  let mkP (a0 a1 : Int) : List Int := if tail then [a0] else [a0 * U1I - a1 * U0I, a1 - a0]
  let ph1p := pAdd (pScale (100 * rMA) (mkP p1a p1b)) [0, r.slope1 * duI]
  let ph2p := pAdd (pScale (100 * rMA) (mkP p2a p2b)) [0, r.slope2 * duI]
  let mkG (g : Int) (ph : List Int) : List Int :=
    let c0 := ph.getD 0 0
    let c1 := ph.getD 1 0
    [duI * g - 2 * c0 * U0I - c1 * U0I * U0I, 2 * c0, c1]
  let G1p := mkG g1 ph1p
  let G2p := mkG g2 ph2p
  let T2 := pScale (200 * rMA) (mkP t2a t2b)
  let T4 := pScale (200 * rMA) (mkP t4a t4b)
  let T3 := pSub (pSub (pAdd (pScale (200 * rMA) (mkP x1a x1b)) ph2p) T2) T4
  let T1 := pSub (pAdd (pAdd (pScale (200 * rMA) (mkP x2a x2b)) (pScale 2 ph1p)) T2) T3
  let T5 := pSub
    (pAdd
      (pSub (pAdd (pShift 1 (pScale (400 * rMA) (mkP xaa xab))) (pShift 1 (pScale 4 ph1p)))
        (pScale 2 G1p))
      (pSub (pShift 1 (pScale 2 ph2p)) G2p))
    [0, 0, 4 * duI * r.sigma]
  let du2M := duI * duI * mAll
  let L3 := r.l3s + r.l3a + r.l3b
  let lamW := [1000000 * r.lam0 * du2M, 10000 * r.lam1 * du2M, 100 * r.lam2 * du2M, L3 * du2M]
  let GW := pScale (50 * rLM * duI * mAll) (pAdd G1p G2p)
  let linC := pAdd (pAdd T1 T2) (pAdd (pScale 3 T3) (pScale 2 T4))
  let linW := pScale (5000 * rLM * duI * mAll) linC
  let sqW := pAdd
    (pAdd (pScale (25600 * m1) (pMul T1 T1)) (pScale (25600 * m2) (pMul T2 T2)))
    (pAdd (pScale (25600 * m3) (pMul T3 T3)) (pScale (25600 * m4) (pMul T4 T4)))
  let brW := pSub (pSub (pAdd lamW GW) linW) sqW
  change evalInt (pSub (pShift 2 brW) (pScale (6400 * m5) (pMul T5 T5))) (100 * u) = _
  have hU0I : (U0I : ℝ) = U0 := by simp [U0I, U0, sq]
  have hU1I : (U1I : ℝ) = U1 := by cases tail <;> simp [U1I, U1, U0I, U0, sq]
  have hduI : (duI : ℝ) = du := by cases tail <;> simp [duI, du, U1I, U0I, U1, U0, sq]
  have hmkP : ∀ a0 a1 : Int, evalInt (mkP a0 a1) (100 * u) = (arrScale : ℝ) * du * interp a0 a1 := by
    intro a0 a1
    cases tail with
    | true =>
      simp only [mkP, interp, du, ↓reduceIte, evalInt_cons, evalInt_nil, mul_zero, add_zero, mul_one]
      rw [hS_A]; field_simp
    | false =>
      simp only [mkP, interp, Bool.false_eq_true, ↓reduceIte, evalInt_cons, evalInt_nil, mul_zero,
        add_zero, Int.cast_sub, Int.cast_mul, hU0I, hU1I]
      rw [hS_A]; field_simp [hdu]
  have hph1 : evalInt ph1p (100 * u) = 100 * sM * du * phi1 := by
    simp only [ph1p, evalInt_add, evalInt_scale, hmkP, evalInt_cons, evalInt_nil, mul_zero,
      add_zero, Int.cast_mul, Int.cast_ofNat, Int.cast_zero, zero_add, hduI]
    simp only [phi1, sM, hS_A, hS_M, hR_MA]; field_simp; ring
  have hph2 : evalInt ph2p (100 * u) = 100 * sM * du * phi2 := by
    simp only [ph2p, evalInt_add, evalInt_scale, hmkP, evalInt_cons, evalInt_nil, mul_zero,
      add_zero, Int.cast_mul, Int.cast_ofNat, Int.cast_zero, zero_add, hduI]
    simp only [phi2, sM, hS_A, hS_M, hR_MA]; field_simp; ring
  have hph1_0 : (ph1p.getD 0 0 : ℝ) = c0_1 := by
    cases tail <;> simp [ph1p, mkP, pAdd, pScale, c0_1, hU0I, hU1I]
  have hph1_1 : (ph1p.getD 1 0 : ℝ) = c1_1 := by
    cases tail <;> simp [ph1p, mkP, pAdd, pScale, c1_1, hduI, du]
  have hph2_0 : (ph2p.getD 0 0 : ℝ) = c0_2 := by
    cases tail <;> simp [ph2p, mkP, pAdd, pScale, c0_2, hU0I, hU1I]
  have hph2_1 : (ph2p.getD 1 0 : ℝ) = c1_2 := by
    cases tail <;> simp [ph2p, mkP, pAdd, pScale, c1_2, hduI, du]
  have hG1 : evalInt G1p (100 * u) = 20000 * sM * du * G1 := by
    simp only [G1p, mkG, evalInt_cons, evalInt_nil, mul_zero, add_zero, Int.cast_sub, Int.cast_mul,
      Int.cast_ofNat, hduI, hU0I, hph1_0, hph1_1]
    simp only [G1, sM, hS_M]; field_simp [hdu]; ring
  have hG2 : evalInt G2p (100 * u) = 20000 * sM * du * G2 := by
    simp only [G2p, mkG, evalInt_cons, evalInt_nil, mul_zero, add_zero, Int.cast_sub, Int.cast_mul,
      Int.cast_ofNat, hduI, hU0I, hph2_0, hph2_1]
    simp only [G2, sM, hS_M]; field_simp [hdu]; ring
  have hT2 : evalInt T2 (100 * u) = 200 * sM * du * th2 := by
    simp only [T2, evalInt_scale, hmkP, Int.cast_mul, Int.cast_ofNat]
    simp only [th2, sM, hS_A, hS_M, hR_MA]; ring
  have hT4 : evalInt T4 (100 * u) = 200 * sM * du * th4 := by
    simp only [T4, evalInt_scale, hmkP, Int.cast_mul, Int.cast_ofNat]
    simp only [th4, sM, hS_A, hS_M, hR_MA]; ring
  have hT3 : evalInt T3 (100 * u) = 200 * sM * du * th3 := by
    simp only [T3, evalInt_sub, evalInt_add, evalInt_scale, hmkP, hph2, hT2, hT4,
      Int.cast_mul, Int.cast_ofNat]
    simp only [th3, xi1, sM, hS_A, hS_M, hR_MA]; ring
  have hT1 : evalInt T1 (100 * u) = 200 * sM * du * th1 := by
    simp only [T1, evalInt_sub, evalInt_add, evalInt_scale, hmkP, hph1, hT2, hT3,
      Int.cast_mul, Int.cast_ofNat]
    simp only [th1, xi2, sM, hS_A, hS_M, hR_MA]; ring
  have hT5 : evalInt T5 (100 * u) = 40000 * sM * du * vth5 := by
    simp only [T5, evalInt_sub, evalInt_add, evalInt_shift, evalInt_scale, hmkP, hph1, hph2,
      hG1, hG2, evalInt_cons, evalInt_nil, mul_zero, add_zero, Int.cast_mul, Int.cast_ofNat,
      Int.cast_zero, zero_add, hduI]
    simp only [vth5, xia, sM, hS_A, hS_M, hR_MA]; field_simp; ring
  have hlamW : evalInt lamW (100 * u) = 1000000 * sL * du ^ 2 * (mAll : ℝ) * lamP := by
    simp only [lamW, L3, du2M, evalInt_cons, evalInt_nil, mul_zero, add_zero, Int.cast_mul,
      Int.cast_ofNat, hduI]
    simp only [lamP, sL, hS_L]; field_simp; ring
  have hGW : evalInt GW (100 * u) = 1000000 * sL * du ^ 2 * (mAll : ℝ) * (G1 + G2) := by
    simp only [GW, evalInt_scale, evalInt_add, hG1, hG2, Int.cast_mul, Int.cast_ofNat, hduI]
    simp only [sL, sM, hS_L, hS_M, hR_LM]; ring
  have hlinW : evalInt linW (100 * u)
      = 1000000 * sL * du ^ 2 * (mAll : ℝ) * (th1 + th2 + 3 * th3 + 2 * th4) := by
    simp only [linW, linC, evalInt_scale, evalInt_add, hT1, hT2, hT3, hT4,
      Int.cast_mul, Int.cast_ofNat, hduI]
    simp only [sL, sM, hS_L, hS_M, hR_LM]; ring
  have hsqW : evalInt sqW (100 * u)
      = 1000000 * sL * du ^ 2 * (mAll : ℝ)
        * (th1 ^ 2 / (4 * mu1R) + th2 ^ 2 / (4 * mu2R)
          + th3 ^ 2 / (4 * mu3R) + th4 ^ 2 / (4 * mu4R)) := by
    simp only [sqW, evalInt_add, evalInt_scale, evalInt_mul, hT1, hT2, hT3, hT4,
      Int.cast_mul, Int.cast_ofNat]
    simp only [mu1R, mu2R, mu3R, mu4R, mAll, m1, m2, m3, m4, sL, sM, hS_L, hS_M, Int.cast_mul]
    field_simp [hm1R, hm2R, hm3R, hm4R]; ring
  simp only [evalInt_sub, evalInt_shift, evalInt_scale, evalInt_mul, brW, evalInt_add,
    hlamW, hGW, hlinW, hsqW, hT5, Int.cast_mul, Int.cast_ofNat]
  simp only [Wden, mu5R, mAll, m1, m5, sL, sM, hS_L, hS_M, Int.cast_mul]
  field_simp [hm5R]
  ring

/-- On the first cell (`k0 = 0`), `evalInt (FvW.drop 2) 0` recovers the `u = 0` value of
`bracket(0) - xia(0)^2 / (4 mu5)`. -/
private lemma evalInt_pieceFvW_zero (r : RadiusRow) (k1 : ℕ)
    (p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b : Int)
    (hm1 : 0 < r.mu1) (hm2 : 0 < r.mu2) (hm3 : 0 < r.mu3) (hm4 : 0 < r.mu4) (hm5 : 0 < r.mu5)
    (hk1 : 0 < k1)
    (h0 : (pieceFvW r (r.mu1 * (r.mu2 * r.mu3 * r.mu4 * r.mu5))
      (r.mu2 * r.mu3 * r.mu4 * r.mu5) (r.mu1 * r.mu3 * r.mu4 * r.mu5)
      (r.mu1 * r.mu2 * r.mu4 * r.mu5) (r.mu1 * r.mu2 * r.mu3 * r.mu5)
      (r.mu1 * r.mu2 * r.mu3 * r.mu4) false 0 k1
      p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b 0 0).getD 0 0 = 0)
    (h1 : (pieceFvW r (r.mu1 * (r.mu2 * r.mu3 * r.mu4 * r.mu5))
      (r.mu2 * r.mu3 * r.mu4 * r.mu5) (r.mu1 * r.mu3 * r.mu4 * r.mu5)
      (r.mu1 * r.mu2 * r.mu4 * r.mu5) (r.mu1 * r.mu2 * r.mu3 * r.mu5)
      (r.mu1 * r.mu2 * r.mu3 * r.mu4) false 0 k1
      p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b 0 0).getD 1 0 = 0) :
    let m1 := r.mu2 * r.mu3 * r.mu4 * r.mu5
    let m2 := r.mu1 * r.mu3 * r.mu4 * r.mu5
    let m3 := r.mu1 * r.mu2 * r.mu4 * r.mu5
    let m4 := r.mu1 * r.mu2 * r.mu3 * r.mu5
    let m5 := r.mu1 * r.mu2 * r.mu3 * r.mu4
    let mAll := r.mu1 * m1
    let du : ℝ := (k1 : ℝ) ^ 2
    let sA : ℝ := (arrScale : ℝ)
    let sM : ℝ := (muScale : ℝ)
    let sL : ℝ := (lamScale : ℝ)
    let phi1 : ℝ := (p1a : ℝ) / sA
    let phi2 : ℝ := (p2a : ℝ) / sA
    let xi2 : ℝ := (x2a : ℝ) / sA
    let xi1 : ℝ := (x1a : ℝ) / sA
    let xia : ℝ := (xaa : ℝ) / sA
    let th2 : ℝ := (t2a : ℝ) / sA
    let th4 : ℝ := (t4a : ℝ) / sA
    let th3 : ℝ := xi1 + phi2 / 2 - th2 - th4
    let th1 : ℝ := xi2 + phi1 + th2 - th3
    let mu1R : ℝ := (r.mu1 : ℝ) / sM
    let mu2R : ℝ := (r.mu2 : ℝ) / sM
    let mu3R : ℝ := (r.mu3 : ℝ) / sM
    let mu4R : ℝ := (r.mu4 : ℝ) / sM
    let mu5R : ℝ := (r.mu5 : ℝ) / sM
    evalInt ((pieceFvW r mAll m1 m2 m3 m4 m5 false 0 k1
      p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b 0 0).drop 2) 0
      = (1000000 * sL * du ^ 2 * (mAll : ℝ))
        * ((r.lam0 : ℝ) / sL - (th1 + th2 + 3 * th3 + 2 * th4)
          - (th1 ^ 2 / (4 * mu1R) + th2 ^ 2 / (4 * mu2R)
            + th3 ^ 2 / (4 * mu3R) + th4 ^ 2 / (4 * mu4R)
            + xia ^ 2 / (4 * mu5R))) := by
  intro m1 m2 m3 m4 m5 mAll du sA sM sL phi1 phi2 xi2 xi1 xia th2 th4 th3 th1
    mu1R mu2R mu3R mu4R mu5R
  set FvW := pieceFvW r mAll m1 m2 m3 m4 m5 false 0 k1
    p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b 0 0
  let interp0 (a0 a1 : Int) (u : ℝ) : ℝ :=
    ((a0 : ℝ) * du + ((a1 : ℝ) - (a0 : ℝ)) * (100 * u)) / (sA * du)
  let phi1u (u : ℝ) : ℝ := interp0 p1a p1b u + (r.slope1 : ℝ) / sM * u
  let phi2u (u : ℝ) : ℝ := interp0 p2a p2b u + (r.slope2 : ℝ) / sM * u
  let G1u (u : ℝ) : ℝ := (2 * ((100 * rMA : ℝ) * (p1a * du)) * (100 * u)
      + ((100 * rMA : ℝ) * (p1b - p1a) + (r.slope1 : ℝ) * du) * (100 * u) ^ 2) / (20000 * sM * du)
  let G2u (u : ℝ) : ℝ := (2 * ((100 * rMA : ℝ) * (p2a * du)) * (100 * u)
      + ((100 * rMA : ℝ) * (p2b - p2a) + (r.slope2 : ℝ) * du) * (100 * u) ^ 2) / (20000 * sM * du)
  let xi2u (u : ℝ) : ℝ := interp0 x2a x2b u
  let xi1u (u : ℝ) : ℝ := interp0 x1a x1b u
  let xiau (u : ℝ) : ℝ := interp0 xaa xab u
  let th2u (u : ℝ) : ℝ := interp0 t2a t2b u
  let th4u (u : ℝ) : ℝ := interp0 t4a t4b u
  let th3u (u : ℝ) : ℝ := xi1u u + phi2u u / 2 - th2u u - th4u u
  let th1u (u : ℝ) : ℝ := xi2u u + phi1u u + th2u u - th3u u
  let y1u (u : ℝ) : ℝ :=
    (((100 * rMA : ℝ) * (p1b - p1a) + (r.slope1 : ℝ) * du) * (100 * u)) / (200 * sM * du)
  let y2u (u : ℝ) : ℝ :=
    (((100 * rMA : ℝ) * (p2b - p2a) + (r.slope2 : ℝ) * du) * (100 * u)) / (200 * sM * du)
  let th5u (u : ℝ) : ℝ := xiau u + y1u u + y2u u / 2 - (r.sigma : ℝ) / sM * u
  let lamPu (u : ℝ) : ℝ := (r.lam0 : ℝ) / sL + (r.lam1 : ℝ) / sL * u + (r.lam2 : ℝ) / sL * u ^ 2
      + ((r.l3s + r.l3a + r.l3b : Int) : ℝ) / sL * u ^ 3
  let rhs (u : ℝ) : ℝ := (1000000 * sL * du ^ 2 * (mAll : ℝ))
      * (lamPu u + G1u u + G2u u - (th1u u + th2u u + 3 * th3u u + 2 * th4u u)
        - (th1u u ^ 2 / (4 * mu1R) + th2u u ^ 2 / (4 * mu2R)
          + th3u u ^ 2 / (4 * mu3R) + th4u u ^ 2 / (4 * mu4R)
          + th5u u ^ 2 / (4 * mu5R)))
  have hdu0 : du ≠ 0 := by positivity
  have hS_A : sA = 68719476736 := by norm_num [sA, arrScale]
  have hS_M : sM = 1125899906842624 := by norm_num [sM, muScale]
  have hR_MA : (rMA : ℝ) = 16384 := by norm_num [rMA]
  have hlim : ∀ᶠ u : ℝ in nhdsWithin 0 (Set.Ioi 0), evalInt (FvW.drop 2) (100 * u) = rhs u := by
    refine Filter.eventually_of_mem self_mem_nhdsWithin fun u (hu : 0 < u) ↦ ?_
    have hEq := evalInt_pieceFvW_eq r false 0 k1
      p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b 0 0
      hm1 hm2 hm3 hm4 hm5 (Or.inr hk1) u
    dsimp only at hEq
    rw [evalInt_drop2 FvW h0 h1 (100 * u)] at hEq
    have h100u : (100 * u) ^ 2 ≠ 0 := by positivity
    have hY1 : u * phi1u u - G1u u = u * y1u u := by
      simp only [phi1u, G1u, y1u, interp0, hS_A, hS_M, hR_MA]; field_simp [hdu0]; ring
    have hY2 : u * phi2u u - G2u u = u * y2u u := by
      simp only [phi2u, G2u, y2u, interp0, hS_A, hS_M, hR_MA]; field_simp [hdu0]; ring
    simp only [Bool.false_eq_true, ↓reduceIte, Nat.cast_zero, ne_eq, OfNat.ofNat_ne_zero,
      not_false_eq_true, zero_pow, sub_zero, mul_zero, Int.cast_zero, zero_add] at hEq
    change (100 * u) ^ 2 * evalInt (FvW.drop 2) (100 * u) =
      (10000000000 * sL * du ^ 2 * (mAll : ℝ))
        * (u ^ 2 * (lamPu u + G1u u + G2u u - (th1u u + th2u u + 3 * th3u u + 2 * th4u u)
            - (th1u u ^ 2 / (4 * mu1R) + th2u u ^ 2 / (4 * mu2R)
              + th3u u ^ 2 / (4 * mu3R) + th4u u ^ 2 / (4 * mu4R)))
          - (u * xiau u + (u * phi1u u - G1u u) + (u * phi2u u - G2u u) / 2
            - (r.sigma : ℝ) / sM * u ^ 2) ^ 2 / (4 * mu5R)) at hEq
    rw [hY1, hY2] at hEq
    have hth5_sq : (u * xiau u + u * y1u u + u * y2u u / 2 - (r.sigma : ℝ) / sM * u ^ 2) ^ 2
        = u ^ 2 * th5u u ^ 2 := by simp only [th5u]; ring
    rw [hth5_sq] at hEq
    apply mul_left_cancel₀ h100u
    rw [hEq]
    simp only [rhs]; ring
  have hcontL : Continuous fun u : ℝ ↦ evalInt (FvW.drop 2) (100 * u) := by
    have : ∀ p : List Int, Continuous fun x : ℝ ↦ evalInt p x := fun p ↦ by
      induction p with
      | nil => exact continuous_const
      | cons a p ih => exact continuous_const.add (continuous_id.mul ih)
    exact (this (FvW.drop 2)).comp (continuous_const_mul 100)
  have hcontR : Continuous rhs := by
    simp only [rhs, lamPu, G1u, G2u, th1u, th3u, th5u, y1u, y2u, phi1u, phi2u, xi2u, xi1u, xiau,
      th2u, th4u, interp0]
    fun_prop
  have heq0 := tendsto_nhds_unique
    ((hcontL.tendsto 0).mono_left nhdsWithin_le_nhds)
    (((hcontR.tendsto 0).mono_left nhdsWithin_le_nhds).congr' (hlim.mono fun _ h ↦ h.symm))
  simp only [mul_zero] at heq0
  rw [heq0]
  have hinterp0 : ∀ a0 a1 : Int, interp0 a0 a1 0 = (a0 : ℝ) / sA := fun a0 a1 ↦ by
    simp only [interp0, mul_zero, add_zero]; field_simp [hdu0]
  simp only [rhs, lamPu, G1u, G2u, th1u, th3u, th5u, y1u, y2u, phi1u, phi2u, xi2u, xi1u, xiau,
    th2u, th4u, hinterp0, mul_zero, add_zero, zero_div, sub_zero, ne_eq,
    OfNat.ofNat_ne_zero, not_false_eq_true, zero_pow]
  rfl

/-- Helper: extract the tail constant `tc` of a non-empty list, matching `tailConst`. -/
private lemma tailConst_rowVals_eq {ks : List ℕ} {xs : List Int} (hlen : xs.length = ks.length)
    (hne : ks ≠ []) :
    tailConst (ks.tail.map fun (k : ℕ) ↦ (k : ℚ) / 10) (rowVals xs)
      = ((xs.getLast (by intro h; simp [h] at hlen; exact hne (List.eq_nil_of_length_eq_zero hlen.symm)) : ℚ)
        / (arrScale : ℚ)) := by
  unfold tailConst rowVals
  have hpos : 0 < ks.length := List.length_pos_iff.2 hne
  have hidx : (ks.tail.map fun (k : ℕ) ↦ (k : ℚ) / 10).length = xs.length - 1 := by
    simp [hlen]
  rw [hidx, List.getD_eq_getElem _ _ (by simp; omega)]
  simp [List.getLast_eq_getElem]

/-- Extract `coneAtOK` for the head knot of a passing `checkPiecesAux`. -/
private lemma checkPiecesAux_head_cone {r : RadiusRow} {mAll m1 m2 m3 m4 m5 : Int}
    {first : Bool} {g1 g2 : Int} {k0 : ℕ} {ks : List ℕ}
    {p1s p2s x2s x1s xas t2s t4s : List Int} {x2a x1a xaa : Int} {covs : List Cover1}
    (hok : checkPiecesAux r mAll m1 m2 m3 m4 m5 first g1 g2
      (k0 :: ks) p1s p2s (x2a :: x2s) (x1a :: x1s) (xaa :: xas) t2s t4s covs = true) :
    coneAtOK x2a x1a xaa = true := by
  cases ks with
  | nil =>
    cases p1s with
    | nil => simp [checkPiecesAux] at hok
    | cons _ p1s' =>
      cases p1s' with
      | cons _ _ => simp [checkPiecesAux] at hok
      | nil =>
        cases p2s with
        | nil => simp [checkPiecesAux] at hok
        | cons _ p2s' =>
          cases p2s' with
          | cons _ _ => simp [checkPiecesAux] at hok
          | nil =>
            cases x2s with
            | cons _ _ => simp [checkPiecesAux] at hok
            | nil =>
              cases x1s with
              | cons _ _ => simp [checkPiecesAux] at hok
              | nil =>
                cases xas with
                | cons _ _ => simp [checkPiecesAux] at hok
                | nil =>
                  cases t2s with
                  | nil => simp [checkPiecesAux] at hok
                  | cons _ t2s' =>
                    cases t2s' with
                    | cons _ _ => simp [checkPiecesAux] at hok
                    | nil =>
                      cases t4s with
                      | nil => simp [checkPiecesAux] at hok
                      | cons _ t4s' =>
                        cases t4s' with
                        | cons _ _ => simp [checkPiecesAux] at hok
                        | nil =>
                          cases covs with
                          | nil => simp [checkPiecesAux] at hok
                          | cons _ covs' =>
                            cases covs' with
                            | cons _ _ => simp [checkPiecesAux] at hok
                            | nil =>
                              simp only [checkPiecesAux, Bool.and_eq_true] at hok
                              exact hok.1.2
  | cons k1 ks' =>
    cases p1s with
    | nil => simp [checkPiecesAux] at hok
    | cons _ p1s' =>
      cases p1s' with
      | nil => simp [checkPiecesAux] at hok
      | cons _ _ =>
        cases p2s with
        | nil => simp [checkPiecesAux] at hok
        | cons _ p2s' =>
          cases p2s' with
          | nil => simp [checkPiecesAux] at hok
          | cons _ _ =>
            cases x2s with
            | nil => simp [checkPiecesAux] at hok
            | cons _ _ =>
              cases x1s with
              | nil => simp [checkPiecesAux] at hok
              | cons _ _ =>
                cases xas with
                | nil => simp [checkPiecesAux] at hok
                | cons _ _ =>
                  cases t2s with
                  | nil => simp [checkPiecesAux] at hok
                  | cons _ t2s' =>
                    cases t2s' with
                    | nil => simp [checkPiecesAux] at hok
                    | cons _ _ =>
                      cases t4s with
                      | nil => simp [checkPiecesAux] at hok
                      | cons _ t4s' =>
                        cases t4s' with
                        | nil => simp [checkPiecesAux] at hok
                        | cons _ _ =>
                          cases covs with
                          | nil => simp [checkPiecesAux] at hok
                          | cons _ _ =>
                            simp only [checkPiecesAux, Bool.and_eq_true] at hok
                            exact hok.1.1.2

private lemma coneAtOK_real {x2 x1 xa : Int} (h : coneAtOK x2 x1 xa = true) :
    0 ≤ (x2 : ℝ) / (arrScale : ℝ) ∧ 0 ≤ (x1 : ℝ) / (arrScale : ℝ) ∧
      ((xa : ℝ) / (arrScale : ℝ)) ^ 2
        ≤ 4 * ((x1 : ℝ) / (arrScale : ℝ)) * ((x2 : ℝ) / (arrScale : ℝ)) := by
  simp only [coneAtOK, Bool.and_eq_true, decide_eq_true_eq] at h
  have hSA : (0 : ℝ) < (arrScale : ℝ) := by norm_num [arrScale]
  have hx2 : (0 : ℝ) ≤ x2 := by exact_mod_cast h.1.1
  have hx1 : (0 : ℝ) ≤ x1 := by exact_mod_cast h.1.2
  have hc : (xa : ℝ) * xa ≤ 4 * (x1 : ℝ) * x2 := by exact_mod_cast h.2
  refine ⟨by positivity, by positivity, ?_⟩
  rw [div_pow, show 4 * ((x1 : ℝ) / arrScale) * ((x2 : ℝ) / arrScale)
      = (4 * (x1 : ℝ) * x2) / (arrScale : ℝ) ^ 2 by ring]
  exact div_le_div_of_nonneg_right (by nlinarith) (sq_nonneg _)

/-- Soundness of the infinite tail cell (`[kK]`) in `checkPiecesAux`. -/
private lemma checkPiecesAux_tail_sound (r : RadiusRow)
    (hm1 : 0 < r.mu1) (hm2 : 0 < r.mu2) (hm3 : 0 < r.mu3) (hm4 : 0 < r.mu4) (hm5 : 0 < r.mu5)
    (cv1 cv2 : List ℚ) (tc1 tc2 : ℚ) (g1 g2 : Int) (Phi1 Phi2 : ℚ) (idx kK : ℕ)
    (p1 p2 x2 x1 xa t2 t4 : Int) (cov : Cover1)
    (hkKpos : 0 < kK)
    (htc1 : (p1 : ℚ) / (arrScale : ℚ) = tc1)
    (htc2 : (p2 : ℚ) / (arrScale : ℚ) = tc2)
    (hg1 : (g1 : ℝ) = 20000 * (muScale : ℝ) * ((Phi1 : ℝ) + (tc1 : ℝ) * ((kK : ℝ) / 10) ^ 2
      + (rowSlope1 r : ℝ) / 2 * (((kK : ℝ) / 10) ^ 2) ^ 2))
    (hg2 : (g2 : ℝ) = 20000 * (muScale : ℝ) * ((Phi2 : ℝ) + (tc2 : ℝ) * ((kK : ℝ) / 10) ^ 2
      + (rowSlope2 r : ℝ) / 2 * (((kK : ℝ) / 10) ^ 2) ^ 2))
    (hconeOK : coneAtOK x2 x1 xa = true)
    (hray : checkOneCell r (r.mu1 * (r.mu2 * r.mu3 * r.mu4 * r.mu5))
      (r.mu2 * r.mu3 * r.mu4 * r.mu5) (r.mu1 * r.mu3 * r.mu4 * r.mu5)
      (r.mu1 * r.mu2 * r.mu4 * r.mu5) (r.mu1 * r.mu2 * r.mu3 * r.mu5)
      (r.mu1 * r.mu2 * r.mu3 * r.mu4) false true kK kK
      p1 p1 p2 p2 x2 x2 x1 x1 xa xa t2 t2 t4 t4 g1 g2 cov = true)
    (u c1 c2 ρ : ℝ) (hu : ((kK : ℝ) / 10) ^ 2 ≤ u) (hc1 : 0 ≤ c1) (hc2 : 0 ≤ c2)
    (hρ : ρ ^ 2 ≤ c1 * c2) :
    let t0 : ℚ := ((kK : ℚ) / 10) ^ 2
    let cell1 := (cutAux cv1 t0 (cv1.getD idx 0) Phi1 idx []).getD (pickIdx [] (√u)) ⟨0, 0, 0⟩
    let cell2 := (cutAux cv2 t0 (cv2.getD idx 0) Phi2 idx []).getD (pickIdx [] (√u)) ⟨0, 0, 0⟩
    let phi1 := cellPhi cell1 u + (tc1 : ℝ) + (rowSlope1 r : ℝ) * u
    let phi2 := cellPhi cell2 u + (tc2 : ℝ) + (rowSlope2 r : ℝ) * u
    let G1 := cellPrim cell1 u + (tc1 : ℝ) * u + (rowSlope1 r : ℝ) / 2 * u ^ 2
    let G2 := cellPrim cell2 u + (tc2 : ℝ) * u + (rowSlope2 r : ℝ) / 2 * u ^ 2
    let Y1 := (if u = 0 then 0 else cellPhi cell1 u - cellPrim cell1 u / u)
      + (rowSlope1 r : ℝ) / 2 * u
    let Y2 := (if u = 0 then 0 else cellPhi cell2 u - cellPrim cell2 u / u)
      + (rowSlope2 r : ℝ) / 2 * u
    let sL : ℝ := (lamScale : ℝ)
    let sM : ℝ := (muScale : ℝ)
    √u ≤ (r.lam0 : ℝ) / sL + (r.lam1 : ℝ) / sL * u + (r.lam2 : ℝ) / sL * u ^ 2
        + ((r.l3s + r.l3a + r.l3b : Int) : ℝ) / sL * u ^ 3
        + (G1 - c2 * phi1 - ρ * Y1)
        + (G2 - (1 / 2) * c1 * phi2 - (1 / 2) * ρ * Y2)
        + ((r.mu1 : ℝ) / sM) * (c2 - 1) ^ 2 + ((r.mu2 : ℝ) / sM) * (c1 - c2 - 1) ^ 2
        + ((r.mu3 : ℝ) / sM) * (c1 + c2 - 3) ^ 2 + ((r.mu4 : ℝ) / sM) * (c1 - 2) ^ 2
        + ((r.mu5 : ℝ) / sM) * ρ ^ 2 + ((r.sigma : ℝ) / sM) * u * ρ := by
  simp only [checkOneCell, Bool.false_eq_true, ↓reduceIte] at hray
  have hu_pos : 0 < u := by
    have hkR : (0 : ℝ) < (kK : ℝ) / 10 := div_pos (by exact_mod_cast hkKpos) (by norm_num)
    exact lt_of_lt_of_le (sq_pos_of_pos hkR) hu
  have hr0 : (kK : ℝ) / 10 ≤ √u := (Real.le_sqrt (by positivity) hu_pos.le).2 hu
  have hpos_eval := rayOK_sound hray (by linarith only [hr0] : (kK : ℝ) ≤ 10 * √u)
  rw [evalInt_sub, evalInt_inSq, evalInt_pow5] at hpos_eval
  have hsq : (10 * √u) ^ 2 = 100 * u := by rw [mul_pow, Real.sq_sqrt hu_pos.le]; norm_num
  rw [hsq] at hpos_eval
  have hFv := evalInt_pieceFvW_eq r true kK kK p1 p1 p2 p2 x2 x2 x1 x1 xa xa t2 t2 t4 t4 g1 g2
    hm1 hm2 hm3 hm4 hm5 (Or.inl rfl) u
  dsimp only at hFv
  simp only [↓reduceIte] at hFv
  rw [hFv] at hpos_eval
  have htc1R : (tc1 : ℝ) = (p1 : ℝ) / (arrScale : ℝ) := by exact_mod_cast htc1.symm
  have htc2R : (tc2 : ℝ) = (p2 : ℝ) / (arrScale : ℝ) := by exact_mod_cast htc2.symm
  have hsl1 : (rowSlope1 r : ℝ) = (r.slope1 : ℝ) / (muScale : ℝ) := by
    unfold rowSlope1; push_cast; rfl
  have hsl2 : (rowSlope2 r : ℝ) = (r.slope2 : ℝ) / (muScale : ℝ) := by
    unfold rowSlope2; push_cast; rfl
  have hS_A : (arrScale : ℝ) = 68719476736 := by norm_num [arrScale]
  have hS_M : (muScale : ℝ) = 1125899906842624 := by norm_num [muScale]
  have hR_MA : (rMA : ℝ) = 16384 := by norm_num [rMA]
  set lamP_v := (r.lam0 : ℝ) / (lamScale : ℝ) + (r.lam1 : ℝ) / (lamScale : ℝ) * u
    + (r.lam2 : ℝ) / (lamScale : ℝ) * u ^ 2
    + ((r.l3s + r.l3a + r.l3b : Int) : ℝ) / (lamScale : ℝ) * u ^ 3
  set phi1_v := (p1 : ℝ) / (arrScale : ℝ) + (r.slope1 : ℝ) / (muScale : ℝ) * u
  set phi2_v := (p2 : ℝ) / (arrScale : ℝ) + (r.slope2 : ℝ) / (muScale : ℝ) * u
  set G1_v := (Phi1 : ℝ) + (tc1 : ℝ) * u + (rowSlope1 r : ℝ) / 2 * u ^ 2
  set G2_v := (Phi2 : ℝ) + (tc2 : ℝ) * u + (rowSlope2 r : ℝ) / 2 * u ^ 2
  set Y1_v := 0 - (Phi1 : ℝ) / u + (rowSlope1 r : ℝ) / 2 * u
  set Y2_v := 0 - (Phi2 : ℝ) / u + (rowSlope2 r : ℝ) / 2 * u
  set xi2_v := (x2 : ℝ) / (arrScale : ℝ)
  set xi1_v := (x1 : ℝ) / (arrScale : ℝ)
  set xia_v := (xa : ℝ) / (arrScale : ℝ)
  set th2_v := (t2 : ℝ) / (arrScale : ℝ)
  set th4_v := (t4 : ℝ) / (arrScale : ℝ)
  set th3_v := xi1_v + phi2_v / 2 - th2_v - th4_v
  set th1_v := xi2_v + phi1_v + th2_v - th3_v
  set th5_v := xia_v + Y1_v + Y2_v / 2 - (r.sigma : ℝ) / (muScale : ℝ) * u
  have hG1_eq : (1 * (g1 : ℝ) + 2 * ((100 * rMA : ℝ) * p1) * (100 * u - (kK : ℝ) ^ 2)
      + (0 + (r.slope1 : ℝ) * 1) * ((100 * u) ^ 2 - ((kK : ℝ) ^ 2) ^ 2))
      / (20000 * (muScale : ℝ) * 1) = G1_v := by
    simp only [G1_v]; rw [hg1, htc1R, hsl1, hS_A, hS_M, hR_MA]; field_simp; ring
  have hG2_eq : (1 * (g2 : ℝ) + 2 * ((100 * rMA : ℝ) * p2) * (100 * u - (kK : ℝ) ^ 2)
      + (0 + (r.slope2 : ℝ) * 1) * ((100 * u) ^ 2 - ((kK : ℝ) ^ 2) ^ 2))
      / (20000 * (muScale : ℝ) * 1) = G2_v := by
    simp only [G2_v]; rw [hg2, htc2R, hsl2, hS_A, hS_M, hR_MA]; field_simp; ring
  have hY1u : u * phi1_v - G1_v = u * Y1_v := by
    simp only [phi1_v, G1_v, Y1_v]; rw [htc1R, hsl1]; field_simp [hu_pos.ne']; ring
  have hY2u : u * phi2_v - G2_v = u * Y2_v := by
    simp only [phi2_v, G2_v, Y2_v]; rw [htc2R, hsl2]; field_simp [hu_pos.ne']; ring
  have hWpos : (0 : ℝ) < 10000000000 * (lamScale : ℝ) * (1 : ℝ) ^ 2
      * ((r.mu1 * (r.mu2 * r.mu3 * r.mu4 * r.mu5) : Int) : ℝ) := by
    have h1 : (0 : ℝ) < r.mu1 := by exact_mod_cast hm1
    have h2 : (0 : ℝ) < r.mu2 := by exact_mod_cast hm2
    have h3 : (0 : ℝ) < r.mu3 := by exact_mod_cast hm3
    have h4 : (0 : ℝ) < r.mu4 := by exact_mod_cast hm4
    have h5 : (0 : ℝ) < r.mu5 := by exact_mod_cast hm5
    have hL : (0 : ℝ) < (lamScale : ℝ) := by norm_num [lamScale]
    push_cast; positivity
  have h5pow : (10 * √u) ^ 5 = 100000 * u ^ 2 * √u := by
    calc (10 * √u) ^ 5 = 100000 * ((√u) ^ 2) ^ 2 * √u := by ring
      _ = 100000 * u ^ 2 * √u := by rw [Real.sq_sqrt hu_pos.le]
  have hbr_ge : √u ≤ lamP_v + G1_v + G2_v - (th1_v + th2_v + 3 * th3_v + 2 * th4_v)
      - (th1_v ^ 2 / (4 * ((r.mu1 : ℝ) / muScale)) + th2_v ^ 2 / (4 * ((r.mu2 : ℝ) / muScale))
        + th3_v ^ 2 / (4 * ((r.mu3 : ℝ) / muScale)) + th4_v ^ 2 / (4 * ((r.mu4 : ℝ) / muScale))
        + th5_v ^ 2 / (4 * ((r.mu5 : ℝ) / muScale))) := by
    rw [hG1_eq, hG2_eq] at hpos_eval
    change 0 ≤ (10000000000 * (lamScale : ℝ) * (1 : ℝ) ^ 2
        * ((r.mu1 * (r.mu2 * r.mu3 * r.mu4 * r.mu5) : Int) : ℝ))
      * (u ^ 2 * (lamP_v + G1_v + G2_v - (th1_v + th2_v + 3 * th3_v + 2 * th4_v)
          - (th1_v ^ 2 / (4 * ((r.mu1 : ℝ) / muScale))
            + th2_v ^ 2 / (4 * ((r.mu2 : ℝ) / muScale))
            + th3_v ^ 2 / (4 * ((r.mu3 : ℝ) / muScale))
            + th4_v ^ 2 / (4 * ((r.mu4 : ℝ) / muScale))))
        - (u * xia_v + (u * phi1_v - G1_v) + (u * phi2_v - G2_v) / 2
          - (r.sigma : ℝ) / (muScale : ℝ) * u ^ 2) ^ 2
          / (4 * ((r.mu5 : ℝ) / muScale))) - _ at hpos_eval
    have hsq5 : (u * xia_v + (u * phi1_v - G1_v) + (u * phi2_v - G2_v) / 2
        - (r.sigma : ℝ) / (muScale : ℝ) * u ^ 2) ^ 2 = u ^ 2 * th5_v ^ 2 := by
      rw [hY1u, hY2u]; simp only [th5_v]; ring
    rw [hsq5] at hpos_eval
    have htail_rhs : (((100000 * lamScale * (1 * 1
        * (r.mu1 * (r.mu2 * r.mu3 * r.mu4 * r.mu5))) : Int) : ℝ)) * (10 * √u) ^ 5
        = (10000000000 * (lamScale : ℝ) * (1 : ℝ) ^ 2
          * ((r.mu1 * (r.mu2 * r.mu3 * r.mu4 * r.mu5) : Int) : ℝ)) * u ^ 2 * √u := by
      rw [h5pow]; simp only [Int.cast_mul, Int.cast_ofNat, Int.cast_one]; ring
    rw [htail_rhs] at hpos_eval
    have hWu : 0 < (10000000000 * (lamScale : ℝ) * (1 : ℝ) ^ 2
        * ((r.mu1 * (r.mu2 * r.mu3 * r.mu4 * r.mu5) : Int) : ℝ)) * u ^ 2 :=
      mul_pos hWpos (sq_pos_of_pos hu_pos)
    refine le_of_sub_nonneg (nonneg_of_mul_nonneg_right ?_ hWu)
    exact hpos_eval.trans_eq (by ring)
  obtain ⟨hxi2, hxi1, hconeR⟩ := coneAtOK_real hconeOK
  have hmu1R : (0 : ℝ) < (r.mu1 : ℝ) / (muScale : ℝ) :=
    div_pos (by exact_mod_cast hm1) (by norm_num [muScale])
  have hmu2R : (0 : ℝ) < (r.mu2 : ℝ) / (muScale : ℝ) :=
    div_pos (by exact_mod_cast hm2) (by norm_num [muScale])
  have hmu3R : (0 : ℝ) < (r.mu3 : ℝ) / (muScale : ℝ) :=
    div_pos (by exact_mod_cast hm3) (by norm_num [muScale])
  have hmu4R : (0 : ℝ) < (r.mu4 : ℝ) / (muScale : ℝ) :=
    div_pos (by exact_mod_cast hm4) (by norm_num [muScale])
  have hmu5R : (0 : ℝ) < (r.mu5 : ℝ) / (muScale : ℝ) :=
    div_pos (by exact_mod_cast hm5) (by norm_num [muScale])
  have hcs := complete_squares_pointwise (u := u) (c1 := c1) (c2 := c2) (ρ := ρ)
    (lamP := lamP_v) (phi1 := phi1_v) (phi2 := phi2_v) (G1 := G1_v) (G2 := G2_v)
    (Y1 := Y1_v) (Y2 := Y2_v) (xi2 := xi2_v) (xi1 := xi1_v) (xia := xia_v)
    (th2 := th2_v) (th4 := th4_v) (sigma := (r.sigma : ℝ) / muScale)
    hmu1R hmu2R hmu3R hmu4R hmu5R hc1 hc2 hρ hxi2 hxi1 hconeR
  refine hbr_ge.trans (hcs.trans_eq ?_)
  simp only [cutAux, pickIdx, List.getD_cons_zero, cellPhi, cellPrim, Rat.cast_zero, zero_mul,
    add_zero, zero_add, zero_div, hu_pos.ne', ↓reduceIte, lamP_v, phi1_v, phi2_v, G1_v, G2_v,
    Y1_v, Y2_v, htc1R, htc2R, hsl1, hsl2]

/-- Factor `W * u ^ 2 > 0` out of the scaled piece-polynomial inequality without
unfolding local `set`-bound variables inside `ring`. -/
private lemma factor_u2_bracket {W u A b1 b2 b3 b4 b5 m5 r : ℝ}
    (h : 0 ≤ W * (u ^ 2 * (A - (b1 + b2 + b3 + b4)) - u ^ 2 * b5 / m5) - W * u ^ 2 * r)
    (hWu : 0 < W * u ^ 2) :
    r ≤ A - (b1 + b2 + b3 + b4 + b5 / m5) := by
  refine le_of_sub_nonneg (nonneg_of_mul_nonneg_right ?_ hWu)
  exact h.trans_eq (by ring)

/-- Soundness of one finite segment cell `[k0/10, k1/10]` (`first = true` or `false`). -/
private lemma checkPiecesAux_seg_sound (r : RadiusRow)
    (hm1 : 0 < r.mu1) (hm2 : 0 < r.mu2) (hm3 : 0 < r.mu3) (hm4 : 0 < r.mu4) (hm5 : 0 < r.mu5)
    (cv1 cv2 : List ℚ) (tc1 tc2 : ℚ) (first : Bool) (g1 g2 : Int) (Phi1 Phi2 : ℚ) (idx : ℕ)
    (k0 k1 : ℕ) (ks : List ℕ) (p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b : Int)
    (cov : Cover1) (hk01 : k0 < k1)
    (hfirst : first = true → k0 = 0 ∧ g1 = 0 ∧ g2 = 0 ∧ Phi1 = 0 ∧ Phi2 = 0)
    (hpos : first = false → 0 < k0)
    (hcv1_0 : cv1.getD idx 0 = (p1a : ℚ) / (arrScale : ℚ) - tc1)
    (hcv2_0 : cv2.getD idx 0 = (p2a : ℚ) / (arrScale : ℚ) - tc2)
    (hcv1_1 : cv1.getD (idx + 1) 0 = (p1b : ℚ) / (arrScale : ℚ) - tc1)
    (hcv2_1 : cv2.getD (idx + 1) 0 = (p2b : ℚ) / (arrScale : ℚ) - tc2)
    (hg1 : (g1 : ℝ) = 20000 * (muScale : ℝ) * ((Phi1 : ℝ) + (tc1 : ℝ) * ((k0 : ℝ) / 10) ^ 2
      + (rowSlope1 r : ℝ) / 2 * (((k0 : ℝ) / 10) ^ 2) ^ 2))
    (hg2 : (g2 : ℝ) = 20000 * (muScale : ℝ) * ((Phi2 : ℝ) + (tc2 : ℝ) * ((k0 : ℝ) / 10) ^ 2
      + (rowSlope2 r : ℝ) / 2 * (((k0 : ℝ) / 10) ^ 2) ^ 2))
    (hcone0 : coneAtOK x2a x1a xaa = true)
    (hcone1 : coneAtOK x2b x1b xab = true)
    (hcell : checkOneCell r (r.mu1 * (r.mu2 * r.mu3 * r.mu4 * r.mu5))
      (r.mu2 * r.mu3 * r.mu4 * r.mu5) (r.mu1 * r.mu3 * r.mu4 * r.mu5)
      (r.mu1 * r.mu2 * r.mu4 * r.mu5) (r.mu1 * r.mu2 * r.mu3 * r.mu5)
      (r.mu1 * r.mu2 * r.mu3 * r.mu4) first false k0 k1
      p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b g1 g2 cov = true)
    (u c1 c2 ρ : ℝ) (hu : ((k0 : ℝ) / 10) ^ 2 ≤ u) (hlt : √u < (k1 : ℝ) / 10)
    (hc1 : 0 ≤ c1) (hc2 : 0 ≤ c2) (hρ : ρ ^ 2 ≤ c1 * c2) :
    let vs := (k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / 10
    let t0 : ℚ := ((k0 : ℚ) / 10) ^ 2
    let cell1 := (cutAux cv1 t0 (cv1.getD idx 0) Phi1 idx vs).getD (pickIdx vs (√u)) ⟨0, 0, 0⟩
    let cell2 := (cutAux cv2 t0 (cv2.getD idx 0) Phi2 idx vs).getD (pickIdx vs (√u)) ⟨0, 0, 0⟩
    let phi1 := cellPhi cell1 u + (tc1 : ℝ) + (rowSlope1 r : ℝ) * u
    let phi2 := cellPhi cell2 u + (tc2 : ℝ) + (rowSlope2 r : ℝ) * u
    let G1 := cellPrim cell1 u + (tc1 : ℝ) * u + (rowSlope1 r : ℝ) / 2 * u ^ 2
    let G2 := cellPrim cell2 u + (tc2 : ℝ) * u + (rowSlope2 r : ℝ) / 2 * u ^ 2
    let Y1 := (if u = 0 then 0 else cellPhi cell1 u - cellPrim cell1 u / u)
      + (rowSlope1 r : ℝ) / 2 * u
    let Y2 := (if u = 0 then 0 else cellPhi cell2 u - cellPrim cell2 u / u)
      + (rowSlope2 r : ℝ) / 2 * u
    let sL : ℝ := (lamScale : ℝ)
    let sM : ℝ := (muScale : ℝ)
    √u ≤ (r.lam0 : ℝ) / sL + (r.lam1 : ℝ) / sL * u + (r.lam2 : ℝ) / sL * u ^ 2
        + ((r.l3s + r.l3a + r.l3b : Int) : ℝ) / sL * u ^ 3
        + (G1 - c2 * phi1 - ρ * Y1)
        + (G2 - (1 / 2) * c1 * phi2 - (1 / 2) * ρ * Y2)
        + ((r.mu1 : ℝ) / sM) * (c2 - 1) ^ 2 + ((r.mu2 : ℝ) / sM) * (c1 - c2 - 1) ^ 2
        + ((r.mu3 : ℝ) / sM) * (c1 + c2 - 3) ^ 2 + ((r.mu4 : ℝ) / sM) * (c1 - 2) ^ 2
        + ((r.mu5 : ℝ) / sM) * ρ ^ 2 + ((r.sigma : ℝ) / sM) * u * ρ := by
  have hu0 : 0 ≤ u := le_trans (sq_nonneg _) hu
  have hr_lo : (k0 : ℝ) / 10 ≤ √u := (Real.le_sqrt (by positivity) hu0).2 hu
  have hk1_pos : (0 : ℝ) < (k1 : ℝ) / 10 :=
    div_pos (by exact_mod_cast (Nat.zero_le k0 |>.trans_lt hk01)) (by norm_num)
  have hu_hi : u < ((k1 : ℝ) / 10) ^ 2 := (Real.sqrt_lt' hk1_pos).1 hlt
  have hpick : pickIdx ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / 10) (√u) = 0 := by
    simp only [List.map_cons, pickIdx]
    simp [hlt]
  have hduR_pos : (0 : ℝ) < (k1 : ℝ) ^ 2 - (k0 : ℝ) ^ 2 := by
    have hklt : (k0 : ℝ) < (k1 : ℝ) := by exact_mod_cast hk01
    have hk0 : (0 : ℝ) ≤ (k0 : ℝ) := Nat.cast_nonneg k0
    nlinarith only [hklt, hk0]
  have h100u_lo : (k0 : ℝ) ^ 2 ≤ 100 * u := by
    have : ((k0 : ℝ) / 10) ^ 2 = (k0 : ℝ) ^ 2 / 100 := by ring
    linarith only [hu, this]
  have h100u_hi : 100 * u < (k1 : ℝ) ^ 2 := by
    have : ((k1 : ℝ) / 10) ^ 2 = (k1 : ℝ) ^ 2 / 100 := by ring
    linarith only [hu_hi, this]
  set t_u : ℝ := (100 * u - (k0 : ℝ) ^ 2) / ((k1 : ℝ) ^ 2 - (k0 : ℝ) ^ 2)
  have htu0 : 0 ≤ t_u := div_nonneg (by linarith only [h100u_lo]) hduR_pos.le
  have htu1 : t_u ≤ 1 := (div_le_one hduR_pos).2 (by linarith only [h100u_hi])
  let interpS (a0 a1 : Int) : ℝ :=
    ((a0 : ℝ) * (k1 : ℝ) ^ 2 - (a1 : ℝ) * (k0 : ℝ) ^ 2
      + ((a1 : ℝ) - (a0 : ℝ)) * (100 * u))
    / ((arrScale : ℝ) * ((k1 : ℝ) ^ 2 - (k0 : ℝ) ^ 2))
  have hinterp : ∀ a0 a1 : Int,
      interpS a0 a1 = (1 - t_u) * ((a0 : ℝ) / (arrScale : ℝ))
        + t_u * ((a1 : ℝ) / (arrScale : ℝ)) := by
    intro a0 a1
    simp only [interpS, t_u]; field_simp [hduR_pos.ne']; ring
  obtain ⟨hx2_0, hx1_0, hc_0⟩ := coneAtOK_real hcone0
  obtain ⟨hx2_1, hx1_1, hc_1⟩ := coneAtOK_real hcone1
  obtain ⟨hxi1, hxi2, hconeR⟩ := cone_convex hx1_0 hx2_0 hc_0 hx1_1 hx2_1 hc_1 htu0 htu1
  rw [← hinterp x2a x2b] at hxi2 hconeR
  rw [← hinterp x1a x1b] at hxi1 hconeR
  rw [← hinterp xaa xab] at hconeR
  have hc1_0R : (cv1.getD idx 0 : ℝ) = (p1a : ℝ) / arrScale - tc1 := by exact_mod_cast hcv1_0
  have hc1_1R : (cv1.getD (idx + 1) 0 : ℝ) = (p1b : ℝ) / arrScale - tc1 := by exact_mod_cast hcv1_1
  have hc2_0R : (cv2.getD idx 0 : ℝ) = (p2a : ℝ) / arrScale - tc2 := by exact_mod_cast hcv2_0
  have hc2_1R : (cv2.getD (idx + 1) 0 : ℝ) = (p2b : ℝ) / arrScale - tc2 := by exact_mod_cast hcv2_1
  have hS_A : (arrScale : ℝ) = 68719476736 := by norm_num [arrScale]
  have hS_M : (muScale : ℝ) = 1125899906842624 := by norm_num [muScale]
  have hR_MA : (rMA : ℝ) = 16384 := by norm_num [rMA]
  have hsl1 : (rowSlope1 r : ℝ) = (r.slope1 : ℝ) / (muScale : ℝ) := by
    unfold rowSlope1; push_cast; rfl
  have hsl2 : (rowSlope2 r : ℝ) = (r.slope2 : ℝ) / (muScale : ℝ) := by
    unfold rowSlope2; push_cast; rfl
  set lamP_v := (r.lam0 : ℝ) / (lamScale : ℝ) + (r.lam1 : ℝ) / (lamScale : ℝ) * u
    + (r.lam2 : ℝ) / (lamScale : ℝ) * u ^ 2
    + ((r.l3s + r.l3a + r.l3b : Int) : ℝ) / (lamScale : ℝ) * u ^ 3
  set phi1_v := interpS p1a p1b + (r.slope1 : ℝ) / (muScale : ℝ) * u
  set phi2_v := interpS p2a p2b + (r.slope2 : ℝ) / (muScale : ℝ) * u
  set G1_v := (((k1 : ℝ) ^ 2 - (k0 : ℝ) ^ 2) * (g1 : ℝ)
      + 2 * ((100 * rMA : ℝ) * (p1a * (k1 : ℝ) ^ 2 - p1b * (k0 : ℝ) ^ 2))
        * (100 * u - (k0 : ℝ) ^ 2)
      + ((100 * rMA : ℝ) * (p1b - p1a) + (r.slope1 : ℝ) * ((k1 : ℝ) ^ 2 - (k0 : ℝ) ^ 2))
        * ((100 * u) ^ 2 - ((k0 : ℝ) ^ 2) ^ 2))
    / (20000 * (muScale : ℝ) * ((k1 : ℝ) ^ 2 - (k0 : ℝ) ^ 2))
  set G2_v := (((k1 : ℝ) ^ 2 - (k0 : ℝ) ^ 2) * (g2 : ℝ)
      + 2 * ((100 * rMA : ℝ) * (p2a * (k1 : ℝ) ^ 2 - p2b * (k0 : ℝ) ^ 2))
        * (100 * u - (k0 : ℝ) ^ 2)
      + ((100 * rMA : ℝ) * (p2b - p2a) + (r.slope2 : ℝ) * ((k1 : ℝ) ^ 2 - (k0 : ℝ) ^ 2))
        * ((100 * u) ^ 2 - ((k0 : ℝ) ^ 2) ^ 2))
    / (20000 * (muScale : ℝ) * ((k1 : ℝ) ^ 2 - (k0 : ℝ) ^ 2))
  set xi2_v := interpS x2a x2b
  set xi1_v := interpS x1a x1b
  set xia_v := interpS xaa xab
  set th2_v := interpS t2a t2b
  set th4_v := interpS t4a t4b
  set th3_v := xi1_v + phi2_v / 2 - th2_v - th4_v
  set th1_v := xi2_v + phi1_v + th2_v - th3_v
  have hne : ((k1 : ℝ) / 10) ^ 2 - ((k0 : ℝ) / 10) ^ 2 ≠ 0 := by
    have : ((k1 : ℝ) / 10) ^ 2 - ((k0 : ℝ) / 10) ^ 2 = ((k1 : ℝ) ^ 2 - (k0 : ℝ) ^ 2) / 100 := by
      ring
    linarith only [hduR_pos, this]
  have hphi1_eq : cellPhi ((cutAux cv1 (((k0 : ℚ) / 10) ^ 2) (cv1.getD idx 0) Phi1 idx
        ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / 10)).getD 0 ⟨0, 0, 0⟩) u
        + (tc1 : ℝ) + (rowSlope1 r : ℝ) * u = phi1_v := by
    simp only [List.map_cons, cutAux, List.getD_cons_zero, cellPhi, Rat.cast_sub,
      Rat.cast_mul, Rat.cast_div, Rat.cast_pow, Rat.cast_natCast, Rat.cast_ofNat, phi1_v, interpS]
    rw [hc1_0R, hc1_1R, hsl1]; field_simp [hne, hduR_pos.ne']; ring
  have hphi2_eq : cellPhi ((cutAux cv2 (((k0 : ℚ) / 10) ^ 2) (cv2.getD idx 0) Phi2 idx
        ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / 10)).getD 0 ⟨0, 0, 0⟩) u
        + (tc2 : ℝ) + (rowSlope2 r : ℝ) * u = phi2_v := by
    simp only [List.map_cons, cutAux, List.getD_cons_zero, cellPhi, Rat.cast_sub,
      Rat.cast_mul, Rat.cast_div, Rat.cast_pow, Rat.cast_natCast, Rat.cast_ofNat, phi2_v, interpS]
    rw [hc2_0R, hc2_1R, hsl2]; field_simp [hne, hduR_pos.ne']; ring
  have hG1_eq : cellPrim ((cutAux cv1 (((k0 : ℚ) / 10) ^ 2) (cv1.getD idx 0) Phi1 idx
        ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / 10)).getD 0 ⟨0, 0, 0⟩) u
        + (tc1 : ℝ) * u + (rowSlope1 r : ℝ) / 2 * u ^ 2 = G1_v := by
    simp only [List.map_cons, cutAux, List.getD_cons_zero, cellPrim, Rat.cast_sub,
      Rat.cast_mul, Rat.cast_div, Rat.cast_pow, Rat.cast_natCast, Rat.cast_ofNat, G1_v]
    rw [hg1, hc1_0R, hc1_1R, hsl1, hS_A, hS_M, hR_MA]; field_simp [hne, hduR_pos.ne']; ring
  have hG2_eq : cellPrim ((cutAux cv2 (((k0 : ℚ) / 10) ^ 2) (cv2.getD idx 0) Phi2 idx
        ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / 10)).getD 0 ⟨0, 0, 0⟩) u
        + (tc2 : ℝ) * u + (rowSlope2 r : ℝ) / 2 * u ^ 2 = G2_v := by
    simp only [List.map_cons, cutAux, List.getD_cons_zero, cellPrim, Rat.cast_sub,
      Rat.cast_mul, Rat.cast_div, Rat.cast_pow, Rat.cast_natCast, Rat.cast_ofNat, G2_v]
    rw [hg2, hc2_0R, hc2_1R, hsl2, hS_A, hS_M, hR_MA]; field_simp [hne, hduR_pos.ne']; ring
  have hmu1R : (0 : ℝ) < (r.mu1 : ℝ) / (muScale : ℝ) :=
    div_pos (by exact_mod_cast hm1) (by norm_num [muScale])
  have hmu2R : (0 : ℝ) < (r.mu2 : ℝ) / (muScale : ℝ) :=
    div_pos (by exact_mod_cast hm2) (by norm_num [muScale])
  have hmu3R : (0 : ℝ) < (r.mu3 : ℝ) / (muScale : ℝ) :=
    div_pos (by exact_mod_cast hm3) (by norm_num [muScale])
  have hmu4R : (0 : ℝ) < (r.mu4 : ℝ) / (muScale : ℝ) :=
    div_pos (by exact_mod_cast hm4) (by norm_num [muScale])
  have hmu5R : (0 : ℝ) < (r.mu5 : ℝ) / (muScale : ℝ) :=
    div_pos (by exact_mod_cast hm5) (by norm_num [muScale])
  have hWpos : (0 : ℝ) < 10000000000 * (lamScale : ℝ) * ((k1 : ℝ) ^ 2 - (k0 : ℝ) ^ 2) ^ 2
      * ((r.mu1 * (r.mu2 * r.mu3 * r.mu4 * r.mu5) : Int) : ℝ) := by
    have h1 : (0 : ℝ) < r.mu1 := by exact_mod_cast hm1
    have h2 : (0 : ℝ) < r.mu2 := by exact_mod_cast hm2
    have h3 : (0 : ℝ) < r.mu3 := by exact_mod_cast hm3
    have h4 : (0 : ℝ) < r.mu4 := by exact_mod_cast hm4
    have h5 : (0 : ℝ) < r.mu5 := by exact_mod_cast hm5
    have hL : (0 : ℝ) < (lamScale : ℝ) := by norm_num [lamScale]
    push_cast; positivity
  cases first with
  | true =>
    obtain ⟨hk0_0, hg1_0, hg2_0, hP1_0, hP2_0⟩ := hfirst rfl
    subst hk0_0; subst hg1_0; subst hg2_0; subst hP1_0; subst hP2_0
    simp only [checkOneCell, Bool.false_eq_true, ↓reduceIte, Bool.and_eq_true, beq_iff_eq] at hcell
    obtain ⟨⟨hF0, hF1⟩, hseg⟩ := hcell
    have hpos_eval := segOK_sound hk01 hseg
      (by simp only [Nat.cast_zero]; exact mul_nonneg (by norm_num) (Real.sqrt_nonneg u))
      (by linarith only [hlt] : 10 * √u ≤ (k1 : ℝ))
    rw [evalInt_sub, evalInt_inSq, evalInt_lin] at hpos_eval
    have hsq : (10 * √u) ^ 2 = 100 * u := by rw [mul_pow, Real.sq_sqrt hu0]; norm_num
    rw [hsq] at hpos_eval
    rcases hu0.eq_or_lt with rfl | hu_pos
    · -- `u = 0`
      simp only [Real.sqrt_zero, mul_zero, sub_zero] at hpos_eval
      have h0_eq := evalInt_pieceFvW_zero r k1
        p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b
        hm1 hm2 hm3 hm4 hm5 hk01 hF0 hF1
      dsimp only at h0_eq
      rw [h0_eq] at hpos_eval
      have hW0pos : (0 : ℝ) < 1000000 * (lamScale : ℝ) * ((k1 : ℝ) ^ 2) ^ 2
          * ((r.mu1 * (r.mu2 * r.mu3 * r.mu4 * r.mu5) : Int) : ℝ) := by
        have h1 : (0 : ℝ) < r.mu1 := by exact_mod_cast hm1
        have h2 : (0 : ℝ) < r.mu2 := by exact_mod_cast hm2
        have h3 : (0 : ℝ) < r.mu3 := by exact_mod_cast hm3
        have h4 : (0 : ℝ) < r.mu4 := by exact_mod_cast hm4
        have h5 : (0 : ℝ) < r.mu5 := by exact_mod_cast hm5
        have hL : (0 : ℝ) < (lamScale : ℝ) := by norm_num [lamScale]
        have hk1R : (0 : ℝ) < k1 := by exact_mod_cast hk01
        push_cast; positivity
      have hbr0 := nonneg_of_mul_nonneg_right hpos_eval hW0pos
      have hcs := complete_squares_pointwise (u := 0) (c1 := c1) (c2 := c2) (ρ := ρ)
        (lamP := (r.lam0 : ℝ) / (lamScale : ℝ))
        (phi1 := (p1a : ℝ) / arrScale) (phi2 := (p2a : ℝ) / arrScale)
        (G1 := 0) (G2 := 0) (Y1 := 0) (Y2 := 0)
        (xi2 := (x2a : ℝ) / arrScale) (xi1 := (x1a : ℝ) / arrScale)
        (xia := (xaa : ℝ) / arrScale) (th2 := (t2a : ℝ) / arrScale)
        (th4 := (t4a : ℝ) / arrScale) (sigma := (r.sigma : ℝ) / muScale)
        hmu1R hmu2R hmu3R hmu4R hmu5R hc1 hc2 hρ hx2_0 hx1_0 hc_0
      dsimp only
      rw [hpick, hphi1_eq, hphi2_eq, hG1_eq, hG2_eq]
      simp only [Real.sqrt_zero, ↓reduceIte, mul_zero, zero_mul, add_zero, sub_zero,
        ne_eq, OfNat.ofNat_ne_zero, not_false_eq_true, zero_pow, zero_div, Int.cast_zero,
        Nat.cast_zero, phi1_v, phi2_v, G1_v, G2_v, interpS]
      have h10 : (p1a : ℝ) * (k1 : ℝ) ^ 2 / ((arrScale : ℝ) * (k1 : ℝ) ^ 2)
          = (p1a : ℝ) / arrScale := by
        have hk1R : (k1 : ℝ) ^ 2 ≠ 0 := by positivity
        field_simp [hk1R]
      have h20 : (p2a : ℝ) * (k1 : ℝ) ^ 2 / ((arrScale : ℝ) * (k1 : ℝ) ^ 2)
          = (p2a : ℝ) / arrScale := by
        have hk1R : (k1 : ℝ) ^ 2 ≠ 0 := by positivity
        field_simp [hk1R]
      rw [h10, h20]
      simp only [add_zero, sub_zero, mul_zero, zero_mul, zero_div] at hcs
      linarith only [hbr0, hcs]
    · -- `u > 0` on first cell
      have hFv := evalInt_pieceFvW_eq r false 0 k1
        p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b 0 0
        hm1 hm2 hm3 hm4 hm5 (Or.inr hk01) u
      dsimp only at hFv
      simp only [Bool.false_eq_true, ↓reduceIte] at hFv
      set FvW0 := pieceFvW r (r.mu1 * (r.mu2 * r.mu3 * r.mu4 * r.mu5))
        (r.mu2 * r.mu3 * r.mu4 * r.mu5) (r.mu1 * r.mu3 * r.mu4 * r.mu5)
        (r.mu1 * r.mu2 * r.mu4 * r.mu5) (r.mu1 * r.mu2 * r.mu3 * r.mu5)
        (r.mu1 * r.mu2 * r.mu3 * r.mu4) false 0 k1
        p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b 0 0
      set Y1_v := (u * phi1_v - G1_v) / u
      set Y2_v := (u * phi2_v - G2_v) / u
      set th5_v := xia_v + Y1_v + Y2_v / 2 - (r.sigma : ℝ) / (muScale : ℝ) * u
      have hY1_eq : (if u = 0 then 0
          else cellPhi ((cutAux cv1 ((((0 : ℕ) : ℚ) / 10) ^ 2) (cv1.getD idx 0) 0 idx
            ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / 10)).getD 0 ⟨0, 0, 0⟩) u
            - cellPrim ((cutAux cv1 ((((0 : ℕ) : ℚ) / 10) ^ 2) (cv1.getD idx 0) 0 idx
            ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / 10)).getD 0 ⟨0, 0, 0⟩) u / u)
          + (rowSlope1 r : ℝ) / 2 * u = Y1_v := by
        simp only [hu_pos.ne', ↓reduceIte, Y1_v]
        rw [← hphi1_eq, ← hG1_eq]; field_simp [hu_pos.ne']; ring
      have hY2_eq : (if u = 0 then 0
          else cellPhi ((cutAux cv2 ((((0 : ℕ) : ℚ) / 10) ^ 2) (cv2.getD idx 0) 0 idx
            ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / 10)).getD 0 ⟨0, 0, 0⟩) u
            - cellPrim ((cutAux cv2 ((((0 : ℕ) : ℚ) / 10) ^ 2) (cv2.getD idx 0) 0 idx
            ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / 10)).getD 0 ⟨0, 0, 0⟩) u / u)
          + (rowSlope2 r : ℝ) / 2 * u = Y2_v := by
        simp only [hu_pos.ne', ↓reduceIte, Y2_v]
        rw [← hphi2_eq, ← hG2_eq]; field_simp [hu_pos.ne']; ring
      have huY1 : u * phi1_v - G1_v = u * Y1_v := by simp only [Y1_v]; field_simp [hu_pos.ne']
      have huY2 : u * phi2_v - G2_v = u * Y2_v := by simp only [Y2_v]; field_simp [hu_pos.ne']
      have hmul_pos : 0 ≤ evalInt FvW0 (100 * u)
          - (10000000000 * (lamScale : ℝ) * ((k1 : ℝ) ^ 2 - ((0 : ℕ) : ℝ) ^ 2) ^ 2
            * ((r.mu1 * (r.mu2 * r.mu3 * r.mu4 * r.mu5) : Int) : ℝ)) * u ^ 2 * √u := by
        have h1 := mul_nonneg (sq_nonneg (100 * u)) hpos_eval
        rw [mul_sub, ← evalInt_drop2 FvW0 hF0 hF1 (100 * u)] at h1
        have hrhs : (100 * u) ^ 2 * (((100000 * lamScale
              * ((((k1 : Int) * k1 - ((0 : ℕ) : Int) * ((0 : ℕ) : Int))
                * ((k1 : Int) * k1 - ((0 : ℕ) : Int) * ((0 : ℕ) : Int)))
                * (r.mu1 * (r.mu2 * r.mu3 * r.mu4 * r.mu5))) : Int) : ℝ) * (10 * √u))
            = (10000000000 * (lamScale : ℝ) * ((k1 : ℝ) ^ 2 - ((0 : ℕ) : ℝ) ^ 2) ^ 2
              * ((r.mu1 * (r.mu2 * r.mu3 * r.mu4 * r.mu5) : Int) : ℝ)) * u ^ 2 * √u := by
          simp only [Int.cast_mul, Int.cast_sub, Int.cast_natCast, Int.cast_ofNat]
          ring
        linarith only [h1, hrhs]
      rw [hFv] at hmul_pos
      have hbr_ge : √u ≤ lamP_v + G1_v + G2_v - (th1_v + th2_v + 3 * th3_v + 2 * th4_v)
          - (th1_v ^ 2 / (4 * ((r.mu1 : ℝ) / muScale))
            + th2_v ^ 2 / (4 * ((r.mu2 : ℝ) / muScale))
            + th3_v ^ 2 / (4 * ((r.mu3 : ℝ) / muScale))
            + th4_v ^ 2 / (4 * ((r.mu4 : ℝ) / muScale))
            + th5_v ^ 2 / (4 * ((r.mu5 : ℝ) / muScale))) := by
        change 0 ≤ (10000000000 * (lamScale : ℝ) * ((k1 : ℝ) ^ 2 - ((0 : ℕ) : ℝ) ^ 2) ^ 2
            * ((r.mu1 * (r.mu2 * r.mu3 * r.mu4 * r.mu5) : Int) : ℝ))
          * (u ^ 2 * (lamP_v + G1_v + G2_v - (th1_v + th2_v + 3 * th3_v + 2 * th4_v)
              - (th1_v ^ 2 / (4 * ((r.mu1 : ℝ) / muScale))
                + th2_v ^ 2 / (4 * ((r.mu2 : ℝ) / muScale))
                + th3_v ^ 2 / (4 * ((r.mu3 : ℝ) / muScale))
                + th4_v ^ 2 / (4 * ((r.mu4 : ℝ) / muScale))))
            - (u * xia_v + (u * phi1_v - G1_v) + (u * phi2_v - G2_v) / 2
              - (r.sigma : ℝ) / (muScale : ℝ) * u ^ 2) ^ 2
              / (4 * ((r.mu5 : ℝ) / muScale))) - _ at hmul_pos
        have hsq5 : (u * xia_v + (u * phi1_v - G1_v) + (u * phi2_v - G2_v) / 2
            - (r.sigma : ℝ) / (muScale : ℝ) * u ^ 2) ^ 2 = u ^ 2 * th5_v ^ 2 := by
          rw [huY1, huY2]; simp only [th5_v]; ring
        rw [hsq5] at hmul_pos
        have hWu : 0 < (10000000000 * (lamScale : ℝ) * ((k1 : ℝ) ^ 2 - ((0 : ℕ) : ℝ) ^ 2) ^ 2
            * ((r.mu1 * (r.mu2 * r.mu3 * r.mu4 * r.mu5) : Int) : ℝ)) * u ^ 2 :=
          mul_pos hWpos (sq_pos_of_pos hu_pos)
        exact factor_u2_bracket hmul_pos hWu
      have hcs := complete_squares_pointwise (u := u) (c1 := c1) (c2 := c2) (ρ := ρ)
        (lamP := lamP_v) (phi1 := phi1_v) (phi2 := phi2_v) (G1 := G1_v) (G2 := G2_v)
        (Y1 := Y1_v) (Y2 := Y2_v) (xi2 := xi2_v) (xi1 := xi1_v) (xia := xia_v)
        (th2 := th2_v) (th4 := th4_v) (sigma := (r.sigma : ℝ) / muScale)
        hmu1R hmu2R hmu3R hmu4R hmu5R hc1 hc2 hρ hxi2 hxi1 hconeR
      dsimp only
      rw [hpick, hphi1_eq, hphi2_eq, hG1_eq, hG2_eq, hY1_eq, hY2_eq]
      exact hbr_ge.trans hcs
  | false =>
    have hk0_pos : 0 < k0 := hpos rfl
    have hu_pos : 0 < u := by
      have hkR : (0 : ℝ) < (k0 : ℝ) / 10 := div_pos (by exact_mod_cast hk0_pos) (by norm_num)
      exact lt_of_lt_of_le (sq_pos_of_pos hkR) hu
    simp only [checkOneCell, Bool.false_eq_true, ↓reduceIte] at hcell
    have hpos_eval := segOK_sound hk01 hcell
      (by linarith only [hr_lo] : (k0 : ℝ) ≤ 10 * √u)
      (by linarith only [hlt] : 10 * √u ≤ (k1 : ℝ))
    rw [evalInt_sub, evalInt_inSq, evalInt_pow5] at hpos_eval
    have hsq : (10 * √u) ^ 2 = 100 * u := by rw [mul_pow, Real.sq_sqrt hu_pos.le]; norm_num
    rw [hsq] at hpos_eval
    have hFv := evalInt_pieceFvW_eq r false k0 k1
      p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b g1 g2
      hm1 hm2 hm3 hm4 hm5 (Or.inr hk01) u
    dsimp only at hFv
    simp only [Bool.false_eq_true, ↓reduceIte] at hFv
    rw [hFv] at hpos_eval
    set Y1_v := (u * phi1_v - G1_v) / u
    set Y2_v := (u * phi2_v - G2_v) / u
    set th5_v := xia_v + Y1_v + Y2_v / 2 - (r.sigma : ℝ) / (muScale : ℝ) * u
    have hY1_eq : (if u = 0 then 0
        else cellPhi ((cutAux cv1 (((k0 : ℚ) / 10) ^ 2) (cv1.getD idx 0) Phi1 idx
          ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / 10)).getD 0 ⟨0, 0, 0⟩) u
          - cellPrim ((cutAux cv1 (((k0 : ℚ) / 10) ^ 2) (cv1.getD idx 0) Phi1 idx
          ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / 10)).getD 0 ⟨0, 0, 0⟩) u / u)
        + (rowSlope1 r : ℝ) / 2 * u = Y1_v := by
      simp only [hu_pos.ne', ↓reduceIte, Y1_v]
      rw [← hphi1_eq, ← hG1_eq]; field_simp [hu_pos.ne']; ring
    have hY2_eq : (if u = 0 then 0
        else cellPhi ((cutAux cv2 (((k0 : ℚ) / 10) ^ 2) (cv2.getD idx 0) Phi2 idx
          ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / 10)).getD 0 ⟨0, 0, 0⟩) u
          - cellPrim ((cutAux cv2 (((k0 : ℚ) / 10) ^ 2) (cv2.getD idx 0) Phi2 idx
          ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / 10)).getD 0 ⟨0, 0, 0⟩) u / u)
        + (rowSlope2 r : ℝ) / 2 * u = Y2_v := by
      simp only [hu_pos.ne', ↓reduceIte, Y2_v]
      rw [← hphi2_eq, ← hG2_eq]; field_simp [hu_pos.ne']; ring
    have huY1 : u * phi1_v - G1_v = u * Y1_v := by simp only [Y1_v]; field_simp [hu_pos.ne']
    have huY2 : u * phi2_v - G2_v = u * Y2_v := by simp only [Y2_v]; field_simp [hu_pos.ne']
    have h5pow : (10 * √u) ^ 5 = 100000 * u ^ 2 * √u := by
      calc (10 * √u) ^ 5 = 100000 * ((√u) ^ 2) ^ 2 * √u := by ring
        _ = 100000 * u ^ 2 * √u := by rw [Real.sq_sqrt hu_pos.le]
    have hbr_ge : √u ≤ lamP_v + G1_v + G2_v - (th1_v + th2_v + 3 * th3_v + 2 * th4_v)
        - (th1_v ^ 2 / (4 * ((r.mu1 : ℝ) / muScale))
          + th2_v ^ 2 / (4 * ((r.mu2 : ℝ) / muScale))
          + th3_v ^ 2 / (4 * ((r.mu3 : ℝ) / muScale))
          + th4_v ^ 2 / (4 * ((r.mu4 : ℝ) / muScale))
          + th5_v ^ 2 / (4 * ((r.mu5 : ℝ) / muScale))) := by
      change 0 ≤ (10000000000 * (lamScale : ℝ) * ((k1 : ℝ) ^ 2 - (k0 : ℝ) ^ 2) ^ 2
          * ((r.mu1 * (r.mu2 * r.mu3 * r.mu4 * r.mu5) : Int) : ℝ))
        * (u ^ 2 * (lamP_v + G1_v + G2_v - (th1_v + th2_v + 3 * th3_v + 2 * th4_v)
            - (th1_v ^ 2 / (4 * ((r.mu1 : ℝ) / muScale))
              + th2_v ^ 2 / (4 * ((r.mu2 : ℝ) / muScale))
              + th3_v ^ 2 / (4 * ((r.mu3 : ℝ) / muScale))
              + th4_v ^ 2 / (4 * ((r.mu4 : ℝ) / muScale))))
          - (u * xia_v + (u * phi1_v - G1_v) + (u * phi2_v - G2_v) / 2
            - (r.sigma : ℝ) / (muScale : ℝ) * u ^ 2) ^ 2
            / (4 * ((r.mu5 : ℝ) / muScale))) - _ at hpos_eval
      have hsq5 : (u * xia_v + (u * phi1_v - G1_v) + (u * phi2_v - G2_v) / 2
          - (r.sigma : ℝ) / (muScale : ℝ) * u ^ 2) ^ 2 = u ^ 2 * th5_v ^ 2 := by
        rw [huY1, huY2]; simp only [th5_v]; ring
      rw [hsq5] at hpos_eval
      have htail_rhs : (((100000 * lamScale * ((((k1 : Int) * k1 - (k0 : Int) * k0)
            * ((k1 : Int) * k1 - (k0 : Int) * k0))
            * (r.mu1 * (r.mu2 * r.mu3 * r.mu4 * r.mu5))) : Int) : ℝ)) * (10 * √u) ^ 5
          = (10000000000 * (lamScale : ℝ) * ((k1 : ℝ) ^ 2 - (k0 : ℝ) ^ 2) ^ 2
            * ((r.mu1 * (r.mu2 * r.mu3 * r.mu4 * r.mu5) : Int) : ℝ)) * u ^ 2 * √u := by
        rw [h5pow]; simp only [Int.cast_mul, Int.cast_sub, Int.cast_natCast, Int.cast_ofNat]; ring
      rw [htail_rhs] at hpos_eval
      have hWu : 0 < (10000000000 * (lamScale : ℝ) * ((k1 : ℝ) ^ 2 - (k0 : ℝ) ^ 2) ^ 2
          * ((r.mu1 * (r.mu2 * r.mu3 * r.mu4 * r.mu5) : Int) : ℝ)) * u ^ 2 :=
        mul_pos hWpos (sq_pos_of_pos hu_pos)
      exact factor_u2_bracket hpos_eval hWu
    have hcs := complete_squares_pointwise (u := u) (c1 := c1) (c2 := c2) (ρ := ρ)
      (lamP := lamP_v) (phi1 := phi1_v) (phi2 := phi2_v) (G1 := G1_v) (G2 := G2_v)
      (Y1 := Y1_v) (Y2 := Y2_v) (xi2 := xi2_v) (xi1 := xi1_v) (xia := xia_v)
      (th2 := th2_v) (th4 := th4_v) (sigma := (r.sigma : ℝ) / muScale)
      hmu1R hmu2R hmu3R hmu4R hmu5R hc1 hc2 hρ hxi2 hxi1 hconeR
    dsimp only
    rw [hpick, hphi1_eq, hphi2_eq, hG1_eq, hG2_eq, hY1_eq, hY2_eq]
    exact hbr_ge.trans hcs

/-- Lockstep soundness of `checkPiecesAux` against `cutAux` for `phi1` and `phi2`. -/
private lemma checkPiecesAux_sound (r : RadiusRow)
    (hm1 : 0 < r.mu1) (hm2 : 0 < r.mu2) (hm3 : 0 < r.mu3) (hm4 : 0 < r.mu4) (hm5 : 0 < r.mu5)
    (cv1 cv2 : List ℚ) (tc1 tc2 : ℚ) :
    ∀ (ks : List ℕ) (first : Bool) (g1 g2 : Int) (Phi1 Phi2 : ℚ) (idx : ℕ)
      (p1s p2s x2s x1s xas t2s t4s : List Int) (covs : List Cover1),
      (first = true → ks.headD 1 = 0 ∧ g1 = 0 ∧ g2 = 0 ∧ Phi1 = 0 ∧ Phi2 = 0) →
      (first = false → 0 < ks.headD 0) →
      (∀ k, k < ks.length - 1 → cv1.getD (idx + k) 0 = (p1s.getD k 0 : ℚ) / (arrScale : ℚ) - tc1) →
      (∀ k, k < ks.length - 1 → cv2.getD (idx + k) 0 = (p2s.getD k 0 : ℚ) / (arrScale : ℚ) - tc2) →
      cv1.length ≤ idx + (ks.length - 1) →
      cv2.length ≤ idx + (ks.length - 1) →
      (p1s.getLastD 0 : ℚ) / (arrScale : ℚ) = tc1 →
      (p2s.getLastD 0 : ℚ) / (arrScale : ℚ) = tc2 →
      ((g1 : ℝ) = 20000 * (muScale : ℝ) * ((Phi1 : ℝ) + (tc1 : ℝ) * ((ks.headD 0 : ℝ) / 10) ^ 2
        + (rowSlope1 r : ℝ) / 2 * (((ks.headD 0 : ℝ) / 10) ^ 2) ^ 2)) →
      ((g2 : ℝ) = 20000 * (muScale : ℝ) * ((Phi2 : ℝ) + (tc2 : ℝ) * ((ks.headD 0 : ℝ) / 10) ^ 2
        + (rowSlope2 r : ℝ) / 2 * (((ks.headD 0 : ℝ) / 10) ^ 2) ^ 2)) →
      checkPiecesAux r (r.mu1 * (r.mu2 * r.mu3 * r.mu4 * r.mu5))
        (r.mu2 * r.mu3 * r.mu4 * r.mu5) (r.mu1 * r.mu3 * r.mu4 * r.mu5)
        (r.mu1 * r.mu2 * r.mu4 * r.mu5) (r.mu1 * r.mu2 * r.mu3 * r.mu5)
        (r.mu1 * r.mu2 * r.mu3 * r.mu4) first g1 g2
        ks p1s p2s x2s x1s xas t2s t4s covs = true →
      let vs := ks.tail.map fun (k : ℕ) ↦ (k : ℚ) / 10
      let t0 : ℚ := ((ks.headD 0 : ℚ) / 10) ^ 2
      let c1_0 : ℚ := cv1.getD idx 0
      let c2_0 : ℚ := cv2.getD idx 0
      let cells1 := cutAux cv1 t0 c1_0 Phi1 idx vs
      let cells2 := cutAux cv2 t0 c2_0 Phi2 idx vs
      meshOK ((ks.headD 0 : ℚ) / 10) vs = true ∧
      ∀ (u c1 c2 ρ : ℝ), ((ks.headD 0 : ℝ) / 10) ^ 2 ≤ u →
        0 ≤ c1 → 0 ≤ c2 → ρ ^ 2 ≤ c1 * c2 →
        let cell1 := cells1.getD (pickIdx vs (√u)) ⟨0, 0, 0⟩
        let cell2 := cells2.getD (pickIdx vs (√u)) ⟨0, 0, 0⟩
        let phi1 := cellPhi cell1 u + (tc1 : ℝ) + (rowSlope1 r : ℝ) * u
        let phi2 := cellPhi cell2 u + (tc2 : ℝ) + (rowSlope2 r : ℝ) * u
        let G1 := cellPrim cell1 u + (tc1 : ℝ) * u + (rowSlope1 r : ℝ) / 2 * u ^ 2
        let G2 := cellPrim cell2 u + (tc2 : ℝ) * u + (rowSlope2 r : ℝ) / 2 * u ^ 2
        let Y1 := (if u = 0 then 0 else cellPhi cell1 u - cellPrim cell1 u / u)
          + (rowSlope1 r : ℝ) / 2 * u
        let Y2 := (if u = 0 then 0 else cellPhi cell2 u - cellPrim cell2 u / u)
          + (rowSlope2 r : ℝ) / 2 * u
        let sL : ℝ := (lamScale : ℝ)
        let sM : ℝ := (muScale : ℝ)
        √u ≤ (r.lam0 : ℝ) / sL + (r.lam1 : ℝ) / sL * u + (r.lam2 : ℝ) / sL * u ^ 2
            + ((r.l3s + r.l3a + r.l3b : Int) : ℝ) / sL * u ^ 3
            + (G1 - c2 * phi1 - ρ * Y1)
            + (G2 - (1 / 2) * c1 * phi2 - (1 / 2) * ρ * Y2)
            + ((r.mu1 : ℝ) / sM) * (c2 - 1) ^ 2 + ((r.mu2 : ℝ) / sM) * (c1 - c2 - 1) ^ 2
            + ((r.mu3 : ℝ) / sM) * (c1 + c2 - 3) ^ 2 + ((r.mu4 : ℝ) / sM) * (c1 - 2) ^ 2
            + ((r.mu5 : ℝ) / sM) * ρ ^ 2 + ((r.sigma : ℝ) / sM) * u * ρ := by
  intro ks
  induction ks with
  | nil =>
    intro first g1 g2 Phi1 Phi2 idx p1s p2s x2s x1s xas t2s t4s covs
      _ _ _ _ _ _ _ _ _ _ hok
    simp [checkPiecesAux] at hok
  | cons k0_init ks' ih =>
    intro first g1 g2 Phi1 Phi2 idx p1s p2s x2s x1s xas t2s t4s covs
      hfirst hpos hcv1 hcv2 hl1 hl2 htc1 htc2 hg1 hg2 hok
    generalize hks_eq : (k0_init :: ks') = ks at hfirst hpos hcv1 hcv2 hl1 hl2 hg1 hg2 hok ⊢
    unfold checkPiecesAux at hok
    split at hok
    · -- Tail cell: single knot `[kK]`
      next kK p1 p2 x2 x1 xa t2 t4 cov =>
      simp only [Bool.and_eq_true, Bool.not_eq_true'] at hok
      obtain ⟨⟨hf, hconeOK⟩, hray⟩ := hok
      have hkKpos : 0 < kK := by simpa using hpos hf
      simp only [List.tail_cons, List.map_nil, List.headD_cons, meshOK, true_and]
      intro u c1 c2 ρ hu hc1 hc2 hρ
      exact checkPiecesAux_tail_sound r hm1 hm2 hm3 hm4 hm5 cv1 cv2 tc1 tc2 g1 g2 Phi1 Phi2 idx kK
        p1 p2 x2 x1 xa t2 t4 cov hkKpos (by simpa using htc1) (by simpa using htc2)
        (by simpa using hg1) (by simpa using hg2) hconeOK hray u c1 c2 ρ hu hc1 hc2 hρ
    · -- Segment cell: `k0 :: k1 :: ks`
      next k0 k1 ks p1a p1b p1s p2a p2b p2s x2a x2b x2s x1a x1b x1s xaa xab xas
        t2a t2b t2s t4a t4b t4s cov covs =>
      have hks'_eq : ks' = k1 :: ks := (List.cons.inj hks_eq).2
      rw [hks'_eq] at ih
      simp only [Bool.and_eq_true, decide_eq_true_eq] at hok
      obtain ⟨⟨⟨hk01, hcone0⟩, hcell⟩, hrec⟩ := hok
      have hcone1 := checkPiecesAux_head_cone hrec
      have hk01Q : (k0 : ℚ) / 10 < (k1 : ℚ) / 10 := by
        have hklt : (k0 : ℚ) < (k1 : ℚ) := by exact_mod_cast hk01
        linarith only [hklt]
      have hcv1_0 : cv1.getD idx 0 = (p1a : ℚ) / (arrScale : ℚ) - tc1 := by
        simpa using hcv1 0 (by simp)
      have hcv2_0 : cv2.getD idx 0 = (p2a : ℚ) / (arrScale : ℚ) - tc2 := by
        simpa using hcv2 0 (by simp)
      have hcv1_1 : cv1.getD (idx + 1) 0 = (p1b : ℚ) / (arrScale : ℚ) - tc1 := by
        cases ks with
        | nil =>
          have hlen1 : cv1.length ≤ idx + 1 := by simpa using hl1
          rw [List.getD_eq_default _ _ hlen1]
          have htc : (p1b : ℚ) / (arrScale : ℚ) = tc1 := by
            cases p1s with
            | nil => simpa using htc1
            | cons _ _ => simp [checkPiecesAux] at hrec
          linarith only [htc]
        | cons _ _ => simpa using hcv1 1 (by simp)
      have hcv2_1 : cv2.getD (idx + 1) 0 = (p2b : ℚ) / (arrScale : ℚ) - tc2 := by
        cases ks with
        | nil =>
          have hlen2 : cv2.length ≤ idx + 1 := by simpa using hl2
          rw [List.getD_eq_default _ _ hlen2]
          have htc : (p2b : ℚ) / (arrScale : ℚ) = tc2 := by
            cases p2s with
            | nil => simpa using htc2
            | cons _ _ => simp [checkPiecesAux] at hrec
          linarith only [htc]
        | cons _ _ => simpa using hcv2 1 (by simp)
      set U0 : Int := (k0 : Int) * (k0 : Int)
      set U1 : Int := (k1 : Int) * (k1 : Int)
      set du : Int := U1 - U0
      set g1' := g1 + 100 * rMA * (p1a + p1b) * du + r.slope1 * (U1 * U1 - U0 * U0)
      set g2' := g2 + 100 * rMA * (p2a + p2b) * du + r.slope2 * (U1 * U1 - U0 * U0)
      set Phi1' : ℚ := Phi1 + (cv1.getD idx 0 + cv1.getD (idx + 1) 0) / 2
        * (((k1 : ℚ) / 10) ^ 2 - ((k0 : ℚ) / 10) ^ 2)
      set Phi2' : ℚ := Phi2 + (cv2.getD idx 0 + cv2.getD (idx + 1) 0) / 2
        * (((k1 : ℚ) / 10) ^ 2 - ((k0 : ℚ) / 10) ^ 2)
      have hS_A : (arrScale : ℝ) = 68719476736 := by norm_num [arrScale]
      have hS_M : (muScale : ℝ) = 1125899906842624 := by norm_num [muScale]
      have hR_MA : (rMA : ℝ) = 16384 := by norm_num [rMA]
      have hsl1 : (rowSlope1 r : ℝ) = (r.slope1 : ℝ) / (muScale : ℝ) := by
        unfold rowSlope1; push_cast; rfl
      have hsl2 : (rowSlope2 r : ℝ) = (r.slope2 : ℝ) / (muScale : ℝ) := by
        unfold rowSlope2; push_cast; rfl
      have hg1' : (g1' : ℝ) = 20000 * (muScale : ℝ)
          * ((Phi1' : ℝ) + (tc1 : ℝ) * ((k1 : ℝ) / 10) ^ 2
            + (rowSlope1 r : ℝ) / 2 * (((k1 : ℝ) / 10) ^ 2) ^ 2) := by
        simp only [List.headD_cons] at hg1
        have hc0R : (cv1.getD idx 0 : ℝ) = (p1a : ℝ) / arrScale - tc1 := by exact_mod_cast hcv1_0
        have hc1R : (cv1.getD (idx + 1) 0 : ℝ) = (p1b : ℝ) / arrScale - tc1 := by exact_mod_cast hcv1_1
        simp only [g1', Phi1', du, U0, U1, Int.cast_add, Int.cast_mul, Int.cast_sub,
          Int.cast_natCast, Int.cast_ofNat, Rat.cast_add, Rat.cast_mul, Rat.cast_div, Rat.cast_sub,
          Rat.cast_pow, Rat.cast_natCast, Rat.cast_ofNat]
        rw [hg1, hc0R, hc1R, hsl1, hS_A, hS_M, hR_MA]
        field_simp; ring
      have hg2' : (g2' : ℝ) = 20000 * (muScale : ℝ)
          * ((Phi2' : ℝ) + (tc2 : ℝ) * ((k1 : ℝ) / 10) ^ 2
            + (rowSlope2 r : ℝ) / 2 * (((k1 : ℝ) / 10) ^ 2) ^ 2) := by
        simp only [List.headD_cons] at hg2
        have hc0R : (cv2.getD idx 0 : ℝ) = (p2a : ℝ) / arrScale - tc2 := by exact_mod_cast hcv2_0
        have hc1R : (cv2.getD (idx + 1) 0 : ℝ) = (p2b : ℝ) / arrScale - tc2 := by exact_mod_cast hcv2_1
        simp only [g2', Phi2', du, U0, U1, Int.cast_add, Int.cast_mul, Int.cast_sub,
          Int.cast_natCast, Int.cast_ofNat, Rat.cast_add, Rat.cast_mul, Rat.cast_div, Rat.cast_sub,
          Rat.cast_pow, Rat.cast_natCast, Rat.cast_ofNat]
        rw [hg2, hc0R, hc1R, hsl2, hS_A, hS_M, hR_MA]
        field_simp; ring
      have hih := ih false g1' g2' Phi1' Phi2' (idx + 1)
        (p1b :: p1s) (p2b :: p2s) (x2b :: x2s) (x1b :: x1s)
        (xab :: xas) (t2b :: t2s) (t4b :: t4s) covs
        (by intro h; simp at h)
        (by intro _; simp; omega)
        (fun k hk ↦ by
          have := hcv1 (k + 1) (by simp at hk ⊢; omega)
          simpa only [show idx + 1 + k = idx + (k + 1) by omega, List.getD_cons_succ] using this)
        (fun k hk ↦ by
          have := hcv2 (k + 1) (by simp at hk ⊢; omega)
          simpa only [show idx + 1 + k = idx + (k + 1) by omega, List.getD_cons_succ] using this)
        (by simp at hl1 ⊢; omega)
        (by simp at hl2 ⊢; omega)
        (by simpa [getLastD_cons_cons] using htc1)
        (by simpa [getLastD_cons_cons] using htc2)
        (by simpa using hg1')
        (by simpa using hg2')
        hrec
      obtain ⟨hmesh_rec, hbound_rec⟩ := hih
      dsimp only [List.headD_cons, List.tail_cons] at hmesh_rec
      refine ⟨by simp [meshOK, hk01Q, hmesh_rec], fun u c1 c2 ρ hu hc1 hc2 hρ ↦ ?_⟩
      simp only [List.headD_cons, List.tail_cons] at hu ⊢
      by_cases hlt : √u < (k1 : ℝ) / 10
      · exact checkPiecesAux_seg_sound r hm1 hm2 hm3 hm4 hm5 cv1 cv2 tc1 tc2 first g1 g2 Phi1 Phi2
          idx k0 k1 ks p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b cov hk01
          (by intro hf; simpa using hfirst hf) (by intro hf; simpa using hpos hf)
          hcv1_0 hcv2_0 hcv1_1 hcv2_1 (by simpa using hg1) (by simpa using hg2)
          hcone0 hcone1 hcell u c1 c2 ρ hu hlt hc1 hc2 hρ
      · have hu0 : 0 ≤ u := le_trans (sq_nonneg _) hu
        have hge : (k1 : ℝ) / 10 ≤ √u := le_of_not_gt hlt
        have hu_ge : ((k1 : ℝ) / 10) ^ 2 ≤ u := (Real.le_sqrt (by positivity) hu0).1 hge
        have hpick : pickIdx ((k1 :: ks).map fun (k : ℕ) ↦ (k : ℚ) / 10) (√u)
            = pickIdx (ks.map fun (k : ℕ) ↦ (k : ℚ) / 10) (√u) + 1 := by
          simp only [List.map_cons, pickIdx]
          simp [hge]
        rw [hpick]
        simpa only [List.map_cons, cutAux, List.getD_cons_succ, List.headD_cons, List.tail_cons,
          Phi1', Phi2'] using hbound_rec u c1 c2 ρ hu_ge hc1 hc2 hρ
    · exact absurd hok Bool.false_ne_true

/-- Length invariant of `checkPiecesAux`. -/
private lemma checkPiecesAux_lengths {r : RadiusRow} {mAll m1 m2 m3 m4 m5 : Int}
    (first : Bool) (g1 g2 : Int) (ks : List ℕ) (p1s p2s x2s x1s xas t2s t4s : List Int)
    (covs : List Cover1)
    (hok : checkPiecesAux r mAll m1 m2 m3 m4 m5 first g1 g2
      ks p1s p2s x2s x1s xas t2s t4s covs = true) :
    p1s.length = ks.length ∧ p2s.length = ks.length := by
  unfold checkPiecesAux at hok
  split at hok
  · exact ⟨rfl, rfl⟩
  · simp only [Bool.and_eq_true] at hok
    obtain ⟨h1, h2⟩ := checkPiecesAux_lengths _ _ _ _ _ _ _ _ _ _ _ _ hok.2
    simp only [List.length_cons] at h1 h2 ⊢
    exact ⟨by omega, by omega⟩
  · exact absurd hok Bool.false_ne_true
termination_by ks.length

/-- **`(C1)`–`(C2)` soundness:** `checkPieces r = true` guarantees `meshOK 0 (rowVs r) = true`
and the pointwise majorant `√u ≤ rowMaj r u c1 c2 ρ` for all `u ≥ 0` and `(c1, c2, ρ)` in the
Cauchy–Schwarz cone. -/
theorem checkPieces_sound {r : RadiusRow} (hok : checkPieces r = true) :
    meshOK 0 (rowVs r) = true ∧
    0 < r.mu1 ∧ 0 < r.mu2 ∧ 0 < r.mu3 ∧ 0 < r.mu4 ∧ 0 < r.mu5 ∧
    0 ≤ r.l3s ∧ 0 ≤ r.l3a ∧ 0 ≤ r.l3b ∧
    ∀ (u c1 c2 ρ : ℝ), 0 ≤ u → 0 ≤ c1 → 0 ≤ c2 → ρ ^ 2 ≤ c1 * c2 →
      √u ≤ rowMaj r u c1 c2 ρ := by
  unfold checkPieces at hok
  cases hks : r.knots with
  | nil => simp [hks] at hok
  | cons k0 ks =>
    cases k0 with
    | succ _ => simp [hks] at hok
    | zero =>
      simp only [hks, Bool.and_eq_true, decide_eq_true_eq] at hok
      obtain ⟨⟨⟨⟨⟨⟨⟨⟨⟨hm1, hm2⟩, hm3⟩, hm4⟩, hm5⟩, hl3s⟩, hl3a⟩, hl3b⟩, _⟩, haux⟩ := hok
      obtain ⟨hlen1, hlen2⟩ := checkPiecesAux_lengths _ _ _ _ _ _ _ _ _ _ _ _ haux
      set vs := (0 :: ks).tail.map fun (k : ℕ) ↦ (k : ℚ) / 10
      set v1 := rowVals r.phi1
      set v2 := rowVals r.phi2
      set tc1 := tailConst vs v1
      set tc2 := tailConst vs v2
      set cv1 := (shiftVals vs v1).take vs.length
      set cv2 := (shiftVals vs v2).take vs.length
      have hne : (0 :: ks) ≠ [] := List.cons_ne_nil _ _
      have htc1_eq : (r.phi1.getLastD 0 : ℚ) / (arrScale : ℚ) = tc1 := by
        have hne1 : r.phi1 ≠ [] := by intro h; simp [h] at hlen1
        rw [getLastD_eq_getLast _ _ hne1]
        exact (tailConst_rowVals_eq hlen1 hne).symm
      have htc2_eq : (r.phi2.getLastD 0 : ℚ) / (arrScale : ℚ) = tc2 := by
        have hne2 : r.phi2 ≠ [] := by intro h; simp [h] at hlen2
        rw [getLastD_eq_getLast _ _ hne2]
        exact (tailConst_rowVals_eq hlen2 hne).symm
      have hcv1 : ∀ k, k < (0 :: ks).length - 1 →
          cv1.getD (0 + k) 0 = (r.phi1.getD k 0 : ℚ) / (arrScale : ℚ) - tc1 := by
        intro k hk
        simp only [zero_add, List.length_cons, Nat.add_sub_cancel] at hk ⊢
        have hlt1 : k < cv1.length := by
          simp only [cv1, List.length_take, shiftVals, List.length_map, v1, rowVals, vs,
            List.tail_cons, hlen1, List.length_cons]
          omega
        rw [List.getD_eq_getElem _ _ hlt1]
        simp only [cv1, List.getElem_take, shiftVals, v1, rowVals, List.getElem_map]
        rw [List.getD_eq_getElem _ _ (by rw [hlen1]; simp; omega)]
        rfl
      have hcv2 : ∀ k, k < (0 :: ks).length - 1 →
          cv2.getD (0 + k) 0 = (r.phi2.getD k 0 : ℚ) / (arrScale : ℚ) - tc2 := by
        intro k hk
        simp only [zero_add, List.length_cons, Nat.add_sub_cancel] at hk ⊢
        have hlt2 : k < cv2.length := by
          simp only [cv2, List.length_take, shiftVals, List.length_map, v2, rowVals, vs,
            List.tail_cons, hlen2, List.length_cons]
          omega
        rw [List.getD_eq_getElem _ _ hlt2]
        simp only [cv2, List.getElem_take, shiftVals, v2, rowVals, List.getElem_map]
        rw [List.getD_eq_getElem _ _ (by rw [hlen2]; simp; omega)]
        rfl
      have hmain := checkPiecesAux_sound r hm1 hm2 hm3 hm4 hm5 cv1 cv2 tc1 tc2
        (0 :: ks) true 0 0 0 0 0 r.phi1 r.phi2 r.xi2 r.xi1 r.xia r.th2 r.th4 r.covers
        (fun _ ↦ ⟨rfl, rfl, rfl, rfl, rfl⟩)
        (by intro h; simp at h)
        hcv1 hcv2
        (by simp [cv1, vs]) (by simp [cv2, vs])
        htc1_eq htc2_eq
        (by simp) (by simp) haux
      obtain ⟨hmesh, hbd⟩ := hmain
      have hvs_eq : rowVs r = vs := by simp [rowVs, vs, hks]
      refine ⟨by simpa [hvs_eq, vs] using hmesh, hm1, hm2, hm3, hm4, hm5, hl3s, hl3a, hl3b,
        fun u c1 c2 ρ hu hc1 hc2 hρ ↦ ?_⟩
      have h1 := hbd u c1 c2 ρ (by simpa using hu) hc1 hc2 hρ
      refine h1.trans_eq ?_
      unfold rowMaj plPhi plPrim plY cutTest cutPrim cutY cellAt cutCells
      rw [hvs_eq]
      have hsq : √u ^ 2 = u := Real.sq_sqrt hu
      simp only [hsq, List.headD_cons, Nat.cast_zero, zero_div, ne_eq, OfNat.ofNat_ne_zero,
        not_false_eq_true, zero_pow, cellPhi, cellPrim]
      rfl

/-! ### `(C3)`: Linear-form evaluation, valid cuts, and weak-duality soundness -/

/-- Real evaluation of a `Lin5` form at contraction scalars `(n, h, b, y, z)`. -/
def evalLin5 (f : Lin5) (n h b y z : ℝ) : ℝ :=
  (f.cn : ℝ) * n + (f.ch : ℝ) * h + (f.cb : ℝ) * b + (f.cy : ℝ) * y + (f.cz : ℝ) * z

lemma evalLin5_add (u v : Lin5) (n h b y z : ℝ) :
    evalLin5 (Lin5.add u v) n h b y z = evalLin5 u n h b y z + evalLin5 v n h b y z := by
  simp only [evalLin5, Lin5.add, Rat.cast_add]; ring

lemma evalLin5_sub (u v : Lin5) (n h b y z : ℝ) :
    evalLin5 (Lin5.sub u v) n h b y z = evalLin5 u n h b y z - evalLin5 v n h b y z := by
  simp only [evalLin5, Lin5.sub, Rat.cast_sub]; ring

lemma evalLin5_smul (k : ℚ) (u : Lin5) (n h b y z : ℝ) :
    evalLin5 (Lin5.smul k u) n h b y z = (k : ℝ) * evalLin5 u n h b y z := by
  simp only [evalLin5, Lin5.smul, Rat.cast_mul]; ring

/-- Pure-real Cauchy–Schwarz / AM-GM helper for the quadratic cuts `c1`, `c2p`, `c2m`. -/
private lemma amgm_sq {a b c θ : ℝ} (ha : 0 ≤ a) (hb : 0 ≤ b) (hθ : 0 < θ)
    (h : c ^ 2 ≤ a * b) : 0 ≤ θ * a + (1 / θ) * b - 2 * c := by
  have h1 : 0 ≤ (√θ * √a - √b / √θ) ^ 2 := sq_nonneg _
  have h2 : (√θ * √a - √b / √θ) ^ 2 = θ * a + (1 / θ) * b - 2 * √(a * b) := by
    have hθs : √θ ≠ 0 := (Real.sqrt_pos.2 hθ).ne'
    rw [sub_sq, mul_pow, div_pow, Real.sq_sqrt hθ.le, Real.sq_sqrt ha, Real.sq_sqrt hb,
      Real.sqrt_mul ha]
    field_simp [hθs]; ring
  have h3 : c ≤ √(a * b) :=
    (le_abs_self c).trans ((Real.sqrt_sq_eq_abs c).symm ▸ Real.sqrt_le_sqrt h)
  linarith only [h1, h2, h3]

/-- Every accepted cut form is nonnegative on the five Gram contraction scalars of a circular
cubic. -/
lemma cutLin5_nonneg {d : ℕ} {J : Fin d → Fin d → ℝ} {a b : MvPolynomial (Fin d) ℝ}
    (hc : Circular J a b) (c : CutTerm) (hcOK : cutTermOK c = true) :
    let t := gramT J a b
    0 ≤ evalLin5 (cutLin5 c.kind c.theta) (gramN t) (gramH t) (gramB t) (gramY t) (gramZ t) := by
  intro t
  have hn : 0 ≤ gramN t := gramN_nonneg t
  have hh : 0 ≤ gramH t := gramH_nonneg t
  have hb : 0 ≤ gramB t := gramB_nonneg t
  have hy : 0 ≤ gramY t := gramY_nonneg t
  have hbn : gramB t ≤ gramN t := gramT_schatten J a b
  have hyz : gramY t ≤ gramZ t := gramT_symm J a b
  have hz : 0 ≤ gramZ t := hy.trans hyz
  have hh0 : 0 ≤ jointH0 t := hc.jointH0_nonneg
  have hm : 0 ≤ gramN t + gramB t + (3 * gramY t - gramZ t) := gramT_gram1a J a b
  have hcs1 : gramZ t ^ 2 ≤ gramN t * gramH t := gramZ_sq_le t
  have hcs2 : (3 * gramY t - gramZ t) ^ 2
      ≤ gramH t * (gramN t + gramB t + (3 * gramY t - gramZ t)) := gramT_gram1b J a b
  cases hk : c.kind with
  | n => simp [cutLin5, evalLin5, hn]
  | h => simp [cutLin5, evalLin5, hh]
  | b => simp [cutLin5, evalLin5, hb]
  | y => simp [cutLin5, evalLin5, hy]
  | z => simp [cutLin5, evalLin5, hz]
  | bn => simp only [cutLin5, evalLin5]; push_cast; linarith only [hbn]
  | yz => simp only [cutLin5, evalLin5]; push_cast; linarith only [hyz]
  | h0 => simp only [cutLin5, evalLin5, h0Form, jointH0] at hh0 ⊢; push_cast; linarith only [hh0]
  | m => simp only [cutLin5, evalLin5, mForm]; push_cast; linarith only [hm]
  | c1 =>
    simp only [cutTermOK, hk, Bool.and_eq_true, decide_eq_true_eq] at hcOK
    have hθ : (0 : ℝ) < (c.theta : ℝ) := by exact_mod_cast hcOK.2
    simp only [cutLin5, evalLin5]; push_cast
    have h := amgm_sq hn hh hθ hcs1
    linarith only [h]
  | c2p =>
    simp only [cutTermOK, hk, Bool.and_eq_true, decide_eq_true_eq] at hcOK
    have hθ : (0 : ℝ) < (c.theta : ℝ) := by exact_mod_cast hcOK.2
    simp only [cutLin5, evalLin5, Lin5.sub, Lin5.add, Lin5.smul, mForm, tForm]; push_cast
    have h := amgm_sq hh hm hθ hcs2
    have hid : (c.theta : ℝ) * gramH t + (1 / (c.theta : ℝ)) * (gramN t + gramB t + (3 * gramY t - gramZ t))
        - 2 * (3 * gramY t - gramZ t)
        = (0 + 1 / (c.theta : ℝ) * 1 - 2 * 0) * gramN t
          + ((c.theta : ℝ) + 1 / (c.theta : ℝ) * 0 - 2 * 0) * gramH t
          + (0 + 1 / (c.theta : ℝ) * 1 - 2 * 0) * gramB t
          + (0 + 1 / (c.theta : ℝ) * 3 - 2 * 3) * gramY t
          + (0 + 1 / (c.theta : ℝ) * -1 - 2 * -1) * gramZ t := by ring
    linarith only [h, hid]
  | c2m =>
    simp only [cutTermOK, hk, Bool.and_eq_true, decide_eq_true_eq] at hcOK
    have hθ : (0 : ℝ) < (c.theta : ℝ) := by exact_mod_cast hcOK.2
    simp only [cutLin5, evalLin5, Lin5.add, Lin5.smul, mForm, tForm]; push_cast
    have h := amgm_sq hh hm hθ (c := -(3 * gramY t - gramZ t)) (by simpa only [neg_sq] using hcs2)
    have hid : (c.theta : ℝ) * gramH t + (1 / (c.theta : ℝ)) * (gramN t + gramB t + (3 * gramY t - gramZ t))
        - 2 * -(3 * gramY t - gramZ t)
        = (0 + 1 / (c.theta : ℝ) * 1 + 2 * 0) * gramN t
          + ((c.theta : ℝ) + 1 / (c.theta : ℝ) * 0 + 2 * 0) * gramH t
          + (0 + 1 / (c.theta : ℝ) * 1 + 2 * 0) * gramB t
          + (0 + 1 / (c.theta : ℝ) * 3 + 2 * 3) * gramY t
          + (0 + 1 / (c.theta : ℝ) * -1 + 2 * -1) * gramZ t := by ring
    linarith only [h, hid]

/-- Infimum over `α > 0` of `Circular.joint_sixth`: eliminates the Young parameter `α` cleanly so
the bound is a single nonnegative multiple of `s^{3/2}` at fixed normalized scalars `p`. -/
private lemma joint_sixth_inf {d : ℕ} {J : Fin d → Fin d → ℝ} {a b : MvPolynomial (Fin d) ℝ}
    (ha : Chaos3 a) (haa : gaussE d (a * a) = 1 / 2) (hc : Circular J a b) (young : Bool) :
    let t := gramT J a b
    let s := gaussE d (radU a b ^ 2) - 2
    let A : ℝ := if young then 135 / 2 else 150
    let B : ℝ := if young then 11781 / 32 else 198
    gaussE d (radU a b ^ 3)
      ≤ 6 + 9 * s + √s * (B * jointH0 t + 2 * A * √(jointS0 t * jointH0 t)) := by
  intro t s A B
  have hE := gaussE_isGaussianExpectation d
  have hs0 : 0 ≤ jointS0 t := hc.jointS0_nonneg
  have hh0 : 0 ≤ jointH0 t := hc.jointH0_nonneg
  have hA : 0 < A := by cases young <;> norm_num [A]
  have hJ : ∀ α : ℝ, 0 < α →
      gaussE d (radU a b ^ 3) ≤ 6 + 9 * s + √s * (B * jointH0 t + A * (α * jointS0 t + jointH0 t / α)) := by
    intro α hα
    have h := hc.joint_sixth hE ha haa young hα
    refine h.trans_eq ?_
    cases young <;> simp only [jointA, jointB, A, B, Bool.false_eq_true, ↓reduceIte] <;> ring
  rcases hs0.eq_or_lt with hS0 | hS0
  · -- `s0 = 0`: send `α → ∞`
    rw [← hS0, zero_mul, Real.sqrt_zero, mul_zero, add_zero]
    refine le_of_forall_pos_le_add fun ε hε ↦ ?_
    set α : ℝ := max 1 (√s * A * jointH0 t / ε + 1)
    have hα : 0 < α := lt_of_lt_of_le one_pos (le_max_left _ _)
    have hα_ge : √s * A * jointH0 t / ε < α := by
      have : √s * A * jointH0 t / ε + 1 ≤ α := le_max_right _ _
      linarith
    have hbound := hJ α hα
    rw [← hS0, mul_zero, zero_add] at hbound
    have hdiv : √s * (A * (jointH0 t / α)) ≤ ε := by
      have h1 : √s * A * jointH0 t < α * ε := (div_lt_iff₀ hε).1 hα_ge
      have h2 : √s * (A * (jointH0 t / α)) = (√s * A * jointH0 t) / α := by ring
      rw [h2, div_le_iff₀ hα]
      linarith
    linarith
  · rcases hh0.eq_or_lt with hH0 | hH0
    · -- `h0 = 0`: send `α → 0⁺`
      rw [← hH0, mul_zero, mul_zero, Real.sqrt_zero, mul_zero, add_zero, mul_zero, add_zero]
      refine le_of_forall_pos_le_add fun ε hε ↦ ?_
      set α : ℝ := ε / (√s * A * jointS0 t + 1)
      have hden : 0 < √s * A * jointS0 t + 1 := by positivity
      have hα : 0 < α := div_pos hε hden
      have hbound := hJ α hα
      rw [← hH0, mul_zero, zero_div, add_zero, zero_add] at hbound
      have hmul : √s * (A * (α * jointS0 t)) ≤ ε := by
        have h1 : √s * (A * (α * jointS0 t)) = ε * ((√s * A * jointS0 t) / (√s * A * jointS0 t + 1)) := by
          simp only [α]; ring
        rw [h1]
        have h2 : (√s * A * jointS0 t) / (√s * A * jointS0 t + 1) ≤ 1 :=
          (div_le_one hden).2 (by linarith)
        nlinarith
      linarith
    · -- `s0 > 0` and `h0 > 0`: plug `α = √(h0 / s0)`
      set α := √(jointH0 t / jointS0 t)
      have hα : 0 < α := Real.sqrt_pos.2 (div_pos hH0 hS0)
      have hbound := hJ α hα
      refine hbound.trans_eq ?_
      congr 1; congr 1; congr 1
      have h1 : α * jointS0 t = √(jointS0 t * jointH0 t) := by
        simp only [α, Real.sqrt_div hh0, Real.sqrt_mul hs0]
        have : √(jointS0 t) ≠ 0 := (Real.sqrt_pos.2 hS0).ne'
        field_simp [this]
        exact (Real.sq_sqrt hs0).symm
      have h2 : jointH0 t / α = √(jointS0 t * jointH0 t) := by
        simp only [α, Real.sqrt_div hh0, Real.sqrt_mul hs0]
        have : √(jointH0 t) ≠ 0 := (Real.sqrt_pos.2 hH0).ne'
        have : √(jointS0 t) ≠ 0 := (Real.sqrt_pos.2 hS0).ne'
        field_simp
        exact (Real.sq_sqrt hh0).symm
      rw [h1, h2]; ring

/-- AM-GM: `2 √(X Y) ≤ α X + Y / α` for `X, Y ≥ 0` and `α > 0`. -/
private lemma two_sqrt_mul_le {X Y α : ℝ} (hX : 0 ≤ X) (hY : 0 ≤ Y) (hα : 0 < α) :
    2 * √(X * Y) ≤ α * X + Y / α := by
  have h := sq_nonneg (√α * √X - √Y / √α)
  have hαs : √α ≠ 0 := (Real.sqrt_pos.2 hα).ne'
  have h1 : (√α * √X - √Y / √α) ^ 2 = α * X + Y / α - 2 * √(X * Y) := by
    rw [sub_sq, mul_pow, div_pow, Real.sq_sqrt hα.le, Real.sq_sqrt hX, Real.sq_sqrt hY,
      Real.sqrt_mul hX]
    field_simp [hαs]
    ring
  linarith

/-- Weak-duality fold step: accumulating `cuts` into `resid`. -/
private lemma foldl_cuts_eval {d : ℕ} {J : Fin d → Fin d → ℝ} {a b : MvPolynomial (Fin d) ℝ}
    (hc : Circular J a b) (pn ph pb py pz : ℝ) {s : ℝ} (hs : 0 < s)
    (hpn : pn = gramN (gramT J a b) / s) (hph : ph = gramH (gramT J a b) / s)
    (hpb : pb = gramB (gramT J a b) / s) (hpy : py = gramY (gramT J a b) / s)
    (hpz : pz = gramZ (gramT J a b) / s) :
    ∀ (cuts : List CutTerm) (acc : Lin5), cuts.all cutTermOK = true →
      evalLin5 acc pn ph pb py pz
        ≤ evalLin5 (cuts.foldl (fun a c ↦ Lin5.add a (Lin5.smul c.weight (cutLin5 c.kind c.theta))) acc)
            pn ph pb py pz
  | [], _, _ => le_rfl
  | c :: cs, acc, hall => by
    simp only [List.all_cons, Bool.and_eq_true] at hall
    have hcW : (0 : ℝ) ≤ (c.weight : ℝ) := by
      simp only [cutTermOK, Bool.and_eq_true, decide_eq_true_eq] at hall
      exact_mod_cast hall.1.1
    have hcVal : 0 ≤ evalLin5 (cutLin5 c.kind c.theta) pn ph pb py pz := by
      have h0 := cutLin5_nonneg hc c hall.1
      have hhom : evalLin5 (cutLin5 c.kind c.theta) pn ph pb py pz
          = evalLin5 (cutLin5 c.kind c.theta) (gramN (gramT J a b)) (gramH (gramT J a b))
              (gramB (gramT J a b)) (gramY (gramT J a b)) (gramZ (gramT J a b)) / s := by
        simp only [evalLin5, hpn, hph, hpb, hpy, hpz]; ring
      rw [hhom]
      exact div_nonneg h0 hs.le
    have hstep : evalLin5 acc pn ph pb py pz
        ≤ evalLin5 (Lin5.add acc (Lin5.smul c.weight (cutLin5 c.kind c.theta))) pn ph pb py pz := by
      rw [evalLin5_add, evalLin5_smul]
      linarith [mul_nonneg hcW hcVal]
    exact hstep.trans (foldl_cuts_eval hc pn ph pb py pz hs hpn hph hpb hpy hpz cs _ hall.2)

/-- **Endpoint soundness `(C3)`** at a single endpoint `s_e ≥ 0` for fixed normalized scalars `p`. -/
private lemma checkEndpoint_sound {d : ℕ} {J : Fin d → Fin d → ℝ} {a b : MvPolynomial (Fin d) ℝ}
    (hc : Circular J a b) (r : RadiusRow)
    (hl3s : 0 ≤ r.l3s) (hl3a : 0 ≤ r.l3a) (hl3b : 0 ≤ r.l3b)
    {s : ℝ} (hs : 0 < s)
    (hs_eq : s = 32 * gramN (gramT J a b) + 8 * gramH (gramT J a b)
      + 32 * gramB (gramT J a b) + 96 * gramY (gramT J a b))
    (se : ℚ) (par? : Option EndPar) (target : ℚ)
    (hse0 : 0 ≤ se) (hok : checkEndpoint r se par? target = true) :
    let t := gramT J a b
    let pn := gramN t / s
    let ph := gramH t / s
    let pb := gramB t / s
    let py := gramY t / s
    let pz := gramZ t / s
    let s0p := jointS0 t / s
    let h0p := jointH0 t / s
    let sL : ℝ := (lamScale : ℝ)
    let l0 := (r.lam0 : ℝ) / sL
    let l1 := (r.lam1 : ℝ) / sL
    let l2 := (r.lam2 : ℝ) / sL
    let l3s := (r.l3s : ℝ) / sL
    let l3a := (r.l3a : ℝ) / sL
    let l3b := (r.l3b : ℝ) / sL
    let Ba := 198 * h0p + 300 * √(s0p * h0p)
    let Bb := (11781 / 32) * h0p + 135 * √(s0p * h0p)
    (l0 + l1 + 2 * l2 + 6 * (l3s + l3a + l3b))
      + (l2 + 9 * (l3s + l3a + l3b) + evalLin5 (rowDLin r) pn ph pb py pz) * (se : ℝ)
      + (l3s * (radiusC6 : ℝ) + l3a * Ba + l3b * Bb) * ((se : ℝ) * √(se : ℝ)) < (target : ℝ) := by
  intro t pn ph pb py pz s0p h0p sL l0 l1 l2 l3s l3a l3b Ba Bb
  have hS_L : (0 : ℝ) < sL := by norm_num [sL, lamScale]
  have hl3sR : 0 ≤ l3s := div_nonneg (by exact_mod_cast hl3s) hS_L.le
  have hl3aR : 0 ≤ l3a := div_nonneg (by exact_mod_cast hl3a) hS_L.le
  have hl3bR : 0 ≤ l3b := div_nonneg (by exact_mod_cast hl3b) hS_L.le
  unfold checkEndpoint at hok
  by_cases h0 : se = 0
  · subst h0
    simp only [beq_self_eq_true, ↓reduceIte, decide_eq_true_eq] at hok
    have hlt : l0 + l1 + 2 * l2 + 6 * (l3s + l3a + l3b) < (target : ℝ) := by
      have : ((r.lam0 : ℚ) / (lamScale : ℚ) + (r.lam1 : ℚ) / (lamScale : ℚ)
          + 2 * ((r.lam2 : ℚ) / (lamScale : ℚ))
          + 6 * ((r.l3s : ℚ) / (lamScale : ℚ) + (r.l3a : ℚ) / (lamScale : ℚ)
            + (r.l3b : ℚ) / (lamScale : ℚ)) : ℚ) < target := hok
      have hR : (((r.lam0 : ℚ) / (lamScale : ℚ) + (r.lam1 : ℚ) / (lamScale : ℚ)
          + 2 * ((r.lam2 : ℚ) / (lamScale : ℚ))
          + 6 * ((r.l3s : ℚ) / (lamScale : ℚ) + (r.l3a : ℚ) / (lamScale : ℚ)
            + (r.l3b : ℚ) / (lamScale : ℚ)) : ℚ) : ℝ) < (target : ℝ) := by exact_mod_cast this
      simpa only [l0, l1, l2, l3s, l3a, l3b, sL, Rat.cast_add, Rat.cast_mul, Rat.cast_div,
        Rat.cast_intCast, Rat.cast_ofNat] using hR
    simpa using hlt
  · have hse_pos : 0 < se := lt_of_le_of_ne hse0 (Ne.symm h0)
    have hse_posR : (0 : ℝ) < (se : ℝ) := by exact_mod_cast hse_pos
    simp only [beq_iff_eq, h0, ↓reduceIte, decide_eq_true hse_pos] at hok
    cases par? with
    | none => simp at hok
    | some pd =>
      simp only [Bool.and_eq_true, decide_eq_true_eq] at hok
      obtain ⟨⟨⟨⟨⟨halA, halB⟩, hsb0⟩, hsb2⟩, hcuts⟩, hbd⟩ := hok
      have halAR : (0 : ℝ) < (pd.alphaA : ℝ) := by exact_mod_cast halA
      have halBR : (0 : ℝ) < (pd.alphaB : ℝ) := by exact_mod_cast halB
      have hsb0R : (0 : ℝ) < (pd.sqrtUb : ℝ) := by exact_mod_cast hsb0
      have hsb2R : (se : ℝ) ≤ (pd.sqrtUb : ℝ) * (pd.sqrtUb : ℝ) := by exact_mod_cast hsb2
      have hsqrt_le : √(se : ℝ) ≤ (pd.sqrtUb : ℝ) := by
        rw [Real.sqrt_le_left hsb0R.le]; nlinarith
      have hs0p : 0 ≤ s0p := div_nonneg hc.jointS0_nonneg hs.le
      have hh0p : 0 ≤ h0p := div_nonneg hc.jointH0_nonneg hs.le
      have hBa_nn : 0 ≤ Ba :=
        add_nonneg (mul_nonneg (by norm_num) hh0p) (mul_nonneg (by norm_num) (Real.sqrt_nonneg _))
      have hBb_nn : 0 ≤ Bb :=
        add_nonneg (mul_nonneg (by norm_num) hh0p) (mul_nonneg (by norm_num) (Real.sqrt_nonneg _))
      have hC6_nn : (0 : ℝ) ≤ (radiusC6 : ℝ) := by norm_num [radiusC6]
      have hBa_le : Ba ≤ 150 * (pd.alphaA : ℝ) * s0p + (198 + 150 / (pd.alphaA : ℝ)) * h0p := by
        have h := two_sqrt_mul_le hs0p hh0p halAR
        have h1 : 150 * ((pd.alphaA : ℝ) * s0p + h0p / (pd.alphaA : ℝ))
            = 150 * (pd.alphaA : ℝ) * s0p + (150 / (pd.alphaA : ℝ)) * h0p := by ring
        simp only [Ba]; linarith only [h, h1]
      have hBb_le : Bb ≤ (135 / 2) * (pd.alphaB : ℝ) * s0p
          + (11781 / 32 + 135 / (2 * (pd.alphaB : ℝ))) * h0p := by
        have h := two_sqrt_mul_le hs0p hh0p halBR
        have h1 : (135 / 2) * ((pd.alphaB : ℝ) * s0p + h0p / (pd.alphaB : ℝ))
            = (135 / 2) * (pd.alphaB : ℝ) * s0p + (135 / (2 * (pd.alphaB : ℝ))) * h0p := by ring
        simp only [Bb]; linarith only [h, h1]
      have hDJ_eq : evalLin5 (rowDJ r pd.alphaA pd.alphaB) pn ph pb py pz
          = l3a * (150 * (pd.alphaA : ℝ) * s0p + (198 + 150 / (pd.alphaA : ℝ)) * h0p)
            + l3b * ((135 / 2) * (pd.alphaB : ℝ) * s0p
              + (11781 / 32 + 135 / (2 * (pd.alphaB : ℝ))) * h0p) := by
        have hs0_eval : evalLin5 s0Form pn ph pb py pz = s0p := by
          simp only [evalLin5, s0Form, s0p, jointS0, pn, ph, pb, py, pz]; push_cast; ring
        have hh0_eval : evalLin5 h0Form pn ph pb py pz = h0p := by
          simp only [evalLin5, h0Form, h0p, jointH0, pn, ph, pb, py, pz]; push_cast; ring
        unfold rowDJ
        simp only [evalLin5_add, evalLin5_smul, hs0_eval, hh0_eval]
        simp only [l3a, l3b, sL, Rat.cast_add, Rat.cast_mul, Rat.cast_div, Rat.cast_intCast,
          Rat.cast_ofNat]
      have hB_le : l3s * (radiusC6 : ℝ) + l3a * Ba + l3b * Bb
          ≤ l3s * (radiusC6 : ℝ) + evalLin5 (rowDJ r pd.alphaA pd.alphaB) pn ph pb py pz := by
        rw [hDJ_eq]
        have ha := mul_le_mul_of_nonneg_left hBa_le hl3aR
        have hb := mul_le_mul_of_nonneg_left hBb_le hl3bR
        linarith only [ha, hb]
      -- Coordinate bounds on `P1`
      have hpn0 : 0 ≤ pn := div_nonneg (gramN_nonneg t) hs.le
      have hph0 : 0 ≤ ph := div_nonneg (gramH_nonneg t) hs.le
      have hpb0 : 0 ≤ pb := div_nonneg (gramB_nonneg t) hs.le
      have hpy0 : 0 ≤ py := div_nonneg (gramY_nonneg t) hs.le
      have hpz0 : 0 ≤ pz := div_nonneg ((gramY_nonneg t).trans (gramT_symm J a b)) hs.le
      have hsForm1 : evalLin5 sForm pn ph pb py pz = 1 := by
        simp only [evalLin5, sForm, pn, ph, pb, py, pz]; push_cast
        have : 32 * gramN t + 8 * gramH t + 32 * gramB t + 96 * gramY t = s := hs_eq.symm
        field_simp [hs.ne']; linarith
      have hpn1 : pn ≤ 1 / 32 := by
        simp only [evalLin5, sForm] at hsForm1; push_cast at hsForm1; linarith
      have hph1 : ph ≤ 1 / 8 := by
        simp only [evalLin5, sForm] at hsForm1; push_cast at hsForm1; linarith
      have hpb1 : pb ≤ 1 / 32 := by
        simp only [evalLin5, sForm] at hsForm1; push_cast at hsForm1; linarith
      have hpy1 : py ≤ 1 / 96 := by
        simp only [evalLin5, sForm] at hsForm1; push_cast at hsForm1; linarith
      have hpz1 : pz ≤ 3 / 64 := by
        simp only [evalLin5, sForm] at hsForm1; push_cast at hsForm1
        have : (8 / 3 : ℝ) * pn + (2 / 3) * ph + (8 / 3) * pb + 24 * py - (16 / 3) * pz = h0p := by
          simp only [h0p, jointH0, pn, ph, pb, py, pz]; ring
        linarith
      -- Weak duality step on `obj = rowDLin + sqrtUb * rowDJ`
      set obj := Lin5.add (rowDLin r) (Lin5.smul pd.sqrtUb (rowDJ r pd.alphaA pd.alphaB))
      set resid0 := Lin5.sub obj (Lin5.smul pd.eta sForm)
      set resid := pd.cuts.foldl
        (fun acc c ↦ Lin5.add acc (Lin5.smul c.weight (cutLin5 c.kind c.theta))) resid0
      have hfold := foldl_cuts_eval hc pn ph pb py pz hs rfl rfl rfl rfl rfl pd.cuts resid0 hcuts
      have hpos_mul : ∀ (q : ℚ) (p pu : ℝ), 0 ≤ p → p ≤ pu →
          (q : ℝ) * p ≤ (posPartQ q : ℝ) * pu := by
        intro q p pu hp0 hp1
        unfold posPartQ
        split_ifs with hq
        · have hqR : (0 : ℝ) ≤ (q : ℝ) := by exact_mod_cast hq
          exact mul_le_mul_of_nonneg_left hp1 hqR
        · have hqR : (q : ℝ) ≤ 0 := by exact_mod_cast (not_le.1 hq).le
          push_cast; nlinarith
      have hresid_le : evalLin5 resid pn ph pb py pz
          ≤ (posPartQ resid.cn : ℝ) * (1 / 32) + (posPartQ resid.ch : ℝ) * (1 / 8)
            + (posPartQ resid.cb : ℝ) * (1 / 32) + (posPartQ resid.cy : ℝ) * (1 / 96)
            + (posPartQ resid.cz : ℝ) * (3 / 64) := by
        unfold evalLin5
        linarith [hpos_mul resid.cn pn (1 / 32) hpn0 hpn1,
          hpos_mul resid.ch ph (1 / 8) hph0 hph1,
          hpos_mul resid.cb pb (1 / 32) hpb0 hpb1,
          hpos_mul resid.cy py (1 / 96) hpy0 hpy1,
          hpos_mul resid.cz pz (3 / 64) hpz0 hpz1]
      have hobj_le : evalLin5 obj pn ph pb py pz
          ≤ (pd.eta : ℝ) + (posPartQ resid.cn : ℝ) * (1 / 32) + (posPartQ resid.ch : ℝ) * (1 / 8)
            + (posPartQ resid.cb : ℝ) * (1 / 32) + (posPartQ resid.cy : ℝ) * (1 / 96)
            + (posPartQ resid.cz : ℝ) * (3 / 64) := by
        have h0' : evalLin5 resid0 pn ph pb py pz = evalLin5 obj pn ph pb py pz - (pd.eta : ℝ) := by
          simp only [resid0, evalLin5_sub, evalLin5_smul, hsForm1, mul_one]
        linarith
      have hbdR : l0 + l1 + l2 * (2 + (se : ℝ))
          + l3s * (6 + 9 * (se : ℝ) + (radiusC6 : ℝ) * (se : ℝ) * (pd.sqrtUb : ℝ))
          + (l3a + l3b) * (6 + 9 * (se : ℝ))
          + (se : ℝ) * ((pd.eta : ℝ) + (posPartQ resid.cn : ℝ) * (1 / 32)
            + (posPartQ resid.ch : ℝ) * (1 / 8) + (posPartQ resid.cb : ℝ) * (1 / 32)
            + (posPartQ resid.cy : ℝ) * (1 / 96) + (posPartQ resid.cz : ℝ) * (3 / 64))
          < (target : ℝ) := by
        have hcast := (Rat.cast_lt (K := ℝ)).2 hbd
        simpa only [l0, l1, l2, l3s, l3a, l3b, sL, resid, resid0, obj, Rat.cast_add, Rat.cast_mul,
          Rat.cast_div, Rat.cast_intCast, Rat.cast_one, Rat.cast_ofNat] using hcast
      have hBnn : 0 ≤ l3s * (radiusC6 : ℝ) + l3a * Ba + l3b * Bb :=
        add_nonneg (add_nonneg (mul_nonneg hl3sR hC6_nn) (mul_nonneg hl3aR hBa_nn))
          (mul_nonneg hl3bR hBb_nn)
      have hstep1 : (l3s * (radiusC6 : ℝ) + l3a * Ba + l3b * Bb) * ((se : ℝ) * √(se : ℝ))
          ≤ (l3s * (radiusC6 : ℝ) + evalLin5 (rowDJ r pd.alphaA pd.alphaB) pn ph pb py pz)
            * ((se : ℝ) * (pd.sqrtUb : ℝ)) := by
        have h1 : (l3s * (radiusC6 : ℝ) + l3a * Ba + l3b * Bb) * ((se : ℝ) * √(se : ℝ))
            ≤ (l3s * (radiusC6 : ℝ) + l3a * Ba + l3b * Bb) * ((se : ℝ) * (pd.sqrtUb : ℝ)) :=
          mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left hsqrt_le hse_posR.le) hBnn
        have h2 : (l3s * (radiusC6 : ℝ) + l3a * Ba + l3b * Bb) * ((se : ℝ) * (pd.sqrtUb : ℝ))
            ≤ (l3s * (radiusC6 : ℝ) + evalLin5 (rowDJ r pd.alphaA pd.alphaB) pn ph pb py pz)
              * ((se : ℝ) * (pd.sqrtUb : ℝ)) :=
          mul_le_mul_of_nonneg_right hB_le (mul_nonneg hse_posR.le hsb0R.le)
        exact h1.trans h2
      have hobj_eq : evalLin5 obj pn ph pb py pz
          = evalLin5 (rowDLin r) pn ph pb py pz
            + (pd.sqrtUb : ℝ) * evalLin5 (rowDJ r pd.alphaA pd.alphaB) pn ph pb py pz := by
        simp only [obj, evalLin5_add, evalLin5_smul]
      have hobj_mul := mul_le_mul_of_nonneg_left hobj_le hse_posR.le
      have hobj_se : evalLin5 (rowDLin r) pn ph pb py pz * (se : ℝ)
          + evalLin5 (rowDJ r pd.alphaA pd.alphaB) pn ph pb py pz * ((se : ℝ) * (pd.sqrtUb : ℝ))
          = (se : ℝ) * evalLin5 obj pn ph pb py pz := by rw [hobj_eq]; ring
      have hbd_alg : (l0 + l1 + 2 * l2 + 6 * (l3s + l3a + l3b))
          + (l2 + 9 * (l3s + l3a + l3b)) * (se : ℝ)
          + l3s * (radiusC6 : ℝ) * ((se : ℝ) * (pd.sqrtUb : ℝ))
          = l0 + l1 + l2 * (2 + (se : ℝ))
            + l3s * (6 + 9 * (se : ℝ) + (radiusC6 : ℝ) * (se : ℝ) * (pd.sqrtUb : ℝ))
            + (l3a + l3b) * (6 + 9 * (se : ℝ)) := by ring
      have hstep1' : (l3s * (radiusC6 : ℝ) + l3a * Ba + l3b * Bb) * ((se : ℝ) * √(se : ℝ))
          ≤ l3s * (radiusC6 : ℝ) * ((se : ℝ) * (pd.sqrtUb : ℝ))
            + evalLin5 (rowDJ r pd.alphaA pd.alphaB) pn ph pb py pz
              * ((se : ℝ) * (pd.sqrtUb : ℝ)) := by
        have : (l3s * (radiusC6 : ℝ) + evalLin5 (rowDJ r pd.alphaA pd.alphaB) pn ph pb py pz)
            * ((se : ℝ) * (pd.sqrtUb : ℝ))
            = l3s * (radiusC6 : ℝ) * ((se : ℝ) * (pd.sqrtUb : ℝ))
              + evalLin5 (rowDJ r pd.alphaA pd.alphaB) pn ph pb py pz
                * ((se : ℝ) * (pd.sqrtUb : ℝ)) := by ring
        linarith only [hstep1, this]
      have hlin_alg : (l2 + 9 * (l3s + l3a + l3b) + evalLin5 (rowDLin r) pn ph pb py pz) * (se : ℝ)
          = (l2 + 9 * (l3s + l3a + l3b)) * (se : ℝ)
            + evalLin5 (rowDLin r) pn ph pb py pz * (se : ℝ) := by ring
      linarith only [hstep1', hobj_se, hobj_mul, hbd_alg, hlin_alg, hbdR]

/-! ### Main row soundness theorem -/

private lemma integrable_add_fn {α : Type*} [MeasurableSpace α] {μ : Measure α} {f g : α → ℝ}
    (hf : Integrable f μ) (hg : Integrable g μ) : Integrable (fun x ↦ f x + g x) μ :=
  hf.add hg

private lemma eval_pow_integrable' {d : ℕ} (P : MvPolynomial (Fin d) ℝ) (k : ℕ) :
    Integrable (fun x ↦ eval x P ^ k) (stdGaussian d) :=
  (integrable_eval (P ^ k)).congr (Filter.Eventually.of_forall fun x ↦ by simp)

private lemma integrable_sqrt' {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω}
    [IsFiniteMeasure μ] {Z : Ω → ℝ} (hZ : ∀ ω, 0 ≤ Z ω) (hZ1 : Integrable Z μ) :
    Integrable (fun ω ↦ √(Z ω)) μ := by
  refine ((integrable_const (1 : ℝ)).add hZ1).mono'
    (Real.continuous_sqrt.comp_aestronglyMeasurable hZ1.aestronglyMeasurable)
    (Filter.Eventually.of_forall fun ω ↦ ?_)
  show ‖√(Z ω)‖ ≤ 1 + Z ω
  rw [Real.norm_eq_abs, abs_of_nonneg (Real.sqrt_nonneg _), Real.sqrt_le_left (by linarith [hZ ω])]
  nlinarith [hZ ω]

/-- **Row soundness theorem:** if `checkRadiusRow r target = true`, then for every normalized
circular cubic Gaussian chaos `q = a + i b` whose excess fourth moment `s = E|q|⁴ − 2` lies in
`[r.sLo, r.sHi]`, `E|q| < target`. -/
theorem radiusRow_sound {d : ℕ} (a b : MvPolynomial (Fin d) ℝ) (ha : Chaos3 a)
    (haa : ∫ x, eval x a ^ 2 ∂(stdGaussian d) = 1 / 2) {J : Fin d → Fin d → ℝ}
    (hc : Circular J a b) (r : RadiusRow) (target : ℚ)
    (hok : checkRadiusRow r target = true)
    (hlo : (r.sLo : ℝ) ≤ ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) - 2)
    (hhi : ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) - 2 ≤ (r.sHi : ℝ)) :
    ∫ x, √(eval x (radU a b)) ∂(stdGaussian d) < (target : ℝ) := by
  simp only [checkRadiusRow, Bool.and_eq_true, decide_eq_true_eq] at hok
  obtain ⟨⟨⟨⟨hsLo0, hsLoHi⟩, hpieces⟩, hEndLo⟩, hEndHi⟩ := hok
  obtain ⟨hmesh, hm1, hm2, hm3, hm4, hm5, hl3s, hl3a, hl3b, hpt⟩ := checkPieces_sound hpieces
  have hE := gaussE_isGaussianExpectation d
  have hb : Chaos3 b := hc.chaos3_right ha
  have haa' : gaussE d (a * a) = 1 / 2 := by
    rw [gaussE_apply, ← haa]
    exact integral_congr_ae (Filter.Eventually.of_forall fun x ↦ by simp only [map_mul]; ring)
  have hbb' : gaussE d (b * b) = 1 / 2 := by rw [← hc.gE_sq_eq hE, haa']
  have hU1 : gaussE d (radU a b) = 1 := by rw [radU, map_add, haa', hbb']; norm_num
  have hU1_int : ∫ x, eval x (radU a b) ∂(stdGaussian d) = 1 := by
    rw [← gaussE_apply]; exact hU1
  set s : ℝ := ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) - 2
  have hs_gaussE : s = gaussE d (radU a b ^ 2) - 2 := by
    simp only [s, gaussE_apply, map_pow]
  set t := gramT J a b
  have hs_eq : s = 32 * gramN t + 8 * gramH t + 32 * gramB t + 96 * gramY t := by
    have h4 := hc.fourth_moment_contractions hE ha
    rw [haa'] at h4
    linarith [hs_gaussE]
  have hs_nonneg : 0 ≤ s := by
    have := gramN_nonneg t; have := gramH_nonneg t; have := gramB_nonneg t; have := gramY_nonneg t
    linarith
  -- Step 1: Integrate the pointwise majorant `√U ≤ rowMaj r U c1 c2 ρ`
  set vs := rowVs r
  set v1 := rowVals r.phi1
  set v2 := rowVals r.phi2
  set sl1 := rowSlope1 r
  set sl2 := rowSlope2 r
  set sL : ℝ := (lamScale : ℝ)
  set sM : ℝ := (muScale : ℝ)
  set l0 : ℝ := (r.lam0 : ℝ) / sL
  set l1 : ℝ := (r.lam1 : ℝ) / sL
  set l2 : ℝ := (r.lam2 : ℝ) / sL
  set l3s : ℝ := (r.l3s : ℝ) / sL
  set l3a : ℝ := (r.l3a : ℝ) / sL
  set l3b : ℝ := (r.l3b : ℝ) / sL
  set l3 : ℝ := ((r.l3s + r.l3a + r.l3b : Int) : ℝ) / sL
  set m1 : ℝ := (r.mu1 : ℝ) / sM
  set m2 : ℝ := (r.mu2 : ℝ) / sM
  set m3 : ℝ := (r.mu3 : ℝ) / sM
  set m4 : ℝ := (r.mu4 : ℝ) / sM
  set m5 : ℝ := (r.mu5 : ℝ) / sM
  set sig : ℝ := (r.sigma : ℝ) / sM
  have hl3_eq : l3 = l3s + l3a + l3b := by
    simp only [l3, l3s, l3a, l3b, Int.cast_add]; ring
  have hS_L : (0 : ℝ) < sL := by norm_num [sL, lamScale]
  have hS_M : (0 : ℝ) < sM := by norm_num [sM, muScale]
  have hm5_nn : 0 ≤ m5 := div_nonneg (by exact_mod_cast hm5.le) hS_M.le
  have hl3s_nn : 0 ≤ l3s := div_nonneg (by exact_mod_cast hl3s) hS_L.le
  have hl3a_nn : 0 ≤ l3a := div_nonneg (by exact_mod_cast hl3a) hS_L.le
  have hl3b_nn : 0 ≤ l3b := div_nonneg (by exact_mod_cast hl3b) hS_L.le
  -- Integrability of every summand in `rowMaj`
  have i_sqrt : Integrable (fun x ↦ √(eval x (radU a b))) (stdGaussian d) :=
    integrable_sqrt' (eval_radU_nonneg a b) (integrable_eval _)
  have i_poly : Integrable (fun x ↦ l0 + l1 * eval x (radU a b) + l2 * eval x (radU a b) ^ 2
      + l3 * eval x (radU a b) ^ 3) (stdGaussian d) :=
    (((integrable_const l0).add ((integrable_eval _).const_mul l1)).add
      ((eval_pow_integrable' _ 2).const_mul l2)).add ((eval_pow_integrable' _ 3).const_mul l3)
  have i_st1 : Integrable (fun x ↦ plPrim vs v1 sl1 (eval x (radU a b))
      - eval x (radC2 J a b) * plPhi vs v1 sl1 (eval x (radU a b))
      - radRho a b x * plY vs v1 sl1 (eval x (radU a b))) (stdGaussian d) :=
    ((integrable_plPrim a b vs v1 sl1 hmesh).sub (integrable_mul_plPhi (radC2 J a b) a b vs v1 sl1)).sub
      (integrable_radRho_mul_plY a b vs v1 sl1 hmesh)
  have i_st2 : Integrable (fun x ↦ plPrim vs v2 sl2 (eval x (radU a b))
      - (1 / 2 : ℝ) * eval x (radC1 J a b) * plPhi vs v2 sl2 (eval x (radU a b))
      - (1 / 2 : ℝ) * radRho a b x * plY vs v2 sl2 (eval x (radU a b))) (stdGaussian d) :=
    ((integrable_plPrim a b vs v2 sl2 hmesh).sub
      (((integrable_mul_plPhi (radC1 J a b) a b vs v2 sl2).const_mul (1 / 2)).congr
        (Filter.Eventually.of_forall fun x ↦ by ring))).sub
      (((integrable_radRho_mul_plY a b vs v2 sl2 hmesh).const_mul (1 / 2)).congr
        (Filter.Eventually.of_forall fun x ↦ by ring))
  have i_v1 : Integrable (fun x ↦ m1 * (eval x (radC2 J a b) - 1) ^ 2) (stdGaussian d) :=
    ((eval_pow_integrable' (radC2 J a b - 1) 2).congr
      (Filter.Eventually.of_forall fun x ↦ by simp)).const_mul m1
  have i_v2 : Integrable (fun x ↦ m2 * (eval x (radD J a b) - 1) ^ 2) (stdGaussian d) :=
    ((eval_pow_integrable' (radD J a b - 1) 2).congr
      (Filter.Eventually.of_forall fun x ↦ by simp)).const_mul m2
  have i_v3 : Integrable (fun x ↦ m3 * (eval x (radS a b) - 3) ^ 2) (stdGaussian d) :=
    ((eval_pow_integrable' (radS a b - 3) 2).congr
      (Filter.Eventually.of_forall fun x ↦ by simp)).const_mul m3
  have i_v4 : Integrable (fun x ↦ m4 * (eval x (radC1 J a b) - 2) ^ 2) (stdGaussian d) :=
    ((eval_pow_integrable' (radC1 J a b - 2) 2).congr
      (Filter.Eventually.of_forall fun x ↦ by simp)).const_mul m4
  have i_v5 : Integrable (fun x ↦ m5 * radRho a b x ^ 2) (stdGaussian d) :=
    (memLp_radRho a b).integrable_sq.const_mul m5
  have i_sig : Integrable (fun x ↦ sig * (eval x (radU a b) * radRho a b x)) (stdGaussian d) := by
    refine (((integrable_eval (radN a b)).const_mul (sig / 2)).congr
      (Filter.Eventually.of_forall fun x ↦ ?_))
    dsimp only
    linear_combination -sig * radRho_mul_radU a b x
  have hmaj_eq : ∀ x, rowMaj r (eval x (radU a b)) (eval x (radC1 J a b))
        (eval x (radC2 J a b)) (radRho a b x)
      = (l0 + l1 * eval x (radU a b) + l2 * eval x (radU a b) ^ 2
          + l3 * eval x (radU a b) ^ 3)
        + (plPrim vs v1 sl1 (eval x (radU a b))
            - eval x (radC2 J a b) * plPhi vs v1 sl1 (eval x (radU a b))
            - radRho a b x * plY vs v1 sl1 (eval x (radU a b)))
        + (plPrim vs v2 sl2 (eval x (radU a b))
            - (1 / 2 : ℝ) * eval x (radC1 J a b) * plPhi vs v2 sl2 (eval x (radU a b))
            - (1 / 2 : ℝ) * radRho a b x * plY vs v2 sl2 (eval x (radU a b)))
        + m1 * (eval x (radC2 J a b) - 1) ^ 2
        + m2 * (eval x (radD J a b) - 1) ^ 2
        + m3 * (eval x (radS a b) - 3) ^ 2
        + m4 * (eval x (radC1 J a b) - 2) ^ 2
        + m5 * radRho a b x ^ 2
        + sig * (eval x (radU a b) * radRho a b x) := fun x ↦ by
    have hadd := congrArg (eval x) (radC1_add_radC2 hc.isCplx a b)
    have hsub := congrArg (eval x) (radC1_sub_radC2 hc.isCplx a b)
    simp only [map_add, map_sub] at hadd hsub
    unfold rowMaj
    rw [← hadd, ← hsub]
    ring
  have i_maj : Integrable (fun x ↦ rowMaj r (eval x (radU a b)) (eval x (radC1 J a b))
      (eval x (radC2 J a b)) (radRho a b x)) (stdGaussian d) := by
    refine (((((((i_poly.add i_st1).add i_st2).add i_v1).add i_v2).add i_v3).add i_v4).add
      i_v5).add i_sig |>.congr (Filter.Eventually.of_forall fun x ↦ (hmaj_eq x).symm)
  have hint_le : ∫ x, √(eval x (radU a b)) ∂(stdGaussian d)
      ≤ ∫ x, rowMaj r (eval x (radU a b)) (eval x (radC1 J a b))
          (eval x (radC2 J a b)) (radRho a b x) ∂(stdGaussian d) :=
    integral_mono i_sqrt i_maj fun x ↦
      hpt _ _ _ _ (eval_radU_nonneg a b x) (eval_radC1_nonneg J a b x)
        (eval_radC2_nonneg J a b x) (radRho_sq_le_radC1_mul_radC2 hc.isCplx a b x)
  -- Evaluate the integral of `rowMaj`
  have hst1_0 := antiStein_I a b ha haa hc vs v1 sl1 hmesh
  have hst2_0 := antiStein_II a b ha haa hc vs v2 sl2 hmesh
  have hv1 := hc.gaussian_var_radC2 ha haa
  have hv2 := hc.gaussian_var_radD ha haa
  have hv3 := hc.gaussian_var_radS ha haa
  have hv4 := hc.gaussian_var_radC1 ha haa
  have hv5 := hc.gaussian_sq_radRho_le ha haa
  have hvr := hc.gaussian_mul_radU_radRho ha haa
  have hpoly_int : ∫ x, (l0 + l1 * eval x (radU a b) + l2 * eval x (radU a b) ^ 2
        + l3 * eval x (radU a b) ^ 3) ∂(stdGaussian d)
      = l0 + l1 + l2 * (2 + s) + l3 * gaussE d (radU a b ^ 3) := by
    have ip0 : Integrable (fun _ : Fin d → ℝ ↦ l0) (stdGaussian d) := integrable_const l0
    have ip1 : Integrable (fun x ↦ l1 * eval x (radU a b)) (stdGaussian d) :=
      (integrable_eval _).const_mul l1
    have ip2 : Integrable (fun x ↦ l2 * eval x (radU a b) ^ 2) (stdGaussian d) :=
      (eval_pow_integrable' _ 2).const_mul l2
    have ip3 : Integrable (fun x ↦ l3 * eval x (radU a b) ^ 3) (stdGaussian d) :=
      (eval_pow_integrable' _ 3).const_mul l3
    rw [integral_add (integrable_add_fn (integrable_add_fn ip0 ip1) ip2) ip3,
      integral_add (integrable_add_fn ip0 ip1) ip2,
      integral_add ip0 ip1,
      integral_const, integral_const_mul, integral_const_mul, integral_const_mul,
      Measure.real_def, measure_univ, ENNReal.toReal_one, one_smul, hU1_int,
      show ∫ x, eval x (radU a b) ^ 3 ∂(stdGaussian d) = gaussE d (radU a b ^ 3) by
        rw [gaussE_apply]; simp only [map_pow]]
    simp only [s]; ring
  have hmaj_int : ∫ x, rowMaj r (eval x (radU a b)) (eval x (radC1 J a b))
        (eval x (radC2 J a b)) (radRho a b x) ∂(stdGaussian d)
      ≤ l0 + l1 + l2 * (2 + s) + l3 * gaussE d (radU a b ^ 3)
        + evalLin5 (rowDLin r) (gramN t) (gramH t) (gramB t) (gramY t) (gramZ t) := by
    rw [integral_congr_ae (Filter.Eventually.of_forall hmaj_eq)]
    have ia1 := integrable_add_fn i_poly i_st1
    have ia2 := integrable_add_fn ia1 i_st2
    have ia3 := integrable_add_fn ia2 i_v1
    have ia4 := integrable_add_fn ia3 i_v2
    have ia5 := integrable_add_fn ia4 i_v3
    have ia6 := integrable_add_fn ia5 i_v4
    have ia7 := integrable_add_fn ia6 i_v5
    rw [integral_add ia7 i_sig, integral_add ia6 i_v5, integral_add ia5 i_v4,
      integral_add ia4 i_v3, integral_add ia3 i_v2, integral_add ia2 i_v1,
      integral_add ia1 i_st2, integral_add i_poly i_st1]
    rw [hpoly_int, hst1_0, hst2_0, integral_const_mul, integral_const_mul, integral_const_mul,
      integral_const_mul, integral_const_mul, integral_const_mul, hv1, hv2, hv3, hv4, hvr]
    have hDlin : evalLin5 (rowDLin r) (gramN t) (gramH t) (gramB t) (gramY t) (gramZ t)
        = m1 * (16 * gramN t + 4 * gramH t)
          + m2 * (16 * gramN t + 20 * gramH t + 16 * gramB t)
          + m3 * (80 * gramN t + 20 * gramH t + 16 * gramB t + 96 * gramY t + 32 * gramZ t)
          + m4 * (32 * gramN t + 16 * gramH t + 16 * gramB t + 48 * gramY t + 16 * gramZ t)
          + m5 * (32 * gramB t + 24 * gramY t)
          + sig * (32 * gramB t + 48 * gramY t) := by
      simp only [evalLin5, rowDLin, m1, m2, m3, m4, m5, sig, sM]; push_cast; ring
    rw [hDlin]
    have hv5m := mul_le_mul_of_nonneg_left hv5 hm5_nn
    linarith only [hv5m]
  -- Step 2: Apply the three sixth-moment bounds and reduce to endpoints `(C3)`
  have hT := hc.tensorFacts hE ha
  have h6s : gaussE d (radU a b ^ 3) ≤ 6 + 9 * s + (radiusC6 : ℝ) * (s * √s) := by
    have h := hc.gaussian_sixth ha haa hT
    have e3 : ∫ x, eval x (radU a b) ^ 3 ∂(stdGaussian d) = gaussE d (radU a b ^ 3) := by
      rw [gaussE_apply]; simp only [map_pow]
    have eC6 : LowerAnalytic.C6 = (radiusC6 : ℝ) := by norm_num [LowerAnalytic.C6, Lower.C6, radiusC6]
    rw [e3, eC6, rpow_three_halves hs_nonneg] at h
    have hms : 9 * ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) - 12 = 6 + 9 * s := by
      simp only [s]; ring
    rw [hms] at h
    exact h
  have h6a := joint_sixth_inf ha haa' hc false
  have h6b := joint_sixth_inf ha haa' hc true
  simp only [Bool.false_eq_true, ↓reduceIte, ← hs_gaussE] at h6a h6b
  -- Split `s = 0` vs `s > 0`
  rcases hs_nonneg.eq_or_lt with hs0 | hs_pos
  · -- `s = 0`: then `sLo = 0` and all five contraction scalars vanish
    have hsLo_zero : r.sLo = 0 := by
      have : (r.sLo : ℝ) ≤ 0 := by linarith only [hlo, hs0]
      have : r.sLo ≤ 0 := by exact_mod_cast this
      exact le_antisymm this hsLo0
    have hnn := gramN_nonneg t
    have hhn := gramH_nonneg t
    have hbn := gramB_nonneg t
    have hyn := gramY_nonneg t
    have hn0 : gramN t = 0 := by linarith only [hs0, hs_eq, hnn, hhn, hbn, hyn]
    have hh0 : gramH t = 0 := by linarith only [hs0, hs_eq, hnn, hhn, hbn, hyn]
    have hb0 : gramB t = 0 := by linarith only [hs0, hs_eq, hnn, hhn, hbn, hyn]
    have hy0 : gramY t = 0 := by linarith only [hs0, hs_eq, hnn, hhn, hbn, hyn]
    have hz0 : gramZ t = 0 := by
      have hsq := gramZ_sq_le t
      rw [hn0, hh0, mul_zero] at hsq
      exact sq_eq_zero_iff.1 (le_antisymm hsq (sq_nonneg _))
    have hDlin0 : evalLin5 (rowDLin r) (gramN t) (gramH t) (gramB t) (gramY t) (gramZ t) = 0 := by
      simp [evalLin5, hn0, hh0, hb0, hy0, hz0]
    have hU3_le : gaussE d (radU a b ^ 3) ≤ 6 := by
      rw [← hs0, Real.sqrt_zero, mul_zero, mul_zero, mul_zero, add_zero, add_zero] at h6s; exact h6s
    rw [hsLo_zero] at hEndLo
    unfold checkEndpoint at hEndLo
    simp only [beq_self_eq_true, ↓reduceIte, decide_eq_true_eq] at hEndLo
    have hlt : l0 + l1 + 2 * l2 + 6 * l3 < (target : ℝ) := by
      have hR : (((r.lam0 : ℚ) / (lamScale : ℚ) + (r.lam1 : ℚ) / (lamScale : ℚ)
          + 2 * ((r.lam2 : ℚ) / (lamScale : ℚ))
          + 6 * ((r.l3s : ℚ) / (lamScale : ℚ) + (r.l3a : ℚ) / (lamScale : ℚ)
            + (r.l3b : ℚ) / (lamScale : ℚ)) : ℚ) : ℝ) < (target : ℝ) := by exact_mod_cast hEndLo
      rw [hl3_eq]
      simpa only [l0, l1, l2, l3s, l3a, l3b, sL, Rat.cast_add, Rat.cast_mul, Rat.cast_div,
        Rat.cast_intCast, Rat.cast_ofNat] using hR
    have hl3_nn : 0 ≤ l3 := by rw [hl3_eq]; linarith only [hl3s_nn, hl3a_nn, hl3b_nn]
    have hbound : ∫ x, √(eval x (radU a b)) ∂(stdGaussian d) ≤ l0 + l1 + 2 * l2 + 6 * l3 := by
      rw [← hs0, add_zero, hDlin0, add_zero] at hmaj_int
      have h3m := mul_le_mul_of_nonneg_left hU3_le hl3_nn
      linarith only [hint_le, hmaj_int, h3m]
    linarith only [hbound, hlt]
  · -- `s > 0`: normalize `p = (n, h, b, y, z) / s` and apply `cubic_endpoint_le` in `x = √s`
    set pn := gramN t / s
    set ph := gramH t / s
    set pb := gramB t / s
    set py := gramY t / s
    set pz := gramZ t / s
    set s0p := jointS0 t / s
    set h0p := jointH0 t / s
    set Ba := 198 * h0p + 300 * √(s0p * h0p)
    set Bb := (11781 / 32) * h0p + 135 * √(s0p * h0p)
    have hDlin_scale : evalLin5 (rowDLin r) (gramN t) (gramH t) (gramB t) (gramY t) (gramZ t)
        = evalLin5 (rowDLin r) pn ph pb py pz * s := by
      simp only [evalLin5, pn, ph, pb, py, pz]; field_simp [hs_pos.ne']
    have h6a_s : gaussE d (radU a b ^ 3) ≤ 6 + 9 * s + Ba * (s * √s) := by
      refine h6a.trans_eq ?_
      have hs0_nn : 0 ≤ jointS0 t := hc.jointS0_nonneg
      have hh0_nn : 0 ≤ jointH0 t := hc.jointH0_nonneg
      have hsq : √(jointS0 t * jointH0 t) = s * √(s0p * h0p) := by
        simp only [s0p, h0p]
        rw [div_mul_div_comm, Real.sqrt_div (mul_nonneg hs0_nn hh0_nn),
          show s * s = s ^ 2 by ring, Real.sqrt_sq hs_pos.le]
        field_simp [hs_pos.ne']
      have hh0_eq : jointH0 t = s * h0p := by simp only [h0p]; field_simp [hs_pos.ne']
      rw [hsq, hh0_eq]; simp only [Ba]; ring
    have h6b_s : gaussE d (radU a b ^ 3) ≤ 6 + 9 * s + Bb * (s * √s) := by
      refine h6b.trans_eq ?_
      have hs0_nn : 0 ≤ jointS0 t := hc.jointS0_nonneg
      have hh0_nn : 0 ≤ jointH0 t := hc.jointH0_nonneg
      have hsq : √(jointS0 t * jointH0 t) = s * √(s0p * h0p) := by
        simp only [s0p, h0p]
        rw [div_mul_div_comm, Real.sqrt_div (mul_nonneg hs0_nn hh0_nn),
          show s * s = s ^ 2 by ring, Real.sqrt_sq hs_pos.le]
        field_simp [hs_pos.ne']
      have hh0_eq : jointH0 t = s * h0p := by simp only [h0p]; field_simp [hs_pos.ne']
      rw [hsq, hh0_eq]; simp only [Bb]; ring
    set Acoef := l2 + 9 * (l3s + l3a + l3b) + evalLin5 (rowDLin r) pn ph pb py pz
    set Bcoef := l3s * (radiusC6 : ℝ) + l3a * Ba + l3b * Bb
    have hBcoef_nn : 0 ≤ Bcoef := by
      have hC6 : 0 ≤ (radiusC6 : ℝ) := by norm_num [radiusC6]
      have hh0p : 0 ≤ h0p := div_nonneg hc.jointH0_nonneg hs_pos.le
      have hBa : 0 ≤ Ba :=
        add_nonneg (mul_nonneg (by norm_num) hh0p) (mul_nonneg (by norm_num) (Real.sqrt_nonneg _))
      have hBb : 0 ≤ Bb :=
        add_nonneg (mul_nonneg (by norm_num) hh0p) (mul_nonneg (by norm_num) (Real.sqrt_nonneg _))
      exact add_nonneg (add_nonneg (mul_nonneg hl3s_nn hC6) (mul_nonneg hl3a_nn hBa))
        (mul_nonneg hl3b_nn hBb)
    have hcubic : ∫ x, √(eval x (radU a b)) ∂(stdGaussian d)
        ≤ (l0 + l1 + 2 * l2 + 6 * (l3s + l3a + l3b)) + (Acoef * √s ^ 2 + Bcoef * √s ^ 3) := by
      have h1 : √s ^ 2 = s := Real.sq_sqrt hs_pos.le
      have h2 : √s ^ 3 = s * √s := by rw [show √s ^ 3 = √s ^ 2 * √s by ring, h1]
      rw [h1, h2]
      rw [hl3_eq, hDlin_scale] at hmaj_int
      have hm1' := mul_le_mul_of_nonneg_left h6s hl3s_nn
      have hm2' := mul_le_mul_of_nonneg_left h6a_s hl3a_nn
      have hm3' := mul_le_mul_of_nonneg_left h6b_s hl3b_nn
      have halg : l0 + l1 + l2 * (2 + s)
            + (l3s * (6 + 9 * s + (radiusC6 : ℝ) * (s * √s))
              + l3a * (6 + 9 * s + Ba * (s * √s))
              + l3b * (6 + 9 * s + Bb * (s * √s)))
            + evalLin5 (rowDLin r) pn ph pb py pz * s
          = (l0 + l1 + 2 * l2 + 6 * (l3s + l3a + l3b))
            + (Acoef * s + Bcoef * (s * √s)) := by
        simp only [Acoef, Bcoef]; ring
      have hsplit : (l3s + l3a + l3b) * gaussE d (radU a b ^ 3)
          = l3s * gaussE d (radU a b ^ 3) + l3a * gaussE d (radU a b ^ 3)
            + l3b * gaussE d (radU a b ^ 3) := by ring
      linarith only [hint_le, hmaj_int, hm1', hm2', hm3', halg, hsplit]
    have hsLo0R : (0 : ℝ) ≤ (r.sLo : ℝ) := by exact_mod_cast hsLo0
    have hsHi0R : (0 : ℝ) ≤ (r.sHi : ℝ) := by
      have : (r.sLo : ℝ) < (r.sHi : ℝ) := by exact_mod_cast hsLoHi
      linarith only [hsLo0R, this]
    have hEnd := cubic_endpoint_le Acoef Bcoef (√s) (√(r.sLo : ℝ)) (√(r.sHi : ℝ))
      hBcoef_nn (Real.sqrt_nonneg _) (Real.sqrt_le_sqrt hlo) (Real.sqrt_le_sqrt hhi)
    have hElo := checkEndpoint_sound hc r hl3s hl3a hl3b hs_pos hs_eq r.sLo r.parLo target
      hsLo0 hEndLo
    have hEhi := checkEndpoint_sound hc r hl3s hl3a hl3b hs_pos hs_eq r.sHi (some r.parHi) target
      (le_of_lt (lt_of_le_of_lt hsLo0 hsLoHi)) hEndHi
    change (l0 + l1 + 2 * l2 + 6 * (l3s + l3a + l3b))
        + Acoef * (r.sLo : ℝ) + Bcoef * ((r.sLo : ℝ) * √(r.sLo : ℝ)) < (target : ℝ) at hElo
    change (l0 + l1 + 2 * l2 + 6 * (l3s + l3a + l3b))
        + Acoef * (r.sHi : ℝ) + Bcoef * ((r.sHi : ℝ) * √(r.sHi : ℝ)) < (target : ℝ) at hEhi
    have hsqLo : √(r.sLo : ℝ) ^ 2 = (r.sLo : ℝ) := Real.sq_sqrt hsLo0R
    have hcuLo : √(r.sLo : ℝ) ^ 3 = (r.sLo : ℝ) * √(r.sLo : ℝ) := by
      rw [show √(r.sLo : ℝ) ^ 3 = √(r.sLo : ℝ) ^ 2 * √(r.sLo : ℝ) by ring, hsqLo]
    have hsqHi : √(r.sHi : ℝ) ^ 2 = (r.sHi : ℝ) := Real.sq_sqrt hsHi0R
    have hcuHi : √(r.sHi : ℝ) ^ 3 = (r.sHi : ℝ) * √(r.sHi : ℝ) := by
      rw [show √(r.sHi : ℝ) ^ 3 = √(r.sHi : ℝ) ^ 2 * √(r.sHi : ℝ) by ring, hsqHi]
    rw [hsqLo, hcuLo, hsqHi, hcuHi] at hEnd
    have hmax : max (Acoef * (r.sLo : ℝ) + Bcoef * ((r.sLo : ℝ) * √(r.sLo : ℝ)))
        (Acoef * (r.sHi : ℝ) + Bcoef * ((r.sHi : ℝ) * √(r.sHi : ℝ)))
        < (target : ℝ) - (l0 + l1 + 2 * l2 + 6 * (l3s + l3a + l3b)) := by
      rw [max_lt_iff]
      exact ⟨by linarith only [hElo], by linarith only [hEhi]⟩
    linarith only [hcubic, hEnd, hmax]

end

end Grothe.LowerAnalytic
