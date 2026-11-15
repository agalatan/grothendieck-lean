-- Grothe/Lower/BoxLookup.lean
import Grothe.Lower.Boxes

/-!
# Indexed decoding for the lower cover

Decode only the selected cell and witness. The equality theorems below identify
these computations with the original checker, including every range and source
check; no analytic or numerical hypothesis is introduced.
-/

namespace Grothe.Lower

/-- Decode only the requested node of a serialized cell. -/
def cellNodeAt (s : String) (ni : ℕ) : Option SNode :=
  match s.splitOn "|" with
  | [_, _, _, _, ns] => ((splitL ns ";")[ni]?).map parseSNode
  | _ => none

theorem cellNodeAt_eq (s : String) (ni : ℕ) :
    cellNodeAt s ni = (parseXCell s).nodes[ni]? := by
  unfold cellNodeAt parseXCell
  split <;> split <;> simp_all <;> (exfalso; apply_assumption <;> rfl)

/-- The original zero node without decoding unused cap entries. -/
def zeroNodeAt (r : Row) : Option TNode :=
  match splitL r.nodes ";" with
  | s :: _ => let n := parseCap s
              if n.1 = 0 then some ⟨0, ⟨n.2, 0, 0, 0, 0⟩⟩ else none
  | [] => none

theorem zeroNodeAt_eq (r : Row) : zeroNodeAt r = zeroNode r := by
  unfold zeroNodeAt zeroNode Row.nodeList
  cases splitL r.nodes ";" <;> rfl

/-- The original row lookup with indexing before cell/node decoding. -/
def rowTNodeAt (r : Row) : Option (ℕ × ℕ) → Option TNode
  | none => zeroNodeAt r
  | some (ci, ni) =>
    (r.cells[ci]?).bind fun s =>
      (cellNodeAt s ni).map fun n => ⟨n.sigma / r.delta, n.y⟩

theorem rowTNodeAt_eq (r : Row) : rowTNodeAt r = rowTNode r := by
  funext ref
  cases ref with
  | none => exact zeroNodeAt_eq r
  | some pair =>
    obtain ⟨ci, ni⟩ := pair
    simp only [rowTNodeAt, rowTNode, Row.cellList, List.getElem?_map]
    cases h : r.cells[ci]? with
    | none => rfl
    | some s =>
      simp only [Option.map_some, Option.bind_some, cellNodeAt_eq]
      cases (parseXCell s).nodes[ni]? <;> rfl

/-- Batch lookup before decoding unselected spectral witnesses. -/
def batchNodeAt (b : JBatch) (k : ℕ) : Option (TNode × ℚ) :=
  if b.spec then
    b.wits[k]?.map fun s => let w := parseSWit s
                           (⟨w.tau, w.y⟩, w.bud.xcap)
  else
    b.wits[k]?.map fun s => let w := parseWit s
                           (⟨w.1.sigma, w.1.y⟩, xMax)

theorem batchNodeAt_eq (b : JBatch) (k : ℕ) : batchNodeAt b k = b.tnodeX[k]? := by
  simp only [batchNodeAt, JBatch.tnodeX, JBatch.switList, JBatch.witList]
  split <;> simp [List.getElem?_map, Function.comp_def]

def indexedNodeOf (rows : List Row) (batches : List JBatch) (i j : ℕ) (θ xu : ℚ) : NRef → Option TNode
  | .zero r =>
    if samePot r r 0 i j θ then
      match rows[r]? with
      | some R => rowTNodeAt R none
      | none => none
    else none
  | .src r ci ni =>
    if samePot r r 0 i j θ then
      match rows[r]? with
      | some R => rowTNodeAt R (some (ci, ni))
      | none => none
    else none
  | .bat b k =>
    match batches[b]? with
    | some bt =>
      if samePot bt.i bt.j bt.θ i j θ then
        match batchNodeAt bt k with
        | some p => if xu ≤ p.2 then some p.1 else none
        | none => none
      else none
    | none => none


theorem indexedNodeOf_eq (rows : List Row) (batches : List JBatch)
    (i j : ℕ) (θ xu : ℚ) : indexedNodeOf rows batches i j θ xu = nodeOf rows batches i j θ xu := by
  funext ref
  cases ref <;> simp only [indexedNodeOf, nodeOf, rowTNodeAt_eq, batchNodeAt_eq] <;> rfl

def indexedCompRefData (rows : List Row) (batches : List JBatch) (c : CompRef) (sl su xu : ℚ) :
    Option (VRow × MPoly × MPoly) :=
  match rows[c.i]?, rows[c.j]? with
  | some Ri, some Rj =>
    if 0 ≤ c.θ ∧ c.θ ≤ 1 then
      compData (VRow.mix c.θ Ri.vrow Rj.vrow) (indexedNodeOf rows batches c.i c.j c.θ xu) c.refs c.s0
        c.s1 sl su
    else none
  | _, _ => none


theorem indexedCompRefData_eq (rows : List Row) (batches : List JBatch)
    (c : CompRef) (sl su xu : ℚ) :
    indexedCompRefData rows batches c sl su xu = compRefData rows batches c sl su xu := by
  simp only [indexedCompRefData, compRefData, indexedNodeOf_eq]
  rfl

def indexedBoxData (rows : List Row) (batches : List JBatch) (b : Box) : Option (VRow × MPoly × MPoly) :=
  match b.kind with
  | .cap _ _ _ => none
  | .one c => indexedCompRefData rows batches c b.sl b.su b.xu
  | .two θ c0 c1 =>
    mixData θ (indexedCompRefData rows batches c0 b.sl b.su b.xu)
      (indexedCompRefData rows batches c1 b.sl b.su b.xu)

/-- The bound of a box from the rows and the batches (`none` if the data are inconsistent). -/
def indexedBoxBound (rows : List Row) (batches : List JBatch) (b : Box) : Option ℚ :=
  if ¬ (0 ≤ b.sl ∧ b.sl < b.su ∧ 0 ≤ b.xl) then none else
  match b.kind with
  | .cap i j θ =>
    match envRowAt rows i, envRowAt rows j with
    | some a, some c => if 0 ≤ θ ∧ θ ≤ 1 then some (capVal a c θ b.tl b.tu) else none
    | _, _ => none
  | _ =>
    match indexedBoxData rows batches b with
    | some (a, Lm, Lp) =>
      if gateOK a.N = true ∧ 0 ≤ Lm.a6 ∧ 0 ≤ Lp.a6 then
        some (boxVal a.ell a.beta a.price Lm Lp b.tl b.tu b.sl b.su b.xl b.xu)
      else none
    | none => none


theorem indexedBoxData_eq (rows : List Row) (batches : List JBatch) (b : Box) :
    indexedBoxData rows batches b = boxData rows batches b := by
  simp only [indexedBoxData, boxData, indexedCompRefData_eq]
  rfl

theorem indexedBoxBound_eq (rows : List Row) (batches : List JBatch) (b : Box) :
    indexedBoxBound rows batches b = boxBound rows batches b := by
  simp only [indexedBoxBound, boxBound, indexedBoxData_eq]
  rfl

end Grothe.Lower
