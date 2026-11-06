import Grothe.UpperQuad.Partition
import Grothe.UpperQuad.PiSound
import Grothe.UpperChaos.TaylorCenters
import Grothe.UpperChaos.PhaseTermsDefs
import GrotheQuadExtKernel.TwistLoop

/-!
# The native facts of the upper-closure port: the common definitions

The six hypotheses `hfirst/hsecond/hthird`, `hwholeFirst/Second/Third` of
`upper_of_three_low_three_whole` reduce to Gauss–Legendre sums over the 21,577 nodes of the
committed partition (`docs/UPPER_CLOSURE.md` §8): per power `j`, the `I_j`-sum
`Σ_n W e^{−s} Σ_{c,d} V_{c,d}(s) J_{c,d}(s)` and the low-band sums `Σ_n W e^{−s} ψ_i(s) J_{c,d}(s)`.
The kernel's node loop `twistSpecs` encloses them; it costs ≈ 60–90 CPU-h per power, so the facts
are sharded **by node ranges with committed partials** (§8.5):

* the range fact `rangeFact j lo hi t` runs `twistSpecs` over the nodes `[lo, hi)` of
  `partitionSpecs` (with master's phase terms and master's center array of the power) and checks
  that the accumulator lies in the committed table `t` (`accWithin`);
