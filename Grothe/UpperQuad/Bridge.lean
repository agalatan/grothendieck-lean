import Grothe.UpperQuad.NodeSound
import Grothe.UpperQuad.RotateSound
import Grothe.UpperChaos.ProductionRetainedEnergy
import Grothe.UpperChaos.ProductionF0Head
import Grothe.UpperChaos.TaylorFrozenCoefficients

/-!
# The bridge from the kernel's checks to `hclose` (layer (D) of `docs/QUAD_CHECKER.md` §11.1)

`hclose_of_checks` discharges the energy-table hypothesis of `fresh_upper_concrete_taylor` through
master's reduction `selected_energy_close_of_raw_error`, for the rational family `a0` read off the
kernel's grade matrices (`a0 = b0 − frozen`, `b0` = the lower ends of the entries, so that
`retainedProductionCoeff a0 = b0`):

* `htable` is `energyOK_sound` (the ℓ¹ excursion of the computed head energies from `energyTable`);
* `hraw` is master's Parseval identity `norm_productionF0Head_sub_sq` with, per coefficient,
  `|base − a0| ≤ |base − G| + |G − a0|`: the exact Gauss–Legendre sums `G` of the nodes are enclosed
  by the accumulator (the node layer, `accumulateSpecs_zero_sound`), `|G − a0|` is bounded by the
  widths of the grade matrices (`gradeWidthSq_sound`, the check `rawDistOK`), and
  `Σ |base − G|² ≤ ρ²` is the analytic hypothesis `hQuad` (the Gauss–Legendre remainder, the
  integrand bound and the omitted pairs of the cutoffs: obligations S6b, S6c and the cutoffs of §6).

The seed enclosure `J₀(A²) ∈ seedJ0I` at every node (S2) is the other analytic hypothesis.  The
list of node specs and its roots are parameters: the data binding of the partition to
`sourcePanels`/`Q0LegendreRuleNN.brackets` is done where the native fact is stated.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad

open MeasureTheory GrotheQuad Grothe.UpperChaos Grothe.UpperChaos.FixedChaosSmoothing
  Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries Grothe.Upper
  Grothe.UpperChaos.F0ConditionalEvaluator
open scoped InnerProductSpace

/-! ### The frozen correction and the energy table as fixed intervals -/

/-- The rational frozen term of `retainedProductionCoeff`. -/
def frozenQ (q c d : ℕ) : ℚ := if q < 91 then frozenCorrectionCoeff q c d else 0

/-- `frozenCorrectionCoeff q c d = frozenCorrectionAt q c d / 2^206` as a fixed interval at scale
`2^128` (`2^{−206} = 2^{−128} · 2^{−78}`), zero from grade 91 on. -/
def frozenFx (q c d : ℕ) : Fx :=
  if q < 91 then ⟨shDown 78 (frozenCorrectionAt q c d), shUp 78 (frozenCorrectionAt q c d)⟩
  else ⟨0, 0⟩

lemma two_pow_KFix : (2 : ℝ) ^ KFix = 2 ^ 128 := by unfold KFix; norm_num

lemma memFx_frozenFx (q c d : ℕ) : memFx ((frozenQ q c d : ℚ) : ℝ) (frozenFx q c d) := by
  unfold frozenQ frozenFx
  split_ifs with h
  · unfold memFx frozenCorrectionCoeff
    simp only
    push_cast
    have hz : (frozenCorrectionAt q c d : ℝ) / 2 ^ 206 * 2 ^ KFix =
        (frozenCorrectionAt q c d : ℝ) / 2 ^ 78 := by
      rw [two_pow_KFix]
      field_simp
    rw [hz]
    constructor
    · rw [le_div_iff₀ (by positivity)]; exact shDown_mul_le 78 _
    · rw [div_le_iff₀ (by positivity)]; exact le_shUp_mul 78 _
  · simp [memFx]

/-- The energy table at scale `2^256`: the floor and the ceiling of `energyTable (n, m) · 2^256`. -/
def tableFx (n m : ℕ) : ℤ × ℤ :=
  (⌊energyTable (n, m) * (2 : ℚ) ^ (2 * KFix)⌋, ⌈energyTable (n, m) * (2 : ℚ) ^ (2 * KFix)⌉)

