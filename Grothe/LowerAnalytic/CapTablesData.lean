import Mathlib.Data.Rat.Floor
import Mathlib.Data.Nat.Choose.Basic
import GrotheCapsKernel.CapCheck

/-!
# Computable shared tables for the node-cap checker

These rational enclosures and fixed-point tables are independent of Gaussian
analysis and certificate soundness. Their proofs remain in `CapTables.lean`
and `CapTablesMk.lean`. All existing declaration names and exact arithmetic
are preserved.
-/

namespace Grothe.LowerAnalytic.CapTab

/-- Sum of coefficient lists. -/
def padd : List ℚ → List ℚ → List ℚ
  | [], q => q
  | a :: p, [] => a :: p
  | a :: p, b :: q => (a + b) :: padd p q

/-- Scalar multiple. -/
def psmul (c : ℚ) (p : List ℚ) : List ℚ := p.map (c * ·)

/-- Product. -/
def pmul : List ℚ → List ℚ → List ℚ
  | [], _ => []
  | a :: p, q => padd (psmul a q) (0 :: pmul p q)

/-- `∫_α^β t^d p(t) dt`. -/
def pint : List ℚ → ℕ → ℚ → ℚ → ℚ
  | [], _, _, _ => 0
  | a :: p, d, α, β => a * (β ^ (d + 1) - α ^ (d + 1)) / (d + 1) + pint p (d + 1) α β

/-- `(Σ_{m<n} u^m/m!, u^n/n!)` as polynomials. -/
def expPoly (u : List ℚ) : ℕ → List ℚ × List ℚ
  | 0 => ([], [1])
  | n + 1 => let r := expPoly u n; (padd r.1 r.2, psmul (1 / (n + 1 : ℚ)) (pmul r.2 u))

/-- Round down to the grid `2^{-P}`. -/
def rdDown (q : ℚ) (P : ℕ) : ℚ := (⌊q * 2 ^ P⌋ : ℚ) / 2 ^ P

/-- Round up to the grid `2^{-P}`. -/
def rdUp (q : ℚ) (P : ℕ) : ℚ := (⌈q * 2 ^ P⌉ : ℚ) / 2 ^ P

/-- The working precision. -/
def prec : ℕ := 260

/-- `(Σ_{m<n} x^m/m!, x^n/n!)`. -/
def expTay (x : ℚ) : ℕ → ℚ × ℚ
  | 0 => (0, 1)
  | n + 1 => let r := expTay x n; (r.1 + r.2, r.2 * x / (n + 1))

/-- The remainder `|x|^n (n+1)/(n! n)` of `Real.exp_bound`. -/
def expRem (y : ℚ) (n : ℕ) : ℚ := y ^ n * ((n + 1 : ℚ) / (n.factorial * n))

/-- Squaring of a nonnegative enclosure, `k` times. -/
def sqIter : ℕ → ℚ × ℚ → ℚ × ℚ
  | 0, e => e
  | k + 1, e => let f := sqIter k e; (rdDown (f.1 ^ 2) prec, rdUp (f.2 ^ 2) prec)

/-- An enclosure of `e^{−x}` for `0 ≤ x ≤ 1024`. -/
def expNegEnc (x : ℚ) : ℚ × ℚ :=
  let y := x / 2 ^ 10
  let T := (expTay (-y) 30).1
  let E := expRem y 30
  sqIter 10 (max 0 (rdDown (T - E) prec), rdUp (T + E) prec)

/-- The number of Taylor terms for `|u| ≤ U`. -/
def radTerms (U : ℚ) : ℕ := if U ≤ 1 / 16 then 16 else if U ≤ 1 / 2 then 30 else 40

/-- The radial enclosure of one `k` from the shared data. -/
def radOne (a b c E : ℚ) (X : ℚ × ℚ) (Ms : List ℚ) (k : ℕ) : ℚ × ℚ :=
  let base := 2 * ((List.range (k + 2)).map fun p =>
    ((k + 1).choose p : ℚ) * c ^ (k + 1 - p) * Ms.getD p 0).sum
  let rem := E * (2 * (b ^ (k + 2) - a ^ (k + 2)) / (k + 2))
  let jl := base - rem
  let jh := base + rem
  (rdDown (if 0 ≤ jl then X.1 * jl else X.2 * jl) prec,
    rdUp (if 0 ≤ jh then X.2 * jh else X.1 * jh) prec)

