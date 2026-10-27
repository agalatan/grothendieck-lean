import Grothe.HJM.Preprocessors
import Grothe.Upper.Haagerup

/-!
# The first coefficients of the scalar HJM branches

The scalar branch `r` has the radial coefficients `compCoeff haagCoeff P_r` (Haagerup's phase kernel composed with
the preprocessor `ρ_r(t) = t P_r(t²)`). Below mode `K` only the first `K` phase coefficients contribute, so
`compCoeff haagCoeff P n = (π/4)·[Xⁿ](P · Σ_{k<K} r_k (X P²)^k)` for `n < K` (`compCoeff_haag_eq_head`). The
polynomial on the right is evaluated by Horner's rule in outward-rounded interval arithmetic (`headI`), which
encloses its first `M` coefficients (`memB_headI`); together, `mem_head` encloses `(4/π)·compCoeff haagCoeff P n`
for every `n < min M K`.
-/

namespace Grothe.HJM

open Grothe.Upper GrotheKernel Polynomial Finset

noncomputable section

/-- `X P²` as an interval list. -/
def Ymk (pl : List ℚ) : List Ival := zeroI :: convI (pl.map ofRatI) (pl.map ofRatI)

/-- The first `M` coefficients of `P · Σ_{k<K} r_k (X P²)^k`, as outward-rounded intervals. -/
def headI (M K : ℕ) (pl : List ℚ) : List Ival :=
  (convI (pl.map ofRatI) (hornerI M (Ymk pl) (haagList K))).take M

lemma memB_headI (M K : ℕ) (pl : List ℚ) :
    memB M (ofListQ pl * hornerP (X * ofListQ pl ^ 2) (haagList K)) (headI M K pl) := by
  have hP := memB_ofListQ pl M
  have hY : memB M (X * ofListQ pl ^ 2) (Ymk pl) := by
    rw [sq]
    exact memB_mono (memB_X_mul (memB_conv hP hP)) (Nat.le_succ M)
  exact memB_take (memB_conv hP (memB_hornerI hY _))

/-- The first `K` phase coefficients as a Horner polynomial. -/
lemma finite_identity (P : ℝ[X]) (K n : ℕ) :
    compCoeff (cLo K) P n = Real.pi / 4 * (P * hornerP (X * P ^ 2) (haagList K)).coeff n := by
  unfold compCoeff
  rw [tsum_eq_sum (s := range K) fun k hk => by
    simp [cLo, show ¬k < K from fun h => hk (mem_range.mpr h)]]
  rw [hornerP_eq, mul_sum, finsetSum_coeff, mul_sum]
  have hlen : (haagList K).length = K := by rw [haagList_eq]; simp
  rw [hlen]
  refine sum_congr rfl fun k hk => ?_
  have hget : (haagList K).getD k 0 = haagR k := by
    rw [haagList_eq, List.getD_eq_getElem?_getD, List.getElem?_map,
      List.getElem?_range (mem_range.mp hk)]
    rfl
  rw [hget, show cLo K k = haagCoeff k by simp [cLo, mem_range.mp hk], haagCoeff, compTerm]
  have he : P * (C ((haagR k : ℚ) : ℝ) * (X * P ^ 2) ^ k) =
      C ((haagR k : ℚ) : ℝ) * (X ^ k * P ^ (2 * k + 1)) := by
    rw [mul_pow, ← pow_mul]
    ring
  rw [he, coeff_C_mul]
  ring

