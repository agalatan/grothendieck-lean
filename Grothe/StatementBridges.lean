import Grothe.Statement
import Grothe.Lower.TransferFinite

/-!
# What the targets say about the constant

Bridges between the statement (`Grothe/Statement.lean`) and the proof's objects, for a general
threshold `c`:

* `isBound_iff`: the statement's `IsBound` is the proof's `Grothe.IsGrothendieckBound`;
* `bounds_bddBelow`, `isClosed_bounds`: the set of Grothendieck bounds is bounded below (by `0`) and
  closed, so when it is nonempty its infimum `K_G^ℂ` is itself a bound (`constant_isBound`);
* `constant_lt_of_upperBelow`: `UpperBelow c` gives `K_G^ℂ < c`; `upperBelow_of_constant_lt` is the
  converse, given that some bound exists;
* `le_constant_of_lowerAbove`, `lt_constant_of_lowerAbove`: `LowerAbove c` gives `c ≤ K_G^ℂ` and
  `c < K_G^ℂ`, given that some bound exists (without one the set is empty and `LowerAbove c` is vacuous).
-/

namespace Grothe.Statement

theorem isBound_iff {K : ℝ} : IsBound K ↔ Grothe.IsGrothendieckBound K := Iff.rfl

/-- Every Grothendieck bound is nonnegative (it is at least `1`, `IsGrothendieckBound.one_le`). -/
theorem bounds_bddBelow : BddBelow {K | IsBound K} :=
  ⟨0, fun _ hK => zero_le_one.trans (isBound_iff.mp hK).one_le⟩

/-- The set of Grothendieck bounds is closed: it is the intersection over all matrices `A` of the
closed half-lines `{K | V(A) ≤ K · C(A)}`. -/
theorem isClosed_bounds : IsClosed {K : ℝ | IsBound K} := by
  have h : {K : ℝ | IsBound K} = ⋂ (m : ℕ) (n : ℕ) (A : Fin m → Fin n → ℂ),
      {K : ℝ | Grothe.Statement.vectorOpt A ≤ K * Grothe.Statement.scalarOpt A} := by
    ext K
    simp only [Set.mem_ofPred_eq, Set.mem_iInter, IsBound]
  rw [h]
  exact isClosed_iInter fun m => isClosed_iInter fun n => isClosed_iInter fun A =>
    isClosed_le continuous_const (continuous_id.mul continuous_const)

/-- Once some Grothendieck bound exists, the constant `K_G^ℂ` is itself a Grothendieck bound. -/
theorem constant_isBound (hne : ∃ K, IsBound K) : IsBound complexGrothendieckConstant :=
  isClosed_bounds.csInf_mem hne bounds_bddBelow

/-- `UpperBelow c` gives `K_G^ℂ < c`. -/
theorem constant_lt_of_upperBelow {c : ℝ} (h : UpperBelow c) : complexGrothendieckConstant < c := by
  obtain ⟨K, hK, hlt⟩ := h
  exact lt_of_le_of_lt (csInf_le bounds_bddBelow hK) hlt

/-- Conversely, once some Grothendieck bound exists, `K_G^ℂ < c` gives a bound below `c`. -/
theorem upperBelow_of_constant_lt {c : ℝ} (hne : ∃ K, IsBound K)
    (h : complexGrothendieckConstant < c) : UpperBelow c := by
  obtain ⟨K, hK, hlt⟩ := exists_lt_of_csInf_lt hne h
  exact ⟨K, hK, hlt⟩

/-- `LowerAbove c` gives `c ≤ K_G^ℂ`, once some Grothendieck bound exists. -/
theorem le_constant_of_lowerAbove {c : ℝ} (hne : ∃ K, IsBound K) (h : LowerAbove c) :
    c ≤ complexGrothendieckConstant :=
  le_csInf hne fun K hK => (h K hK).le

/-- `LowerAbove c` gives even `c < K_G^ℂ`, once some Grothendieck bound exists: the infimum is a bound. -/
theorem lt_constant_of_lowerAbove {c : ℝ} (hne : ∃ K, IsBound K) (h : LowerAbove c) :
    c < complexGrothendieckConstant :=
  h _ (constant_isBound hne)

end Grothe.Statement
