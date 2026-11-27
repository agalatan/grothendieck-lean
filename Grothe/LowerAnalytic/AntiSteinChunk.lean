import Grothe.LowerAnalytic.AntiSteinRowCheck

/-!
# Chunked kernel verification for `checkAntiNode`

Evaluating `checkAntiPiecesAux` over all 150+ knots of a dense `AntiNode` in a single
`decide +kernel` invocation accumulates large WHNF caches and quadratic expression trees in the
running spline integrals `(g1, g2)`.

This module provides a pure-kernel chunking step (`checkAntiChunk` / `checkAntiTail`) that splits
the knot traversal into independent 12–15 knot chunks, each checked by its own `decide +kernel`
lemma, and reassembles the exact original theorem `checkAntiNode nodes smax an = true` without
changing `AntiSteinRowCheck.lean` or `AntiSteinRowSound.lean`.
-/

namespace Grothe.LowerAnalytic

/-- Header check of `checkAntiNode` (everything except `checkAntiPiecesAux`). -/
def checkAntiHead (nodes : List (ℚ × ℚ)) (an : AntiNode) : Bool :=
  match an.knots with
  | 0 :: _ =>
    decide (0 < an.gridDen) && (an.gridDen % 2 == 0) && decide (0 < an.sigma) &&
      nodesOK nodes &&
      decide (0 < an.mu1) && decide (0 < an.mu2) && decide (0 < an.mu3) &&
      decide (0 < an.mu4) && decide (0 < an.mu5) &&
      decide (0 ≤ an.l3s) && decide (0 ≤ an.l3a) && decide (0 ≤ an.l3b) &&
      decide (0 < an.l3s + an.l3a + an.l3b)
  | _ => false

/-- Bounded `n`-step slice of `checkAntiPiecesAux`, checking that the running integrals and
remaining `LinPiece` tail length match `(g1End, g2End, lpRem)` after `n` knot intervals. -/
def checkAntiSteps (an : AntiNode) (mAll m1 m2 m3 m4 m5 : Int) :
    ℕ → Bool → Int → Int → List ℕ → List Int → List Int → List Int → List Int → List Int →
    List Int → List Int → List LinPiece → Int → Int → ℕ → Bool
  | 0, _, g1, g2, _ :: _, _ :: _, _ :: _, _ :: _, _ :: _, _ :: _, _ :: _, _ :: _, lps,
      g1End, g2End, lpRem =>
    (g1 == g1End) && (g2 == g2End) && (lps.length == lpRem)
  | n + 1, first, g1, g2, k0 :: k1 :: ks, p1a :: p1b :: p1s, p2a :: p2b :: p2s,
      x2a :: x2b :: x2s, x1a :: x1b :: x1s, xaa :: xab :: xas,
      t2a :: t2b :: t2s, t4a :: t4b :: t4s, lps, g1End, g2End, lpRem =>
    let M : Int := (an.gridDen : Int)
    let M2 : Int := M * M
    let M6 : Int := M2 * M2 * M2
    let U0 : Int := (k0 : Int) * (k0 : Int)
    let U1 : Int := (k1 : Int) * (k1 : Int)
    let du : Int := U1 - U0
    let FvW := pieceFvWGen an mAll m1 m2 m3 m4 m5 false k0 k1
      p1a p1b p2a p2b x2a x2b x1a x1b xaa xab t2a t2b t4a t4b g1 g2
    let Wden := M6 * lamScale * du * du * mAll
    let rLo : ℚ := (k0 : ℚ) / (an.gridDen : ℚ)
    let rHi : ℚ := (k1 : ℚ) / (an.gridDen : ℚ)
    if decide (k0 < k1) && coneAtOK x2a x1a xaa &&
        (!first || (FvW.getD 0 0 == 0 && FvW.getD 1 0 == 0)) then
      let Pcell := if first then pInSq (FvW.drop 2) else pInSq FvW
      match sweepFiniteCell first an.gridDen Wden Pcell rLo rHi lps with
      | none => false
      | some lps' =>
        let g1' := g1 + M2 * rMA * (p1a + p1b) * du + an.slope1 * (U1 * U1 - U0 * U0)
        let g2' := g2 + M2 * rMA * (p2a + p2b) * du + an.slope2 * (U1 * U1 - U0 * U0)
        checkAntiSteps an mAll m1 m2 m3 m4 m5 n false g1' g2'
          (k1 :: ks) (p1b :: p1s) (p2b :: p2s) (x2b :: x2s) (x1b :: x1s)
          (xab :: xas) (t2b :: t2s) (t4b :: t4s) lps' g1End g2End lpRem
    else false
  | _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ => false

