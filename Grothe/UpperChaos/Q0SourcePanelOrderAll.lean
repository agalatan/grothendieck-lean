import Grothe.UpperChaos.Q0SourcePanelOrderBlock000
import Grothe.UpperChaos.Q0SourcePanelOrderBlock001
import Grothe.UpperChaos.Q0SourcePanelOrderBlock002
import Grothe.UpperChaos.Q0SourcePanelOrderBlock003
import Grothe.UpperChaos.Q0SourcePanelOrderBlock004
import Grothe.UpperChaos.Q0SourcePanelOrderBlock005
import Grothe.UpperChaos.Q0SourcePanelOrderBlock006
import Grothe.UpperChaos.Q0SourcePanelOrderBlock007
import Grothe.UpperChaos.Q0SourcePanelOrderBlock008
import Grothe.UpperChaos.Q0SourcePanelOrderBlock009
import Grothe.UpperChaos.Q0SourcePanelOrderBlock010
import Grothe.UpperChaos.Q0SourcePanelOrderBlock011
import Grothe.UpperChaos.Q0SourcePanelOrderBlock012
import Grothe.UpperChaos.Q0SourcePanelOrderBlock013
import Grothe.UpperChaos.Q0SourcePanelOrderBlock014
import Grothe.UpperChaos.Q0SourcePanelOrderBlock015
import Grothe.UpperChaos.Q0SourcePanelOrderBlock016
import Grothe.UpperChaos.Q0SourcePanelOrderBlock017
import Grothe.UpperChaos.Q0SourcePanelOrderBlock018
import Grothe.UpperChaos.Q0SourcePanelOrderBlock019
import Grothe.UpperChaos.Q0SourcePanelOrderBlock020
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Source-panel chain assembled from independently checked
blocks and actual adjacent boundary links. No interpolation
over the three panel gaps is claimed. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0SourcePanelOrder

open Grothe.UpperChaos.Q0GaussAddress
open Grothe.UpperChaos.Q0GaussAddressScan

set_option maxRecDepth 65536
set_option maxHeartbeats 0

theorem suffix020_chain : panelBlock020.toList.IsChain follows :=
  block020_chain

