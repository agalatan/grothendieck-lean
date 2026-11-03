import Grothe.UpperChaos.PackedDyadicStructural

/-!
Kernel evaluation cases for the strict packed reader. These exercise numeric
and delimiter boundaries; they do not certify the complete packed source arrays.
Agent-ID: codex-8c4d.
-/

namespace Grothe.UpperChaos.PackedDyadic.StructuralChecks
open Structural
set_option maxRecDepth 4096
set_option maxHeartbeats 1000000

theorem natural_cases :
    (["0", "0007", "1_024", "", "_1", "1_", "1__2", "+1", "-1", "1 2", "١"]
      .map (fun s => natToken? s.toList)) =
    [some 0, some 7, some 1024, none, none, none, none, none, none, none, none] := by
  decide +kernel

theorem integer_cases :
    (["0", "-0", "-00", "-1_024", "17", "-", "+1", "--1", "-_1", "1-2"]
      .map (fun s => intToken? s.toList)) =
    [some 0, some 0, some 0, some (-1024), some 17, none, none, none, none, none] := by
  decide +kernel

theorem record_cases :
    (["1:0", "-1:8", "0:8", "1_024:8", "1:9", "1:-1", "1:0:0", ":0", "1:",
      "9007199254740991:8", "9007199254740992:8", "-9007199254740992:8"]
      .map (fun s => record? 8 s.toList)) =
    [some 256, some (-1), some 0, some 1024, none, none, none, none, none,
      some 9007199254740991, none, none] := by
  decide +kernel

theorem row_cases :
    (["", "1:8,-1:8", ",", "1:8,", ",1:8", "1:8,,0:8", "1:9"]
      .map (fun s => row? 8 s.toList)) =
    [some [], some [1, -1], none, none, none, none, none] := by
  decide +kernel

theorem chunk_cases :
    chunks? 8 (["1:8,-1:8", "", "2:7"].map String.toList) = some [1, -1, 4] ∧
    chunks? 8 (["1:8", "1:9"].map String.toList) = none := by
  decide +kernel

end Grothe.UpperChaos.PackedDyadic.StructuralChecks

open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.PackedDyadic.StructuralChecks.natural_cases,
      ``Grothe.UpperChaos.PackedDyadic.StructuralChecks.integer_cases,
      ``Grothe.UpperChaos.PackedDyadic.StructuralChecks.record_cases,
      ``Grothe.UpperChaos.PackedDyadic.StructuralChecks.row_cases,
      ``Grothe.UpperChaos.PackedDyadic.StructuralChecks.chunk_cases] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
