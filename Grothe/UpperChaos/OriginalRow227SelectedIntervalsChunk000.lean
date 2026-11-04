import Grothe.UpperChaos.ConditionalSelectedIntervalBinding
import Grothe.UpperChaos.OriginalRow227SelectedErrorChunk000
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow000
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow001
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow002
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow003
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow004
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow005
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow006
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow007
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow008
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow009
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow010
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow011
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow012
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow013
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow014
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow015
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow016
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow017
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow018
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow019
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow020
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow021
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow022
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow023
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow024
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow025
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow026
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow027
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow028
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow029
import Grothe.UpperChaos.OriginalRow227TriangleBindingsRow030

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000

open ConditionalTableLookup

open ConditionalNormalizedFiniteChecks ConditionalSelectedIntervalBinding
open OriginalRow227SelectedError.Data OriginalRow227ErrorBoundary

def checks0000 : Array (ErrorEntry × IntervalDyadic) := #[
  ((block0000.get ⟨0, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_0),
  ((block0000.get ⟨1, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_0),
  ((block0000.get ⟨2, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_1),
  ((block0000.get ⟨3, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_1),
  ((block0000.get ⟨4, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_1),
  ((block0000.get ⟨5, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_2),
  ((block0000.get ⟨6, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_2),
  ((block0000.get ⟨7, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_2),
  ((block0000.get ⟨8, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0048.coefficient3_2),
  ((block0000.get ⟨9, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_3),
  ((block0000.get ⟨10, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_3),
  ((block0000.get ⟨11, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_3),
  ((block0000.get ⟨12, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0048.coefficient3_3),
  ((block0000.get ⟨13, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0064.coefficient4_3),
  ((block0000.get ⟨14, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_4),
  ((block0000.get ⟨15, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_4),
  ((block0000.get ⟨16, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_4),
  ((block0000.get ⟨17, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0048.coefficient3_4),
  ((block0000.get ⟨18, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0064.coefficient4_4),
  ((block0000.get ⟨19, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0080.coefficient5_4),
  ((block0000.get ⟨20, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_5),
  ((block0000.get ⟨21, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_5),
  ((block0000.get ⟨22, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_5),
  ((block0000.get ⟨23, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0048.coefficient3_5),
  ((block0000.get ⟨24, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0064.coefficient4_5),
  ((block0000.get ⟨25, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0080.coefficient5_5),
  ((block0000.get ⟨26, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0096.coefficient6_5),
  ((block0000.get ⟨27, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_6),
  ((block0000.get ⟨28, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_6),
  ((block0000.get ⟨29, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_6),
  ((block0000.get ⟨30, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0048.coefficient3_6),
  ((block0000.get ⟨31, by rw [block0000_length]; decide⟩), OriginalRow227TriangleData0064.coefficient4_6)
]

theorem checks0000_size : checks0000.size = 32 := rfl

theorem checks0000_checked :
    blockCheck (fun p => enclosureCheck p.1 p.2) checks0000 = true := by
  decide +kernel

theorem entry00000_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨0, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_0
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨0, by rw [checks0000_size]; decide⟩

theorem entry00001_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨1, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_0
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨1, by rw [checks0000_size]; decide⟩

theorem entry00002_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨2, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_1
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨2, by rw [checks0000_size]; decide⟩

theorem entry00003_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨3, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_1
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨3, by rw [checks0000_size]; decide⟩

theorem entry00004_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨4, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_1
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨4, by rw [checks0000_size]; decide⟩

theorem entry00005_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨5, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_2
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨2, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨5, by rw [checks0000_size]; decide⟩

theorem entry00006_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨6, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_2
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨2, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨6, by rw [checks0000_size]; decide⟩

theorem entry00007_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨7, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_2
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨7, by rw [checks0000_size]; decide⟩

theorem entry00008_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨8, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0048.coefficient3_2
  · exact OriginalRow227TriangleBindingsRow003.block0048_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨8, by rw [checks0000_size]; decide⟩

theorem entry00009_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨9, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_3
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨3, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨9, by rw [checks0000_size]; decide⟩

theorem entry00010_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨10, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_3
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨3, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨10, by rw [checks0000_size]; decide⟩

theorem entry00011_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨11, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_3
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨2, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨11, by rw [checks0000_size]; decide⟩

theorem entry00012_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨12, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0048.coefficient3_3
  · exact OriginalRow227TriangleBindingsRow003.block0048_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨12, by rw [checks0000_size]; decide⟩

theorem entry00013_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨13, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0064.coefficient4_3
  · exact OriginalRow227TriangleBindingsRow004.block0064_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨13, by rw [checks0000_size]; decide⟩

theorem entry00014_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨14, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_4
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨4, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨14, by rw [checks0000_size]; decide⟩

theorem entry00015_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨15, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_4
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨4, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨15, by rw [checks0000_size]; decide⟩

theorem entry00016_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨16, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_4
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨3, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨16, by rw [checks0000_size]; decide⟩

theorem entry00017_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨17, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0048.coefficient3_4
  · exact OriginalRow227TriangleBindingsRow003.block0048_value ⟨2, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨17, by rw [checks0000_size]; decide⟩

theorem entry00018_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨18, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0064.coefficient4_4
  · exact OriginalRow227TriangleBindingsRow004.block0064_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨18, by rw [checks0000_size]; decide⟩

theorem entry00019_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨19, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0080.coefficient5_4
  · exact OriginalRow227TriangleBindingsRow005.block0080_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨19, by rw [checks0000_size]; decide⟩

theorem entry00020_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨20, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_5
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨5, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨20, by rw [checks0000_size]; decide⟩

theorem entry00021_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨21, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_5
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨5, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨21, by rw [checks0000_size]; decide⟩

theorem entry00022_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨22, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_5
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨4, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨22, by rw [checks0000_size]; decide⟩

theorem entry00023_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨23, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0048.coefficient3_5
  · exact OriginalRow227TriangleBindingsRow003.block0048_value ⟨3, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨23, by rw [checks0000_size]; decide⟩

theorem entry00024_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨24, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0064.coefficient4_5
  · exact OriginalRow227TriangleBindingsRow004.block0064_value ⟨2, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨24, by rw [checks0000_size]; decide⟩

theorem entry00025_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨25, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0080.coefficient5_5
  · exact OriginalRow227TriangleBindingsRow005.block0080_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨25, by rw [checks0000_size]; decide⟩

theorem entry00026_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨26, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0096.coefficient6_5
  · exact OriginalRow227TriangleBindingsRow006.block0096_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨26, by rw [checks0000_size]; decide⟩

theorem entry00027_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨27, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_6
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨6, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨27, by rw [checks0000_size]; decide⟩

theorem entry00028_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨28, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_6
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨6, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨28, by rw [checks0000_size]; decide⟩

theorem entry00029_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨29, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_6
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨5, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨29, by rw [checks0000_size]; decide⟩

theorem entry00030_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨30, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0048.coefficient3_6
  · exact OriginalRow227TriangleBindingsRow003.block0048_value ⟨4, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨30, by rw [checks0000_size]; decide⟩

theorem entry00031_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0000.get ⟨31, by rw [block0000_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0064.coefficient4_6
  · exact OriginalRow227TriangleBindingsRow004.block0064_value ⟨3, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0000 checks0000_checked
      ⟨31, by rw [checks0000_size]; decide⟩

theorem block0000_enclosed : AllEnclosed OriginalRow227TriangleLookup.T block0000 := by
  exact allEnclosed_cons entry00000_enclosed <|
    allEnclosed_cons entry00001_enclosed <|
    allEnclosed_cons entry00002_enclosed <|
    allEnclosed_cons entry00003_enclosed <|
    allEnclosed_cons entry00004_enclosed <|
    allEnclosed_cons entry00005_enclosed <|
    allEnclosed_cons entry00006_enclosed <|
    allEnclosed_cons entry00007_enclosed <|
    allEnclosed_cons entry00008_enclosed <|
    allEnclosed_cons entry00009_enclosed <|
    allEnclosed_cons entry00010_enclosed <|
    allEnclosed_cons entry00011_enclosed <|
    allEnclosed_cons entry00012_enclosed <|
    allEnclosed_cons entry00013_enclosed <|
    allEnclosed_cons entry00014_enclosed <|
    allEnclosed_cons entry00015_enclosed <|
    allEnclosed_cons entry00016_enclosed <|
    allEnclosed_cons entry00017_enclosed <|
    allEnclosed_cons entry00018_enclosed <|
    allEnclosed_cons entry00019_enclosed <|
    allEnclosed_cons entry00020_enclosed <|
    allEnclosed_cons entry00021_enclosed <|
    allEnclosed_cons entry00022_enclosed <|
    allEnclosed_cons entry00023_enclosed <|
    allEnclosed_cons entry00024_enclosed <|
    allEnclosed_cons entry00025_enclosed <|
    allEnclosed_cons entry00026_enclosed <|
    allEnclosed_cons entry00027_enclosed <|
    allEnclosed_cons entry00028_enclosed <|
    allEnclosed_cons entry00029_enclosed <|
    allEnclosed_cons entry00030_enclosed <|
    allEnclosed_cons entry00031_enclosed <|
    allEnclosed_nil OriginalRow227TriangleLookup.T

def checks0001 : Array (ErrorEntry × IntervalDyadic) := #[
  ((block0001.get ⟨0, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0080.coefficient5_6),
  ((block0001.get ⟨1, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0096.coefficient6_6),
  ((block0001.get ⟨2, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0112.coefficient7_6),
  ((block0001.get ⟨3, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_7),
  ((block0001.get ⟨4, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_7),
  ((block0001.get ⟨5, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_7),
  ((block0001.get ⟨6, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0048.coefficient3_7),
  ((block0001.get ⟨7, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0064.coefficient4_7),
  ((block0001.get ⟨8, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0080.coefficient5_7),
  ((block0001.get ⟨9, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0096.coefficient6_7),
  ((block0001.get ⟨10, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0112.coefficient7_7),
  ((block0001.get ⟨11, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0128.coefficient8_7),
  ((block0001.get ⟨12, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_8),
  ((block0001.get ⟨13, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_8),
  ((block0001.get ⟨14, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_8),
  ((block0001.get ⟨15, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0048.coefficient3_8),
  ((block0001.get ⟨16, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0064.coefficient4_8),
  ((block0001.get ⟨17, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0080.coefficient5_8),
  ((block0001.get ⟨18, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0096.coefficient6_8),
  ((block0001.get ⟨19, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0112.coefficient7_8),
  ((block0001.get ⟨20, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0128.coefficient8_8),
  ((block0001.get ⟨21, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0144.coefficient9_8),
  ((block0001.get ⟨22, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_9),
  ((block0001.get ⟨23, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_9),
  ((block0001.get ⟨24, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_9),
  ((block0001.get ⟨25, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0048.coefficient3_9),
  ((block0001.get ⟨26, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0064.coefficient4_9),
  ((block0001.get ⟨27, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0080.coefficient5_9),
  ((block0001.get ⟨28, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0096.coefficient6_9),
  ((block0001.get ⟨29, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0112.coefficient7_9),
  ((block0001.get ⟨30, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0128.coefficient8_9),
  ((block0001.get ⟨31, by rw [block0001_length]; decide⟩), OriginalRow227TriangleData0144.coefficient9_9)
]

theorem checks0001_size : checks0001.size = 32 := rfl

theorem checks0001_checked :
    blockCheck (fun p => enclosureCheck p.1 p.2) checks0001 = true := by
  decide +kernel

theorem entry00032_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨0, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0080.coefficient5_6
  · exact OriginalRow227TriangleBindingsRow005.block0080_value ⟨2, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨0, by rw [checks0001_size]; decide⟩

theorem entry00033_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨1, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0096.coefficient6_6
  · exact OriginalRow227TriangleBindingsRow006.block0096_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨1, by rw [checks0001_size]; decide⟩

theorem entry00034_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨2, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0112.coefficient7_6
  · exact OriginalRow227TriangleBindingsRow007.block0112_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨2, by rw [checks0001_size]; decide⟩

theorem entry00035_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨3, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_7
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨7, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨3, by rw [checks0001_size]; decide⟩

theorem entry00036_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨4, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_7
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨7, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨4, by rw [checks0001_size]; decide⟩

theorem entry00037_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨5, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_7
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨6, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨5, by rw [checks0001_size]; decide⟩

theorem entry00038_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨6, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0048.coefficient3_7
  · exact OriginalRow227TriangleBindingsRow003.block0048_value ⟨5, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨6, by rw [checks0001_size]; decide⟩

theorem entry00039_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨7, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0064.coefficient4_7
  · exact OriginalRow227TriangleBindingsRow004.block0064_value ⟨4, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨7, by rw [checks0001_size]; decide⟩

theorem entry00040_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨8, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0080.coefficient5_7
  · exact OriginalRow227TriangleBindingsRow005.block0080_value ⟨3, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨8, by rw [checks0001_size]; decide⟩

theorem entry00041_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨9, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0096.coefficient6_7
  · exact OriginalRow227TriangleBindingsRow006.block0096_value ⟨2, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨9, by rw [checks0001_size]; decide⟩

theorem entry00042_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨10, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0112.coefficient7_7
  · exact OriginalRow227TriangleBindingsRow007.block0112_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨10, by rw [checks0001_size]; decide⟩

theorem entry00043_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨11, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0128.coefficient8_7
  · exact OriginalRow227TriangleBindingsRow008.block0128_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨11, by rw [checks0001_size]; decide⟩

theorem entry00044_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨12, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_8
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨8, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨12, by rw [checks0001_size]; decide⟩

theorem entry00045_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨13, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_8
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨8, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨13, by rw [checks0001_size]; decide⟩

theorem entry00046_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨14, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_8
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨7, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨14, by rw [checks0001_size]; decide⟩

theorem entry00047_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨15, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0048.coefficient3_8
  · exact OriginalRow227TriangleBindingsRow003.block0048_value ⟨6, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨15, by rw [checks0001_size]; decide⟩

theorem entry00048_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨16, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0064.coefficient4_8
  · exact OriginalRow227TriangleBindingsRow004.block0064_value ⟨5, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨16, by rw [checks0001_size]; decide⟩

theorem entry00049_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨17, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0080.coefficient5_8
  · exact OriginalRow227TriangleBindingsRow005.block0080_value ⟨4, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨17, by rw [checks0001_size]; decide⟩

theorem entry00050_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨18, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0096.coefficient6_8
  · exact OriginalRow227TriangleBindingsRow006.block0096_value ⟨3, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨18, by rw [checks0001_size]; decide⟩

theorem entry00051_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨19, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0112.coefficient7_8
  · exact OriginalRow227TriangleBindingsRow007.block0112_value ⟨2, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨19, by rw [checks0001_size]; decide⟩

theorem entry00052_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨20, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0128.coefficient8_8
  · exact OriginalRow227TriangleBindingsRow008.block0128_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨20, by rw [checks0001_size]; decide⟩

theorem entry00053_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨21, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0144.coefficient9_8
  · exact OriginalRow227TriangleBindingsRow009.block0144_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨21, by rw [checks0001_size]; decide⟩

theorem entry00054_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨22, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_9
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨9, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨22, by rw [checks0001_size]; decide⟩

theorem entry00055_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨23, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_9
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨9, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨23, by rw [checks0001_size]; decide⟩

theorem entry00056_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨24, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_9
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨8, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨24, by rw [checks0001_size]; decide⟩

theorem entry00057_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨25, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0048.coefficient3_9
  · exact OriginalRow227TriangleBindingsRow003.block0048_value ⟨7, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨25, by rw [checks0001_size]; decide⟩

theorem entry00058_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨26, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0064.coefficient4_9
  · exact OriginalRow227TriangleBindingsRow004.block0064_value ⟨6, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨26, by rw [checks0001_size]; decide⟩

theorem entry00059_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨27, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0080.coefficient5_9
  · exact OriginalRow227TriangleBindingsRow005.block0080_value ⟨5, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨27, by rw [checks0001_size]; decide⟩

theorem entry00060_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨28, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0096.coefficient6_9
  · exact OriginalRow227TriangleBindingsRow006.block0096_value ⟨4, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨28, by rw [checks0001_size]; decide⟩

theorem entry00061_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨29, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0112.coefficient7_9
  · exact OriginalRow227TriangleBindingsRow007.block0112_value ⟨3, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨29, by rw [checks0001_size]; decide⟩

theorem entry00062_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨30, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0128.coefficient8_9
  · exact OriginalRow227TriangleBindingsRow008.block0128_value ⟨2, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨30, by rw [checks0001_size]; decide⟩

theorem entry00063_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0001.get ⟨31, by rw [block0001_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0144.coefficient9_9
  · exact OriginalRow227TriangleBindingsRow009.block0144_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0001 checks0001_checked
      ⟨31, by rw [checks0001_size]; decide⟩

theorem block0001_enclosed : AllEnclosed OriginalRow227TriangleLookup.T block0001 := by
  exact allEnclosed_cons entry00032_enclosed <|
    allEnclosed_cons entry00033_enclosed <|
    allEnclosed_cons entry00034_enclosed <|
    allEnclosed_cons entry00035_enclosed <|
    allEnclosed_cons entry00036_enclosed <|
    allEnclosed_cons entry00037_enclosed <|
    allEnclosed_cons entry00038_enclosed <|
    allEnclosed_cons entry00039_enclosed <|
    allEnclosed_cons entry00040_enclosed <|
    allEnclosed_cons entry00041_enclosed <|
    allEnclosed_cons entry00042_enclosed <|
    allEnclosed_cons entry00043_enclosed <|
    allEnclosed_cons entry00044_enclosed <|
    allEnclosed_cons entry00045_enclosed <|
    allEnclosed_cons entry00046_enclosed <|
    allEnclosed_cons entry00047_enclosed <|
    allEnclosed_cons entry00048_enclosed <|
    allEnclosed_cons entry00049_enclosed <|
    allEnclosed_cons entry00050_enclosed <|
    allEnclosed_cons entry00051_enclosed <|
    allEnclosed_cons entry00052_enclosed <|
    allEnclosed_cons entry00053_enclosed <|
    allEnclosed_cons entry00054_enclosed <|
    allEnclosed_cons entry00055_enclosed <|
    allEnclosed_cons entry00056_enclosed <|
    allEnclosed_cons entry00057_enclosed <|
    allEnclosed_cons entry00058_enclosed <|
    allEnclosed_cons entry00059_enclosed <|
    allEnclosed_cons entry00060_enclosed <|
    allEnclosed_cons entry00061_enclosed <|
    allEnclosed_cons entry00062_enclosed <|
    allEnclosed_cons entry00063_enclosed <|
    allEnclosed_nil OriginalRow227TriangleLookup.T

def checks0002 : Array (ErrorEntry × IntervalDyadic) := #[
  ((block0002.get ⟨0, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0160.coefficient10_9),
  ((block0002.get ⟨1, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_10),
  ((block0002.get ⟨2, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_10),
  ((block0002.get ⟨3, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_10),
  ((block0002.get ⟨4, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0048.coefficient3_10),
  ((block0002.get ⟨5, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0064.coefficient4_10),
  ((block0002.get ⟨6, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0080.coefficient5_10),
  ((block0002.get ⟨7, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0096.coefficient6_10),
  ((block0002.get ⟨8, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0112.coefficient7_10),
  ((block0002.get ⟨9, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0128.coefficient8_10),
  ((block0002.get ⟨10, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0144.coefficient9_10),
  ((block0002.get ⟨11, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0160.coefficient10_10),
  ((block0002.get ⟨12, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0176.coefficient11_10),
  ((block0002.get ⟨13, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_11),
  ((block0002.get ⟨14, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_11),
  ((block0002.get ⟨15, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_11),
  ((block0002.get ⟨16, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0048.coefficient3_11),
  ((block0002.get ⟨17, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0064.coefficient4_11),
  ((block0002.get ⟨18, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0080.coefficient5_11),
  ((block0002.get ⟨19, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0096.coefficient6_11),
  ((block0002.get ⟨20, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0112.coefficient7_11),
  ((block0002.get ⟨21, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0128.coefficient8_11),
  ((block0002.get ⟨22, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0144.coefficient9_11),
  ((block0002.get ⟨23, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0160.coefficient10_11),
  ((block0002.get ⟨24, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0176.coefficient11_11),
  ((block0002.get ⟨25, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0192.coefficient12_11),
  ((block0002.get ⟨26, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_12),
  ((block0002.get ⟨27, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_12),
  ((block0002.get ⟨28, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_12),
  ((block0002.get ⟨29, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0048.coefficient3_12),
  ((block0002.get ⟨30, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0064.coefficient4_12),
  ((block0002.get ⟨31, by rw [block0002_length]; decide⟩), OriginalRow227TriangleData0080.coefficient5_12)
]

theorem checks0002_size : checks0002.size = 32 := rfl

theorem checks0002_checked :
    blockCheck (fun p => enclosureCheck p.1 p.2) checks0002 = true := by
  decide +kernel

theorem entry00064_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨0, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0160.coefficient10_9
  · exact OriginalRow227TriangleBindingsRow010.block0160_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨0, by rw [checks0002_size]; decide⟩

theorem entry00065_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨1, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_10
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨10, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨1, by rw [checks0002_size]; decide⟩

theorem entry00066_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨2, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_10
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨10, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨2, by rw [checks0002_size]; decide⟩

theorem entry00067_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨3, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_10
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨9, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨3, by rw [checks0002_size]; decide⟩

theorem entry00068_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨4, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0048.coefficient3_10
  · exact OriginalRow227TriangleBindingsRow003.block0048_value ⟨8, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨4, by rw [checks0002_size]; decide⟩

theorem entry00069_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨5, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0064.coefficient4_10
  · exact OriginalRow227TriangleBindingsRow004.block0064_value ⟨7, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨5, by rw [checks0002_size]; decide⟩

theorem entry00070_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨6, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0080.coefficient5_10
  · exact OriginalRow227TriangleBindingsRow005.block0080_value ⟨6, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨6, by rw [checks0002_size]; decide⟩

theorem entry00071_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨7, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0096.coefficient6_10
  · exact OriginalRow227TriangleBindingsRow006.block0096_value ⟨5, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨7, by rw [checks0002_size]; decide⟩

theorem entry00072_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨8, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0112.coefficient7_10
  · exact OriginalRow227TriangleBindingsRow007.block0112_value ⟨4, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨8, by rw [checks0002_size]; decide⟩

theorem entry00073_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨9, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0128.coefficient8_10
  · exact OriginalRow227TriangleBindingsRow008.block0128_value ⟨3, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨9, by rw [checks0002_size]; decide⟩

theorem entry00074_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨10, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0144.coefficient9_10
  · exact OriginalRow227TriangleBindingsRow009.block0144_value ⟨2, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨10, by rw [checks0002_size]; decide⟩

theorem entry00075_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨11, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0160.coefficient10_10
  · exact OriginalRow227TriangleBindingsRow010.block0160_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨11, by rw [checks0002_size]; decide⟩

theorem entry00076_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨12, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0176.coefficient11_10
  · exact OriginalRow227TriangleBindingsRow011.block0176_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨12, by rw [checks0002_size]; decide⟩

theorem entry00077_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨13, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_11
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨11, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨13, by rw [checks0002_size]; decide⟩

theorem entry00078_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨14, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_11
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨11, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨14, by rw [checks0002_size]; decide⟩

theorem entry00079_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨15, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_11
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨10, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨15, by rw [checks0002_size]; decide⟩

theorem entry00080_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨16, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0048.coefficient3_11
  · exact OriginalRow227TriangleBindingsRow003.block0048_value ⟨9, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨16, by rw [checks0002_size]; decide⟩

theorem entry00081_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨17, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0064.coefficient4_11
  · exact OriginalRow227TriangleBindingsRow004.block0064_value ⟨8, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨17, by rw [checks0002_size]; decide⟩

theorem entry00082_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨18, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0080.coefficient5_11
  · exact OriginalRow227TriangleBindingsRow005.block0080_value ⟨7, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨18, by rw [checks0002_size]; decide⟩

theorem entry00083_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨19, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0096.coefficient6_11
  · exact OriginalRow227TriangleBindingsRow006.block0096_value ⟨6, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨19, by rw [checks0002_size]; decide⟩

theorem entry00084_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨20, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0112.coefficient7_11
  · exact OriginalRow227TriangleBindingsRow007.block0112_value ⟨5, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨20, by rw [checks0002_size]; decide⟩

theorem entry00085_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨21, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0128.coefficient8_11
  · exact OriginalRow227TriangleBindingsRow008.block0128_value ⟨4, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨21, by rw [checks0002_size]; decide⟩

theorem entry00086_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨22, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0144.coefficient9_11
  · exact OriginalRow227TriangleBindingsRow009.block0144_value ⟨3, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨22, by rw [checks0002_size]; decide⟩

theorem entry00087_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨23, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0160.coefficient10_11
  · exact OriginalRow227TriangleBindingsRow010.block0160_value ⟨2, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨23, by rw [checks0002_size]; decide⟩

theorem entry00088_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨24, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0176.coefficient11_11
  · exact OriginalRow227TriangleBindingsRow011.block0176_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨24, by rw [checks0002_size]; decide⟩

theorem entry00089_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨25, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0192.coefficient12_11
  · exact OriginalRow227TriangleBindingsRow012.block0192_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨25, by rw [checks0002_size]; decide⟩

theorem entry00090_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨26, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_12
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨12, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨26, by rw [checks0002_size]; decide⟩

theorem entry00091_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨27, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_12
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨12, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨27, by rw [checks0002_size]; decide⟩

theorem entry00092_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨28, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_12
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨11, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨28, by rw [checks0002_size]; decide⟩

theorem entry00093_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨29, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0048.coefficient3_12
  · exact OriginalRow227TriangleBindingsRow003.block0048_value ⟨10, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨29, by rw [checks0002_size]; decide⟩

theorem entry00094_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨30, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0064.coefficient4_12
  · exact OriginalRow227TriangleBindingsRow004.block0064_value ⟨9, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨30, by rw [checks0002_size]; decide⟩

theorem entry00095_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0002.get ⟨31, by rw [block0002_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0080.coefficient5_12
  · exact OriginalRow227TriangleBindingsRow005.block0080_value ⟨8, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0002 checks0002_checked
      ⟨31, by rw [checks0002_size]; decide⟩

theorem block0002_enclosed : AllEnclosed OriginalRow227TriangleLookup.T block0002 := by
  exact allEnclosed_cons entry00064_enclosed <|
    allEnclosed_cons entry00065_enclosed <|
    allEnclosed_cons entry00066_enclosed <|
    allEnclosed_cons entry00067_enclosed <|
    allEnclosed_cons entry00068_enclosed <|
    allEnclosed_cons entry00069_enclosed <|
    allEnclosed_cons entry00070_enclosed <|
    allEnclosed_cons entry00071_enclosed <|
    allEnclosed_cons entry00072_enclosed <|
    allEnclosed_cons entry00073_enclosed <|
    allEnclosed_cons entry00074_enclosed <|
    allEnclosed_cons entry00075_enclosed <|
    allEnclosed_cons entry00076_enclosed <|
    allEnclosed_cons entry00077_enclosed <|
    allEnclosed_cons entry00078_enclosed <|
    allEnclosed_cons entry00079_enclosed <|
    allEnclosed_cons entry00080_enclosed <|
    allEnclosed_cons entry00081_enclosed <|
    allEnclosed_cons entry00082_enclosed <|
    allEnclosed_cons entry00083_enclosed <|
    allEnclosed_cons entry00084_enclosed <|
    allEnclosed_cons entry00085_enclosed <|
    allEnclosed_cons entry00086_enclosed <|
    allEnclosed_cons entry00087_enclosed <|
    allEnclosed_cons entry00088_enclosed <|
    allEnclosed_cons entry00089_enclosed <|
    allEnclosed_cons entry00090_enclosed <|
    allEnclosed_cons entry00091_enclosed <|
    allEnclosed_cons entry00092_enclosed <|
    allEnclosed_cons entry00093_enclosed <|
    allEnclosed_cons entry00094_enclosed <|
    allEnclosed_cons entry00095_enclosed <|
    allEnclosed_nil OriginalRow227TriangleLookup.T

def checks0003 : Array (ErrorEntry × IntervalDyadic) := #[
  ((block0003.get ⟨0, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0096.coefficient6_12),
  ((block0003.get ⟨1, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0112.coefficient7_12),
  ((block0003.get ⟨2, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0128.coefficient8_12),
  ((block0003.get ⟨3, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0144.coefficient9_12),
  ((block0003.get ⟨4, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0160.coefficient10_12),
  ((block0003.get ⟨5, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0176.coefficient11_12),
  ((block0003.get ⟨6, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0192.coefficient12_12),
  ((block0003.get ⟨7, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0207.coefficient13_12),
  ((block0003.get ⟨8, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_13),
  ((block0003.get ⟨9, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_13),
  ((block0003.get ⟨10, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_13),
  ((block0003.get ⟨11, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0048.coefficient3_13),
  ((block0003.get ⟨12, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0064.coefficient4_13),
  ((block0003.get ⟨13, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0080.coefficient5_13),
  ((block0003.get ⟨14, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0096.coefficient6_13),
  ((block0003.get ⟨15, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0112.coefficient7_13),
  ((block0003.get ⟨16, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0128.coefficient8_13),
  ((block0003.get ⟨17, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0144.coefficient9_13),
  ((block0003.get ⟨18, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0160.coefficient10_13),
  ((block0003.get ⟨19, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0176.coefficient11_13),
  ((block0003.get ⟨20, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0192.coefficient12_13),
  ((block0003.get ⟨21, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0207.coefficient13_13),
  ((block0003.get ⟨22, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0222.coefficient14_13),
  ((block0003.get ⟨23, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_14),
  ((block0003.get ⟨24, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_14),
  ((block0003.get ⟨25, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_14),
  ((block0003.get ⟨26, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0048.coefficient3_14),
  ((block0003.get ⟨27, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0064.coefficient4_14),
  ((block0003.get ⟨28, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0080.coefficient5_14),
  ((block0003.get ⟨29, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0096.coefficient6_14),
  ((block0003.get ⟨30, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0112.coefficient7_14),
  ((block0003.get ⟨31, by rw [block0003_length]; decide⟩), OriginalRow227TriangleData0128.coefficient8_14)
]

theorem checks0003_size : checks0003.size = 32 := rfl

theorem checks0003_checked :
    blockCheck (fun p => enclosureCheck p.1 p.2) checks0003 = true := by
  decide +kernel

theorem entry00096_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨0, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0096.coefficient6_12
  · exact OriginalRow227TriangleBindingsRow006.block0096_value ⟨7, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨0, by rw [checks0003_size]; decide⟩

theorem entry00097_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨1, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0112.coefficient7_12
  · exact OriginalRow227TriangleBindingsRow007.block0112_value ⟨6, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨1, by rw [checks0003_size]; decide⟩

theorem entry00098_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨2, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0128.coefficient8_12
  · exact OriginalRow227TriangleBindingsRow008.block0128_value ⟨5, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨2, by rw [checks0003_size]; decide⟩

theorem entry00099_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨3, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0144.coefficient9_12
  · exact OriginalRow227TriangleBindingsRow009.block0144_value ⟨4, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨3, by rw [checks0003_size]; decide⟩

theorem entry00100_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨4, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0160.coefficient10_12
  · exact OriginalRow227TriangleBindingsRow010.block0160_value ⟨3, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨4, by rw [checks0003_size]; decide⟩

theorem entry00101_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨5, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0176.coefficient11_12
  · exact OriginalRow227TriangleBindingsRow011.block0176_value ⟨2, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨5, by rw [checks0003_size]; decide⟩

theorem entry00102_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨6, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0192.coefficient12_12
  · exact OriginalRow227TriangleBindingsRow012.block0192_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨6, by rw [checks0003_size]; decide⟩

theorem entry00103_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨7, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0207.coefficient13_12
  · exact OriginalRow227TriangleBindingsRow013.block0207_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨7, by rw [checks0003_size]; decide⟩

theorem entry00104_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨8, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_13
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨13, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨8, by rw [checks0003_size]; decide⟩

theorem entry00105_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨9, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_13
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨13, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨9, by rw [checks0003_size]; decide⟩

theorem entry00106_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨10, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_13
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨12, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨10, by rw [checks0003_size]; decide⟩

theorem entry00107_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨11, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0048.coefficient3_13
  · exact OriginalRow227TriangleBindingsRow003.block0048_value ⟨11, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨11, by rw [checks0003_size]; decide⟩

theorem entry00108_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨12, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0064.coefficient4_13
  · exact OriginalRow227TriangleBindingsRow004.block0064_value ⟨10, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨12, by rw [checks0003_size]; decide⟩

theorem entry00109_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨13, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0080.coefficient5_13
  · exact OriginalRow227TriangleBindingsRow005.block0080_value ⟨9, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨13, by rw [checks0003_size]; decide⟩

theorem entry00110_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨14, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0096.coefficient6_13
  · exact OriginalRow227TriangleBindingsRow006.block0096_value ⟨8, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨14, by rw [checks0003_size]; decide⟩

theorem entry00111_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨15, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0112.coefficient7_13
  · exact OriginalRow227TriangleBindingsRow007.block0112_value ⟨7, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨15, by rw [checks0003_size]; decide⟩

theorem entry00112_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨16, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0128.coefficient8_13
  · exact OriginalRow227TriangleBindingsRow008.block0128_value ⟨6, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨16, by rw [checks0003_size]; decide⟩

theorem entry00113_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨17, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0144.coefficient9_13
  · exact OriginalRow227TriangleBindingsRow009.block0144_value ⟨5, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨17, by rw [checks0003_size]; decide⟩

theorem entry00114_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨18, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0160.coefficient10_13
  · exact OriginalRow227TriangleBindingsRow010.block0160_value ⟨4, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨18, by rw [checks0003_size]; decide⟩

theorem entry00115_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨19, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0176.coefficient11_13
  · exact OriginalRow227TriangleBindingsRow011.block0176_value ⟨3, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨19, by rw [checks0003_size]; decide⟩

theorem entry00116_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨20, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0192.coefficient12_13
  · exact OriginalRow227TriangleBindingsRow012.block0192_value ⟨2, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨20, by rw [checks0003_size]; decide⟩

theorem entry00117_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨21, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0207.coefficient13_13
  · exact OriginalRow227TriangleBindingsRow013.block0207_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨21, by rw [checks0003_size]; decide⟩

theorem entry00118_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨22, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0222.coefficient14_13
  · exact OriginalRow227TriangleBindingsRow014.block0222_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨22, by rw [checks0003_size]; decide⟩

theorem entry00119_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨23, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_14
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨14, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨23, by rw [checks0003_size]; decide⟩

theorem entry00120_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨24, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_14
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨14, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨24, by rw [checks0003_size]; decide⟩

theorem entry00121_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨25, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_14
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨13, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨25, by rw [checks0003_size]; decide⟩

theorem entry00122_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨26, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0048.coefficient3_14
  · exact OriginalRow227TriangleBindingsRow003.block0048_value ⟨12, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨26, by rw [checks0003_size]; decide⟩

theorem entry00123_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨27, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0064.coefficient4_14
  · exact OriginalRow227TriangleBindingsRow004.block0064_value ⟨11, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨27, by rw [checks0003_size]; decide⟩

theorem entry00124_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨28, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0080.coefficient5_14
  · exact OriginalRow227TriangleBindingsRow005.block0080_value ⟨10, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨28, by rw [checks0003_size]; decide⟩

theorem entry00125_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨29, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0096.coefficient6_14
  · exact OriginalRow227TriangleBindingsRow006.block0096_value ⟨9, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨29, by rw [checks0003_size]; decide⟩

theorem entry00126_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨30, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0112.coefficient7_14
  · exact OriginalRow227TriangleBindingsRow007.block0112_value ⟨8, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨30, by rw [checks0003_size]; decide⟩

theorem entry00127_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0003.get ⟨31, by rw [block0003_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0128.coefficient8_14
  · exact OriginalRow227TriangleBindingsRow008.block0128_value ⟨7, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0003 checks0003_checked
      ⟨31, by rw [checks0003_size]; decide⟩

theorem block0003_enclosed : AllEnclosed OriginalRow227TriangleLookup.T block0003 := by
  exact allEnclosed_cons entry00096_enclosed <|
    allEnclosed_cons entry00097_enclosed <|
    allEnclosed_cons entry00098_enclosed <|
    allEnclosed_cons entry00099_enclosed <|
    allEnclosed_cons entry00100_enclosed <|
    allEnclosed_cons entry00101_enclosed <|
    allEnclosed_cons entry00102_enclosed <|
    allEnclosed_cons entry00103_enclosed <|
    allEnclosed_cons entry00104_enclosed <|
    allEnclosed_cons entry00105_enclosed <|
    allEnclosed_cons entry00106_enclosed <|
    allEnclosed_cons entry00107_enclosed <|
    allEnclosed_cons entry00108_enclosed <|
    allEnclosed_cons entry00109_enclosed <|
    allEnclosed_cons entry00110_enclosed <|
    allEnclosed_cons entry00111_enclosed <|
    allEnclosed_cons entry00112_enclosed <|
    allEnclosed_cons entry00113_enclosed <|
    allEnclosed_cons entry00114_enclosed <|
    allEnclosed_cons entry00115_enclosed <|
    allEnclosed_cons entry00116_enclosed <|
    allEnclosed_cons entry00117_enclosed <|
    allEnclosed_cons entry00118_enclosed <|
    allEnclosed_cons entry00119_enclosed <|
    allEnclosed_cons entry00120_enclosed <|
    allEnclosed_cons entry00121_enclosed <|
    allEnclosed_cons entry00122_enclosed <|
    allEnclosed_cons entry00123_enclosed <|
    allEnclosed_cons entry00124_enclosed <|
    allEnclosed_cons entry00125_enclosed <|
    allEnclosed_cons entry00126_enclosed <|
    allEnclosed_cons entry00127_enclosed <|
    allEnclosed_nil OriginalRow227TriangleLookup.T

def checks0004 : Array (ErrorEntry × IntervalDyadic) := #[
  ((block0004.get ⟨0, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0144.coefficient9_14),
  ((block0004.get ⟨1, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0160.coefficient10_14),
  ((block0004.get ⟨2, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0176.coefficient11_14),
  ((block0004.get ⟨3, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0192.coefficient12_14),
  ((block0004.get ⟨4, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0207.coefficient13_14),
  ((block0004.get ⟨5, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0222.coefficient14_14),
  ((block0004.get ⟨6, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0237.coefficient15_14),
  ((block0004.get ⟨7, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_15),
  ((block0004.get ⟨8, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_15),
  ((block0004.get ⟨9, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_15),
  ((block0004.get ⟨10, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0048.coefficient3_15),
  ((block0004.get ⟨11, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0064.coefficient4_15),
  ((block0004.get ⟨12, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0080.coefficient5_15),
  ((block0004.get ⟨13, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0096.coefficient6_15),
  ((block0004.get ⟨14, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0112.coefficient7_15),
  ((block0004.get ⟨15, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0128.coefficient8_15),
  ((block0004.get ⟨16, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0144.coefficient9_15),
  ((block0004.get ⟨17, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0160.coefficient10_15),
  ((block0004.get ⟨18, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0176.coefficient11_15),
  ((block0004.get ⟨19, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0192.coefficient12_15),
  ((block0004.get ⟨20, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0207.coefficient13_15),
  ((block0004.get ⟨21, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0222.coefficient14_15),
  ((block0004.get ⟨22, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0237.coefficient15_15),
  ((block0004.get ⟨23, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0252.coefficient16_15),
  ((block0004.get ⟨24, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_16),
  ((block0004.get ⟨25, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_16),
  ((block0004.get ⟨26, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_16),
  ((block0004.get ⟨27, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0048.coefficient3_16),
  ((block0004.get ⟨28, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0064.coefficient4_16),
  ((block0004.get ⟨29, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0080.coefficient5_16),
  ((block0004.get ⟨30, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0096.coefficient6_16),
  ((block0004.get ⟨31, by rw [block0004_length]; decide⟩), OriginalRow227TriangleData0112.coefficient7_16)
]

theorem checks0004_size : checks0004.size = 32 := rfl

theorem checks0004_checked :
    blockCheck (fun p => enclosureCheck p.1 p.2) checks0004 = true := by
  decide +kernel

theorem entry00128_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨0, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0144.coefficient9_14
  · exact OriginalRow227TriangleBindingsRow009.block0144_value ⟨6, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨0, by rw [checks0004_size]; decide⟩

theorem entry00129_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨1, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0160.coefficient10_14
  · exact OriginalRow227TriangleBindingsRow010.block0160_value ⟨5, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨1, by rw [checks0004_size]; decide⟩

theorem entry00130_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨2, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0176.coefficient11_14
  · exact OriginalRow227TriangleBindingsRow011.block0176_value ⟨4, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨2, by rw [checks0004_size]; decide⟩

theorem entry00131_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨3, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0192.coefficient12_14
  · exact OriginalRow227TriangleBindingsRow012.block0192_value ⟨3, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨3, by rw [checks0004_size]; decide⟩

theorem entry00132_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨4, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0207.coefficient13_14
  · exact OriginalRow227TriangleBindingsRow013.block0207_value ⟨2, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨4, by rw [checks0004_size]; decide⟩

theorem entry00133_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨5, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0222.coefficient14_14
  · exact OriginalRow227TriangleBindingsRow014.block0222_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨5, by rw [checks0004_size]; decide⟩

theorem entry00134_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨6, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0237.coefficient15_14
  · exact OriginalRow227TriangleBindingsRow015.block0237_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨6, by rw [checks0004_size]; decide⟩

theorem entry00135_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨7, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_15
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨15, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨7, by rw [checks0004_size]; decide⟩

theorem entry00136_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨8, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_15
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨15, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨8, by rw [checks0004_size]; decide⟩

theorem entry00137_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨9, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_15
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨14, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨9, by rw [checks0004_size]; decide⟩

theorem entry00138_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨10, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0048.coefficient3_15
  · exact OriginalRow227TriangleBindingsRow003.block0048_value ⟨13, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨10, by rw [checks0004_size]; decide⟩

theorem entry00139_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨11, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0064.coefficient4_15
  · exact OriginalRow227TriangleBindingsRow004.block0064_value ⟨12, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨11, by rw [checks0004_size]; decide⟩

theorem entry00140_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨12, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0080.coefficient5_15
  · exact OriginalRow227TriangleBindingsRow005.block0080_value ⟨11, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨12, by rw [checks0004_size]; decide⟩

theorem entry00141_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨13, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0096.coefficient6_15
  · exact OriginalRow227TriangleBindingsRow006.block0096_value ⟨10, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨13, by rw [checks0004_size]; decide⟩

theorem entry00142_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨14, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0112.coefficient7_15
  · exact OriginalRow227TriangleBindingsRow007.block0112_value ⟨9, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨14, by rw [checks0004_size]; decide⟩

theorem entry00143_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨15, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0128.coefficient8_15
  · exact OriginalRow227TriangleBindingsRow008.block0128_value ⟨8, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨15, by rw [checks0004_size]; decide⟩

theorem entry00144_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨16, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0144.coefficient9_15
  · exact OriginalRow227TriangleBindingsRow009.block0144_value ⟨7, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨16, by rw [checks0004_size]; decide⟩

theorem entry00145_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨17, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0160.coefficient10_15
  · exact OriginalRow227TriangleBindingsRow010.block0160_value ⟨6, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨17, by rw [checks0004_size]; decide⟩

theorem entry00146_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨18, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0176.coefficient11_15
  · exact OriginalRow227TriangleBindingsRow011.block0176_value ⟨5, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨18, by rw [checks0004_size]; decide⟩

theorem entry00147_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨19, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0192.coefficient12_15
  · exact OriginalRow227TriangleBindingsRow012.block0192_value ⟨4, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨19, by rw [checks0004_size]; decide⟩

theorem entry00148_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨20, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0207.coefficient13_15
  · exact OriginalRow227TriangleBindingsRow013.block0207_value ⟨3, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨20, by rw [checks0004_size]; decide⟩

theorem entry00149_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨21, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0222.coefficient14_15
  · exact OriginalRow227TriangleBindingsRow014.block0222_value ⟨2, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨21, by rw [checks0004_size]; decide⟩

theorem entry00150_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨22, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0237.coefficient15_15
  · exact OriginalRow227TriangleBindingsRow015.block0237_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨22, by rw [checks0004_size]; decide⟩

theorem entry00151_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨23, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0252.coefficient16_15
  · exact OriginalRow227TriangleBindingsRow016.block0252_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨23, by rw [checks0004_size]; decide⟩

theorem entry00152_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨24, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_16
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨16, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨24, by rw [checks0004_size]; decide⟩

theorem entry00153_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨25, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_16
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨16, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨25, by rw [checks0004_size]; decide⟩

theorem entry00154_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨26, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_16
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨15, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨26, by rw [checks0004_size]; decide⟩

theorem entry00155_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨27, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0048.coefficient3_16
  · exact OriginalRow227TriangleBindingsRow003.block0048_value ⟨14, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨27, by rw [checks0004_size]; decide⟩

theorem entry00156_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨28, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0064.coefficient4_16
  · exact OriginalRow227TriangleBindingsRow004.block0064_value ⟨13, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨28, by rw [checks0004_size]; decide⟩

theorem entry00157_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨29, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0080.coefficient5_16
  · exact OriginalRow227TriangleBindingsRow005.block0080_value ⟨12, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨29, by rw [checks0004_size]; decide⟩

theorem entry00158_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨30, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0096.coefficient6_16
  · exact OriginalRow227TriangleBindingsRow006.block0096_value ⟨11, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨30, by rw [checks0004_size]; decide⟩

theorem entry00159_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0004.get ⟨31, by rw [block0004_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0112.coefficient7_16
  · exact OriginalRow227TriangleBindingsRow007.block0112_value ⟨10, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0004 checks0004_checked
      ⟨31, by rw [checks0004_size]; decide⟩

theorem block0004_enclosed : AllEnclosed OriginalRow227TriangleLookup.T block0004 := by
  exact allEnclosed_cons entry00128_enclosed <|
    allEnclosed_cons entry00129_enclosed <|
    allEnclosed_cons entry00130_enclosed <|
    allEnclosed_cons entry00131_enclosed <|
    allEnclosed_cons entry00132_enclosed <|
    allEnclosed_cons entry00133_enclosed <|
    allEnclosed_cons entry00134_enclosed <|
    allEnclosed_cons entry00135_enclosed <|
    allEnclosed_cons entry00136_enclosed <|
    allEnclosed_cons entry00137_enclosed <|
    allEnclosed_cons entry00138_enclosed <|
    allEnclosed_cons entry00139_enclosed <|
    allEnclosed_cons entry00140_enclosed <|
    allEnclosed_cons entry00141_enclosed <|
    allEnclosed_cons entry00142_enclosed <|
    allEnclosed_cons entry00143_enclosed <|
    allEnclosed_cons entry00144_enclosed <|
    allEnclosed_cons entry00145_enclosed <|
    allEnclosed_cons entry00146_enclosed <|
    allEnclosed_cons entry00147_enclosed <|
    allEnclosed_cons entry00148_enclosed <|
    allEnclosed_cons entry00149_enclosed <|
    allEnclosed_cons entry00150_enclosed <|
    allEnclosed_cons entry00151_enclosed <|
    allEnclosed_cons entry00152_enclosed <|
    allEnclosed_cons entry00153_enclosed <|
    allEnclosed_cons entry00154_enclosed <|
    allEnclosed_cons entry00155_enclosed <|
    allEnclosed_cons entry00156_enclosed <|
    allEnclosed_cons entry00157_enclosed <|
    allEnclosed_cons entry00158_enclosed <|
    allEnclosed_cons entry00159_enclosed <|
    allEnclosed_nil OriginalRow227TriangleLookup.T

def checks0005 : Array (ErrorEntry × IntervalDyadic) := #[
  ((block0005.get ⟨0, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0128.coefficient8_16),
  ((block0005.get ⟨1, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0144.coefficient9_16),
  ((block0005.get ⟨2, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0160.coefficient10_16),
  ((block0005.get ⟨3, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0176.coefficient11_16),
  ((block0005.get ⟨4, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0192.coefficient12_16),
  ((block0005.get ⟨5, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0207.coefficient13_16),
  ((block0005.get ⟨6, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0222.coefficient14_16),
  ((block0005.get ⟨7, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0237.coefficient15_16),
  ((block0005.get ⟨8, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0252.coefficient16_16),
  ((block0005.get ⟨9, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0267.coefficient17_16),
  ((block0005.get ⟨10, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_17),
  ((block0005.get ⟨11, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_17),
  ((block0005.get ⟨12, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_17),
  ((block0005.get ⟨13, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0048.coefficient3_17),
  ((block0005.get ⟨14, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0064.coefficient4_17),
  ((block0005.get ⟨15, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0080.coefficient5_17),
  ((block0005.get ⟨16, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0096.coefficient6_17),
  ((block0005.get ⟨17, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0112.coefficient7_17),
  ((block0005.get ⟨18, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0128.coefficient8_17),
  ((block0005.get ⟨19, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0144.coefficient9_17),
  ((block0005.get ⟨20, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0160.coefficient10_17),
  ((block0005.get ⟨21, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0176.coefficient11_17),
  ((block0005.get ⟨22, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0192.coefficient12_17),
  ((block0005.get ⟨23, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0207.coefficient13_17),
  ((block0005.get ⟨24, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0222.coefficient14_17),
  ((block0005.get ⟨25, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0237.coefficient15_17),
  ((block0005.get ⟨26, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0252.coefficient16_17),
  ((block0005.get ⟨27, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0267.coefficient17_17),
  ((block0005.get ⟨28, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0282.coefficient18_17),
  ((block0005.get ⟨29, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_18),
  ((block0005.get ⟨30, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_18),
  ((block0005.get ⟨31, by rw [block0005_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_18)
]

theorem checks0005_size : checks0005.size = 32 := rfl

theorem checks0005_checked :
    blockCheck (fun p => enclosureCheck p.1 p.2) checks0005 = true := by
  decide +kernel

theorem entry00160_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨0, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0128.coefficient8_16
  · exact OriginalRow227TriangleBindingsRow008.block0128_value ⟨9, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨0, by rw [checks0005_size]; decide⟩

theorem entry00161_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨1, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0144.coefficient9_16
  · exact OriginalRow227TriangleBindingsRow009.block0144_value ⟨8, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨1, by rw [checks0005_size]; decide⟩

theorem entry00162_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨2, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0160.coefficient10_16
  · exact OriginalRow227TriangleBindingsRow010.block0160_value ⟨7, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨2, by rw [checks0005_size]; decide⟩

theorem entry00163_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨3, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0176.coefficient11_16
  · exact OriginalRow227TriangleBindingsRow011.block0176_value ⟨6, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨3, by rw [checks0005_size]; decide⟩

theorem entry00164_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨4, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0192.coefficient12_16
  · exact OriginalRow227TriangleBindingsRow012.block0192_value ⟨5, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨4, by rw [checks0005_size]; decide⟩

theorem entry00165_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨5, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0207.coefficient13_16
  · exact OriginalRow227TriangleBindingsRow013.block0207_value ⟨4, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨5, by rw [checks0005_size]; decide⟩

theorem entry00166_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨6, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0222.coefficient14_16
  · exact OriginalRow227TriangleBindingsRow014.block0222_value ⟨3, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨6, by rw [checks0005_size]; decide⟩

theorem entry00167_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨7, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0237.coefficient15_16
  · exact OriginalRow227TriangleBindingsRow015.block0237_value ⟨2, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨7, by rw [checks0005_size]; decide⟩

theorem entry00168_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨8, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0252.coefficient16_16
  · exact OriginalRow227TriangleBindingsRow016.block0252_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨8, by rw [checks0005_size]; decide⟩

theorem entry00169_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨9, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0267.coefficient17_16
  · exact OriginalRow227TriangleBindingsRow017.block0267_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨9, by rw [checks0005_size]; decide⟩

theorem entry00170_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨10, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_17
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨17, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨10, by rw [checks0005_size]; decide⟩

theorem entry00171_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨11, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_17
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨17, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨11, by rw [checks0005_size]; decide⟩

theorem entry00172_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨12, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_17
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨16, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨12, by rw [checks0005_size]; decide⟩

theorem entry00173_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨13, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0048.coefficient3_17
  · exact OriginalRow227TriangleBindingsRow003.block0048_value ⟨15, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨13, by rw [checks0005_size]; decide⟩

theorem entry00174_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨14, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0064.coefficient4_17
  · exact OriginalRow227TriangleBindingsRow004.block0064_value ⟨14, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨14, by rw [checks0005_size]; decide⟩

theorem entry00175_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨15, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0080.coefficient5_17
  · exact OriginalRow227TriangleBindingsRow005.block0080_value ⟨13, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨15, by rw [checks0005_size]; decide⟩

theorem entry00176_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨16, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0096.coefficient6_17
  · exact OriginalRow227TriangleBindingsRow006.block0096_value ⟨12, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨16, by rw [checks0005_size]; decide⟩

theorem entry00177_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨17, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0112.coefficient7_17
  · exact OriginalRow227TriangleBindingsRow007.block0112_value ⟨11, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨17, by rw [checks0005_size]; decide⟩

theorem entry00178_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨18, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0128.coefficient8_17
  · exact OriginalRow227TriangleBindingsRow008.block0128_value ⟨10, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨18, by rw [checks0005_size]; decide⟩

theorem entry00179_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨19, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0144.coefficient9_17
  · exact OriginalRow227TriangleBindingsRow009.block0144_value ⟨9, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨19, by rw [checks0005_size]; decide⟩

theorem entry00180_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨20, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0160.coefficient10_17
  · exact OriginalRow227TriangleBindingsRow010.block0160_value ⟨8, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨20, by rw [checks0005_size]; decide⟩

theorem entry00181_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨21, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0176.coefficient11_17
  · exact OriginalRow227TriangleBindingsRow011.block0176_value ⟨7, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨21, by rw [checks0005_size]; decide⟩

theorem entry00182_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨22, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0192.coefficient12_17
  · exact OriginalRow227TriangleBindingsRow012.block0192_value ⟨6, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨22, by rw [checks0005_size]; decide⟩

theorem entry00183_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨23, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0207.coefficient13_17
  · exact OriginalRow227TriangleBindingsRow013.block0207_value ⟨5, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨23, by rw [checks0005_size]; decide⟩

theorem entry00184_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨24, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0222.coefficient14_17
  · exact OriginalRow227TriangleBindingsRow014.block0222_value ⟨4, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨24, by rw [checks0005_size]; decide⟩

theorem entry00185_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨25, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0237.coefficient15_17
  · exact OriginalRow227TriangleBindingsRow015.block0237_value ⟨3, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨25, by rw [checks0005_size]; decide⟩

theorem entry00186_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨26, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0252.coefficient16_17
  · exact OriginalRow227TriangleBindingsRow016.block0252_value ⟨2, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨26, by rw [checks0005_size]; decide⟩

theorem entry00187_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨27, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0267.coefficient17_17
  · exact OriginalRow227TriangleBindingsRow017.block0267_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨27, by rw [checks0005_size]; decide⟩

theorem entry00188_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨28, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0282.coefficient18_17
  · exact OriginalRow227TriangleBindingsRow018.block0282_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨28, by rw [checks0005_size]; decide⟩

theorem entry00189_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨29, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_18
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨18, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨29, by rw [checks0005_size]; decide⟩

theorem entry00190_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨30, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_18
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨18, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨30, by rw [checks0005_size]; decide⟩

theorem entry00191_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0005.get ⟨31, by rw [block0005_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_18
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨17, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0005 checks0005_checked
      ⟨31, by rw [checks0005_size]; decide⟩

theorem block0005_enclosed : AllEnclosed OriginalRow227TriangleLookup.T block0005 := by
  exact allEnclosed_cons entry00160_enclosed <|
    allEnclosed_cons entry00161_enclosed <|
    allEnclosed_cons entry00162_enclosed <|
    allEnclosed_cons entry00163_enclosed <|
    allEnclosed_cons entry00164_enclosed <|
    allEnclosed_cons entry00165_enclosed <|
    allEnclosed_cons entry00166_enclosed <|
    allEnclosed_cons entry00167_enclosed <|
    allEnclosed_cons entry00168_enclosed <|
    allEnclosed_cons entry00169_enclosed <|
    allEnclosed_cons entry00170_enclosed <|
    allEnclosed_cons entry00171_enclosed <|
    allEnclosed_cons entry00172_enclosed <|
    allEnclosed_cons entry00173_enclosed <|
    allEnclosed_cons entry00174_enclosed <|
    allEnclosed_cons entry00175_enclosed <|
    allEnclosed_cons entry00176_enclosed <|
    allEnclosed_cons entry00177_enclosed <|
    allEnclosed_cons entry00178_enclosed <|
    allEnclosed_cons entry00179_enclosed <|
    allEnclosed_cons entry00180_enclosed <|
    allEnclosed_cons entry00181_enclosed <|
    allEnclosed_cons entry00182_enclosed <|
    allEnclosed_cons entry00183_enclosed <|
    allEnclosed_cons entry00184_enclosed <|
    allEnclosed_cons entry00185_enclosed <|
    allEnclosed_cons entry00186_enclosed <|
    allEnclosed_cons entry00187_enclosed <|
    allEnclosed_cons entry00188_enclosed <|
    allEnclosed_cons entry00189_enclosed <|
    allEnclosed_cons entry00190_enclosed <|
    allEnclosed_cons entry00191_enclosed <|
    allEnclosed_nil OriginalRow227TriangleLookup.T

def checks0006 : Array (ErrorEntry × IntervalDyadic) := #[
  ((block0006.get ⟨0, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0048.coefficient3_18),
  ((block0006.get ⟨1, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0064.coefficient4_18),
  ((block0006.get ⟨2, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0080.coefficient5_18),
  ((block0006.get ⟨3, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0096.coefficient6_18),
  ((block0006.get ⟨4, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0112.coefficient7_18),
  ((block0006.get ⟨5, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0128.coefficient8_18),
  ((block0006.get ⟨6, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0144.coefficient9_18),
  ((block0006.get ⟨7, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0160.coefficient10_18),
  ((block0006.get ⟨8, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0176.coefficient11_18),
  ((block0006.get ⟨9, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0192.coefficient12_18),
  ((block0006.get ⟨10, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0207.coefficient13_18),
  ((block0006.get ⟨11, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0222.coefficient14_18),
  ((block0006.get ⟨12, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0237.coefficient15_18),
  ((block0006.get ⟨13, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0252.coefficient16_18),
  ((block0006.get ⟨14, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0267.coefficient17_18),
  ((block0006.get ⟨15, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0282.coefficient18_18),
  ((block0006.get ⟨16, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0297.coefficient19_18),
  ((block0006.get ⟨17, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_19),
  ((block0006.get ⟨18, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_19),
  ((block0006.get ⟨19, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_19),
  ((block0006.get ⟨20, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0048.coefficient3_19),
  ((block0006.get ⟨21, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0064.coefficient4_19),
  ((block0006.get ⟨22, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0080.coefficient5_19),
  ((block0006.get ⟨23, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0096.coefficient6_19),
  ((block0006.get ⟨24, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0112.coefficient7_19),
  ((block0006.get ⟨25, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0128.coefficient8_19),
  ((block0006.get ⟨26, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0144.coefficient9_19),
  ((block0006.get ⟨27, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0160.coefficient10_19),
  ((block0006.get ⟨28, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0176.coefficient11_19),
  ((block0006.get ⟨29, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0192.coefficient12_19),
  ((block0006.get ⟨30, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0207.coefficient13_19),
  ((block0006.get ⟨31, by rw [block0006_length]; decide⟩), OriginalRow227TriangleData0222.coefficient14_19)
]

theorem checks0006_size : checks0006.size = 32 := rfl

theorem checks0006_checked :
    blockCheck (fun p => enclosureCheck p.1 p.2) checks0006 = true := by
  decide +kernel

theorem entry00192_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨0, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0048.coefficient3_18
  · exact OriginalRow227TriangleBindingsRow003.block0048_value ⟨16, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨0, by rw [checks0006_size]; decide⟩

theorem entry00193_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨1, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0064.coefficient4_18
  · exact OriginalRow227TriangleBindingsRow004.block0064_value ⟨15, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨1, by rw [checks0006_size]; decide⟩

theorem entry00194_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨2, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0080.coefficient5_18
  · exact OriginalRow227TriangleBindingsRow005.block0080_value ⟨14, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨2, by rw [checks0006_size]; decide⟩

theorem entry00195_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨3, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0096.coefficient6_18
  · exact OriginalRow227TriangleBindingsRow006.block0096_value ⟨13, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨3, by rw [checks0006_size]; decide⟩

theorem entry00196_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨4, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0112.coefficient7_18
  · exact OriginalRow227TriangleBindingsRow007.block0112_value ⟨12, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨4, by rw [checks0006_size]; decide⟩

theorem entry00197_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨5, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0128.coefficient8_18
  · exact OriginalRow227TriangleBindingsRow008.block0128_value ⟨11, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨5, by rw [checks0006_size]; decide⟩

theorem entry00198_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨6, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0144.coefficient9_18
  · exact OriginalRow227TriangleBindingsRow009.block0144_value ⟨10, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨6, by rw [checks0006_size]; decide⟩

theorem entry00199_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨7, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0160.coefficient10_18
  · exact OriginalRow227TriangleBindingsRow010.block0160_value ⟨9, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨7, by rw [checks0006_size]; decide⟩

theorem entry00200_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨8, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0176.coefficient11_18
  · exact OriginalRow227TriangleBindingsRow011.block0176_value ⟨8, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨8, by rw [checks0006_size]; decide⟩

theorem entry00201_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨9, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0192.coefficient12_18
  · exact OriginalRow227TriangleBindingsRow012.block0192_value ⟨7, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨9, by rw [checks0006_size]; decide⟩

theorem entry00202_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨10, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0207.coefficient13_18
  · exact OriginalRow227TriangleBindingsRow013.block0207_value ⟨6, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨10, by rw [checks0006_size]; decide⟩

theorem entry00203_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨11, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0222.coefficient14_18
  · exact OriginalRow227TriangleBindingsRow014.block0222_value ⟨5, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨11, by rw [checks0006_size]; decide⟩

theorem entry00204_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨12, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0237.coefficient15_18
  · exact OriginalRow227TriangleBindingsRow015.block0237_value ⟨4, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨12, by rw [checks0006_size]; decide⟩

theorem entry00205_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨13, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0252.coefficient16_18
  · exact OriginalRow227TriangleBindingsRow016.block0252_value ⟨3, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨13, by rw [checks0006_size]; decide⟩

theorem entry00206_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨14, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0267.coefficient17_18
  · exact OriginalRow227TriangleBindingsRow017.block0267_value ⟨2, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨14, by rw [checks0006_size]; decide⟩

theorem entry00207_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨15, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0282.coefficient18_18
  · exact OriginalRow227TriangleBindingsRow018.block0282_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨15, by rw [checks0006_size]; decide⟩

theorem entry00208_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨16, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0297.coefficient19_18
  · exact OriginalRow227TriangleBindingsRow019.block0297_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨16, by rw [checks0006_size]; decide⟩

theorem entry00209_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨17, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_19
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨19, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨17, by rw [checks0006_size]; decide⟩

theorem entry00210_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨18, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_19
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨19, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨18, by rw [checks0006_size]; decide⟩

theorem entry00211_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨19, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_19
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨18, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨19, by rw [checks0006_size]; decide⟩

theorem entry00212_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨20, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0048.coefficient3_19
  · exact OriginalRow227TriangleBindingsRow003.block0048_value ⟨17, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨20, by rw [checks0006_size]; decide⟩

theorem entry00213_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨21, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0064.coefficient4_19
  · exact OriginalRow227TriangleBindingsRow004.block0064_value ⟨16, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨21, by rw [checks0006_size]; decide⟩

theorem entry00214_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨22, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0080.coefficient5_19
  · exact OriginalRow227TriangleBindingsRow005.block0080_value ⟨15, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨22, by rw [checks0006_size]; decide⟩

theorem entry00215_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨23, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0096.coefficient6_19
  · exact OriginalRow227TriangleBindingsRow006.block0096_value ⟨14, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨23, by rw [checks0006_size]; decide⟩

theorem entry00216_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨24, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0112.coefficient7_19
  · exact OriginalRow227TriangleBindingsRow007.block0112_value ⟨13, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨24, by rw [checks0006_size]; decide⟩

theorem entry00217_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨25, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0128.coefficient8_19
  · exact OriginalRow227TriangleBindingsRow008.block0128_value ⟨12, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨25, by rw [checks0006_size]; decide⟩

theorem entry00218_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨26, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0144.coefficient9_19
  · exact OriginalRow227TriangleBindingsRow009.block0144_value ⟨11, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨26, by rw [checks0006_size]; decide⟩

theorem entry00219_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨27, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0160.coefficient10_19
  · exact OriginalRow227TriangleBindingsRow010.block0160_value ⟨10, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨27, by rw [checks0006_size]; decide⟩

theorem entry00220_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨28, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0176.coefficient11_19
  · exact OriginalRow227TriangleBindingsRow011.block0176_value ⟨9, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨28, by rw [checks0006_size]; decide⟩

theorem entry00221_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨29, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0192.coefficient12_19
  · exact OriginalRow227TriangleBindingsRow012.block0192_value ⟨8, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨29, by rw [checks0006_size]; decide⟩

theorem entry00222_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨30, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0207.coefficient13_19
  · exact OriginalRow227TriangleBindingsRow013.block0207_value ⟨7, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨30, by rw [checks0006_size]; decide⟩

theorem entry00223_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0006.get ⟨31, by rw [block0006_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0222.coefficient14_19
  · exact OriginalRow227TriangleBindingsRow014.block0222_value ⟨6, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0006 checks0006_checked
      ⟨31, by rw [checks0006_size]; decide⟩

theorem block0006_enclosed : AllEnclosed OriginalRow227TriangleLookup.T block0006 := by
  exact allEnclosed_cons entry00192_enclosed <|
    allEnclosed_cons entry00193_enclosed <|
    allEnclosed_cons entry00194_enclosed <|
    allEnclosed_cons entry00195_enclosed <|
    allEnclosed_cons entry00196_enclosed <|
    allEnclosed_cons entry00197_enclosed <|
    allEnclosed_cons entry00198_enclosed <|
    allEnclosed_cons entry00199_enclosed <|
    allEnclosed_cons entry00200_enclosed <|
    allEnclosed_cons entry00201_enclosed <|
    allEnclosed_cons entry00202_enclosed <|
    allEnclosed_cons entry00203_enclosed <|
    allEnclosed_cons entry00204_enclosed <|
    allEnclosed_cons entry00205_enclosed <|
    allEnclosed_cons entry00206_enclosed <|
    allEnclosed_cons entry00207_enclosed <|
    allEnclosed_cons entry00208_enclosed <|
    allEnclosed_cons entry00209_enclosed <|
    allEnclosed_cons entry00210_enclosed <|
    allEnclosed_cons entry00211_enclosed <|
    allEnclosed_cons entry00212_enclosed <|
    allEnclosed_cons entry00213_enclosed <|
    allEnclosed_cons entry00214_enclosed <|
    allEnclosed_cons entry00215_enclosed <|
    allEnclosed_cons entry00216_enclosed <|
    allEnclosed_cons entry00217_enclosed <|
    allEnclosed_cons entry00218_enclosed <|
    allEnclosed_cons entry00219_enclosed <|
    allEnclosed_cons entry00220_enclosed <|
    allEnclosed_cons entry00221_enclosed <|
    allEnclosed_cons entry00222_enclosed <|
    allEnclosed_cons entry00223_enclosed <|
    allEnclosed_nil OriginalRow227TriangleLookup.T

def checks0007 : Array (ErrorEntry × IntervalDyadic) := #[
  ((block0007.get ⟨0, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0237.coefficient15_19),
  ((block0007.get ⟨1, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0252.coefficient16_19),
  ((block0007.get ⟨2, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0267.coefficient17_19),
  ((block0007.get ⟨3, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0282.coefficient18_19),
  ((block0007.get ⟨4, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0297.coefficient19_19),
  ((block0007.get ⟨5, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0312.coefficient20_19),
  ((block0007.get ⟨6, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_20),
  ((block0007.get ⟨7, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_20),
  ((block0007.get ⟨8, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_20),
  ((block0007.get ⟨9, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0048.coefficient3_20),
  ((block0007.get ⟨10, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0064.coefficient4_20),
  ((block0007.get ⟨11, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0080.coefficient5_20),
  ((block0007.get ⟨12, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0096.coefficient6_20),
  ((block0007.get ⟨13, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0112.coefficient7_20),
  ((block0007.get ⟨14, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0128.coefficient8_20),
  ((block0007.get ⟨15, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0144.coefficient9_20),
  ((block0007.get ⟨16, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0160.coefficient10_20),
  ((block0007.get ⟨17, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0176.coefficient11_20),
  ((block0007.get ⟨18, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0192.coefficient12_20),
  ((block0007.get ⟨19, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0207.coefficient13_20),
  ((block0007.get ⟨20, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0222.coefficient14_20),
  ((block0007.get ⟨21, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0237.coefficient15_20),
  ((block0007.get ⟨22, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0252.coefficient16_20),
  ((block0007.get ⟨23, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0267.coefficient17_20),
  ((block0007.get ⟨24, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0282.coefficient18_20),
  ((block0007.get ⟨25, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0297.coefficient19_20),
  ((block0007.get ⟨26, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0312.coefficient20_20),
  ((block0007.get ⟨27, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0327.coefficient21_20),
  ((block0007.get ⟨28, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_21),
  ((block0007.get ⟨29, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_21),
  ((block0007.get ⟨30, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_21),
  ((block0007.get ⟨31, by rw [block0007_length]; decide⟩), OriginalRow227TriangleData0048.coefficient3_21)
]

theorem checks0007_size : checks0007.size = 32 := rfl

theorem checks0007_checked :
    blockCheck (fun p => enclosureCheck p.1 p.2) checks0007 = true := by
  decide +kernel

theorem entry00224_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨0, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0237.coefficient15_19
  · exact OriginalRow227TriangleBindingsRow015.block0237_value ⟨5, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨0, by rw [checks0007_size]; decide⟩

theorem entry00225_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨1, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0252.coefficient16_19
  · exact OriginalRow227TriangleBindingsRow016.block0252_value ⟨4, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨1, by rw [checks0007_size]; decide⟩

theorem entry00226_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨2, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0267.coefficient17_19
  · exact OriginalRow227TriangleBindingsRow017.block0267_value ⟨3, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨2, by rw [checks0007_size]; decide⟩

theorem entry00227_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨3, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0282.coefficient18_19
  · exact OriginalRow227TriangleBindingsRow018.block0282_value ⟨2, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨3, by rw [checks0007_size]; decide⟩

theorem entry00228_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨4, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0297.coefficient19_19
  · exact OriginalRow227TriangleBindingsRow019.block0297_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨4, by rw [checks0007_size]; decide⟩

theorem entry00229_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨5, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0312.coefficient20_19
  · exact OriginalRow227TriangleBindingsRow020.block0312_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨5, by rw [checks0007_size]; decide⟩

theorem entry00230_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨6, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_20
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨20, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨6, by rw [checks0007_size]; decide⟩

theorem entry00231_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨7, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_20
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨20, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨7, by rw [checks0007_size]; decide⟩

theorem entry00232_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨8, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_20
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨19, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨8, by rw [checks0007_size]; decide⟩

theorem entry00233_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨9, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0048.coefficient3_20
  · exact OriginalRow227TriangleBindingsRow003.block0048_value ⟨18, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨9, by rw [checks0007_size]; decide⟩

theorem entry00234_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨10, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0064.coefficient4_20
  · exact OriginalRow227TriangleBindingsRow004.block0064_value ⟨17, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨10, by rw [checks0007_size]; decide⟩

theorem entry00235_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨11, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0080.coefficient5_20
  · exact OriginalRow227TriangleBindingsRow005.block0080_value ⟨16, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨11, by rw [checks0007_size]; decide⟩

theorem entry00236_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨12, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0096.coefficient6_20
  · exact OriginalRow227TriangleBindingsRow006.block0096_value ⟨15, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨12, by rw [checks0007_size]; decide⟩

theorem entry00237_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨13, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0112.coefficient7_20
  · exact OriginalRow227TriangleBindingsRow007.block0112_value ⟨14, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨13, by rw [checks0007_size]; decide⟩

theorem entry00238_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨14, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0128.coefficient8_20
  · exact OriginalRow227TriangleBindingsRow008.block0128_value ⟨13, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨14, by rw [checks0007_size]; decide⟩

theorem entry00239_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨15, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0144.coefficient9_20
  · exact OriginalRow227TriangleBindingsRow009.block0144_value ⟨12, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨15, by rw [checks0007_size]; decide⟩

theorem entry00240_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨16, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0160.coefficient10_20
  · exact OriginalRow227TriangleBindingsRow010.block0160_value ⟨11, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨16, by rw [checks0007_size]; decide⟩

theorem entry00241_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨17, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0176.coefficient11_20
  · exact OriginalRow227TriangleBindingsRow011.block0176_value ⟨10, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨17, by rw [checks0007_size]; decide⟩

theorem entry00242_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨18, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0192.coefficient12_20
  · exact OriginalRow227TriangleBindingsRow012.block0192_value ⟨9, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨18, by rw [checks0007_size]; decide⟩

theorem entry00243_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨19, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0207.coefficient13_20
  · exact OriginalRow227TriangleBindingsRow013.block0207_value ⟨8, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨19, by rw [checks0007_size]; decide⟩

theorem entry00244_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨20, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0222.coefficient14_20
  · exact OriginalRow227TriangleBindingsRow014.block0222_value ⟨7, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨20, by rw [checks0007_size]; decide⟩

theorem entry00245_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨21, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0237.coefficient15_20
  · exact OriginalRow227TriangleBindingsRow015.block0237_value ⟨6, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨21, by rw [checks0007_size]; decide⟩

theorem entry00246_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨22, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0252.coefficient16_20
  · exact OriginalRow227TriangleBindingsRow016.block0252_value ⟨5, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨22, by rw [checks0007_size]; decide⟩

theorem entry00247_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨23, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0267.coefficient17_20
  · exact OriginalRow227TriangleBindingsRow017.block0267_value ⟨4, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨23, by rw [checks0007_size]; decide⟩

theorem entry00248_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨24, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0282.coefficient18_20
  · exact OriginalRow227TriangleBindingsRow018.block0282_value ⟨3, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨24, by rw [checks0007_size]; decide⟩

theorem entry00249_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨25, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0297.coefficient19_20
  · exact OriginalRow227TriangleBindingsRow019.block0297_value ⟨2, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨25, by rw [checks0007_size]; decide⟩

theorem entry00250_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨26, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0312.coefficient20_20
  · exact OriginalRow227TriangleBindingsRow020.block0312_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨26, by rw [checks0007_size]; decide⟩

theorem entry00251_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨27, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0327.coefficient21_20
  · exact OriginalRow227TriangleBindingsRow021.block0327_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨27, by rw [checks0007_size]; decide⟩

theorem entry00252_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨28, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_21
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨21, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨28, by rw [checks0007_size]; decide⟩

theorem entry00253_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨29, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_21
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨21, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨29, by rw [checks0007_size]; decide⟩

theorem entry00254_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨30, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_21
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨20, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨30, by rw [checks0007_size]; decide⟩

theorem entry00255_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0007.get ⟨31, by rw [block0007_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0048.coefficient3_21
  · exact OriginalRow227TriangleBindingsRow003.block0048_value ⟨19, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0007 checks0007_checked
      ⟨31, by rw [checks0007_size]; decide⟩

theorem block0007_enclosed : AllEnclosed OriginalRow227TriangleLookup.T block0007 := by
  exact allEnclosed_cons entry00224_enclosed <|
    allEnclosed_cons entry00225_enclosed <|
    allEnclosed_cons entry00226_enclosed <|
    allEnclosed_cons entry00227_enclosed <|
    allEnclosed_cons entry00228_enclosed <|
    allEnclosed_cons entry00229_enclosed <|
    allEnclosed_cons entry00230_enclosed <|
    allEnclosed_cons entry00231_enclosed <|
    allEnclosed_cons entry00232_enclosed <|
    allEnclosed_cons entry00233_enclosed <|
    allEnclosed_cons entry00234_enclosed <|
    allEnclosed_cons entry00235_enclosed <|
    allEnclosed_cons entry00236_enclosed <|
    allEnclosed_cons entry00237_enclosed <|
    allEnclosed_cons entry00238_enclosed <|
    allEnclosed_cons entry00239_enclosed <|
    allEnclosed_cons entry00240_enclosed <|
    allEnclosed_cons entry00241_enclosed <|
    allEnclosed_cons entry00242_enclosed <|
    allEnclosed_cons entry00243_enclosed <|
    allEnclosed_cons entry00244_enclosed <|
    allEnclosed_cons entry00245_enclosed <|
    allEnclosed_cons entry00246_enclosed <|
    allEnclosed_cons entry00247_enclosed <|
    allEnclosed_cons entry00248_enclosed <|
    allEnclosed_cons entry00249_enclosed <|
    allEnclosed_cons entry00250_enclosed <|
    allEnclosed_cons entry00251_enclosed <|
    allEnclosed_cons entry00252_enclosed <|
    allEnclosed_cons entry00253_enclosed <|
    allEnclosed_cons entry00254_enclosed <|
    allEnclosed_cons entry00255_enclosed <|
    allEnclosed_nil OriginalRow227TriangleLookup.T

def checks0008 : Array (ErrorEntry × IntervalDyadic) := #[
  ((block0008.get ⟨0, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0064.coefficient4_21),
  ((block0008.get ⟨1, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0080.coefficient5_21),
  ((block0008.get ⟨2, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0096.coefficient6_21),
  ((block0008.get ⟨3, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0112.coefficient7_21),
  ((block0008.get ⟨4, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0128.coefficient8_21),
  ((block0008.get ⟨5, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0144.coefficient9_21),
  ((block0008.get ⟨6, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0160.coefficient10_21),
  ((block0008.get ⟨7, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0176.coefficient11_21),
  ((block0008.get ⟨8, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0192.coefficient12_21),
  ((block0008.get ⟨9, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0207.coefficient13_21),
  ((block0008.get ⟨10, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0222.coefficient14_21),
  ((block0008.get ⟨11, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0237.coefficient15_21),
  ((block0008.get ⟨12, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0252.coefficient16_21),
  ((block0008.get ⟨13, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0267.coefficient17_21),
  ((block0008.get ⟨14, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0282.coefficient18_21),
  ((block0008.get ⟨15, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0297.coefficient19_21),
  ((block0008.get ⟨16, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0312.coefficient20_21),
  ((block0008.get ⟨17, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0327.coefficient21_21),
  ((block0008.get ⟨18, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0342.coefficient22_21),
  ((block0008.get ⟨19, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_22),
  ((block0008.get ⟨20, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_22),
  ((block0008.get ⟨21, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_22),
  ((block0008.get ⟨22, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0048.coefficient3_22),
  ((block0008.get ⟨23, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0064.coefficient4_22),
  ((block0008.get ⟨24, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0080.coefficient5_22),
  ((block0008.get ⟨25, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0096.coefficient6_22),
  ((block0008.get ⟨26, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0112.coefficient7_22),
  ((block0008.get ⟨27, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0128.coefficient8_22),
  ((block0008.get ⟨28, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0144.coefficient9_22),
  ((block0008.get ⟨29, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0160.coefficient10_22),
  ((block0008.get ⟨30, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0176.coefficient11_22),
  ((block0008.get ⟨31, by rw [block0008_length]; decide⟩), OriginalRow227TriangleData0192.coefficient12_22)
]

theorem checks0008_size : checks0008.size = 32 := rfl

theorem checks0008_checked :
    blockCheck (fun p => enclosureCheck p.1 p.2) checks0008 = true := by
  decide +kernel

theorem entry00256_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨0, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0064.coefficient4_21
  · exact OriginalRow227TriangleBindingsRow004.block0064_value ⟨18, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨0, by rw [checks0008_size]; decide⟩

theorem entry00257_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨1, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0080.coefficient5_21
  · exact OriginalRow227TriangleBindingsRow005.block0080_value ⟨17, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨1, by rw [checks0008_size]; decide⟩

theorem entry00258_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨2, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0096.coefficient6_21
  · exact OriginalRow227TriangleBindingsRow006.block0096_value ⟨16, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨2, by rw [checks0008_size]; decide⟩

theorem entry00259_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨3, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0112.coefficient7_21
  · exact OriginalRow227TriangleBindingsRow007.block0112_value ⟨15, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨3, by rw [checks0008_size]; decide⟩

theorem entry00260_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨4, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0128.coefficient8_21
  · exact OriginalRow227TriangleBindingsRow008.block0128_value ⟨14, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨4, by rw [checks0008_size]; decide⟩

theorem entry00261_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨5, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0144.coefficient9_21
  · exact OriginalRow227TriangleBindingsRow009.block0144_value ⟨13, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨5, by rw [checks0008_size]; decide⟩

theorem entry00262_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨6, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0160.coefficient10_21
  · exact OriginalRow227TriangleBindingsRow010.block0160_value ⟨12, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨6, by rw [checks0008_size]; decide⟩

theorem entry00263_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨7, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0176.coefficient11_21
  · exact OriginalRow227TriangleBindingsRow011.block0176_value ⟨11, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨7, by rw [checks0008_size]; decide⟩

theorem entry00264_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨8, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0192.coefficient12_21
  · exact OriginalRow227TriangleBindingsRow012.block0192_value ⟨10, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨8, by rw [checks0008_size]; decide⟩

theorem entry00265_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨9, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0207.coefficient13_21
  · exact OriginalRow227TriangleBindingsRow013.block0207_value ⟨9, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨9, by rw [checks0008_size]; decide⟩

theorem entry00266_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨10, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0222.coefficient14_21
  · exact OriginalRow227TriangleBindingsRow014.block0222_value ⟨8, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨10, by rw [checks0008_size]; decide⟩

theorem entry00267_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨11, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0237.coefficient15_21
  · exact OriginalRow227TriangleBindingsRow015.block0237_value ⟨7, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨11, by rw [checks0008_size]; decide⟩

theorem entry00268_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨12, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0252.coefficient16_21
  · exact OriginalRow227TriangleBindingsRow016.block0252_value ⟨6, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨12, by rw [checks0008_size]; decide⟩

theorem entry00269_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨13, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0267.coefficient17_21
  · exact OriginalRow227TriangleBindingsRow017.block0267_value ⟨5, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨13, by rw [checks0008_size]; decide⟩

theorem entry00270_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨14, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0282.coefficient18_21
  · exact OriginalRow227TriangleBindingsRow018.block0282_value ⟨4, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨14, by rw [checks0008_size]; decide⟩

theorem entry00271_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨15, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0297.coefficient19_21
  · exact OriginalRow227TriangleBindingsRow019.block0297_value ⟨3, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨15, by rw [checks0008_size]; decide⟩

theorem entry00272_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨16, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0312.coefficient20_21
  · exact OriginalRow227TriangleBindingsRow020.block0312_value ⟨2, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨16, by rw [checks0008_size]; decide⟩

theorem entry00273_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨17, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0327.coefficient21_21
  · exact OriginalRow227TriangleBindingsRow021.block0327_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨17, by rw [checks0008_size]; decide⟩

theorem entry00274_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨18, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0342.coefficient22_21
  · exact OriginalRow227TriangleBindingsRow022.block0342_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨18, by rw [checks0008_size]; decide⟩

theorem entry00275_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨19, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_22
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨22, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨19, by rw [checks0008_size]; decide⟩

theorem entry00276_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨20, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_22
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨22, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨20, by rw [checks0008_size]; decide⟩

theorem entry00277_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨21, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_22
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨21, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨21, by rw [checks0008_size]; decide⟩

theorem entry00278_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨22, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0048.coefficient3_22
  · exact OriginalRow227TriangleBindingsRow003.block0048_value ⟨20, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨22, by rw [checks0008_size]; decide⟩

theorem entry00279_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨23, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0064.coefficient4_22
  · exact OriginalRow227TriangleBindingsRow004.block0064_value ⟨19, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨23, by rw [checks0008_size]; decide⟩

theorem entry00280_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨24, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0080.coefficient5_22
  · exact OriginalRow227TriangleBindingsRow005.block0080_value ⟨18, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨24, by rw [checks0008_size]; decide⟩

theorem entry00281_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨25, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0096.coefficient6_22
  · exact OriginalRow227TriangleBindingsRow006.block0096_value ⟨17, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨25, by rw [checks0008_size]; decide⟩

theorem entry00282_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨26, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0112.coefficient7_22
  · exact OriginalRow227TriangleBindingsRow007.block0112_value ⟨16, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨26, by rw [checks0008_size]; decide⟩

theorem entry00283_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨27, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0128.coefficient8_22
  · exact OriginalRow227TriangleBindingsRow008.block0128_value ⟨15, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨27, by rw [checks0008_size]; decide⟩

theorem entry00284_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨28, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0144.coefficient9_22
  · exact OriginalRow227TriangleBindingsRow009.block0144_value ⟨14, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨28, by rw [checks0008_size]; decide⟩

theorem entry00285_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨29, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0160.coefficient10_22
  · exact OriginalRow227TriangleBindingsRow010.block0160_value ⟨13, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨29, by rw [checks0008_size]; decide⟩

theorem entry00286_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨30, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0176.coefficient11_22
  · exact OriginalRow227TriangleBindingsRow011.block0176_value ⟨12, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨30, by rw [checks0008_size]; decide⟩

theorem entry00287_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0008.get ⟨31, by rw [block0008_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0192.coefficient12_22
  · exact OriginalRow227TriangleBindingsRow012.block0192_value ⟨11, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0008 checks0008_checked
      ⟨31, by rw [checks0008_size]; decide⟩

theorem block0008_enclosed : AllEnclosed OriginalRow227TriangleLookup.T block0008 := by
  exact allEnclosed_cons entry00256_enclosed <|
    allEnclosed_cons entry00257_enclosed <|
    allEnclosed_cons entry00258_enclosed <|
    allEnclosed_cons entry00259_enclosed <|
    allEnclosed_cons entry00260_enclosed <|
    allEnclosed_cons entry00261_enclosed <|
    allEnclosed_cons entry00262_enclosed <|
    allEnclosed_cons entry00263_enclosed <|
    allEnclosed_cons entry00264_enclosed <|
    allEnclosed_cons entry00265_enclosed <|
    allEnclosed_cons entry00266_enclosed <|
    allEnclosed_cons entry00267_enclosed <|
    allEnclosed_cons entry00268_enclosed <|
    allEnclosed_cons entry00269_enclosed <|
    allEnclosed_cons entry00270_enclosed <|
    allEnclosed_cons entry00271_enclosed <|
    allEnclosed_cons entry00272_enclosed <|
    allEnclosed_cons entry00273_enclosed <|
    allEnclosed_cons entry00274_enclosed <|
    allEnclosed_cons entry00275_enclosed <|
    allEnclosed_cons entry00276_enclosed <|
    allEnclosed_cons entry00277_enclosed <|
    allEnclosed_cons entry00278_enclosed <|
    allEnclosed_cons entry00279_enclosed <|
    allEnclosed_cons entry00280_enclosed <|
    allEnclosed_cons entry00281_enclosed <|
    allEnclosed_cons entry00282_enclosed <|
    allEnclosed_cons entry00283_enclosed <|
    allEnclosed_cons entry00284_enclosed <|
    allEnclosed_cons entry00285_enclosed <|
    allEnclosed_cons entry00286_enclosed <|
    allEnclosed_cons entry00287_enclosed <|
    allEnclosed_nil OriginalRow227TriangleLookup.T

def checks0009 : Array (ErrorEntry × IntervalDyadic) := #[
  ((block0009.get ⟨0, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0207.coefficient13_22),
  ((block0009.get ⟨1, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0222.coefficient14_22),
  ((block0009.get ⟨2, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0237.coefficient15_22),
  ((block0009.get ⟨3, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0252.coefficient16_22),
  ((block0009.get ⟨4, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0267.coefficient17_22),
  ((block0009.get ⟨5, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0282.coefficient18_22),
  ((block0009.get ⟨6, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0297.coefficient19_22),
  ((block0009.get ⟨7, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0312.coefficient20_22),
  ((block0009.get ⟨8, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0327.coefficient21_22),
  ((block0009.get ⟨9, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0342.coefficient22_22),
  ((block0009.get ⟨10, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0357.coefficient23_22),
  ((block0009.get ⟨11, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_23),
  ((block0009.get ⟨12, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_23),
  ((block0009.get ⟨13, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_23),
  ((block0009.get ⟨14, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0048.coefficient3_23),
  ((block0009.get ⟨15, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0064.coefficient4_23),
  ((block0009.get ⟨16, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0080.coefficient5_23),
  ((block0009.get ⟨17, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0096.coefficient6_23),
  ((block0009.get ⟨18, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0112.coefficient7_23),
  ((block0009.get ⟨19, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0128.coefficient8_23),
  ((block0009.get ⟨20, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0144.coefficient9_23),
  ((block0009.get ⟨21, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0160.coefficient10_23),
  ((block0009.get ⟨22, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0176.coefficient11_23),
  ((block0009.get ⟨23, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0192.coefficient12_23),
  ((block0009.get ⟨24, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0207.coefficient13_23),
  ((block0009.get ⟨25, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0222.coefficient14_23),
  ((block0009.get ⟨26, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0237.coefficient15_23),
  ((block0009.get ⟨27, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0252.coefficient16_23),
  ((block0009.get ⟨28, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0267.coefficient17_23),
  ((block0009.get ⟨29, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0282.coefficient18_23),
  ((block0009.get ⟨30, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0297.coefficient19_23),
  ((block0009.get ⟨31, by rw [block0009_length]; decide⟩), OriginalRow227TriangleData0312.coefficient20_23)
]

theorem checks0009_size : checks0009.size = 32 := rfl

theorem checks0009_checked :
    blockCheck (fun p => enclosureCheck p.1 p.2) checks0009 = true := by
  decide +kernel

theorem entry00288_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨0, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0207.coefficient13_22
  · exact OriginalRow227TriangleBindingsRow013.block0207_value ⟨10, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨0, by rw [checks0009_size]; decide⟩

theorem entry00289_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨1, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0222.coefficient14_22
  · exact OriginalRow227TriangleBindingsRow014.block0222_value ⟨9, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨1, by rw [checks0009_size]; decide⟩

theorem entry00290_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨2, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0237.coefficient15_22
  · exact OriginalRow227TriangleBindingsRow015.block0237_value ⟨8, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨2, by rw [checks0009_size]; decide⟩

theorem entry00291_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨3, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0252.coefficient16_22
  · exact OriginalRow227TriangleBindingsRow016.block0252_value ⟨7, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨3, by rw [checks0009_size]; decide⟩

theorem entry00292_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨4, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0267.coefficient17_22
  · exact OriginalRow227TriangleBindingsRow017.block0267_value ⟨6, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨4, by rw [checks0009_size]; decide⟩

theorem entry00293_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨5, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0282.coefficient18_22
  · exact OriginalRow227TriangleBindingsRow018.block0282_value ⟨5, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨5, by rw [checks0009_size]; decide⟩

theorem entry00294_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨6, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0297.coefficient19_22
  · exact OriginalRow227TriangleBindingsRow019.block0297_value ⟨4, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨6, by rw [checks0009_size]; decide⟩

theorem entry00295_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨7, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0312.coefficient20_22
  · exact OriginalRow227TriangleBindingsRow020.block0312_value ⟨3, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨7, by rw [checks0009_size]; decide⟩

theorem entry00296_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨8, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0327.coefficient21_22
  · exact OriginalRow227TriangleBindingsRow021.block0327_value ⟨2, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨8, by rw [checks0009_size]; decide⟩

theorem entry00297_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨9, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0342.coefficient22_22
  · exact OriginalRow227TriangleBindingsRow022.block0342_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨9, by rw [checks0009_size]; decide⟩

theorem entry00298_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨10, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0357.coefficient23_22
  · exact OriginalRow227TriangleBindingsRow023.block0357_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨10, by rw [checks0009_size]; decide⟩

theorem entry00299_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨11, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_23
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨23, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨11, by rw [checks0009_size]; decide⟩

theorem entry00300_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨12, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_23
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨23, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨12, by rw [checks0009_size]; decide⟩

theorem entry00301_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨13, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_23
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨22, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨13, by rw [checks0009_size]; decide⟩

theorem entry00302_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨14, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0048.coefficient3_23
  · exact OriginalRow227TriangleBindingsRow003.block0048_value ⟨21, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨14, by rw [checks0009_size]; decide⟩

theorem entry00303_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨15, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0064.coefficient4_23
  · exact OriginalRow227TriangleBindingsRow004.block0064_value ⟨20, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨15, by rw [checks0009_size]; decide⟩

theorem entry00304_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨16, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0080.coefficient5_23
  · exact OriginalRow227TriangleBindingsRow005.block0080_value ⟨19, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨16, by rw [checks0009_size]; decide⟩

theorem entry00305_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨17, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0096.coefficient6_23
  · exact OriginalRow227TriangleBindingsRow006.block0096_value ⟨18, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨17, by rw [checks0009_size]; decide⟩

theorem entry00306_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨18, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0112.coefficient7_23
  · exact OriginalRow227TriangleBindingsRow007.block0112_value ⟨17, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨18, by rw [checks0009_size]; decide⟩

theorem entry00307_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨19, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0128.coefficient8_23
  · exact OriginalRow227TriangleBindingsRow008.block0128_value ⟨16, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨19, by rw [checks0009_size]; decide⟩

theorem entry00308_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨20, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0144.coefficient9_23
  · exact OriginalRow227TriangleBindingsRow009.block0144_value ⟨15, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨20, by rw [checks0009_size]; decide⟩

theorem entry00309_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨21, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0160.coefficient10_23
  · exact OriginalRow227TriangleBindingsRow010.block0160_value ⟨14, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨21, by rw [checks0009_size]; decide⟩

theorem entry00310_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨22, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0176.coefficient11_23
  · exact OriginalRow227TriangleBindingsRow011.block0176_value ⟨13, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨22, by rw [checks0009_size]; decide⟩

theorem entry00311_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨23, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0192.coefficient12_23
  · exact OriginalRow227TriangleBindingsRow012.block0192_value ⟨12, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨23, by rw [checks0009_size]; decide⟩

theorem entry00312_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨24, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0207.coefficient13_23
  · exact OriginalRow227TriangleBindingsRow013.block0207_value ⟨11, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨24, by rw [checks0009_size]; decide⟩

theorem entry00313_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨25, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0222.coefficient14_23
  · exact OriginalRow227TriangleBindingsRow014.block0222_value ⟨10, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨25, by rw [checks0009_size]; decide⟩

theorem entry00314_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨26, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0237.coefficient15_23
  · exact OriginalRow227TriangleBindingsRow015.block0237_value ⟨9, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨26, by rw [checks0009_size]; decide⟩

theorem entry00315_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨27, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0252.coefficient16_23
  · exact OriginalRow227TriangleBindingsRow016.block0252_value ⟨8, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨27, by rw [checks0009_size]; decide⟩

theorem entry00316_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨28, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0267.coefficient17_23
  · exact OriginalRow227TriangleBindingsRow017.block0267_value ⟨7, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨28, by rw [checks0009_size]; decide⟩

theorem entry00317_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨29, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0282.coefficient18_23
  · exact OriginalRow227TriangleBindingsRow018.block0282_value ⟨6, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨29, by rw [checks0009_size]; decide⟩

theorem entry00318_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨30, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0297.coefficient19_23
  · exact OriginalRow227TriangleBindingsRow019.block0297_value ⟨5, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨30, by rw [checks0009_size]; decide⟩

theorem entry00319_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0009.get ⟨31, by rw [block0009_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0312.coefficient20_23
  · exact OriginalRow227TriangleBindingsRow020.block0312_value ⟨4, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0009 checks0009_checked
      ⟨31, by rw [checks0009_size]; decide⟩

theorem block0009_enclosed : AllEnclosed OriginalRow227TriangleLookup.T block0009 := by
  exact allEnclosed_cons entry00288_enclosed <|
    allEnclosed_cons entry00289_enclosed <|
    allEnclosed_cons entry00290_enclosed <|
    allEnclosed_cons entry00291_enclosed <|
    allEnclosed_cons entry00292_enclosed <|
    allEnclosed_cons entry00293_enclosed <|
    allEnclosed_cons entry00294_enclosed <|
    allEnclosed_cons entry00295_enclosed <|
    allEnclosed_cons entry00296_enclosed <|
    allEnclosed_cons entry00297_enclosed <|
    allEnclosed_cons entry00298_enclosed <|
    allEnclosed_cons entry00299_enclosed <|
    allEnclosed_cons entry00300_enclosed <|
    allEnclosed_cons entry00301_enclosed <|
    allEnclosed_cons entry00302_enclosed <|
    allEnclosed_cons entry00303_enclosed <|
    allEnclosed_cons entry00304_enclosed <|
    allEnclosed_cons entry00305_enclosed <|
    allEnclosed_cons entry00306_enclosed <|
    allEnclosed_cons entry00307_enclosed <|
    allEnclosed_cons entry00308_enclosed <|
    allEnclosed_cons entry00309_enclosed <|
    allEnclosed_cons entry00310_enclosed <|
    allEnclosed_cons entry00311_enclosed <|
    allEnclosed_cons entry00312_enclosed <|
    allEnclosed_cons entry00313_enclosed <|
    allEnclosed_cons entry00314_enclosed <|
    allEnclosed_cons entry00315_enclosed <|
    allEnclosed_cons entry00316_enclosed <|
    allEnclosed_cons entry00317_enclosed <|
    allEnclosed_cons entry00318_enclosed <|
    allEnclosed_cons entry00319_enclosed <|
    allEnclosed_nil OriginalRow227TriangleLookup.T

def checks0010 : Array (ErrorEntry × IntervalDyadic) := #[
  ((block0010.get ⟨0, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0327.coefficient21_23),
  ((block0010.get ⟨1, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0342.coefficient22_23),
  ((block0010.get ⟨2, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0357.coefficient23_23),
  ((block0010.get ⟨3, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0372.coefficient24_23),
  ((block0010.get ⟨4, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_24),
  ((block0010.get ⟨5, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_24),
  ((block0010.get ⟨6, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_24),
  ((block0010.get ⟨7, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0048.coefficient3_24),
  ((block0010.get ⟨8, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0064.coefficient4_24),
  ((block0010.get ⟨9, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0080.coefficient5_24),
  ((block0010.get ⟨10, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0096.coefficient6_24),
  ((block0010.get ⟨11, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0112.coefficient7_24),
  ((block0010.get ⟨12, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0128.coefficient8_24),
  ((block0010.get ⟨13, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0144.coefficient9_24),
  ((block0010.get ⟨14, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0160.coefficient10_24),
  ((block0010.get ⟨15, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0176.coefficient11_24),
  ((block0010.get ⟨16, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0192.coefficient12_24),
  ((block0010.get ⟨17, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0207.coefficient13_24),
  ((block0010.get ⟨18, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0222.coefficient14_24),
  ((block0010.get ⟨19, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0237.coefficient15_24),
  ((block0010.get ⟨20, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0252.coefficient16_24),
  ((block0010.get ⟨21, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0267.coefficient17_24),
  ((block0010.get ⟨22, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0282.coefficient18_24),
  ((block0010.get ⟨23, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0297.coefficient19_24),
  ((block0010.get ⟨24, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0312.coefficient20_24),
  ((block0010.get ⟨25, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0327.coefficient21_24),
  ((block0010.get ⟨26, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0342.coefficient22_24),
  ((block0010.get ⟨27, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0357.coefficient23_24),
  ((block0010.get ⟨28, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0372.coefficient24_24),
  ((block0010.get ⟨29, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0387.coefficient25_24),
  ((block0010.get ⟨30, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_25),
  ((block0010.get ⟨31, by rw [block0010_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_25)
]

theorem checks0010_size : checks0010.size = 32 := rfl

theorem checks0010_checked :
    blockCheck (fun p => enclosureCheck p.1 p.2) checks0010 = true := by
  decide +kernel

theorem entry00320_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨0, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0327.coefficient21_23
  · exact OriginalRow227TriangleBindingsRow021.block0327_value ⟨3, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨0, by rw [checks0010_size]; decide⟩

theorem entry00321_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨1, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0342.coefficient22_23
  · exact OriginalRow227TriangleBindingsRow022.block0342_value ⟨2, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨1, by rw [checks0010_size]; decide⟩

theorem entry00322_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨2, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0357.coefficient23_23
  · exact OriginalRow227TriangleBindingsRow023.block0357_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨2, by rw [checks0010_size]; decide⟩

theorem entry00323_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨3, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0372.coefficient24_23
  · exact OriginalRow227TriangleBindingsRow024.block0372_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨3, by rw [checks0010_size]; decide⟩

theorem entry00324_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨4, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_24
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨24, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨4, by rw [checks0010_size]; decide⟩

theorem entry00325_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨5, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_24
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨24, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨5, by rw [checks0010_size]; decide⟩

theorem entry00326_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨6, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_24
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨23, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨6, by rw [checks0010_size]; decide⟩

theorem entry00327_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨7, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0048.coefficient3_24
  · exact OriginalRow227TriangleBindingsRow003.block0048_value ⟨22, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨7, by rw [checks0010_size]; decide⟩

theorem entry00328_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨8, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0064.coefficient4_24
  · exact OriginalRow227TriangleBindingsRow004.block0064_value ⟨21, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨8, by rw [checks0010_size]; decide⟩

theorem entry00329_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨9, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0080.coefficient5_24
  · exact OriginalRow227TriangleBindingsRow005.block0080_value ⟨20, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨9, by rw [checks0010_size]; decide⟩

theorem entry00330_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨10, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0096.coefficient6_24
  · exact OriginalRow227TriangleBindingsRow006.block0096_value ⟨19, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨10, by rw [checks0010_size]; decide⟩

theorem entry00331_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨11, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0112.coefficient7_24
  · exact OriginalRow227TriangleBindingsRow007.block0112_value ⟨18, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨11, by rw [checks0010_size]; decide⟩

theorem entry00332_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨12, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0128.coefficient8_24
  · exact OriginalRow227TriangleBindingsRow008.block0128_value ⟨17, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨12, by rw [checks0010_size]; decide⟩

theorem entry00333_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨13, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0144.coefficient9_24
  · exact OriginalRow227TriangleBindingsRow009.block0144_value ⟨16, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨13, by rw [checks0010_size]; decide⟩

theorem entry00334_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨14, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0160.coefficient10_24
  · exact OriginalRow227TriangleBindingsRow010.block0160_value ⟨15, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨14, by rw [checks0010_size]; decide⟩

theorem entry00335_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨15, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0176.coefficient11_24
  · exact OriginalRow227TriangleBindingsRow011.block0176_value ⟨14, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨15, by rw [checks0010_size]; decide⟩

theorem entry00336_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨16, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0192.coefficient12_24
  · exact OriginalRow227TriangleBindingsRow012.block0192_value ⟨13, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨16, by rw [checks0010_size]; decide⟩

theorem entry00337_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨17, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0207.coefficient13_24
  · exact OriginalRow227TriangleBindingsRow013.block0207_value ⟨12, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨17, by rw [checks0010_size]; decide⟩

theorem entry00338_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨18, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0222.coefficient14_24
  · exact OriginalRow227TriangleBindingsRow014.block0222_value ⟨11, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨18, by rw [checks0010_size]; decide⟩

theorem entry00339_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨19, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0237.coefficient15_24
  · exact OriginalRow227TriangleBindingsRow015.block0237_value ⟨10, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨19, by rw [checks0010_size]; decide⟩

theorem entry00340_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨20, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0252.coefficient16_24
  · exact OriginalRow227TriangleBindingsRow016.block0252_value ⟨9, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨20, by rw [checks0010_size]; decide⟩

theorem entry00341_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨21, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0267.coefficient17_24
  · exact OriginalRow227TriangleBindingsRow017.block0267_value ⟨8, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨21, by rw [checks0010_size]; decide⟩

theorem entry00342_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨22, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0282.coefficient18_24
  · exact OriginalRow227TriangleBindingsRow018.block0282_value ⟨7, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨22, by rw [checks0010_size]; decide⟩

theorem entry00343_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨23, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0297.coefficient19_24
  · exact OriginalRow227TriangleBindingsRow019.block0297_value ⟨6, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨23, by rw [checks0010_size]; decide⟩

theorem entry00344_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨24, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0312.coefficient20_24
  · exact OriginalRow227TriangleBindingsRow020.block0312_value ⟨5, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨24, by rw [checks0010_size]; decide⟩

theorem entry00345_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨25, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0327.coefficient21_24
  · exact OriginalRow227TriangleBindingsRow021.block0327_value ⟨4, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨25, by rw [checks0010_size]; decide⟩

theorem entry00346_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨26, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0342.coefficient22_24
  · exact OriginalRow227TriangleBindingsRow022.block0342_value ⟨3, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨26, by rw [checks0010_size]; decide⟩

theorem entry00347_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨27, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0357.coefficient23_24
  · exact OriginalRow227TriangleBindingsRow023.block0357_value ⟨2, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨27, by rw [checks0010_size]; decide⟩

theorem entry00348_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨28, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0372.coefficient24_24
  · exact OriginalRow227TriangleBindingsRow024.block0372_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨28, by rw [checks0010_size]; decide⟩

theorem entry00349_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨29, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0387.coefficient25_24
  · exact OriginalRow227TriangleBindingsRow025.block0387_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨29, by rw [checks0010_size]; decide⟩

theorem entry00350_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨30, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_25
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨25, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨30, by rw [checks0010_size]; decide⟩

theorem entry00351_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0010.get ⟨31, by rw [block0010_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_25
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨25, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0010 checks0010_checked
      ⟨31, by rw [checks0010_size]; decide⟩

theorem block0010_enclosed : AllEnclosed OriginalRow227TriangleLookup.T block0010 := by
  exact allEnclosed_cons entry00320_enclosed <|
    allEnclosed_cons entry00321_enclosed <|
    allEnclosed_cons entry00322_enclosed <|
    allEnclosed_cons entry00323_enclosed <|
    allEnclosed_cons entry00324_enclosed <|
    allEnclosed_cons entry00325_enclosed <|
    allEnclosed_cons entry00326_enclosed <|
    allEnclosed_cons entry00327_enclosed <|
    allEnclosed_cons entry00328_enclosed <|
    allEnclosed_cons entry00329_enclosed <|
    allEnclosed_cons entry00330_enclosed <|
    allEnclosed_cons entry00331_enclosed <|
    allEnclosed_cons entry00332_enclosed <|
    allEnclosed_cons entry00333_enclosed <|
    allEnclosed_cons entry00334_enclosed <|
    allEnclosed_cons entry00335_enclosed <|
    allEnclosed_cons entry00336_enclosed <|
    allEnclosed_cons entry00337_enclosed <|
    allEnclosed_cons entry00338_enclosed <|
    allEnclosed_cons entry00339_enclosed <|
    allEnclosed_cons entry00340_enclosed <|
    allEnclosed_cons entry00341_enclosed <|
    allEnclosed_cons entry00342_enclosed <|
    allEnclosed_cons entry00343_enclosed <|
    allEnclosed_cons entry00344_enclosed <|
    allEnclosed_cons entry00345_enclosed <|
    allEnclosed_cons entry00346_enclosed <|
    allEnclosed_cons entry00347_enclosed <|
    allEnclosed_cons entry00348_enclosed <|
    allEnclosed_cons entry00349_enclosed <|
    allEnclosed_cons entry00350_enclosed <|
    allEnclosed_cons entry00351_enclosed <|
    allEnclosed_nil OriginalRow227TriangleLookup.T

def checks0011 : Array (ErrorEntry × IntervalDyadic) := #[
  ((block0011.get ⟨0, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_25),
  ((block0011.get ⟨1, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0048.coefficient3_25),
  ((block0011.get ⟨2, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0064.coefficient4_25),
  ((block0011.get ⟨3, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0080.coefficient5_25),
  ((block0011.get ⟨4, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0096.coefficient6_25),
  ((block0011.get ⟨5, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0112.coefficient7_25),
  ((block0011.get ⟨6, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0128.coefficient8_25),
  ((block0011.get ⟨7, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0144.coefficient9_25),
  ((block0011.get ⟨8, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0160.coefficient10_25),
  ((block0011.get ⟨9, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0176.coefficient11_25),
  ((block0011.get ⟨10, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0192.coefficient12_25),
  ((block0011.get ⟨11, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0207.coefficient13_25),
  ((block0011.get ⟨12, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0222.coefficient14_25),
  ((block0011.get ⟨13, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0237.coefficient15_25),
  ((block0011.get ⟨14, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0252.coefficient16_25),
  ((block0011.get ⟨15, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0267.coefficient17_25),
  ((block0011.get ⟨16, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0282.coefficient18_25),
  ((block0011.get ⟨17, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0297.coefficient19_25),
  ((block0011.get ⟨18, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0312.coefficient20_25),
  ((block0011.get ⟨19, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0327.coefficient21_25),
  ((block0011.get ⟨20, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0342.coefficient22_25),
  ((block0011.get ⟨21, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0357.coefficient23_25),
  ((block0011.get ⟨22, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0372.coefficient24_25),
  ((block0011.get ⟨23, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0387.coefficient25_25),
  ((block0011.get ⟨24, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0402.coefficient26_25),
  ((block0011.get ⟨25, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_26),
  ((block0011.get ⟨26, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_26),
  ((block0011.get ⟨27, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_26),
  ((block0011.get ⟨28, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0048.coefficient3_26),
  ((block0011.get ⟨29, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0064.coefficient4_26),
  ((block0011.get ⟨30, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0080.coefficient5_26),
  ((block0011.get ⟨31, by rw [block0011_length]; decide⟩), OriginalRow227TriangleData0096.coefficient6_26)
]

theorem checks0011_size : checks0011.size = 32 := rfl

theorem checks0011_checked :
    blockCheck (fun p => enclosureCheck p.1 p.2) checks0011 = true := by
  decide +kernel

theorem entry00352_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨0, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_25
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨24, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨0, by rw [checks0011_size]; decide⟩

theorem entry00353_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨1, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0048.coefficient3_25
  · exact OriginalRow227TriangleBindingsRow003.block0048_value ⟨23, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨1, by rw [checks0011_size]; decide⟩

theorem entry00354_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨2, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0064.coefficient4_25
  · exact OriginalRow227TriangleBindingsRow004.block0064_value ⟨22, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨2, by rw [checks0011_size]; decide⟩

theorem entry00355_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨3, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0080.coefficient5_25
  · exact OriginalRow227TriangleBindingsRow005.block0080_value ⟨21, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨3, by rw [checks0011_size]; decide⟩

theorem entry00356_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨4, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0096.coefficient6_25
  · exact OriginalRow227TriangleBindingsRow006.block0096_value ⟨20, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨4, by rw [checks0011_size]; decide⟩

theorem entry00357_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨5, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0112.coefficient7_25
  · exact OriginalRow227TriangleBindingsRow007.block0112_value ⟨19, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨5, by rw [checks0011_size]; decide⟩

theorem entry00358_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨6, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0128.coefficient8_25
  · exact OriginalRow227TriangleBindingsRow008.block0128_value ⟨18, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨6, by rw [checks0011_size]; decide⟩

theorem entry00359_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨7, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0144.coefficient9_25
  · exact OriginalRow227TriangleBindingsRow009.block0144_value ⟨17, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨7, by rw [checks0011_size]; decide⟩

theorem entry00360_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨8, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0160.coefficient10_25
  · exact OriginalRow227TriangleBindingsRow010.block0160_value ⟨16, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨8, by rw [checks0011_size]; decide⟩

theorem entry00361_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨9, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0176.coefficient11_25
  · exact OriginalRow227TriangleBindingsRow011.block0176_value ⟨15, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨9, by rw [checks0011_size]; decide⟩

theorem entry00362_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨10, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0192.coefficient12_25
  · exact OriginalRow227TriangleBindingsRow012.block0192_value ⟨14, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨10, by rw [checks0011_size]; decide⟩

theorem entry00363_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨11, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0207.coefficient13_25
  · exact OriginalRow227TriangleBindingsRow013.block0207_value ⟨13, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨11, by rw [checks0011_size]; decide⟩

theorem entry00364_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨12, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0222.coefficient14_25
  · exact OriginalRow227TriangleBindingsRow014.block0222_value ⟨12, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨12, by rw [checks0011_size]; decide⟩

theorem entry00365_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨13, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0237.coefficient15_25
  · exact OriginalRow227TriangleBindingsRow015.block0237_value ⟨11, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨13, by rw [checks0011_size]; decide⟩

theorem entry00366_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨14, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0252.coefficient16_25
  · exact OriginalRow227TriangleBindingsRow016.block0252_value ⟨10, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨14, by rw [checks0011_size]; decide⟩

theorem entry00367_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨15, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0267.coefficient17_25
  · exact OriginalRow227TriangleBindingsRow017.block0267_value ⟨9, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨15, by rw [checks0011_size]; decide⟩

theorem entry00368_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨16, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0282.coefficient18_25
  · exact OriginalRow227TriangleBindingsRow018.block0282_value ⟨8, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨16, by rw [checks0011_size]; decide⟩

theorem entry00369_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨17, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0297.coefficient19_25
  · exact OriginalRow227TriangleBindingsRow019.block0297_value ⟨7, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨17, by rw [checks0011_size]; decide⟩

theorem entry00370_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨18, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0312.coefficient20_25
  · exact OriginalRow227TriangleBindingsRow020.block0312_value ⟨6, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨18, by rw [checks0011_size]; decide⟩

theorem entry00371_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨19, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0327.coefficient21_25
  · exact OriginalRow227TriangleBindingsRow021.block0327_value ⟨5, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨19, by rw [checks0011_size]; decide⟩

theorem entry00372_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨20, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0342.coefficient22_25
  · exact OriginalRow227TriangleBindingsRow022.block0342_value ⟨4, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨20, by rw [checks0011_size]; decide⟩

theorem entry00373_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨21, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0357.coefficient23_25
  · exact OriginalRow227TriangleBindingsRow023.block0357_value ⟨3, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨21, by rw [checks0011_size]; decide⟩

theorem entry00374_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨22, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0372.coefficient24_25
  · exact OriginalRow227TriangleBindingsRow024.block0372_value ⟨2, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨22, by rw [checks0011_size]; decide⟩

theorem entry00375_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨23, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0387.coefficient25_25
  · exact OriginalRow227TriangleBindingsRow025.block0387_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨23, by rw [checks0011_size]; decide⟩

theorem entry00376_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨24, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0402.coefficient26_25
  · exact OriginalRow227TriangleBindingsRow026.block0402_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨24, by rw [checks0011_size]; decide⟩

theorem entry00377_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨25, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_26
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨26, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨25, by rw [checks0011_size]; decide⟩

theorem entry00378_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨26, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_26
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨26, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨26, by rw [checks0011_size]; decide⟩

theorem entry00379_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨27, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_26
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨25, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨27, by rw [checks0011_size]; decide⟩

theorem entry00380_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨28, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0048.coefficient3_26
  · exact OriginalRow227TriangleBindingsRow003.block0048_value ⟨24, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨28, by rw [checks0011_size]; decide⟩

theorem entry00381_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨29, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0064.coefficient4_26
  · exact OriginalRow227TriangleBindingsRow004.block0064_value ⟨23, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨29, by rw [checks0011_size]; decide⟩

theorem entry00382_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨30, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0080.coefficient5_26
  · exact OriginalRow227TriangleBindingsRow005.block0080_value ⟨22, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨30, by rw [checks0011_size]; decide⟩

theorem entry00383_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0011.get ⟨31, by rw [block0011_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0096.coefficient6_26
  · exact OriginalRow227TriangleBindingsRow006.block0096_value ⟨21, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0011 checks0011_checked
      ⟨31, by rw [checks0011_size]; decide⟩

theorem block0011_enclosed : AllEnclosed OriginalRow227TriangleLookup.T block0011 := by
  exact allEnclosed_cons entry00352_enclosed <|
    allEnclosed_cons entry00353_enclosed <|
    allEnclosed_cons entry00354_enclosed <|
    allEnclosed_cons entry00355_enclosed <|
    allEnclosed_cons entry00356_enclosed <|
    allEnclosed_cons entry00357_enclosed <|
    allEnclosed_cons entry00358_enclosed <|
    allEnclosed_cons entry00359_enclosed <|
    allEnclosed_cons entry00360_enclosed <|
    allEnclosed_cons entry00361_enclosed <|
    allEnclosed_cons entry00362_enclosed <|
    allEnclosed_cons entry00363_enclosed <|
    allEnclosed_cons entry00364_enclosed <|
    allEnclosed_cons entry00365_enclosed <|
    allEnclosed_cons entry00366_enclosed <|
    allEnclosed_cons entry00367_enclosed <|
    allEnclosed_cons entry00368_enclosed <|
    allEnclosed_cons entry00369_enclosed <|
    allEnclosed_cons entry00370_enclosed <|
    allEnclosed_cons entry00371_enclosed <|
    allEnclosed_cons entry00372_enclosed <|
    allEnclosed_cons entry00373_enclosed <|
    allEnclosed_cons entry00374_enclosed <|
    allEnclosed_cons entry00375_enclosed <|
    allEnclosed_cons entry00376_enclosed <|
    allEnclosed_cons entry00377_enclosed <|
    allEnclosed_cons entry00378_enclosed <|
    allEnclosed_cons entry00379_enclosed <|
    allEnclosed_cons entry00380_enclosed <|
    allEnclosed_cons entry00381_enclosed <|
    allEnclosed_cons entry00382_enclosed <|
    allEnclosed_cons entry00383_enclosed <|
    allEnclosed_nil OriginalRow227TriangleLookup.T

def checks0012 : Array (ErrorEntry × IntervalDyadic) := #[
  ((block0012.get ⟨0, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0112.coefficient7_26),
  ((block0012.get ⟨1, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0128.coefficient8_26),
  ((block0012.get ⟨2, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0144.coefficient9_26),
  ((block0012.get ⟨3, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0160.coefficient10_26),
  ((block0012.get ⟨4, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0176.coefficient11_26),
  ((block0012.get ⟨5, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0192.coefficient12_26),
  ((block0012.get ⟨6, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0207.coefficient13_26),
  ((block0012.get ⟨7, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0222.coefficient14_26),
  ((block0012.get ⟨8, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0237.coefficient15_26),
  ((block0012.get ⟨9, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0252.coefficient16_26),
  ((block0012.get ⟨10, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0267.coefficient17_26),
  ((block0012.get ⟨11, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0282.coefficient18_26),
  ((block0012.get ⟨12, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0297.coefficient19_26),
  ((block0012.get ⟨13, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0312.coefficient20_26),
  ((block0012.get ⟨14, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0327.coefficient21_26),
  ((block0012.get ⟨15, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0342.coefficient22_26),
  ((block0012.get ⟨16, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0357.coefficient23_26),
  ((block0012.get ⟨17, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0372.coefficient24_26),
  ((block0012.get ⟨18, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0387.coefficient25_26),
  ((block0012.get ⟨19, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0402.coefficient26_26),
  ((block0012.get ⟨20, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0417.coefficient27_26),
  ((block0012.get ⟨21, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_27),
  ((block0012.get ⟨22, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_27),
  ((block0012.get ⟨23, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_27),
  ((block0012.get ⟨24, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0048.coefficient3_27),
  ((block0012.get ⟨25, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0064.coefficient4_27),
  ((block0012.get ⟨26, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0080.coefficient5_27),
  ((block0012.get ⟨27, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0096.coefficient6_27),
  ((block0012.get ⟨28, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0112.coefficient7_27),
  ((block0012.get ⟨29, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0128.coefficient8_27),
  ((block0012.get ⟨30, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0144.coefficient9_27),
  ((block0012.get ⟨31, by rw [block0012_length]; decide⟩), OriginalRow227TriangleData0160.coefficient10_27)
]

theorem checks0012_size : checks0012.size = 32 := rfl

theorem checks0012_checked :
    blockCheck (fun p => enclosureCheck p.1 p.2) checks0012 = true := by
  decide +kernel

theorem entry00384_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨0, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0112.coefficient7_26
  · exact OriginalRow227TriangleBindingsRow007.block0112_value ⟨20, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨0, by rw [checks0012_size]; decide⟩

theorem entry00385_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨1, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0128.coefficient8_26
  · exact OriginalRow227TriangleBindingsRow008.block0128_value ⟨19, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨1, by rw [checks0012_size]; decide⟩

theorem entry00386_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨2, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0144.coefficient9_26
  · exact OriginalRow227TriangleBindingsRow009.block0144_value ⟨18, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨2, by rw [checks0012_size]; decide⟩

theorem entry00387_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨3, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0160.coefficient10_26
  · exact OriginalRow227TriangleBindingsRow010.block0160_value ⟨17, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨3, by rw [checks0012_size]; decide⟩

theorem entry00388_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨4, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0176.coefficient11_26
  · exact OriginalRow227TriangleBindingsRow011.block0176_value ⟨16, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨4, by rw [checks0012_size]; decide⟩

theorem entry00389_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨5, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0192.coefficient12_26
  · exact OriginalRow227TriangleBindingsRow012.block0192_value ⟨15, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨5, by rw [checks0012_size]; decide⟩

theorem entry00390_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨6, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0207.coefficient13_26
  · exact OriginalRow227TriangleBindingsRow013.block0207_value ⟨14, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨6, by rw [checks0012_size]; decide⟩

theorem entry00391_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨7, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0222.coefficient14_26
  · exact OriginalRow227TriangleBindingsRow014.block0222_value ⟨13, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨7, by rw [checks0012_size]; decide⟩

theorem entry00392_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨8, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0237.coefficient15_26
  · exact OriginalRow227TriangleBindingsRow015.block0237_value ⟨12, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨8, by rw [checks0012_size]; decide⟩

theorem entry00393_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨9, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0252.coefficient16_26
  · exact OriginalRow227TriangleBindingsRow016.block0252_value ⟨11, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨9, by rw [checks0012_size]; decide⟩

theorem entry00394_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨10, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0267.coefficient17_26
  · exact OriginalRow227TriangleBindingsRow017.block0267_value ⟨10, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨10, by rw [checks0012_size]; decide⟩

theorem entry00395_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨11, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0282.coefficient18_26
  · exact OriginalRow227TriangleBindingsRow018.block0282_value ⟨9, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨11, by rw [checks0012_size]; decide⟩

theorem entry00396_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨12, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0297.coefficient19_26
  · exact OriginalRow227TriangleBindingsRow019.block0297_value ⟨8, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨12, by rw [checks0012_size]; decide⟩

theorem entry00397_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨13, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0312.coefficient20_26
  · exact OriginalRow227TriangleBindingsRow020.block0312_value ⟨7, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨13, by rw [checks0012_size]; decide⟩

theorem entry00398_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨14, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0327.coefficient21_26
  · exact OriginalRow227TriangleBindingsRow021.block0327_value ⟨6, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨14, by rw [checks0012_size]; decide⟩

theorem entry00399_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨15, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0342.coefficient22_26
  · exact OriginalRow227TriangleBindingsRow022.block0342_value ⟨5, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨15, by rw [checks0012_size]; decide⟩

theorem entry00400_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨16, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0357.coefficient23_26
  · exact OriginalRow227TriangleBindingsRow023.block0357_value ⟨4, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨16, by rw [checks0012_size]; decide⟩

theorem entry00401_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨17, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0372.coefficient24_26
  · exact OriginalRow227TriangleBindingsRow024.block0372_value ⟨3, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨17, by rw [checks0012_size]; decide⟩

theorem entry00402_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨18, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0387.coefficient25_26
  · exact OriginalRow227TriangleBindingsRow025.block0387_value ⟨2, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨18, by rw [checks0012_size]; decide⟩

theorem entry00403_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨19, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0402.coefficient26_26
  · exact OriginalRow227TriangleBindingsRow026.block0402_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨19, by rw [checks0012_size]; decide⟩

theorem entry00404_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨20, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0417.coefficient27_26
  · exact OriginalRow227TriangleBindingsRow027.block0417_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨20, by rw [checks0012_size]; decide⟩

theorem entry00405_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨21, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_27
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨27, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨21, by rw [checks0012_size]; decide⟩

theorem entry00406_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨22, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_27
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨27, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨22, by rw [checks0012_size]; decide⟩

theorem entry00407_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨23, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_27
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨26, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨23, by rw [checks0012_size]; decide⟩

theorem entry00408_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨24, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0048.coefficient3_27
  · exact OriginalRow227TriangleBindingsRow003.block0048_value ⟨25, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨24, by rw [checks0012_size]; decide⟩

theorem entry00409_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨25, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0064.coefficient4_27
  · exact OriginalRow227TriangleBindingsRow004.block0064_value ⟨24, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨25, by rw [checks0012_size]; decide⟩

theorem entry00410_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨26, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0080.coefficient5_27
  · exact OriginalRow227TriangleBindingsRow005.block0080_value ⟨23, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨26, by rw [checks0012_size]; decide⟩

theorem entry00411_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨27, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0096.coefficient6_27
  · exact OriginalRow227TriangleBindingsRow006.block0096_value ⟨22, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨27, by rw [checks0012_size]; decide⟩

theorem entry00412_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨28, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0112.coefficient7_27
  · exact OriginalRow227TriangleBindingsRow007.block0112_value ⟨21, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨28, by rw [checks0012_size]; decide⟩

theorem entry00413_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨29, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0128.coefficient8_27
  · exact OriginalRow227TriangleBindingsRow008.block0128_value ⟨20, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨29, by rw [checks0012_size]; decide⟩

theorem entry00414_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨30, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0144.coefficient9_27
  · exact OriginalRow227TriangleBindingsRow009.block0144_value ⟨19, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨30, by rw [checks0012_size]; decide⟩

theorem entry00415_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0012.get ⟨31, by rw [block0012_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0160.coefficient10_27
  · exact OriginalRow227TriangleBindingsRow010.block0160_value ⟨18, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0012 checks0012_checked
      ⟨31, by rw [checks0012_size]; decide⟩

theorem block0012_enclosed : AllEnclosed OriginalRow227TriangleLookup.T block0012 := by
  exact allEnclosed_cons entry00384_enclosed <|
    allEnclosed_cons entry00385_enclosed <|
    allEnclosed_cons entry00386_enclosed <|
    allEnclosed_cons entry00387_enclosed <|
    allEnclosed_cons entry00388_enclosed <|
    allEnclosed_cons entry00389_enclosed <|
    allEnclosed_cons entry00390_enclosed <|
    allEnclosed_cons entry00391_enclosed <|
    allEnclosed_cons entry00392_enclosed <|
    allEnclosed_cons entry00393_enclosed <|
    allEnclosed_cons entry00394_enclosed <|
    allEnclosed_cons entry00395_enclosed <|
    allEnclosed_cons entry00396_enclosed <|
    allEnclosed_cons entry00397_enclosed <|
    allEnclosed_cons entry00398_enclosed <|
    allEnclosed_cons entry00399_enclosed <|
    allEnclosed_cons entry00400_enclosed <|
    allEnclosed_cons entry00401_enclosed <|
    allEnclosed_cons entry00402_enclosed <|
    allEnclosed_cons entry00403_enclosed <|
    allEnclosed_cons entry00404_enclosed <|
    allEnclosed_cons entry00405_enclosed <|
    allEnclosed_cons entry00406_enclosed <|
    allEnclosed_cons entry00407_enclosed <|
    allEnclosed_cons entry00408_enclosed <|
    allEnclosed_cons entry00409_enclosed <|
    allEnclosed_cons entry00410_enclosed <|
    allEnclosed_cons entry00411_enclosed <|
    allEnclosed_cons entry00412_enclosed <|
    allEnclosed_cons entry00413_enclosed <|
    allEnclosed_cons entry00414_enclosed <|
    allEnclosed_cons entry00415_enclosed <|
    allEnclosed_nil OriginalRow227TriangleLookup.T

def checks0013 : Array (ErrorEntry × IntervalDyadic) := #[
  ((block0013.get ⟨0, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0176.coefficient11_27),
  ((block0013.get ⟨1, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0192.coefficient12_27),
  ((block0013.get ⟨2, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0207.coefficient13_27),
  ((block0013.get ⟨3, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0222.coefficient14_27),
  ((block0013.get ⟨4, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0237.coefficient15_27),
  ((block0013.get ⟨5, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0252.coefficient16_27),
  ((block0013.get ⟨6, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0267.coefficient17_27),
  ((block0013.get ⟨7, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0282.coefficient18_27),
  ((block0013.get ⟨8, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0297.coefficient19_27),
  ((block0013.get ⟨9, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0312.coefficient20_27),
  ((block0013.get ⟨10, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0327.coefficient21_27),
  ((block0013.get ⟨11, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0342.coefficient22_27),
  ((block0013.get ⟨12, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0357.coefficient23_27),
  ((block0013.get ⟨13, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0372.coefficient24_27),
  ((block0013.get ⟨14, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0387.coefficient25_27),
  ((block0013.get ⟨15, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0402.coefficient26_27),
  ((block0013.get ⟨16, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0417.coefficient27_27),
  ((block0013.get ⟨17, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0432.coefficient28_27),
  ((block0013.get ⟨18, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_28),
  ((block0013.get ⟨19, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_28),
  ((block0013.get ⟨20, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_28),
  ((block0013.get ⟨21, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0048.coefficient3_28),
  ((block0013.get ⟨22, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0064.coefficient4_28),
  ((block0013.get ⟨23, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0080.coefficient5_28),
  ((block0013.get ⟨24, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0096.coefficient6_28),
  ((block0013.get ⟨25, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0112.coefficient7_28),
  ((block0013.get ⟨26, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0128.coefficient8_28),
  ((block0013.get ⟨27, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0144.coefficient9_28),
  ((block0013.get ⟨28, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0160.coefficient10_28),
  ((block0013.get ⟨29, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0176.coefficient11_28),
  ((block0013.get ⟨30, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0192.coefficient12_28),
  ((block0013.get ⟨31, by rw [block0013_length]; decide⟩), OriginalRow227TriangleData0207.coefficient13_28)
]

theorem checks0013_size : checks0013.size = 32 := rfl

theorem checks0013_checked :
    blockCheck (fun p => enclosureCheck p.1 p.2) checks0013 = true := by
  decide +kernel

theorem entry00416_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨0, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0176.coefficient11_27
  · exact OriginalRow227TriangleBindingsRow011.block0176_value ⟨17, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨0, by rw [checks0013_size]; decide⟩

theorem entry00417_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨1, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0192.coefficient12_27
  · exact OriginalRow227TriangleBindingsRow012.block0192_value ⟨16, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨1, by rw [checks0013_size]; decide⟩

theorem entry00418_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨2, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0207.coefficient13_27
  · exact OriginalRow227TriangleBindingsRow013.block0207_value ⟨15, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨2, by rw [checks0013_size]; decide⟩

theorem entry00419_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨3, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0222.coefficient14_27
  · exact OriginalRow227TriangleBindingsRow014.block0222_value ⟨14, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨3, by rw [checks0013_size]; decide⟩

theorem entry00420_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨4, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0237.coefficient15_27
  · exact OriginalRow227TriangleBindingsRow015.block0237_value ⟨13, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨4, by rw [checks0013_size]; decide⟩

theorem entry00421_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨5, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0252.coefficient16_27
  · exact OriginalRow227TriangleBindingsRow016.block0252_value ⟨12, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨5, by rw [checks0013_size]; decide⟩

theorem entry00422_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨6, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0267.coefficient17_27
  · exact OriginalRow227TriangleBindingsRow017.block0267_value ⟨11, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨6, by rw [checks0013_size]; decide⟩

theorem entry00423_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨7, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0282.coefficient18_27
  · exact OriginalRow227TriangleBindingsRow018.block0282_value ⟨10, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨7, by rw [checks0013_size]; decide⟩

theorem entry00424_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨8, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0297.coefficient19_27
  · exact OriginalRow227TriangleBindingsRow019.block0297_value ⟨9, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨8, by rw [checks0013_size]; decide⟩

theorem entry00425_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨9, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0312.coefficient20_27
  · exact OriginalRow227TriangleBindingsRow020.block0312_value ⟨8, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨9, by rw [checks0013_size]; decide⟩

theorem entry00426_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨10, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0327.coefficient21_27
  · exact OriginalRow227TriangleBindingsRow021.block0327_value ⟨7, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨10, by rw [checks0013_size]; decide⟩

theorem entry00427_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨11, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0342.coefficient22_27
  · exact OriginalRow227TriangleBindingsRow022.block0342_value ⟨6, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨11, by rw [checks0013_size]; decide⟩

theorem entry00428_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨12, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0357.coefficient23_27
  · exact OriginalRow227TriangleBindingsRow023.block0357_value ⟨5, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨12, by rw [checks0013_size]; decide⟩

theorem entry00429_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨13, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0372.coefficient24_27
  · exact OriginalRow227TriangleBindingsRow024.block0372_value ⟨4, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨13, by rw [checks0013_size]; decide⟩

theorem entry00430_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨14, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0387.coefficient25_27
  · exact OriginalRow227TriangleBindingsRow025.block0387_value ⟨3, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨14, by rw [checks0013_size]; decide⟩

theorem entry00431_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨15, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0402.coefficient26_27
  · exact OriginalRow227TriangleBindingsRow026.block0402_value ⟨2, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨15, by rw [checks0013_size]; decide⟩

theorem entry00432_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨16, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0417.coefficient27_27
  · exact OriginalRow227TriangleBindingsRow027.block0417_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨16, by rw [checks0013_size]; decide⟩

theorem entry00433_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨17, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0432.coefficient28_27
  · exact OriginalRow227TriangleBindingsRow028.block0432_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨17, by rw [checks0013_size]; decide⟩

theorem entry00434_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨18, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_28
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨28, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨18, by rw [checks0013_size]; decide⟩

theorem entry00435_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨19, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_28
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨28, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨19, by rw [checks0013_size]; decide⟩

theorem entry00436_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨20, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_28
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨27, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨20, by rw [checks0013_size]; decide⟩

theorem entry00437_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨21, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0048.coefficient3_28
  · exact OriginalRow227TriangleBindingsRow003.block0048_value ⟨26, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨21, by rw [checks0013_size]; decide⟩

theorem entry00438_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨22, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0064.coefficient4_28
  · exact OriginalRow227TriangleBindingsRow004.block0064_value ⟨25, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨22, by rw [checks0013_size]; decide⟩

theorem entry00439_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨23, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0080.coefficient5_28
  · exact OriginalRow227TriangleBindingsRow005.block0080_value ⟨24, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨23, by rw [checks0013_size]; decide⟩

theorem entry00440_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨24, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0096.coefficient6_28
  · exact OriginalRow227TriangleBindingsRow006.block0096_value ⟨23, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨24, by rw [checks0013_size]; decide⟩

theorem entry00441_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨25, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0112.coefficient7_28
  · exact OriginalRow227TriangleBindingsRow007.block0112_value ⟨22, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨25, by rw [checks0013_size]; decide⟩

theorem entry00442_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨26, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0128.coefficient8_28
  · exact OriginalRow227TriangleBindingsRow008.block0128_value ⟨21, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨26, by rw [checks0013_size]; decide⟩

theorem entry00443_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨27, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0144.coefficient9_28
  · exact OriginalRow227TriangleBindingsRow009.block0144_value ⟨20, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨27, by rw [checks0013_size]; decide⟩

theorem entry00444_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨28, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0160.coefficient10_28
  · exact OriginalRow227TriangleBindingsRow010.block0160_value ⟨19, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨28, by rw [checks0013_size]; decide⟩

theorem entry00445_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨29, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0176.coefficient11_28
  · exact OriginalRow227TriangleBindingsRow011.block0176_value ⟨18, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨29, by rw [checks0013_size]; decide⟩

theorem entry00446_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨30, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0192.coefficient12_28
  · exact OriginalRow227TriangleBindingsRow012.block0192_value ⟨17, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨30, by rw [checks0013_size]; decide⟩

theorem entry00447_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0013.get ⟨31, by rw [block0013_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0207.coefficient13_28
  · exact OriginalRow227TriangleBindingsRow013.block0207_value ⟨16, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0013 checks0013_checked
      ⟨31, by rw [checks0013_size]; decide⟩

theorem block0013_enclosed : AllEnclosed OriginalRow227TriangleLookup.T block0013 := by
  exact allEnclosed_cons entry00416_enclosed <|
    allEnclosed_cons entry00417_enclosed <|
    allEnclosed_cons entry00418_enclosed <|
    allEnclosed_cons entry00419_enclosed <|
    allEnclosed_cons entry00420_enclosed <|
    allEnclosed_cons entry00421_enclosed <|
    allEnclosed_cons entry00422_enclosed <|
    allEnclosed_cons entry00423_enclosed <|
    allEnclosed_cons entry00424_enclosed <|
    allEnclosed_cons entry00425_enclosed <|
    allEnclosed_cons entry00426_enclosed <|
    allEnclosed_cons entry00427_enclosed <|
    allEnclosed_cons entry00428_enclosed <|
    allEnclosed_cons entry00429_enclosed <|
    allEnclosed_cons entry00430_enclosed <|
    allEnclosed_cons entry00431_enclosed <|
    allEnclosed_cons entry00432_enclosed <|
    allEnclosed_cons entry00433_enclosed <|
    allEnclosed_cons entry00434_enclosed <|
    allEnclosed_cons entry00435_enclosed <|
    allEnclosed_cons entry00436_enclosed <|
    allEnclosed_cons entry00437_enclosed <|
    allEnclosed_cons entry00438_enclosed <|
    allEnclosed_cons entry00439_enclosed <|
    allEnclosed_cons entry00440_enclosed <|
    allEnclosed_cons entry00441_enclosed <|
    allEnclosed_cons entry00442_enclosed <|
    allEnclosed_cons entry00443_enclosed <|
    allEnclosed_cons entry00444_enclosed <|
    allEnclosed_cons entry00445_enclosed <|
    allEnclosed_cons entry00446_enclosed <|
    allEnclosed_cons entry00447_enclosed <|
    allEnclosed_nil OriginalRow227TriangleLookup.T

def checks0014 : Array (ErrorEntry × IntervalDyadic) := #[
  ((block0014.get ⟨0, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0222.coefficient14_28),
  ((block0014.get ⟨1, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0237.coefficient15_28),
  ((block0014.get ⟨2, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0252.coefficient16_28),
  ((block0014.get ⟨3, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0267.coefficient17_28),
  ((block0014.get ⟨4, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0282.coefficient18_28),
  ((block0014.get ⟨5, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0297.coefficient19_28),
  ((block0014.get ⟨6, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0312.coefficient20_28),
  ((block0014.get ⟨7, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0327.coefficient21_28),
  ((block0014.get ⟨8, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0342.coefficient22_28),
  ((block0014.get ⟨9, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0357.coefficient23_28),
  ((block0014.get ⟨10, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0372.coefficient24_28),
  ((block0014.get ⟨11, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0387.coefficient25_28),
  ((block0014.get ⟨12, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0402.coefficient26_28),
  ((block0014.get ⟨13, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0417.coefficient27_28),
  ((block0014.get ⟨14, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0432.coefficient28_28),
  ((block0014.get ⟨15, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0446.coefficient29_28),
  ((block0014.get ⟨16, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_29),
  ((block0014.get ⟨17, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_29),
  ((block0014.get ⟨18, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_29),
  ((block0014.get ⟨19, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0048.coefficient3_29),
  ((block0014.get ⟨20, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0064.coefficient4_29),
  ((block0014.get ⟨21, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0080.coefficient5_29),
  ((block0014.get ⟨22, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0096.coefficient6_29),
  ((block0014.get ⟨23, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0112.coefficient7_29),
  ((block0014.get ⟨24, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0128.coefficient8_29),
  ((block0014.get ⟨25, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0144.coefficient9_29),
  ((block0014.get ⟨26, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0160.coefficient10_29),
  ((block0014.get ⟨27, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0176.coefficient11_29),
  ((block0014.get ⟨28, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0192.coefficient12_29),
  ((block0014.get ⟨29, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0207.coefficient13_29),
  ((block0014.get ⟨30, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0222.coefficient14_29),
  ((block0014.get ⟨31, by rw [block0014_length]; decide⟩), OriginalRow227TriangleData0237.coefficient15_29)
]

theorem checks0014_size : checks0014.size = 32 := rfl

theorem checks0014_checked :
    blockCheck (fun p => enclosureCheck p.1 p.2) checks0014 = true := by
  decide +kernel

theorem entry00448_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨0, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0222.coefficient14_28
  · exact OriginalRow227TriangleBindingsRow014.block0222_value ⟨15, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨0, by rw [checks0014_size]; decide⟩

theorem entry00449_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨1, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0237.coefficient15_28
  · exact OriginalRow227TriangleBindingsRow015.block0237_value ⟨14, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨1, by rw [checks0014_size]; decide⟩

theorem entry00450_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨2, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0252.coefficient16_28
  · exact OriginalRow227TriangleBindingsRow016.block0252_value ⟨13, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨2, by rw [checks0014_size]; decide⟩

theorem entry00451_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨3, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0267.coefficient17_28
  · exact OriginalRow227TriangleBindingsRow017.block0267_value ⟨12, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨3, by rw [checks0014_size]; decide⟩

theorem entry00452_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨4, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0282.coefficient18_28
  · exact OriginalRow227TriangleBindingsRow018.block0282_value ⟨11, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨4, by rw [checks0014_size]; decide⟩

theorem entry00453_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨5, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0297.coefficient19_28
  · exact OriginalRow227TriangleBindingsRow019.block0297_value ⟨10, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨5, by rw [checks0014_size]; decide⟩

theorem entry00454_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨6, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0312.coefficient20_28
  · exact OriginalRow227TriangleBindingsRow020.block0312_value ⟨9, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨6, by rw [checks0014_size]; decide⟩

theorem entry00455_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨7, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0327.coefficient21_28
  · exact OriginalRow227TriangleBindingsRow021.block0327_value ⟨8, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨7, by rw [checks0014_size]; decide⟩

theorem entry00456_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨8, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0342.coefficient22_28
  · exact OriginalRow227TriangleBindingsRow022.block0342_value ⟨7, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨8, by rw [checks0014_size]; decide⟩

theorem entry00457_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨9, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0357.coefficient23_28
  · exact OriginalRow227TriangleBindingsRow023.block0357_value ⟨6, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨9, by rw [checks0014_size]; decide⟩

theorem entry00458_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨10, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0372.coefficient24_28
  · exact OriginalRow227TriangleBindingsRow024.block0372_value ⟨5, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨10, by rw [checks0014_size]; decide⟩

theorem entry00459_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨11, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0387.coefficient25_28
  · exact OriginalRow227TriangleBindingsRow025.block0387_value ⟨4, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨11, by rw [checks0014_size]; decide⟩

theorem entry00460_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨12, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0402.coefficient26_28
  · exact OriginalRow227TriangleBindingsRow026.block0402_value ⟨3, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨12, by rw [checks0014_size]; decide⟩

theorem entry00461_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨13, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0417.coefficient27_28
  · exact OriginalRow227TriangleBindingsRow027.block0417_value ⟨2, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨13, by rw [checks0014_size]; decide⟩

theorem entry00462_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨14, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0432.coefficient28_28
  · exact OriginalRow227TriangleBindingsRow028.block0432_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨14, by rw [checks0014_size]; decide⟩

theorem entry00463_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨15, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0446.coefficient29_28
  · exact OriginalRow227TriangleBindingsRow029.block0446_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨15, by rw [checks0014_size]; decide⟩

theorem entry00464_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨16, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_29
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨29, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨16, by rw [checks0014_size]; decide⟩

theorem entry00465_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨17, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_29
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨29, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨17, by rw [checks0014_size]; decide⟩

theorem entry00466_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨18, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_29
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨28, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨18, by rw [checks0014_size]; decide⟩

theorem entry00467_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨19, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0048.coefficient3_29
  · exact OriginalRow227TriangleBindingsRow003.block0048_value ⟨27, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨19, by rw [checks0014_size]; decide⟩

theorem entry00468_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨20, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0064.coefficient4_29
  · exact OriginalRow227TriangleBindingsRow004.block0064_value ⟨26, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨20, by rw [checks0014_size]; decide⟩

theorem entry00469_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨21, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0080.coefficient5_29
  · exact OriginalRow227TriangleBindingsRow005.block0080_value ⟨25, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨21, by rw [checks0014_size]; decide⟩

theorem entry00470_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨22, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0096.coefficient6_29
  · exact OriginalRow227TriangleBindingsRow006.block0096_value ⟨24, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨22, by rw [checks0014_size]; decide⟩

theorem entry00471_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨23, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0112.coefficient7_29
  · exact OriginalRow227TriangleBindingsRow007.block0112_value ⟨23, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨23, by rw [checks0014_size]; decide⟩

theorem entry00472_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨24, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0128.coefficient8_29
  · exact OriginalRow227TriangleBindingsRow008.block0128_value ⟨22, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨24, by rw [checks0014_size]; decide⟩

theorem entry00473_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨25, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0144.coefficient9_29
  · exact OriginalRow227TriangleBindingsRow009.block0144_value ⟨21, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨25, by rw [checks0014_size]; decide⟩

theorem entry00474_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨26, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0160.coefficient10_29
  · exact OriginalRow227TriangleBindingsRow010.block0160_value ⟨20, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨26, by rw [checks0014_size]; decide⟩

theorem entry00475_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨27, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0176.coefficient11_29
  · exact OriginalRow227TriangleBindingsRow011.block0176_value ⟨19, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨27, by rw [checks0014_size]; decide⟩

theorem entry00476_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨28, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0192.coefficient12_29
  · exact OriginalRow227TriangleBindingsRow012.block0192_value ⟨18, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨28, by rw [checks0014_size]; decide⟩

theorem entry00477_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨29, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0207.coefficient13_29
  · exact OriginalRow227TriangleBindingsRow013.block0207_value ⟨17, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨29, by rw [checks0014_size]; decide⟩

theorem entry00478_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨30, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0222.coefficient14_29
  · exact OriginalRow227TriangleBindingsRow014.block0222_value ⟨16, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨30, by rw [checks0014_size]; decide⟩

theorem entry00479_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0014.get ⟨31, by rw [block0014_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0237.coefficient15_29
  · exact OriginalRow227TriangleBindingsRow015.block0237_value ⟨15, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0014 checks0014_checked
      ⟨31, by rw [checks0014_size]; decide⟩

theorem block0014_enclosed : AllEnclosed OriginalRow227TriangleLookup.T block0014 := by
  exact allEnclosed_cons entry00448_enclosed <|
    allEnclosed_cons entry00449_enclosed <|
    allEnclosed_cons entry00450_enclosed <|
    allEnclosed_cons entry00451_enclosed <|
    allEnclosed_cons entry00452_enclosed <|
    allEnclosed_cons entry00453_enclosed <|
    allEnclosed_cons entry00454_enclosed <|
    allEnclosed_cons entry00455_enclosed <|
    allEnclosed_cons entry00456_enclosed <|
    allEnclosed_cons entry00457_enclosed <|
    allEnclosed_cons entry00458_enclosed <|
    allEnclosed_cons entry00459_enclosed <|
    allEnclosed_cons entry00460_enclosed <|
    allEnclosed_cons entry00461_enclosed <|
    allEnclosed_cons entry00462_enclosed <|
    allEnclosed_cons entry00463_enclosed <|
    allEnclosed_cons entry00464_enclosed <|
    allEnclosed_cons entry00465_enclosed <|
    allEnclosed_cons entry00466_enclosed <|
    allEnclosed_cons entry00467_enclosed <|
    allEnclosed_cons entry00468_enclosed <|
    allEnclosed_cons entry00469_enclosed <|
    allEnclosed_cons entry00470_enclosed <|
    allEnclosed_cons entry00471_enclosed <|
    allEnclosed_cons entry00472_enclosed <|
    allEnclosed_cons entry00473_enclosed <|
    allEnclosed_cons entry00474_enclosed <|
    allEnclosed_cons entry00475_enclosed <|
    allEnclosed_cons entry00476_enclosed <|
    allEnclosed_cons entry00477_enclosed <|
    allEnclosed_cons entry00478_enclosed <|
    allEnclosed_cons entry00479_enclosed <|
    allEnclosed_nil OriginalRow227TriangleLookup.T

def checks0015 : Array (ErrorEntry × IntervalDyadic) := #[
  ((block0015.get ⟨0, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0252.coefficient16_29),
  ((block0015.get ⟨1, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0267.coefficient17_29),
  ((block0015.get ⟨2, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0282.coefficient18_29),
  ((block0015.get ⟨3, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0297.coefficient19_29),
  ((block0015.get ⟨4, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0312.coefficient20_29),
  ((block0015.get ⟨5, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0327.coefficient21_29),
  ((block0015.get ⟨6, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0342.coefficient22_29),
  ((block0015.get ⟨7, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0357.coefficient23_29),
  ((block0015.get ⟨8, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0372.coefficient24_29),
  ((block0015.get ⟨9, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0387.coefficient25_29),
  ((block0015.get ⟨10, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0402.coefficient26_29),
  ((block0015.get ⟨11, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0417.coefficient27_29),
  ((block0015.get ⟨12, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0432.coefficient28_29),
  ((block0015.get ⟨13, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0446.coefficient29_29),
  ((block0015.get ⟨14, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0460.coefficient30_29),
  ((block0015.get ⟨15, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0000.coefficient0_30),
  ((block0015.get ⟨16, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0016.coefficient1_30),
  ((block0015.get ⟨17, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0032.coefficient2_30),
  ((block0015.get ⟨18, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0048.coefficient3_30),
  ((block0015.get ⟨19, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0064.coefficient4_30),
  ((block0015.get ⟨20, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0080.coefficient5_30),
  ((block0015.get ⟨21, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0096.coefficient6_30),
  ((block0015.get ⟨22, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0112.coefficient7_30),
  ((block0015.get ⟨23, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0128.coefficient8_30),
  ((block0015.get ⟨24, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0144.coefficient9_30),
  ((block0015.get ⟨25, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0160.coefficient10_30),
  ((block0015.get ⟨26, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0176.coefficient11_30),
  ((block0015.get ⟨27, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0192.coefficient12_30),
  ((block0015.get ⟨28, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0207.coefficient13_30),
  ((block0015.get ⟨29, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0222.coefficient14_30),
  ((block0015.get ⟨30, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0237.coefficient15_30),
  ((block0015.get ⟨31, by rw [block0015_length]; decide⟩), OriginalRow227TriangleData0252.coefficient16_30)
]

theorem checks0015_size : checks0015.size = 32 := rfl

theorem checks0015_checked :
    blockCheck (fun p => enclosureCheck p.1 p.2) checks0015 = true := by
  decide +kernel

theorem entry00480_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨0, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0252.coefficient16_29
  · exact OriginalRow227TriangleBindingsRow016.block0252_value ⟨14, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨0, by rw [checks0015_size]; decide⟩

theorem entry00481_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨1, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0267.coefficient17_29
  · exact OriginalRow227TriangleBindingsRow017.block0267_value ⟨13, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨1, by rw [checks0015_size]; decide⟩

theorem entry00482_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨2, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0282.coefficient18_29
  · exact OriginalRow227TriangleBindingsRow018.block0282_value ⟨12, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨2, by rw [checks0015_size]; decide⟩

theorem entry00483_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨3, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0297.coefficient19_29
  · exact OriginalRow227TriangleBindingsRow019.block0297_value ⟨11, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨3, by rw [checks0015_size]; decide⟩

theorem entry00484_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨4, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0312.coefficient20_29
  · exact OriginalRow227TriangleBindingsRow020.block0312_value ⟨10, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨4, by rw [checks0015_size]; decide⟩

theorem entry00485_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨5, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0327.coefficient21_29
  · exact OriginalRow227TriangleBindingsRow021.block0327_value ⟨9, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨5, by rw [checks0015_size]; decide⟩

theorem entry00486_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨6, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0342.coefficient22_29
  · exact OriginalRow227TriangleBindingsRow022.block0342_value ⟨8, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨6, by rw [checks0015_size]; decide⟩

theorem entry00487_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨7, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0357.coefficient23_29
  · exact OriginalRow227TriangleBindingsRow023.block0357_value ⟨7, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨7, by rw [checks0015_size]; decide⟩

theorem entry00488_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨8, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0372.coefficient24_29
  · exact OriginalRow227TriangleBindingsRow024.block0372_value ⟨6, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨8, by rw [checks0015_size]; decide⟩

theorem entry00489_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨9, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0387.coefficient25_29
  · exact OriginalRow227TriangleBindingsRow025.block0387_value ⟨5, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨9, by rw [checks0015_size]; decide⟩

theorem entry00490_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨10, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0402.coefficient26_29
  · exact OriginalRow227TriangleBindingsRow026.block0402_value ⟨4, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨10, by rw [checks0015_size]; decide⟩

theorem entry00491_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨11, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0417.coefficient27_29
  · exact OriginalRow227TriangleBindingsRow027.block0417_value ⟨3, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨11, by rw [checks0015_size]; decide⟩

theorem entry00492_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨12, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0432.coefficient28_29
  · exact OriginalRow227TriangleBindingsRow028.block0432_value ⟨2, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨12, by rw [checks0015_size]; decide⟩

theorem entry00493_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨13, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0446.coefficient29_29
  · exact OriginalRow227TriangleBindingsRow029.block0446_value ⟨1, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨13, by rw [checks0015_size]; decide⟩

theorem entry00494_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨14, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0460.coefficient30_29
  · exact OriginalRow227TriangleBindingsRow030.block0460_value ⟨0, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨14, by rw [checks0015_size]; decide⟩

theorem entry00495_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨15, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0000.coefficient0_30
  · exact OriginalRow227TriangleBindingsRow000.block0000_value ⟨30, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨15, by rw [checks0015_size]; decide⟩

theorem entry00496_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨16, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0016.coefficient1_30
  · exact OriginalRow227TriangleBindingsRow001.block0016_value ⟨30, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨16, by rw [checks0015_size]; decide⟩

theorem entry00497_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨17, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0032.coefficient2_30
  · exact OriginalRow227TriangleBindingsRow002.block0032_value ⟨29, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨17, by rw [checks0015_size]; decide⟩

theorem entry00498_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨18, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0048.coefficient3_30
  · exact OriginalRow227TriangleBindingsRow003.block0048_value ⟨28, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨18, by rw [checks0015_size]; decide⟩

theorem entry00499_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨19, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0064.coefficient4_30
  · exact OriginalRow227TriangleBindingsRow004.block0064_value ⟨27, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨19, by rw [checks0015_size]; decide⟩

theorem entry00500_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨20, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0080.coefficient5_30
  · exact OriginalRow227TriangleBindingsRow005.block0080_value ⟨26, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨20, by rw [checks0015_size]; decide⟩

theorem entry00501_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨21, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0096.coefficient6_30
  · exact OriginalRow227TriangleBindingsRow006.block0096_value ⟨25, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨21, by rw [checks0015_size]; decide⟩

theorem entry00502_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨22, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0112.coefficient7_30
  · exact OriginalRow227TriangleBindingsRow007.block0112_value ⟨24, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨22, by rw [checks0015_size]; decide⟩

theorem entry00503_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨23, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0128.coefficient8_30
  · exact OriginalRow227TriangleBindingsRow008.block0128_value ⟨23, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨23, by rw [checks0015_size]; decide⟩

theorem entry00504_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨24, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0144.coefficient9_30
  · exact OriginalRow227TriangleBindingsRow009.block0144_value ⟨22, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨24, by rw [checks0015_size]; decide⟩

theorem entry00505_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨25, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0160.coefficient10_30
  · exact OriginalRow227TriangleBindingsRow010.block0160_value ⟨21, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨25, by rw [checks0015_size]; decide⟩

theorem entry00506_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨26, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0176.coefficient11_30
  · exact OriginalRow227TriangleBindingsRow011.block0176_value ⟨20, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨26, by rw [checks0015_size]; decide⟩

theorem entry00507_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨27, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0192.coefficient12_30
  · exact OriginalRow227TriangleBindingsRow012.block0192_value ⟨19, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨27, by rw [checks0015_size]; decide⟩

theorem entry00508_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨28, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0207.coefficient13_30
  · exact OriginalRow227TriangleBindingsRow013.block0207_value ⟨18, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨28, by rw [checks0015_size]; decide⟩

theorem entry00509_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨29, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0222.coefficient14_30
  · exact OriginalRow227TriangleBindingsRow014.block0222_value ⟨17, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨29, by rw [checks0015_size]; decide⟩

theorem entry00510_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨30, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0237.coefficient15_30
  · exact OriginalRow227TriangleBindingsRow015.block0237_value ⟨16, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨30, by rw [checks0015_size]; decide⟩

theorem entry00511_enclosed : Enclosed OriginalRow227TriangleLookup.T (block0015.get ⟨31, by rw [block0015_length]; decide⟩) := by
  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ OriginalRow227TriangleData0252.coefficient16_30
  · exact OriginalRow227TriangleBindingsRow016.block0252_value ⟨15, by decide⟩
  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) checks0015 checks0015_checked
      ⟨31, by rw [checks0015_size]; decide⟩

theorem block0015_enclosed : AllEnclosed OriginalRow227TriangleLookup.T block0015 := by
  exact allEnclosed_cons entry00480_enclosed <|
    allEnclosed_cons entry00481_enclosed <|
    allEnclosed_cons entry00482_enclosed <|
    allEnclosed_cons entry00483_enclosed <|
    allEnclosed_cons entry00484_enclosed <|
    allEnclosed_cons entry00485_enclosed <|
    allEnclosed_cons entry00486_enclosed <|
    allEnclosed_cons entry00487_enclosed <|
    allEnclosed_cons entry00488_enclosed <|
    allEnclosed_cons entry00489_enclosed <|
    allEnclosed_cons entry00490_enclosed <|
    allEnclosed_cons entry00491_enclosed <|
    allEnclosed_cons entry00492_enclosed <|
    allEnclosed_cons entry00493_enclosed <|
    allEnclosed_cons entry00494_enclosed <|
    allEnclosed_cons entry00495_enclosed <|
    allEnclosed_cons entry00496_enclosed <|
    allEnclosed_cons entry00497_enclosed <|
    allEnclosed_cons entry00498_enclosed <|
    allEnclosed_cons entry00499_enclosed <|
    allEnclosed_cons entry00500_enclosed <|
    allEnclosed_cons entry00501_enclosed <|
    allEnclosed_cons entry00502_enclosed <|
    allEnclosed_cons entry00503_enclosed <|
    allEnclosed_cons entry00504_enclosed <|
    allEnclosed_cons entry00505_enclosed <|
    allEnclosed_cons entry00506_enclosed <|
    allEnclosed_cons entry00507_enclosed <|
    allEnclosed_cons entry00508_enclosed <|
    allEnclosed_cons entry00509_enclosed <|
    allEnclosed_cons entry00510_enclosed <|
    allEnclosed_cons entry00511_enclosed <|
    allEnclosed_nil OriginalRow227TriangleLookup.T

theorem node0000_0002_enclosed : AllEnclosed OriginalRow227TriangleLookup.T node0000_0002 :=
  allEnclosed_append block0000_enclosed block0001_enclosed

theorem node0002_0004_enclosed : AllEnclosed OriginalRow227TriangleLookup.T node0002_0004 :=
  allEnclosed_append block0002_enclosed block0003_enclosed

theorem node0000_0004_enclosed : AllEnclosed OriginalRow227TriangleLookup.T node0000_0004 :=
  allEnclosed_append node0000_0002_enclosed node0002_0004_enclosed

theorem node0004_0006_enclosed : AllEnclosed OriginalRow227TriangleLookup.T node0004_0006 :=
  allEnclosed_append block0004_enclosed block0005_enclosed

theorem node0006_0008_enclosed : AllEnclosed OriginalRow227TriangleLookup.T node0006_0008 :=
  allEnclosed_append block0006_enclosed block0007_enclosed

theorem node0004_0008_enclosed : AllEnclosed OriginalRow227TriangleLookup.T node0004_0008 :=
  allEnclosed_append node0004_0006_enclosed node0006_0008_enclosed

theorem node0000_0008_enclosed : AllEnclosed OriginalRow227TriangleLookup.T node0000_0008 :=
  allEnclosed_append node0000_0004_enclosed node0004_0008_enclosed

theorem node0008_0010_enclosed : AllEnclosed OriginalRow227TriangleLookup.T node0008_0010 :=
  allEnclosed_append block0008_enclosed block0009_enclosed

theorem node0010_0012_enclosed : AllEnclosed OriginalRow227TriangleLookup.T node0010_0012 :=
  allEnclosed_append block0010_enclosed block0011_enclosed

theorem node0008_0012_enclosed : AllEnclosed OriginalRow227TriangleLookup.T node0008_0012 :=
  allEnclosed_append node0008_0010_enclosed node0010_0012_enclosed

theorem node0012_0014_enclosed : AllEnclosed OriginalRow227TriangleLookup.T node0012_0014 :=
  allEnclosed_append block0012_enclosed block0013_enclosed

theorem node0014_0016_enclosed : AllEnclosed OriginalRow227TriangleLookup.T node0014_0016 :=
  allEnclosed_append block0014_enclosed block0015_enclosed

theorem node0012_0016_enclosed : AllEnclosed OriginalRow227TriangleLookup.T node0012_0016 :=
  allEnclosed_append node0012_0014_enclosed node0014_0016_enclosed

theorem node0008_0016_enclosed : AllEnclosed OriginalRow227TriangleLookup.T node0008_0016 :=
  allEnclosed_append node0008_0012_enclosed node0012_0016_enclosed

theorem node0000_0016_enclosed : AllEnclosed OriginalRow227TriangleLookup.T node0000_0016 :=
  allEnclosed_append node0000_0008_enclosed node0008_0016_enclosed


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.checks0000_checked,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.block0000_enclosed,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.checks0001_checked,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.block0001_enclosed,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.checks0002_checked,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.block0002_enclosed,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.checks0003_checked,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.block0003_enclosed,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.checks0004_checked,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.block0004_enclosed,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.checks0005_checked,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.block0005_enclosed,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.checks0006_checked,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.block0006_enclosed,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.checks0007_checked,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.block0007_enclosed,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.checks0008_checked,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.block0008_enclosed,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.checks0009_checked,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.block0009_enclosed,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.checks0010_checked,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.block0010_enclosed,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.checks0011_checked,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.block0011_enclosed,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.checks0012_checked,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.block0012_enclosed,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.checks0013_checked,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.block0013_enclosed,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.checks0014_checked,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.block0014_enclosed,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.checks0015_checked,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.block0015_enclosed,
      ``Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000.node0000_0016_enclosed] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227SelectedIntervalsChunk000
