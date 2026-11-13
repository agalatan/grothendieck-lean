import Grothe.UpperQuad.TwistEllipseCertificate
import Grothe.UpperQuad.TwistEllipseSound
import Grothe.UpperQuad.QuadEllipseDiskSound

/-!
# Arithmetic extraction for twisted panel certificates

The capped error encloses its exact real Gauss expression. The panel maximum retains successful
evaluations for every covering disk and dominates each of their upper endpoints. Unpacking
`checkedMass` retains the profile, geometric, sign, and coefficient checks needed by later
soundness arguments.

No analytic norm bound, quadrature exactness theorem, source-index coverage theorem, or sum of
panel errors is proved here.

Agent-ID: codex-40e8. Refs #343, #334.
-/

namespace Grothe.UpperQuad.TwistEllCheck

open GrotheQuad

/-- The exact Gauss expression formed from a certificate's rational common mass cap. -/
noncomputable def cappedGaussError (p : Grothe.UpperChaos.Q0GaussAddress.Panel)
    (c : Certificate) : ℝ :=
  (4 * ((p.hi : ℝ) - p.lo)) *
    (Real.sqrt (c.massCap : ℝ) * ((c.plan.geometry.rho : ℝ)⁻¹) ^ (2 * p.order)) /
      (1 - (c.plan.geometry.rho : ℝ)⁻¹)

/-- Successful capped-error arithmetic supplies a nonnegative mass cap, a positive
denominator, and membership of the exact real Gauss expression. -/
theorem cappedError_sound {p : Grothe.UpperChaos.Q0GaussAddress.Panel}
    {c : Certificate} {err : Ival} (h : cappedError p c = some err) :
    0 ≤ c.massCap ∧ 0 < 1 - (c.plan.geometry.rho : ℝ)⁻¹ ∧
      mem (cappedGaussError p c) err := by
  unfold cappedError at h
  obtain ⟨hcap, h⟩ := EllCheck.guard'_bind h
  have hcapQ : 0 ≤ c.massCap := of_decide_eq_true hcap
  have hcapR : (0 : ℝ) ≤ c.massCap := by exact_mod_cast hcapQ
  have hamp := mem_sqrtI EllCheck.P hcapR (EllCheck.mem_qI c.massCap)
  have hrho := EllCheck.mem_qI c.plan.geometry.rho⁻¹
  push_cast at hrho
  have hwidth := EllCheck.mem_qI (4 * (p.hi - p.lo))
  push_cast at hwidth
  obtain ⟨hem, hden⟩ := EllCheck.mem_dv
    (mem_mulI EllCheck.P hwidth
      (mem_mulI EllCheck.P hamp (EllCheck.mem_powB hrho (2 * p.order))))
    (mem_subI EllCheck.P (mem_one EllCheck.P) hrho) h
  exact ⟨hcapQ, hden, hem⟩

/-- The optional maximum fold retains every successful input and a nonnegative upper end. -/
private theorem maxFold_spec (f : Nat → Option Ival) (n : Nat) {acc : Ival}
    (h : (List.range n).foldl (fun a i ↦
      match a, f i with
      | some a, some b => some (maxUpper a b)
      | _, _ => none) (some zeroI) = some acc) :
    0 ≤ upperQ acc ∧
      ∀ i, i < n → ∃ d, f i = some d ∧ upperQ d ≤ upperQ acc := by
  induction n generalizing acc with
  | zero =>
    simp only [List.range_zero, List.foldl_nil, Option.some.injEq] at h
    subst h
    exact ⟨by norm_num [upperQ, zeroI], fun i hi => (Nat.not_lt_zero i hi).elim⟩
  | succ n ih =>
    rw [foldl_range_succ] at h
    generalize hprev : (List.range n).foldl (fun a i ↦
      match a, f i with
      | some a, some b => some (maxUpper a b)
      | _, _ => none) (some zeroI) = prev at h
    cases prev with
    | none => simp at h
    | some a =>
      cases hd : f n with
      | none => rw [hd] at h; simp at h
      | some b =>
        rw [hd] at h
        simp only [Option.some.injEq] at h
        subst h
        obtain ⟨ha0, hall⟩ := ih hprev
        rw [upperQ_maxUpper]
        refine ⟨ha0.trans (le_max_left _ _), fun i hi => ?_⟩
        rcases Nat.lt_succ_iff_lt_or_eq.mp hi with hi | rfl
        · obtain ⟨d, hd, hda⟩ := hall i hi
          exact ⟨d, hd, hda.trans (le_max_left _ _)⟩
        · exact ⟨b, hd, le_max_right _ _⟩

