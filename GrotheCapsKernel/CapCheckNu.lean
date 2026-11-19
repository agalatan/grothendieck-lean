import GrotheCapsKernel.CapCheck

/-!
# The cap checker for a witness with an identity tail (Mathlib-free, precompiled)

A second checker beside `CapCheck.lean`, for the fibre potential with the tail `ν` (in hat units):
the integrand of the potential is `Ψ_ν(L + p, L − p) − ν`, with the pair potential
`Ψ_ν(A, B) = sup_{|f| = |g| = 1} Re(f̄A) + Re(ḡB) + ν Re(f̄g)`.

**Cell data** (`GridDataNu`): the tail `ν` (a rational), dyadic prices `d₂ = D2/2⁵⁰`,
`d₃ = D3/2⁵⁰`, the correction coefficient `g = G/2¹⁰⁰` and the ring bound `rl = RL/2⁵⁰ ≥ |L|`.
With `eᵢ = dᵢ − ν`, `σ = e₂ + e₃`, `Δ = d₂d₃ − ν²` the cell majorant is

  `Ψ_ν(L + p, L − p) ≤ (d₂ + d₃)/2 + c_L|L|² + c_P|p|² + 2τx − (g/16)(4x − c₀ − c₁|L|²)²`,
  `x = Re(p L̄)`, `c_L = (d₂ + d₃ + 2ν)/(2Δ)`, `c_P = (d₂ + d₃ − 2ν)/(2Δ)`, `τ = (d₃ − d₂)/(2Δ)`,
  `c₀ = (e₂ − e₃)σΔ/(e₂e₃)`, `c₁ = −4ν(d₂ − d₃)/(e₂e₃)` (the exact centre),

valid under the **cell condition** (`cellOKNu`): `d₂ > 0`, `Δ > 0`, and either `g = 0`, or
`e₂, e₃ > 0` and the inequality without division

  `g Δ (Δ(σ² + 2 rl |e₃ − e₂|)² + 16 rl² (e₂e₃)²) ≤ 8σ(e₂e₃)²`.

`gNum` is the largest `G` that satisfies it (`0` when `e₂ ≤ 0` or `e₃ ≤ 0`): the rounded-down
coefficient of the certificate.  Expanded, the majorant has **seven cell weights** (`cellW`), indexed
by the polynomial they multiply:

  `0`: `c_P` (`Gᵢⱼ`),  `1`: `(d₂ + d₃)/2 − g c₀²/16` (`1`),  `2`: `τ + g c₀/4` (`uⱼ`),
  `3`: `g` (`−uᵢuⱼ`),  `4`: `c_L − g c₀c₁/8` (`|L|²`),  `5`: `g c₁/4` (`|L|² uⱼ`),
  `6`: `−g c₁²/16` (`|L|⁴`).

At the common scale `s = den(ν)·2⁵⁰` every quantity is an integer, and each weight is enclosed at
`2⁻¹²⁸` (`qI`).  Outside the grid the prices are `d₂ = d₃ = 1` with `g = 0`: `c_L = 1/(1 − ν)`,
`c_P = 1/(1 + ν)`.  The constant `−ν` of the integrand is added once (`entryOfNu`).

Soundness (`Grothe/LowerAnalytic/CapCheckNuSound.lean`): the cell condition is `MajCell`, the weights
are `majWt`, and the cell majorant is `psiT_le_majPoly` of `CapMajorant.lean`.

**Relation to `CapCheck.lean`.**  At `ν = 0` the weights `5`, `6` vanish and `0`, `4` coincide, and
the majorant is the one of `cellOK`/`wQ`.  The two checkers are not definitionally equal there:
today's cell stores rounded reciprocals `na ≥ 1/pa`, `nb ≥ 1/pb` and the floor of `8/D`, while this
one encloses `1/Δ` and takes the exact floor of the cell inequality.
-/

namespace GrotheKernel

/-! ### Grid data -/

/-- A uniform grid with the cell data of a tail `ν`, stored by numerators: `d₂ = D2/2⁵⁰`,
`d₃ = D3/2⁵⁰`, `g = G/2¹⁰⁰`, the ring bound `rl = RL/2⁵⁰`. -/
structure GridDataNu where
  Nr : Nat
  N : Nat
  h : Rat
  nu : Rat
  D2 : Nat → Nat → Nat
  D3 : Nat → Nat → Nat
  G : Nat → Nat → Nat
  RL : Nat → Nat

