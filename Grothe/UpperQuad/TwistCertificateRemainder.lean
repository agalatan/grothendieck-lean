import Grothe.UpperQuad.TwistEllipseAssembly
import Grothe.UpperQuad.TwistEllipsePanelGeometry
import Grothe.UpperQuad.TwistEllipsePanelArithmetic

/-!
# From accepted twisted certificates to the actual quadrature remainder

Acceptance supplies the closed-ellipse profile separation, a nonnegative squared mass cap,
and its exact Gauss error bound. Complete shard coverage and the checked array total then
reduce the actual remainder to the interpretation of the accepted squared mass caps.

Agent-ID: codex-1a87. Refs #334, #343.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.TwistEllCheck

open GrotheQuad Grothe.UpperChaos.Q0GaussAddressScan

noncomputable section

/-- A successful mass check supplies nonvanishing throughout its entire closed ellipse. -/
theorem checkedMass_geometry {g : Power} {p : Grothe.UpperChaos.Q0GaussAddress.Panel}
    {pl : Plan} {mass : Ival} (h : checkedMass g p pl = some mass) :
    1 < (pl.geometry.rho : ℝ) ∧
      ∀ w : ℂ, (pl.geometry.rho : ℝ)⁻¹ ≤ ‖w‖ → ‖w‖ ≤ (pl.geometry.rho : ℝ) →
        QuadRem.vC (Remainder.ellipsePt p.lo p.hi w) ≠ 0 := by
  obtain ⟨hc, hgeo, _, cs, _, _, _, hdisks⟩ := checkedMass_spec h
  obtain ⟨hrho, _, hR, _, _, _, _⟩ := EllCheck.planGeomOK_spec hgeo
  have hR' : (0 : ℝ) ≤ pl.geometry.R := by exact_mod_cast hR
  refine ⟨by exact_mod_cast hrho, ?_⟩
  apply vC_ne_zero_of_planGeomOK hgeo
  intro i hi
  obtain ⟨d, hd, _⟩ := hdisks i hi
  obtain ⟨at0, e, a2hi, conditional, primary, radial, hprof, _, _, _, _, _⟩ :=
    diskM2_spec hd
  obtain ⟨T, Dv, _, _, _, _, _, hsgn⟩ := EllCheck.diskProfile_sound hc hR' hprof
  exact hsgn

/-- Every accepted certificate carries the profile geometry required by radial descent. -/
theorem certificateOK_geometry {g : Power} {p : Grothe.UpperChaos.Q0GaussAddress.Panel}
    {c : Certificate} (h : certificateOK g p c = true) :
    1 < (c.plan.geometry.rho : ℝ) ∧
      ∀ w : ℂ, (c.plan.geometry.rho : ℝ)⁻¹ ≤ ‖w‖ →
        ‖w‖ ≤ (c.plan.geometry.rho : ℝ) →
          QuadRem.vC (Remainder.ellipsePt p.lo p.hi w) ≠ 0 := by
  obtain ⟨_, mass, err, hm, _, _, _⟩ := certificateOK_spec h
  exact checkedMass_geometry hm

/-- Acceptance bounds the exact real Gauss expression by the stored rational error cap. -/
theorem certificateOK_error {g : Power} {p : Grothe.UpperChaos.Q0GaussAddress.Panel}
    {c : Certificate} (h : certificateOK g p c = true) :
    0 ≤ (c.massCap : ℝ) ∧ cappedGaussError p c ≤ (c.errorCap : ℝ) := by
  obtain ⟨_, mass, err, _, he, _, herr⟩ := certificateOK_spec h
  obtain ⟨hmass, _, hmem⟩ := cappedError_sound he
  refine ⟨by exact_mod_cast hmass, (le_upperQ_of_mem hmem).trans ?_⟩
  exact_mod_cast herr

