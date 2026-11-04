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
  `assocLaguerre` on the diagonal `m + k = 251` (`Σ_j C(m+k, m−j) u_j` with the terms
  `u_j = (−s)^j/j!` by one running product per node and the binomials from a table computed
  once) and by Pascal's rule `L_m^{(k)} = L_m^{(k+1)} − L_{m−1}^{(k+1)}` below it (`lagTable`).

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

/-- The factorials `0!, …, 502!` (computed once per process). -/
def factTable : Array Nat := Array.ofFn fun n : Fin 503 => factNat n.val

/-- `n!` from the table (`n ≤ 502`). -/
def factT (n : Nat) : Nat := factTable.getD n 0

/-- The row `C(n, 0), …, C(n, M)` as a pushed array, by the running product
`C(n, i+1) = C(n, i) · (n − i) / (i + 1)` (exact for `i < n`). -/
def binomRowArr (n : Nat) : Nat → Array Nat
  | 0 => #[1]
  | i + 1 =>
    let prev := binomRowArr n i
    prev.push (prev.getD i 0 * (n - i) / (i + 1))

/-- The binomial rows `C(n, i)` for `n ≤ 502`, `i ≤ n` (computed once per process). -/
def binomTable : Array (Array Nat) := Array.ofFn fun n : Fin 503 => binomRowArr n.val n.val

/-- `C(n, i)` from the table (`n ≤ 502`, `i ≤ n`). -/
def binomT (n i : Nat) : Nat := (binomTable.getD n #[]).getD i 0

/-- The terms `u_j = (−s)^j / j!` for `j = 0, …, M` as a pushed array, by
`u_{j+1} = u_j · (−s) / (j+1)` (`negs` encloses `−s`). -/
def negExpTerms (P : Nat) (negs : Ival) : Nat → Array Ival
  | 0 => #[ofInt P 1]
  | j + 1 =>
    let prev := negExpTerms P negs j
    prev.push (divN P (j + 1) (mulI P (prev.getD j zeroI) negs))

/-- `assocLaguerre k m s = Σ_{j ≤ m} (−1)^j C(m+k, m−j) s^j / j! = Σ_{j ≤ m} C(m+k, m−j) · u_j`
(`RadialLaguerre.assocLaguerre`; `uTab` = the terms `u_j = (−s)^j/j!`). -/
def assocLaguerreI (P k m : Nat) (uTab : Array Ival) : Ival :=
  sumRangeI P (m + 1) fun j => mulN P (binomT (m + k) (m - j)) (uTab.getD j zeroI)

/-- `√(m!/(m+k)!)`. -/
def normFactorI (P k m : Nat) : Ival :=
  sqrtI P (divI P (ofNat P (factT m)) (ofNat P (factT (m + k))))

/-- The level `k` of the Laguerre table `L_m^{(k)}(s)`, `m ≤ K − k`, from the level `k + 1`
(`prev[m] = L_m^{(k+1)}(s)` for `m ≤ K − k − 1`): `L_0^{(k)} = 1`, the diagonal entry
`L_{K−k}^{(k)}` by the explicit sum, and otherwise `L_m^{(k)} = L_m^{(k+1)} − L_{m−1}^{(k+1)}`
(Pascal's rule on the binomials of `assocLaguerre`; one subtraction per entry instead of a sum of
`m + 1` terms).  The widths grow additively (at most `2^K` times the diagonal widths), far below
the fixed-point export at `P ≥ 1024`. -/
def lagLevel (P K k : Nat) (uTab prev : Array Ival) : Array Ival :=
  Array.ofFn fun m : Fin (K - k + 1) =>
    if m.val = 0 then ofInt P 1
    else if m.val = K - k then assocLaguerreI P k m.val uTab
    else subI P (prev.getD m.val zeroI) (prev.getD (m.val - 1) zeroI)

/-- The levels `K, K − 1, …, K − i` of the Laguerre table as a pushed array (index `i` holds the
level `k = K − i`). -/
def lagLevels (P K : Nat) (uTab : Array Ival) : Nat → Array (Array Ival)
  | 0 => #[lagLevel P K K uTab #[]]
  | i + 1 =>
    let prev := lagLevels P K uTab i
    prev.push (lagLevel P K (K - (i + 1)) uTab (prev.getD i #[]))

/-- The whole Laguerre table of depth `K`: `(lagTable P K uTab).getD (K − k) #[]` is the level `k`
(`m ≤ K − k`), from the term table `uTab` of `u_j = (−s)^j/j!`, `j ≤ K`. -/
def lagTable (P K : Nat) (uTab : Array Ival) : Array (Array Ival) := lagLevels P K uTab K

/-- The radial factor `ψ_{k,m}(s) = (−1)^m (√s)^k √(m!/(m+k)!) L_m^{(k)}(s)`
(`RadialLaguerre.radialFactor`) from an enclosure `lag` of `L_m^{(k)}(s)` and the power table of
`√s`. -/
def radialFactorI (P k m : Nat) (lag : Ival) (rPow : Array Ival) : Ival :=
  if m % 2 == 1 then negI (mulI P (rPow.getD k zeroI) (mulI P (normFactorI P k m) lag))
  else mulI P (rPow.getD k zeroI) (mulI P (normFactorI P k m) lag)

/-- The radial factors `ψ_{k,m}(s)` for `m = 0, …, M` from the level `k` of the Laguerre table. -/
def radialRowI (P k M : Nat) (lagRow rPow : Array Ival) : Array Ival :=
  Array.ofFn fun m : Fin (M + 1) => radialFactorI P k m.val (lagRow.getD m.val zeroI) rPow

end GrotheQuad