def GridDataNu.d2 (gd : GridDataNu) (i j : Nat) : Rat := (gd.D2 i j : Rat) / two50
def GridDataNu.d3 (gd : GridDataNu) (i j : Nat) : Rat := (gd.D3 i j : Rat) / two50
def GridDataNu.gg (gd : GridDataNu) (i j : Nat) : Rat := (gd.G i j : Rat) / two100
def GridDataNu.rl (gd : GridDataNu) (i : Nat) : Rat := (gd.RL i : Rat) / two50

/-- The integer cell data at the common scale `s = den(ν)·2⁵⁰`: `dᵢ = Ddᵢ/s`, `ν = Nu/s`,
`eᵢ = Eᵢ/s`, `Δ = Dl/s²`, `σ = Sg/s`. -/
structure CellInts where
  s : Int
  Dd2 : Int
  Dd3 : Int
  Nu : Int
  E2 : Int
  E3 : Int
  Dl : Int
  Sg : Int

def cellInts (nu : Rat) (D2 D3 : Nat) : CellInts :=
  let b : Int := nu.den
  let s : Int := b * (two50 : Int)
  let Dd2 : Int := b * D2
  let Dd3 : Int := b * D3
  let Nu : Int := nu.num * (two50 : Int)
  let E2 := Dd2 - Nu
  let E3 := Dd3 - Nu
  ⟨s, Dd2, Dd3, Nu, E2, E3, Dd2 * Dd3 - Nu * Nu, E2 + E3⟩

/-- `|x|` on `Int`. -/
def iabs (x : Int) : Int := if x < 0 then -x else x

/-- The two sides of the cell inequality cleared of denominators, for `g = G/2¹⁰⁰`:
`G · cellDen ≤ cellNum`, with `Rr = den(ν)·RL` the ring bound at the scale `s`. -/
def cellDen (c : CellInts) (Rr : Int) : Int :=
  let P := c.E2 * c.E3
  let Q := c.Sg * c.Sg + 2 * Rr * iabs (c.E3 - c.E2)
  c.Dl * (c.Dl * (Q * Q) + 16 * (Rr * Rr) * (P * P))

def cellNum (c : CellInts) : Int :=
  let P := c.E2 * c.E3
  8 * (two100 : Int) * c.Sg * (P * P) * (c.s * c.s * c.s)

/-- The largest `G` with `G · cellDen ≤ cellNum` (the coefficient `γ*(rl)` rounded down to a multiple
of `2⁻¹⁰⁰`), or `0` when `e₂ ≤ 0`, `e₃ ≤ 0` or `Δ ≤ 0`. -/
def gNum (c : CellInts) (Rr : Int) : Nat :=
  if c.E2 ≤ 0 ∨ c.E3 ≤ 0 ∨ c.Dl ≤ 0 then 0 else (cellNum c / cellDen c Rr).toNat

/-- **The cell condition**: `d₂ > 0`, `Δ > 0`, the ring bound, and either `G = 0` (when `e₂ ≤ 0` or
`e₃ ≤ 0`), or the cell inequality. -/
def cellOKNu (gd : GridDataNu) (ell beta : Rat) (i j : Nat) : Bool :=
  let c := cellInts gd.nu (gd.D2 i j) (gd.D3 i j)
  let Rr : Int := (gd.nu.den : Int) * gd.RL i
  decide (0 < c.Dd2) && decide (0 < c.Dl) &&
    decide (rlb ell beta ((i + 1) * gd.h) ≤ gd.rl i) &&
    (if c.E2 ≤ 0 ∨ c.E3 ≤ 0 then decide (gd.G i j = 0)
      else decide ((gd.G i j : Int) * cellDen c Rr ≤ cellNum c))

/-- The grid check: a tail `0 ≤ ν < 1` and every cell condition. -/
def gridOKNu (gd : GridDataNu) (ell beta : Rat) : Bool :=
  decide (0 < gd.h) && decide (0 < gd.N) && decide (0 < gd.Nr) && decide (0 ≤ gd.nu) &&
    decide (gd.nu < 1) &&
    (List.range gd.Nr).all fun i => (List.range gd.N).all fun j => cellOKNu gd ell beta i j

/-! ### Prices from a recipe (search only: soundness never depends on these values)

