import Grothe.UpperQuad.Bridge
import Grothe.UpperQuad.Partition
import Grothe.UpperQuad.PiSound

/-!
# The native facts of the quadrature checker: the common definitions

The facts are sharded by grade blocks (`docs/QUAD_CHECKER.md` §11.4): block `b` runs the whole node
loop of the committed partition restricted to the grades `[bounds b, bounds (b+1))` and checks the
energies of those grades against the table (`energyOKBlock`) and the widths of their grade matrices
(`rawDistOKBlock`); nothing intermediate is committed.  `blockFact b eps bnd` is the `Bool` a native
fact evaluates; `blockFact_spec` extracts the accumulator and the two checks, and
`hclose_of_blockFacts` turns the twelve facts, the even check and the analytic hypotheses into
`hclose` through `hclose_of_blocks`.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad.Facts

open GrotheQuad Grothe.UpperQuad Grothe.UpperChaos Grothe.Upper
  Grothe.UpperChaos.F0ConditionalEvaluator

/-- The working precision of the node loop. -/
def P0 : ℕ := 512

/-- `π` at the working precision. -/
def piI : Ival := piMachinI P0 (P0 / 3 + 20)

lemma mem_piI : mem Real.pi piI := mem_piMachinI P0 (by decide) _

/-- `profileQ`, `aQ` of `Grothe/Upper/Data.lean` as rationals (`data/quad-checker/profile.txt`). -/
def profile : ProfileData :=
  ⟨#[(509888697151587, 1250000000000000), (1592452691513103, 500000000000000000),
    (640284779707751, 125000000000000000), (142901914550863, 100000000000000000),
    (-1514225877130847, 1000000000000000000), (-9854978909658353, 10000000000000000000),
    (-433106588072407, 1000000000000000000), (28572288462058417, 100000000000000000000),
    (-5127576756513993, 10000000000000000000), (4280011654313799, 5000000000000000000),
    (-336844283516839, 400000000000000000), (869607565630577, 2000000000000000000)],
   7229250152720283, 250000000000000000⟩

/-- The literal is master's profile. -/
lemma profile_agrees : profileAgrees profile := by
  refine ⟨rfl, fun j hj => ?_, ?_⟩
  · have hj' : j < 12 := hj
    interval_cases j <;> norm_num [profile, profileQ]
  · norm_num [profile, aQ]

/-! ### The twelve grade blocks (balanced by the entry count `(q+1)(q+2)/2`) -/

def boundsList : List ℕ := [0, 110, 138, 158, 174, 188, 200, 210, 220, 228, 237, 244, 251]

/-- The block boundaries: `bounds 0 = 0`, `bounds 12 = 251`, constant beyond. -/
def bounds (b : ℕ) : ℕ := if b < 12 then boundsList.getD b 0 else 251

lemma bounds_mono : Monotone bounds := by
  apply monotone_nat_of_le_succ
  intro b
  rcases Nat.lt_or_ge b 12 with h | h
  · interval_cases b <;> decide
  · unfold bounds
    simp only [show ¬ b < 12 by omega, show ¬ b + 1 < 12 by omega, ↓reduceIte, le_refl]

/-- The block of the grade `q`: the number of boundaries `≤ q` among `bounds 1 … bounds 11`. -/
def blk (q : ℕ) : ℕ := ((List.range 11).filter fun i => bounds (i + 1) ≤ q).length

lemma blk_spec : ∀ q, q < 251 → blk q < 12 ∧ bounds (blk q) ≤ q ∧ q < bounds (blk q + 1) := by
  decide +kernel

/-! ### The block facts -/

/-- The block fact: the profile flags, the node loop restricted to the block, and the two checks
with the tolerances `eps` (ℓ¹ excursion, scale `2^256`) and `bnd` (squared widths, scale `2^256`). -/
def blockFact (b : ℕ) (eps bnd : ℤ) : Bool :=
  profileValid P0 piI profile &&
    (accumulateSpecs P0 piI profile (bounds b) (bounds (b + 1)) partitionSpecs rawZero).any
      fun R => energyOKBlock R frozenFx tableFx eps (bounds b) (bounds (b + 1)) &&
        rawDistOKBlock R frozenFx bnd (bounds b) (bounds (b + 1))

