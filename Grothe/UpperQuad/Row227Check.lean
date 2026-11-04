import GrotheQuadKernel

/-!
# The quadrature checker at the row-227 node (validation, issue #303)

Runs the arithmetic core of `GrotheQuadKernel` at the pinned midpoint shift of the row-227 source
node (`A0 = midpoint / 2^1024`, `OriginalMomentSeedData`; the actual shift is within `2/10^18`
of it, `ConditionalSourceRow227Shift.actual_shift_midpoint_error`; the profile is positive there,
`profile_pos`) and compares the enclosures with the saved binary64 row.  Everything here is
`#eval` diagnostics: no theorem, no native fact.  The enclosures are written to
`handoff/quad-checker/row227-lean.txt` (git-ignored) for `tools/quad_checker_reference.py`.

Data: `data/quad-checker/row227.json` (provenance in `data/quad-checker/README.md`).

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad.Row227Check

open GrotheQuad

/-- The working precision of the recurrence (bits); `main` takes it as a parameter. -/
def K0 : Nat := 1024

/-- The pinned midpoint numerator: `A0 = midpoint / 2^1024` (exact at `K = 1024`). -/
def midpoint : Int :=
  745223477858218358216912212641266730157341474621088198344478146520493346762330199682104347456794734546704971706801931386446023870299332861557415410890910935615011803888431995145876294857912847980205755443718929589765802167467652182988251456597755231733278543560240716478379335097867352624625212010260961982755

def aI (K : Nat) : Ival := ofDyadic K midpoint 1024

/-- `π ∈ [3.14159265358979323846, 3.14159265358979323847]` (`Real.pi_gt_d20`, `pi_lt_d20`). -/
def piI (K : Nat) : Ival :=
  ⟨(ofRatND K 314159265358979323846 (10 ^ 20)).lo, (ofRatND K 314159265358979323847 (10 ^ 20)).hi⟩

/-- The first 41 saved words (`c + d ≤ 10`) of the row (`data/quad-checker/row227.json`). -/
def savedPrefix : Array Nat := #[4607048283161364208, 13816332819475250921, 4593491561678338782,
  4583866687318541586, 13803326916376756577, 13800038740493620859, 4571316454858533944,
  4564298394642275321, 4571096694274165248, 13787771012364772377, 13779634736238480448,
  13789338921173320687, 4559094142728715678, 4550159883647946430, 4547435146359323918,
  4561737578546033238, 13778076560847923421, 13768879325648443625, 13765357349862585108,
  13781342425980164606, 4551080539607632324, 4541857574227445298, 4538179871186122490,
  4536524924316147393, 4554452622266140356, 13771775258857937545, 13762766344746398641,
  13758898727429223560, 13756811891364406594, 13774918698261469619, 4545656778989763967,
  4536938880992720681, 4533199805964438496, 4531241472099148937, 4530281863688640201,
  4549084214580995165, 13767400997837541709, 13758865243874035068, 13754842906135235455,
  13752315712863187755, 13750804234143082919]

/-- The largest `c + d` of the recurrence triangle and the largest `d` of the stored set. -/
def D : Nat := 531
def dMax : Nat := 265

/-- Terms of the seed series (`x = A0² ≈ 17.2`, so `N + 3 > x` holds from `N = 15`; 200 terms
leave a tail far below `2^{-1024}`). -/
def seedTerms : Nat := 200

/-- Depth of the ratio recurrence (`D + 300`). -/
def ratioDepth : Nat := 831

/-- Decimal digits printed. -/
def digits : Nat := 40

def bandOf (p : Nat × Nat) : Nat := (p.1 + p.2) / 50

