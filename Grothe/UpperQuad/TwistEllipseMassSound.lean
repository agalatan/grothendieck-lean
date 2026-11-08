import Grothe.UpperQuad.TwistCertificateRemainder
import Grothe.UpperQuad.TwistEllipseYVectorSound
import Grothe.UpperQuad.TwistKEnvelope
import Grothe.UpperQuad.TwistEllipseSignedGeometry
import Grothe.UpperQuad.TwistEllipseChoiceSound

/-!
# Accepted disks in every mode bound the actual twisted vector

`diskM2` evaluates, on one real-centred disk, the radial factor, the primary Mehler factor and a
conditional factor chosen by the plan's mode: the Y envelope, the coarse K envelope, or the smaller
of the two (`auto`). The actual descended vector at a disk point `z = r²` is bounded by the radial
and primary factors times the coefficient energy `coefEnergy g r` of the Gaussian-shift
continuation (`norm_descendedVector_sq_le_coefEnergy`); each successful branch bounds that energy
(`coefEnergy_le_upsYSq`, `coefEnergy_le_coarseKSq`), so every accepted disk bounds the actual
squared norm by its upper endpoint, whatever the mode (`norm_descendedVector_sq_le_diskM2`).

The covering disks of an accepted plan contain the whole closed Bernstein ellipse, so an accepted
certificate bounds the actual squared norm on the ellipse by its mass cap
(`norm_descendedVector_sq_le_massCap`). This discharges the mass hypothesis of
`remainder_of_shards_of_mass_bounds`: accepted covering shards and an accepted total prove the
actual covered-set remainder `TwistRemainderHyp` (`remainder_of_shards`).

Agent-ID: claude-b9ee. Refs #334, #343.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.TwistEllCheck

open GrotheQuad QuadRem TaylorShift PolynomialHermite

noncomputable section

/-- The coefficient energy of the Gaussian-shift continuation at a square root `r`. -/
def coefEnergy (g : Power) (r : ℂ) : ℝ :=
  ∑ cd ∈ indices (degree g),
    ‖GaussianShift.coefficient (powerNat g) r (TwistRadialExt.shift r).re
      (TwistRadialExt.shift r).im cd‖ ^ 2

theorem coefEnergy_nonneg (g : Power) (r : ℂ) : 0 ≤ coefEnergy g r :=
  Finset.sum_nonneg fun _ _ ↦ sq_nonneg _

/-- The checker's Y expression bounds the coefficient energy. -/
theorem coefEnergy_le_upsYSq (g : Power) {eta : ℝ} (heta0 : 0 < eta) (heta1 : eta < 1)
    (r : ℂ) {Y B2 : ℝ} (hY : r.im ^ 2 ≤ Y) (hB2 : (TwistRadialExt.shift r).im ^ 2 ≤ B2) :
    coefEnergy g r ≤ upsYSq g eta Y B2 := by
  have h1 := GaussianShift.sum_coefficient_sq_le (powerNat g)
    (TwistKEnvelope.powerNat_pos g) heta0 heta1 r (TwistRadialExt.shift r).re
    (TwistRadialExt.shift r).im (degree g) (indices (degree g))
    (fun cd hcd ↦ mem_indices.mp hcd)
  have h2 := GaussianShift.translation_phase_le_coefficientBoundSq (powerNat g) (degree g)
    heta0 heta1 r (TwistRadialExt.shift r).im hY hB2
  have h3 : GaussianShift.coefficientBoundSq (powerNat g) (degree g) eta Y B2 =
      upsYSq g eta Y B2 := by
    unfold GaussianShift.coefficientBoundSq upsYSq
    rw [TwistKEnvelope.phaseSq_eq_phaseBoundSq]
  exact h1.trans (h2.trans h3.le)

