import GrotheQuadKernel.Basic

/-!
# Gauss–Legendre panels and the radial Laguerre factors

* Legendre polynomials by the three-term recurrence `realPair x k = (P_k x, P_{k+1} x)` of
  `Q0LegendreInteger` (`P_{k+2} = ((2k+3) x P_{k+1} − (k+1) P_k)/(k+2)`), on intervals.
* An `n`-point rule: `n` disjoint brackets `[lo_i, hi_i]/2^640` (the integer brackets of the
  modules `Q0LegendreRule01…64` on master) on which `P_n` changes sign; each contains one root
  `x_i` (obligation S6a of #303), with weight `w_i = 2 (1 − x_i²) / (n² P_{n−1}(x_i)²)`
  (`Q0LegendreWeight.weight (n−1)`), enclosed by evaluating the formula on the bracket.
* The physical panel `[l, h]`: node `l + (h−l)/2 · (1 + x_i)`, weight `(h−l)/2 · w_i`
  (`Q0GaussPhysical.panelNode`/`panelWeight`); the Gauss sum `Σ_i W_i f(s_i)`.  The remainder
  for analytic `f` is obligation S6b.
* The radial factor `ψ_{k,m}(s) = (−1)^m √(m!/(m+k)!) · s^{k/2} · L_m^{(k)}(s)`
  (`RadialLaguerre.radialFactor k m s`), with `L_m^{(k)}` evaluated by master's explicit sum
  `assocLaguerre` (the three-term recurrence would be faster but needs its own proof).

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace GrotheQuad

/-- `(P_k x, P_{k+1} x)` on an interval. -/
def legendrePairI (P : Nat) (x : Ival) : Nat → Ival × Ival
  | 0 => (ofInt P 1, x)
  | k + 1 =>
    let p := legendrePairI P x k
    (p.2, divN P (k + 2) (subI P (mulN P (2 * k + 3) (mulI P x p.2)) (mulN P (k + 1) p.1)))

/-- `P_n x`. -/
def legendreI (P : Nat) (x : Ival) (n : Nat) : Ival :=
  match n with
  | 0 => ofInt P 1
  | k + 1 => (legendrePairI P x k).2

/-- A root bracket of `P_n`: `[lo, hi] · 2^{−e}` with integer endpoints (master: `e = 640`). -/
structure Bracket where
  lo : Int
  hi : Int
  e : Nat
  deriving Repr, Inhabited

def Bracket.toIval (b : Bracket) : Ival := ⟨b.lo, b.hi, -(b.e : Int)⟩

/-- `P_n` has opposite strict signs at the bracket's endpoints and the bracket lies in `(−1, 1)`. -/
def bracketOK (P n : Nat) (b : Bracket) : Bool :=
  let pl := legendreI P ⟨b.lo, b.lo, -(b.e : Int)⟩ n
  let ph := legendreI P ⟨b.hi, b.hi, -(b.e : Int)⟩ n
  let one := pow2 b.e
  b.lo ≤ b.hi && -one < b.lo && b.hi < one &&
    ((isNeg pl && isPos ph) || (isPos pl && isNeg ph))

/-- All brackets of an `n`-point rule are valid and pairwise disjoint (increasing). -/
def ruleOK (P n : Nat) (bs : Array Bracket) : Bool :=
  bs.size == n && (Array.range n).all (fun i => bracketOK P n (bs.getD i default)) &&
    (Array.range (n - 1)).all fun i =>
      let a := bs.getD i default
      let b := bs.getD (i + 1) default
      a.e == b.e && a.hi < b.lo

/-- The weight `2 (1 − x²) / (n² P_{n−1}(x)²)` on the bracket (as an interval `x`). -/
def weightI (P n : Nat) (x : Ival) : Ival :=
  let pm := legendreI P x (n - 1)
  divI P (mulN P 2 (subI P (ofInt P 1) (sqI P x))) (mulN P (n * n) (sqI P pm))

/-- The reference nodes and weights of the rule from its brackets. -/
def ruleNodesWeights (P n : Nat) (bs : Array Bracket) : Array (Ival × Ival) :=
  bs.map fun b => (b.toIval, weightI P n b.toIval)

/-- A physical panel `[lo, hi]` (rationals `loN/loD`, `hiN/hiD`) with its rule order and brackets. -/
structure Panel where
  loN : Int
  loD : Nat
  hiN : Int
  hiD : Nat
  order : Nat
  brackets : Array Bracket
  deriving Repr, Inhabited

/-- The physical nodes `lo + (hi−lo)/2 · (1 + x_i)` and weights `(hi−lo)/2 · w_i`. -/
def panelNodesWeights (P : Nat) (p : Panel) : Array (Ival × Ival) :=
  let loI := ratI P p.loN p.loD
  let half := divN P 2 (subI P (ratI P p.hiN p.hiD) loI)
  (ruleNodesWeights P p.order p.brackets).map fun (x, w) =>
    (addI P loI (mulI P half (addI P (ofInt P 1) x)), mulI P half w)

/-- The Gauss sum `Σ_i W_i · v_i` for node values `v_i`. -/
def gaussSumI (P : Nat) (weights vals : Array Ival) : Ival :=
  (Array.range (min weights.size vals.size)).foldl
    (fun s i => addI P s (mulI P (weights.getD i zeroI) (vals.getD i zeroI))) zeroI

/-- The powers `x^0, …, x^M`. -/
def powTable (P : Nat) (x : Ival) (M : Nat) : Array Ival :=
  Array.ofFn fun i : Fin (M + 1) => powI P x i.val

/-- One term `(−1)^j C(m+k, m−j) s^j / j!` of `assocLaguerre k m s` (`sPow` = the powers of `s`). -/
def assocLaguerreTerm (P k m j : Nat) (sPow : Array Ival) : Ival :=
  if j % 2 == 1 then
    negI (divN P (factNat j) (mulN P (natChoose (m + k) (m - j)) (sPow.getD j zeroI)))
  else divN P (factNat j) (mulN P (natChoose (m + k) (m - j)) (sPow.getD j zeroI))

/-- `assocLaguerre k m s = Σ_{j ≤ m} (−1)^j C(m+k, m−j) s^j / j!` (`RadialLaguerre.assocLaguerre`). -/
def assocLaguerreI (P k m : Nat) (sPow : Array Ival) : Ival :=
  sumRangeI P (m + 1) fun j => assocLaguerreTerm P k m j sPow

/-- `(m+1)(m+2)…(m+k) = (m+k)!/m!`. -/
def risingFact (k m : Nat) : Nat := (List.range k).foldl (fun p i => p * (m + i + 1)) 1

/-- `√(m!/(m+k)!)`. -/
def normFactorI (P k m : Nat) : Ival := sqrtI P (divN P (risingFact k m) (ofInt P 1))

/-- The radial factor `ψ_{k,m}(s) = (−1)^m (√s)^k √(m!/(m+k)!) assocLaguerre k m s`
(`RadialLaguerre.radialFactor`), from the power tables of `s` and of `√s`. -/
def radialFactorI (P k m : Nat) (sPow rPow : Array Ival) : Ival :=
  if m % 2 == 1 then
    negI (mulI P (rPow.getD k zeroI) (mulI P (normFactorI P k m) (assocLaguerreI P k m sPow)))
  else mulI P (rPow.getD k zeroI) (mulI P (normFactorI P k m) (assocLaguerreI P k m sPow))

/-- The radial factors `ψ_{k,m}(s)` for `m = 0, …, M`. -/
def radialRowI (P k M : Nat) (sPow rPow : Array Ival) : Array Ival :=
  Array.ofFn fun m : Fin (M + 1) => radialFactorI P k m.val sPow rPow

end GrotheQuad