def main (K : Nat) : IO Unit := do
  IO.println s!"=== precision K = {K} ==="
  let t0 ← IO.monoMsNow
  let aI := aI K
  let piI := piI K
  let x := sqI K aI
  let j0 := seedJ0I K seedTerms x
  let scalar := seedScalarI K seedTerms piI aI
  let rs := ratiosI K x ratioDepth
  -- force the seed and ratios before taking the time (pure lets may be floated to their use)
  IO.println s!"r_0 = {toDecimal K digits (rs.getD 0 zeroI)}, r_530 = {toDecimal K 20 (rs.getD 530 zeroI)}"
  let t1 ← IO.monoMsNow
  let encl := canonicalTriangleI K scalar false 0 aI rs D dMax
  let ssq := sumSqUpper encl
  IO.println s!"sum of squares (upper) = {toDecimal (2 * K) 20 ⟨ssq, ssq⟩}"
  let t2 ← IO.monoMsNow
  let pairs := canonicalPairs D dMax
  IO.println s!"row 227 at A0 = {toDecimal K digits aI}"
  IO.println s!"x = A0^2 = {toDecimal K digits x}"
  IO.println s!"J0(x) = {toDecimal K digits j0}"
  IO.println s!"S(A0) = {toDecimal K digits scalar}  (width 2^{widthLog2 scalar - K})"
  IO.println s!"pairs: {pairs.size} (expected 35777); seed+ratios {t1 - t0} ms, triangle+scalar+sum {t2 - t1} ms"
  for i in [0:8] do
    let p := pairs.getD i (0, 0)
    IO.println s!"  I[{p.1},{p.2}] = {toDecimal K digits (encl.getD i zeroI)}"
  -- width statistics per band of c + d
  let mut bandMax : Array Int := Array.replicate 11 (-100000)
  for i in [0:pairs.size] do
    let b := bandOf (pairs.getD i (0, 0))
    bandMax := bandMax.set! b (max (bandMax.getD b 0) (widthLog2 (encl.getD i zeroI)))
  for b in [0:11] do
    IO.println s!"  max width for c+d in [{50*b},{50*b+49}]: 2^{bandMax.getD b 0 - K}"
  -- the saved prefix
  let table := savedPrefix.map (word64ToIval K)
  let prefixEncl := encl.extract 0 table.size
  let md := maxDistUpper prefixEncl table
  let l1 := l1Upper prefixEncl table
  IO.println s!"saved prefix ({table.size} words): max |encl - saved| ≤ {toDecimal K 20 ⟨md, md⟩}, ℓ¹ ≤ {toDecimal K 20 ⟨l1, l1⟩}"
  -- dump for the Python comparison (at the reference precision only)
  if K != K0 then return
  IO.FS.createDirAll "handoff/quad-checker"
  let h ← IO.FS.Handle.mk "handoff/quad-checker/row227-lean.txt" IO.FS.Mode.write
  for i in [0:pairs.size] do
    let p := pairs.getD i (0, 0)
    let e := encl.getD i zeroI
    let pI : Int := ((10 : Nat) ^ 60 : Nat)
    h.putStrLn s!"{p.1} {p.2} {fmtDecimal (shDown K (e.lo * pI)) 60} {fmtDecimal (shUp K (e.hi * pI)) 60}"
  h.flush
  let t3 ← IO.monoMsNow
  IO.println s!"wrote handoff/quad-checker/row227-lean.txt ({t3 - t2} ms)"

#eval main K0
#eval main 512
#eval main 256

/-! ### Gauss–Legendre and Laguerre sanity checks (small, exact cases) -/

/-- The 3-point rule: roots `0, ±√(3/5) = ±0.7745966692414834…`, brackets of width `10^{-15}`. -/
def rule3 : Array Bracket :=
  let r : Int := (ofRatND 64 7745966692414833 (10 ^ 16)).lo
  let r' : Int := (ofRatND 64 7745966692414834 (10 ^ 16)).hi
  #[⟨-r', -r⟩, ⟨-(pow2 64 / 10 ^ 15), pow2 64 / 10 ^ 15⟩, ⟨r, r'⟩]

def gaussDemo : IO Unit := do
  let K := 64
  IO.println s!"rule3 OK: {ruleOK K 3 rule3}"
  let nw := ruleNodesWeights K 3 rule3
  for (x, w) in nw do
    IO.println s!"  node {toDecimal K 16 x} weight {toDecimal K 16 w}  (5/9, 8/9, 5/9)"
  -- exactness: ∫_{-1}^{1} x^4 = 2/5
  let v := gaussSumI K (nw.map (·.2)) (nw.map fun (x, _) => powI K x 4)
  IO.println s!"  Σ w x^4 = {toDecimal K 16 v}  (exact 0.4)"
  -- the physical panel [1, 2]: ∫ e^{-s} ds = e^{-1} - e^{-2} = 0.2325441579…
  let p : Panel := ⟨1, 2, 3, rule3⟩
  let pw := panelNodesWeights K p
  let v := gaussSumI K (pw.map (·.2)) (pw.map fun (s, _) => expNegI K 40 s)
  IO.println s!"  panel [1,2], 3 points: Σ W exp(-s) = {toDecimal K 16 v}  (0.2325441579, error ~1e-6)"
  -- the radial factor ψ_{1,2}(3/2) = √(2!/3!) · √(3/2) · L_2^{(1)}(3/2) = -0.265165…
  let s := ofRatND K 3 2
  let row := radialRowI K 1 2 s
  IO.println s!"  psi(k=1, m=0,1,2; s=1.5): {row.map (toDecimal K 12)}  (expect 1.224744871, -0.433012702, -0.265165043)"

#eval gaussDemo

end Grothe.UpperQuad.Row227Check
