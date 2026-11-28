import Grothe.UpperSix.HaagerupKernel.TaylorHardy

set_option warningAsError true

/-!
# Sub-arc Simpson quadrature chaining for smoothed Taylor-Hardy contours

Splits `sumSimpsonPart` across right-associated partition chunks so each `decide +kernel`
sub-arc theorem resets the kernel WHNF cache while preserving standard-axiom proofs of
`meanQ1SmoothedOK`.

Agent-ID: gemini-40b2
-/

namespace Haagerup.UpperBivar

open HaagerupKernel.TaylorHardy

/-- Per-leaf integrand enclosure matching `meanQ1SmoothedOK` pointwise. -/
def smoothedLeafInv (ctQ stQ seQ : Rat) (pl ql : List Rat) (rhoQ jQ : Rat) :
    Int → Int → Option TM2 :=
  let dat := mkSmoothedTMData ctQ stQ seQ pl ql
  let rhoTM := ofRatTM rhoQ
  let jTM := ofRatTM jQ
  let j16sq := ofRatTM (16 * jQ * jQ)
  fun sm h ↦
    match circleTM rhoTM sm h with
    | none => none
    | some (t, onePs2) =>
      match gauss2x2DenTM (evalRSmoothed dat t) jTM j16sq with
      | none => none
      | some den => tmInvPos (tmMul onePs2 den)

/-- Concatenate two certified `sumSimpsonPart` sub-arcs along `xs ++ ys`. -/
theorem sumSimpsonPart_chain {unit : Nat} {leafInv : Int → Int → Option TM2}
    {pos : Nat} {xs ys : List Nat} {acc mid out : Int}
    (h1 : sumSimpsonPart unit leafInv pos xs acc = some mid)
    (h2 : sumSimpsonPart unit leafInv (Nat.add pos (sumNatList xs)) ys mid = some out) :
    sumSimpsonPart unit leafInv pos (xs ++ ys) acc = some out := by
  induction xs generalizing pos acc with
  | nil =>
    cases h1
    exact h2
  | cons w rest ih =>
    dsimp only [List.cons_append, sumSimpsonPart] at h1 ⊢
    revert h1
    cases leafInv
        (Int.ofNat (Nat.mul (Nat.add (Nat.add pos pos) w) unit))
        (Int.ofNat (Nat.mul w unit)) with
    | none =>
      intro h1
      cases h1
    | some inv =>
      intro h1
      dsimp only at h1 ⊢
      have had : Nat.add pos (sumNatList (w :: rest)) =
          Nat.add (Nat.add pos w) (sumNatList rest) :=
        (Nat.add_assoc pos w (sumNatList rest)).symm
      exact ih h1 (had ▸ h2)

private theorem sumSimpsonPart_congr {unit : Nat} {f g : Int → Int → Option TM2}
    (hfg : ∀ sm h, f sm h = g sm h) (pos : Nat) (steps : List Nat) (acc : Int) :
    sumSimpsonPart unit f pos steps acc = sumSimpsonPart unit g pos steps acc := by
  induction steps generalizing pos acc with
  | nil => rfl
  | cons w rest ih =>
    dsimp only [sumSimpsonPart]
    rw [hfg]
    cases g
        (Int.ofNat (Nat.mul (Nat.add (Nat.add pos pos) w) unit))
        (Int.ofNat (Nat.mul w unit)) with
    | none => rfl
    | some _ => exact ih _ _

/-- Close `meanQ1SmoothedOK` from a chained `sumSimpsonPart` total and the final cap check. -/
theorem meanQ1SmoothedOK_of_acc {ctQ stQ seQ : Rat} {pl ql : List Rat}
    {rhoQ jQ budgetQ : Rat} {k : Nat} {steps : List Nat} {acc : Int}
    (hsum : sumSimpsonPart (Nat.div D64N (Nat.mul 2 (Nat.pow 2 k)))
      (smoothedLeafInv ctQ stQ seQ pl ql rhoQ jQ) 0 steps 0 = some acc)
    (hcap : (decide (k ≤ 63) && decide (sumNatList steps = Nat.pow 2 k) &&
      iLe (iMul 4 acc) (iMul (Int.ofNat (Nat.mul 3 (Nat.pow 2 k)))
        (ofRatDown64 (piLo20Q * budgetQ)))) = true) :
    meanQ1SmoothedOK ctQ stQ seQ pl ql rhoQ jQ budgetQ k steps = true := by
  rcases Bool.and_eq_true_iff.mp hcap with ⟨hks, hle⟩
  unfold meanQ1SmoothedOK
  dsimp only
  split
  · rename_i hneg
    rw [hks] at hneg
    cases hneg
  · split
    · rename_i heq
      have hc : none = some acc := heq.symm.trans ((sumSimpsonPart_congr ?_ 0 steps 0).trans hsum)
      · cases hc
      · intro sm h
        unfold smoothedLeafInv
        cases circleTM (ofRatTM rhoQ) sm h with
        | none => rfl
        | some p =>
          rcases p with ⟨t, onePs2⟩
          dsimp only
          cases gauss2x2DenTM (evalRSmoothed (mkSmoothedTMData ctQ stQ seQ pl ql) t)
              (ofRatTM jQ) (ofRatTM (16 * jQ * jQ)) <;> rfl
    · rename_i acc' heq
      have hc : some acc' = some acc :=
        heq.symm.trans ((sumSimpsonPart_congr ?_ 0 steps 0).trans hsum)
      · cases hc
        exact hle
      · intro sm h
        unfold smoothedLeafInv
        cases circleTM (ofRatTM rhoQ) sm h with
        | none => rfl
        | some p =>
          rcases p with ⟨t, onePs2⟩
          dsimp only
          cases gauss2x2DenTM (evalRSmoothed (mkSmoothedTMData ctQ stQ seQ pl ql) t)
              (ofRatTM jQ) (ofRatTM (16 * jQ * jQ)) <;> rfl

end Haagerup.UpperBivar