/-- An accepted panel maximum contains every actual disk evaluation, each below its
nonnegative upper endpoint. This statement needs no analytic interpretation of a disk result. -/
theorem panelM2_spec {g : Power} {cs : List Ival} {pos : Bool} {lo hi : ℚ}
    {pl : Plan} {mass : Ival} (h : panelM2 g cs pos lo hi pl = some mass) :
    0 ≤ upperQ mass ∧ ∀ i, i < pl.geometry.m → ∃ d,
      diskM2 g cs pos (EllCheck.diskCentre lo hi pl.geometry i) pl = some d ∧
        upperQ d ≤ upperQ mass :=
  maxFold_spec
    (fun i ↦ diskM2 g cs pos (EllCheck.diskCentre lo hi pl.geometry i) pl)
    pl.geometry.m h

/-- Every successful disk at a valid cover index is bounded by the computed panel maximum. -/
theorem panelM2_disk_le {g : Power} {cs : List Ival} {pos : Bool} {lo hi : ℚ}
    {pl : Plan} {mass d : Ival} {i : Nat}
    (h : panelM2 g cs pos lo hi pl = some mass) (hidx : i < pl.geometry.m)
    (hd : diskM2 g cs pos (EllCheck.diskCentre lo hi pl.geometry i) pl = some d) :
    upperQ d ≤ upperQ mass := by
  obtain ⟨d', hd', hle⟩ := (panelM2_spec h).2 i hidx
  rwa [Option.some.inj (hd'.symm.trans hd)] at hle

/-- Any real value enclosed by an accepted disk is below the real panel upper endpoint. -/
theorem panelM2_mem_le {g : Power} {cs : List Ival} {pos : Bool} {lo hi : ℚ}
    {pl : Plan} {mass d : Ival} {i : Nat} {x : ℝ}
    (h : panelM2 g cs pos lo hi pl = some mass) (hidx : i < pl.geometry.m)
    (hd : diskM2 g cs pos (EllCheck.diskCentre lo hi pl.geometry i) pl = some d)
    (hx : mem x d) : x ≤ (upperQ mass : ℝ) := by
  have hle : (upperQ d : ℝ) ≤ (upperQ mass : ℝ) := by
    exact_mod_cast panelM2_disk_le h hidx hd
  exact (le_upperQ_of_mem hx).trans hle

/-- Retain each successful stage of a disk evaluation, including the profile guard. -/
theorem diskM2_spec {g : Power} {cs : List Ival} {pos : Bool} {x : ℚ}
    {pl : Plan} {mass : Ival} (h : diskM2 g cs pos x pl = some mass) :
    ∃ at0 e a2hi conditional primary radial,
      EllCheck.diskProfile pos x pl.geometry.R = some (at0, e) ∧
      EllCheck.a2hiI x pl.geometry.R at0 e = some a2hi ∧
      upsI g cs x pl at0 e a2hi = some conditional ∧
      mehI g pl.geometry.tau x pl.geometry.R = some primary ∧
      EllCheck.expUp (EllCheck.qI (-2 * (x - pl.geometry.R))) = some radial ∧
      mulI EllCheck.P radial (mulI EllCheck.P primary conditional) = mass := by
  unfold diskM2 at h
  simp only [Option.bind_eq_bind, Option.bind_eq_some_iff] at h
  obtain ⟨⟨at0, e⟩, hprof, a2hi, ha2, conditional, hu, primary, hp, radial, hr, h⟩ := h
  simp only [Option.pure_def, Option.some.injEq] at h
  exact ⟨at0, e, a2hi, conditional, primary, radial, hprof, ha2, hu, hp, hr, h⟩

/-- Unpack all top-level guards and the cached coefficient selection, retaining the
successful evaluation and maximum inequality at every covering-disk index. -/
theorem checkedMass_spec {g : Power} {p : Grothe.UpperChaos.Q0GaussAddress.Panel}
    {pl : Plan} {mass : Ival} (h : checkedMass g p pl = some mass) :
    let t0 := EllCheck.taylorI (EllCheck.qI ((p.lo + p.hi) / 2)) 0
    EllCheck.chatOK = true ∧ EllCheck.planGeomOK p.lo p.hi pl.geometry = true ∧
      (isPos t0 || isNeg t0) = true ∧ ∃ cs,
        columnCoeffs g = some cs ∧ panelM2 g cs (isPos t0) p.lo p.hi pl = some mass ∧
        0 ≤ upperQ mass ∧ ∀ i, i < pl.geometry.m → ∃ d,
          diskM2 g cs (isPos t0) (EllCheck.diskCentre p.lo p.hi pl.geometry i) pl = some d ∧
            upperQ d ≤ upperQ mass := by
  dsimp only
  unfold checkedMass at h
  obtain ⟨hc, h⟩ := EllCheck.guard'_bind h
  obtain ⟨hgeo, h⟩ := EllCheck.guard'_bind h
  obtain ⟨hsign, h⟩ := EllCheck.guard'_bind h
  simp only [Option.bind_eq_bind, Option.bind_eq_some_iff] at h
  obtain ⟨cs, hcs, hpanel⟩ := h
  obtain ⟨hm0, hdisks⟩ := panelM2_spec hpanel
  exact ⟨hc, hgeo, hsign, cs, hcs, hpanel, hm0, hdisks⟩

end Grothe.UpperQuad.TwistEllCheck