lemma blockFact_spec {b : ℕ} {eps bnd : ℤ} (h : blockFact b eps bnd = true) :
    profileValid P0 piI profile = true ∧
      ∃ R, accumulateSpecs P0 piI profile (bounds b) (bounds (b + 1)) partitionSpecs rawZero = some R ∧
        energyOKBlock R frozenFx tableFx eps (bounds b) (bounds (b + 1)) = true ∧
        rawDistOKBlock R frozenFx bnd (bounds b) (bounds (b + 1)) = true := by
  unfold blockFact at h
  rw [Bool.and_eq_true, Option.any_eq_true] at h
  obtain ⟨hpv, R, hR, hRb⟩ := h
  rw [Bool.and_eq_true] at hRb
  exact ⟨hpv, R, hR, hRb.1, hRb.2⟩

/-- **`hclose` from the twelve block facts**, the even check and the analytic hypotheses (the seed
enclosure at every node, S2, and the quadrature hypothesis `hQuad`). -/
theorem hclose_of_blockFacts (eps bnd : ℕ → ℤ)
    (hf : ∀ b, b < 12 → blockFact b (eps b) (bnd b) = true)
    {evenNum : ℤ} (hEven : evenExcursion tableFx ≤ evenNum)
    (hJ : ∀ nd ∈ partitionSpecs, ∀ neg aI, nodeShift P0 piI profile nd = some (neg, aI) →
      mem (OriginalPositiveMoment.moment 0 (profileShift (specNode nd (rootOf nd)) ^ 2))
        (seedJ0I P0 piI (sqI P0 aI)))
    {ρ : ℝ} (hQuad : ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2),
      ∑ d ∈ Finset.range (q + 1),
        ‖FixedChaosSmoothing.baseGradedCoefficient q c d -
          ((gaussCoeff partitionSpecs rootOf q c d : ℝ) : ℂ)‖ ^ 2 ≤ ρ ^ 2)
    {δ Δ : ℝ} (hδ0 : 0 ≤ δ)
    (hδ : 2 * ρ ^ 2 + 2 * (((∑ b ∈ Finset.range 12, bnd b : ℤ) : ℝ) / 2 ^ (2 * KFix)) ≤ δ ^ 2)
    (hsmoothing : δ + (4 / 10 ^ 15 : ℝ) * ((501 / 500 : ℝ) + δ) ≤ Δ)
    (hbudget : (2 * (501 / 500 : ℝ) + 3 * Δ) * Δ +
      (((∑ b ∈ Finset.range 12, eps b + evenNum : ℤ) : ℝ)) / 2 ^ (2 * KFix) ≤ (energyErrQ : ℝ)) :
    ∑ p ∈ headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp (Xfun frozenCorrectionFn)) p -
        (energyTable p : ℝ)| ≤ (energyErrQ : ℝ) := by
  have hspec := fun b (hb : b < 12) => (blockFact_spec (hf b hb)).2
  have hpv : profileValid P0 piI profile = true := (blockFact_spec (hf 0 (by norm_num))).1
  let R : ℕ → Raw := fun b => if hb : b < 12 then Classical.choose (hspec b hb) else rawZero
  have hR : ∀ b, (hb : b < 12) →
      accumulateSpecs P0 piI profile (bounds b) (bounds (b + 1)) partitionSpecs rawZero = some (R b) ∧
        energyOKBlock (R b) frozenFx tableFx (eps b) (bounds b) (bounds (b + 1)) = true ∧
        rawDistOKBlock (R b) frozenFx (bnd b) (bounds b) (bounds (b + 1)) = true := by
    intro b hb
    simp only [R, hb, ↓reduceDIte]
    exact Classical.choose_spec (hspec b hb)
  have hx : ∀ nd ∈ partitionSpecs, mem (rootOf nd) nd.bracket.toIval :=
    rootOf_mem_of_accepted P0 piI profile (bounds 0) (bounds 1) partitionSpecs (R 0)
      (hR 0 (by norm_num)).1
  exact hclose_of_blocks P0 (by decide) mem_piI profile_agrees hpv partitionSpecs rootOf hx hJ 12
    bounds bounds_mono (by decide) (by decide) blk blk_spec R (fun b hb => (hR b hb).1) hQuad eps bnd
    (fun b hb => (hR b hb).2.1) (fun b hb => (hR b hb).2.2) hEven hδ0 hδ hsmoothing hbudget

end Grothe.UpperQuad.Facts
