import Grothe.Lower.RowData
import Grothe.Lower.MixedData
import Grothe.Lower.Support

/-!
# The certificate check in parts

The exact checks of the certificate are split into consecutive chunks of the rows, the batches and
the boxes, plus the partition check, so that each chunk is one single-threaded `native_decide` in
its own module (`Grothe/Lower/Cert/*.lean`) and `lake` runs the chunks in separate processes.
`all_of_chunk` reassembles a `List.all` from its chunks.
-/

namespace Grothe.Lower

/-- The boxes of the cover. -/
def coverBoxList : List Box := coverBoxes.map parseBox

/-- A chunk `[a, a + k)` of a list passes `f`. -/
def chunkOK {α : Type*} (f : α → Bool) (l : List α) (a k : ℕ) : Bool :=
  ((l.drop a).take k).all f

lemma all_of_chunk {α : Type*} (f : α → Bool) (l : List α) (a k : ℕ)
    (h1 : chunkOK f l a k = true) (h2 : (l.drop (a + k)).all f = true) :
    (l.drop a).all f = true := by
  rw [← List.take_append_drop k (l.drop a), List.all_append, List.drop_drop]
  simp only [chunkOK] at h1
  rw [h1, h2, Bool.and_self]

lemma all_drop_of_le {α : Type*} (f : α → Bool) (l : List α) (a : ℕ) (h : l.length ≤ a) :
    (l.drop a).all f = true := by
  rw [List.drop_eq_nil_of_le h]; rfl

end Grothe.Lower
