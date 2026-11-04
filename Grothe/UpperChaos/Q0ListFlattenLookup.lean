import Grothe.UpperChaos.Q0OrdinalCoverage

/-! Safe lookup in a list of fixed-size blocks. Only blocks before the selected
one must be full; the selected block may be shorter. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0ListFlattenLookup

/-- Two safe lookups identify the corresponding element in the flattened list.
The length of the selected block is unrestricted. -/
theorem getElem?_flatten_of_full_prefix {α : Type*} (blocks : List (List α))
    (k m : ℕ) (block : List α) (x : α)
    (hfull : ∀ j < k, ∀ b, blocks[j]? = some b → b.length = 64)
    (hblock : blocks[k]? = some block) (hitem : block[m]? = some x) :
    blocks.flatten[64 * k + m]? = some x := by
  induction k generalizing blocks with
  | zero =>
    cases blocks with
    | nil => simp at hblock
    | cons head tail =>
      have heq : head = block := by simpa using hblock
      subst head
      have hm : m < block.length := (List.getElem?_eq_some_iff.mp hitem).choose
      simpa only [Nat.mul_zero, Nat.zero_add, List.flatten_cons,
        List.getElem?_append_left hm] using hitem
  | succ k ih =>
    cases blocks with
    | nil => simp at hblock
    | cons head tail =>
      have hhead : head.length = 64 := hfull 0 (by omega) head (by simp)
      have htail : tail[k]? = some block := by simpa using hblock
      have hfulltail : ∀ j < k, ∀ b, tail[j]? = some b → b.length = 64 := by
        intro j hj b hb
        exact hfull (j + 1) (by omega) b (by simpa using hb)
      have hindex : head.length ≤ 64 * (k + 1) + m := by rw [hhead]; omega
      simp only [List.flatten_cons]
      rw [List.getElem?_append_right hindex]
      have heq : 64 * (k + 1) + m - head.length = 64 * k + m := by
        rw [hhead]
        omega
      rw [heq]
      exact ih tail hfulltail htail

end Grothe.UpperChaos.Q0ListFlattenLookup
