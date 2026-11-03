import Grothe.UpperChaos.Q0GaussAddressGroup017
import Grothe.UpperChaos.Q0GaussPhysicalGroup018

/-! Generated safe source-panel checks. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0GaussAddressGroup018

open Grothe.UpperChaos.Q0GaussAddress

theorem checked0 : (Grothe.UpperChaos.Q0GaussPhysicalGroup018.rows0).all addressOK = true := by
  decide +kernel

theorem checked1 : (Grothe.UpperChaos.Q0GaussPhysicalGroup018.rows1).all addressOK = true := by
  decide +kernel

theorem checked2 : (Grothe.UpperChaos.Q0GaussPhysicalGroup018.rows2).all addressOK = true := by
  decide +kernel

theorem checked3 : (Grothe.UpperChaos.Q0GaussPhysicalGroup018.rows3).all addressOK = true := by
  decide +kernel

theorem checked4 : (Grothe.UpperChaos.Q0GaussPhysicalGroup018.rows4).all addressOK = true := by
  decide +kernel

theorem checked5 : (Grothe.UpperChaos.Q0GaussPhysicalGroup018.rows5).all addressOK = true := by
  decide +kernel

theorem checked6 : (Grothe.UpperChaos.Q0GaussPhysicalGroup018.rows6).all addressOK = true := by
  decide +kernel

theorem checked7 : (Grothe.UpperChaos.Q0GaussPhysicalGroup018.rows7).all addressOK = true := by
  decide +kernel

theorem checked : (Grothe.UpperChaos.Q0GaussPhysicalGroup018.rows).all addressOK = true := by
  simp only [Grothe.UpperChaos.Q0GaussPhysicalGroup018.rows, List.all_append, checked0, checked1, checked2, checked3, checked4, checked5, checked6, checked7, Bool.and_self]

end Grothe.UpperChaos.Q0GaussAddressGroup018
