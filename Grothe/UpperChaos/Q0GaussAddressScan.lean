import Grothe.UpperChaos.Q0GaussAddress

/-! Chunked kernel checks of all source panel offsets and sizes.
Schedule bijection and production Gauss identity remain separate.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0GaussAddressScan

open Grothe.UpperChaos.Q0GaussAddress

theorem panelBlock000_scan :
    scan panelBlock000.toList 0 = some 2724 := by
  decide +kernel

theorem panelBlock001_scan :
    scan panelBlock001.toList 2724 = some 3764 := by
  decide +kernel

theorem panelBlock002_scan :
    scan panelBlock002.toList 3764 = some 3933 := by
  decide +kernel

theorem panelBlock003_scan :
    scan panelBlock003.toList 3933 = some 3997 := by
  decide +kernel

theorem panelBlock004_scan :
    scan panelBlock004.toList 3997 = some 4481 := by
  decide +kernel

theorem panelBlock005_scan :
    scan panelBlock005.toList 4481 = some 6070 := by
  decide +kernel

theorem panelBlock006_scan :
    scan panelBlock006.toList 6070 = some 8985 := by
  decide +kernel

theorem panelBlock007_scan :
    scan panelBlock007.toList 8985 = some 10601 := by
  decide +kernel

theorem panelBlock008_scan :
    scan panelBlock008.toList 10601 = some 10929 := by
  decide +kernel

theorem panelBlock009_scan :
    scan panelBlock009.toList 10929 = some 10993 := by
  decide +kernel

theorem panelBlock010_scan :
    scan panelBlock010.toList 10993 = some 11107 := by
  decide +kernel

theorem panelBlock011_scan :
    scan panelBlock011.toList 11107 = some 12003 := by
  decide +kernel

theorem panelBlock012_scan :
    scan panelBlock012.toList 12003 = some 14601 := by
  decide +kernel

theorem panelBlock013_scan :
    scan panelBlock013.toList 14601 = some 16788 := by
  decide +kernel

theorem panelBlock014_scan :
    scan panelBlock014.toList 16788 = some 17317 := by
  decide +kernel

theorem panelBlock015_scan :
    scan panelBlock015.toList 17317 = some 17381 := by
  decide +kernel

theorem panelBlock016_scan :
    scan panelBlock016.toList 17381 = some 17445 := by
  decide +kernel

theorem panelBlock017_scan :
    scan panelBlock017.toList 17445 = some 17915 := by
  decide +kernel

theorem panelBlock018_scan :
    scan panelBlock018.toList 17915 = some 19984 := by
  decide +kernel

theorem panelBlock019_scan :
    scan panelBlock019.toList 19984 = some 21530 := by
  decide +kernel

theorem panelBlock020_scan :
    scan panelBlock020.toList 21530 = some 21577 := by
  decide +kernel

theorem sizes : panelBlocks.map Array.size = #[64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 9] := by
  decide +kernel

def sourcePanels : List Panel := panelBlock000.toList ++ panelBlock001.toList ++ panelBlock002.toList ++ panelBlock003.toList ++ panelBlock004.toList ++ panelBlock005.toList ++ panelBlock006.toList ++ panelBlock007.toList ++ panelBlock008.toList ++ panelBlock009.toList ++ panelBlock010.toList ++ panelBlock011.toList ++ panelBlock012.toList ++ panelBlock013.toList ++ panelBlock014.toList ++ panelBlock015.toList ++ panelBlock016.toList ++ panelBlock017.toList ++ panelBlock018.toList ++ panelBlock019.toList ++ panelBlock020.toList

theorem complete_scan : scan sourcePanels 0 = some 21577 := by
  simp only [sourcePanels, scan_append, panelBlock000_scan, panelBlock001_scan, panelBlock002_scan, panelBlock003_scan, panelBlock004_scan, panelBlock005_scan, panelBlock006_scan, panelBlock007_scan, panelBlock008_scan, panelBlock009_scan, panelBlock010_scan, panelBlock011_scan, panelBlock012_scan, panelBlock013_scan, panelBlock014_scan, panelBlock015_scan, panelBlock016_scan, panelBlock017_scan, panelBlock018_scan, panelBlock019_scan, panelBlock020_scan, Option.bind_some]

end Grothe.UpperChaos.Q0GaussAddressScan