/-- The checker's coarse K expression bounds the coefficient energy. -/
theorem coefEnergy_le_coarseKSq (g : Power) {eta : ℝ} (heta0 : 0 < eta) (heta1 : eta < 1)
    (r : ℂ) {Y Theta Alo : ℝ} (hY : r.im ^ 2 ≤ Y)
    (hA : 0 < ((TwistRadialExt.shift r) ^ 2).re)
    (hTheta : ‖TwistRadialExt.shift r‖ ^ 2 / ((TwistRadialExt.shift r) ^ 2).re ≤ Theta)
    (hAlo0 : 0 < Alo) (hAlo : Alo ≤ ‖TwistRadialExt.shift r‖ ^ 2) :
    coefEnergy g r ≤ coarseKSq g eta Y Theta Alo :=
  TwistKEnvelope.sum_coefficient_sq_le_coarseKSq g heta0 heta1 r (TwistRadialExt.shift r)
    hY hA hTheta hAlo0 hAlo

/-- The primary envelope of the radial reduction is the checker's primary expression times
the radial exponential. -/
theorem primaryBoundSq_eq_checker (g : Power) (t L X Y : ℝ) :
    TwistRadialExt.primaryBoundSq (degree g) t L X Y =
      Real.exp (-2 * L) * primarySq g t X Y := by
  unfold TwistRadialExt.primaryBoundSq primarySq
  simp only [inv_pow, div_eq_mul_inv]
  ring

/-- The actual vector is bounded by the radial and primary factors times the coefficient energy. -/
theorem norm_descendedVector_sq_le_coefEnergy (g : Power) (σ : ℝ) (hσ : |σ| = 1)
    {z r : ℂ} (hr : r ^ 2 = z) {t : ℝ} (ht0 : 0 < t) (ht1 : t < 1) {L X Y : ℝ}
    (hL : L ≤ z.re) (hX : r.re ^ 2 ≤ X) (hY : r.im ^ 2 ≤ Y) :
    ‖TwistRadialExt.descendedVector (powerNat g) σ z‖ ^ 2 ≤
      Real.exp (-2 * L) * primarySq g t X Y * coefEnergy g r := by
  have h := TwistRadialExt.norm_descendedVector_sq_le_of_sq (powerNat g) σ hσ hr t ht0 ht1
  have hp := TwistRadialExt.radial_primary_le_primaryBoundSq (degree g) ht0 ht1 z r hL hX hY
  rw [primaryBoundSq_eq_checker] at hp
  exact h.trans (mul_le_mul_of_nonneg_right hp (coefEnergy_nonneg g r))

