import Grothe.UpperChaos.Q0ArrayFlattenLookup
import Grothe.UpperChaos.Q0GaussAddressScan

/-! Source panel addresses agree with lookup in the scanned panel list.
This is a forward address lemma; schedule coverage remains separate.
Agent-ID: codex-aa04. -/
set_option maxRecDepth 8192

namespace Grothe.UpperChaos.Q0GaussPanelFlatten

open Grothe.UpperChaos.Q0GaussAddress
open Grothe.UpperChaos.Q0GaussAddressScan

theorem panelBlocks_size : panelBlocks.size = 21 := by
  simpa using congrArg Array.size sizes

theorem full_before_last (j : ℕ) (hj : j < 20) (b : Array Panel)
    (hb : panelBlocks[j]? = some b) : b.size = 64 := by
  have hsize : (panelBlocks.map Array.size)[j]? = some b.size := by
    simp only [Array.getElem?_map, hb, Option.map_some]
  rw [sizes] at hsize
  have hentry : (#[64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
      64, 64, 64, 64, 64, 64, 64, 64, 64, 9] : Array ℕ)[j]? = some 64 := by
    interval_cases j <;> decide
  exact Option.some.inj (hsize.symm.trans hentry)

/-- The scanned source list is the literal concatenation of the panel blocks. -/
theorem flattened_eq_sourcePanels :
    (panelBlocks.toList.map Array.toList).flatten = sourcePanels :=
  rfl

/-- A safe block address selects the same panel at its global source index. -/
theorem source_lookup (p : ℕ) (block : Array Panel) (x : Panel)
    (hblock : panelBlocks[p / 64]? = some block)
    (hitem : block[p % 64]? = some x) : sourcePanels[p]? = some x := by
  have hk : p / 64 < 21 := by
    simpa only [panelBlocks_size] using (Array.getElem?_eq_some_iff.mp hblock).choose
  have hfull : ∀ j < p / 64, ∀ b, panelBlocks[j]? = some b → b.size = 64 :=
    fun j hj b hb => full_before_last j (by omega) b hb
  have h := Grothe.UpperChaos.Q0ArrayFlattenLookup.getElem?_flatten_of_full_prefix
    panelBlocks (p / 64) (p % 64) block x hfull hblock hitem
  have hoff : 64 * (p / 64) + p % 64 = p := by omega
  simpa only [flattened_eq_sourcePanels, hoff] using h

end Grothe.UpperChaos.Q0GaussPanelFlatten
