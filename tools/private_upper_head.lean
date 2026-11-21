import Grothe.UpperReplacement.RootData
import GrotheQuadKernel.Basic
import Grothe.UpperReplacement.CellHeadCompute
import Grothe.UpperReplacement.CellData
import Grothe.UpperReplacement.HeadCompute
import Grothe.Upper.Data

/-!
Exact cell-head witness generation. Agent-ID: codex-a7c4.
Run with tools/replay_private_upper_head.py. This IO program asserts no theorem: the saved
intervals must pass HeadWitness.groupOK and the aggregate HeadCompute.headOK in Lean.
-/

open GrotheKernel GrotheKernel.HardyArc Grothe.UpperReplacement
open CellHeadCompute Certificate

def showInterval (v : Ival) : String :=
  GrotheQuad.toDecimal 28 (GrotheQuad.ofFixed GrotheKernel.K v.lo v.hi)

def say (s : String) : IO Unit := do
  IO.println s
  (← IO.getStdout).flush

def saveHead (path : System.FilePath) (v : Array Ival) : IO Unit :=
  IO.FS.writeFile path (String.intercalate "\n" (v.toList.map fun x ↦ s!"{x.lo},{x.hi}"))

def main (args : List String) : IO Unit := do
  if args == ["--help"] then
    say "Usage: tools/replay_private_upper_head.py [--output-dir DIR]"
    return
  let output : System.FilePath ← match args with
    | [path] => pure path
    | _ => throw (IO.userError "Expected exactly one output-directory argument")
  IO.FS.createDirAll output
  say "Preparing exact roots and dyadic response tables"
  let roots : Array CI := RootData.roots64
  let roots2 : Array CI := RootData.roots128
  let F := CellEncoding.decode leftCellRows
  let G := CellEncoding.decode rightCellRows
  say s!"Roots {roots.size}+{roots2.size}; cells {F.size}+{G.size}"
  let grid := moments 1024 128 128 252 6
  say s!"Moment grid ready: {grid.size} cells"
  let mut heads : Array (Array Ival) := #[]
  for residue in [0:64] do
    say s!"Starting residue {residue}"
    let head := residueHead 125 128 64 1024 (2 ^ 26) residue
      roots roots2 RootData.piInvI grid F G
    saveHead (output / s!"head125-residue-{residue}.txt") head
    heads := heads.push head
    say s!"Finished residue {residue}; linear={showInterval (getI head 0)}"
  let grades := headsSum 125 heads.toList
  saveHead (output / "head125-grades.txt") grades
  say s!"Cell grades ready; grade zero={showInterval (getI grades 0)}"
  let mixed := HeadCompute.mixtureHead 251 Grothe.Upper.energyRows grades RootData.piI
  saveHead (output / "head125-mixture.txt") mixed.toArray
  say s!"Mixture linear={showInterval (mixed.getD 0 zeroI)}"
  say s!"Nonlinear head upper numerator={absSum (mixed.drop 1)}; denominator={D}"
  if HeadCompute.headOK 251 Grothe.Upper.energyRows grades RootData.piI
      (711964618746086 / 10 ^ 15) (873503595 / 10 ^ 15) then
    say "Head check=true (the closed Lean facts must still be built)"
  else
    throw (IO.userError "Head check failed")
