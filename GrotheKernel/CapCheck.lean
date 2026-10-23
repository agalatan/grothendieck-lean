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

/-- A uniform grid with dyadic cell prices, stored by their numerators: `pa = PA/2⁵⁰`,
`na = NA/2⁵⁰`, `gg = G/2¹⁰⁰`, the ring bound `rl = RL/2⁵⁰`. -/
structure GridData where
  Nr : Nat
  N : Nat
  h : Rat
  PA : Nat → Nat → Nat
  PB : Nat → Nat → Nat
  NA : Nat → Nat → Nat
  NB : Nat → Nat → Nat
  G : Nat → Nat → Nat
  RL : Nat → Nat

/-- `2⁵⁰`. -/
def two50 : Nat := 1125899906842624
/-- `2¹⁰⁰`. -/
def two100 : Nat := two50 * two50

def GridData.pa (gd : GridData) (i j : Nat) : Rat := (gd.PA i j : Rat) / two50
def GridData.pb (gd : GridData) (i j : Nat) : Rat := (gd.PB i j : Rat) / two50
def GridData.na (gd : GridData) (i j : Nat) : Rat := (gd.NA i j : Rat) / two50
def GridData.nb (gd : GridData) (i j : Nat) : Rat := (gd.NB i j : Rat) / two50
def GridData.gg (gd : GridData) (i j : Nat) : Rat := (gd.G i j : Rat) / two100
def GridData.rl (gd : GridData) (i : Nat) : Rat := (gd.RL i : Rat) / two50
/-- The common bound of the prices. -/
def GridData.c (_gd : GridData) : Rat := (2 : Rat) ^ 151

/-- The cell conditions. -/
def cellOK (gd : GridData) (ell beta : Rat) (i j : Nat) : Bool :=
  decide (0 < gd.pa i j) && decide (0 < gd.pb i j) && decide (1 ≤ gd.na i j * gd.pa i j) &&
    decide (1 ≤ gd.nb i j * gd.pb i j) && decide (0 ≤ gd.gg i j) &&
    decide (rlb ell beta ((i + 1) * gd.h) ≤ gd.rl i) &&
    decide (gd.gg i j * majDq (gd.pa i j) (gd.pb i j) (gd.rl i) ≤ 8) &&
    decide (gd.pa i j ≤ gd.c) && decide (gd.pb i j ≤ gd.c) && decide (gd.na i j ≤ gd.c) &&
    decide (gd.nb i j ≤ gd.c) && decide (gd.gg i j ≤ gd.c)

/-- The grid check (not run: `gridOK_mkGrid` proves it for every recipe grid). -/
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

/-- A rational `p` or `p/q` from a string (`0` on malformed input; recipes are search data). -/
def parseRat (s : String) : Rat :=
  match s.splitOn "/" with
  | [a] => ((a.toInt?).getD 0 : Rat)
  | [a, b] => ((a.toInt?).getD 0 : Rat) / ((b.toNat?).getD 1 : Rat)
  | _ => 0

/-- A recipe `v₀|f₁|…|scale` (comma-separated rationals). -/
def parseRecipe (s : String) : Recipe :=
  let parts := s.splitOn "|"
  let vec := fun (t : String) => (t.splitOn ",").map parseRat
  match parts with
  | [] => ⟨[], [], 1⟩
  | v :: rest =>
    let sc := (rest.getLast?).getD "1"
    ⟨vec v, (rest.dropLast).map vec, parseRat sc⟩

/-- The recipes of a row from their string encoding. -/
def parseRecs (l : List (Nat × Nat × String)) : List (Nat × Nat × Recipe) :=
  l.map fun x => (x.1, x.2.1, parseRecipe x.2.2)

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

/-- The dyadic price numerator `max 1 ⌊2⁵⁰ x⌋` (at most `2⁶⁴`). -/
def dyNum (x : Float) : Nat :=
  let y := (x * 1125899906842624.0).floor
  max 1 (if y < 1.0 then 1 else if y > 1.0e19 then 10000000000000000000 else y.toUInt64.toNat)

/-- `|a − b|` on `Nat`. -/
def natDist (a b : Nat) : Nat := if b ≤ a then a - b else b - a

/-- The scaled denominator `2¹⁵⁰ D(pa, pb, rl)` from the numerators. -/
def majN (PA PB RL : Nat) : Nat :=
  (PA + PB) * ((PA + PB) ^ 2 + 4 * RL ^ 2 + 4 * RL * natDist PA PB)

/-- The ring bound numerator `⌈2⁵⁰ rlb((i+1)h)⌉`. -/
def rlNum (ell beta h : Rat) (i : Nat) : Nat := (-(Rat.floor (-(rlb ell beta ((i + 1) * h) * two50)))).toNat

/-- The cell numerators `(PA, PB, NA, NB, G)` of a ring. -/
def ringCells (ell beta : Rat) (r : Recipe) (N : Nat) (h : Rat) (radF : Nat → Nat → Float)
    (angF : Nat → Int → Float × Float) (tP tM : List (Nat × Int × Float × Float)) (i : Nat) :
    Array (Nat × Nat × Nat × Nat × Nat) :=
  let RL := rlNum ell beta h i
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
    (pA, pB, (two100 + pA - 1) / pA, (two100 + pB - 1) / pB, 8 * two100 * two100 * two50 / majN pA pB RL)).toArray

