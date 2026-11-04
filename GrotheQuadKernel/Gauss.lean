import GrotheQuadKernel.Basic

/-!
# Gauss–Legendre panels and the radial Laguerre factors

* Legendre polynomials by the three-term recurrence `realPair x k = (P_k x, P_{k+1} x)` of
  `Q0LegendreInteger` (`P_{k+2} = ((2k+3) x P_{k+1} − (k+1) P_k)/(k+2)`), on intervals.
* An `n`-point rule: `n` disjoint brackets `[lo_i, hi_i]` on which `P_n` changes sign; each
  contains one root `x_i` (obligation S6a of #303), with weight
  `w_i = 2 (1 − x_i²) / (n² P_{n−1}(x_i)²)` (`Q0LegendreWeight.weight (n-1)`), enclosed by
  evaluating the formula on the bracket.
* The physical panel `[l, h]`: node `l + (h−l)/2 · (1 + x_i)`, weight `(h−l)/2 · w_i`
  (`Q0GaussPhysical.panelNode`/`panelWeight`); the Gauss sum `Σ_i W_i f(s_i)`.  The remainder
  for analytic `f` is obligation S6b.
* The radial factor `ψ_{k,m}(s) = (−1)^m √(m!/(m+k)!) · s^{k/2} · L_m^{(k)}(s)`
  (`RadialLaguerre.radialFactor k m s`), by the Laguerre recurrence
  `L_{m+1}^{(k)} = ((2m+k+1−s) L_m^{(k)} − (m+k) L_{m−1}^{(k)})/(m+1)`.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace GrotheQuad

/-- `(P_k x, P_{k+1} x)` on an interval. -/
def legendrePairI (K : Nat) (x : Ival) : Nat → Ival × Ival
  | 0 => (ofInt K 1, x)
  | k + 1 =>
    let p := legendrePairI K x k
    (p.2, divN (k + 2) (subI (mulN (2 * k + 3) (mulI K x p.2)) (mulN (k + 1) p.1)))

/-- `P_n x`. -/
def legendreI (K : Nat) (x : Ival) (n : Nat) : Ival :=
  match n with
  | 0 => ofInt K 1
  | k + 1 => (legendrePairI K x k).2

/-- A root bracket of `P_n` given as scaled endpoints at precision `K`. -/
structure Bracket where
  lo : Int
  hi : Int
  deriving Repr, Inhabited

/-- `P_n` has opposite strict signs at the bracket's endpoints and the bracket lies in `(−1, 1)`. -/
def bracketOK (K n : Nat) (b : Bracket) : Bool :=
  let pl := legendreI K ⟨b.lo, b.lo⟩ n
  let ph := legendreI K ⟨b.hi, b.hi⟩ n
  b.lo ≤ b.hi && -(pow2 K) < b.lo && b.hi < pow2 K &&
    ((pl.hi < 0 && ph.lo > 0) || (pl.lo > 0 && ph.hi < 0))

/-- All brackets of an `n`-point rule are valid and pairwise disjoint (increasing). -/
def ruleOK (K n : Nat) (bs : Array Bracket) : Bool :=
  bs.size == n && (Array.range n).all (fun i => bracketOK K n (bs.getD i default)) &&
    (Array.range (n - 1)).all fun i => (bs.getD i default).hi < (bs.getD (i + 1) default).lo

/-- The weight `2 (1 − x²) / (n² P_{n−1}(x)²)` on the bracket (as an interval `x`). -/
def weightI (K n : Nat) (x : Ival) : Ival :=
  let pm := legendreI K x (n - 1)
  divI K (mulN 2 (subI (ofInt K 1) (sqI K x))) (mulN (n * n) (sqI K pm))

/-- The reference nodes and weights of the rule from its brackets. -/
def ruleNodesWeights (K n : Nat) (bs : Array Bracket) : Array (Ival × Ival) :=
  bs.map fun b =>
    let x : Ival := ⟨b.lo, b.hi⟩
    (x, weightI K n x)

/-- A physical panel `[lo, hi]` with its rule order and brackets. -/
structure Panel where
  lo : Rat
  hi : Rat
  order : Nat
  brackets : Array Bracket
  deriving Repr, Inhabited

/-- The physical nodes `lo + (hi−lo)/2 · (1 + x_i)` and weights `(hi−lo)/2 · w_i`. -/
def panelNodesWeights (K : Nat) (p : Panel) : Array (Ival × Ival) :=
  let loI := ofRat K p.lo
  let half := divN 2 (subI (ofRat K p.hi) loI)
  (ruleNodesWeights K p.order p.brackets).map fun (x, w) =>
    (addI loI (mulI K half (addI (ofInt K 1) x)), mulI K half w)

/-- The Gauss sum `Σ_i W_i · v_i` for node values `v_i`. -/
def gaussSumI (K : Nat) (weights vals : Array Ival) : Ival :=
  (Array.range (min weights.size vals.size)).foldl
    (fun s i => addI s (mulI K (weights.getD i zeroI) (vals.getD i zeroI))) zeroI

/-- `L_0^{(k)}(s), …, L_M^{(k)}(s)` by the three-term recurrence. -/
def laguerreRowI (K : Nat) (k M : Nat) (s : Ival) : Array Ival := Id.run do
  let mut out : Array Ival := Array.mkEmpty (M + 1)
  let mut lPrev := ofInt K 1                        -- L_0
  out := out.push lPrev
  if M == 0 then return out
  let mut lCur := subI (ofNat K (k + 1)) s          -- L_1 = k + 1 − s
  out := out.push lCur
  for m in [1:M] do
    -- L_{m+1} = ((2m+k+1−s) L_m − (m+k) L_{m−1}) / (m+1)
    let a := subI (ofNat K (2 * m + k + 1)) s
    let lNext := divN (m + 1) (subI (mulI K a lCur) (mulN (m + k) lPrev))
    out := out.push lNext
    lPrev := lCur
    lCur := lNext
  return out

/-- `m! / (m+k)!` as an exact rational. -/
def factRatio (k m : Nat) : Rat :=
  (1 : Rat) / ((List.range k).foldl (fun p i => p * (m + i + 1)) 1 : Nat)

/-- The radial factors `ψ_{k,m}(s)` for `m = 0, …, M` at `s ∈ sI ⊆ [0, ∞)`. -/
def radialRowI (K : Nat) (k M : Nat) (sI : Ival) : Array Ival :=
  let lag := laguerreRowI K k M sI
  let sk := powI K (sqrtI K sI) k
  (Array.range (M + 1)).map fun m =>
    let nrm := sqrtI K (ofRat K (factRatio k m))
    let v := mulI K sk (mulI K nrm (lag.getD m zeroI))
    if m % 2 == 1 then negI v else v

end GrotheQuad
