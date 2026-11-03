import Grothe.UpperChaos.Q0GaussPhysicalGroup021
import Grothe.UpperChaos.Q0NodeMassAll

/-! Complete candidate physical checks; quadrature/source semantics are
still separate. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0GaussPhysicalAll

open Grothe.UpperChaos.Q0GaussPhysicalCheck

def rows : List Row := Grothe.UpperChaos.Q0GaussPhysicalGroup000.rows ++ Grothe.UpperChaos.Q0GaussPhysicalGroup001.rows ++ Grothe.UpperChaos.Q0GaussPhysicalGroup002.rows ++ Grothe.UpperChaos.Q0GaussPhysicalGroup003.rows ++ Grothe.UpperChaos.Q0GaussPhysicalGroup004.rows ++ Grothe.UpperChaos.Q0GaussPhysicalGroup005.rows ++ Grothe.UpperChaos.Q0GaussPhysicalGroup006.rows ++ Grothe.UpperChaos.Q0GaussPhysicalGroup007.rows ++ Grothe.UpperChaos.Q0GaussPhysicalGroup008.rows ++ Grothe.UpperChaos.Q0GaussPhysicalGroup009.rows ++ Grothe.UpperChaos.Q0GaussPhysicalGroup010.rows ++ Grothe.UpperChaos.Q0GaussPhysicalGroup011.rows ++ Grothe.UpperChaos.Q0GaussPhysicalGroup012.rows ++ Grothe.UpperChaos.Q0GaussPhysicalGroup013.rows ++ Grothe.UpperChaos.Q0GaussPhysicalGroup014.rows ++ Grothe.UpperChaos.Q0GaussPhysicalGroup015.rows ++ Grothe.UpperChaos.Q0GaussPhysicalGroup016.rows ++ Grothe.UpperChaos.Q0GaussPhysicalGroup017.rows ++ Grothe.UpperChaos.Q0GaussPhysicalGroup018.rows ++ Grothe.UpperChaos.Q0GaussPhysicalGroup019.rows ++ Grothe.UpperChaos.Q0GaussPhysicalGroup020.rows ++ Grothe.UpperChaos.Q0GaussPhysicalGroup021.rows

theorem checked : rows.all valid = true := by
  simp only [rows, List.all_append, Grothe.UpperChaos.Q0GaussPhysicalGroup000.checked, Grothe.UpperChaos.Q0GaussPhysicalGroup001.checked, Grothe.UpperChaos.Q0GaussPhysicalGroup002.checked, Grothe.UpperChaos.Q0GaussPhysicalGroup003.checked, Grothe.UpperChaos.Q0GaussPhysicalGroup004.checked, Grothe.UpperChaos.Q0GaussPhysicalGroup005.checked, Grothe.UpperChaos.Q0GaussPhysicalGroup006.checked, Grothe.UpperChaos.Q0GaussPhysicalGroup007.checked, Grothe.UpperChaos.Q0GaussPhysicalGroup008.checked, Grothe.UpperChaos.Q0GaussPhysicalGroup009.checked, Grothe.UpperChaos.Q0GaussPhysicalGroup010.checked, Grothe.UpperChaos.Q0GaussPhysicalGroup011.checked, Grothe.UpperChaos.Q0GaussPhysicalGroup012.checked, Grothe.UpperChaos.Q0GaussPhysicalGroup013.checked, Grothe.UpperChaos.Q0GaussPhysicalGroup014.checked, Grothe.UpperChaos.Q0GaussPhysicalGroup015.checked, Grothe.UpperChaos.Q0GaussPhysicalGroup016.checked, Grothe.UpperChaos.Q0GaussPhysicalGroup017.checked, Grothe.UpperChaos.Q0GaussPhysicalGroup018.checked, Grothe.UpperChaos.Q0GaussPhysicalGroup019.checked, Grothe.UpperChaos.Q0GaussPhysicalGroup020.checked, Grothe.UpperChaos.Q0GaussPhysicalGroup021.checked, Bool.and_self]

theorem each_valid (r : Row) (hr : r ∈ rows) : valid r = true := (List.all_eq_true.mp checked) r hr

theorem projection :
    rows.map (fun r => (r.index, r.panel, r.rule, r.physicalLower, r.physicalUpperWeight)) =
      (Grothe.UpperChaos.Q0NodeMassAll.rows).map (fun r => (r.index, r.panel, r.rule, r.nodeLower, r.weightUpper)) := by
  simp only [rows, Grothe.UpperChaos.Q0NodeMassAll.rows, List.map_append, Grothe.UpperChaos.Q0GaussPhysicalGroup000.projection, Grothe.UpperChaos.Q0GaussPhysicalGroup001.projection, Grothe.UpperChaos.Q0GaussPhysicalGroup002.projection, Grothe.UpperChaos.Q0GaussPhysicalGroup003.projection, Grothe.UpperChaos.Q0GaussPhysicalGroup004.projection, Grothe.UpperChaos.Q0GaussPhysicalGroup005.projection, Grothe.UpperChaos.Q0GaussPhysicalGroup006.projection, Grothe.UpperChaos.Q0GaussPhysicalGroup007.projection, Grothe.UpperChaos.Q0GaussPhysicalGroup008.projection, Grothe.UpperChaos.Q0GaussPhysicalGroup009.projection, Grothe.UpperChaos.Q0GaussPhysicalGroup010.projection, Grothe.UpperChaos.Q0GaussPhysicalGroup011.projection, Grothe.UpperChaos.Q0GaussPhysicalGroup012.projection, Grothe.UpperChaos.Q0GaussPhysicalGroup013.projection, Grothe.UpperChaos.Q0GaussPhysicalGroup014.projection, Grothe.UpperChaos.Q0GaussPhysicalGroup015.projection, Grothe.UpperChaos.Q0GaussPhysicalGroup016.projection, Grothe.UpperChaos.Q0GaussPhysicalGroup017.projection, Grothe.UpperChaos.Q0GaussPhysicalGroup018.projection, Grothe.UpperChaos.Q0GaussPhysicalGroup019.projection, Grothe.UpperChaos.Q0GaussPhysicalGroup020.projection, Grothe.UpperChaos.Q0GaussPhysicalGroup021.projection]

end Grothe.UpperChaos.Q0GaussPhysicalAll
