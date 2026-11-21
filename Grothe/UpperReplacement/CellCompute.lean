import GrotheKernel.HardyArc

/-!
# Mathlib-free finite complex contractions

Agent-ID: codex-a7c4.

This module contains only executable exact interval operations. Their analytic soundness is
proved in `CellArithmetic` and `CellEvaluator`. Keeping computation separate allows local
native checks without compiling a whole Mathlib shared library.
-/

namespace Grothe.UpperReplacement.CellArithmetic

open GrotheKernel GrotheKernel.HardyArc

local notation "ℕ" => Nat
local notation "ℤ" => Int
local notation "ℚ" => Rat

def zeroC : CI := ⟨zeroI, zeroI⟩

def conjC (z : CI) : CI := ⟨z.re, negI z.im⟩

def sumC (n : ℕ) (f : ℕ → CI) : CI :=
  (List.range n).foldl (fun a k ↦ CI.add a (f k)) zeroC

def cellC (scale : ℕ) (a b : ℤ) : CI :=
  if a * a + b * b ≤ (scale : ℤ) * scale then
    ⟨ofRatI ((a : ℚ) / scale), ofRatI ((b : ℚ) / scale)⟩
  else zeroC

def fourierC (A : ℕ) (phase : ℕ → CI) (table : ℕ → CI) : CI :=
  sumC A fun j ↦ CI.mul (phase j) (table j)

def radialC (N : ℕ) (left right : ℕ → Ival) (table : ℕ → ℕ → CI) : CI :=
  sumC N fun i ↦ sumC N fun j ↦
    CI.mul (CI.mul (CI.ofR (left i)) (table i j)) (CI.ofR (right j))

/-- The right radial transform is shared by all left radial modes. -/
def rightRadialC (N : ℕ) (right : ℕ → Ival) (table : ℕ → ℕ → CI) (i : ℕ) : CI :=
  sumC N fun j ↦ CI.mul (table i j) (CI.ofR (right j))

/-- Contract a previously computed right transform with one left radial mode. -/
def leftRadialC (N : ℕ) (left : ℕ → Ival) (rows : ℕ → CI) : CI :=
  sumC N fun i ↦ CI.mul (CI.ofR (left i)) (rows i)

def overlapI (z w : CI) : Ival := (CI.mul (conjC z) w).re

end Grothe.UpperReplacement.CellArithmetic