The prices mirror the generator of the certificate, so that a stored cap is reproduced within its
margin.  Per cell it forms three means of the recipe at its anchor (`A = L + p`, `B = L − p`,
`e = Σ |B·f|²` over the variance vectors):

  `σ = ⟨|A|² + e⟩`,  `τ = ⟨|B|² + e⟩`,  `ρ = ⟨Re(A B̄) − e⟩`,

by one of two rules, and takes the prices that minimise the cell objective

  `(d₂ + d₃)/2 + (d₃σ + d₂τ + 2νρ)/(2(d₂d₃ − ν²))`

by a damped Newton iteration from `(√σ + ν, √τ + ν)` (`dualPrices`).  The two rules of the means:
* **table means** (`gauss = false`; the anchored nodes of the generator): Gaussian-weighted means
  from the moment tables;
* **Gauss-point means** (`gauss = true`; the localised and global pieces of the generator): the
  unweighted mean over the `2 × 2` Gauss points of the cell.

All `Float` code uses `+`, `−`, `×`, `÷` and `sqrt` only (correctly rounded on every platform; the
cosines and sines of the Gauss angles are Taylor polynomials), so the price numerators do not
depend on the machine.  The numerators are then made admissible exactly: `dyNum ≥ 1`, and a pair
with `Δ ≤ 0` is replaced by `(nuNum ν, nuNum ν)` (`fixCell`). -/

/-! #### `Float` constants

Every constant of the per-cell `Float` code is a definition of its own, evaluated once when the
library is loaded.  A literal written inside a function is not always compiled to such a constant:
after a comparison the compiler may pass the Boolean result, known to equal the sign flag of the
literal, to `Float.ofScientific` in its place; the literal is then no longer a closed term and is
recomputed, in multi-precision arithmetic, at every use (measured: 1.5 ms per call of `dualPrices`
written with literals). -/

/-- `0`. -/
@[noinline] def fZero : Float := 0.0
/-- `1/2`. -/
@[noinline] def fHalf : Float := 0.5
/-- `1`. -/
@[noinline] def fOne : Float := 1.0
/-- `2`. -/
@[noinline] def fTwo : Float := 2.0
/-- `3`. -/
@[noinline] def fThree : Float := 3.0
/-- `4`. -/
@[noinline] def fFour : Float := 4.0
/-- `1/10`: the length of a gradient step. -/
@[noinline] def fTenth : Float := 0.1
/-- `10⁻³⁰`: the least value of a mean. -/
@[noinline] def fMeanMin : Float := 1.0e-30
/-- `10³⁰⁰`: the value of the cell objective outside its domain. -/
@[noinline] def fObjOut : Float := 1.0e300
/-- `10²⁹⁹`: an accepted step has an objective below it. -/
@[noinline] def fObjMax : Float := 1.0e299
/-- `10⁻¹⁵`: the slack of the descent test. -/
@[noinline] def fDescent : Float := 1.0e-15
/-- `10⁻¹³`: the relative step at which the iteration stops. -/
@[noinline] def fStepTol : Float := 1.0e-13
/-- `10⁻⁹`: prices with `Δ ≤ 10⁻⁹ν²` are raised. -/
@[noinline] def fLowTol : Float := 1.0e-9
/-- `10⁻³⁰⁰`: the least mass of a cell in the table means. -/
@[noinline] def fMassMin : Float := 1.0e-300

/-- `⌈2⁵⁰ν⌉ + 1`: a price numerator with `d > ν`. -/
def nuNum (nu : Rat) : Nat := (-(Rat.floor (-(nu * two50)))).toNat + 1

/-- The exact repair of a pair of price numerators: when `Δ ≤ 0` both become `nuNum ν`. -/
def fixCell (nu : Rat) (d2 d3 : Nat) : Nat × Nat :=
  if (cellInts nu d2 d3).Dl ≤ 0 then (nuNum nu, nuNum nu) else (d2, d3)

/-- The cell objective `(d₂ + d₃)/2 + (d₃σ + d₂τ + 2νρ)/(2Δ)` on `d₂, d₃, Δ > 0`, and `10³⁰⁰`
outside. -/
def dualObj (nu sg ta ro d2 d3 : Float) : Float :=
  let D := d2 * d3 - nu * nu
  if D > fZero && d2 > fZero && d3 > fZero then
    (d2 + d3) / fTwo + (d3 * sg + d2 * ta + fTwo * nu * ro) / (fTwo * D)
  else fObjOut

