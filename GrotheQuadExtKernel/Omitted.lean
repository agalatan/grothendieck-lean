import GrotheQuadKernel.Node

/-!
# The omitted pairs of the cutoffs (part (C) of `hQuad`, `docs/QUAD_CHECKER.md` §12.4)

A node with cutoff `D` contributes nothing to the raw entries of the pairs `c + d > D`.  The
contribution it should have made is bounded in `ℓ²` over the modes by `√(Z · m)`, where
`Z = Σ_{(k,j)} F_{k,j}²` is the sum of the squared node factors `F_{k,j} = ψ_{k,j}(s) e^{−s} W` over
the rows of the degree-501 triangle and `m = Σ_{c+d > D} U_{c,d}(A)²` is the omitted mass of the
node's coefficients.  By Bessel, `m ≤ 1 − Σ_{c+d ≤ D} U_{c,d}²` where the sum runs over **all** pairs
of degree `≤ D`: the canonical ones `c ≤ d+1` directly and the reflected ones `(d+1, c−1)` through
`U_{d+1,c−1}² = (c/(d+1)) U_{c,d}²` (`canonicalCoefficient_reflection`).  The kernel computes, from
the node loop's own enclosures (`nodeFactors`, `nodeVals`), an upper bound of `√(Z · m)` for every
node with `D < 501` (nodes with `D ≥ 501` omit no mode of the degree-501 head) and sums them
(`omittedBoundSum`, Minkowski over the nodes); `omittedOK` compares the sum with a bound.  The
soundness theorem is `Grothe/UpperQuad/OmittedSound.lean`.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace GrotheQuad

/-- A lower bound of `v²` for `v ∈ Fx` (scale `2^(2 KFix)`). -/
def sqLoFx (v : Fx) : Int :=
  if 0 ≤ v.lo then v.lo * v.lo else if v.hi ≤ 0 then v.hi * v.hi else 0

/-- An upper bound of `v²` for `v ∈ Fx` (scale `2^(2 KFix)`). -/
def sqHiFx (v : Fx) : Int := max (v.lo * v.lo) (v.hi * v.hi)

/-- The weight numerator of a canonical pair `(c, d)` in the Bessel sum over all pairs of its
degree: `(d+1) + c` when `1 ≤ c ≤ d` (the pair and its reflection `(d+1, c−1)`, whose squared
coefficient is `c/(d+1)` times the pair's), else `d+1`; the weight is `num / (d+1)`. -/
def pairWeightNum (c d : Nat) : Nat := if 1 ≤ c ∧ c ≤ d then d + 1 + c else d + 1

/-- The weighted lower bound of one canonical pair's squared coefficient (floor division, the
weight `num/(d+1)` applied to the lower bound of `v²`). -/
def pairTermLo (c d : Nat) (v : Fx) : Int := (sqLoFx v * (pairWeightNum c d : Int)) / ((d : Int) + 1)

/-- A lower bound (scale `2^(2 KFix)`) of `Σ_{c+d ≤ D} U_{c,d}²` over all pairs, from the canonical
values `valsFx` in canonical order (`canonicalPairs D 265`). -/
def besselLowerFx (D : Nat) (valsFx : Array Fx) : Int :=
  (List.range (canonicalPairs D 265).size).foldl
    (fun acc i => acc + pairTermLo ((canonicalPairs D 265).getD i (0, 0)).1
      ((canonicalPairs D 265).getD i (0, 0)).2 (valsFx.getD i default)) 0

/-- An upper bound of the omitted mass `Σ_{c+d > D} U_{c,d}²` (scale `2^(2 KFix)`): `1 − bessel`. -/
def deficitFx (D : Nat) (valsFx : Array Fx) : Int :=
  max 0 (pow2 (2 * KFix) - besselLowerFx D valsFx)

/-- An upper bound of `Σ_{(k,j)} F_{k,j}²` over the node factors (scale `2^(2 KFix)`). -/
def factorsSqHi (factors : Array (Array Fx)) : Int :=
  (List.range numCharges).foldl (fun acc k => acc +
    (List.range (blockSide k)).foldl (fun a j => a + sqHiFx ((factors.getD k #[]).getD j default)) 0) 0

/-- The node's bound `√(Z · m̄)` at scale `2^(2 KFix)` (`Z`, `m̄` at scale `2^(2 KFix)`, so their
product is at scale `2^(4 KFix)`); `0` when no mode of the head is omitted (`D ≥ 501`); `none` if
a flag of the node fails. -/
def omittedNodeBound (P : Nat) (piI : Ival) (pd : ProfileData) (nd : NodeSpec) : Option Int :=
  if 501 ≤ nd.cutoff then some 0 else
  match nodeShift P piI pd nd with
  | none => none
  | some (neg, aI) =>
    if nodeValid P nd aI then
      some (isqrtUp ((factorsSqHi (nodeFactors P (nodeS P nd) (nodeW P nd) 0 251) *
        deficitFx nd.cutoff ((nodeVals P piI nd neg aI).map toFx)).toNat))
    else none

/-- The sum of the node bounds over a list of specs (`none` if a node fails). -/
def omittedBoundSum (P : Nat) (piI : Ival) (pd : ProfileData) : List NodeSpec → Int → Option Int
  | [], acc => some acc
  | nd :: rest, acc =>
    (omittedNodeBound P piI pd nd).bind fun b => omittedBoundSum P piI pd rest (acc + b)

/-- The omitted-pair check: `Σ_a √(Z_a m̄_a) ≤ bound` at scale `2^(2 KFix)`. -/
def omittedOK (P : Nat) (piI : Ival) (pd : ProfileData) (specs : List NodeSpec) (bound : Int) : Bool :=
  (omittedBoundSum P piI pd specs 0).any fun s => decide (s ≤ bound)

end GrotheQuad