* the final fact `finalFact j bounds ts θ eps` checks that the ranges tile `[0, 21577)`, adds the
  tables exactly (`sumTables`) and runs the kernel's checks on the sum: `iPartialOK` (the lower end
  of the `I_j`-sum is at least `θ`) and `lowBandOK` (the squared excursions of the low-band sums
  from the center's coefficients add up to at most `eps / 2^{4 KOut}`).

The tables are data (`data/port-facts/j<j>-tables.txt`, midpoints at the scale `2^64` and one radius
per table; `tools/port_facts_tables.py`), the modules are generated (`tools/gen_port_facts.py`).
`rangeFact_spec` and `finalFact_spec` unpack the `Bool`s for the soundness layer.

Agent-ID: claude-b9ee. Refs #41, #313.
-/

namespace Grothe.UpperQuad.PortFacts

open GrotheQuad Grothe.UpperQuad Grothe.UpperChaos

/-- The working precision of the node loop. -/
def P0 : ℕ := 512

/-- `π` at the working precision (the quadrature checker's `Facts.piI`). -/
def piI : Ival := piMachinI P0 (P0 / 3 + 20)

lemma mem_piI : mem Real.pi piI := mem_piMachinI P0 (by decide) _

/-- `profileQ`, `aQ` of `Grothe/Upper/Data.lean` as rationals (the quadrature checker's
`Facts.profile`, `data/quad-checker/profile.txt`). -/
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
    interval_cases j <;> norm_num [profile, Grothe.Upper.profileQ]
  · norm_num [profile, Grothe.Upper.aQ]

/-! ### The inputs of the twisted loop: master's phase terms and centers -/

/-- Master's phase monomials `C U^i V^j W^k` (`phaseTerms`, from `phaseStrs`) as kernel terms. -/
def phaseArr : Array PhaseTerm :=
  (phaseTerms.map fun t => (⟨t.1.1, t.1.2.1, t.1.2.2, t.2.num, t.2.den⟩ : PhaseTerm)).toArray

/-- Master's center of the power `j` as its flat array of dyadic numerators (`gradedFlatIndex`
order; exponent `206` for `j = 1, 2`, `105` for `j = 3`, the `E` of `twistParams j`). -/
def centerInts (j : ℕ) : Array ℤ :=
  if j = 1 then firstCenterInts else if j = 2 then secondCenterInts else thirdCenterInts

/-- The per-process tables of the power `j`. -/
def tables (j : ℕ) : TwistTables := twistTables P0 (twistParams j) phaseArr (centerInts j)

/-- The number of low-band grades of the power `j`. -/
def qlow (j : ℕ) : ℕ := twistQlow (twistParams j)

/-- The node specs `[lo, hi)` of the committed partition. -/
def rangeSpecs (lo hi : ℕ) : List NodeSpec := (partitionSpecs.drop lo).take (hi - lo)

/-- The kernel's accumulator of the nodes `[lo, hi)` for the power `j` (`none` if a flag fails). -/
def rangeAcc (j lo hi : ℕ) : Option TwAcc :=
  twistSpecs P0 piI profile (twistParams j) (tables j) (rangeSpecs lo hi) (twAccZero (qlow j))

/-! ### The committed tables -/

/-- The scale of the committed tables. -/
def KT : ℕ := 64

/-- A committed partial table: the midpoint of the `I`-partial and the low-band midpoints (flat
graded order, comma-separated decimal chunks), at the scale `2^KT`, with one radius for the
`I`-partial and one for every low-band entry. -/
structure PartialTable where
  iMid : ℤ
  iRad : ℕ
  lowRad : ℕ
  low : Array String
  deriving Inhabited

/-- The low-band midpoints of a table (`0` for a malformed entry, which makes the checks fail). -/
def PartialTable.lowMids (t : PartialTable) : Array ℤ :=
  t.low.foldl (fun acc s => acc ++ ((s.splitOn ",").map fun x => x.toInt?.getD 0).toArray) #[]

/-- The interval `[m − ρ, m + ρ] · 2^{−KT}` at the accumulator's scale `2^{2 KOut}`. -/
def ballAcc (m : ℤ) (ρ : ℕ) : ℤ × ℤ :=
  ((m - ρ) * pow2 (2 * KOut - KT), (m + ρ) * pow2 (2 * KOut - KT))

/-- A table as an accumulator (scale `2^{2 KOut}`): the low-band entry `(q, c, d)` is the ball of
the midpoint at the flat index `gradedFlat q c d`. -/
def PartialTable.toAcc (Qlow : ℕ) (t : PartialTable) : TwAcc :=
  let mids := t.lowMids
  ⟨ballAcc t.iMid t.iRad, Array.ofFn fun q : Fin Qlow => Array.ofFn fun c : Fin (q.val + 2) =>
    Array.ofFn fun d : Fin (q.val + 1) => ballAcc (mids.getD (gradedFlat q.val c.val d.val) 0) t.lowRad⟩

/-- `a ⊆ b` for integer intervals. -/
def pairWithin (a b : ℤ × ℤ) : Bool := decide (b.1 ≤ a.1) && decide (a.2 ≤ b.2)

/-- Every entry of the accumulator `acc` lies in the corresponding entry of `tab`. -/
def accWithin (Qlow : ℕ) (acc tab : TwAcc) : Bool :=
  pairWithin acc.iPart tab.iPart &&
    (List.range Qlow).all fun q => (List.range (q + 2)).all fun c => (List.range (q + 1)).all fun d =>
      pairWithin (lowGet acc.low q c d) (lowGet tab.low q c d)

/-- The entrywise sum of two accumulators on `Qlow` grades. -/
def accAdd (Qlow : ℕ) (a b : TwAcc) : TwAcc :=
  ⟨addPair a.iPart b.iPart, Array.ofFn fun q : Fin Qlow => Array.ofFn fun c : Fin (q.val + 2) =>
    Array.ofFn fun d : Fin (q.val + 1) => addPair (lowGet a.low q.val c.val d.val) (lowGet b.low q.val c.val d.val)⟩

/-- The sum of the tables, as an accumulator. -/
def sumTables (Qlow : ℕ) (ts : List PartialTable) : TwAcc :=
  ts.foldl (fun acc t => accAdd Qlow acc (t.toAcc Qlow)) (twAccZero Qlow)

/-! ### The facts -/

/-- **The range fact**: the profile flags, the node loop over `[lo, hi)` for the power `j`, and the
accumulator inside the committed table `t`. -/
def rangeFact (j lo hi : ℕ) (t : PartialTable) : Bool :=
  profileValid P0 piI profile && (rangeAcc j lo hi).any fun acc => accWithin (qlow j) acc (t.toAcc (qlow j))

lemma rangeFact_spec {j lo hi : ℕ} {t : PartialTable} (h : rangeFact j lo hi t = true) :
    profileValid P0 piI profile = true ∧
      ∃ acc, rangeAcc j lo hi = some acc ∧ accWithin (qlow j) acc (t.toAcc (qlow j)) = true := by
  unfold rangeFact at h
  rw [Bool.and_eq_true, Option.any_eq_true] at h
  exact ⟨h.1, h.2⟩

/-- The boundaries tile `[0, n)`: they start at `0`, end at `n` and increase weakly. -/
def tiles (n : ℕ) (bounds : List ℕ) : Bool :=
  bounds.head? == some 0 && bounds.getLast? == some n &&
    (bounds.zip bounds.tail).all fun p => decide (p.1 ≤ p.2)

/-- **The final fact** of the power `j`: the boundaries tile the partition, one table per range,
and the kernel's two checks on the sum of the tables: `I_j ≥ θ` (`θ = num/den`) and the low-band
excursion bound `eps` (scale `2^{4 KOut}`). -/
def finalFact (j : ℕ) (bounds : List ℕ) (ts : List PartialTable) (num : ℤ) (den : ℕ) (eps : ℤ) : Bool :=
  tiles partitionSpecs.length bounds && ts.length + 1 == bounds.length &&
    iPartialOK (sumTables (qlow j) ts) num den &&
    lowBandOK (sumTables (qlow j) ts) (centerInts j) (twistParams j).E (qlow j) eps

lemma finalFact_spec {j : ℕ} {bounds : List ℕ} {ts : List PartialTable} {num : ℤ} {den : ℕ} {eps : ℤ}
    (h : finalFact j bounds ts num den eps = true) :
    tiles partitionSpecs.length bounds = true ∧ ts.length + 1 = bounds.length ∧
      iPartialOK (sumTables (qlow j) ts) num den = true ∧
      lowBandOK (sumTables (qlow j) ts) (centerInts j) (twistParams j).E (qlow j) eps = true := by
  unfold finalFact at h
  simp only [Bool.and_eq_true, beq_iff_eq] at h
  exact ⟨h.1.1.1, h.1.1.2, h.1.2, h.2⟩

/-- Adjacent ranges concatenate. -/
lemma rangeSpecs_append {lo mid hi : ℕ} (h1 : lo ≤ mid) (h2 : mid ≤ hi) :
    rangeSpecs lo mid ++ rangeSpecs mid hi = rangeSpecs lo hi := by
  unfold rangeSpecs
  obtain ⟨a, rfl⟩ := Nat.exists_eq_add_of_le h1
  obtain ⟨b, rfl⟩ := Nat.exists_eq_add_of_le h2
  rw [show lo + a - lo = a by omega, show lo + a + b - (lo + a) = b by omega,
    show lo + a + b - lo = a + b by omega, List.take_add, List.drop_drop]

end Grothe.UpperQuad.PortFacts
