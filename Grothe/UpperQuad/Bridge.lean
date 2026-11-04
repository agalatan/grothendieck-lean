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

/-- The exact Gauss–Legendre partial sums of the raw coefficients over the nodes of the list (the
whole degree-501 triangle: grades `0 ≤ q < 251`). -/
noncomputable def gaussRaw (specs : List NodeSpec) (x : NodeSpec → ℝ) (k j cIdx : ℕ) : ℝ :=
  (specs.map fun nd => specTerm nd (x nd) 0 251 k j cIdx).sum

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
  have h := memFx_gradeMatrix (v := fun q c d => ((frozenQ q c d : ℚ) : ℝ)) (qLo := 0) (qHi := 251)
    (fun k j cIdx hk hj hc _ _ => hR k j cIdx hk hj hc) (fun q c d => memFx_frozenFx q c d) q hq
    (Nat.zero_le q) (by omega) c d hc hd
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
    {raw : Raw} (hacc : accumulateSpecs P piI pd 0 251 specs rawZero = some raw)
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
    exact accumulateSpecs_zero_sound P hP hpi hpd hpv 0 251 specs x hx hJ raw hacc k j cIdx hk hj hc'
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

/-! ### The head bidegrees by grade blocks -/

/-- The head bidegrees of the grade `q` (odd total degree `2q + 1`, `n + 3m ≤ 501`). -/
def gradeHead (q : ℕ) : Finset (ℕ × ℕ) :=
  (Finset.range (headCount q)).image fun m => (2 * q + 1 - m, m)

/-- The odd head bidegrees of the grades `[qLo, qHi)`. -/
def oddHead (qLo qHi : ℕ) : Finset (ℕ × ℕ) :=
  (headIdx 501).filter fun p =>
    (p.1 + p.2) % 2 = 1 ∧ qLo ≤ (p.1 + p.2 - 1) / 2 ∧ (p.1 + p.2 - 1) / 2 < qHi

lemma sum_gradeHead (q : ℕ) (f : ℕ × ℕ → ℝ) :
    ∑ p ∈ gradeHead q, f p = ∑ m ∈ Finset.range (headCount q), f (2 * q + 1 - m, m) := by
  unfold gradeHead
  rw [Finset.sum_image]
  intro m _ m' _ h
  simpa using congrArg Prod.snd h

lemma oddHead_succ (qLo qHi : ℕ) (hlo : qLo ≤ qHi) (hhi : qHi ≤ 250) :
    oddHead qLo (qHi + 1) = oddHead qLo qHi ∪ gradeHead qHi := by
  ext p
  simp only [oddHead, gradeHead, Finset.mem_union, Finset.mem_filter, Finset.mem_image,
    Finset.mem_range, mem_headIdx]
  unfold headCount
  constructor
  · intro h
    by_cases hq : (p.1 + p.2 - 1) / 2 < qHi
    · left; exact ⟨h.1, h.2.1, h.2.2.1, hq⟩
    · right
      refine ⟨p.2, by omega, ?_⟩
      exact Prod.ext (show 2 * qHi + 1 - p.2 = p.1 by omega) rfl
  · rintro (h | ⟨m, hm, rfl⟩)
    · exact ⟨h.1, h.2.1, h.2.2.1, by omega⟩
    · simp only
      omega

set_option linter.constructorNameAsVariable false in
lemma disjoint_oddHead_gradeHead (qLo qHi : ℕ) :
    Disjoint (oddHead qLo qHi) (gradeHead qHi) := by
  rw [Finset.disjoint_left]
  intro p hp hg
  simp only [oddHead, Finset.mem_filter, mem_headIdx] at hp
  simp only [gradeHead, Finset.mem_image, Finset.mem_range] at hg
  obtain ⟨m, hm, rfl⟩ := hg
  unfold headCount at hm
  simp only at hp
  omega

lemma oddHead_self (qLo : ℕ) : oddHead qLo qLo = ∅ := by
  ext p
  simp only [oddHead, Finset.mem_filter, Finset.notMem_empty, iff_false]
  omega

