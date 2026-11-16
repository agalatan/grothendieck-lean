import Grothe.LowerAnalytic.CapConstrDefs
import Grothe.LowerAnalytic.CapTablesData
import GrotheCapsKernel.CapCheckNu

/-!
# Replay harness for stored cap pieces of the identity-tail certificate (scratch; not in the repository)

claude-b9ee worker, issue #183, 16 Nov 2026.  For a stored piece (row constants, node `s`, table cap,
the generator's value, grid, recipe, constraints) it runs the kernel with a tail exactly as a piece
fact would (`mkGridNu`, `matINu`, `pieceOKc` at `cap + capPad`) and also computes the least cap that
the check accepts: the check matrix is `N₀ + cap·e₀e₀ᵀ`, so with index `0` eliminated last the last
pivot of the exact `LDLᵀ` is `cap − capMin`.  It prints a hash of all price numerators for the
comparison between machines.
-/

open GrotheKernel Grothe.Lower Grothe.LowerAnalytic

namespace Grothe.Replay

/-- `mMat` with the witness parameter as an argument. -/
def mMatE (E : Sym3) (R : Sym2) (eps : ℚ) (i j : ℕ) : ℚ :=
  let e : ℕ → ℕ → ℚ := fun a b =>
    match a, b with
    | 0, 0 => E.m11 | 0, 1 => E.m12 | 0, 2 => E.m13
    | 1, 0 => E.m12 | 1, 1 => E.m22 | 1, 2 => E.m23
    | 2, 0 => E.m13 | 2, 1 => E.m23 | 2, 2 => E.m33
    | _, _ => 0
  let r : ℕ → ℕ → ℚ := fun a b =>
    match a, b with
    | 0, 0 => R.m11 | 0, 1 => R.m12 | 1, 0 => R.m12 | 1, 1 => R.m22
    | _, _ => 0
  if i < 3 ∧ j < 3 then e i j
  else if 3 ≤ i ∧ i < 6 ∧ 3 ≤ j ∧ j < 6 then e (i - 3) (j - 3)
  else if 6 ≤ i ∧ i < 8 ∧ 6 ≤ j ∧ j < 8 then r (i - 6) (j - 6)
  else if 8 ≤ i ∧ i < 10 ∧ 8 ≤ j ∧ j < 10 then r (i - 8) (j - 8)
  else if 10 ≤ i ∧ i < 12 ∧ i = j then eps
  else 0

/-- A stored piece. `th`: E11 E12 E13 E22 E23 E33 R11 R12 R22 a1 a2 a3 ell beta (the row in `s` units). -/
structure Piece where
  name : String
  th : List String
  s : String
  cap : String
  pyval : String
  N : Nat
  gauss : Bool
  recipe : String
  dirs : List String
  cons : List String

/-- `⌊10¹⁸ x⌋`. -/
def q18 (x : ℚ) : Int := Rat.floor (x * 10 ^ 18)

/-- A hash of all cell numerators `(D2, D3, G)` and the number of cells with `G = 0`. -/
def hashGrid (gd : GridDataNu) : Nat × Nat :=
  (List.range gd.Nr).foldl (fun acc i => (List.range gd.N).foldl (fun acc j =>
    ((acc.1 * 1000003 + gd.D2 i j + 7919 * gd.D3 i j + 104729 * gd.G i j) % 2305843009213693951,
      acc.2 + (if gd.G i j = 0 then 1 else 0))) acc) (0, 0)

/-- Print a result line; when the environment variable `OUT` names a directory (cloud jobs), append
it to `OUT/replay_<tag>.txt` as well. -/
def emit (tag line : String) : IO Unit := do
  IO.println line
  match (← IO.getEnv "OUT") with
  | some out => IO.FS.withFile (out ++ "/replay_" ++ tag ++ ".txt") .append fun h => h.putStrLn line
  | none => pure ()

