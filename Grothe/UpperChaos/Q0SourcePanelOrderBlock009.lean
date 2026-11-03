import Grothe.UpperChaos.Q0SourcePanelOrderCore

/-! Independently checked consecutive source-panel block 009;
gaps are allowed. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0SourcePanelOrder
open Grothe.UpperChaos.Q0GaussAddress
set_option maxRecDepth 8192
set_option maxHeartbeats 0

theorem block009_chain : panelBlock009.toList.IsChain follows := by
  decide +kernel

end Grothe.UpperChaos.Q0SourcePanelOrder
