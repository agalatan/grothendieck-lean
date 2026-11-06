import GrotheQuadKernel.Node
import GrotheQuadExtKernel.Dilate
import GrotheQuadExtKernel.Phase

/-!
# One node of the twisted computation

For the power `j` and a node of the partition (`NodeSpec`: `s`, `W`, sign `σ`, shift `A`), the
kernel computes (`docs/UPPER_CLOSURE.md` §8.1–8.2):

1. the rescaled shift `A' = A √λ`, the seed, the ratios and the canonical triangle at `A'` with the
   cutoff `D' = D_out + 35 j` (all canonical pairs, `dMax = D'`), the full signed triangle;
2. the dilated functional `K = dilateDil` on `D'` (fixed point at the scale `2^KDil = 2^1024`,
   which keeps the tiny high-degree entries to relative precision), then its unnormalised form
   `K'_{e,f} = √(e! f!) K_{e,f}` at the fixed scale `2^KTw`;
3. `J' = (Q_rᵀ)^j K'` on `D_out` (`applyQPow`, exact integer ladders), then
   `J_{c,d} = (−1)^j e^{−jεs} J'_{c,d} / √(c! d!)` (intervals);
4. the radial factors `ψ_{k,m}(s)` (`k + m ≤ Q`), the center's conditional vector
   `V_{c,d}(s) = Σ_q c(q,c,d) ψ(s)` and the node's contribution to `I_j`,
   `W e^{−s} Σ_{c+d ≤ D_out} V_{c,d} J_{c,d}`, and to the low band,
   `W e^{−s} ψ_i(s) J_{c,d}(s)` for the modes `i = (q, c, d)` with `2q + 1 ≤ D_low`
   (fixed scale `2^KOut`, products exact at `2^{2 KOut}`).

The center enters as the flat array of its exact dyadic numerators (`gradedFlatIndex`, exponent `E`).
The validity flags the soundness theorems need are `twistValid`.

Agent-ID: claude-b9ee. Refs #41, #313.
-/

namespace GrotheQuad

/-- The parameters of one power. -/
structure TwistParams where
  j : Nat
  Dout : Nat
  Dlow : Nat
  Q : Nat
  E : Nat
  deriving Repr, Inhabited

/-- The three powers: `(j, D_out, D_low, Q, E) = (1, 181, 51, 91, 206), (2, 91, 51, 46, 206),
(3, 51, 11, 26, 105)`. -/
def twistParams (j : Nat) : TwistParams :=
  if j == 1 then ⟨1, 181, 51, 91, 206⟩ else if j == 2 then ⟨2, 91, 51, 46, 206⟩ else ⟨3, 51, 11, 26, 105⟩

/-- The input degree `D' = D_out + 35 j`. -/
def twistDin (prm : TwistParams) : Nat := prm.Dout + 35 * prm.j

/-- The number of low-band grades `(D_low + 1)/2`. -/
def twistQlow (prm : TwistParams) : Nat := (prm.Dlow + 1) / 2

/-- The fixed scale of the outputs (the center contraction and the low band). -/
def KOut : Nat := 256

def toOut (a : Ival) : Fx := ⟨toFixedLo KOut a, toFixedHi KOut a⟩

def roundOut (p : Int × Int) : Fx := ⟨shDown KOut p.1, shUp KOut p.2⟩

/-- The per-process tables: the dilation table at the scale `2^KDil`, `√(c! d!)` at the scale `2^KDil`
(for the unnormalisation) and as intervals (for the normalisation), the phase terms, the center. -/
structure TwistTables where
  dil : Array (Array (Array (Int × Int)))
  sqfDil : Array (Array (Int × Int))
  sqf : Array (Array Ival)
  terms : Array PhaseTerm
  center : Array Int
  deriving Inhabited

/-- `√(c! d!)` for `c + d ≤ D` (`[c][d]`). -/
def sqrtFactTable (P D : Nat) : Array (Array Ival) :=
  Array.ofFn fun c : Fin (D + 1) => Array.ofFn fun d : Fin (D + 1 - c.val) =>
    sqrtI P (ofNat P (factT c.val * factT d.val))

def twistTables (P : Nat) (prm : TwistParams) (terms : Array PhaseTerm) (center : Array Int) :
    TwistTables :=
  ⟨dilTableDil P (lamI P prm.j) (twistDin prm), sqrtFactDil P (twistDin prm),
    sqrtFactTable P (twistDin prm), terms, center⟩

