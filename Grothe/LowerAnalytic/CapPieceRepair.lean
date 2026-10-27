import Grothe.LowerAnalytic.CapPieceNodes
import Grothe.LowerAnalytic.CapPieceRepairDefs

/-! S-lemma multipliers belong to the certificate, not the constrained region.
Agent-ID: codex-2ca4. This permits a repaired piece to reuse an existing node cover. -/

namespace Grothe.LowerAnalytic

/-- Forget the two certificate multipliers, retaining the geometric constraint. -/
def Cons.withoutMultipliers (c : Cons) : Cons := { c with lam := 0, mu := 0 }

theorem pieceSet_withoutMultipliers (E : Grothe.Lower.Sym3) (R : Grothe.Lower.Sym2)
    (cs : List Cons) :
    pieceSet E R (cs.map Cons.withoutMultipliers) = pieceSet E R cs := by
  ext y
  simp [pieceSet, Cons.Holds, Cons.Cond, Cons.withoutMultipliers]

/-- A piece bound transfers across any change of S-lemma multipliers. -/
theorem pieceCap_of_same_constraints {k i : ℕ} {cs ds : List Cons}
    (h : cs.map Cons.withoutMultipliers = ds.map Cons.withoutMultipliers)
    (hd : PieceCap k i ds) : PieceCap k i cs := by
  have hset (E : Grothe.Lower.Sym3) (R : Grothe.Lower.Sym2) :
      pieceSet E R cs = pieceSet E R ds := by
    rw [← pieceSet_withoutMultipliers E R cs, h, pieceSet_withoutMultipliers]
  simpa only [PieceCap, hset] using hd

/-- Parsed equality of geometric data is enough to transfer a checked piece bound. -/
theorem pieceCap_of_same_regionData {k i : ℕ} {cs ds : List Cons}
    (h : cs.map Cons.regionData = ds.map Cons.regionData)
    (hd : PieceCap k i ds) : PieceCap k i cs := by
  apply pieceCap_of_same_constraints (ds := ds) _ hd
  have he := congrArg (List.map fun p : List ℚ × ℚ × Option ℚ =>
    (⟨p.1, p.2.1, p.2.2, 0, 0⟩ : Cons)) h
  have hfn : (fun p : List ℚ × ℚ × Option ℚ =>
      (⟨p.1, p.2.1, p.2.2, 0, 0⟩ : Cons)) ∘ Cons.regionData = Cons.withoutMultipliers := by
    funext c
    cases c
    rfl
  simpa only [List.map_map, hfn] using he

end Grothe.LowerAnalytic
