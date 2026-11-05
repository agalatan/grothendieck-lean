import GrotheQuadKernel.Twist

/-!
# The Hermite dilation and the dilated functional

For `μ = λ^{−1/2}` the dilated Hermite functions expand finitely in the undilated ones,
`h_{e,f}(μ w) = Σ_{g ≤ e, h ≤ f, g − h = e − f} T[e,f; g,h] h_{g,h}(w)`, with `T` defined by the
recurrence that mirrors the ladders (`docs/UPPER_CLOSURE.md` §8.1):

    T[0,0; 0,0]   = 1
    T[0,f+1; g,h] = μ (√h T[0,f; g,h−1] + √(g+1) T[0,f; g+1,h]) / √(f+1)
    T[e+1,f; g,h] = (μ (√g T[e,f; g−1,h] + √(h+1) T[e,f; g,h+1]) − √f T[e,f−1; g,h]) / √(e+1).

The table stores, for each `(e, f)` with `e + f ≤ D`, the entries indexed by `m = min(g, h)`
(`(g, h) = (m + e − f, m)` for `e ≥ f`, `(m, m + f − e)` otherwise), with the factor `λ⁻¹` of the
Gaussian change of variables folded in.  Then the dilated functional
`K_{e,f} = λ⁻¹ Σ_m T[e,f; m] · σ^{g+h} I_{g,h}(A√λ)` (`dilate`), where `I` is the full signed triangle
of canonical coefficients at the rescaled shift (`fullTriangleTw`).

Agent-ID: claude-b9ee. Refs #41, #313.
-/

namespace GrotheQuad

/-- A row `T[e,f; ·]` as an array over `m = min(g, h)`. -/
abbrev DilRow := Array Ival

/-- Read `T[e,f; g,h]` from the rows of the level `e` (`rows[f] = T[e,f;·]`): zero unless `g ≤ e`,
`h ≤ f` and `g + f = h + e`. -/
def tget (e : Nat) (rows : Array DilRow) (f g h : Nat) : Ival :=
  if g ≤ e && h ≤ f && g + f == h + e then (rows.getD f #[]).getD (min g h) zeroI else zeroI

/-- The pair `(g, h)` of charge `e − f` with `min = m`. -/
def pairOfMin (e f m : Nat) : Nat × Nat := if e ≥ f then (m + (e - f), m) else (m, m + (f - e))

/-- The level `e = 0`: `T[0,f; ·]` for `f = 0 … D` (the zero row via the `w̄` ladder). -/
def dilLevel0 (P : Nat) (mu : Ival) (sq : Array Ival) (D : Nat) : Array DilRow :=
  (List.range D).foldl (fun rows f =>
    rows.push #[divI P (mulI P mu (addI P (mulI P (sq.getD (f + 1) zeroI) (tget 0 rows f 0 f))
      (mulI P (sq.getD 1 zeroI) (tget 0 rows f 1 (f + 1))))) (sq.getD (f + 1) zeroI)])
    #[#[ofInt P 1]]

/-- The level `e + 1` from the level `e`: `T[e+1,f; ·]` for `f = 0 … D − e − 1`. -/
def dilLevelNext (P : Nat) (mu : Ival) (sq : Array Ival) (D e : Nat) (prev : Array DilRow) :
    Array DilRow :=
  Array.ofFn fun f : Fin (D - e) => Array.ofFn fun i : Fin (min (e + 1) f.val + 1) =>
    let gh := pairOfMin (e + 1) f.val i.val
    divI P (subI P (mulI P mu (addI P (mulI P (sq.getD gh.1 zeroI) (tget e prev f.val (gh.1 - 1) gh.2))
      (mulI P (sq.getD (gh.2 + 1) zeroI) (tget e prev f.val gh.1 (gh.2 + 1)))))
      (mulI P (sq.getD f.val zeroI) (tget e prev (f.val - 1) gh.1 gh.2)))
      (sq.getD (e + 1) zeroI)

/-- All levels `e = 0 … D` (index `e`), with `λ⁻¹` folded in: `dil[e][f][m]` (floating intervals:
the dilated functional's entries span a huge dynamic range and need relative precision). -/
def dilTable (P : Nat) (lam : Ival) (D : Nat) : Array (Array (Array Ival)) :=
  let mu := invI P (sqrtI P lam)
  let invLam := invI P lam
  let sq := sqrtTable P (D + 2)
  let conv : Array DilRow → Array (Array Ival) := fun rows =>
    rows.map fun row => row.map fun t => mulI P invLam t
  let l0 := dilLevel0 P mu sq D
  ((List.range D).foldl (fun (st : Array DilRow × Array (Array (Array Ival))) e =>
      let next := dilLevelNext P mu sq D e st.1
      (next, st.2.push (conv next)))
    (l0, #[conv l0])).2

/-- A triangular array of intervals. -/
abbrev IvVec := Array (Array Ival)

def ivGet (v : IvVec) (c d : Nat) : Ival := (v.getD c #[]).getD d zeroI

def ivOfFn (D : Nat) (f : Nat → Nat → Ival) : IvVec :=
  Array.ofFn fun c : Fin (D + 1) => Array.ofFn fun d : Fin (D + 1 - c.val) => f c.val d.val

/-- The dilated functional: `K_{e,f} = Σ_m dil[e][f][m] · I_{g(m),h(m)}` on the degree `D`. -/
def dilate (P : Nat) (dil : Array (Array (Array Ival))) (D : Nat) (I : IvVec) : IvVec :=
  ivOfFn D fun e f =>
    sumRangeI P (min e f + 1) fun m =>
      mulI P (((dil.getD e #[]).getD f #[]).getD m zeroI)
        (ivGet I (pairOfMin e f m).1 (pairOfMin e f m).2)

/-- `√((h+1)/g)` (`g ≥ 1`). -/
def reflectI (P : Nat) (g h : Nat) : Ival := sqrtI P (ratI P (h + 1) g)

/-- The full signed triangle `σ^{g+h} I_{g,h}` on `g + h ≤ D` from the canonical values (`vals` in
canonical order with `dMax = D`): the canonical pairs `g ≤ h + 1` directly, the others by the
reflection `I_{g,h} = √((h+1)/g) I_{h+1,g−1}` (the sign parity is preserved). -/
def fullTriangleI (P : Nat) (vals : Array Ival) (D : Nat) : IvVec :=
  ivOfFn D fun g h =>
    if g ≤ h + 1 then vals.getD (canonicalRank D g h) zeroI
    else mulI P (vals.getD (canonicalRank D (h + 1) (g - 1)) zeroI) (reflectI P g h)

end GrotheQuad
