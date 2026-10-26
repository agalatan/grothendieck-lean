import Grothe.LowerAnalytic.CapCoverDefs
import Grothe.LowerAnalytic.CapCoord
import Grothe.LowerAnalytic.CapSymmetry

/-!
# Coverage of the fibre space by constrained pieces (route M of PLAN_CAPS)

A localised cap at one node is a list of *pieces*; a piece is a list of linear constraints
`lo ≤ v·vec(M y) (≤ hi)` (`Cons`, `Cons.Holds`).  Every constraint vector is `±d₀`, `±d₂` or `±d₃`
for three fixed directions, `d₂` supported on the odd real block `(6, 7, 10)` and `d₃` on the odd
imaginary block `(8, 9, 11)` (`d₀`, in practice on the even real block, is arbitrary).  Writing
`τₖ(y) = dₖ·vec(M y)`, the symmetries `S_c` (`Fib.cj`) and `S_-` (`Fib.ng`) act on `(τ₂, τ₃)` by
all four sign changes (`tau_cj_re`, `tau_ng_im`, …), so every `y` is the image of a point `w` with
`τ₂(w), τ₃(w) ≥ 0` (`exists_orbit_rep`), and a piece list covers the fibre space modulo the
symmetries as soon as the boxes it defines in `τ`-space cover `ℝ × [0, ∞)²`.

The computable constraints and checks are in `CapCoverDefs`.
`capCoverOK` decides this exactly: per coordinate, the finitely many interval endpoints (and `0`)
cut the line into points and open intervals, on each of which every constraint has a constant
truth value; one rational sample per cell (`cands`) is tested (`sample_exists`).
`capCover_sound`: `capCoverOK = true` implies that every `y` lies in the symmetric orbit of a piece.
-/

open Finset Grothe.Lower

namespace Grothe.LowerAnalytic

/-! ### Constraints -/

/-- `τ_v(y) = v · vec(M y)`. -/
noncomputable def tauOf (E : Sym3) (R : Sym2) (v : List ℚ) (y : Fib) : ℝ :=
  ∑ i ∈ range 12, (v.getD i 0 : ℝ) * (Fib.M E R y).vec i

/-- The one-dimensional condition `lo ≤ t (≤ hi)`. -/
def Cons.Cond (c : Cons) (t : ℝ) : Prop := (c.lo : ℝ) ≤ t ∧ ∀ h, c.hi = some h → t ≤ h

/-- The region of a constraint. -/
def Cons.Holds (E : Sym3) (R : Sym2) (c : Cons) (y : Fib) : Prop := c.Cond (tauOf E R c.v y)

/-- The region of a piece. -/
def pieceSet (E : Sym3) (R : Sym2) (pc : List Cons) : Set Fib := {y | ∀ c ∈ pc, c.Holds E R y}

/-! ### Directions and their symmetries -/

lemma vec_cj (w : Fib) (i : ℕ) :
    w.cj.vec i = if i = 3 ∨ i = 4 ∨ i = 5 ∨ i = 8 ∨ i = 9 ∨ i = 11 then -w.vec i else w.vec i := by
  rcases i with _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | i <;> simp [Fib.vec, Fib.cj]

lemma vec_ng (w : Fib) (i : ℕ) : w.ng.vec i = if 6 ≤ i ∧ i < 12 then -w.vec i else w.vec i := by
  rcases i with _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | i <;> simp [Fib.vec, Fib.ng]

lemma getD_zero_of_suppOK {d : List ℚ} {blk : List ℕ} (h : suppOK d blk = true) {i : ℕ}
    (hi : i < 12) (hb : i ∉ blk) : d.getD i 0 = 0 := by
  have := List.all_eq_true.1 h i (List.mem_range.2 hi)
  simpa [hb] using this