def runPiece (tag : String) (eps nu : ℚ) (T : Tables) (x : Piece) : IO Unit := do
  let t0 ← IO.monoMsNow
  let th := x.th.map parseRat
  let g := fun k => th.getD k 0
  let E : Sym3 := ⟨g 0, g 1, g 2, g 3, g 4, g 5⟩
  let R : Sym2 := ⟨g 6, g 7, g 8⟩
  let av : ℕ → ℚ := fun j => if j < 3 then g (9 + j) else 0
  let ell := g 12
  let beta := g 13
  let s := parseRat x.s
  let cap := parseRat x.cap
  let py := parseRat x.pyval
  let rc := parseRecipe x.recipe
  let gd ← IO.lazyPure fun _ => mkGridNu ell beta nu rc x.gauss 1600 x.N (1 / 200) T
  let tg ← IO.monoMsNow
  let hsh ← IO.lazyPure fun _ => hashGrid gd
  let t1 ← IO.monoMsNow
  let M ← IO.lazyPure fun _ => matINu ell beta gd T
  let lo := loQ M
  let up := hiQ M
  let enc ← IO.lazyPure fun _ => enclOK lo up 13
  let t2 ← IO.monoMsNow
  let ds := parseDirs x.dirs
  let cs := x.cons.map (parseCons ds)
  let Mq := mMatE E R eps
  let Tup := loewnerUp lo up 13
  let N0 := pieceN Mq av s 0 Tup
  let Nc : QMat := QMat.ofFn 13 fun i j => N0.at i j - (cs.map fun c => c.sMat Mq i j).sum
  let perm := fun (k : ℕ) => if k < 12 then k + 1 else 0
  let Np : QMat := QMat.ofFn 13 fun i j => Nc.at (perm i) (perm j)
  let r := ldl Np 13
  let pivOK := (List.range 12).all fun k => decide (0 < r.2.getD k 0)
  let capMin ← IO.lazyPure fun _ => -(r.2.getD 12 0)
  let t3 ← IO.monoMsNow
  -- the check of a piece fact, with the real `pieceOKc`
  let ok ← IO.lazyPure fun _ => polyBoundsOKNu ell beta && pieceOKc lo up Mq av s (cap + capPad) cs
  let t4 ← IO.monoMsNow
  emit tag s!"RP {x.name} | ok={ok} enc={enc} consOK={cs.all Cons.ok} pivOK={pivOK} | leanMin-py(1e-18)={q18 (capMin - py)} | cap+pad-leanMin(1e-18)={q18 (cap + capPad - capMin)} | cap-py(1e-18)={q18 (cap - py)} | G0cells={hsh.2} hash={hsh.1} | D(100,10)={gd.D2 100 10},{gd.D3 100 10},{gd.G 100 10} D(800,100)={gd.D2 800 100},{gd.D3 800 100},{gd.G 800 100} | ms grid={tg - t0} hash={t1 - tg} matI={t2 - t1} min={t3 - t2} check={t4 - t3}"

/-- A hash of the bits of a `FloatArray`. -/
def hashFloats (a : FloatArray) : Nat :=
  (List.range a.size).foldl (fun acc k => (acc * 1000003 + (a.get! k).toBits.toNat) % 2305843009213693951) 0

def runAll (tag : String) (eps nu : ℚ) (ps : List Piece) : IO Unit := do
  emit tag s!"RP consts {[fZero, fHalf, fOne, fTwo, fThree, fFour, fTenth, fMeanMin, fObjOut, fObjMax, fDescent, fStepTol, fLowTol, fMassMin].map (·.toBits)}"
  for n in (ps.map (·.N)).eraseDups do
    let tr := gaussTrig n
    emit tag s!"RP trig {n}: cos {hashFloats tr.1} sin {hashFloats tr.2}"
    let t0 ← IO.monoMsNow
    let T ← IO.lazyPure fun _ => mkTables 1600 n (1 / 200)
    let sz := T.rad.size + T.ang.size
    let t1 ← IO.monoMsNow
    emit tag s!"RP tables 1600x{n} ({sz}): {t1 - t0} ms"
    for p in ps.filter (·.N == n) do
      runPiece tag eps nu T p

end Grothe.Replay