/-- The grid of a recipe. -/
@[noinline] def mkGrid (ell beta : Rat) (r : Recipe) (Nr N : Nat) (h : Rat) (T : Tables) : GridData :=
  let radA : Array (Array Float) := T.rad.map fun a => a.map ivF
  let angA : Array (Array (Float × Float)) := T.ang.map fun a => a.map fun p => (ivF p.1, ivF p.2)
  let radF := fun i m => (radA.getD i #[]).getD m 0.0
  let angF := fun (j : Nat) (n : Int) =>
    let p := (angA.getD j #[]).getD n.natAbs (0.0, 0.0)
    if n < 0 then (p.1, -p.2) else p
  let tP := polarF (priceCP ell beta r 1)
  let tM := polarF (priceCP ell beta r (-1))
  let cells : Array (Array (Nat × Nat × Nat × Nat × Nat)) :=
    ((List.range Nr).map (ringCells ell beta r N h radF angF tP tM)).toArray
  let get := fun i j => (cells.getD i #[]).getD j (1, 1, two100, two100, 0)
  ⟨Nr, N, h, fun i j => (get i j).1, fun i j => (get i j).2.1, fun i j => (get i j).2.2.1,
    fun i j => (get i j).2.2.2.1, fun i j => (get i j).2.2.2.2, rlNum ell beta h⟩

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

/-- The weight intervals, in integer arithmetic at the scale `2¹²⁸` from the numerators
(`mem_wI`: they enclose `wQ`). -/
def wI (gd : GridData) (w i j : Nat) : Ival :=
  let PA : Int := gd.PA i j
  let PB : Int := gd.PB i j
  let NA : Int := gd.NA i j
  let NB : Int := gd.NB i j
  let G : Int := gd.G i j
  let d := PA ^ 2 - PB ^ 2
  match w with
  | 0 => let v := (NA + NB) * 2 ^ 77; ⟨v, v⟩
  | 1 => let a := (PA + PB) * 2 ^ 77; let x := G * d ^ 2
    ⟨a - (-((-x) / 2 ^ 176)), a - x / 2 ^ 176⟩
  | 2 => let a := (NA - NB) * 2 ^ 77; let x := G * d
    ⟨a + x / 2 ^ 74, a + (-((-x) / 2 ^ 74))⟩
  | _ => let v := G * 2 ^ 28; ⟨v, v⟩

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

/-- Lookup in a three-level table with a (lazy) fallback. -/
def get3 {α : Type} (A : Array (Array (Array α))) (a b c : Nat) (e : Unit → α) : α :=
  let r := (A.getD a #[]).getD b #[]
  if h : c < r.size then r[c] else e ()

/-- The number of angular harmonics tabulated for the weight `w`. -/
def nwOf (w : Nat) : Nat := if w = 0 then 4 else if w = 1 then 1 else if w = 2 then 3 else 5

/-- `Σᵢ Rad(i, m) g(w, n, i)`. -/
def mCW (gd : GridData) (T : Tables) (g : Nat → Nat → Nat → Ival) (w m n : Nat) : Ival :=
  sumI (List.range gd.Nr) fun i => mulI (T.radAt i m) (g w n i)

/-- **The enclosure of the coefficient matrix** (fast version: the weights, the angular sums and
the weighted moments are tabulated once). -/
@[noinline] def matI (ell beta : Rat) (gd : GridData) (T : Tables) : Array (Array Ival) :=
  let wA := memo3 gd.Nr (fun _ => gd.N) (fun _ _ => 4) (fun i j w => wI gd w i j) zeroI
  let wf := fun w i j => get3 wA i j w (fun _ => wI gd w i j)
  let sC := memo3 4 nwOf (fun _ _ => gd.Nr) (fun w n => angSumCW gd.N wf T w n) zeroI
  let sS := memo3 4 nwOf (fun _ _ => gd.Nr) (fun w n => angSumSW gd.N wf T w n) zeroI
  let gC := fun w n i => get3 sC w n i (fun _ => angSumCW gd.N (wI gd) T w n i)
  let gS := fun w n i => get3 sS w n i (fun _ => angSumSW gd.N (wI gd) T w n i)
  let tC := memo3 4 (fun _ => 13) (fun w _ => nwOf w) (fun w m n => mCW gd T gC w m n) zeroI
  let tS := memo3 4 (fun _ => 13) (fun w _ => nwOf w) (fun w m n => mCW gd T gS w m n) zeroI
  let fC := fun w m (n : Int) => get3 tC w m n.natAbs (fun _ => wmC gd T w m n.natAbs)
  let fS := fun w m (n : Int) =>
    let v := get3 tS w m n.natAbs (fun _ => wmS gd T w m n.natAbs)
    if n < 0 then negI v else v
  matOf ell beta (fun w P => polyI (fC w) (fS w) P) (tailPolyI T)

/-- The polynomials of the entries. -/
def entryPolys (ell beta : Rat) : List CP :=
  [l2CP ell beta, oneCP] ++ (List.range 12).map (uCP ell beta) ++
    (List.range 144).map (fun k => gCP (k / 12) (k % 12)) ++
    (List.range 144).map (fun k => uuCP ell beta (k / 12) (k % 12))

/-- The degree bounds `m ≤ 16`, `|n| ≤ 12` of the table hypothesis. -/
@[noinline] def polyBoundsOK (ell beta : Rat) : Bool :=
  (entryPolys ell beta).all fun P => (CP.polar P).all fun t => decide (t.m ≤ 16) && decide (t.n.natAbs ≤ 12)

/-- The lower endpoints as rationals. -/
@[noinline] def loQ (M : Array (Array Ival)) : List (List Rat) :=
  M.toList.map fun a => a.toList.map fun I => (I.lo : Rat) / (D : Rat)
/-- The upper endpoints as rationals. -/
@[noinline] def hiQ (M : Array (Array Ival)) : List (List Rat) :=
  M.toList.map fun a => a.toList.map fun I => (I.hi : Rat) / (D : Rat)

end GrotheKernel
