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

/-! ### Prices from a recipe (search only: soundness never depends on these values) -/

/-- `⌈2⁵⁰ν⌉ + 1`: the least price numerator used, so that `d > ν` in every cell of a recipe grid. -/
def nuNum (nu : Rat) : Nat := (-(Rat.floor (-(nu * two50)))).toNat + 1

/-- The cell numerators `(D2, D3, G)` of a ring: today's `Float` root-mean-square prices shifted by
`ν` (at least `nuNum ν`), and the exact largest `G` of the cell inequality.

**Provisional price rule.**  Root-mean-square prices plus `ν` are exact only where `L + p` and `L − p`
are aligned.  The stage-0 certificate of the tail witness prices every cell by the minimiser of
`(d₂ + d₃)/2 + (d₃ σ + d₂ τ + 2νρ)/(2(d₂d₃ − ν²))` over `(d₂, d₃)` (the cell means `σ`, `τ`, `ρ` of
`|L + p|²`, `|L − p|²`, `Re((L + p)(L − p)‾)`; damped Newton iteration from the values used here).  On
its pieces the present rule gives values larger by `3·10⁻⁴` to `4·10⁻³`, far above the margin `2·10⁻⁹`
of its cap tables, so this function must be replaced by that iteration before any cap data is checked
with it.  Soundness is not affected: it rests on `cellOKNu` alone. -/
def ringCellsNu (ell beta nu : Rat) (r : Recipe) (N : Nat) (h : Rat) (radF : Nat → Nat → Float)
    (angF : Nat → Int → Float × Float) (tP tM : List (Nat × Int × Float × Float)) (i : Nat) :
    Array (Nat × Nat × Nat) :=
  let RL := rlNum ell beta h i
  let sc := ratF r.scale
  let nuF := ratF nu
  let lo := nuNum nu
  ((List.range N).map fun j =>
    let ev := fun (ts : List (Nat × Int × Float × Float)) =>
      ts.foldl (fun acc t => let a := angF j t.2.1
        acc + radF i t.1 * (t.2.2.1 * a.1 + t.2.2.2 * a.2)) 0.0
    let mass := radF i 0 * (angF j 0).1
    let mass := if mass > 1.0e-300 then mass else 1.0e-300
    let vA := ev tP / mass
    let vB := ev tM / mass
    let d2 : Nat := max (dyNum (sc * Float.sqrt (if vA > 1.0e-24 then vA else 1.0e-24) + nuF)) lo
    let d3 : Nat := max (dyNum (sc * Float.sqrt (if vB > 1.0e-24 then vB else 1.0e-24) + nuF)) lo
    (d2, d3, gNum (cellInts nu d2 d3) ((nu.den : Int) * RL))).toArray

/-- The grid of a recipe for the tail `ν`. -/
@[noinline] def mkGridNu (ell beta nu : Rat) (r : Recipe) (Nr N : Nat) (h : Rat) (T : Tables) :
    GridDataNu :=
  let radA : Array (Array Float) := T.rad.map fun a => a.map ivF
  let angA : Array (Array (Float × Float)) := T.ang.map fun a => a.map fun p => (ivF p.1, ivF p.2)
  let radF := fun i m => (radA.getD i #[]).getD m 0.0
  let angF := fun (j : Nat) (n : Int) =>
    let p := (angA.getD j #[]).getD n.natAbs (0.0, 0.0)
    if n < 0 then (p.1, -p.2) else p
  let tP := polarF (priceCP ell beta r 1)
  let tM := polarF (priceCP ell beta r (-1))
  let cells : Array (Array (Nat × Nat × Nat)) :=
    ((List.range Nr).map (ringCellsNu ell beta nu r N h radF angF tP tM)).toArray
  let get := fun i j => (cells.getD i #[]).getD j (nuNum nu, nuNum nu, 0)
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