/-- **The dual prices of a cell**: at most 12 Newton steps on the cell objective from
`(√σ + ν, √τ + ν)`, each damped by at most 24 halvings until the objective does not increase; the
iteration stops when a step is rejected or is below `10⁻¹³` relative.  For `ν = 0` the prices are
`(√σ, √τ)`. -/
def dualPrices (nu sg ta ro : Float) : Float × Float := Id.run do
  let sg := if sg > fMeanMin then sg else fMeanMin
  let ta := if ta > fMeanMin then ta else fMeanMin
  if nu == fZero then return (Float.sqrt sg, Float.sqrt ta)
  let mut d2 := Float.sqrt sg + nu
  let mut d3 := Float.sqrt ta + nu
  let mut f := dualObj nu sg ta ro d2 d3
  for _ in [0:12] do
    let D := d2 * d3 - nu * nu
    let N := d3 * sg + d2 * ta + fTwo * nu * ro
    let g2 := fHalf + (ta * D - N * d3) / (fTwo * D * D)
    let g3 := fHalf + (sg * D - N * d2) / (fTwo * D * D)
    let D3 := D * D * D
    let h22 := (-fTwo * ta * d3 * D + fTwo * N * d3 * d3) / (fTwo * D3)
    let h33 := (-fTwo * sg * d2 * D + fTwo * N * d2 * d2) / (fTwo * D3)
    let h23 := ((ta * d2 - sg * d3 - N) * D - fTwo * (ta * D - N * d3) * d2) / (fTwo * D3)
    let det := h22 * h33 - h23 * h23
    let ok := h22 > fZero && det > fZero
    let s2 := if ok then -(h33 * g2 - h23 * g3) / det else -g2 * fTenth
    let s3 := if ok then -(h22 * g3 - h23 * g2) / det else -g3 * fTenth
    let mut lam := fOne
    let mut acc := false
    let mut n2 := d2
    let mut n3 := d3
    let mut fn := f
    for _ in [0:24] do
      let c2 := d2 + lam * s2
      let c3 := d3 + lam * s3
      let fc := dualObj nu sg ta ro c2 c3
      if fc < fObjMax && fc <= f + fDescent then
        n2 := c2
        n3 := c3
        fn := fc
        acc := true
        break
      lam := lam * fHalf
    let step := if acc then Float.abs (n2 - d2) + Float.abs (n3 - d3) else fZero
    let more := acc && step > fStepTol * (Float.abs n2 + Float.abs n3)
    d2 := n2
    d3 := n3
    f := fn
    if !more then break
  return (d2, d3)

/-- The numerators `(D2, D3, G)` of a cell from its means: the dual prices times the scale of the
recipe, raised by `2ν` when `Δ ≤ 10⁻⁹ν²`, rounded down to `2⁻⁵⁰` (`dyNum`), repaired exactly
(`fixCell`), with the exact largest `G` of the cell inequality. -/
def cellOfMeans (nu : Rat) (nuF sc : Float) (Rr : Int) (sg ta ro : Float) : Nat × Nat × Nat :=
  let p := dualPrices nuF sg ta ro
  let x2 := sc * p.1
  let x3 := sc * p.2
  let low := x2 * x3 - nuF * nuF <= fLowTol * (nuF * nuF)
  let x2 := if low then x2 + fTwo * nuF else x2
  let x3 := if low then x3 + fTwo * nuF else x3
  let d := fixCell nu (dyNum x2) (dyNum x3)
  (d.1, d.2, gNum (cellInts nu d.1 d.2) Rr)

/-- The cells of a ring from the **table means**: `σ`, `τ` and `⟨|L|²⟩` are Gaussian-weighted cell
means of the polar terms `tP`, `tM`, `tL`, and `ρ = 2⟨|L|²⟩ − (σ + τ)/2`. -/
def ringCellsNu (ell beta nu : Rat) (r : Recipe) (N : Nat) (h : Rat) (radF : Nat → Nat → Float)
    (angF : Nat → Int → Float × Float) (tP tM tL : List (Nat × Int × Float × Float)) (i : Nat) :
    Array (Nat × Nat × Nat) :=
  let Rr : Int := (nu.den : Int) * rlNum ell beta h i
  let sc := ratF r.scale
  let nuF := ratF nu
  ((List.range N).map fun j =>
    let ev := fun (ts : List (Nat × Int × Float × Float)) =>
      ts.foldl (fun acc t => let a := angF j t.2.1
        acc + radF i t.1 * (t.2.2.1 * a.1 + t.2.2.2 * a.2)) fZero
    let mass := radF i 0 * (angF j 0).1
    let mass := if mass > fMassMin then mass else fMassMin
    let vA := ev tP / mass
    let vB := ev tM / mass
    let l2 := ev tL / mass
    cellOfMeans nu nuF sc Rr vA vB (fTwo * l2 - (vA + vB) / fTwo)).toArray