/-- `τ` under a coordinate sign change that fixes, or flips, every coordinate of the support. -/
lemma tau_sign (E : Sym3) (R : Sym2) (d : List ℚ) (blk : List ℕ) (hd : suppOK d blk = true)
    (y y' : Fib) (σ : ℝ) (h : ∀ i ∈ blk, i < 12 → (Fib.M E R y').vec i = σ * (Fib.M E R y).vec i) :
    tauOf E R d y' = σ * tauOf E R d y := by
  unfold tauOf
  rw [Finset.mul_sum]
  refine Finset.sum_congr rfl fun i hi => ?_
  have hi' := mem_range.1 hi
  by_cases hb : i ∈ blk
  · rw [h i hb hi']; ring
  · rw [getD_zero_of_suppOK hd hi' hb]; simp

lemma tau_cj_re (E : Sym3) (R : Sym2) {d : List ℚ} (hd : suppOK d [6, 7, 10] = true) (y : Fib) :
    tauOf E R d y.cj = tauOf E R d y := by
  have := tau_sign E R d [6, 7, 10] hd y y.cj 1 fun i hi _ => by
    rw [Fib.M_cj, vec_cj]; simp at hi; rcases hi with rfl | rfl | rfl <;> simp
  simpa using this

lemma tau_ng_re (E : Sym3) (R : Sym2) {d : List ℚ} (hd : suppOK d [6, 7, 10] = true) (y : Fib) :
    tauOf E R d y.ng = -tauOf E R d y := by
  have := tau_sign E R d [6, 7, 10] hd y y.ng (-1) fun i hi _ => by
    rw [Fib.M_ng, vec_ng]; simp at hi; rcases hi with rfl | rfl | rfl <;> simp
  simpa using this

lemma tau_cj_im (E : Sym3) (R : Sym2) {d : List ℚ} (hd : suppOK d [8, 9, 11] = true) (y : Fib) :
    tauOf E R d y.cj = -tauOf E R d y := by
  have := tau_sign E R d [8, 9, 11] hd y y.cj (-1) fun i hi _ => by
    rw [Fib.M_cj, vec_cj]; simp at hi; rcases hi with rfl | rfl | rfl <;> simp
  simpa using this

lemma tau_ng_im (E : Sym3) (R : Sym2) {d : List ℚ} (hd : suppOK d [8, 9, 11] = true) (y : Fib) :
    tauOf E R d y.ng = -tauOf E R d y := by
  have := tau_sign E R d [8, 9, 11] hd y y.ng (-1) fun i hi _ => by
    rw [Fib.M_ng, vec_ng]; simp at hi; rcases hi with rfl | rfl | rfl <;> simp
  simpa using this

lemma tau_of_vecEq (E : Sym3) (R : Sym2) {v w : List ℚ} (h : vecEq v w = true) (y : Fib) :
    tauOf E R v y = tauOf E R w y := by
  unfold tauOf
  refine Finset.sum_congr rfl fun i hi => ?_
  have := List.all_eq_true.1 h i (List.mem_range.2 (mem_range.1 hi))
  rw [show v.getD i 0 = w.getD i 0 from by simpa using this]

lemma tau_of_vecNeg (E : Sym3) (R : Sym2) {v w : List ℚ} (h : vecNeg v w = true) (y : Fib) :
    tauOf E R v y = -tauOf E R w y := by
  unfold tauOf
  rw [← Finset.sum_neg_distrib]
  refine Finset.sum_congr rfl fun i hi => ?_
  have := List.all_eq_true.1 h i (List.mem_range.2 (mem_range.1 hi))
  rw [show v.getD i 0 = -w.getD i 0 from by simpa using this]
  push_cast; ring

lemma tau_of_dirOf (E : Sym3) (R : Sym2) {ds : List (List ℚ)} {c : Cons} {k : ℕ} {σ : Bool}
    (h : dirOf ds c = some (k, σ)) (y : Fib) :
    tauOf E R c.v y = (if σ then 1 else -1) * tauOf E R (ds.getD k []) y := by
  unfold dirOf at h
  split_ifs at h with h1 h2 h3 h4 h5 h6 <;> simp only [Option.some.injEq, Prod.mk.injEq] at h <;>
    obtain ⟨rfl, rfl⟩ := h
  · simp [tau_of_vecEq E R h1]
  · simp [tau_of_vecNeg E R h2]
  · simp [tau_of_vecEq E R h3]
  · simp [tau_of_vecNeg E R h4]
  · simp [tau_of_vecEq E R h5]
  · simp [tau_of_vecNeg E R h6]

/-! ### One-dimensional samples -/

lemma nxt_spec (S : List ℚ) (b : ℚ) :
    (b < nxt S b) ∧ ∀ c ∈ S, b < c → nxt S b ≤ c := by
  unfold nxt
  cases hm : (S.filter fun c => decide (b < c)).min? with
  | none =>
    rw [List.min?_eq_none_iff, List.filter_eq_nil_iff] at hm
    refine ⟨by simp, fun c hc hbc => absurd (by simpa using hbc) (hm c hc)⟩
  | some n =>
    rw [List.min?_eq_some_iff] at hm
    obtain ⟨hn, hmin⟩ := hm
    refine ⟨by simpa using (List.mem_filter.1 hn).2, fun c hc hbc => ?_⟩
    exact hmin c (List.mem_filter.2 ⟨hc, by simpa using hbc⟩)

/-- **Samples.** For every real `x` some candidate compares with every element of `S` exactly as
`x` does. -/
theorem sample_exists (S : List ℚ) (x : ℝ) :
    ∃ q ∈ cands S, ∀ b ∈ S, (((b : ℝ) ≤ x ↔ (b : ℝ) ≤ q) ∧ (x ≤ b ↔ (q : ℝ) ≤ b)) := by
  classical
  by_cases hx : ∃ b ∈ S, (b : ℝ) = x
  · obtain ⟨b, hb, rfl⟩ := hx
    refine ⟨b, ?_, fun _ _ => ⟨Iff.rfl, Iff.rfl⟩⟩
    exact List.mem_cons_of_mem _ (List.mem_flatMap.2 ⟨b, hb, by simp⟩)
  push Not at hx
  by_cases hlow : ∀ b ∈ S, x < b
  · cases hm : S.min? with
    | none =>
      rw [List.min?_eq_none_iff] at hm
      subst hm
      exact ⟨_, List.mem_cons_self .., fun b hb => absurd hb (by simp)⟩
    | some m =>
      rw [List.min?_eq_some_iff] at hm
      refine ⟨m - 1, by simp [cands, List.min?_eq_some_iff.2 hm], fun b hb => ?_⟩
      have h1 : (m : ℝ) ≤ b := by exact_mod_cast hm.2 b hb
      have h2 := hlow b hb
      push_cast
      constructor <;> constructor <;> intro h <;> linarith
  push Not at hlow
  obtain ⟨b0, hb0, hb0x⟩ := hlow
  have hb0x' : (b0 : ℝ) < x := lt_of_le_of_ne hb0x (hx b0 hb0)
  set T : Finset ℚ := S.toFinset.filter fun c : ℚ => (c : ℝ) < x with hT
  have hTne : T.Nonempty := ⟨b0, by simp [hT, hb0, hb0x']⟩
  set lo := T.max' hTne with hlo
  have hloT : lo ∈ T := T.max'_mem hTne
  have hloS : lo ∈ S := by simpa [hT] using (Finset.mem_filter.1 hloT).1
  have hlox : (lo : ℝ) < x := (Finset.mem_filter.1 hloT).2
  have hmax : ∀ c ∈ S, (c : ℝ) < x → c ≤ lo := fun c hc hcx =>
    T.le_max' c (by simp [hT, hc, hcx])
  obtain ⟨hn1, hn2⟩ := nxt_spec S lo
  set n := nxt S lo
  refine ⟨(lo + n) / 2, List.mem_cons_of_mem _ (List.mem_flatMap.2 ⟨lo, hloS, by simp [n]⟩),
    fun b hb => ?_⟩
  have hlon : (lo : ℝ) < n := by exact_mod_cast hn1
  -- every element of `S` is either `≤ lo` (and `< x`) or `≥ n` (and `> x`)
  have key : ((b : ℝ) < x ∧ b ≤ lo) ∨ (x < b ∧ n ≤ b) := by
    rcases lt_or_gt_of_ne (hx b hb) with h | h
    · exact Or.inl ⟨h, by exact_mod_cast hmax b hb h⟩
    · refine Or.inr ⟨h, by exact_mod_cast hn2 b hb (by exact_mod_cast hlox.trans h)⟩
  push_cast
  rcases key with ⟨h1, h2⟩ | ⟨h1, h2⟩
  · have h2' : (b : ℝ) ≤ lo := by exact_mod_cast h2
    constructor <;> constructor <;> intro h <;> linarith
  · have h2' : (n : ℝ) ≤ b := by exact_mod_cast h2
    constructor <;> constructor <;> intro h <;> linarith

/-! ### The coverage check -/

lemma cond_iff {c : Cons} {σ : Bool} {x : ℝ} {q : ℚ}
    (h : ∀ b ∈ bndsOf c σ, (((b : ℝ) ≤ x ↔ (b : ℝ) ≤ q) ∧ (x ≤ b ↔ (q : ℝ) ≤ b))) :
    c.Cond ((if σ then 1 else -1) * x) ↔ condQ c σ q = true := by
  have hlo := h (if σ then c.lo else -c.lo) (by cases σ <;> simp [bndsOf])
  have hhi : ∀ v, c.hi = some v →
      (((if σ then v else -v : ℚ) : ℝ) ≤ x ↔ ((if σ then v else -v : ℚ) : ℝ) ≤ q) ∧
        (x ≤ ((if σ then v else -v : ℚ) : ℝ) ↔ (q : ℝ) ≤ ((if σ then v else -v : ℚ) : ℝ)) :=
    fun v hv => h _ (by cases σ <;> simp [bndsOf, hv])
  unfold Cons.Cond condQ
  cases σ
  · simp only [Bool.false_eq_true, ↓reduceIte, neg_mul, one_mul] at hlo hhi ⊢
    push_cast at hlo hhi
    have e1 : ((c.lo : ℝ) ≤ -x) ↔ c.lo ≤ -q := by
      rw [show ((c.lo : ℝ) ≤ -x) ↔ x ≤ -(c.lo : ℝ) from by constructor <;> intro <;> linarith,
        hlo.2, ← Rat.cast_le (K := ℝ)]; push_cast; constructor <;> intro <;> linarith
    cases hh : c.hi with
    | none => simp [e1]
    | some v =>
      have h2 := (hhi v hh).1
      have e2 : (-x ≤ (v : ℝ)) ↔ -q ≤ v := by
        rw [show (-x ≤ (v : ℝ)) ↔ -(v : ℝ) ≤ x from by constructor <;> intro <;> linarith,
          h2, ← Rat.cast_le (K := ℝ)]; push_cast; constructor <;> intro <;> linarith
      simp [e1, e2]
  · simp only [↓reduceIte, one_mul] at hlo hhi ⊢
    have e1 : ((c.lo : ℝ) ≤ x) ↔ c.lo ≤ q := by rw [hlo.1]; exact_mod_cast Iff.rfl
    cases hh : c.hi with
    | none => simp [e1]
    | some v =>
      have e2 : (x ≤ (v : ℝ)) ↔ q ≤ v := by rw [(hhi v hh).2]; exact_mod_cast Iff.rfl
      simp [e1, e2]

lemma dirOf_lt {ds : List (List ℚ)} {c : Cons} {k : ℕ} {σ : Bool} (h : dirOf ds c = some (k, σ)) :
    k < 3 := by
  unfold dirOf at h
  split_ifs at h <;> simp only [Option.some.injEq, Prod.mk.injEq] at h <;> omega

lemma bndsOf_sub {ds : List (List ℚ)} {P : List (List Cons)} {pc : List Cons} (hpc : pc ∈ P)
    {c : Cons} (hc : c ∈ pc) {k : ℕ} {σ : Bool} (h : dirOf ds c = some (k, σ)) {b : ℚ}
    (hb : b ∈ bndsOf c σ) : b ∈ bndsK ds P k := by
  refine List.mem_cons_of_mem _ (List.mem_flatMap.2 ⟨pc, hpc, List.mem_flatMap.2 ⟨c, hc, ?_⟩⟩)
  simp only [h, ↓reduceIte]
  exact hb

/-- Every `y` is a symmetry image of some `w` with `τ₂(w), τ₃(w) ≥ 0`. -/
lemma exists_orbit_rep (E : Sym3) (R : Sym2) {d2 d3 : List ℚ}
    (h2 : suppOK d2 [6, 7, 10] = true) (h3 : suppOK d3 [8, 9, 11] = true) (y : Fib) :
    ∃ w : Fib, 0 ≤ tauOf E R d2 w ∧ 0 ≤ tauOf E R d3 w ∧ ∀ P : Set Fib, w ∈ P → y ∈ symOrbit P := by
  rcases le_or_gt 0 (tauOf E R d2 y) with ha | ha <;> rcases le_or_gt 0 (tauOf E R d3 y) with hb | hb
  · exact ⟨y, ha, hb, fun P hy => Or.inl (Or.inl (Or.inl hy))⟩
  · refine ⟨y.cj, by rw [tau_cj_re E R h2]; exact ha, by rw [tau_cj_im E R h3]; linarith,
      fun P hw => Or.inl (Or.inl (Or.inr ⟨y.cj, hw, Fib.cj_cj y⟩))⟩
  · refine ⟨y.cj.ng, by rw [tau_ng_re E R h2, tau_cj_re E R h2]; linarith,
      by rw [tau_ng_im E R h3, tau_cj_im E R h3]; linarith,
      fun P hw => Or.inr ⟨y.cj.ng, hw, by simp only [Fib.ng_ng, Fib.cj_cj]⟩⟩
  · refine ⟨y.ng, by rw [tau_ng_re E R h2]; linarith, by rw [tau_ng_im E R h3]; linarith,
      fun P hw => Or.inl (Or.inr ⟨y.ng, hw, Fib.ng_ng y⟩)⟩

/-- **Soundness of the coverage check**: every point of the fibre space lies in the symmetric
orbit of some piece. -/
theorem capCover_sound (E : Sym3) (R : Sym2) {ds : List (List ℚ)} {P : List (List Cons)}
    (h : capCoverOK ds P = true) (y : Fib) : ∃ pc ∈ P, y ∈ symOrbit (pieceSet E R pc) := by
  simp only [capCoverOK, Bool.and_eq_true, List.all_eq_true] at h
  obtain ⟨⟨h2, h3⟩, hall⟩ := h
  obtain ⟨w, hw2, hw3, hor⟩ := exists_orbit_rep E R h2 h3 y
  set t : ℕ → ℝ := fun k => tauOf E R (ds.getD k []) w with ht
  obtain ⟨q0, hq0, hs0⟩ := sample_exists (bndsK ds P 0) (t 0)
  obtain ⟨q2, hq2, hs2⟩ := sample_exists (bndsK ds P 1) (t 1)
  obtain ⟨q3, hq3, hs3⟩ := sample_exists (bndsK ds P 2) (t 2)
  have hz2 : (0 : ℚ) ≤ q2 := by
    have := ((hs2 0 List.mem_cons_self).1).1 (by simpa [ht] using hw2); exact_mod_cast this
  have hz3 : (0 : ℚ) ≤ q3 := by
    have := ((hs3 0 List.mem_cons_self).1).1 (by simpa [ht] using hw3); exact_mod_cast this
  have hany := hall q0 hq0 q2 hq2 q3 hq3
  simp only [hz2, hz3, decide_true, Bool.not_true, Bool.false_or, List.any_eq_true] at hany
  obtain ⟨pc, hpc, hat⟩ := hany
  refine ⟨pc, hpc, hor _ fun c hc => ?_⟩
  have hc' := List.all_eq_true.1 hat c hc
  cases hd : dirOf ds c with
  | none => simp [hd] at hc'
  | some kσ =>
    obtain ⟨k, σ⟩ := kσ
    simp only [hd] at hc'
    have hk := dirOf_lt hd
    unfold Cons.Holds
    rw [tau_of_dirOf E R hd w]
    set q : ℕ → ℚ := fun k => if k = 0 then q0 else if k = 1 then q2 else q3
    have hs : ∀ b ∈ bndsK ds P k, (((b : ℝ) ≤ t k ↔ (b : ℝ) ≤ q k) ∧ (t k ≤ b ↔ (q k : ℝ) ≤ b)) := by
      interval_cases k
      · exact hs0
      · exact hs2
      · exact hs3
    exact (cond_iff fun b hb => hs b (bndsOf_sub hpc hc hd hb)).2 hc'

end Grothe.LowerAnalytic