lemma memFx2_tableFx (n m : ℕ) : memFx2 ((energyTable (n, m) : ℚ) : ℝ) (tableFx n m) := by
  unfold memFx2 tableFx
  simp only
  have h1 := Int.floor_le (energyTable (n, m) * (2 : ℚ) ^ (2 * KFix))
  have h2 := Int.le_ceil (energyTable (n, m) * (2 : ℚ) ^ (2 * KFix))
  constructor
  · have : ((⌊energyTable (n, m) * (2 : ℚ) ^ (2 * KFix)⌋ : ℤ) : ℝ) ≤
        ((energyTable (n, m) * (2 : ℚ) ^ (2 * KFix) : ℚ) : ℝ) := by exact_mod_cast h1
    push_cast at this
    exact this
  · have : ((energyTable (n, m) * (2 : ℚ) ^ (2 * KFix) : ℚ) : ℝ) ≤
        ((⌈energyTable (n, m) * (2 : ℚ) ^ (2 * KFix)⌉ : ℤ) : ℝ) := by exact_mod_cast h2
    push_cast at this
    exact this

/-! ### The rational family read off the grade matrices -/

/-- The lower ends of the grade-matrix entries (a rational family). -/
def b0Of (raw : Raw) (q c d : ℕ) : ℚ := loQ (getFx (gradeMatrix raw frozenFx q) c d)

/-- The F0 approximation `a0 = b0 − frozen`, so that `retainedProductionCoeff a0 = b0`. -/
def a0Of (raw : Raw) (q c d : ℕ) : ℚ := b0Of raw q c d - frozenQ q c d

lemma retainedProductionCoeff_a0Of (raw : Raw) :
    retainedProductionCoeff (a0Of raw) = b0Of raw := by
  funext q c d
  unfold retainedProductionCoeff a0Of frozenQ
  ring

/-! ### The exact Gauss sums -/

/-- The exact Gauss–Legendre partial sums of the raw coefficients over the nodes of the list. -/
noncomputable def gaussRaw (specs : List NodeSpec) (x : NodeSpec → ℝ) (k j cIdx : ℕ) : ℝ :=
  (specs.map fun nd => specTerm nd (x nd) k j cIdx).sum

/-- The exact Gauss sums of the graded coefficients `(q, c, d)` (reflected for `c > d + 1`). -/
noncomputable def gaussCoeff (specs : List NodeSpec) (x : NodeSpec → ℝ) (q c d : ℕ) : ℝ :=
  gradeValue (gaussRaw specs x) (fun _ _ _ => 0) q c d

/-- The grade matrices enclose `G + frozen`. -/
lemma memFx_gaussCoeff_add_frozen (specs : List NodeSpec) (x : NodeSpec → ℝ) {raw : Raw}
    (hR : ∀ k j cIdx, k < numCharges → j < blockSide k → cIdx < activeCols k j →
      memFx2 (gaussRaw specs x k j cIdx) (rawGet raw k j cIdx))
    (q c d : ℕ) (hq : q ≤ 250) (hc : c < q + 2) (hd : d < q + 1) :
    memFx (gaussCoeff specs x q c d + ((frozenQ q c d : ℚ) : ℝ))
      (getFx (gradeMatrix raw frozenFx q) c d) := by
  have h := memFx_gradeMatrix (v := fun q c d => ((frozenQ q c d : ℚ) : ℝ)) hR
    (fun q c d => memFx_frozenFx q c d) q hq c d hc hd
  unfold gaussCoeff gradeValue at *
  simpa only [add_zero] using h