/-! #### Gauss-point means -/

/-- `(cos y, sin y)` for `|y| ≤ π/4`: the Taylor polynomials of degree 18 and 19. -/
def cosSinSmall (y : Float) : Float × Float :=
  let u := y * y
  let c := 1.0 - u / 2.0 * (1.0 - u / 12.0 * (1.0 - u / 30.0 * (1.0 - u / 56.0 * (1.0 - u / 90.0 *
    (1.0 - u / 132.0 * (1.0 - u / 182.0 * (1.0 - u / 240.0 * (1.0 - u / 306.0))))))))
  let s := y * (1.0 - u / 6.0 * (1.0 - u / 20.0 * (1.0 - u / 42.0 * (1.0 - u / 72.0 *
    (1.0 - u / 110.0 * (1.0 - u / 156.0 * (1.0 - u / 210.0 * (1.0 - u / 272.0 *
      (1.0 - u / 342.0)))))))))
  (c, s)

/-- `(cos t, sin t)` for `0 ≤ t ≤ 2π`, by reduction to `|y| ≤ π/4`. -/
def cosSinF (t : Float) : Float × Float :=
  let hp := 1.5707963267948966
  let k := (t / hp + 0.5).floor
  let cs := cosSinSmall (t - k * hp)
  let q := k.toUInt64.toNat % 4
  if q = 0 then cs else if q = 1 then (-cs.2, cs.1) else if q = 2 then (-cs.1, -cs.2)
  else (cs.2, -cs.1)

/-- The cosines and the sines of the Gauss angles of the `N` angular cells: the entries `2j` and
`2j + 1` belong to the angles `−π + (2π/N)(j + 1/2 ∓ 1/(2√3))` of the cell `j`. -/
def gaussTrig (N : Nat) : FloatArray × FloatArray := Id.run do
  let w := 6.283185307179586 / N.toFloat
  let g := fHalf / Float.sqrt fThree
  let mut c := FloatArray.empty
  let mut s := FloatArray.empty
  for j in [0:N] do
    for k in [0:2] do
      let cs := cosSinF ((j.toFloat + fHalf + (if k = 0 then -g else g)) * w)
      c := c.push (-cs.1)
      s := s.push (-cs.2)
  return (c, s)

/-- The `Float` coefficients of a polynomial in the six monomials `1`, `|z|²`, `z²`, `z`, `z|z|²`,
`z̄` (the monomials of `L` and of the fibre basis): the entries `2k`, `2k + 1` are the real and the
imaginary part of the coefficient of the `k`-th monomial.  Other monomials are ignored. -/
def cpSix (P : CP) : FloatArray :=
  let z : FloatArray := ⟨Array.replicate 12 fZero⟩
  P.foldl (fun acc t =>
    let k : Nat :=
      if t.1 = 0 ∧ t.2.1 = 0 then 0 else if t.1 = 1 ∧ t.2.1 = 1 then 1
      else if t.1 = 2 ∧ t.2.1 = 0 then 2 else if t.1 = 1 ∧ t.2.1 = 0 then 3
      else if t.1 = 2 ∧ t.2.1 = 1 then 4 else if t.1 = 0 ∧ t.2.1 = 1 then 5 else 6
    if k < 6 then
      (acc.set! (2 * k) (acc.get! (2 * k) + kqF t.2.2.re)).set! (2 * k + 1)
        (acc.get! (2 * k + 1) + kqF t.2.2.im)
    else acc) z

/-- The real part of a six-monomial polynomial at `z = x + iy`, with `q = |z|²`, `z² = u + iv`. -/
@[inline] def sixRe (c : FloatArray) (x y q u v : Float) : Float :=
  c.get! 0 + c.get! 2 * q + (c.get! 4 * u - c.get! 5 * v) + (c.get! 6 * x - c.get! 7 * y)
    + q * (c.get! 8 * x - c.get! 9 * y) + (c.get! 10 * x + c.get! 11 * y)

