import Grothe.UpperChaos.OriginalRow227TriangleLookup

/-!
Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.
Reuses named triangle intervals; no new numerical values or enclosures.
Regenerate with tools/gen_row227_full_certificate.py.
-/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleBindingsRow148

open ConditionalTableLookup

open OriginalRow227TriangleLookupRow148

theorem block1720_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 148 (147 + i.val) = some (values1720[i.val]'(by rw [values1720_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row148_lookup _).trans (OriginalRow227TriangleLookupRow148.block1720_lookup i)

theorem block1720_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 148 (147 + i.val) = (values1720[i.val]'(by rw [values1720_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1720_lookup i)

theorem block1721_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 148 (179 + i.val) = some (values1721[i.val]'(by rw [values1721_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row148_lookup _).trans (OriginalRow227TriangleLookupRow148.block1721_lookup i)

theorem block1721_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 148 (179 + i.val) = (values1721[i.val]'(by rw [values1721_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1721_lookup i)

theorem block1722_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 148 (211 + i.val) = some (values1722[i.val]'(by rw [values1722_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row148_lookup _).trans (OriginalRow227TriangleLookupRow148.block1722_lookup i)

theorem block1722_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 148 (211 + i.val) = (values1722[i.val]'(by rw [values1722_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1722_lookup i)

theorem block1723_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 148 (243 + i.val) = some (values1723[i.val]'(by rw [values1723_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row148_lookup _).trans (OriginalRow227TriangleLookupRow148.block1723_lookup i)

theorem block1723_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 148 (243 + i.val) = (values1723[i.val]'(by rw [values1723_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1723_lookup i)

theorem block1724_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 148 (275 + i.val) = some (values1724[i.val]'(by rw [values1724_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row148_lookup _).trans (OriginalRow227TriangleLookupRow148.block1724_lookup i)

theorem block1724_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 148 (275 + i.val) = (values1724[i.val]'(by rw [values1724_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1724_lookup i)

theorem block1725_lookup (i : Fin 32) :
    OriginalRow227TriangleLookup.lookup 148 (307 + i.val) = some (values1725[i.val]'(by rw [values1725_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row148_lookup _).trans (OriginalRow227TriangleLookupRow148.block1725_lookup i)

theorem block1725_value (i : Fin 32) :
    OriginalRow227TriangleLookup.T 148 (307 + i.val) = (values1725[i.val]'(by rw [values1725_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1725_lookup i)

theorem block1726_lookup (i : Fin 15) :
    OriginalRow227TriangleLookup.lookup 148 (339 + i.val) = some (values1726[i.val]'(by rw [values1726_size]; exact i.isLt)) :=
  (OriginalRow227TriangleLookup.row148_lookup _).trans (OriginalRow227TriangleLookupRow148.block1726_lookup i)

theorem block1726_value (i : Fin 15) :
    OriginalRow227TriangleLookup.T 148 (339 + i.val) = (values1726[i.val]'(by rw [values1726_size]; exact i.isLt)) :=
  OriginalRow227TriangleLookup.T_eq_of_lookup (block1726_lookup i)


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow148.block1720_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow148.block1720_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow148.block1721_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow148.block1721_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow148.block1722_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow148.block1722_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow148.block1723_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow148.block1723_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow148.block1724_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow148.block1724_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow148.block1725_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow148.block1725_value,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow148.block1726_lookup,
      ``Grothe.UpperChaos.OriginalRow227TriangleBindingsRow148.block1726_value] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227TriangleBindingsRow148