/-- `gradedFlatIndex q c d` (`Grothe/UpperChaos/GradedFlatIndex.lean`). -/
def gradedFlat (q c d : Nat) : Nat := q * (q + 1) * (q + 2) / 3 + c * (q + 1) + d

/-- The center coefficient `c(q, c, d) = m · 2^{−E}` at the scale `2^KOut` (exact for `E ≤ KOut`). -/
def centerOut (center : Array Int) (E q c d : Nat) : Fx :=
  ⟨center.getD (gradedFlat q c d) 0 * pow2 (KOut - E), center.getD (gradedFlat q c d) 0 * pow2 (KOut - E)⟩

/-- The radial indices `(k, m)` of the mode `(q, c, d)`: `ψ_i(s) = radialFactor k m s` with
`(k, m) = (d + 1 − c, q − d)` for `c ≤ d + 1` and `(c − d − 1, q + 1 − c)` otherwise. -/
def radialKM (q c d : Nat) : Nat × Nat := if c ≤ d + 1 then (d + 1 - c, q - d) else (c - d - 1, q + 1 - c)

/-- The radial factors `ψ_{k,m}(s)` for `k + m ≤ Q` at the scale `2^KOut` (`[k][m]`). -/
def psiTable (P Q : Nat) (s : Ival) : Array (Array Fx) :=
  let lagTab := lagTable P Q (negExpTerms P (negI s) Q)
  let rPow := powTable P (sqrtI P s) Q
  Array.ofFn fun k : Fin (Q + 1) => Array.ofFn fun m : Fin (Q + 1 - k.val) =>
    toOut (radialFactorI P k.val m.val ((lagTab.getD (Q - k.val) #[]).getD m.val zeroI) rPow)

def psiGet (psi : Array (Array Fx)) (k m : Nat) : Fx := (psi.getD k #[]).getD m ⟨0, 0⟩

/-- The center's conditional vector `V_{c,d}(s) = Σ_{q < Q} c(q,c,d) ψ_{(q,c,d)}(s)` on `c + d ≤ D_out`
(`c ≤ q + 1`, `d ≤ q`, i.e. `q ≥ max(c − 1, d)`), at the scale `2^KOut`. -/
def centerV (prm : TwistParams) (center : Array Int) (psi : Array (Array Fx)) : Array (Array Fx) :=
  Array.ofFn fun c : Fin (prm.Dout + 1) => Array.ofFn fun d : Fin (prm.Dout + 1 - c.val) =>
    roundOut (sumPairs (prm.Q - max (c.val - 1) d.val) fun i =>
      let q := max (c.val - 1) d.val + i
      mulFx (centerOut center prm.E q c.val d.val) (psiGet psi (radialKM q c.val d.val).1 (radialKM q c.val d.val).2))

/-- The result of one node: the `I`-contribution and the low-band contributions `[q][c][d]` (both at
the scale `2^{2 KOut}`), plus the widest `J` entry (log₂, diagnostics). -/
structure TwistNodeOut where
  iPart : Int × Int
  low : Array (Array (Array (Int × Int)))
  jWidth : Int
  deriving Inhabited

/-- The unnormalised functional `K'_{e,f} = √(e! f!) K_{e,f}` at the scale `2^KTw`. -/
def unnormalise (P : Nat) (sqf : Array (Array Ival)) (D : Nat) (K : IvVec) : TwVec :=
  twOfFn D fun e f => toTw (mulI P (ivGet sqf e f) (ivGet K e f))

/-- Back to the normalised basis: `J_{c,d} = J'_{c,d} / √(c! d!)`, as intervals. -/
def normalise (P : Nat) (sqf : Array (Array Ival)) (D : Nat) (J' : TwVec) : IvVec :=
  ivOfFn D fun c d => divI P (ofFixed KTw (twGet J' c d).1 (twGet J' c d).2) (ivGet sqf c d)

/-- The twisted conditional coefficients `J_{c,d}(s)` on `D_out` from the node data (intervals).

Everything from the canonical triangle to `J` is linear in the seed scalar `S(A')` (the triangle is
`S(A') · σ^{c+d} U_{c,d}`, then the dilation, the unnormalisation, the operator and the
normalisation), so the triangle is computed with the scalar `1` and `S(A')` multiplies `J` at the end,
together with `(−1)^j e^{−jεs}`.  Applying the seed first (as the checker does) turns its relative
error into absolute widths of the cancelling sums: the Watson form of `seedJ0I` at `x = A'² ≥ 150` has
the relative error `Γ(71.5)/x^{71.5}` (`2^{−211}` at `x = 212`), the dilation and the unnormalisation by
`√(e! f!) ≤ 2^{351}` amplified it to widths `2^{−8}` on `J` at node 500 for `j = 3` (`A' = 14.6`), and the
full `j = 3` loop had widths `≈ 10⁶` (claude-b9ee port-facts worker, 6 November 2026). -/
def twistJ (P : Nat) (prm : TwistParams) (tabs : TwistTables) (piI s : Ival) (neg : Bool) (aI : Ival) :
    IvVec :=
  let Din := twistDin prm
  let lam := lamI P prm.j
  let aI' := mulI P (sqrtI P lam) aI
  -- the triangle of the normalised coefficients `σ^{c+d} U_{c,d}` (seed scalar `1`); the computation
  -- is linear in the seed, which is applied at the end (see the docstring)
  let vals := canonicalTriangleI P (ofInt P 1) neg zeroI aI' (sqrtTable P (Din + 1))
    (ratiosI P (sqI P aI') (ratioDepth Din)) Din Din
  let K := dilateDil tabs.dil Din (fullTriangleDil P vals Din)
  let r := sqrtI P s
  let J' := applyQPow (nodeCoefs P tabs.terms s r) (toTw (divN P 2 r)) prm.Dout prm.j
    (unnormaliseDil tabs.sqfDil Din K)
  let ea := mulI P (expAlphaI P prm.j s) (seedScalarI P piI aI')
  let J := normalise P tabs.sqf prm.Dout J'
  ivOfFn prm.Dout fun c d =>
    if prm.j % 2 == 1 then negI (mulI P ea (ivGet J c d)) else mulI P ea (ivGet J c d)

/-- One node: `J`, the center contraction and the low band. -/
def twistNode (P : Nat) (prm : TwistParams) (tabs : TwistTables) (piI s w : Ival) (neg : Bool)
    (aI : Ival) : TwistNodeOut :=
  let J := twistJ P prm tabs piI s neg aI
  let Jx : Array (Array Fx) := J.map fun row => row.map toOut
  let getJ := fun c d => (Jx.getD c #[]).getD d ⟨0, 0⟩
  let psi := psiTable P prm.Q s
  let V := centerV prm tabs.center psi
  let nodeF := toOut (mulI P (expNegI P 400 s) w)
  let inner := roundOut ((List.range (prm.Dout + 1)).foldl (fun acc c =>
    (List.range (prm.Dout + 1 - c)).foldl (fun acc d =>
      addPair acc (mulFx ((V.getD c #[]).getD d ⟨0, 0⟩) (getJ c d))) acc) (0, 0))
  let Qlow := twistQlow prm
  ⟨mulFx nodeF inner,
    Array.ofFn fun q : Fin Qlow => Array.ofFn fun c : Fin (q.val + 2) => Array.ofFn fun d : Fin (q.val + 1) =>
      mulFx nodeF (roundOut (mulFx (psiGet psi (radialKM q.val c.val d.val).1 (radialKM q.val c.val d.val).2)
        (getJ c.val d.val))),
    J.foldl (fun m row => row.foldl (fun m x => max m (widthLog2 x)) m) (-100000)⟩

/-- The validity flags of a node for the power `j`: the checker's node flags (bracket, panel,
weight, node factors) and, at the rescaled shift `A'`, the positivity of `A'`, the ratio
denominators, the square roots of the recurrence, and the exponentials of `e^{−jεs}`. -/
def twistValid (P : Nat) (prm : TwistParams) (nd : NodeSpec) (aI : Ival) : Bool :=
  let Din := twistDin prm
  let aI' := mulI P (sqrtI P (lamI P prm.j)) aI
  bracketOK bracketPrec nd.order nd.bracket && decide (0 < nd.loD) && decide (0 < nd.hiD) &&
    decide (1 ≤ nd.order) && weightValid P nd && isPos (nodeS P nd) &&
    nodeFactorsValid P (nodeS P nd) && expAlphaValid P prm.j (nodeS P nd) &&
    isPos (lamI P prm.j) && isPos (sqrtI P (lamI P prm.j)) && isPos aI' &&
    ratiosValid P (sqI P aI') (ratioDepth Din) &&
    (List.range (Din + 1)).all (fun n => isPos (sqrtNatI P (n + 1))) &&
    (List.range ((Din + 1) / 2 + 1)).all (fun c => isPos (mulI P aI' (sqrtNatI P (c + 1))))

end GrotheQuad
