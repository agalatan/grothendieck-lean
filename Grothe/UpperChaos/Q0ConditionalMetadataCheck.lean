import Grothe.UpperChaos.Q0GaussSourceAddress
import Mathlib.Data.List.Chain
import Mathlib.Tactic

/-! Integer layout of the original conditional-node storage. Literal source
data are generated from hash-pinned NPY inputs. Analytic error bounds and
the 3.37 GB payload are separate. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0ConditionalMetadataCheck

structure Row where
  index : ℕ
  first : ℕ
  last : ℕ
  cutoff : ℕ
  deriving DecidableEq, Inhabited

/-- Number of canonical degree-531 pairs at degrees strictly below m. -/
def prefix (m : ℕ) : ℕ :=
  m + m*m/4 - (m-266)*(m-265)/2

/-- Number of pairs of exact total degree m in the original storage order. -/
def degreeCount (m : ℕ) : ℕ :=
  min 266 (min m ((m+1)/2)) + 1 - (m-265)

/-- Every finite prefix increment has the correct degree-block size. -/
set_option maxRecDepth 8192 in
set_option maxHeartbeats 4000000 in
theorem prefix_increment_checked :
    (List.range 532).all (fun m => decide (prefix (m+1) = prefix m + degreeCount m)) = true := by
  decide +kernel

theorem prefix_increment (m : ℕ) (hm : m < 532) :
    prefix (m+1) = prefix m + degreeCount m := by
  have h := (List.all_eq_true.mp prefix_increment_checked) m (List.mem_range.mpr hm)
  exact of_decide_eq_true h

def valid (r : Row) : Bool :=
  decide (r.index < 21577 ∧ r.cutoff ≤ 532 ∧
    r.last = r.first + prefix (min r.cutoff 531 + 1) ∧ r.last ≤ 421701618)

theorem valid_sound (r : Row) (h : valid r = true) :
    r.index < 21577 ∧ r.cutoff ≤ 532 ∧
      r.last = r.first + prefix (min r.cutoff 531 + 1) ∧ r.last ≤ 421701618 :=
  of_decide_eq_true h

/-- Consecutive stored records have consecutive ordinals and share the
same end/start offset. -/
def adjacent (a b : Row) : Prop := a.index + 1 = b.index ∧ a.last = b.first

end Grothe.UpperChaos.Q0ConditionalMetadataCheck