/-- The imaginary part of a six-monomial polynomial at `z = x + iy`. -/
@[inline] def sixIm (c : FloatArray) (x y q u v : Float) : Float :=
  c.get! 1 + c.get! 3 * q + (c.get! 4 * v + c.get! 5 * u) + (c.get! 6 * y + c.get! 7 * x)
    + q * (c.get! 8 * y + c.get! 9 * x) + (c.get! 11 * x - c.get! 10 * y)

/-- Three `Float`s. -/
structure Tri where
  a : Float
  b : Float
  c : Float

/-- The values `|A|² + e`, `|B|² + e`, `Re(A B̄) − e` at the point `r(c + i s)`, for the coefficients
of `L`, of `p = B·v₀` and of the variance polynomials `B·f` (`A = L + p`, `B = L − p`,
`e = Σ |B·f|²`). -/
def gaussPoint (cL cP : FloatArray) (cV : Array FloatArray) (r c s : Float) : Tri :=
  let x := r * c
  let y := r * s
  let q := x * x + y * y
  let u := x * x - y * y
  let v := fTwo * x * y
  let lr := sixRe cL x y q u v
  let li := sixIm cL x y q u v
  let pr := sixRe cP x y q u v
  let pi := sixIm cP x y q u v
  let ar := lr + pr
  let ai := li + pi
  let br := lr - pr
  let bi := li - pi
  let ex := cV.foldl (fun acc f =>
    let fr := sixRe f x y q u v
    let fi := sixIm f x y q u v
    acc + (fr * fr + fi * fi)) fZero
  ⟨ar * ar + ai * ai + ex, br * br + bi * bi + ex, ar * br + ai * bi - ex⟩

/-- The Gauss-point means `(σ, τ, ρ)` of a cell with the radii `r₁, r₂` and the angles of
`(c₁, s₁)`, `(c₂, s₂)`: a quarter of each of the four point values. -/
def gaussMeans (cL cP : FloatArray) (cV : Array FloatArray) (r1 r2 c1 s1 c2 s2 : Float) : Tri :=
  let a := gaussPoint cL cP cV r1 c1 s1
  let b := gaussPoint cL cP cV r1 c2 s2
  let c := gaussPoint cL cP cV r2 c1 s1
  let d := gaussPoint cL cP cV r2 c2 s2
  ⟨a.a / fFour + b.a / fFour + c.a / fFour + d.a / fFour,
    a.b / fFour + b.b / fFour + c.b / fFour + d.b / fFour,
    a.c / fFour + b.c / fFour + c.c / fFour + d.c / fFour⟩

/-- The cells of a ring from the **Gauss-point means**. -/
def ringCellsNuG (ell beta nu : Rat) (r : Recipe) (N : Nat) (h : Rat)
    (cL cP : FloatArray) (cV : Array FloatArray)
    (trig : FloatArray × FloatArray) (i : Nat) : Array (Nat × Nat × Nat) :=
  let Rr : Int := (nu.den : Int) * rlNum ell beta h i
  let sc := ratF r.scale
  let nuF := ratF nu
  let hF := ratF h
  let rm := (i.toFloat + fHalf) * hF
  let dr := hF / fTwo / Float.sqrt fThree
  ((List.range N).map fun j =>
    let m := gaussMeans cL cP cV (rm - dr) (rm + dr) (trig.1.get! (2 * j)) (trig.2.get! (2 * j))
      (trig.1.get! (2 * j + 1)) (trig.2.get! (2 * j + 1))
    cellOfMeans nu nuF sc Rr m.a m.b m.c).toArray

