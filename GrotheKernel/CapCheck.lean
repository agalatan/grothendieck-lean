import GrotheKernel.Basic
import GrotheKernel.CapPoly

/-!
# The cap checker (Mathlib-free, precompiled)

Grid data and its check (`GridData`, `cellOK`, `gridOK`); the cell prices from a recipe
(`mkGrid`: per-cell root-mean-square prices of `|L ± B·v₀|` (+ variance terms) computed in `Float`
and rounded to dyadic rationals, then exact reciprocal bounds and correction coefficients — the
prices are arbitrary as far as soundness goes, `gridOK` re-checks the cell conditions); the
interval enclosure of the integrated coefficient matrix from the shared tables (`entryI`).
Soundness: `Grothe/LowerAnalytic/CapCheckSound.lean`.
-/

namespace GrotheKernel

/-! ### Grid data -/

def absQ (q : Rat) : Rat := if q < 0 then -q else q

/-- `D = S(S² + 4R² + 4R|A − B|)`. -/
def majDq (A B R : Rat) : Rat := (A + B) * ((A + B) ^ 2 + 4 * R ^ 2 + 4 * R * absQ (A - B))

/-- `r(|ℓ − 2β| + |β| r²)`. -/
def rlb (ell beta r : Rat) : Rat := r * (absQ (ell - 2 * beta) + absQ beta * r ^ 2)

/-- A uniform grid with cell prices. -/
structure GridData where
  Nr : Nat
  N : Nat
  h : Rat
  pa : Nat → Nat → Rat
  pb : Nat → Nat → Rat
  na : Nat → Nat → Rat
  nb : Nat → Nat → Rat
  gg : Nat → Nat → Rat
  c : Rat

/-- The cell conditions. -/
def cellOK (gd : GridData) (ell beta : Rat) (i j : Nat) : Bool :=
  decide (0 < gd.pa i j) && decide (0 < gd.pb i j) && decide (1 ≤ gd.na i j * gd.pa i j) &&
    decide (1 ≤ gd.nb i j * gd.pb i j) && decide (0 ≤ gd.gg i j) &&
    decide (gd.gg i j * majDq (gd.pa i j) (gd.pb i j) (rlb ell beta ((i + 1) * gd.h)) ≤ 8) &&
    decide (gd.pa i j ≤ gd.c) && decide (gd.pb i j ≤ gd.c) && decide (gd.na i j ≤ gd.c) &&
    decide (gd.nb i j ≤ gd.c) && decide (gd.gg i j ≤ gd.c)

/-- The grid check. -/
def gridOK (gd : GridData) (ell beta : Rat) : Bool :=
  decide (0 < gd.h) && decide (0 < gd.N) && decide (1 ≤ gd.c) && decide (0 < gd.Nr) &&
    (List.range gd.Nr).all fun i => (List.range gd.N).all fun j => cellOK gd ell beta i j

/-! ### Tables -/

/-- The shared one-dimensional tables: `rad[i][m] ∋ Rad(ih, (i+1)h, m)`, `tail[m] ∋ tailI(Nr h, m)`,
`ang[j][n] ∋ (AngC, AngS)(θⱼ, θⱼ₊₁, n)` (`n ≥ 0`). -/
structure Tables where
  rad : Array (Array Ival)
  tail : Array Ival
  ang : Array (Array (Ival × Ival))

