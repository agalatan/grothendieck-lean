import Grothe.LowerAnalytic.CapCoverDefs

/-!
# Localized and sliced finite coverage checks

Coordinate filters remove only pieces that cannot contain the current sample.
Repeated samples are checked once. Slices partition the first candidate index;
their conjunction implies the original coverage predicate.
-/

namespace Grothe.LowerAnalytic

/-- The constraints of one coordinate, ignoring constraints on other coordinates. -/
def pieceAtCoord (ds : List (List ℚ)) (pc : List Cons) (k : ℕ) (x : ℚ) : Bool :=
  pc.all fun c => match dirOf ds c with
    | some (j, σ) => if j = k then condQ c σ x else true
    | none => true

lemma pieceAtCoord_of_pieceAt {ds : List (List ℚ)} {pc : List Cons} {q : ℕ → ℚ}
    (h : pieceAt ds pc q = true) (k : ℕ) : pieceAtCoord ds pc k (q k) = true := by
  simp only [pieceAt, List.all_eq_true] at h
  simp only [pieceAtCoord, List.all_eq_true]
  intro c hc
  have h := h c hc
  cases hd : dirOf ds c with
  | none => simp
  | some v =>
    rcases v with ⟨j, σ⟩
    by_cases hj : j = k
    · subst j; simpa [hd] using h
    · simp [hj]

/-- Samples of a coordinate with duplicate rationals removed. -/
def coverSamples (ds : List (List ℚ)) (P : List (List Cons)) (k : ℕ) : List ℚ :=
  (cands (bndsK ds P k)).eraseDups

/-- Check a first-coordinate sample, retaining only pieces that admit each prefix. -/
def coverAtFirst (ds : List (List ℚ)) (P : List (List Cons)) (q0 : ℚ) : Bool :=
  let P0 := P.filter fun pc => pieceAtCoord ds pc 0 q0
  (coverSamples ds P 1).all fun q2 =>
    let P02 := P0.filter fun pc => pieceAtCoord ds pc 1 q2
    (coverSamples ds P 2).all fun q3 =>
      !decide (0 ≤ q2) || !decide (0 ≤ q3) ||
        P02.any fun pc => pieceAt ds pc fun k => if k = 0 then q0 else if k = 1 then q2 else q3

lemma filtered_pieceAt_eq (ds : List (List ℚ)) (P : List (List Cons)) (q0 q2 q3 : ℚ) :
    ((P.filter fun pc => pieceAtCoord ds pc 0 q0).filter
      fun pc => pieceAtCoord ds pc 1 q2).any
      (fun pc => pieceAt ds pc fun k => if k = 0 then q0 else if k = 1 then q2 else q3) =
    P.any (fun pc => pieceAt ds pc fun k => if k = 0 then q0 else if k = 1 then q2 else q3) := by
  apply Bool.eq_iff_iff.mpr
  simp only [List.any_eq_true, List.mem_filter]
  constructor
  · rintro ⟨pc, ⟨⟨hp, _⟩, _⟩, h⟩
    exact ⟨pc, hp, h⟩
  · rintro ⟨pc, hp, h⟩
    refine ⟨pc, ⟨⟨hp, ?_⟩, ?_⟩, h⟩
    · simpa using pieceAtCoord_of_pieceAt h 0
    · simpa using pieceAtCoord_of_pieceAt h 1

/-- Localized coverage, extensionally equal to `capCoverOK`. -/
def capCoverFastOK (ds : List (List ℚ)) (P : List (List Cons)) : Bool :=
  suppOK (ds.getD 1 []) [6, 7, 10] && suppOK (ds.getD 2 []) [8, 9, 11] &&
    (coverSamples ds P 0).all (coverAtFirst ds P)

lemma capCoverFastOK_eq (ds : List (List ℚ)) (P : List (List Cons)) :
    capCoverFastOK ds P = capCoverOK ds P := by
  apply Bool.eq_iff_iff.mpr
  simp only [capCoverFastOK, capCoverOK, coverAtFirst, coverSamples,
    filtered_pieceAt_eq, Bool.and_eq_true, List.all_eq_true, List.mem_eraseDups]

/-- One residue-class slice of the duplicate-free first-coordinate samples.
`K = 0` is not a valid partition; the assembly theorem requires `0 < K`. -/
def capCoverOKSlice (ds : List (List ℚ)) (P : List (List Cons)) (i K : ℕ) : Bool :=
  suppOK (ds.getD 1 []) [6, 7, 10] && suppOK (ds.getD 2 []) [8, 9, 11] &&
    (List.range (coverSamples ds P 0).length).all fun n =>
      !decide (n % K = i) || coverAtFirst ds P ((coverSamples ds P 0).getD n 0)

/-- Checking every slice checks every original sample. -/
theorem capCoverOK_of_slices {ds : List (List ℚ)} {P : List (List Cons)} {K : ℕ}
    (hK : 0 < K) (h : ∀ i < K, capCoverOKSlice ds P i K = true) :
    capCoverOK ds P = true := by
  rw [← capCoverFastOK_eq]
  have h0 := h 0 hK
  simp only [capCoverOKSlice, Bool.and_eq_true, List.all_eq_true] at h0
  simp only [capCoverFastOK, Bool.and_eq_true, List.all_eq_true]
  refine ⟨h0.1, ?_⟩
  intro q hq
  obtain ⟨n, hn, rfl⟩ := List.getElem_of_mem hq
  have hs := h (n % K) (Nat.mod_lt n hK)
  simp only [capCoverOKSlice, Bool.and_eq_true, List.all_eq_true] at hs
  have hs := hs.2 n (List.mem_range.mpr hn)
  simpa [List.getD, List.getElem?_eq_getElem hn] using hs

end Grothe.LowerAnalytic
