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
to `2^128` after each product; the energies are reported at scale `2^256`.  Matrices are nested
arrays (`Array (Array Fx)`, row-major) built by `Array.ofFn`, sums by `sumPairs` (a left fold).

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
  Nat.sqrt ((smS ^ 2 * (momentNumerator pU pV pW (n - c) c (n - e) e) ^ 2) /
    (smD ^ (2 * n) * entryFact n c e))

/-- The whole saved matrix `S_n` as numerators, `[c][e]`, from the power tables. -/
def savedMatrixNumsFrom (pU pV pW : Array Nat) (n : Nat) : Array (Array Nat) :=
  Array.ofFn fun c : Fin (n + 1) => Array.ofFn fun e : Fin (n + 1) => savedEntryNum pU pV pW n c.val e.val

/-- The whole saved matrix `S_n` as numerators over `S`, `[c][e]`. -/
def savedMatrixNums (n : Nat) : Array (Array Nat) :=
  savedMatrixNumsFrom (powers smU n) (powers smV n) (powers smW n) n

/-- A numerator over `S` as a fixed interval at scale `2^KFix`. -/
def savedToFx (num : Nat) : Fx :=
  ⟨fdiv ((num : Int) * pow2 KFix) smS, cdiv ((num : Int) * pow2 KFix) smS⟩

/-- The saved matrix `S_n` as fixed intervals. -/
def savedMatrixFx (n : Nat) : Array (Array Fx) := (savedMatrixNums n).map (·.map savedToFx)