def Tables.radAt (T : Tables) (i m : Nat) : Ival := (T.rad.getD i #[]).getD m zeroI
def Tables.tailAt (T : Tables) (m : Nat) : Ival := T.tail.getD m zeroI
def Tables.angCAt (T : Tables) (j : Nat) (n : Int) : Ival :=
  ((T.ang.getD j #[]).getD n.natAbs (zeroI, zeroI)).1
def Tables.angSAt (T : Tables) (j : Nat) (n : Int) : Ival :=
  let s := ((T.ang.getD j #[]).getD n.natAbs (zeroI, zeroI)).2
  if n < 0 then negI s else s

/-! ### Prices from a recipe (search only: soundness never depends on these values) -/

/-- A price recipe: the anchor `v₀ ∈ ℝ¹²` (in the coordinates of `Fib.vec`), variance
vectors, and a scale. -/
structure Recipe where
  v0 : List Rat
  var : List (List Rat)
  scale : Rat

def ratF (q : Rat) : Float := Float.ofInt q.num / Float.ofNat q.den
def kqF (x : KQ) : Float := ratF x.p + ratF x.q * 1.4142135623730951
def ivF (I : Ival) : Float := Float.scaleB (Float.ofInt ((I.lo + I.hi) / 2)) (-128)

/-- `B·v`. -/
def vecCP (v : List Rat) : CP :=
  ((List.range 12).map fun j => CP.smul (KC.ofRat (v.getD j 0)) (bCP j)).foldr CP.add []

/-- `|L + σ B·v₀|² + Σ |B·f|²` as a polynomial. -/
def priceCP (ell beta : Rat) (r : Recipe) (sg : Rat) : CP :=
  let P := CP.add (lCP ell beta) (CP.smul (KC.ofRat sg) (vecCP r.v0))
  CP.add (CP.mul P (CP.conj P)) (r.var.flatMap fun f => let Q := vecCP f; CP.mul Q (CP.conj Q))

/-- Float polar terms `(m, n, cc, cs)`. -/
def polarF (P : CP) : List (Nat × Int × Float × Float) :=
  (CP.polar P).map fun t => (t.m, t.n, kqF t.cc, kqF t.cs)

/-- The dyadic price `⌊2³⁰ x⌋/2³⁰ ≥ 2⁻³⁰` as its numerator. -/
def dyNum (x : Float) : Nat :=
  let y := (x * 1073741824.0).floor
  if y < 1.0 then 1 else if y > 1.0e15 then 1000000000000000 else y.toUInt64.toNat

def two30 : Nat := 1073741824
def two60 : Nat := two30 * two30

/-- The cell values `(pa, pb, na, nb, gg)` of a ring. -/
def ringCells (ell beta : Rat) (r : Recipe) (Nr N : Nat) (h : Rat) (radF : Nat → Nat → Float)
    (angF : Nat → Int → Float × Float) (tP tM : List (Nat × Int × Float × Float)) (i : Nat) :
    Array (Rat × Rat × Rat × Rat × Rat) :=
  let rl := rlb ell beta ((i + 1) * h)
  let sc := ratF r.scale
  ((List.range N).map fun j =>
    let ev := fun (ts : List (Nat × Int × Float × Float)) =>
      ts.foldl (fun acc t => let a := angF j t.2.1
        acc + radF i t.1 * (t.2.2.1 * a.1 + t.2.2.2 * a.2)) 0.0
    let mass := radF i 0 * (angF j 0).1
    let mass := if mass > 1.0e-300 then mass else 1.0e-300
    let vA := ev tP / mass
    let vB := ev tM / mass
    let pA : Nat := dyNum (sc * Float.sqrt (if vA > 1.0e-24 then vA else 1.0e-24))
    let pB : Nat := dyNum (sc * Float.sqrt (if vB > 1.0e-24 then vB else 1.0e-24))
    let pa : Rat := (pA : Rat) / two30
    let pb : Rat := (pB : Rat) / two30
    let na : Rat := (((two60 + pA - 1) / pA : Nat) : Rat) / two30
    let nb : Rat := (((two60 + pB - 1) / pB : Nat) : Rat) / two30
    let gg : Rat := ((8 * (two60 : Rat) / majDq pa pb rl).floor : Rat) / two60
    (pa, pb, na, nb, gg)).toArray

/-- The grid of a recipe. -/
def mkGrid (ell beta : Rat) (r : Recipe) (Nr N : Nat) (h : Rat) (T : Tables) : GridData :=
  let radA : Array (Array Float) := T.rad.map fun a => a.map ivF
  let angA : Array (Array (Float × Float)) := T.ang.map fun a => a.map fun p => (ivF p.1, ivF p.2)
  let radF := fun i m => (radA.getD i #[]).getD m 0.0
  let angF := fun (j : Nat) (n : Int) =>
    let p := (angA.getD j #[]).getD n.natAbs (0.0, 0.0)
    if n < 0 then (p.1, -p.2) else p
  let tP := polarF (priceCP ell beta r 1)
  let tM := polarF (priceCP ell beta r (-1))
  let cells : Array (Array (Rat × Rat × Rat × Rat × Rat)) :=
    ((List.range Nr).map (ringCells ell beta r Nr N h radF angF tP tM)).toArray
  let get := fun i j => (cells.getD i #[]).getD j (1, 1, 1, 1, 0)
  let c : Rat := cells.foldl (fun acc a => a.foldl (fun acc v =>
    let m1 := if v.1 > v.2.1 then v.1 else v.2.1
    let m2 := if v.2.2.1 > v.2.2.2.1 then v.2.2.1 else v.2.2.2.1
    let m3 := if m1 > m2 then m1 else m2
    let m4 := if m3 > v.2.2.2.2 then m3 else v.2.2.2.2
    if acc > m4 then acc else m4) acc) 1
  ⟨Nr, N, h, fun i j => (get i j).1, fun i j => (get i j).2.1, fun i j => (get i j).2.2.1,
    fun i j => (get i j).2.2.2.1, fun i j => (get i j).2.2.2.2, c⟩

/-! ### The interval enclosure of the coefficient matrix -/

/-- Interval sum over a list of indices. -/
def sumI (l : List Nat) (f : Nat → Ival) : Ival := l.foldl (fun acc i => addI acc (f i)) zeroI

/-- `⌊√2 · 2¹²⁸⌋`. -/
def sqrt2lo : Int := 481231938336009023090067544955250113854
/-- An enclosure of `√2`. -/
def sqrt2I : Ival := ⟨sqrt2lo, sqrt2lo + 1⟩

/-- An enclosure of `p + q√2`. -/
def ofKQ (x : KQ) : Ival := addI (ofRatI x.p) (mulI (ofRatI x.q) sqrt2I)

/-- The rational weights `ν, ξ, τ, γ` of a cell (`w = 0, 1, 2, 3`). -/
def wQ (gd : GridData) (w i j : Nat) : Rat :=
  match w with
  | 0 => (gd.na i j + gd.nb i j) / 2
  | 1 => (gd.pa i j + gd.pb i j) / 2 - gd.gg i j * (gd.pa i j ^ 2 - gd.pb i j ^ 2) ^ 2 / 16
  | 2 => (gd.na i j - gd.nb i j) / 2 + gd.gg i j * (gd.pa i j ^ 2 - gd.pb i j ^ 2) / 4
  | _ => gd.gg i j

/-- The weight intervals. -/
def wI (gd : GridData) (w i j : Nat) : Ival := ofRatI (wQ gd w i j)

/-- `Σⱼ wᵢⱼ AngC(j, n)` and `Σⱼ wᵢⱼ AngS(j, n)` for a weight table `wf` (`= wI`). -/
def angSumCW (N : Nat) (wf : Nat → Nat → Nat → Ival) (T : Tables) (w : Nat) (n : Int) (i : Nat) : Ival :=
  sumI (List.range N) fun j => mulI (wf w i j) (T.angCAt j n)
def angSumSW (N : Nat) (wf : Nat → Nat → Nat → Ival) (T : Tables) (w : Nat) (n : Int) (i : Nat) : Ival :=
  sumI (List.range N) fun j => mulI (wf w i j) (T.angSAt j n)
def angSumC (gd : GridData) (T : Tables) (w : Nat) (n : Int) (i : Nat) : Ival :=
  angSumCW gd.N (wI gd) T w n i
def angSumS (gd : GridData) (T : Tables) (w : Nat) (n : Int) (i : Nat) : Ival :=
  angSumSW gd.N (wI gd) T w n i

/-- The weighted moments `Σᵢ Rad(i, m) Σⱼ wᵢⱼ Ang(j, n)` (specification). -/
def wmC (gd : GridData) (T : Tables) (w m : Nat) (n : Int) : Ival :=
  sumI (List.range gd.Nr) fun i => mulI (T.radAt i m) (angSumC gd T w n i)
def wmS (gd : GridData) (T : Tables) (w m : Nat) (n : Int) : Ival :=
  sumI (List.range gd.Nr) fun i => mulI (T.radAt i m) (angSumS gd T w n i)

/-- The weighted cell functional of a polynomial, given the weighted moments. -/
def polyI (fC fS : Nat → Int → Ival) (P : CP) : Ival :=
  (CP.polar P).foldl (fun acc t => addI acc (addI (mulI (ofKQ t.cc) (fC t.m t.n))
    (mulI (ofKQ t.cs) (fS t.m t.n)))) zeroI

/-- The tail functional of a polynomial. -/
def tailPolyI (T : Tables) (P : CP) : Ival :=
  (CP.polar P).foldl (fun acc t => if t.n = 0 then addI acc (mulI (ofKQ t.cc) (T.tailAt t.m))
    else acc) zeroI

/-- The entry `(I, J)` (`I ≤ J`) from the weighted cell functionals `cw w P` and the tail. -/
def entryOf (ell beta : Rat) (cw : Nat → CP → Ival) (tl : CP → Ival) (I J : Nat) : Ival :=
  if I = 0 then
    (if J = 0 then addI (addI (cw 0 (l2CP ell beta)) (cw 1 oneCP))
      (addI (tl (l2CP ell beta)) (tl oneCP))
    else cw 2 (uCP ell beta (J - 1)))
  else if J = 0 then cw 2 (uCP ell beta (I - 1))
  else addI (addI (cw 0 (gCP (I - 1) (J - 1))) (negI (cw 3 (uuCP ell beta (I - 1) (J - 1)))))
    (tl (gCP (I - 1) (J - 1)))

/-- The matrix of the entries (`entryOf` on the upper triangle, mirrored). -/
def matOf (ell beta : Rat) (cw : Nat → CP → Ival) (tl : CP → Ival) : Array (Array Ival) :=
  ((List.range 13).map fun I => ((List.range 13).map fun J =>
    if I ≤ J then entryOf ell beta cw tl I J else entryOf ell beta cw tl J I).toArray).toArray

/-- The memo of a function on `[0, k)`. -/
def memo {α : Type} (k : Nat) (f : Nat → α) (_d : α) : Array α := ((List.range k).map f).toArray

/-- A three-level memo table. -/
def memo3 {α : Type} (k1 : Nat) (k2 : Nat → Nat) (k3 : Nat → Nat → Nat) (f : Nat → Nat → Nat → α)
    (d : α) : Array (Array (Array α)) :=
  memo k1 (fun a => memo (k2 a) (fun b => memo (k3 a b) (f a b) d) #[]) #[]

/-- Lookup in a three-level table with a fallback. -/
def get3 {α : Type} (A : Array (Array (Array α))) (a b c : Nat) (e : α) : α :=
  ((A.getD a #[]).getD b #[]).getD c e

/-- The number of angular harmonics tabulated for the weight `w`. -/
def nwOf (w : Nat) : Nat := if w = 0 then 4 else if w = 1 then 1 else if w = 2 then 3 else 5

/-- `Σᵢ Rad(i, m) g(w, n, i)`. -/
def mCW (gd : GridData) (T : Tables) (g : Nat → Nat → Nat → Ival) (w m n : Nat) : Ival :=
  sumI (List.range gd.Nr) fun i => mulI (T.radAt i m) (g w n i)

/-- **The enclosure of the coefficient matrix** (fast version: the weights, the angular sums and
the weighted moments are tabulated once). -/
def matI (ell beta : Rat) (gd : GridData) (T : Tables) : Array (Array Ival) :=
  let wA := memo3 gd.Nr (fun _ => gd.N) (fun _ _ => 4) (fun i j w => wI gd w i j) zeroI
  let wf := fun w i j => get3 wA i j w (wI gd w i j)
  let sC := memo3 4 nwOf (fun _ _ => gd.Nr) (fun w n => angSumCW gd.N wf T w n) zeroI
  let sS := memo3 4 nwOf (fun _ _ => gd.Nr) (fun w n => angSumSW gd.N wf T w n) zeroI
  let gC := fun w n i => get3 sC w n i (angSumCW gd.N (wI gd) T w n i)
  let gS := fun w n i => get3 sS w n i (angSumSW gd.N (wI gd) T w n i)
  let tC := memo3 4 (fun _ => 13) (fun w _ => nwOf w) (fun w m n => mCW gd T gC w m n) zeroI
  let tS := memo3 4 (fun _ => 13) (fun w _ => nwOf w) (fun w m n => mCW gd T gS w m n) zeroI
  let fC := fun w m (n : Int) => get3 tC w m n.natAbs (wmC gd T w m n.natAbs)
  let fS := fun w m (n : Int) =>
    let v := get3 tS w m n.natAbs (wmS gd T w m n.natAbs)
    if n < 0 then negI v else v
  matOf ell beta (fun w P => polyI (fC w) (fS w) P) (tailPolyI T)

/-- The polynomials of the entries. -/
def entryPolys (ell beta : Rat) : List CP :=
  [l2CP ell beta, oneCP] ++ (List.range 12).map (uCP ell beta) ++
    (List.range 144).map (fun k => gCP (k / 12) (k % 12)) ++
    (List.range 144).map (fun k => uuCP ell beta (k / 12) (k % 12))

/-- The degree bounds `m ≤ 16`, `|n| ≤ 12` of the table hypothesis. -/
def polyBoundsOK (ell beta : Rat) : Bool :=
  (entryPolys ell beta).all fun P => (CP.polar P).all fun t => decide (t.m ≤ 16) && decide (t.n.natAbs ≤ 12)

/-- The lower endpoints as rationals. -/
def loQ (M : Array (Array Ival)) : List (List Rat) :=
  M.toList.map fun a => a.toList.map fun I => (I.lo : Rat) / (D : Rat)
/-- The upper endpoints as rationals. -/
def hiQ (M : Array (Array Ival)) : List (List Rat) :=
  M.toList.map fun a => a.toList.map fun I => (I.hi : Rat) / (D : Rat)

end GrotheKernel
