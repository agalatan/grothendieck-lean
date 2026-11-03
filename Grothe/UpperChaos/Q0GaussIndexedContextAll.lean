import Grothe.UpperChaos.Q0GaussIndexedContextGroup021
import Grothe.UpperChaos.Q0GaussPhysicalAll

/-! Same-row normalized context lookup for all listed physical rows.
Actual Gauss-rule identity and complete schedule coverage remain separate.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0GaussIndexedContextAll

open Grothe.UpperChaos.Q0GaussIndexedContext

theorem checked : (Grothe.UpperChaos.Q0GaussPhysicalAll.rows).all contextOK = true := by
  simp only [Grothe.UpperChaos.Q0GaussPhysicalAll.rows, List.all_append, Grothe.UpperChaos.Q0GaussIndexedContextGroup000.checked, Grothe.UpperChaos.Q0GaussIndexedContextGroup001.checked, Grothe.UpperChaos.Q0GaussIndexedContextGroup002.checked, Grothe.UpperChaos.Q0GaussIndexedContextGroup003.checked, Grothe.UpperChaos.Q0GaussIndexedContextGroup004.checked, Grothe.UpperChaos.Q0GaussIndexedContextGroup005.checked, Grothe.UpperChaos.Q0GaussIndexedContextGroup006.checked, Grothe.UpperChaos.Q0GaussIndexedContextGroup007.checked, Grothe.UpperChaos.Q0GaussIndexedContextGroup008.checked, Grothe.UpperChaos.Q0GaussIndexedContextGroup009.checked, Grothe.UpperChaos.Q0GaussIndexedContextGroup010.checked, Grothe.UpperChaos.Q0GaussIndexedContextGroup011.checked, Grothe.UpperChaos.Q0GaussIndexedContextGroup012.checked, Grothe.UpperChaos.Q0GaussIndexedContextGroup013.checked, Grothe.UpperChaos.Q0GaussIndexedContextGroup014.checked, Grothe.UpperChaos.Q0GaussIndexedContextGroup015.checked, Grothe.UpperChaos.Q0GaussIndexedContextGroup016.checked, Grothe.UpperChaos.Q0GaussIndexedContextGroup017.checked, Grothe.UpperChaos.Q0GaussIndexedContextGroup018.checked, Grothe.UpperChaos.Q0GaussIndexedContextGroup019.checked, Grothe.UpperChaos.Q0GaussIndexedContextGroup020.checked, Grothe.UpperChaos.Q0GaussIndexedContextGroup021.checked, Bool.and_self]

theorem each_context (r : Grothe.UpperChaos.Q0GaussPhysicalCheck.Row)
    (hr : r ∈ Grothe.UpperChaos.Q0GaussPhysicalAll.rows) :
    contextAt r = some (r.normalizedLower, r.normalizedUpperWeight) := by
  exact contextOK_sound r ((List.all_eq_true.mp checked) r hr)

end Grothe.UpperChaos.Q0GaussIndexedContextAll
