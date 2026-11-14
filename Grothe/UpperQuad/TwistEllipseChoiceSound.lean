import Grothe.UpperQuad.TwistEllipseSound

/-!
# Soundness of conditional majorant selection

The Y and K branches of `upsI` retain their exact interval computations. These lemmas unpack
successful branches and propagate a common real upper bound through every selection mode.
The result can be a branch interval itself or its thin upper-endpoint interval.

No analytic majorant or integrand bound is assumed beyond the supplied branch implications.

Agent-ID: codex-40e8. Refs #343, #334.
-/

namespace Grothe.UpperQuad.TwistEllCheck

open GrotheQuad

/-- A successful minimum comes from one successful candidate, possibly made thin. -/
theorem minResult_success_cases {a b : Option Ival} {r : Ival}
    (h : minResult a b = some r) :
    (∃ u, a = some u ∧ (r = u ∨ r = upperI u)) ∨
      (∃ u, b = some u ∧ (r = u ∨ r = upperI u)) := by
  cases a with
  | none =>
    cases b with
    | none => simp [minResult] at h
    | some b => exact Or.inr ⟨b, rfl, Or.inl (Option.some.inj h).symm⟩
  | some a =>
    cases b with
    | none => exact Or.inl ⟨a, rfl, Or.inl (Option.some.inj h).symm⟩
    | some b =>
      simp only [minResult] at h
      split_ifs at h with hab
      · exact Or.inl ⟨a, rfl, Or.inr (Option.some.inj h).symm⟩
      · exact Or.inr ⟨b, rfl, Or.inr (Option.some.inj h).symm⟩

/-- Successful conditional selection exposes every computation of the selected Y or K branch.
The final equality records the thinning performed by automatic selection. -/
theorem upsI_success_cases {g : Power} {coeffs : List Ival} {x : ℚ} {pl : Plan}
    {at0 e a2hi r : Ival} (h : upsI g coeffs x pl at0 e a2hi = some r) :
    (∃ b2 u,
      (match EllCheck.defectI x pl.geometry.R at0 e with
        | some kp => shiftImSqI a2hi kp
        | none => some a2hi) = some b2 ∧
      upsYI g pl.etaY (EllCheck.qI (sqrtImSqQ x pl.geometry.R)) b2 = some u ∧
      (r = u ∨ r = upperI u)) ∨
    (∃ kp a2lo u,
      EllCheck.defectI x pl.geometry.R at0 e = some kp ∧
      EllCheck.a2loI x pl.geometry.R at0 e = some a2lo ∧
      upsKI g coeffs pl.etaK (EllCheck.qI (sqrtImSqQ x pl.geometry.R)) kp a2lo = some u ∧
      (r = u ∨ r = upperI u)) := by
  let y : Option Ival := do
    let b2 ← match EllCheck.defectI x pl.geometry.R at0 e with
      | some kp => shiftImSqI a2hi kp
      | none => some a2hi
    upsYI g pl.etaY (EllCheck.qI (sqrtImSqQ x pl.geometry.R)) b2
  let k : Option Ival := do
    let kp ← EllCheck.defectI x pl.geometry.R at0 e
    let a2lo ← EllCheck.a2loI x pl.geometry.R at0 e
    upsKI g coeffs pl.etaK (EllCheck.qI (sqrtImSqQ x pl.geometry.R)) kp a2lo
  change (match pl.mode with
    | .y => y
    | .k => k
    | .auto => minResult y k) = some r at h
  have hs : (∃ u, y = some u ∧ (r = u ∨ r = upperI u)) ∨
      (∃ u, k = some u ∧ (r = u ∨ r = upperI u)) := by
    cases hm : pl.mode with
    | y => exact Or.inl ⟨r, by simpa only [hm] using h, Or.inl rfl⟩
    | k => exact Or.inr ⟨r, by simpa only [hm] using h, Or.inl rfl⟩
    | auto => exact minResult_success_cases (by simpa only [hm] using h)
  rcases hs with ⟨u, hu, hr⟩ | ⟨u, hu, hr⟩
  · cases hkp : EllCheck.defectI x pl.geometry.R at0 e with
    | none =>
      have hy : upsYI g pl.etaY (EllCheck.qI (sqrtImSqQ x pl.geometry.R)) a2hi =
          some u := by simpa [y, hkp] using hu
      exact Or.inl ⟨a2hi, u, rfl, hy, hr⟩
    | some kp =>
      have hu' : (shiftImSqI a2hi kp).bind
          (fun b2 ↦ upsYI g pl.etaY (EllCheck.qI (sqrtImSqQ x pl.geometry.R)) b2) =
          some u := by simpa [y, hkp] using hu
      obtain ⟨b2, hb2, hy⟩ := Option.bind_eq_some_iff.mp hu'
      exact Or.inl ⟨b2, u, by simpa only [hkp] using hb2, hy, hr⟩
  · change Option.bind _ _ = some u at hu
    obtain ⟨kp, hkp, hk⟩ := Option.bind_eq_some_iff.mp hu
    obtain ⟨a2lo, ha2lo, hk⟩ := Option.bind_eq_some_iff.mp hk
    exact Or.inr ⟨kp, a2lo, u, hkp, ha2lo, hk, hr⟩

/-- If each successful Y or K branch bounds a real target, every successful selection bounds it.
Failed branches require no hypothesis, including either failure in automatic mode. -/
theorem upsI_sound {g : Power} {coeffs : List Ival} {x : ℚ} {pl : Plan}
    {at0 e a2hi r : Ival} {U : ℝ}
    (hy : ∀ b2 u,
      (match EllCheck.defectI x pl.geometry.R at0 e with
        | some kp => shiftImSqI a2hi kp
        | none => some a2hi) = some b2 →
      upsYI g pl.etaY (EllCheck.qI (sqrtImSqQ x pl.geometry.R)) b2 = some u →
      U ≤ (upperQ u : ℝ))
    (hk : ∀ kp a2lo u,
      EllCheck.defectI x pl.geometry.R at0 e = some kp →
      EllCheck.a2loI x pl.geometry.R at0 e = some a2lo →
      upsKI g coeffs pl.etaK (EllCheck.qI (sqrtImSqQ x pl.geometry.R)) kp a2lo = some u →
      U ≤ (upperQ u : ℝ))
    (h : upsI g coeffs x pl at0 e a2hi = some r) : U ≤ (upperQ r : ℝ) := by
  rcases upsI_success_cases h with
    ⟨b2, u, hb2, hu, rfl | rfl⟩ | ⟨kp, a2lo, u, hkp, ha2lo, hu, rfl | rfl⟩
  · exact hy b2 _ hb2 hu
  · exact hy b2 u hb2 hu
  · exact hk kp a2lo _ hkp ha2lo hu
  · exact hk kp a2lo u hkp ha2lo hu

end Grothe.UpperQuad.TwistEllCheck
