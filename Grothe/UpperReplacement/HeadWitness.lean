import Grothe.UpperReplacement.CellHeadCompute
import Grothe.UpperReplacement.CellData
import Grothe.UpperReplacement.RootData

/-!
# Replayable eight-residue cell-head witnesses

Agent-ID: codex-a7c4. Each check recomputes all modes of eight residues, sharing one exact
moment grid. Saved intervals are accepted only if they contain every recomputed interval.
-/

namespace Grothe.UpperReplacement.HeadWitness

open GrotheKernel CellHeadCompute Certificate

def encloses (outer inner : Ival) : Bool :=
  decide (outer.lo ≤ inner.lo ∧ inner.hi ≤ outer.hi)

def arrayEncloses (N : Nat) (outer inner : Array Ival) : Bool :=
  (List.range N).all fun j ↦ encloses (getI outer j) (getI inner j)

def groupOK (start : Nat) (saved : Array (Array Ival)) : Bool :=
  let gridInt := RadialCompute.toIntGrid 1024 (momentsShared 1024 128 128 252 6)
  let cellsF := tableCells26 (CellEncoding.decode leftCellRows)
  let cellsG := tableCells26 (CellEncoding.decode rightCellRows)
  (List.range 8).all fun k ↦
    arrayEncloses 126 (saved[k]?.getD #[])
      (residueHeadFast 125 128 64 1024 (start + k)
        RootData.roots64 RootData.roots128 RootData.piInvI gridInt cellsF cellsG)

def savedResidue (groups : Array (Array (Array Ival))) (r : Nat) : Array Ival :=
  (groups[r / 8]?.getD #[])[r % 8]?.getD #[]

def savedGrades (groups : Array (Array (Array Ival))) : Array Ival :=
  headsSum 125 ((List.range 64).map (savedResidue groups))

end Grothe.UpperReplacement.HeadWitness