/-- Check `len` knot intervals starting at knot `idx` and node suffix `nodes.drop skip0`. -/
def checkAntiChunk (nodes : List (ℚ × ℚ)) (smax : ℚ) (an : AntiNode)
    (idx len : ℕ) (g1 g2 : Int) (skip0 : ℕ) (g1End g2End : Int) (skip1 : ℕ) : Bool :=
  let m1 := an.mu2 * an.mu3 * an.mu4 * an.mu5
  let m2 := an.mu1 * an.mu3 * an.mu4 * an.mu5
  let m3 := an.mu1 * an.mu2 * an.mu4 * an.mu5
  let m4 := an.mu1 * an.mu2 * an.mu3 * an.mu5
  let m5 := an.mu1 * an.mu2 * an.mu3 * an.mu4
  let mAll := an.mu1 * m1
  decide (0 < len) && decide (skip0 ≤ skip1) && decide (skip1 < nodes.length) &&
    checkAntiSteps an mAll m1 m2 m3 m4 m5 len (idx == 0) g1 g2
      (an.knots.drop idx) (an.phi1.drop idx) (an.phi2.drop idx)
      (an.xi2.drop idx) (an.xi1.drop idx) (an.xia.drop idx)
      (an.th2.drop idx) (an.th4.drop idx)
      (mkLinPieces an.sigma smax (nodes.drop skip0))
      g1End g2End (nodes.length - skip1)

/-- Check the remaining knots (and infinite tail) starting at knot `idx` and `nodes.drop skip0`. -/
def checkAntiTail (nodes : List (ℚ × ℚ)) (smax : ℚ) (an : AntiNode)
    (idx : ℕ) (g1 g2 : Int) (skip0 : ℕ) : Bool :=
  let m1 := an.mu2 * an.mu3 * an.mu4 * an.mu5
  let m2 := an.mu1 * an.mu3 * an.mu4 * an.mu5
  let m3 := an.mu1 * an.mu2 * an.mu4 * an.mu5
  let m4 := an.mu1 * an.mu2 * an.mu3 * an.mu5
  let m5 := an.mu1 * an.mu2 * an.mu3 * an.mu4
  let mAll := an.mu1 * m1
  checkAntiPiecesAux an mAll m1 m2 m3 m4 m5 (idx == 0) g1 g2
    (an.knots.drop idx) (an.phi1.drop idx) (an.phi2.drop idx)
    (an.xi2.drop idx) (an.xi1.drop idx) (an.xia.drop idx)
    (an.th2.drop idx) (an.th4.drop idx)
    (mkLinPieces an.sigma smax (nodes.drop skip0))

private theorem sweepFiniteCell_drop (first : Bool) (M : ℕ) (Wden : Int) (Pcell : List Int)
    (rHi : ℚ) : ∀ (lps : List LinPiece) (rLo : ℚ) (lps' : List LinPiece),
    sweepFiniteCell first M Wden Pcell rLo rHi lps = some lps' →
    lps'.length ≤ lps.length ∧ lps' = lps.drop (lps.length - lps'.length)
  | [], _, _, h => by simp [sweepFiniteCell] at h
  | lp :: rest, rLo, lps', h => by
    simp only [sweepFiniteCell] at h
    cases hhi : lp.hi? with
    | none =>
      rw [hhi] at h
      dsimp only at h
      split_ifs at h
      cases h
      exact ⟨le_rfl, by simp⟩
    | some lpHi =>
      rw [hhi] at h
      dsimp only at h
      split_ifs at h
      · obtain ⟨hle, hdrop⟩ := sweepFiniteCell_drop first M Wden Pcell rHi rest rLo lps' h
        refine ⟨by simp; omega, ?_⟩
        rw [show (lp :: rest).length - lps'.length = (rest.length - lps'.length) + 1 by simp; omega]
        simpa [List.drop_succ_cons] using hdrop
      · cases h
        exact ⟨by simp, by simp⟩
      · cases h
        exact ⟨le_rfl, by simp⟩
      · obtain ⟨hle, hdrop⟩ := sweepFiniteCell_drop first M Wden Pcell rHi rest lpHi lps' h
        refine ⟨by simp; omega, ?_⟩
        rw [show (lp :: rest).length - lps'.length = (rest.length - lps'.length) + 1 by simp; omega]
        simpa [List.drop_succ_cons] using hdrop

private theorem mkLinPieces_length (sigma smax : ℚ) : ∀ (nodes : List (ℚ × ℚ)),
    (mkLinPieces sigma smax nodes).length = nodes.length
  | [] => rfl
  | [_] => rfl
  | _ :: b :: rest => by
    simp only [mkLinPieces, List.length_cons]
    exact congrArg (· + 1) (mkLinPieces_length sigma smax (b :: rest))