/-- Phase coefficients from mode `K` on do not reach the modes below `K`. -/
lemma compCoeff_cHi_eq_zero (P : ℝ[X]) {K n : ℕ} (hn : n < K) : compCoeff (cHi K) P n = 0 := by
  unfold compCoeff
  refine (tsum_congr fun k => ?_).trans tsum_zero
  by_cases hk : k < K
  · simp [cHi, hk]
  · rw [compTerm, coeff_X_pow_mul', ite_eq_right_iff.mpr fun h => absurd h (by omega), mul_zero]

theorem compCoeff_haag_eq_head {P : ℝ[X]} (hP : l1 P ≤ 1) {K n : ℕ} (hn : n < K) :
    compCoeff haagCoeff P n = Real.pi / 4 * (P * hornerP (X * P ^ 2) (haagList K)).coeff n := by
  have hadd : compCoeff haagCoeff P n = compCoeff (cLo K) P n + compCoeff (cHi K) P n := by
    rw [← compCoeff_add (summable_cLo _) (summable_cHi _) hP]
    exact congrArg (fun c => compCoeff c P n) (funext fun k => by unfold cLo cHi; split_ifs <;> ring)
  rw [hadd, finite_identity, compCoeff_cHi_eq_zero P hn, add_zero]

/-- **The interval head encloses the branch coefficients**: `(4/π)·compCoeff haagCoeff P n ∈ headI M K pl`. -/
theorem mem_head (pl : List ℚ) (hP : l1 (ofListQ pl) ≤ 1) {M K n : ℕ} (hM : n < M) (hK : n < K) :
    mem (compCoeff haagCoeff (ofListQ pl) n / (Real.pi / 4)) ((headI M K pl).getD n zeroI) := by
  rw [compCoeff_haag_eq_head hP hK, mul_div_cancel_left₀ _ (by positivity)]
  exact memB_headI M K pl n hM

/-- An interval list given by its integer endpoints. -/
def ofPairs (T : List (Int × Int)) : List Ival := T.map fun p => ⟨p.1, p.2⟩

lemma getD_eq_of_pairs {L : List Ival} {T : List (Int × Int)} (h : L.map (fun a => (a.lo, a.hi)) = T)
    (n : ℕ) : L.getD n zeroI = (ofPairs T).getD n zeroI := by
  subst h
  simp only [ofPairs, List.map_map, List.getD_eq_getElem?_getD, List.getElem?_map]
  cases L[n]? <;> rfl

lemma ofPairs_map (L : List Ival) : ofPairs (L.map fun a => (a.lo, a.hi)) = L := by
  induction L with
  | nil => rfl
  | cons a L ih => simp only [ofPairs, List.map_map] at ih ⊢; rw [List.map_cons]; exact congrArg₂ _ rfl ih

/-! ### Horner's rule in chunks

A long Horner evaluation is checked in chunks: each chunk starts from a tabulated accumulator, and the chunks
compose (`hornerFrom_append`). This keeps every kernel check small. -/

/-- Horner's rule over `rs`, starting from the accumulator `init` (truncated to `M` coefficients). -/
def hornerFrom (M : ℕ) (Y : List Ival) (rs : List ℚ) (init : List Ival) : List Ival :=
  rs.foldr (fun r acc => (addL [ofRatI r] (convI Y acc)).take M) init

lemma hornerI_eq_hornerFrom (M : ℕ) (Y : List Ival) (rs : List ℚ) : hornerI M Y rs = hornerFrom M Y rs [] := by
  induction rs with
  | nil => rfl
  | cons r rs ih => simp only [hornerI, hornerFrom, List.foldr_cons] at ih ⊢; rw [ih]

lemma hornerFrom_append (M : ℕ) (Y : List Ival) (rs₁ rs₂ : List ℚ) (init : List Ival) :
    hornerFrom M Y (rs₁ ++ rs₂) init = hornerFrom M Y rs₁ (hornerFrom M Y rs₂ init) := by
  simp [hornerFrom, List.foldr_append]

/-- One chunk: from the accumulator `S` over the coefficients `rs`, the accumulator is `T`. -/
def chunkOK (M : ℕ) (Y : List Ival) (rs : List ℚ) (S T : List (Int × Int)) : Bool :=
  decide ((hornerFrom M Y rs (ofPairs S)).map (fun a => (a.lo, a.hi)) = T)

lemma hornerFrom_of_chunkOK {M : ℕ} {Y : List Ival} {rs : List ℚ} {S T : List (Int × Int)}
    (h : chunkOK M Y rs S T = true) : hornerFrom M Y rs (ofPairs S) = ofPairs T := by
  simp only [chunkOK, decide_eq_true_eq] at h
  rw [← h, ofPairs_map]

/-- **Chained chunks**: tables `T 0, …, T n` with `T n = []`, each `T i` obtained from `T (i+1)` over the
coefficients `rs[i·c, (i+1)·c)`, give the whole Horner evaluation. -/
theorem hornerI_of_chunks {M c n : ℕ} {Y : List Ival} {rs : List ℚ} (T : ℕ → List (Int × Int))
    (hlen : rs.length ≤ n * c) (hn : T n = [])
    (h : ∀ i < n, chunkOK M Y ((rs.drop (i * c)).take c) (T (i + 1)) (T i) = true) :
    hornerI M Y rs = ofPairs (T 0) := by
  have key : ∀ j ≤ n, hornerFrom M Y (rs.drop ((n - j) * c)) [] = ofPairs (T (n - j)) := by
    intro j hj
    induction j with
    | zero =>
      rw [Nat.sub_zero, List.drop_eq_nil_of_le hlen, hn]; rfl
    | succ j ih =>
      have hi : n - (j + 1) < n := by omega
      have e : n - (j + 1) + 1 = n - j := by omega
      have hs : rs.drop ((n - (j + 1)) * c) =
          (rs.drop ((n - (j + 1)) * c)).take c ++ rs.drop ((n - j) * c) := by
        conv_lhs => rw [← List.take_append_drop c (rs.drop ((n - (j + 1)) * c))]
        rw [List.drop_drop, ← e, Nat.add_mul, one_mul, add_comm]
      rw [hs, hornerFrom_append, ih (by omega), ← e]
      exact hornerFrom_of_chunkOK (h _ hi)
  have := key n le_rfl
  rwa [Nat.sub_self, zero_mul, List.drop_zero, ← hornerI_eq_hornerFrom] at this

end

end Grothe.HJM
