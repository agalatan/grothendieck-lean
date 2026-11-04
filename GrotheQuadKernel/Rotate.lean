import GrotheQuadKernel.Contract

/-!
# The smoothing rotation and the energies by bidegree

Master's `retainedSmoothed a0 = gradedHermite 251 (productionSmoothedCoeff (a0 + v))` uses the
**saved rational matrices** `S_n = productionSavedMatrixQ n` (`ProductionSmoothingRounding.lean`):

    savedEntryQ U V W D S n c e = ⌊√(S² · Num² / (D^{2n} · F))⌋ / S,
    Num = matrixMomentNumerator U V W (n−c) c (n−e) e
        = (n−c)! · c! · Σ_{k = (n−c)−e}^{min(n−e, n−c)} C(n−e, k) · C(e, (n−c)−k) ·
            U^k · V^{(n−e−k) + ((n−c)−k)} · W^{e − ((n−c)−k)},
    F = (n−c)! · c! · (n−e)! · e!,

with `U, V, W = 990987078608458638622543, 29500621630600679093812, 903440112391457239941125`
(the rounded `m00, m01, m11`), `D = 10²⁴`, `S = 10²²` (`FixedChaosRoundedEntries.lean`,
`FixedChaosMomentSum.lean`, `RationalSqrtFloor.lean`).  These entries are computed here
**exactly** (`savedEntryNum`: the integer numerator over `S`).

The grade-`q` coefficient matrix `A_q[c][d]` (`c ≤ q+1`, `d ≤ q`) is assembled from the raw
blocks as the archived finalizer did (`FINAL_ROTATION_AND_RESIDUAL_PROOF.md` §1): canonical
`c ≤ d+1` from block `k = d+1−c`, row `j = q−d`, column `c` (`c−1` for `k = 0`); non-canonical
`c > d+1` from block `k = c−d−1`, row `j = q+1−c`, column `d+1`, times the reflection factor
`√((d+1)/c)`; plus the frozen correction `v` for `q < 91`.  Then
`D_q = (S_{q+1} · A_q) · S_qᵀ` and `energy (2q+1−m, m) = Σ_{c+d=m} D_q[c][d]²`.

Fixed-point intervals at scale `2^128` (`Fx`), products exact at `2^256`, sums rounded outward
to `2^128` after each product; the energies are reported at scale `2^256`.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace GrotheQuad

/-- The saved scalars of `ProductionSmoothingRounding` (`smoothingU/V/W`, `smoothingScalarDen`,
`smoothingEntryScale`). -/
def smU : Nat := 990987078608458638622543
def smV : Nat := 29500621630600679093812
def smW : Nat := 903440112391457239941125
def smD : Nat := 1000000000000000000000000
def smS : Nat := 10000000000000000000000

/-- `C(n, k)` (`0` for `k > n`). -/
def natChoose (n k : Nat) : Nat :=
  if k > n then 0 else (List.range k).foldl (fun acc i => acc * (n - i) / (i + 1)) 1

/-- One summand `C(a,k) C(c,p−k) U^k V^{(a−k)+(p−k)} W^{c−(p−k)}` from the power tables. -/
def momentSummand (pU pV pW : Array Nat) (p a c k : Nat) : Nat :=
  natChoose a k * natChoose c (p - k) * pU.getD k 0 * pV.getD ((a - k) + (p - k)) 0 *
    pW.getD (c - (p - k)) 0

/-- `matrixMomentNumerator U V W p r a c` with the powers of `U, V, W` precomputed
(`pw.getD i` = base^i). -/
def momentNumerator (pU pV pW : Array Nat) (p r a c : Nat) : Nat :=
  factNat p * factNat r *
    (List.range (min a p + 1 - (p - c))).foldl (fun acc i => acc + momentSummand pU pV pW p a c ((p - c) + i)) 0

/-- The powers `base^0, …, base^n`. -/
def powers (base n : Nat) : Array Nat := Array.ofFn fun i : Fin (n + 1) => base ^ i.val

/-- `entryFactorial n c e = (n−c)! c! (n−e)! e!`. -/
def entryFact (n c e : Nat) : Nat := factNat (n - c) * factNat c * factNat (n - e) * factNat e

/-- The exact integer numerator of `savedEntryQ … n c e` over `S`. -/
def savedEntryNum (pU pV pW : Array Nat) (n c e : Nat) : Nat :=
  let num := momentNumerator pU pV pW (n - c) c (n - e) e
  Nat.sqrt ((smS ^ 2 * num ^ 2) / (smD ^ (2 * n) * entryFact n c e))

/-- The whole saved matrix `S_n` as numerators, row-major `(c, e)`. -/
def savedMatrixNums (n : Nat) : Array Nat :=
  let pU := powers smU n
  let pV := powers smV n
  let pW := powers smW n
  Id.run do
    let mut out : Array Nat := Array.mkEmpty ((n + 1) * (n + 1))
    for c in [0:n+1] do
      for e in [0:n+1] do
        out := out.push (savedEntryNum pU pV pW n c e)
    return out

/-- A numerator over `S` as a fixed interval at scale `2^KFix`. -/
def savedToFx (num : Nat) : Fx :=
  let v : Int := (num : Int) * pow2 KFix
  ⟨fdiv v smS, cdiv v smS⟩

