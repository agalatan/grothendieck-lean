import Grothe.UpperQuad.TwistEllipseCheck
import Grothe.UpperQuad.QuadEllipseSound

/-!
# Arithmetic soundness of the twisted ellipse column coefficients

The rational integrated-Mehler parameters satisfy their positivity guards, and the executable
column coefficients enclose `(m+1) * sqrt(m! * N_m²)`. The internally selected coefficient list
has the production length and encloses this expression at every index.

These statements concern interval arithmetic only. Identifying `N_m²` with a bound for a Gaussian
dilation column is a separate analytic theorem.

Agent-ID: codex-40e8. Refs #343, #334.
-/

namespace Grothe.UpperQuad.TwistEllCheck

open GrotheQuad

/-- Every production Gaussian rate is greater than one. -/
lemma lambdaQ_gt_one (g : Power) : 1 < lambdaQ g := by
  have hj : (0 : ℚ) < (powerNat g : ℚ) := by unfold powerNat; positivity
  unfold lambdaQ
  nlinarith

/-- The rational column parameter lies in both required Mehler domains. -/
lemma columnTauQ_spec (g : Power) (m : Nat) :
    0 < columnTauQ g m ∧ columnTauQ g m < 1 ∧
      (2 * lambdaQ g - 1) * columnTauQ g m < 1 := by
  have hk1 : 1 < 2 * lambdaQ g - 1 := by linarith [lambdaQ_gt_one g]
  have hk : 0 < 2 * lambdaQ g - 1 := by linarith
  have hm : (0 : ℚ) ≤ m := Nat.cast_nonneg m
  have hd : (0 : ℚ) < ((m : ℚ) + 2) * (2 * lambdaQ g - 1) := by positivity
  simp only [columnTauQ, Nat.cast_add, Nat.cast_one, Nat.cast_ofNat]
  refine ⟨div_pos (by positivity) hd, ?_, ?_⟩
  · rw [div_lt_one hd]
    have hmul : (m : ℚ) + 2 < ((m : ℚ) + 2) * (2 * lambdaQ g - 1) := by
      simpa only [mul_one] using
        mul_lt_mul_of_pos_left hk1 (by positivity : (0 : ℚ) < (m : ℚ) + 2)
    linarith
  · rw [← mul_div_assoc, div_lt_one hd]
    nlinarith

/-- The squared rational column expression is strictly positive. -/
lemma columnNormSqQ_pos (g : Power) (m : Nat) : 0 < columnNormSqQ g m := by
  obtain ⟨ht, ht1, hkt⟩ := columnTauQ_spec g m
  unfold columnNormSqQ
  exact div_pos (pow_pos (inv_pos.mpr ht) m)
    (mul_pos (sub_pos.mpr ht1) (sub_pos.mpr hkt))

/-- The real expression enclosed by a coarse E5 column coefficient. -/
noncomputable def columnCoeff (g : Power) (m : Nat) : ℝ :=
  ((m + 1 : Nat) : ℝ) * Real.sqrt ((m.factorial : ℝ) * (columnNormSqQ g m : ℝ))

lemma columnCoeff_nonneg (g : Power) (m : Nat) : 0 ≤ columnCoeff g m := by
  unfold columnCoeff
  positivity

/-- An accepted executable coefficient contains its real arithmetic expression. -/
theorem columnCoeffI_sound (g : Power) (m : Nat) {c : Ival}
    (h : columnCoeffI g m = some c) : mem (columnCoeff g m) c := by
  obtain ⟨ht, ht1, hkt⟩ := columnTauQ_spec g m
  cases hp : isPos (EllCheck.qI (columnNormSqQ g m)) with
  | false =>
    simp [columnCoeffI, EllCheck.guard', ht, ht1, hkt, hp] at h
  | true =>
    have hc : mulN EllCheck.P (m + 1)
        (sqrtI EllCheck.P (mulN EllCheck.P (factNat m)
          (EllCheck.qI (columnNormSqQ g m)))) = c := by
      simpa [columnCoeffI, EllCheck.guard', ht, ht1, hkt, hp] using h
    rw [← hc]
    have hn : (0 : ℝ) < (columnNormSqQ g m : ℝ) := by
      exact_mod_cast columnNormSqQ_pos g m
    have hs := mem_sqrtI EllCheck.P
      (mul_nonneg (Nat.cast_nonneg (factNat m)) hn.le)
      (mem_mulN EllCheck.P (factNat m) (EllCheck.mem_qI (columnNormSqQ g m)))
    simpa only [columnCoeff, factNat_eq] using mem_mulN EllCheck.P (m + 1) hs

/-- A successful optional map preserves length and records each accepted input. -/
private lemma mapM_some_spec {α β : Type*} (f : α → Option β) (da : α) (db : β)
    {xs : List α} {ys : List β} (h : xs.mapM f = some ys) :
    ys.length = xs.length ∧
      ∀ i, i < xs.length → f (xs.getD i da) = some (ys.getD i db) := by
  induction xs generalizing ys with
  | nil =>
    have hy : ys = [] := by simpa using h.symm
    subst ys
    simp
  | cons a xs ih =>
    cases ha : f a with
    | none => simp [List.mapM_cons, ha] at h
    | some b =>
      cases ht : xs.mapM f with
      | none => simp [List.mapM_cons, ha, ht] at h
      | some bs =>
        have hy : b :: bs = ys := by simpa [List.mapM_cons, ha, ht] using h
        subst ys
        obtain ⟨hlen, hget⟩ := ih ht
        refine ⟨by simp [hlen], fun i hi => ?_⟩
        cases i with
        | zero => simpa using ha
        | succ i =>
          have hi' : i < xs.length := by simpa using hi
          simpa using hget i hi'

/-- A generated list has the production length and encloses every column expression. -/
theorem makeColumnCoeffs_sound (g : Power) {cs : List Ival}
    (h : makeColumnCoeffs g = some cs) :
    cs.length = totalDegree g + 1 ∧
      ∀ m, m < totalDegree g + 1 → mem (columnCoeff g m) (cs.getD m zeroI) := by
  have hs := mapM_some_spec (columnCoeffI g) 0 zeroI h
  refine ⟨by simpa using hs.1, fun m hm => columnCoeffI_sound g m ?_⟩
  simpa only [List.getD_eq_getElem?_getD, List.getElem?_range hm, Option.getD_some] using
    hs.2 m (by simpa using hm)

/-- The cached coefficient selection is the generator at the same production power. -/
lemma columnCoeffs_eq_make (g : Power) : columnCoeffs g = makeColumnCoeffs g := by
  fin_cases g <;> rfl

/-- The internally selected list has the production length and the correct interval entries. -/
theorem columnCoeffs_sound (g : Power) {cs : List Ival}
    (h : columnCoeffs g = some cs) :
    cs.length = totalDegree g + 1 ∧
      ∀ m, m < totalDegree g + 1 → mem (columnCoeff g m) (cs.getD m zeroI) :=
  makeColumnCoeffs_sound g (by rwa [← columnCoeffs_eq_make])

end Grothe.UpperQuad.TwistEllCheck