/-- **An accepted disk, in any mode, bounds the actual squared vector norm on the whole disk** by
its upper endpoint, for either panel sign. -/
theorem norm_descendedVector_sq_le_diskM2 (hc : EllCheck.chatOK = true) {g : Power}
    {coeffs : List Ival} (hcs : columnCoeffs g = some coeffs) {pos : Bool} {x : ℚ} {pl : Plan}
    (hR : 0 ≤ (pl.geometry.R : ℝ)) {u : Ival} (h : diskM2 g coeffs pos x pl = some u)
    (σ : ℝ) (hσ : |σ| = 1) {z : ℂ} (hz : ‖z - (x : ℂ)‖ ≤ pl.geometry.R) :
    ‖TwistRadialExt.descendedVector (powerNat g) σ z‖ ^ 2 ≤ (upperQ u : ℝ) := by
  obtain ⟨at0, e, a2hi, cond, primary, radial, hprof, ha2, hu, hm, her, hmass⟩ :=
    diskM2_spec h
  obtain ⟨r, hr⟩ := IsAlgClosed.exists_pow_nat_eq z (by norm_num : 0 < 2)
  obtain ⟨T, Dv, hf⟩ := EllCheck.ProfileFacts.mk' hc hR hprof
  have hd : DiskPoint (EllCheck.sgn pos) x pl.geometry.R z r :=
    ⟨hR, hz, hr, EllCheck.sgn_cases pos, hf.hsgn⟩
  obtain ⟨hX, hY⟩ := diskPoint_root_sq_bounds hd
  -- the selected conditional factor bounds the coefficient energy
  have hcond : ∃ w, mem w cond ∧ coefEnergy g r ≤ w := by
    rcases upsI_success_cases hu with
      ⟨b2, uy, hb2, hy, hsel⟩ | ⟨kp, a2lo, uk, hkp, ha2lo, hk, hsel⟩
    · obtain ⟨-, B2, hBm, -, hgeom⟩ := diskProfile_shift_geometry hc hR hprof ha2 hb2
      obtain ⟨heta0, heta1, U, hUm, hU⟩ := upsYI_sound (EllCheck.mem_qI _) hBm hy
      obtain ⟨-, -, hB⟩ := hgeom z r hz hr
      have hBshift : (TwistRadialExt.shift r).im ^ 2 ≤ B2 := by
        rw [TwistRadialExt.shift_im_sq_eq _ (EllCheck.sgn_cases pos) r, hr]
        exact hB
      have hE := (coefEnergy_le_upsYSq g heta0 heta1 r hY hBshift).trans hU
      rcases hsel with rfl | rfl
      · exact ⟨U, hUm, hE⟩
      · exact ⟨_, mem_upperI uy, hE.trans (le_upperQ_of_mem hUm)⟩
    · obtain ⟨-, KP, Alo, hKm, hAm, -, -, hgeom⟩ :=
        diskProfile_signed_k_geometry hc hR hprof hkp ha2lo
      obtain ⟨-, hAlo0, heta0, heta1, V, hVm, hV⟩ :=
        upsKI_sound hcs (EllCheck.mem_qI _) hKm hAm hk
      obtain ⟨-, -, hAlo, hApos, hTheta⟩ := hgeom z r hz hr
      have hE := (coefEnergy_le_coarseKSq g heta0 heta1 r hY hApos hTheta hAlo0 hAlo).trans hV
      rcases hsel with rfl | rfl
      · exact ⟨V, hVm, hE⟩
      · exact ⟨_, mem_upperI uk, hE.trans (le_upperQ_of_mem hVm)⟩
  obtain ⟨w, hwm, hw⟩ := hcond
  obtain ⟨ht0, ht1, M, hMm, hM⟩ := mehI_sound hm
  obtain ⟨E, hEm, hE⟩ := EllCheck.expUp_sound (EllCheck.mem_qI _) her
  have hcast : (((-2 * (x - pl.geometry.R) : ℚ) : ℝ)) =
      -2 * ((x : ℝ) - (pl.geometry.R : ℝ)) := by
    push_cast
    ring
  rw [hcast] at hE
  have hv := norm_descendedVector_sq_le_coefEnergy g σ hσ hr ht0 ht1 hd.re_ge hX hY
  have hprimary0 := primarySq_nonneg g ht0.le ht1.le
    (sqrtReSqQ x pl.geometry.R) (sqrtImSqQ x pl.geometry.R)
  have hmem : mem (E * (M * w)) u := by
    rw [← hmass]
    exact mem_mulI EllCheck.P hEm (mem_mulI EllCheck.P hMm hwm)
  refine hv.trans (le_trans ?_ (le_upperQ_of_mem hmem))
  have hc0 := coefEnergy_nonneg g r
  rw [mul_assoc]
  exact mul_le_mul hE (mul_le_mul hM hw hc0 (hprimary0.trans hM))
    (mul_nonneg hprimary0 hc0) ((Real.exp_pos _).le.trans hE)