/-- Read a matrix entry (`⟨0, 0⟩` outside). -/
def getFx (M : Array (Array Fx)) (i j : Nat) : Fx := (M.getD i #[]).getD j default

/-- `√((d+1)/c)` as a fixed interval (`c ≥ 1`): the integer square roots of
`⌊(d+1) 2^{2K} / c⌋` and of its successor. -/
def reflectFx (c d : Nat) : Fx :=
  ⟨(isqrtDown (((d + 1) * 2 ^ (2 * KFix)) / c) : Nat), (isqrtUp (((d + 1) * 2 ^ (2 * KFix)) / c + 1) : Nat)⟩

/-- Round a scale-`2^{2K}` pair outward to scale `2^K`. -/
def roundFx (p : Int × Int) : Fx := ⟨shDown KFix p.1, shUp KFix p.2⟩

/-- Exact addition of fixed intervals. -/
def addFx (a b : Fx) : Fx := ⟨a.lo + b.lo, a.hi + b.hi⟩

/-- `Σ_{k < n} f k` of pairs (exact). -/
def sumPairs (n : Nat) (f : Nat → Int × Int) : Int × Int :=
  (List.range n).foldl (fun acc k => addPair acc (f k)) (0, 0)

/-! ### The grade matrices -/

/-- The raw enclosure of the canonical entry `(c, d)` of grade `q` (`c ≤ d + 1`, `d ≤ q`), from
block `k = d + 1 − c`, row `j = q − d`, column `c` (`c − 1` for `k = 0`), rounded to scale `2^K`. -/
def canonicalEntry (raw : Raw) (q c d : Nat) : Fx :=
  roundFx (rawGet raw (d + 1 - c) (q - d) (if d + 1 - c == 0 then c - 1 else c))

/-- The reflected entry `(c, d)` with `c > d + 1`: `√((d+1)/c)` times the canonical `(d+1, c−1)`. -/
def reflectedEntry (raw : Raw) (q c d : Nat) : Fx :=
  roundFx (mulFx (canonicalEntry raw q (d + 1) (c - 1)) (reflectFx c d))

/-- The entry `A_q[c][d]` with the frozen correction `frozen q c d` (a fixed interval at scale
`2^K`, `⟨0, 0⟩` beyond grade 90). -/
def gradeEntry (raw : Raw) (frozen : Nat → Nat → Nat → Fx) (q c d : Nat) : Fx :=
  addFx (if c ≤ d + 1 then canonicalEntry raw q c d else reflectedEntry raw q c d) (frozen q c d)

/-- The grade-`q` matrix `A_q` (`[c][d]`, `c ≤ q+1`, `d ≤ q`). -/
def gradeMatrix (raw : Raw) (frozen : Nat → Nat → Nat → Fx) (q : Nat) : Array (Array Fx) :=
  Array.ofFn fun c : Fin (q + 2) => Array.ofFn fun d : Fin (q + 1) => gradeEntry raw frozen q c.val d.val

/-! ### The rotation -/

/-- `(S · A)[i][j] = Σ_k S[i][k] A[k][j]` for `S` an `(r × r)` saved matrix and `A` an
`(r × cols)` matrix of fixed intervals; result rounded to scale `2^K`. -/
def mulSA (S : Array (Array Fx)) (r : Nat) (A : Array (Array Fx)) (cols : Nat) : Array (Array Fx) :=
  Array.ofFn fun i : Fin r => Array.ofFn fun j : Fin cols =>
    roundFx (sumPairs r fun k => mulFx (getFx S i.val k) (getFx A k j.val))

/-- `(B · Tᵀ)[i][j] = Σ_k B[i][k] T[j][k]` for `B` `(rows × r)` and `T` an `(r × r)` saved matrix. -/
def mulBT (B : Array (Array Fx)) (rows : Nat) (T : Array (Array Fx)) (r : Nat) : Array (Array Fx) :=
  Array.ofFn fun i : Fin rows => Array.ofFn fun j : Fin r =>
    roundFx (sumPairs r fun k => mulFx (getFx B i.val k) (getFx T j.val k))

/-- The square of a fixed interval at scale `2^{2K}`. -/
def sqFxAcc (a : Fx) : Int × Int :=
  if a.lo ≥ 0 then (a.lo * a.lo, a.hi * a.hi)
  else if a.hi ≤ 0 then (a.hi * a.hi, a.lo * a.lo)
  else (0, max (a.lo * a.lo) (a.hi * a.hi))

/-- The energies of grade `q`: for `m = 0, …, 2q+1`, `E(2q+1−m, m) = Σ_{c+d=m} D[c][d]²` at
scale `2^{2K}`, from the rotated matrix `D` (`[c][d]`, `c ≤ q+1`, `d ≤ q`). -/
def gradeEnergies (D : Array (Array Fx)) (q : Nat) : Array (Int × Int) :=
  Array.ofFn fun m : Fin (2 * q + 2) =>
    sumPairs (q + 2) fun c => if c ≤ m.val && m.val - c ≤ q then sqFxAcc (getFx D c (m.val - c)) else (0, 0)

/-- One grade: assemble, rotate, energies. -/
def rotateGrade (raw : Raw) (frozen : Nat → Nat → Nat → Fx) (S1 S0 : Array (Array Fx)) (q : Nat) :
    Array (Int × Int) :=
  gradeEnergies (mulBT (mulSA S1 (q + 2) (gradeMatrix raw frozen q) (q + 1)) (q + 2) S0 (q + 1)) q

/-! ### The whole rotation, the comparison with the energy table, and the raw widths -/

/-- The saved matrices `S_0, …, S_n` as fixed intervals (computed once; `S_251` alone is
≈ 2 CPU-minutes, the whole set ≈ 2 CPU-hours). -/
def savedMatrices (n : Nat) : Array (Array (Array Fx)) :=
  Array.ofFn fun k : Fin (n + 1) => savedMatrixFx k.val

/-- The energies of every grade `q ≤ 250` (`[q][m]`, `m ≤ 2q + 1`, scale `2^{2K}`). -/
def allEnergies (raw : Raw) (frozen : Nat → Nat → Nat → Fx) (smats : Array (Array (Array Fx))) :
    Array (Array (Int × Int)) :=
  Array.ofFn fun q : Fin 251 =>
    rotateGrade raw frozen (smats.getD (q.val + 1) #[]) (smats.getD q.val #[]) q.val

/-- An upper bound of `|E − t|` for `E ∈ [e.1, e.2]` and `t ∈ [t.1, t.2]` (same scale). -/
def excursion (e t : Int × Int) : Int := max (max (e.2 - t.1) (t.2 - e.1)) 0

/-- The enclosure of `energy (n, m)`: the grade `q = (n + m − 1)/2` for odd `n + m`, else `0`
(no charge-one mode has an even total degree). -/
def energyAt (en : Array (Array (Int × Int))) (n m : Nat) : Int × Int :=
  if (n + m) % 2 = 1 then (en.getD ((n + m - 1) / 2) #[]).getD m (0, 0) else (0, 0)

/-- `Σ_{n, m < 502, n + 3m ≤ 501} excursion (energyAt en n m) (table n m)` (scale `2^{2K}`): the
head `headIdx 501` of the energy comparison. -/
def headExcursion (en : Array (Array (Int × Int))) (table : Nat → Nat → Int × Int) : Int :=
  (List.range 502).foldl (fun s n => (List.range 502).foldl
    (fun s m => if n + 3 * m ≤ 501 then s + excursion (energyAt en n m) (table n m) else s) s) 0

/-- The energy check: the ℓ¹ excursion of the head energies from the table (enclosed at scale
`2^{2K}`) is at most `epsNum` (scale `2^{2K}`). -/
def energyOK (raw : Raw) (frozen : Nat → Nat → Nat → Fx) (table : Nat → Nat → Int × Int)
    (epsNum : Int) : Bool :=
  headExcursion (allEnergies raw frozen (savedMatrices 251)) table ≤ epsNum

/-- `Σ_{c < q+2, d < q+1} (hi − lo)²` over the entries of a grade matrix (scale `2^{2K}`). -/
def gradeWidthSqOf (A : Array (Array Fx)) (q : Nat) : Int :=
  (List.range (q + 2)).foldl (fun s c => (List.range (q + 1)).foldl
    (fun s d => s + ((getFx A c d).hi - (getFx A c d).lo) ^ 2) s) 0

/-- `Σ_{q ≤ 250} Σ_{c, d} (hi − lo)²` over the grade matrices (scale `2^{2K}`): the squared ℓ²
distance of the lower ends `lo/2^K` to any family inside the enclosures is at most this over
`2^{2K}`. -/
def gradeWidthSq (raw : Raw) (frozen : Nat → Nat → Nat → Fx) : Int :=
  (List.range 251).foldl (fun s q => s + gradeWidthSqOf (gradeMatrix raw frozen q) q) 0

/-- The raw-width check: `gradeWidthSq ≤ bound`. -/
def rawDistOK (raw : Raw) (frozen : Nat → Nat → Nat → Fx) (bound : Int) : Bool :=
  gradeWidthSq raw frozen ≤ bound

/-! ### The checks of a grade block `[qLo, qHi)` -/

/-- The saved matrices `S_qLo, …, S_qHi` (index `q − qLo`). -/
def savedMatricesRange (qLo qHi : Nat) : Array (Array (Array Fx)) :=
  Array.ofFn fun i : Fin (qHi - qLo + 1) => savedMatrixFx (qLo + i.val)

/-- The energies of the grades `q ∈ [qLo, qHi)` (`[q − qLo][m]`, scale `2^{2K}`) from the matrices
`smats[i] = S_{qLo + i}`. -/
def blockEnergies (raw : Raw) (frozen : Nat → Nat → Nat → Fx) (smats : Array (Array (Array Fx)))
    (qLo qHi : Nat) : Array (Array (Int × Int)) :=
  Array.ofFn fun i : Fin (qHi - qLo) =>
    rotateGrade raw frozen (smats.getD (i.val + 1) #[]) (smats.getD i.val #[]) (qLo + i.val)

/-- The head bidegrees of the grade `q`: `m ≤ min (2q+1) (250 − q)` (`n + 3m ≤ 501`, `n = 2q+1−m`). -/
def headCount (q : Nat) : Nat := min (2 * q + 1) (250 - q) + 1

/-- `Σ_{q ∈ [qLo,qHi)} Σ_{m < headCount q} excursion (en[q − qLo][m]) (table (2q+1−m) m)`. -/
def blockExcursion (en : Array (Array (Int × Int))) (table : Nat → Nat → Int × Int) (qLo qHi : Nat) :
    Int :=
  (List.range (qHi - qLo)).foldl (fun s i => (List.range (headCount (qLo + i))).foldl
    (fun s m => s + excursion ((en.getD i #[]).getD m (0, 0)) (table (2 * (qLo + i) + 1 - m) m)) s) 0

/-- The energy check of a grade block: the ℓ¹ excursion of the head energies of the grades
`[qLo, qHi)` from the table is at most `epsNum` (scale `2^{2K}`). -/
def energyOKBlock (raw : Raw) (frozen : Nat → Nat → Nat → Fx) (table : Nat → Nat → Int × Int)
    (epsNum : Int) (qLo qHi : Nat) : Bool :=
  blockExcursion (blockEnergies raw frozen (savedMatricesRange qLo qHi) qLo qHi) table qLo qHi ≤ epsNum

/-- The excursions of the even bidegrees of the head (their energy is `0`): `Σ |table n m|`. -/
def evenExcursion (table : Nat → Nat → Int × Int) : Int :=
  (List.range 502).foldl (fun s n => (List.range 502).foldl
    (fun s m => if n + 3 * m ≤ 501 ∧ (n + m) % 2 = 0 then s + excursion (0, 0) (table n m) else s) s) 0

/-- `Σ_{q ∈ [qLo,qHi)} Σ_{c, d} (hi − lo)²` over the grade matrices of the block (scale `2^{2K}`). -/
def gradeWidthSqBlock (raw : Raw) (frozen : Nat → Nat → Nat → Fx) (qLo qHi : Nat) : Int :=
  (List.range (qHi - qLo)).foldl
    (fun s i => s + gradeWidthSqOf (gradeMatrix raw frozen (qLo + i)) (qLo + i)) 0

/-- The width check of a grade block. -/
def rawDistOKBlock (raw : Raw) (frozen : Nat → Nat → Nat → Fx) (bound : Int) (qLo qHi : Nat) : Bool :=
  gradeWidthSqBlock raw frozen qLo qHi ≤ bound

end GrotheQuad
