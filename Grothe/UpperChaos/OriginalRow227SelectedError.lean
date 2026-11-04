import Grothe.UpperChaos.OriginalRow227SelectedErrorData

/-!
Generated selected-error certificate. Regenerate with tools/gen_row227_full_certificate.py.
Complete candidate integer budgets, with exact selected order and coverage.
All records come from committed certificate.json.gz; hashes are provenance only.
No actual vector/error bound follows until checkpoint and payload bindings are proved.
Agent-ID: codex-aa04. Refs #293, #21.
-/

open scoped BigOperators

namespace Grothe.UpperChaos.OriginalRow227SelectedError

open OriginalRow227ErrorBoundary

open Data

def entries : List ErrorEntry := Data.node0000_0997

def normalizedTotal : ℤ := 586826818880226451325247613399363273722509035833891692720212941640752220379702649693113695999431230091556293177692771459222011775797629852286121603646303300014218296709755086927305868627930663209730404573705029380208945802665306848652068822636511896338645097948583483531332938609272843862308088378508345741185394402029346511212478399096551924737282109954437721769503204510301795013687162

def savedTotal : ℤ := 14748210558937728232309492886108577166056736014407846423388326136408273158047093268960810298393254977755287629156869978468656020574565009559534168174339186857672889627574224894664919289939655091668316204088312048053959999310001978218178452404996176739263902860143421564106065122726322853144846855224406354464995606630383659371309423585603349041921318236148751129733082344401714275123125450532502560169831470615988111884261661564412921013008092228472535658071745988823668830496624447846894163104085293846345206502718517623756802306388264027276132297626101593161625891611015272047521535466076930962904732370612822079160334798548241118092416563371228367923998025575257711792702740037154645383244951066808810623777934842513637176102974531081353023475569309557862325289898150765581633156275310966974858989317070415200628402601312952387955743839763350265007136516106501730218721517649751302273065308302528376613344030103170115035167985637132340497123270718576686063409015142409314395596987687871879675324683131222106843945137170163764346571885873458208

theorem entries_length : entries.length = 31877 := Data.node0000_0997_length

theorem entries_ordinals : entries.map entryOrdinal = List.range' 0 31877 :=
  Data.node0000_0997_ordinals

theorem entries_valid : entries.all entryValid = true :=
  Data.node0000_0997_valid

/-- Distinct selected records have distinct coordinate keys. -/
theorem entries_keys_nodup : (entries.map entryKey).Nodup := by
  apply List.Nodup.of_map keyOrdinal
  rw [List.map_map]
  change (entries.map entryOrdinal).Nodup
  rw [entries_ordinals]
  exact List.nodup_range' _

/-- Exact coverage; no default lookup or discarded record is used. -/
theorem entries_keys_eq_modes :
    (entries.map entryKey).toFinset = ConditionalNodeIndices.modes := by
  have hsub : (entries.map entryKey).toFinset ⊆ ConditionalNodeIndices.modes := by
    intro p hp
    obtain ⟨e, he, rfl⟩ := List.mem_map.mp (List.mem_toFinset.mp hp)
    exact entryValid_mem_modes e ((List.all_eq_true.mp entries_valid) e he)
  have hcard : (entries.map entryKey).toFinset.card = 31877 := by
    rw [List.toFinset_card_of_nodup entries_keys_nodup, List.length_map, entries_length]
  exact Finset.eq_of_subset_of_card_le hsub
    (ConditionalNodeIndices.card_modes.le.trans hcard.ge)

theorem normalized_sum : (entries.map fun e => e.radius ^ 2).sum = normalizedTotal :=
  Data.node0000_0997_normalized

theorem saved_sum : (entries.map fun e => errorNumerator e ^ 2).sum = savedTotal :=
  Data.node0000_0997_saved

/-- Integer form of the candidate normalized radius 157 / 10^40. -/
theorem normalized_budget_checked :
    normalizedTotal * (10 : ℤ) ^ 80 ≤ (157 : ℤ) ^ 2 * (2 : ℤ) ^ 1536 := by
  decide +kernel

/-- Integer form of the candidate saved-center radius 13759969 / 10^24. -/
theorem saved_budget_checked :
    savedTotal * (10 : ℤ) ^ 48 ≤ (13759969 : ℤ) ^ 2 * (2 : ℤ) ^ 3584 := by
  decide +kernel

theorem normalized_integer_budget :
    (entries.map fun e => e.radius ^ 2).sum * (10 : ℤ) ^ 80 ≤
      (157 : ℤ) ^ 2 * (2 : ℤ) ^ 1536 := by
  rw [normalized_sum]
  exact normalized_budget_checked

theorem saved_integer_budget :
    (entries.map fun e => errorNumerator e ^ 2).sum * (10 : ℤ) ^ 48 ≤
      (13759969 : ℤ) ^ 2 * (2 : ℤ) ^ 3584 := by
  rw [saved_sum]
  exact saved_budget_checked


open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalRow227SelectedError.entries_ordinals,
      ``Grothe.UpperChaos.OriginalRow227SelectedError.entries_valid,
      ``Grothe.UpperChaos.OriginalRow227SelectedError.entries_keys_nodup,
      ``Grothe.UpperChaos.OriginalRow227SelectedError.entries_keys_eq_modes,
      ``Grothe.UpperChaos.OriginalRow227SelectedError.normalized_sum,
      ``Grothe.UpperChaos.OriginalRow227SelectedError.saved_sum,
      ``Grothe.UpperChaos.OriginalRow227SelectedError.normalized_budget_checked,
      ``Grothe.UpperChaos.OriginalRow227SelectedError.saved_budget_checked,
      ``Grothe.UpperChaos.OriginalRow227SelectedError.normalized_integer_budget,
      ``Grothe.UpperChaos.OriginalRow227SelectedError.saved_integer_budget] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

end Grothe.UpperChaos.OriginalRow227SelectedError