/-- The exact capped Gauss expressions sum below an accepted total at the same array. -/
theorem sum_cappedGaussError_le {g : Power} {cs : Array Certificate} {budget : ℚ}
    (hcert : ∀ p : Fin sourcePanels.length,
      certificateOK g (sourcePanels.get p) (cs[p.val]!) = true)
    (htotal : totalOK cs budget = true) :
    (∑ p : Fin sourcePanels.length,
      cappedGaussError (sourcePanels.get p) (cs[p.val]!)) ≤ (budget : ℝ) := by
  exact (Finset.sum_le_sum fun p _ ↦ (certificateOK_error (hcert p)).2).trans
    (sum_errorCap_le_of_totalOK htotal)

/-- Once accepted mass caps bound the actual descended vector, the complete certificate
array gives the actual covered-set remainder. All geometry and error arithmetic are internal. -/
theorem remainder_of_certificates_of_mass_bounds (g : Power) (cs : Array Certificate)
    (hcert : ∀ p : Fin sourcePanels.length,
      certificateOK g (sourcePanels.get p) (cs[p.val]!) = true)
    {budget : ℚ} (htotal : totalOK cs budget = true)
    (hmass : ∀ p : Fin sourcePanels.length, ∀ w : ℂ,
      ‖w‖ = ((cs[p.val]!).plan.geometry.rho : ℝ) →
        ‖TwistRadialExt.descendedVector (powerNat g) (TwistRadialExt.panelSign p)
          (Remainder.ellipsePt (sourcePanels.get p).lo (sourcePanels.get p).hi w)‖ ^ 2 ≤
            ((cs[p.val]!).massCap : ℝ)) :
    TwistRemainderHyp (powerNat g) (budget : ℝ) := by
  have hj : powerNat g = 1 ∨ powerNat g = 2 ∨ powerNat g = 3 := by
    unfold powerNat
    have := g.isLt
    omega
  apply TwistRadialExt.remainder_of_descended_ellipses (powerNat g) hj
    (fun p ↦ ((cs[p.val]!).plan.geometry.rho : ℝ))
    (fun p ↦ Real.sqrt ((cs[p.val]!).massCap : ℝ))
    (fun p ↦ (certificateOK_geometry (hcert p)).1)
    (fun p ↦ (certificateOK_geometry (hcert p)).2)
    (fun p w hw ↦ Real.le_sqrt_of_sq_le (hmass p w hw))
  calc
    _ = ∑ p : Fin sourcePanels.length,
        cappedGaussError (sourcePanels.get p) (cs[p.val]!) := by
      refine Finset.sum_congr rfl fun p _ => ?_
      unfold cappedGaussError
      ring
    _ ≤ (budget : ℝ) := sum_cappedGaussError_le hcert htotal

/-- Accepted covering shards and their total leave only the actual mass-cap interpretation. -/
theorem remainder_of_shards_of_mass_bounds (g : Power) (cs : Array Certificate)
    (shards : Finset (ℕ × ℕ))
    (hshards : ∀ r ∈ shards, shardOK g r.1 r.2 cs = true)
    (hcover : ∀ k, k < sourcePanels.length → ∃ r ∈ shards, r.1 ≤ k ∧ k < r.2)
    {budget : ℚ} (htotal : totalOK cs budget = true)
    (hmass : ∀ p : Fin sourcePanels.length, ∀ w : ℂ,
      ‖w‖ = ((cs[p.val]!).plan.geometry.rho : ℝ) →
        ‖TwistRadialExt.descendedVector (powerNat g) (TwistRadialExt.panelSign p)
          (Remainder.ellipsePt (sourcePanels.get p).lo (sourcePanels.get p).hi w)‖ ^ 2 ≤
            ((cs[p.val]!).massCap : ℝ)) :
    TwistRemainderHyp (powerNat g) (budget : ℝ) :=
  remainder_of_certificates_of_mass_bounds g cs
    (certificates_of_shards g cs shards hshards hcover) htotal hmass

end

end Grothe.UpperQuad.TwistEllCheck