/-- **Enclosures of `∫_a^b 2 r^{k+1} e^{−r²} dr` for `k = 0, …, 16`.** -/
def radEncList (a b : ℚ) : List (ℚ × ℚ) :=
  let c := (a + b) / 2
  let h := (b - a) / 2
  let U := 2 * c * h + h ^ 2
  if U ≤ 1 then
    let n := radTerms U
    let S := (expPoly [0, -2 * c, -1] n).1
    let E := expRem U n
    let X := expNegEnc (c ^ 2)
    let Ms := (List.range 18).map fun p => pint S p (-h) h
    (List.range 17).map (radOne a b c E X Ms)
  else (List.range 17).map fun k => (0, 2 * (b - a) * b ^ (k + 1))

/-- **The enclosure of `∫_a^b 2 r^{k+1} e^{−r²} dr`.** -/
def radEnc (a b : ℚ) (k : ℕ) : ℚ × ℚ := (radEncList a b).getD k (0, 0)

/-- Enclosures of `(J(m), J(m+1))`, `J(m) = ∫_R^∞ 2 r^m e^{−r²}`, from an enclosure `X` of `e^{−R²}`. -/
def tailPair (R : ℚ) (X : ℚ × ℚ) : ℕ → (ℚ × ℚ) × (ℚ × ℚ)
  | 0 => ((0, X.2 / R), X)
  | m + 1 =>
    let p := tailPair R X m
    (p.2, (R ^ (m + 1) * X.1 + ((m : ℚ) + 1) / 2 * p.1.1,
      R ^ (m + 1) * X.2 + ((m : ℚ) + 1) / 2 * p.1.2))

/-- **The enclosure of `∫_R^∞ 2 r^{k+1} e^{−r²} dr`.** -/
def tailEnc (R : ℚ) (k : ℕ) : ℚ × ℚ :=
  let p := (tailPair R (expNegEnc (R ^ 2)) (k + 1)).1
  (rdDown p.1 prec, rdUp p.2 prec)

/-- A complex ball: center `re + i·im`, radius `rad`. -/
structure CBall where
  re : ℚ
  im : ℚ
  rad : ℚ

/-- `|re| + |im|`. -/
def nrm1 (B : CBall) : ℚ := |B.re| + |B.im|

/-- The angular precision. -/
def angP : ℕ := 128

/-- Product of balls. -/
def cmul (A B : CBall) : CBall :=
  ⟨A.re * B.re - A.im * B.im, A.re * B.im + A.im * B.re, A.rad * (nrm1 B + B.rad) + B.rad * nrm1 A⟩

/-- Round the center down to the grid `2^{-angP}`, enlarging the radius. -/
def cround (B : CBall) : CBall :=
  ⟨rdDown B.re angP, rdDown B.im angP,
    rdUp (B.rad + (B.re - rdDown B.re angP) + (B.im - rdDown B.im angP)) angP⟩

/-- `(Σ_{m<n} (iy)^m/m!, (iy)^n/n!)` as pairs `(re, im)`. -/
def expITay (y : ℚ) : ℕ → (ℚ × ℚ) × (ℚ × ℚ)
  | 0 => ((0, 0), (1, 0))
  | n + 1 =>
    let r := expITay y n
    ((r.1.1 + r.2.1, r.1.2 + r.2.2), (-r.2.2 * y / (n + 1), r.2.1 * y / (n + 1)))

/-- The Taylor ball of `e^{iy}`. -/
def expIBall (y : ℚ) : CBall :=
  let r := expITay y 30
  ⟨r.1.1, r.1.2, expRem |y| 30⟩

/-- `piLo < π`, 30 digits. -/
def piLo : ℚ := 3141592653589793238462643383279 / 10 ^ 30

/-- `π < piHi`, 30 digits. -/
def piHi : ℚ := 3141592653589793238462643383280 / 10 ^ 30

/-- A ball containing `e^{2πim/N}` (`m ≤ N`). -/
def unitBall (N m : ℕ) : CBall :=
  let yr : ℚ := 2 * piLo * m / (8 * N)
  let y0 := rdDown yr angP
  let δ := (yr - y0) + 2 * (piHi - piLo) * m / (8 * N)
  let B0 := expIBall y0
  let B := (⟨B0.re, B0.im, rdUp (B0.rad + δ) angP⟩ : CBall)
  let B2 := cround (cmul B B)
  let B4 := cround (cmul B2 B2)
  cround (cmul B4 B4)

/-- Interval product. -/
def mulQ (x y : ℚ × ℚ) : ℚ × ℚ :=
  (min (min (x.1 * y.1) (x.1 * y.2)) (min (x.2 * y.1) (x.2 * y.2)),
    max (max (x.1 * y.1) (x.1 * y.2)) (max (x.2 * y.1) (x.2 * y.2)))