/-- **An accepted certificate bounds the actual squared vector norm on its whole closed
Bernstein ellipse** by its mass cap. -/
theorem norm_descendedVector_sq_le_massCap {g : Power}
    {p : Grothe.UpperChaos.Q0GaussAddress.Panel} {c : Certificate}
    (h : certificateOK g p c = true) (σ : ℝ) (hσ : |σ| = 1) {w : ℂ}
    (h1 : (c.plan.geometry.rho : ℝ)⁻¹ ≤ ‖w‖) (h2 : ‖w‖ ≤ (c.plan.geometry.rho : ℝ)) :
    ‖TwistRadialExt.descendedVector (powerNat g) σ (Remainder.ellipsePt p.lo p.hi w)‖ ^ 2 ≤
      (c.massCap : ℝ) := by
  obtain ⟨-, mass, err, hm, -, hcap, -⟩ := certificateOK_spec h
  obtain ⟨hc, hgeo, -, cs, hcs, -, -, hdisks⟩ := checkedMass_spec hm
  obtain ⟨-, -, hR, -⟩ := EllCheck.planGeomOK_spec hgeo
  have hR' : (0 : ℝ) ≤ c.plan.geometry.R := by exact_mod_cast hR
  obtain ⟨i, hi, hdist⟩ := exists_disk_of_planGeomOK hgeo h1 h2
  obtain ⟨d, hd, hle⟩ := hdisks i hi
  have hz : ‖Remainder.ellipsePt p.lo p.hi w -
      ((EllCheck.diskCentre p.lo p.hi c.plan.geometry i : ℚ) : ℂ)‖ ≤ c.plan.geometry.R := by
    simpa only [Complex.ofReal_ratCast] using hdist
  have hb := norm_descendedVector_sq_le_diskM2 hc hcs hR' hd σ hσ hz
  have hle' : (upperQ d : ℝ) ≤ (upperQ mass : ℝ) := by exact_mod_cast hle
  have hcap' : (upperQ mass : ℝ) ≤ (c.massCap : ℝ) := by exact_mod_cast hcap
  exact hb.trans (hle'.trans hcap')

/-- **Accepted covering shards and an accepted total prove the actual covered-set remainder.** -/
theorem remainder_of_shards (g : Power) (cs : Array Certificate)
    (shards : Finset (ℕ × ℕ))
    (hshards : ∀ r ∈ shards, shardOK g r.1 r.2 cs = true)
    (hcover : ∀ k, k < Grothe.UpperChaos.Q0GaussAddressScan.sourcePanels.length →
      ∃ r ∈ shards, r.1 ≤ k ∧ k < r.2)
    {budget : ℚ} (htotal : totalOK cs budget = true) :
    TwistRemainderHyp (powerNat g) (budget : ℝ) := by
  have hcert := certificates_of_shards g cs shards hshards hcover
  apply remainder_of_certificates_of_mass_bounds g cs hcert htotal
  intro p w hw
  have hρ := (certificateOK_geometry (hcert p)).1
  exact norm_descendedVector_sq_le_massCap (hcert p) _
    (TwistRadialExt.abs_panelSign p)
    (by rw [hw]; exact (inv_lt_one_of_one_lt₀ hρ).le.trans hρ.le) hw.le

/-- The production shards: `[64i, min (64i + 64) 1289)` for `i < 21`. -/
def prodShards : Finset (ℕ × ℕ) :=
  (Finset.range 21).image fun i ↦ (64 * i, min (64 * i + 64) 1289)

/-- The production shards cover every source panel. -/
theorem prodShards_cover (k : ℕ)
    (hk : k < Grothe.UpperChaos.Q0GaussAddressScan.sourcePanels.length) :
    ∃ r ∈ prodShards, r.1 ≤ k ∧ k < r.2 := by
  have hN : Grothe.UpperChaos.Q0GaussAddressScan.sourcePanels.length = 1289 := by
    decide +kernel
  rw [hN] at hk
  refine ⟨(64 * (k / 64), min (64 * (k / 64) + 64) 1289),
    Finset.mem_image.mpr ⟨k / 64, Finset.mem_range.mpr (by omega), rfl⟩, ?_, ?_⟩
  · dsimp only
    omega
  · dsimp only
    omega

/-- The remainder from the production shard facts of one power, given as a function of the shard
index. -/
theorem remainder_of_prodShards (g : Power) (cs : Array Certificate)
    (hshards : ∀ i, i < 21 → shardOK g (64 * i) (min (64 * i + 64) 1289) cs = true)
    {budget : ℚ} (htotal : totalOK cs budget = true) :
    TwistRemainderHyp (powerNat g) (budget : ℝ) := by
  refine remainder_of_shards g cs prodShards ?_ prodShards_cover htotal
  intro r hr
  obtain ⟨i, hi, rfl⟩ := Finset.mem_image.mp hr
  exact hshards i (Finset.mem_range.mp hi)

end

end Grothe.UpperQuad.TwistEllCheck
