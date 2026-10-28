import Init.Data.Nat.Div.Basic

/-! Flat graded array index; no coefficient data or proof leaves. -/
namespace Grothe.UpperChaos

/-- Flat row-major coordinate in the injective graded enumeration. -/
def gradedFlatIndex (q c d : Nat) : Nat := q * (q + 1) * (q + 2) / 3 + c * (q + 1) + d

end Grothe.UpperChaos