/-- `√((d+1)/c)` as a fixed interval (`c ≥ 1`). -/
def reflectFx (c d : Nat) : Fx :=
  let r : Nat := ((d + 1) * (2 ^ (2 * KFix))) / c
  ⟨(isqrtDown r : Nat), (isqrtUp (r + 1) : Nat)⟩

/-- Round a scale-`2^{2K}` accumulator outward to scale `2^K`. -/
def roundFx (lo hi : Int) : Fx := ⟨shDown KFix lo, shUp KFix hi⟩

/-- Exact addition of fixed intervals. -/
def addFx (a b : Fx) : Fx := ⟨a.lo + b.lo, a.hi + b.hi⟩

/-- The grade-`q` matrix `A_q` (row-major `c ≤ q+1`, `d ≤ q`) from the raw enclosures
(`rawLo/rawHi` at scale `2^128`, the committed block layout) and the frozen correction
(`frozen q c d`, a fixed interval, `none` beyond grade 90). -/
def gradeMatrix (rawLo rawHi : Array Int) (frozen : Nat → Nat → Nat → Option Fx) (q : Nat) :
    Array Fx := Id.run do
  let offs := blockOffsets
  let mut out : Array Fx := Array.mkEmpty ((q + 2) * (q + 1))
  for c in [0:q+2] do
    for d in [0:q+1] do
      let v : Fx :=
        if c ≤ d + 1 then
          let k := d + 1 - c
          let j := q - d
          let cIdx := if k == 0 then c - 1 else c
          let idx := offs.getD k 0 + j * blockSide k + cIdx
          ⟨rawLo.getD idx 0, rawHi.getD idx 0⟩
        else
          let k := c - d - 1
          let j := q + 1 - c
          let idx := offs.getD k 0 + j * blockSide k + (d + 1)
          let g : Fx := ⟨rawLo.getD idx 0, rawHi.getD idx 0⟩
          let (pl, ph) := mulFx g (reflectFx c d)
          roundFx pl ph
      let v := match frozen q c d with
        | some f => addFx v f
        | none => v
      out := out.push v
  return out

/-- `(S · A)` for `S` an `(r × r)` saved matrix (numerators, row-major) and `A` an `(r × cols)`
matrix of fixed intervals; result rounded to scale `2^128`. -/
def mulSA (S : Array Fx) (r : Nat) (A : Array Fx) (cols : Nat) : Array Fx := Id.run do
  let mut out : Array Fx := Array.mkEmpty (r * cols)
  for i in [0:r] do
    for j in [0:cols] do
      let mut lo : Int := 0
      let mut hi : Int := 0
      for k in [0:r] do
        let s := S.getD (i * r + k) default
        if s.lo == 0 && s.hi == 0 then continue
        let (pl, ph) := mulFx s (A.getD (k * cols + j) default)
        lo := lo + pl
        hi := hi + ph
      out := out.push (roundFx lo hi)
  return out

/-- `(B · Tᵀ)` for `B` `(rows × r)` and `T` an `(r × r)` saved matrix: `[i][j] = Σ_k B[i][k] T[j][k]`. -/
def mulBT (B : Array Fx) (rows : Nat) (T : Array Fx) (r : Nat) : Array Fx := Id.run do
  let mut out : Array Fx := Array.mkEmpty (rows * r)
  for i in [0:rows] do
    for j in [0:r] do
      let mut lo : Int := 0
      let mut hi : Int := 0
      for k in [0:r] do
        let t := T.getD (j * r + k) default
        if t.lo == 0 && t.hi == 0 then continue
        let (pl, ph) := mulFx (B.getD (i * r + k) default) t
        lo := lo + pl
        hi := hi + ph
      out := out.push (roundFx lo hi)
  return out

/-- The square of a fixed interval at scale `2^256`. -/
def sqFxAcc (a : Fx) : Int × Int :=
  if a.lo ≥ 0 then (a.lo * a.lo, a.hi * a.hi)
  else if a.hi ≤ 0 then (a.hi * a.hi, a.lo * a.lo)
  else (0, max (a.lo * a.lo) (a.hi * a.hi))

/-- The energies of grade `q`: for `m = 0, …, 2q+1`, `E(2q+1−m, m) = Σ_{c+d=m} D[c][d]²` at
scale `2^256`, from the rotated matrix `D` (row-major `(q+2) × (q+1)`). -/
def gradeEnergies (D : Array Fx) (q : Nat) : Array (Int × Int) := Id.run do
  let mut out : Array (Int × Int) := Array.replicate (2 * q + 2) (0, 0)
  for c in [0:q+2] do
    for d in [0:q+1] do
      let (l, h) := sqFxAcc (D.getD (c * (q + 1) + d) default)
      let m := c + d
      let (al, ah) := out.getD m (0, 0)
      out := out.set! m (al + l, ah + h)
  return out

/-- One grade: assemble, rotate, energies. -/
def rotateGrade (rawLo rawHi : Array Int) (frozen : Nat → Nat → Nat → Option Fx)
    (S1 S0 : Array Fx) (q : Nat) : Array (Int × Int) :=
  let A := gradeMatrix rawLo rawHi frozen q
  let B := mulSA S1 (q + 2) A (q + 1)
  let D := mulBT B (q + 2) S0 (q + 1)
  gradeEnergies D q

end GrotheQuad