/-- The angular enclosures from balls `Ba`, `Bb` containing the (shifted) cell ends `e^{2πi(nj mod N)/N}` (see `angEnc`). -/
def angFrom (n : ℕ) (Ba Bb : CBall) : (ℚ × ℚ) × (ℚ × ℚ) :=
  let sg : ℚ := (-1) ^ n
  let dsin : ℚ × ℚ := (Bb.im - Bb.rad - (Ba.im + Ba.rad), Bb.im + Bb.rad - (Ba.im - Ba.rad))
  let dcos : ℚ × ℚ := (Ba.re - Ba.rad - (Bb.re + Bb.rad), Ba.re + Ba.rad - (Bb.re - Bb.rad))
  let f : ℚ × ℚ := (1 / (2 * piHi * n), 1 / (2 * piLo * n))
  let c := mulQ (mulQ (sg, sg) dsin) f
  let s := mulQ (mulQ (sg, sg) dcos) f
  ((rdDown c.1 angP, rdUp c.2 angP), (rdDown s.1 angP, rdUp s.2 angP))

/-- **The angular enclosures** `((1/2π)∫cos(nθ), (1/2π)∫sin(nθ))` over `[θⱼ, θⱼ₊₁]`, `n ≥ 0`. -/
def angEnc (N n j : ℕ) : (ℚ × ℚ) × (ℚ × ℚ) :=
  if n = 0 then ((1 / N, 1 / N), (0, 0)) else
  angFrom n (unitBall N (n * j % N)) (unitBall N (n * (j + 1) % N))

/-- The balls of `e^{2πim/N}`, `m < N` (shared by all `n`, `j`). -/
def unitTable (N : ℕ) : Array CBall := ((List.range N).map (unitBall N)).toArray

/-- `angEnc` from a precomputed ball table. -/
def angEncWith (T : Array CBall) (N n j : ℕ) : (ℚ × ℚ) × (ℚ × ℚ) :=
  if n = 0 then ((1 / N, 1 / N), (0, 0)) else
  angFrom n (T.getD (n * j % N) ⟨0, 0, 0⟩) (T.getD (n * (j + 1) % N) ⟨0, 0, 0⟩)

end Grothe.LowerAnalytic.CapTab

namespace GrotheKernel

open Grothe.LowerAnalytic

/-- **The enclosure of `radI a b m = ∫_a^b 2 r^{m+1} e^{−r²} dr`** (`radEnc_sound`). -/
def radEnc (a b : ℚ) (m : ℕ) : ℚ × ℚ := CapTab.radEnc a b m

/-- **The enclosure of `tailI R m = ∫_R^∞ 2 r^{m+1} e^{−r²} dr`** (`tailEnc_sound`). -/
def tailEnc (R : ℚ) (m : ℕ) : ℚ × ℚ := CapTab.tailEnc R m

/-- The sign change of the sine part for `n < 0`. -/
def angSign (n : ℤ) (e : (ℚ × ℚ) × (ℚ × ℚ)) : (ℚ × ℚ) × (ℚ × ℚ) :=
  if 0 ≤ n then e else (e.1, (-e.2.2, -e.2.1))

/-- **The enclosures of `(angC, angS)` on the `j`-th angular cell `[thN N j, thN N (j+1)]`**
(`angEnc_sound`). -/
def angEnc (N j : ℕ) (n : ℤ) : (ℚ × ℚ) × (ℚ × ℚ) := angSign n (CapTab.angEnc N n.natAbs j)

/-- `angEnc` from the shared ball table `CapTab.unitTable N` (`angEncWith_unitTable`). -/
def angEncWith (T : Array CapTab.CBall) (N j : ℕ) (n : ℤ) : (ℚ × ℚ) × (ℚ × ℚ) :=
  angSign n (CapTab.angEncWith T N n.natAbs j)

end GrotheKernel

namespace Grothe.LowerAnalytic

open GrotheKernel

/-- A rational interval as a fixed-point interval (outward). -/
def toIv (p : ℚ × ℚ) : Ival := ⟨ofRatLo p.1, ofRatHi p.2⟩

/-- **The shared tables.** -/
def mkTables (Nr N : ℕ) (h : ℚ) : Tables :=
  let ut := CapTab.unitTable N
  ⟨((List.range Nr).map fun (i : ℕ) =>
      ((CapTab.radEncList ((i : ℚ) * h) (((i : ℚ) + 1) * h)).map toIv).toArray).toArray,
   ((List.range 17).map fun m => toIv (CapTab.tailEnc (Nr * h) m)).toArray,
   ((List.range N).map fun (j : ℕ) => ((List.range 13).map fun (n : ℕ) =>
      let e := GrotheKernel.angEncWith ut N j (n : ℤ); (toIv e.1, toIv e.2)).toArray).toArray⟩

end Grothe.LowerAnalytic
