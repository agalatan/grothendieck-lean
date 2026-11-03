import Grothe.UpperChaos.TaylorFirstPackedChunk253StructuralLeaf000

/-! The unchanged public parser on the bounded auxiliary leaf.
This does not identify any full public packed array.
Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstPackedChunk253LegacyLeaf000
open TaylorFirstPackedChunk253StructuralLeaf000
set_option maxRecDepth 65536
set_option maxHeartbeats 2000000

-- Unfold the legacy splitter by its equation theorem: the direct
-- kernel probe got stuck. Numeric semantics use the proved
-- structural bridge instead of re-evaluating the standard readers.
theorem row_fields : text.splitOn "," =
    ["2885903186414673:86", "-3854422876346929:87", "6376272631315795:89", "5971861440700005:93", "-5537370319956531:91", "-4676557471076783:184", "348313411641259:179", "-8027374037691191:176", "8805599292809165:176", "-1339191839629723:166", "8256257643515501:169", "-8600709933817137:162", "1480475769276195:160", "-4800571381504241:155", "6942283386538479:156", "-8022155488129727:150", "6633983124518213:150", "-5246445845862741:144", "2561386249731195:143", "-5534941796389907:139", "6403154547198511:139", "-4812420008632737:134", "6533371779343427:134", "-3504848590313787:129", "5501316593166933:129", "-2165421519567319:124", "7727617331252939:125", "-4586378618305531:121", "4570190457721935:120", "-4197466045046467:117", "4588980868962321:116", "-6686045881623649:114"] := by
  simp (config := { decide := true }) only
    [text, String.splitOn, String.splitOnAux.eq_1]

theorem column_fields (r : String)
    (hr : r ∈ ["2885903186414673:86", "-3854422876346929:87", "6376272631315795:89", "5971861440700005:93", "-5537370319956531:91", "-4676557471076783:184", "348313411641259:179", "-8027374037691191:176", "8805599292809165:176", "-1339191839629723:166", "8256257643515501:169", "-8600709933817137:162", "1480475769276195:160", "-4800571381504241:155", "6942283386538479:156", "-8022155488129727:150", "6633983124518213:150", "-5246445845862741:144", "2561386249731195:143", "-5534941796389907:139", "6403154547198511:139", "-4812420008632737:134", "6533371779343427:134", "-3504848590313787:129", "5501316593166933:129", "-2165421519567319:124", "7727617331252939:125", "-4586378618305531:121", "4570190457721935:120", "-4197466045046467:117", "4588980868962321:116", "-6686045881623649:114"]) :
    (r.splitOn ":").map String.toList = r.toList.splitOn ':' := by
  simp only [List.mem_cons, List.mem_singleton] at hr
  rcases hr with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  all_goals simp (config := { decide := true }) only
    [String.splitOn, String.splitOnAux.eq_1]

theorem legacy_decoded : PackedDyadic.parse 206 text = some values.toArray := by
  have hrows : (text.splitOn ",").map String.toList =
      text.toList.splitOn ',' := by
    rw [row_fields]
    decide +kernel
  have hrecords : ∀ r ∈ text.splitOn ",",
      (r.splitOn ":").map String.toList = r.toList.splitOn ':' := by
    intro r hr
    rw [row_fields] at hr
    exact column_fields r hr
  rw [PackedDyadic.Structural.parse_eq_row 206 text hrows hrecords, structural_decoded]
  rfl

end Grothe.UpperChaos.TaylorFirstPackedChunk253LegacyLeaf000

open Lean Elab Command
run_cmd do
  for ax in ← Lean.collectAxioms ``Grothe.UpperChaos.TaylorFirstPackedChunk253LegacyLeaf000.legacy_decoded do
    unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
      throwError m!"legacy leaf has forbidden axiom {ax}"