/-- The ℓ¹ sum over the odd head bidegrees of the grades `[qLo, qLo + n)` is the kernel's double sum. -/
lemma sum_oddHead (qLo : ℕ) (f : ℕ × ℕ → ℝ) :
    ∀ n, qLo + n ≤ 251 →
      ∑ p ∈ oddHead qLo (qLo + n), f p =
        ∑ i ∈ Finset.range n, ∑ m ∈ Finset.range (headCount (qLo + i)),
          f (2 * (qLo + i) + 1 - m, m) := by
  intro n
  induction n with
  | zero => intro _; simp [oddHead_self]
  | succ n ih =>
    intro hn
    rw [show qLo + (n + 1) = qLo + n + 1 by ring, oddHead_succ qLo (qLo + n) (by omega) (by omega),
      Finset.sum_union (disjoint_oddHead_gradeHead _ _), ih (by omega), Finset.sum_range_succ,
      sum_gradeHead]

lemma sum_oddHead' (qLo qHi : ℕ) (hle : qLo ≤ qHi) (hqHi : qHi ≤ 251) (f : ℕ × ℕ → ℝ) :
    ∑ p ∈ oddHead qLo qHi, f p =
      ∑ i ∈ Finset.range (qHi - qLo), ∑ m ∈ Finset.range (headCount (qLo + i)),
        f (2 * (qLo + i) + 1 - m, m) := by
  have := sum_oddHead qLo f (qHi - qLo) (by omega)
  rwa [Nat.add_sub_cancel' hle] at this

lemma oddHead_union (a b c : ℕ) (hab : a ≤ b) (hbc : b ≤ c) :
    oddHead a c = oddHead a b ∪ oddHead b c := by
  ext p
  simp only [oddHead, Finset.mem_union, Finset.mem_filter, mem_headIdx]
  omega

set_option linter.constructorNameAsVariable false in
lemma disjoint_oddHead (a b c : ℕ) : Disjoint (oddHead a b) (oddHead b c) := by
  rw [Finset.disjoint_left]
  intro p hp hp'
  simp only [oddHead, Finset.mem_filter] at hp hp'
  omega

/-- The odd head of `[bounds 0, bounds nb)` is the disjoint union of the consecutive blocks. -/
lemma sum_oddHead_blocks (f : ℕ × ℕ → ℝ) (bounds : ℕ → ℕ) (hmono : Monotone bounds) :
    ∀ nb, ∑ p ∈ oddHead (bounds 0) (bounds nb), f p =
      ∑ b ∈ Finset.range nb, ∑ p ∈ oddHead (bounds b) (bounds (b + 1)), f p := by
  intro nb
  induction nb with
  | zero => simp [oddHead_self]
  | succ nb ih =>
    rw [oddHead_union (bounds 0) (bounds nb) (bounds (nb + 1)) (hmono (Nat.zero_le nb))
      (hmono (Nat.le_succ nb)), Finset.sum_union (disjoint_oddHead _ _ _), ih,
      Finset.sum_range_succ]

/-- The head splits into the odd bidegrees of the grades `[0, 251)` and the even bidegrees. -/
lemma sum_headIdx_split (f : ℕ × ℕ → ℝ) :
    ∑ p ∈ headIdx 501, f p =
      ∑ p ∈ oddHead 0 251, f p +
        ∑ p ∈ (headIdx 501).filter (fun p => (p.1 + p.2) % 2 = 0), f p := by
  have hset : (headIdx 501).filter (fun p => ¬ (p.1 + p.2) % 2 = 0) = oddHead 0 251 := by
    ext p
    simp only [oddHead, Finset.mem_filter, mem_headIdx]
    omega
  rw [← Finset.sum_filter_add_sum_filter_not (headIdx 501) (fun p => (p.1 + p.2) % 2 = 0), add_comm,
    hset]

/-! ### The top theorem by grade blocks (the sharding of the native facts) -/

/-- Every triangle entry has a grade below `251`. -/
lemma entryGrade_lt (k j cIdx : ℕ) (hk : k < numCharges) (hact : cIdx < activeCols k j) :
    entryGrade k j cIdx < 251 := by
  unfold numCharges at hk
  unfold activeCols blockSide at hact
  unfold entryGrade dOff
  by_cases h0 : k = 0
  · subst h0
    simp only [beq_self_eq_true, ↓reduceIte] at hact ⊢
    omega
  · have hb : (k == 0) = false := by simpa using h0
    simp only [hb, Bool.false_eq_true, ↓reduceIte] at hact ⊢
    omega

/-- The exact Gauss term of a node at an entry of its block is the full-range term. -/
lemma specTerm_range (nd : NodeSpec) (x : ℝ) (qLo qHi k j cIdx : ℕ) (hk : k < numCharges)
    (hlo : qLo ≤ entryGrade k j cIdx) (hhi : entryGrade k j cIdx < qHi) :
    specTerm nd x qLo qHi k j cIdx = specTerm nd x 0 251 k j cIdx := by
  unfold specTerm nodeTerm
  by_cases hact : cIdx < activeCols k j
  · have h251 := entryGrade_lt k j cIdx hk hact
    simp only [hact, hlo, hhi, h251, Nat.zero_le, true_and]
  · simp only [hact, false_and, ↓reduceIte]

/-- The block accumulator encloses the full-range Gauss sums at the entries of its block. -/
lemma gaussRaw_of_block (P : ℕ) (hP : 1 ≤ P) {piI : Ival} (hpi : mem Real.pi piI)
    {pd : ProfileData} (hpd : profileAgrees pd) (hpv : profileValid P piI pd = true) (qLo qHi : ℕ)
    (specs : List NodeSpec) (x : NodeSpec → ℝ) (hx : ∀ nd ∈ specs, mem (x nd) nd.bracket.toIval)
    (hJ : ∀ nd ∈ specs, ∀ neg aI, nodeShift P piI pd nd = some (neg, aI) →
      mem (OriginalPositiveMoment.moment 0 (profileShift (specNode nd (x nd)) ^ 2))
        (seedJ0I P piI (sqI P aI)))
    {raw : Raw} (hacc : accumulateSpecs P piI pd qLo qHi specs rawZero = some raw) :
    ∀ k j cIdx, k < numCharges → j < blockSide k → cIdx < activeCols k j →
      qLo ≤ entryGrade k j cIdx → entryGrade k j cIdx < qHi →
      memFx2 (gaussRaw specs x k j cIdx) (rawGet raw k j cIdx) := by
  intro k j cIdx hk hj hc hlo hhi
  have hc' : cIdx < blockSide k := by unfold activeCols at hc; omega
  have h := accumulateSpecs_zero_sound P hP hpi hpd hpv qLo qHi specs x hx hJ raw hacc k j cIdx hk hj hc'
  unfold gaussRaw
  convert h using 2
  apply List.map_congr_left
  intro nd _
  exact (specTerm_range nd (x nd) qLo qHi k j cIdx hk hlo hhi).symm

/-- The lower ends of the grade matrices of the blocks (`blk q` = the block of the grade `q`). -/
def b0Blocks (R : ℕ → Raw) (blk : ℕ → ℕ) (q c d : ℕ) : ℚ :=
  loQ (getFx (gradeMatrix (R (blk q)) frozenFx q) c d)

/-- The F0 approximation `a0 = b0 − frozen` of the block family. -/
def a0Blocks (R : ℕ → Raw) (blk : ℕ → ℕ) (q c d : ℕ) : ℚ := b0Blocks R blk q c d - frozenQ q c d

lemma retainedProductionCoeff_a0Blocks (R : ℕ → Raw) (blk : ℕ → ℕ) :
    retainedProductionCoeff (a0Blocks R blk) = b0Blocks R blk := by
  funext q c d
  unfold retainedProductionCoeff a0Blocks frozenQ
  ring

/-- A sum over `range (bounds nb)` by consecutive blocks. -/
lemma sum_range_blocks (g : ℕ → ℝ) (bounds : ℕ → ℕ) (hmono : Monotone bounds) (h0 : bounds 0 = 0) :
    ∀ nb, ∑ q ∈ Finset.range (bounds nb), g q =
      ∑ b ∈ Finset.range nb, ∑ i ∈ Finset.range (bounds (b + 1) - bounds b), g (bounds b + i) := by
  intro nb
  induction nb with
  | zero => simp [h0]
  | succ nb ih =>
    rw [Finset.sum_range_succ, ← ih, ← Finset.sum_range_add_sum_Ico g (hmono (Nat.le_succ nb)),
      Finset.sum_Ico_eq_sum_range]

/-- **`hclose` from the block facts.**  The grades `[0, 251)` are cut at `bounds 0 = 0 < … <
bounds nb = 251`; each block `b` has its accumulator `R b` (the node loop restricted to the block),
its energy check (`eps b`) and its width check (`bnd b`); the even bidegrees have the check
`evenNum`.  Under the analytic hypotheses (the seed enclosure at every node and `hQuad`), the
energy table is within `energyErrQ` of the energies of the smoothed response `X`. -/
theorem hclose_of_blocks (P : ℕ) (hP : 1 ≤ P) {piI : Ival} (hpi : mem Real.pi piI)
    {pd : ProfileData} (hpd : profileAgrees pd) (hpv : profileValid P piI pd = true)
    (specs : List NodeSpec) (x : NodeSpec → ℝ) (hx : ∀ nd ∈ specs, mem (x nd) nd.bracket.toIval)
    (hJ : ∀ nd ∈ specs, ∀ neg aI, nodeShift P piI pd nd = some (neg, aI) →
      mem (OriginalPositiveMoment.moment 0 (profileShift (specNode nd (x nd)) ^ 2))
        (seedJ0I P piI (sqI P aI)))
    (nb : ℕ) (bounds : ℕ → ℕ) (hmono : Monotone bounds) (h0 : bounds 0 = 0) (hnb : bounds nb = 251)
    (blk : ℕ → ℕ) (hblk : ∀ q, q < 251 → blk q < nb ∧ bounds (blk q) ≤ q ∧ q < bounds (blk q + 1))
    (R : ℕ → Raw)
    (hacc : ∀ b, b < nb → accumulateSpecs P piI pd (bounds b) (bounds (b + 1)) specs rawZero = some (R b))
    {ρ : ℝ} (hQuad : ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2),
      ∑ d ∈ Finset.range (q + 1),
        ‖baseGradedCoefficient q c d - ((gaussCoeff specs x q c d : ℝ) : ℂ)‖ ^ 2 ≤ ρ ^ 2)
    (eps bnd : ℕ → ℤ)
    (hE : ∀ b, b < nb → energyOKBlock (R b) frozenFx tableFx (eps b) (bounds b) (bounds (b + 1)) = true)
    (hW : ∀ b, b < nb → rawDistOKBlock (R b) frozenFx (bnd b) (bounds b) (bounds (b + 1)) = true)
    {evenNum : ℤ} (hEven : evenExcursion tableFx ≤ evenNum)
    {δ Δ : ℝ} (hδ0 : 0 ≤ δ)
    (hδ : 2 * ρ ^ 2 + 2 * (((∑ b ∈ Finset.range nb, bnd b : ℤ) : ℝ) / 2 ^ (2 * KFix)) ≤ δ ^ 2)
    (hsmoothing : δ + (4 / 10 ^ 15 : ℝ) * ((501 / 500 : ℝ) + δ) ≤ Δ)
    (hbudget : (2 * (501 / 500 : ℝ) + 3 * Δ) * Δ +
      (((∑ b ∈ Finset.range nb, eps b + evenNum : ℤ) : ℝ)) / 2 ^ (2 * KFix) ≤ (energyErrQ : ℝ)) :
    ∑ p ∈ headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp (Xfun frozenCorrectionFn)) p -
        (energyTable p : ℝ)| ≤ (energyErrQ : ℝ) := by
  have hy : (0 : ℝ) < 2 ^ (2 * KFix) := pow_pos two_pos _
  -- the grade matrices of the block of `q` enclose `G + frozen` and hence the lower ends
  have hG : ∀ q c d, q < 251 → c < q + 2 → d < q + 1 →
      memFx (gaussCoeff specs x q c d + ((frozenQ q c d : ℚ) : ℝ))
        (getFx (gradeMatrix (R (blk q)) frozenFx q) c d) := by
    intro q c d hq hc hd
    obtain ⟨hb, hlo, hhi⟩ := hblk q hq
    have h := memFx_gradeMatrix (v := fun q c d => ((frozenQ q c d : ℚ) : ℝ))
      (qLo := bounds (blk q)) (qHi := bounds (blk q + 1))
      (gaussRaw_of_block P hP hpi hpd hpv _ _ specs x hx hJ (hacc (blk q) hb))
      (fun q c d => memFx_frozenFx q c d) q (by omega) hlo hhi c d hc hd
    unfold gaussCoeff gradeValue at *
    simpa only [add_zero] using h
  have hA : ∀ q c d, q < 251 → c < q + 2 → d < q + 1 →
      memFx ((b0Blocks R blk q c d : ℚ) : ℝ) (getFx (gradeMatrix (R (blk q)) frozenFx q) c d) :=
    fun q c d hq hc hd => memFx_loQ (hG q c d hq hc hd)
  have hblkEq : ∀ b q, b < nb → bounds b ≤ q → q < bounds (b + 1) → blk q = b := by
    intro b q hb hlo hhi
    have hq : q < 251 := by
      have := hmono (show b + 1 ≤ nb by omega)
      omega
    obtain ⟨hb', hlo', hhi'⟩ := hblk q hq
    by_contra hne
    rcases Nat.lt_or_gt_of_ne hne with h | h
    · have := hmono (show blk q + 1 ≤ b by omega); omega
    · have := hmono (show b + 1 ≤ blk q by omega); omega
  -- `htable` by blocks
  have htable : ∑ p ∈ headIdx 501,
      |energy (retainedSmoothed (a0Blocks R blk)) p - (energyTable p : ℝ)| ≤
        (((∑ b ∈ Finset.range nb, eps b + evenNum : ℤ) : ℝ)) / 2 ^ (2 * KFix) := by
    unfold retainedSmoothed
    rw [retainedProductionCoeff_a0Blocks, le_div_iff₀ hy]
    have hs := sum_oddHead_blocks (fun p =>
      |energy (gradedHermite 251 (productionSmoothedCoeff (b0Blocks R blk))) p - (energyTable p : ℝ)|)
      bounds hmono nb
    rw [h0, hnb] at hs
    rw [sum_headIdx_split, hs, add_mul, Finset.sum_mul]
    push_cast
    apply add_le_add
    · apply Finset.sum_le_sum
      intro b hb
      rw [Finset.mem_range] at hb
      have hle : bounds b ≤ bounds (b + 1) := hmono (Nat.le_succ b)
      have hbnd : bounds (b + 1) ≤ 251 := by rw [← hnb]; exact hmono (by omega)
      rw [sum_oddHead' (bounds b) (bounds (b + 1)) hle hbnd]
      exact energyOKBlock_sound (b0Blocks R blk) (raw := R b) (frozen := frozenFx)
        (tab := fun p => ((energyTable p : ℚ) : ℝ)) (bounds b) (bounds (b + 1)) hbnd
        (fun q c d hlo hhi hc hd => by
          have hq : q < 251 := by omega
          have := hA q c d hq hc hd
          rwa [hblkEq b q hb hlo hhi] at this)
        (fun n m _ => memFx2_tableFx n m) (hE b hb)
    · exact (evenExcursion_sound (productionSmoothedCoeff (b0Blocks R blk))
        (tab := fun p => ((energyTable p : ℚ) : ℝ)) (fun n m _ => memFx2_tableFx n m)).trans
        (by exact_mod_cast hEven)
  -- `hraw` by blocks
  have hraw : ‖productionF0Head - gradedHermite 251 (a0Blocks R blk)‖ ≤ δ := by
    have hsumW : ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
        (gaussCoeff specs x q c d + ((frozenQ q c d : ℚ) : ℝ) -
          ((b0Blocks R blk q c d : ℚ) : ℝ)) ^ 2 ≤
        ((∑ b ∈ Finset.range nb, bnd b : ℤ) : ℝ) / 2 ^ (2 * KFix) := by
      rw [le_div_iff₀ hy]
      have hs := sum_range_blocks (fun q => ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
        (gaussCoeff specs x q c d + ((frozenQ q c d : ℚ) : ℝ) -
          ((b0Blocks R blk q c d : ℚ) : ℝ)) ^ 2) bounds hmono h0 nb
      rw [hnb] at hs
      rw [hs, Finset.sum_mul]
      push_cast
      apply Finset.sum_le_sum
      intro b hb
      rw [Finset.mem_range] at hb
      have hbW := hW b hb
      unfold rawDistOKBlock at hbW
      simp only [decide_eq_true_eq] at hbW
      have hbW' : (gradeWidthSqBlock (R b) frozenFx (bounds b) (bounds (b + 1)) : ℝ) ≤ bnd b := by
        exact_mod_cast hbW
      refine le_trans ?_ hbW'
      have h := gradeWidthSqBlock_sound (raw := R b) (frozen := frozenFx)
        (Y := fun q c d => gaussCoeff specs x q c d + ((frozenQ q c d : ℚ) : ℝ)) (bounds b)
        (bounds (b + 1)) (fun q c d hlo hhi hc hd => by
          have hq : q < 251 := by
            have := hmono (show b + 1 ≤ nb by omega); omega
          have := hG q c d hq hc hd
          rwa [hblkEq b q hb hlo hhi] at this)
      have heq : ∑ i ∈ Finset.range (bounds (b + 1) - bounds b), ∑ c ∈ Finset.range (bounds b + i + 2),
          ∑ d ∈ Finset.range (bounds b + i + 1),
            (gaussCoeff specs x (bounds b + i) c d + ((frozenQ (bounds b + i) c d : ℚ) : ℝ) -
              ((b0Blocks R blk (bounds b + i) c d : ℚ) : ℝ)) ^ 2 =
          ∑ i ∈ Finset.range (bounds (b + 1) - bounds b), ∑ c ∈ Finset.range (bounds b + i + 2),
          ∑ d ∈ Finset.range (bounds b + i + 1),
            (gaussCoeff specs x (bounds b + i) c d + ((frozenQ (bounds b + i) c d : ℚ) : ℝ) -
              ((loQ (getFx (gradeMatrix (R b) frozenFx (bounds b + i)) c d) : ℚ) : ℝ)) ^ 2 := by
        apply Finset.sum_congr rfl
        intro i hi
        rw [Finset.mem_range] at hi
        apply Finset.sum_congr rfl
        intro c _
        apply Finset.sum_congr rfl
        intro d _
        unfold b0Blocks
        rw [hblkEq b (bounds b + i) hb (by omega) (by omega)]
      rw [heq]
      exact h
    rw [← sq_le_sq₀ (norm_nonneg _) hδ0, norm_productionF0Head_sub_sq]
    have hterm : ∀ q c d, ‖baseGradedCoefficient q c d - (a0Blocks R blk q c d : ℂ)‖ ^ 2 ≤
        2 * ‖baseGradedCoefficient q c d - ((gaussCoeff specs x q c d : ℝ) : ℂ)‖ ^ 2 +
        2 * (gaussCoeff specs x q c d + ((frozenQ q c d : ℚ) : ℝ) -
          ((b0Blocks R blk q c d : ℚ) : ℝ)) ^ 2 := by
      intro q c d
      set u := baseGradedCoefficient q c d - ((gaussCoeff specs x q c d : ℝ) : ℂ) with hu
      set w := gaussCoeff specs x q c d + ((frozenQ q c d : ℚ) : ℝ) -
        ((b0Blocks R blk q c d : ℚ) : ℝ) with hw
      have hsplit : baseGradedCoefficient q c d - (a0Blocks R blk q c d : ℂ) = u + (w : ℂ) := by
        rw [hu, hw]
        unfold a0Blocks
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
          ‖baseGradedCoefficient q c d - (a0Blocks R blk q c d : ℂ)‖ ^ 2
        ≤ ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
          (2 * ‖baseGradedCoefficient q c d - ((gaussCoeff specs x q c d : ℝ) : ℂ)‖ ^ 2 +
            2 * (gaussCoeff specs x q c d + ((frozenQ q c d : ℚ) : ℝ) -
              ((b0Blocks R blk q c d : ℚ) : ℝ)) ^ 2) := by
          exact Finset.sum_le_sum fun q _ => Finset.sum_le_sum fun c _ =>
            Finset.sum_le_sum fun d _ => hterm q c d
      _ = 2 * (∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
            ‖baseGradedCoefficient q c d - ((gaussCoeff specs x q c d : ℝ) : ℂ)‖ ^ 2) +
          2 * (∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
            (gaussCoeff specs x q c d + ((frozenQ q c d : ℚ) : ℝ) -
              ((b0Blocks R blk q c d : ℚ) : ℝ)) ^ 2) := by
          simp only [Finset.sum_add_distrib, Finset.mul_sum]
      _ ≤ 2 * ρ ^ 2 + 2 * (((∑ b ∈ Finset.range nb, bnd b : ℤ) : ℝ) / 2 ^ (2 * KFix)) :=
          add_le_add (mul_le_mul_of_nonneg_left hQuad (by norm_num))
            (mul_le_mul_of_nonneg_left hsumW (by norm_num))
      _ ≤ δ ^ 2 := hδ
  exact selected_energy_close_of_raw_error (a0Blocks R blk) hraw htable hsmoothing hbudget

end Grothe.UpperQuad