/-- `hraw` from the node layer, the width check and the analytic quadrature hypothesis. -/
theorem hraw_of_checks (specs : List NodeSpec) (x : NodeSpec → ℝ) {raw : Raw}
    (hR : ∀ k j cIdx, k < numCharges → j < blockSide k → cIdx < activeCols k j →
      memFx2 (gaussRaw specs x k j cIdx) (rawGet raw k j cIdx))
    {ρ : ℝ} (hQuad : ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2),
      ∑ d ∈ Finset.range (q + 1),
        ‖baseGradedCoefficient q c d - ((gaussCoeff specs x q c d : ℝ) : ℂ)‖ ^ 2 ≤ ρ ^ 2)
    {bound : ℤ} (hW : rawDistOK raw frozenFx bound = true) {δ : ℝ} (hδ0 : 0 ≤ δ)
    (hδ : 2 * ρ ^ 2 + 2 * ((bound : ℝ) / 2 ^ (2 * KFix)) ≤ δ ^ 2) :
    ‖productionF0Head - gradedHermite 251 (a0Of raw)‖ ≤ δ := by
  have hG := memFx_gaussCoeff_add_frozen specs x hR
  have hwidth := gradeWidthSq_sound (Y := fun q c d => gaussCoeff specs x q c d +
    ((frozenQ q c d : ℚ) : ℝ)) hG
  unfold rawDistOK at hW
  simp only [decide_eq_true_eq] at hW
  have hW' : (gradeWidthSq raw frozenFx : ℝ) ≤ bound := by exact_mod_cast hW
  have hy : (0 : ℝ) < 2 ^ (2 * KFix) := pow_pos two_pos _
  have hsumW : ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      (gaussCoeff specs x q c d + ((frozenQ q c d : ℚ) : ℝ) -
        ((loQ (getFx (gradeMatrix raw frozenFx q) c d) : ℚ) : ℝ)) ^ 2 ≤
      (bound : ℝ) / 2 ^ (2 * KFix) := by
    rw [le_div_iff₀ hy]
    exact hwidth.trans hW'
  rw [← sq_le_sq₀ (norm_nonneg _) hδ0, norm_productionF0Head_sub_sq]
  have hterm : ∀ q c d, ‖baseGradedCoefficient q c d - (a0Of raw q c d : ℂ)‖ ^ 2 ≤
      2 * ‖baseGradedCoefficient q c d - ((gaussCoeff specs x q c d : ℝ) : ℂ)‖ ^ 2 +
      2 * (gaussCoeff specs x q c d + ((frozenQ q c d : ℚ) : ℝ) -
        ((loQ (getFx (gradeMatrix raw frozenFx q) c d) : ℚ) : ℝ)) ^ 2 := by
    intro q c d
    set u := baseGradedCoefficient q c d - ((gaussCoeff specs x q c d : ℝ) : ℂ) with hu
    set w := gaussCoeff specs x q c d + ((frozenQ q c d : ℚ) : ℝ) -
      ((loQ (getFx (gradeMatrix raw frozenFx q) c d) : ℚ) : ℝ) with hw
    have hsplit : baseGradedCoefficient q c d - (a0Of raw q c d : ℂ) = u + (w : ℂ) := by
      rw [hu, hw]
      unfold a0Of b0Of
      push_cast
      ring
    rw [hsplit]
    have h1 : ‖u + (w : ℂ)‖ ≤ ‖u‖ + |w| := by
      have := norm_add_le u (w : ℂ)
      rwa [Complex.norm_real, Real.norm_eq_abs] at this
    calc ‖u + (w : ℂ)‖ ^ 2 = ‖u + (w : ℂ)‖ * ‖u + (w : ℂ)‖ := sq _
      _ ≤ (‖u‖ + |w|) * (‖u‖ + |w|) := mul_self_le_mul_self (norm_nonneg _) h1
      _ ≤ 2 * ‖u‖ ^ 2 + 2 * w ^ 2 := by
        have e1 : 0 ≤ (‖u‖ - |w|) ^ 2 := sq_nonneg _
        have e2 : (‖u‖ - |w|) ^ 2 = ‖u‖ ^ 2 - 2 * (‖u‖ * |w|) + |w| ^ 2 := by ring
        have e3 : (‖u‖ + |w|) * (‖u‖ + |w|) = ‖u‖ ^ 2 + 2 * (‖u‖ * |w|) + |w| ^ 2 := by ring
        have e4 : |w| ^ 2 = w ^ 2 := sq_abs w
        linarith
  calc ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
        ‖baseGradedCoefficient q c d - (a0Of raw q c d : ℂ)‖ ^ 2
      ≤ ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
        (2 * ‖baseGradedCoefficient q c d - ((gaussCoeff specs x q c d : ℝ) : ℂ)‖ ^ 2 +
          2 * (gaussCoeff specs x q c d + ((frozenQ q c d : ℚ) : ℝ) -
            ((loQ (getFx (gradeMatrix raw frozenFx q) c d) : ℚ) : ℝ)) ^ 2) := by
        exact Finset.sum_le_sum fun q _ => Finset.sum_le_sum fun c _ =>
          Finset.sum_le_sum fun d _ => hterm q c d
    _ = 2 * (∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
          ‖baseGradedCoefficient q c d - ((gaussCoeff specs x q c d : ℝ) : ℂ)‖ ^ 2) +
        2 * (∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
          (gaussCoeff specs x q c d + ((frozenQ q c d : ℚ) : ℝ) -
            ((loQ (getFx (gradeMatrix raw frozenFx q) c d) : ℚ) : ℝ)) ^ 2) := by
        simp only [Finset.sum_add_distrib, Finset.mul_sum]
    _ ≤ 2 * ρ ^ 2 + 2 * ((bound : ℝ) / 2 ^ (2 * KFix)) := by gcongr
    _ ≤ δ ^ 2 := hδ