theorem suffix019_chain : (panelBlock019.toList ++ panelBlock020.toList).IsChain follows := by
  apply chain_append_known panelBlock019.toList (panelBlock020.toList)
    (panelBlock019[63]'(by decide +kernel))
    (panelBlock020[0]'(by decide +kernel))
  · exact block019_chain
  · exact suffix020_chain
  · decide +kernel
  · decide +kernel
  · decide +kernel

theorem suffix018_chain : (panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList).IsChain follows := by
  apply chain_append_known panelBlock018.toList (panelBlock019.toList ++ panelBlock020.toList)
    (panelBlock018[63]'(by decide +kernel))
    (panelBlock019[0]'(by decide +kernel))
  · exact block018_chain
  · exact suffix019_chain
  · decide +kernel
  · decide +kernel
  · decide +kernel

theorem suffix017_chain : (panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList).IsChain follows := by
  apply chain_append_known panelBlock017.toList (panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList)
    (panelBlock017[63]'(by decide +kernel))
    (panelBlock018[0]'(by decide +kernel))
  · exact block017_chain
  · exact suffix018_chain
  · decide +kernel
  · decide +kernel
  · decide +kernel

theorem suffix016_chain : (panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList).IsChain follows := by
  apply chain_append_known panelBlock016.toList (panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList)
    (panelBlock016[63]'(by decide +kernel))
    (panelBlock017[0]'(by decide +kernel))
  · exact block016_chain
  · exact suffix017_chain
  · decide +kernel
  · decide +kernel
  · decide +kernel

theorem suffix015_chain : (panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList).IsChain follows := by
  apply chain_append_known panelBlock015.toList (panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList)
    (panelBlock015[63]'(by decide +kernel))
    (panelBlock016[0]'(by decide +kernel))
  · exact block015_chain
  · exact suffix016_chain
  · decide +kernel
  · decide +kernel
  · decide +kernel

theorem suffix014_chain : (panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList).IsChain follows := by
  apply chain_append_known panelBlock014.toList (panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList)
    (panelBlock014[63]'(by decide +kernel))
    (panelBlock015[0]'(by decide +kernel))
  · exact block014_chain
  · exact suffix015_chain
  · decide +kernel
  · decide +kernel
  · decide +kernel

theorem suffix013_chain : (panelBlock013.toList ++ panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList).IsChain follows := by
  apply chain_append_known panelBlock013.toList (panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList)
    (panelBlock013[63]'(by decide +kernel))
    (panelBlock014[0]'(by decide +kernel))
  · exact block013_chain
  · exact suffix014_chain
  · decide +kernel
  · decide +kernel
  · decide +kernel

theorem suffix012_chain : (panelBlock012.toList ++ panelBlock013.toList ++ panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList).IsChain follows := by
  apply chain_append_known panelBlock012.toList (panelBlock013.toList ++ panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList)
    (panelBlock012[63]'(by decide +kernel))
    (panelBlock013[0]'(by decide +kernel))
  · exact block012_chain
  · exact suffix013_chain
  · decide +kernel
  · decide +kernel
  · decide +kernel

theorem suffix011_chain : (panelBlock011.toList ++ panelBlock012.toList ++ panelBlock013.toList ++ panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList).IsChain follows := by
  apply chain_append_known panelBlock011.toList (panelBlock012.toList ++ panelBlock013.toList ++ panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList)
    (panelBlock011[63]'(by decide +kernel))
    (panelBlock012[0]'(by decide +kernel))
  · exact block011_chain
  · exact suffix012_chain
  · decide +kernel
  · decide +kernel
  · decide +kernel

theorem suffix010_chain : (panelBlock010.toList ++ panelBlock011.toList ++ panelBlock012.toList ++ panelBlock013.toList ++ panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList).IsChain follows := by
  apply chain_append_known panelBlock010.toList (panelBlock011.toList ++ panelBlock012.toList ++ panelBlock013.toList ++ panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList)
    (panelBlock010[63]'(by decide +kernel))
    (panelBlock011[0]'(by decide +kernel))
  · exact block010_chain
  · exact suffix011_chain
  · decide +kernel
  · decide +kernel
  · decide +kernel

theorem suffix009_chain : (panelBlock009.toList ++ panelBlock010.toList ++ panelBlock011.toList ++ panelBlock012.toList ++ panelBlock013.toList ++ panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList).IsChain follows := by
  apply chain_append_known panelBlock009.toList (panelBlock010.toList ++ panelBlock011.toList ++ panelBlock012.toList ++ panelBlock013.toList ++ panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList)
    (panelBlock009[63]'(by decide +kernel))
    (panelBlock010[0]'(by decide +kernel))
  · exact block009_chain
  · exact suffix010_chain
  · decide +kernel
  · decide +kernel
  · decide +kernel

theorem suffix008_chain : (panelBlock008.toList ++ panelBlock009.toList ++ panelBlock010.toList ++ panelBlock011.toList ++ panelBlock012.toList ++ panelBlock013.toList ++ panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList).IsChain follows := by
  apply chain_append_known panelBlock008.toList (panelBlock009.toList ++ panelBlock010.toList ++ panelBlock011.toList ++ panelBlock012.toList ++ panelBlock013.toList ++ panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList)
    (panelBlock008[63]'(by decide +kernel))
    (panelBlock009[0]'(by decide +kernel))
  · exact block008_chain
  · exact suffix009_chain
  · decide +kernel
  · decide +kernel
  · decide +kernel

theorem suffix007_chain : (panelBlock007.toList ++ panelBlock008.toList ++ panelBlock009.toList ++ panelBlock010.toList ++ panelBlock011.toList ++ panelBlock012.toList ++ panelBlock013.toList ++ panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList).IsChain follows := by
  apply chain_append_known panelBlock007.toList (panelBlock008.toList ++ panelBlock009.toList ++ panelBlock010.toList ++ panelBlock011.toList ++ panelBlock012.toList ++ panelBlock013.toList ++ panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList)
    (panelBlock007[63]'(by decide +kernel))
    (panelBlock008[0]'(by decide +kernel))
  · exact block007_chain
  · exact suffix008_chain
  · decide +kernel
  · decide +kernel
  · decide +kernel

theorem suffix006_chain : (panelBlock006.toList ++ panelBlock007.toList ++ panelBlock008.toList ++ panelBlock009.toList ++ panelBlock010.toList ++ panelBlock011.toList ++ panelBlock012.toList ++ panelBlock013.toList ++ panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList).IsChain follows := by
  apply chain_append_known panelBlock006.toList (panelBlock007.toList ++ panelBlock008.toList ++ panelBlock009.toList ++ panelBlock010.toList ++ panelBlock011.toList ++ panelBlock012.toList ++ panelBlock013.toList ++ panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList)
    (panelBlock006[63]'(by decide +kernel))
    (panelBlock007[0]'(by decide +kernel))
  · exact block006_chain
  · exact suffix007_chain
  · decide +kernel
  · decide +kernel
  · decide +kernel

theorem suffix005_chain : (panelBlock005.toList ++ panelBlock006.toList ++ panelBlock007.toList ++ panelBlock008.toList ++ panelBlock009.toList ++ panelBlock010.toList ++ panelBlock011.toList ++ panelBlock012.toList ++ panelBlock013.toList ++ panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList).IsChain follows := by
  apply chain_append_known panelBlock005.toList (panelBlock006.toList ++ panelBlock007.toList ++ panelBlock008.toList ++ panelBlock009.toList ++ panelBlock010.toList ++ panelBlock011.toList ++ panelBlock012.toList ++ panelBlock013.toList ++ panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList)
    (panelBlock005[63]'(by decide +kernel))
    (panelBlock006[0]'(by decide +kernel))
  · exact block005_chain
  · exact suffix006_chain
  · decide +kernel
  · decide +kernel
  · decide +kernel

theorem suffix004_chain : (panelBlock004.toList ++ panelBlock005.toList ++ panelBlock006.toList ++ panelBlock007.toList ++ panelBlock008.toList ++ panelBlock009.toList ++ panelBlock010.toList ++ panelBlock011.toList ++ panelBlock012.toList ++ panelBlock013.toList ++ panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList).IsChain follows := by
  apply chain_append_known panelBlock004.toList (panelBlock005.toList ++ panelBlock006.toList ++ panelBlock007.toList ++ panelBlock008.toList ++ panelBlock009.toList ++ panelBlock010.toList ++ panelBlock011.toList ++ panelBlock012.toList ++ panelBlock013.toList ++ panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList)
    (panelBlock004[63]'(by decide +kernel))
    (panelBlock005[0]'(by decide +kernel))
  · exact block004_chain
  · exact suffix005_chain
  · decide +kernel
  · decide +kernel
  · decide +kernel

theorem suffix003_chain : (panelBlock003.toList ++ panelBlock004.toList ++ panelBlock005.toList ++ panelBlock006.toList ++ panelBlock007.toList ++ panelBlock008.toList ++ panelBlock009.toList ++ panelBlock010.toList ++ panelBlock011.toList ++ panelBlock012.toList ++ panelBlock013.toList ++ panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList).IsChain follows := by
  apply chain_append_known panelBlock003.toList (panelBlock004.toList ++ panelBlock005.toList ++ panelBlock006.toList ++ panelBlock007.toList ++ panelBlock008.toList ++ panelBlock009.toList ++ panelBlock010.toList ++ panelBlock011.toList ++ panelBlock012.toList ++ panelBlock013.toList ++ panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList)
    (panelBlock003[63]'(by decide +kernel))
    (panelBlock004[0]'(by decide +kernel))
  · exact block003_chain
  · exact suffix004_chain
  · decide +kernel
  · decide +kernel
  · decide +kernel

theorem suffix002_chain : (panelBlock002.toList ++ panelBlock003.toList ++ panelBlock004.toList ++ panelBlock005.toList ++ panelBlock006.toList ++ panelBlock007.toList ++ panelBlock008.toList ++ panelBlock009.toList ++ panelBlock010.toList ++ panelBlock011.toList ++ panelBlock012.toList ++ panelBlock013.toList ++ panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList).IsChain follows := by
  apply chain_append_known panelBlock002.toList (panelBlock003.toList ++ panelBlock004.toList ++ panelBlock005.toList ++ panelBlock006.toList ++ panelBlock007.toList ++ panelBlock008.toList ++ panelBlock009.toList ++ panelBlock010.toList ++ panelBlock011.toList ++ panelBlock012.toList ++ panelBlock013.toList ++ panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList)
    (panelBlock002[63]'(by decide +kernel))
    (panelBlock003[0]'(by decide +kernel))
  · exact block002_chain
  · exact suffix003_chain
  · decide +kernel
  · decide +kernel
  · decide +kernel

theorem suffix001_chain : (panelBlock001.toList ++ panelBlock002.toList ++ panelBlock003.toList ++ panelBlock004.toList ++ panelBlock005.toList ++ panelBlock006.toList ++ panelBlock007.toList ++ panelBlock008.toList ++ panelBlock009.toList ++ panelBlock010.toList ++ panelBlock011.toList ++ panelBlock012.toList ++ panelBlock013.toList ++ panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList).IsChain follows := by
  apply chain_append_known panelBlock001.toList (panelBlock002.toList ++ panelBlock003.toList ++ panelBlock004.toList ++ panelBlock005.toList ++ panelBlock006.toList ++ panelBlock007.toList ++ panelBlock008.toList ++ panelBlock009.toList ++ panelBlock010.toList ++ panelBlock011.toList ++ panelBlock012.toList ++ panelBlock013.toList ++ panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList)
    (panelBlock001[63]'(by decide +kernel))
    (panelBlock002[0]'(by decide +kernel))
  · exact block001_chain
  · exact suffix002_chain
  · decide +kernel
  · decide +kernel
  · decide +kernel

theorem suffix000_chain : (panelBlock000.toList ++ panelBlock001.toList ++ panelBlock002.toList ++ panelBlock003.toList ++ panelBlock004.toList ++ panelBlock005.toList ++ panelBlock006.toList ++ panelBlock007.toList ++ panelBlock008.toList ++ panelBlock009.toList ++ panelBlock010.toList ++ panelBlock011.toList ++ panelBlock012.toList ++ panelBlock013.toList ++ panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList).IsChain follows := by
  apply chain_append_known panelBlock000.toList (panelBlock001.toList ++ panelBlock002.toList ++ panelBlock003.toList ++ panelBlock004.toList ++ panelBlock005.toList ++ panelBlock006.toList ++ panelBlock007.toList ++ panelBlock008.toList ++ panelBlock009.toList ++ panelBlock010.toList ++ panelBlock011.toList ++ panelBlock012.toList ++ panelBlock013.toList ++ panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList)
    (panelBlock000[63]'(by decide +kernel))
    (panelBlock001[0]'(by decide +kernel))
  · exact block000_chain
  · exact suffix001_chain
  · decide +kernel
  · decide +kernel
  · decide +kernel

/-- All actual source panels are ordered and nonoverlapping. -/
theorem source_panels_chain : sourcePanels.IsChain follows := by
  simpa only [sourcePanels] using suffix000_chain

/-- Any two source panels in list order are nonoverlapping. -/
theorem source_panels_pairwise : sourcePanels.Pairwise follows :=
  List.isChain_iff_pairwise.mp source_panels_chain

/-- Source panel positions preserve the physical ordering. -/
theorem panel_hi_le_of_index_lt (i j : Fin sourcePanels.length)
    (hij : i.val < j.val) :
    (sourcePanels.get i).hi ≤ (sourcePanels.get j).lo := by
  have h := source_panels_pairwise.rel_getElem_of_lt i.isLt j.isLt hij
  exact h.1

end Grothe.UpperChaos.Q0SourcePanelOrder

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0SourcePanelOrder.source_panels_chain,
      ``Grothe.UpperChaos.Q0SourcePanelOrder.source_panels_pairwise,
      ``Grothe.UpperChaos.Q0SourcePanelOrder.panel_hi_le_of_index_lt] do
    let dependencies ← Lean.collectAxioms target
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
