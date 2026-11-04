import Grothe.UpperChaos.Q0ListFlattenLookup

/-! Safe array block lookups agree with lookup in the flattened source list.
Only preceding blocks must have size 64. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0ArrayFlattenLookup

/-- Flattening preserves a safe two-level array lookup at its global offset. -/
theorem getElem?_flatten_of_full_prefix {α : Type*} (blocks : Array (Array α))
    (k m : ℕ) (block : Array α) (x : α)
    (hfull : ∀ j < k, ∀ b, blocks[j]? = some b → b.size = 64)
    (hblock : blocks[k]? = some block) (hitem : block[m]? = some x) :
    ((blocks.toList.map Array.toList).flatten)[64 * k + m]? = some x := by
  apply Grothe.UpperChaos.Q0ListFlattenLookup.getElem?_flatten_of_full_prefix
    (blocks.toList.map Array.toList) k m block.toList x
  · intro j hj b hb
    have hlookup : Option.map Array.toList blocks[j]? = some b := by
      simpa only [List.getElem?_map, Array.getElem?_toList] using hb
    cases he : blocks[j]? with
    | none => simp [he] at hlookup
    | some a =>
      have hab : a.toList = b := by simpa [he] using hlookup
      subst b
      simpa using hfull j hj a he
  · simp only [List.getElem?_map, Array.getElem?_toList, hblock, Option.map_some]
  · simpa only [Array.getElem?_toList] using hitem

end Grothe.UpperChaos.Q0ArrayFlattenLookup
