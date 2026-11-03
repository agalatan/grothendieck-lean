import Grothe.UpperChaos.Q0GaussAddressGroup020
import Grothe.UpperChaos.Q0GaussPhysicalGroup021

/-! Generated safe source-panel checks. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0GaussAddressGroup021

open Grothe.UpperChaos.Q0GaussAddress

theorem checked0 : (Grothe.UpperChaos.Q0GaussPhysicalGroup021.rows0).all addressOK = true := by
  decide +kernel

theorem checked : (Grothe.UpperChaos.Q0GaussPhysicalGroup021.rows).all addressOK = true := by
  simp only [Grothe.UpperChaos.Q0GaussPhysicalGroup021.rows, checked0]

end Grothe.UpperChaos.Q0GaussAddressGroup021