private theorem mkLinPieces_drop (sigma smax : ℚ) : ∀ (k : ℕ) (nodes : List (ℚ × ℚ)),
    k < nodes.length →
    (mkLinPieces sigma smax nodes).drop k = mkLinPieces sigma smax (nodes.drop k)
  | 0, _, _ => rfl
  | _ + 1, [], h => by simp at h
  | _ + 1, [_], h => by simp at h
  | k + 1, _ :: b :: rest, h => by
    simp only [mkLinPieces, List.drop_succ_cons]
    exact mkLinPieces_drop sigma smax k (b :: rest) (by simp at h ⊢; omega)

private theorem checkAntiSteps_sound (an : AntiNode) (mAll m1 m2 m3 m4 m5 : Int) :
    ∀ (n : ℕ) (first : Bool) (g1 g2 : Int)
      (ks : List ℕ) (p1s p2s x2s x1s xas t2s t4s : List Int)
      (lps : List LinPiece) (g1End g2End : Int) (lpRem : ℕ),
    checkAntiSteps an mAll m1 m2 m3 m4 m5 n first g1 g2
      ks p1s p2s x2s x1s xas t2s t4s lps g1End g2End lpRem = true →
    lpRem ≤ lps.length ∧
    (checkAntiPiecesAux an mAll m1 m2 m3 m4 m5 (if n == 0 then first else false) g1End g2End
      (ks.drop n) (p1s.drop n) (p2s.drop n) (x2s.drop n) (x1s.drop n) (xas.drop n)
      (t2s.drop n) (t4s.drop n) (lps.drop (lps.length - lpRem)) = true →
    checkAntiPiecesAux an mAll m1 m2 m3 m4 m5 first g1 g2
      ks p1s p2s x2s x1s xas t2s t4s lps = true)
  | 0, first, g1, g2, ks, p1s, p2s, x2s, x1s, xas, t2s, t4s, lps, g1End, g2End, lpRem, h => by
    cases ks with
    | nil => simp [checkAntiSteps] at h
    | cons k ks' =>
    cases p1s with
    | nil => simp [checkAntiSteps] at h
    | cons p1 p1s' =>
    cases p2s with
    | nil => simp [checkAntiSteps] at h
    | cons p2 p2s' =>
    cases x2s with
    | nil => simp [checkAntiSteps] at h
    | cons x2 x2s' =>
    cases x1s with
    | nil => simp [checkAntiSteps] at h
    | cons x1 x1s' =>
    cases xas with
    | nil => simp [checkAntiSteps] at h
    | cons xa xas' =>
    cases t2s with
    | nil => simp [checkAntiSteps] at h
    | cons t2 t2s' =>
    cases t4s with
    | nil => simp [checkAntiSteps] at h
    | cons t4 t4s' =>
      simp only [checkAntiSteps, Bool.and_eq_true, beq_iff_eq] at h
      obtain ⟨⟨rfl, rfl⟩, rfl⟩ := h
      exact ⟨le_rfl, fun ht => by simpa using ht⟩
  | n + 1, first, g1, g2, ks, p1s, p2s, x2s, x1s, xas, t2s, t4s, lps, g1End, g2End, lpRem, h => by
    cases ks with | nil => simp [checkAntiSteps] at h | cons k0 ks =>
    cases ks with | nil => simp [checkAntiSteps] at h | cons k1 ks =>
    cases p1s with | nil => simp [checkAntiSteps] at h | cons p1a p1s =>
    cases p1s with | nil => simp [checkAntiSteps] at h | cons p1b p1s =>
    cases p2s with | nil => simp [checkAntiSteps] at h | cons p2a p2s =>
    cases p2s with | nil => simp [checkAntiSteps] at h | cons p2b p2s =>
    cases x2s with | nil => simp [checkAntiSteps] at h | cons x2a x2s =>
    cases x2s with | nil => simp [checkAntiSteps] at h | cons x2b x2s =>
    cases x1s with | nil => simp [checkAntiSteps] at h | cons x1a x1s =>
    cases x1s with | nil => simp [checkAntiSteps] at h | cons x1b x1s =>
    cases xas with | nil => simp [checkAntiSteps] at h | cons xaa xas =>
    cases xas with | nil => simp [checkAntiSteps] at h | cons xab xas =>
    cases t2s with | nil => simp [checkAntiSteps] at h | cons t2a t2s =>
    cases t2s with | nil => simp [checkAntiSteps] at h | cons t2b t2s =>
    cases t4s with | nil => simp [checkAntiSteps] at h | cons t4a t4s =>
    cases t4s with | nil => simp [checkAntiSteps] at h | cons t4b t4s =>
    simp only [checkAntiSteps] at h
    split at h
    · rename_i hcond
      split at h
      · cases h
      · rename_i lps' hsw
        obtain ⟨hlen', hdrop'⟩ := sweepFiniteCell_drop _ _ _ _ _ lps _ lps' hsw
        obtain ⟨hle, himp⟩ := checkAntiSteps_sound an mAll m1 m2 m3 m4 m5 n false _ _
          (k1 :: ks) (p1b :: p1s) (p2b :: p2s) (x2b :: x2s) (x1b :: x1s) (xab :: xas)
          (t2b :: t2s) (t4b :: t4s) lps' g1End g2End lpRem h
        refine ⟨le_trans hle hlen', fun ht => ?_⟩
        simp only [checkAntiPiecesAux, hcond, ↓reduceIte, hsw]
        apply himp
        have hflag : (if n == 0 then false else false) = false := by cases n <;> rfl
        have hflag2 : (if n + 1 == 0 then first else false) = false := rfl
        rw [hflag]
        rw [hflag2] at ht
        have hlps_eq : lps'.drop (lps'.length - lpRem) = lps.drop (lps.length - lpRem) := by
          conv_lhs => rw [hdrop']
          rw [List.drop_drop, List.length_drop]
          congr 1
          omega
        rw [hlps_eq]
        simpa [List.drop_succ_cons] using ht
    · cases h

/-- Advance `checkAntiTail` backward across one verified chunk `checkAntiChunk`. -/
theorem checkAntiTail_of_chunk (nodes : List (ℚ × ℚ)) (smax : ℚ) (an : AntiNode)
    (idx len : ℕ) (g1 g2 : Int) (skip0 : ℕ) (g1End g2End : Int) (skip1 : ℕ)
    (hc : checkAntiChunk nodes smax an idx len g1 g2 skip0 g1End g2End skip1 = true)
    (ht : checkAntiTail nodes smax an (idx + len) g1End g2End skip1 = true) :
    checkAntiTail nodes smax an idx g1 g2 skip0 = true := by
  dsimp only [checkAntiChunk] at hc
  simp only [Bool.and_eq_true, decide_eq_true_eq] at hc
  obtain ⟨⟨⟨hlen, hskip01⟩, hskip1⟩, hsteps⟩ := hc
  dsimp only [checkAntiTail] at ht ⊢
  obtain ⟨_, himp⟩ := checkAntiSteps_sound an _ _ _ _ _ _ len (idx == 0) g1 g2
    (an.knots.drop idx) (an.phi1.drop idx) (an.phi2.drop idx)
    (an.xi2.drop idx) (an.xi1.drop idx) (an.xia.drop idx)
    (an.th2.drop idx) (an.th4.drop idx)
    (mkLinPieces an.sigma smax (nodes.drop skip0)) g1End g2End (nodes.length - skip1) hsteps
  apply himp
  have hlen0 : (len == 0) = false := beq_false_of_ne (by omega)
  have hidxlen : (idx + len == 0) = false := beq_false_of_ne (by omega)
  rw [hlen0]
  rw [hidxlen] at ht
  simp only [Bool.false_eq_true, ↓reduceIte, List.drop_drop]
  have hlps :
      (mkLinPieces an.sigma smax (nodes.drop skip0)).drop
        ((mkLinPieces an.sigma smax (nodes.drop skip0)).length - (nodes.length - skip1)) =
      mkLinPieces an.sigma smax (nodes.drop skip1) := by
    rw [mkLinPieces_length, List.length_drop]
    have hsub : (nodes.length - skip0) - (nodes.length - skip1) = skip1 - skip0 := by omega
    rw [hsub, mkLinPieces_drop an.sigma smax (skip1 - skip0) (nodes.drop skip0) (by rw [List.length_drop]; omega),
      List.drop_drop, show skip0 + (skip1 - skip0) = skip1 by omega]
  rw [hlps]
  exact ht

/-- Assemble `checkAntiNode` from `checkAntiHead` and `checkAntiTail` at index `0`. -/
theorem checkAntiNode_of_tail (nodes : List (ℚ × ℚ)) (smax : ℚ) (an : AntiNode)
    (hh : checkAntiHead nodes an = true)
    (ht : checkAntiTail nodes smax an 0 0 0 0 = true) :
    checkAntiNode nodes smax an = true := by
  dsimp only [checkAntiHead] at hh
  dsimp only [checkAntiTail] at ht
  dsimp only [checkAntiNode]
  cases hkn : an.knots with
  | nil => rw [hkn] at hh; cases hh
  | cons k ks =>
    cases k with
    | succ _ => rw [hkn] at hh; cases hh
    | zero =>
      rw [hkn] at hh
      exact Bool.and_eq_true_iff.mpr ⟨hh, by simpa [hkn] using ht⟩

end Grothe.LowerAnalytic