/-! ### The top theorem -/

/-- **`hclose` from the checker.**  For a list of node specs with a root in each bracket whose
accumulated raw vector `raw` passes the energy check and the width check, and under the analytic
hypotheses (the seed enclosure at every node and the quadrature hypothesis `hQuad`), the energy
table is within `energyErrQ` of the energies of the smoothed response `X`: the hypothesis
`hclose` of `fresh_upper_concrete_taylor`. -/
theorem hclose_of_checks (P : ℕ) (hP : 1 ≤ P) {piI : Ival} (hpi : mem Real.pi piI)
    {pd : ProfileData} (hpd : profileAgrees pd) (hpv : profileValid P piI pd = true)
    (specs : List NodeSpec) (x : NodeSpec → ℝ) (hx : ∀ nd ∈ specs, mem (x nd) nd.bracket.toIval)
    (hJ : ∀ nd ∈ specs, ∀ neg aI, nodeShift P piI pd nd = some (neg, aI) →
      mem (OriginalPositiveMoment.moment 0 (profileShift (specNode nd (x nd)) ^ 2))
        (seedJ0I P piI (sqI P aI)))
    {raw : Raw} (hacc : accumulateSpecs P piI pd specs rawZero = some raw)
    {ρ : ℝ} (hQuad : ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2),
      ∑ d ∈ Finset.range (q + 1),
        ‖baseGradedCoefficient q c d - ((gaussCoeff specs x q c d : ℝ) : ℂ)‖ ^ 2 ≤ ρ ^ 2)
    {epsNum bound : ℤ} (hE : energyOK raw frozenFx tableFx epsNum = true)
    (hW : rawDistOK raw frozenFx bound = true)
    {δ Δ : ℝ} (hδ0 : 0 ≤ δ) (hδ : 2 * ρ ^ 2 + 2 * ((bound : ℝ) / 2 ^ (2 * KFix)) ≤ δ ^ 2)
    (hsmoothing : δ + (4 / 10 ^ 15 : ℝ) * ((501 / 500 : ℝ) + δ) ≤ Δ)
    (hbudget : (2 * (501 / 500 : ℝ) + 3 * Δ) * Δ + (epsNum : ℝ) / 2 ^ (2 * KFix) ≤
      (energyErrQ : ℝ)) :
    ∑ p ∈ headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp (Xfun frozenCorrectionFn)) p -
        (energyTable p : ℝ)| ≤ (energyErrQ : ℝ) := by
  have hR : ∀ k j cIdx, k < numCharges → j < blockSide k → cIdx < activeCols k j →
      memFx2 (gaussRaw specs x k j cIdx) (rawGet raw k j cIdx) := by
    intro k j cIdx hk hj hc
    have hc' : cIdx < blockSide k := by unfold activeCols at hc; omega
    exact accumulateSpecs_zero_sound P hP hpi hpd hpv specs x hx hJ raw hacc k j cIdx hk hj hc'
  have hraw := hraw_of_checks specs x hR hQuad hW hδ0 hδ
  have hA : ∀ q c d, q ≤ 250 → c < q + 2 → d < q + 1 →
      memFx ((b0Of raw q c d : ℚ) : ℝ) (getFx (gradeMatrix raw frozenFx q) c d) :=
    fun q c d hq hc hd => memFx_loQ (memFx_gaussCoeff_add_frozen specs x hR q c d hq hc hd)
  have htable := energyOK_sound (b0Of raw) (tab := fun p => ((energyTable p : ℚ) : ℝ)) hA
    (fun n m _ => memFx2_tableFx n m) hE
  have htable' : ∑ p ∈ headIdx 501,
      |energy (retainedSmoothed (a0Of raw)) p - (energyTable p : ℝ)| ≤
        (epsNum : ℝ) / 2 ^ (2 * KFix) := by
    unfold retainedSmoothed
    rw [retainedProductionCoeff_a0Of, le_div_iff₀ (by positivity)]
    exact htable
  exact selected_energy_close_of_raw_error (a0Of raw) hraw htable' hsmoothing hbudget

end Grothe.UpperQuad
