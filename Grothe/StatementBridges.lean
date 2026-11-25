import Grothe.Statement
import Grothe.Lower.TransferFinite

/-!
# What the targets say about the constant

Bridges between the statement (`Grothe/Statement.lean`) and the proof's objects, for a general
threshold `c`:

* `isBound_iff`: the statement's `IsBound` is the proof's `Grothe.IsGrothendieckBound`;
* `bounds_bddBelow`: the set of Grothendieck bounds is bounded below (by `0`);
* `constant_lt_of_upperBelow`: `UpperBelow c` gives `K_G^ℂ < c`.
-/

namespace Grothe.Statement

theorem isBound_iff {K : ℝ} : IsBound K ↔ Grothe.IsGrothendieckBound K := Iff.rfl

/-- Every Grothendieck bound is nonnegative (it is at least `1`, `IsGrothendieckBound.one_le`). -/
theorem bounds_bddBelow : BddBelow {K | IsBound K} :=
  ⟨0, fun _ hK => zero_le_one.trans (isBound_iff.mp hK).one_le⟩

/-- `UpperBelow c` gives `K_G^ℂ < c`. -/
theorem constant_lt_of_upperBelow {c : ℝ} (h : UpperBelow c) : complexGrothendieckConstant < c := by
  obtain ⟨K, hK, hlt⟩ := h
  exact csInf_lt_of_lt bounds_bddBelow hK hlt

end Grothe.Statement
