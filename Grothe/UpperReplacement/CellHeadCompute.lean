import Grothe.UpperReplacement.CellCompute
import Grothe.UpperReplacement.RadialCompute

/-!
# Cached finite cell-head computation

Agent-ID: codex-a7c4.

The angular matrix is shared by all frequencies in one residue class. Each right radial
transform is shared by all left modes. The trigonometric enclosures are inputs, so the
large contraction can execute natively without importing analytic proofs.
This module alone asserts no coefficient enclosure.
-/

namespace Grothe.UpperReplacement.CellHeadCompute

open GrotheKernel GrotheKernel.HardyArc CellArithmetic

local notation "ℚ" => Rat

def getC (v : Array CI) (i : Nat) : CI := v[i]?.getD zeroC
def getI (v : Array Ival) (i : Nat) : Ival := v[i]?.getD zeroI

def rootAt (A : Nat) (roots : Array CI) (m : Int) : CI :=
  getC roots ((m % (A : Int)).toNat)

def sincAt (A : Nat) (roots : Array CI) (piInv : Ival) (m : Int) : Ival :=
  if m = 0 then intI 1 else
    mulI (rootAt (2 * A) roots m.natAbs).im
      (mulI (ofRatI ((A : ℚ) / m.natAbs)) piInv)

def entry (table : Array (Int × Int)) (scale N k i j : Nat) : CI :=
  let v := table[k * N * N + i * N + j]?.getD (0, 0)
  cellC scale v.1 v.2

/-- The normalized DFT before the frequency-dependent cell-width sinc factor. -/
def angularMatrix (A N scale residue : Nat) (roots : Array CI)
    (table : Array (Int × Int)) : Array CI :=
  let phases := Array.ofFn fun k : Fin A ↦ rootAt A roots (-((residue : Int) * k.val))
  let factor := CI.ofR (ofRatI (1 / (A : ℚ)))
  Array.ofFn fun ij : Fin (N * N) ↦
    CI.mul factor (fourierC A (getC phases)
      (fun k ↦ entry table scale N k (ij.val / N) (ij.val % N)))

def moments (P n N size : Nat) (R : ℚ) : Array (Array (ℚ × ℚ)) :=
  Array.ofFn fun i : Fin N ↦
    RadialCompute.fastMomentCache P n (R * i.val / N) (R * (i.val + 1) / N) size

def shift (m : Int) : Nat := if m ≤ 0 then (-m).toNat else (m - 1).toNat

def leftRadials (P count : Nat) (m : Int) (grid : Array (Array (ℚ × ℚ))) :
    Array (Array Ival) :=
  Array.ofFn fun a : Fin count ↦
    RadialCompute.radialRow P (a.val + m.toNat) (a.val + (-m).toNat) grid

def rightRadials (P count : Nat) (m : Int) (grid : Array (Array (ℚ × ℚ))) :
    Array (Array Ival) :=
  Array.ofFn fun b : Fin count ↦
    RadialCompute.radialRow P (b.val + (1 - m).toNat) (b.val + (m - 1).toNat) grid

def rightTransforms (N : Nat) (radials : Array (Array Ival)) (angular : Array CI) :
    Array (Array CI) :=
  radials.map fun row ↦ Array.ofFn fun i : Fin N ↦
    rightRadialC N (getI row) (fun i j ↦ getC angular (i * N + j)) i.val

def coefficient (N a b : Nat) (sinc : Ival) (left : Array (Array Ival))
    (right : Array (Array CI)) : CI :=
  CI.mul (CI.ofR sinc)
    (leftRadialC N (getI (left[a]?.getD #[])) (getC (right[b]?.getD #[])))

def sumI (n : Nat) (f : Nat → Ival) : Ival :=
  (List.range n).foldl (fun v k ↦ addI v (f k)) zeroI

/-- The signed overlaps at each total grade for one angular frequency. -/
def modeHead (K N P : Nat) (m : Int) (sinc : Ival) (grid : Array (Array (ℚ × ℚ)))
    (angularF angularG : Array CI) : Array Ival :=
  let offset := shift m
  let count := K + 1 - offset
  let left := leftRadials P count m grid
  let right := rightRadials P count m grid
  let rightF := rightTransforms N right angularF
  let rightG := rightTransforms N right angularG
  Array.ofFn fun j : Fin (K + 1) ↦
    if offset ≤ j.val then
      sumI (j.val - offset + 1) fun a ↦
        let b := j.val - offset - a
        overlapI (coefficient N a b sinc left rightF) (coefficient N a b sinc left rightG)
    else zeroI

def headsSum (K : Nat) (heads : List (Array Ival)) : Array Ival :=
  Array.ofFn fun j : Fin (K + 1) ↦
    heads.foldl (fun v h ↦ addI v (getI h j.val)) zeroI

/-- All frequencies in `[-K,K+1]` having one residue modulo the angular grid size. -/
def frequencies (K A residue : Nat) : List Int :=
  ((List.range (2 * K + 2)).map (fun (k : Nat) ↦ (k : Int) - K)).filter
    (fun m ↦ (m % (A : Int)).toNat == residue)

def residueHead (K N A P scale residue : Nat)
    (roots roots2 : Array CI) (piInv : Ival) (grid : Array (Array (ℚ × ℚ)))
    (F G : Array (Int × Int)) : Array Ival :=
  let angularF := angularMatrix A N scale residue roots F
  let angularG := angularMatrix A N scale residue roots G
  headsSum K ((frequencies K A residue).map fun m ↦
    modeHead K N P m (sincAt A roots2 piInv m) grid angularF angularG)

/-- A full signed grade head with an explicit precision and Taylor order. -/
def gradeHead (K N A P n scale : Nat) (R : ℚ) (roots roots2 : Array CI) (piInv : Ival)
    (F G : Array (Int × Int)) : Array Ival :=
  let grid := moments P n N (2 * K + 2) R
  headsSum K ((List.range A).map fun residue ↦
    residueHead K N A P scale residue roots roots2 piInv grid F G)

end Grothe.UpperReplacement.CellHeadCompute