/-- The grid of a recipe for the tail `ν`, with table means or Gauss-point means. -/
@[noinline] def mkGridNu (ell beta nu : Rat) (r : Recipe) (gauss : Bool) (Nr N : Nat) (h : Rat)
    (T : Tables) : GridDataNu :=
  let cells : Array (Array (Nat × Nat × Nat)) :=
    if gauss then
      ((List.range Nr).map (ringCellsNuG ell beta nu r N h (cpSix (lCP ell beta))
        (cpSix (vecCP r.v0)) ((r.var.map fun f => cpSix (vecCP f)).toArray)
        (gaussTrig N))).toArray
    else
      let radA : Array (Array Float) := T.rad.map fun a => a.map ivF
      let angA : Array (Array (Float × Float)) :=
        T.ang.map fun a => a.map fun p => (ivF p.1, ivF p.2)
      let radF := fun i m => (radA.getD i #[]).getD m fZero
      let angF := fun (j : Nat) (n : Int) =>
        let p := (angA.getD j #[]).getD n.natAbs (fZero, fZero)
        if n < 0 then (p.1, -p.2) else p
      ((List.range Nr).map (ringCellsNu ell beta nu r N h radF angF (polarF (priceCP ell beta r 1))
        (polarF (priceCP ell beta r (-1))) (polarF (l2CP ell beta)))).toArray
  let dflt : Nat × Nat × Nat := (nuNum nu, nuNum nu, 0)
  let get := fun i j => (cells.getD i #[]).getD j dflt
  ⟨Nr, N, h, nu, fun i j => (get i j).1, fun i j => (get i j).2.1, fun i j => (get i j).2.2,
    rlNum ell beta h⟩


/-! ### The weights -/

/-- The fixed-point enclosure `[⌊2¹²⁸ n/d⌋, ⌈2¹²⁸ n/d⌉]` of `n/d` (`d > 0`). -/
def qI (n d : Int) : Ival :=
  let x := n * D
  ⟨x / d, -((-x) / d)⟩

/-- The weight interval `w` of a cell from its integer data and `G` (see the module doc). -/
def cellWtOf (c : CellInts) (G : Int) (w : Nat) : Ival :=
  let t100 : Int := two100
  let s := c.s
  let P := c.E2 * c.E3
  let dE := c.E2 - c.E3
  match w with
  | 0 => qI (s * (c.Dd2 + c.Dd3 - 2 * c.Nu)) (2 * c.Dl)
  | 1 => let half := qI (c.Dd2 + c.Dd3) (2 * s)
    if G = 0 then half else
      addI half (negI (qI (G * (dE * dE) * (c.Sg * c.Sg) * (c.Dl * c.Dl))
        (16 * t100 * (s * s * s * s) * (P * P))))
  | 2 => let tau := qI (s * (c.Dd3 - c.Dd2)) (2 * c.Dl)
    if G = 0 then tau else addI tau (qI (G * dE * c.Sg * c.Dl) (4 * t100 * (s * s) * P))
  | 3 => qI G t100
  | 4 => let cL := qI (s * (c.Dd2 + c.Dd3 + 2 * c.Nu)) (2 * c.Dl)
    if G = 0 then cL else
      addI cL (negI (qI (-(G * c.Nu * (dE * dE) * c.Sg * c.Dl)) (2 * t100 * (s * s) * (P * P))))
  | 5 => if G = 0 then zeroI else qI (-(G * c.Nu * dE)) (t100 * P)
  | _ => if G = 0 then zeroI else negI (qI (G * (c.Nu * c.Nu) * (dE * dE)) (t100 * (P * P)))

/-- The weight interval `w` of the cell `(i, j)` of a grid. -/
def cellWt (gd : GridDataNu) (w i j : Nat) : Ival :=
  cellWtOf (cellInts gd.nu (gd.D2 i j) (gd.D3 i j)) (gd.G i j) w

/-- The seven weight intervals of a cell. -/
def cellW (gd : GridDataNu) (i j : Nat) : Array Ival :=
  ((List.range 7).map fun w => cellWt gd w i j).toArray

/-! ### The matrix -/

/-- `L L̄ L L̄ = |L|⁴`. -/
def l4CP (ell beta : Rat) : CP := CP.mul (l2CP ell beta) (l2CP ell beta)
/-- `|L|² uⱼ`. -/
def l2uCP (ell beta : Rat) (j : Nat) : CP := CP.mul (l2CP ell beta) (uCP ell beta j)

/-- The entry `(I, J)` (`I ≤ J`) of the matrix with a tail from the weighted cell functionals
`cw w P`, the tail functional and the prices `d₂ = d₃ = 1` outside the grid (`c_L = 1/(1 − ν)`,
`c_P = 1/(1 + ν)`); the constant `−ν` of the integrand is added to the entry `(0, 0)`. -/
def entryOfNu (ell beta nu : Rat) (cw : Nat → CP → Ival) (tl : CP → Ival) (I J : Nat) : Ival :=
  if I = 0 then
    (if J = 0 then
      addI (addI (addI (cw 4 (l2CP ell beta)) (cw 1 oneCP)) (cw 6 (l4CP ell beta)))
        (addI (addI (mulI (ofRatI (1 / (1 - nu))) (tl (l2CP ell beta))) (tl oneCP))
          (negI (ofRatI nu)))
    else addI (cw 2 (uCP ell beta (J - 1))) (cw 5 (l2uCP ell beta (J - 1))))
  else if J = 0 then addI (cw 2 (uCP ell beta (I - 1))) (cw 5 (l2uCP ell beta (I - 1)))
  else addI (addI (cw 0 (gCP (I - 1) (J - 1))) (negI (cw 3 (uuCP ell beta (I - 1) (J - 1)))))
    (mulI (ofRatI (1 / (1 + nu))) (tl (gCP (I - 1) (J - 1))))

/-- The matrix of the entries (`entryOfNu` on the upper triangle, mirrored). -/
def matOfNu (ell beta nu : Rat) (cw : Nat → CP → Ival) (tl : CP → Ival) : Array (Array Ival) :=
  ((List.range 13).map fun I => ((List.range 13).map fun J =>
    if I ≤ J then entryOfNu ell beta nu cw tl I J else entryOfNu ell beta nu cw tl J I).toArray).toArray

/-- The number of angular harmonics tabulated for the weight `w`. -/
def nwOfNu (w : Nat) : Nat :=
  match w with
  | 0 => 4 | 1 => 1 | 2 => 3 | 3 => 5 | 4 => 1 | 5 => 3 | _ => 1

/-- **The enclosure of the coefficient matrix with a tail** (the tabulation of `matI`, with seven
weights). -/
@[noinline] def matINu (ell beta : Rat) (gd : GridDataNu) (T : Tables) : Array (Array Ival) :=
  let wA : Array (Array (Array Ival)) :=
    memo gd.Nr (fun i => memo gd.N (fun j => cellW gd i j) #[]) #[]
  let wf := fun w i j => get3 wA i j w (fun _ => cellWt gd w i j)
  let sC := memo3 7 nwOfNu (fun _ _ => gd.Nr) (fun w n => angSumCW gd.N wf T w n) zeroI
  let sS := memo3 7 nwOfNu (fun _ _ => gd.Nr) (fun w n => angSumSW gd.N wf T w n) zeroI
  let gC := fun w n i => get3 sC w n i (fun _ => angSumCW gd.N wf T w n i)
  let gS := fun w n i => get3 sS w n i (fun _ => angSumSW gd.N wf T w n i)
  let mC := fun w m n => sumI (List.range gd.Nr) fun i => mulI (T.radAt i m) (gC w n i)
  let mS := fun w m n => sumI (List.range gd.Nr) fun i => mulI (T.radAt i m) (gS w n i)
  let tC := memo3 7 (fun _ => 13) (fun w _ => nwOfNu w) (fun w m n => mC w m n) zeroI
  let tS := memo3 7 (fun _ => 13) (fun w _ => nwOfNu w) (fun w m n => mS w m n) zeroI
  let fC := fun w m (n : Int) => get3 tC w m n.natAbs (fun _ => mC w m n.natAbs)
  let fS := fun w m (n : Int) =>
    let v := get3 tS w m n.natAbs (fun _ => mS w m n.natAbs)
    if n < 0 then negI v else v
  matOfNu ell beta gd.nu (fun w P => polyI (fC w) (fS w) P) (tailPolyI T)

/-- The polynomials of the entries with a tail. -/
def entryPolysNu (ell beta : Rat) : List CP :=
  entryPolys ell beta ++ [l4CP ell beta] ++ (List.range 12).map (l2uCP ell beta)

/-- The degree bounds `m ≤ 16`, `|n| ≤ 12` of the table hypothesis, for the entries with a tail
(the new polynomials `|L|⁴`, `|L|²uⱼ` have radial degree `12`). -/
@[noinline] def polyBoundsOKNu (ell beta : Rat) : Bool :=
  (entryPolysNu ell beta).all fun P =>
    (CP.polar P).all fun t => decide (t.m ≤ 16) && decide (t.n.natAbs ≤ 12)

end GrotheKernel
