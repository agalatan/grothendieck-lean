import Grothe.UpperChaos.OriginalRow227RootLookup

/-! Generated root binding. Reuses every original named interval
and checked fact, without repeating root arithmetic or evaluating a large list.
Agent-ID: codex-aa04. Refs #293, #21. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227RootBindings09
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227RootLookup OriginalRow227TriangleShared

theorem S_eq_root289 : S 289 = OriginalRow227TriangleRoots09.root289 := rfl

theorem root289_checked : sqrtCheck 289 (S 289) = true := by
  rw [S_eq_root289]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨0, by decide⟩

theorem root289_pos : 0 < (S 289).lo.toRat := by
  rw [S_eq_root289]
  exact OriginalRow227TriangleRoots09.root289_pos

theorem product289_pos : 0 < (roundedMul (-768) shift (S 289)).lo.toRat := by
  rw [S_eq_root289]
  exact OriginalRow227TriangleRoots09.product289_pos

theorem S_eq_root290 : S 290 = OriginalRow227TriangleRoots09.root290 := rfl

theorem root290_checked : sqrtCheck 290 (S 290) = true := by
  rw [S_eq_root290]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨1, by decide⟩

theorem root290_pos : 0 < (S 290).lo.toRat := by
  rw [S_eq_root290]
  exact OriginalRow227TriangleRoots09.root290_pos

theorem product290_pos : 0 < (roundedMul (-768) shift (S 290)).lo.toRat := by
  rw [S_eq_root290]
  exact OriginalRow227TriangleRoots09.product290_pos

theorem S_eq_root291 : S 291 = OriginalRow227TriangleRoots09.root291 := rfl

theorem root291_checked : sqrtCheck 291 (S 291) = true := by
  rw [S_eq_root291]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨2, by decide⟩

theorem root291_pos : 0 < (S 291).lo.toRat := by
  rw [S_eq_root291]
  exact OriginalRow227TriangleRoots09.root291_pos

theorem product291_pos : 0 < (roundedMul (-768) shift (S 291)).lo.toRat := by
  rw [S_eq_root291]
  exact OriginalRow227TriangleRoots09.product291_pos

theorem S_eq_root292 : S 292 = OriginalRow227TriangleRoots09.root292 := rfl

theorem root292_checked : sqrtCheck 292 (S 292) = true := by
  rw [S_eq_root292]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨3, by decide⟩

theorem root292_pos : 0 < (S 292).lo.toRat := by
  rw [S_eq_root292]
  exact OriginalRow227TriangleRoots09.root292_pos

theorem product292_pos : 0 < (roundedMul (-768) shift (S 292)).lo.toRat := by
  rw [S_eq_root292]
  exact OriginalRow227TriangleRoots09.product292_pos

theorem S_eq_root293 : S 293 = OriginalRow227TriangleRoots09.root293 := rfl

theorem root293_checked : sqrtCheck 293 (S 293) = true := by
  rw [S_eq_root293]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨4, by decide⟩

theorem root293_pos : 0 < (S 293).lo.toRat := by
  rw [S_eq_root293]
  exact OriginalRow227TriangleRoots09.root293_pos

theorem product293_pos : 0 < (roundedMul (-768) shift (S 293)).lo.toRat := by
  rw [S_eq_root293]
  exact OriginalRow227TriangleRoots09.product293_pos

theorem S_eq_root294 : S 294 = OriginalRow227TriangleRoots09.root294 := rfl

theorem root294_checked : sqrtCheck 294 (S 294) = true := by
  rw [S_eq_root294]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨5, by decide⟩

theorem root294_pos : 0 < (S 294).lo.toRat := by
  rw [S_eq_root294]
  exact OriginalRow227TriangleRoots09.root294_pos

theorem product294_pos : 0 < (roundedMul (-768) shift (S 294)).lo.toRat := by
  rw [S_eq_root294]
  exact OriginalRow227TriangleRoots09.product294_pos

theorem S_eq_root295 : S 295 = OriginalRow227TriangleRoots09.root295 := rfl

theorem root295_checked : sqrtCheck 295 (S 295) = true := by
  rw [S_eq_root295]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨6, by decide⟩

theorem root295_pos : 0 < (S 295).lo.toRat := by
  rw [S_eq_root295]
  exact OriginalRow227TriangleRoots09.root295_pos

theorem product295_pos : 0 < (roundedMul (-768) shift (S 295)).lo.toRat := by
  rw [S_eq_root295]
  exact OriginalRow227TriangleRoots09.product295_pos

theorem S_eq_root296 : S 296 = OriginalRow227TriangleRoots09.root296 := rfl

theorem root296_checked : sqrtCheck 296 (S 296) = true := by
  rw [S_eq_root296]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨7, by decide⟩

theorem root296_pos : 0 < (S 296).lo.toRat := by
  rw [S_eq_root296]
  exact OriginalRow227TriangleRoots09.root296_pos

theorem product296_pos : 0 < (roundedMul (-768) shift (S 296)).lo.toRat := by
  rw [S_eq_root296]
  exact OriginalRow227TriangleRoots09.product296_pos

theorem S_eq_root297 : S 297 = OriginalRow227TriangleRoots09.root297 := rfl

theorem root297_checked : sqrtCheck 297 (S 297) = true := by
  rw [S_eq_root297]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨8, by decide⟩

theorem root297_pos : 0 < (S 297).lo.toRat := by
  rw [S_eq_root297]
  exact OriginalRow227TriangleRoots09.root297_pos

theorem product297_pos : 0 < (roundedMul (-768) shift (S 297)).lo.toRat := by
  rw [S_eq_root297]
  exact OriginalRow227TriangleRoots09.product297_pos

theorem S_eq_root298 : S 298 = OriginalRow227TriangleRoots09.root298 := rfl

theorem root298_checked : sqrtCheck 298 (S 298) = true := by
  rw [S_eq_root298]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨9, by decide⟩

theorem root298_pos : 0 < (S 298).lo.toRat := by
  rw [S_eq_root298]
  exact OriginalRow227TriangleRoots09.root298_pos

theorem product298_pos : 0 < (roundedMul (-768) shift (S 298)).lo.toRat := by
  rw [S_eq_root298]
  exact OriginalRow227TriangleRoots09.product298_pos

theorem S_eq_root299 : S 299 = OriginalRow227TriangleRoots09.root299 := rfl

theorem root299_checked : sqrtCheck 299 (S 299) = true := by
  rw [S_eq_root299]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨10, by decide⟩

theorem root299_pos : 0 < (S 299).lo.toRat := by
  rw [S_eq_root299]
  exact OriginalRow227TriangleRoots09.root299_pos

theorem product299_pos : 0 < (roundedMul (-768) shift (S 299)).lo.toRat := by
  rw [S_eq_root299]
  exact OriginalRow227TriangleRoots09.product299_pos

theorem S_eq_root300 : S 300 = OriginalRow227TriangleRoots09.root300 := rfl

theorem root300_checked : sqrtCheck 300 (S 300) = true := by
  rw [S_eq_root300]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨11, by decide⟩

theorem root300_pos : 0 < (S 300).lo.toRat := by
  rw [S_eq_root300]
  exact OriginalRow227TriangleRoots09.root300_pos

theorem product300_pos : 0 < (roundedMul (-768) shift (S 300)).lo.toRat := by
  rw [S_eq_root300]
  exact OriginalRow227TriangleRoots09.product300_pos

theorem S_eq_root301 : S 301 = OriginalRow227TriangleRoots09.root301 := rfl

theorem root301_checked : sqrtCheck 301 (S 301) = true := by
  rw [S_eq_root301]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨12, by decide⟩

theorem root301_pos : 0 < (S 301).lo.toRat := by
  rw [S_eq_root301]
  exact OriginalRow227TriangleRoots09.root301_pos

theorem product301_pos : 0 < (roundedMul (-768) shift (S 301)).lo.toRat := by
  rw [S_eq_root301]
  exact OriginalRow227TriangleRoots09.product301_pos

theorem S_eq_root302 : S 302 = OriginalRow227TriangleRoots09.root302 := rfl

theorem root302_checked : sqrtCheck 302 (S 302) = true := by
  rw [S_eq_root302]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨13, by decide⟩

theorem root302_pos : 0 < (S 302).lo.toRat := by
  rw [S_eq_root302]
  exact OriginalRow227TriangleRoots09.root302_pos

theorem product302_pos : 0 < (roundedMul (-768) shift (S 302)).lo.toRat := by
  rw [S_eq_root302]
  exact OriginalRow227TriangleRoots09.product302_pos

theorem S_eq_root303 : S 303 = OriginalRow227TriangleRoots09.root303 := rfl

theorem root303_checked : sqrtCheck 303 (S 303) = true := by
  rw [S_eq_root303]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨14, by decide⟩

theorem root303_pos : 0 < (S 303).lo.toRat := by
  rw [S_eq_root303]
  exact OriginalRow227TriangleRoots09.root303_pos

theorem product303_pos : 0 < (roundedMul (-768) shift (S 303)).lo.toRat := by
  rw [S_eq_root303]
  exact OriginalRow227TriangleRoots09.product303_pos

theorem S_eq_root304 : S 304 = OriginalRow227TriangleRoots09.root304 := rfl

theorem root304_checked : sqrtCheck 304 (S 304) = true := by
  rw [S_eq_root304]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨15, by decide⟩

theorem root304_pos : 0 < (S 304).lo.toRat := by
  rw [S_eq_root304]
  exact OriginalRow227TriangleRoots09.root304_pos

theorem product304_pos : 0 < (roundedMul (-768) shift (S 304)).lo.toRat := by
  rw [S_eq_root304]
  exact OriginalRow227TriangleRoots09.product304_pos

theorem S_eq_root305 : S 305 = OriginalRow227TriangleRoots09.root305 := rfl

theorem root305_checked : sqrtCheck 305 (S 305) = true := by
  rw [S_eq_root305]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨16, by decide⟩

theorem root305_pos : 0 < (S 305).lo.toRat := by
  rw [S_eq_root305]
  exact OriginalRow227TriangleRoots09.root305_pos

theorem product305_pos : 0 < (roundedMul (-768) shift (S 305)).lo.toRat := by
  rw [S_eq_root305]
  exact OriginalRow227TriangleRoots09.product305_pos

theorem S_eq_root306 : S 306 = OriginalRow227TriangleRoots09.root306 := rfl

theorem root306_checked : sqrtCheck 306 (S 306) = true := by
  rw [S_eq_root306]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨17, by decide⟩

theorem root306_pos : 0 < (S 306).lo.toRat := by
  rw [S_eq_root306]
  exact OriginalRow227TriangleRoots09.root306_pos

theorem product306_pos : 0 < (roundedMul (-768) shift (S 306)).lo.toRat := by
  rw [S_eq_root306]
  exact OriginalRow227TriangleRoots09.product306_pos

theorem S_eq_root307 : S 307 = OriginalRow227TriangleRoots09.root307 := rfl

theorem root307_checked : sqrtCheck 307 (S 307) = true := by
  rw [S_eq_root307]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨18, by decide⟩

theorem root307_pos : 0 < (S 307).lo.toRat := by
  rw [S_eq_root307]
  exact OriginalRow227TriangleRoots09.root307_pos

theorem product307_pos : 0 < (roundedMul (-768) shift (S 307)).lo.toRat := by
  rw [S_eq_root307]
  exact OriginalRow227TriangleRoots09.product307_pos

theorem S_eq_root308 : S 308 = OriginalRow227TriangleRoots09.root308 := rfl

theorem root308_checked : sqrtCheck 308 (S 308) = true := by
  rw [S_eq_root308]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨19, by decide⟩

theorem root308_pos : 0 < (S 308).lo.toRat := by
  rw [S_eq_root308]
  exact OriginalRow227TriangleRoots09.root308_pos

theorem product308_pos : 0 < (roundedMul (-768) shift (S 308)).lo.toRat := by
  rw [S_eq_root308]
  exact OriginalRow227TriangleRoots09.product308_pos

theorem S_eq_root309 : S 309 = OriginalRow227TriangleRoots09.root309 := rfl

theorem root309_checked : sqrtCheck 309 (S 309) = true := by
  rw [S_eq_root309]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨20, by decide⟩

theorem root309_pos : 0 < (S 309).lo.toRat := by
  rw [S_eq_root309]
  exact OriginalRow227TriangleRoots09.root309_pos

theorem product309_pos : 0 < (roundedMul (-768) shift (S 309)).lo.toRat := by
  rw [S_eq_root309]
  exact OriginalRow227TriangleRoots09.product309_pos

theorem S_eq_root310 : S 310 = OriginalRow227TriangleRoots09.root310 := rfl

theorem root310_checked : sqrtCheck 310 (S 310) = true := by
  rw [S_eq_root310]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨21, by decide⟩

theorem root310_pos : 0 < (S 310).lo.toRat := by
  rw [S_eq_root310]
  exact OriginalRow227TriangleRoots09.root310_pos

theorem product310_pos : 0 < (roundedMul (-768) shift (S 310)).lo.toRat := by
  rw [S_eq_root310]
  exact OriginalRow227TriangleRoots09.product310_pos

theorem S_eq_root311 : S 311 = OriginalRow227TriangleRoots09.root311 := rfl

theorem root311_checked : sqrtCheck 311 (S 311) = true := by
  rw [S_eq_root311]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨22, by decide⟩

theorem root311_pos : 0 < (S 311).lo.toRat := by
  rw [S_eq_root311]
  exact OriginalRow227TriangleRoots09.root311_pos

theorem product311_pos : 0 < (roundedMul (-768) shift (S 311)).lo.toRat := by
  rw [S_eq_root311]
  exact OriginalRow227TriangleRoots09.product311_pos

theorem S_eq_root312 : S 312 = OriginalRow227TriangleRoots09.root312 := rfl

theorem root312_checked : sqrtCheck 312 (S 312) = true := by
  rw [S_eq_root312]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨23, by decide⟩

theorem root312_pos : 0 < (S 312).lo.toRat := by
  rw [S_eq_root312]
  exact OriginalRow227TriangleRoots09.root312_pos

theorem product312_pos : 0 < (roundedMul (-768) shift (S 312)).lo.toRat := by
  rw [S_eq_root312]
  exact OriginalRow227TriangleRoots09.product312_pos

theorem S_eq_root313 : S 313 = OriginalRow227TriangleRoots09.root313 := rfl

theorem root313_checked : sqrtCheck 313 (S 313) = true := by
  rw [S_eq_root313]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨24, by decide⟩

theorem root313_pos : 0 < (S 313).lo.toRat := by
  rw [S_eq_root313]
  exact OriginalRow227TriangleRoots09.root313_pos

theorem product313_pos : 0 < (roundedMul (-768) shift (S 313)).lo.toRat := by
  rw [S_eq_root313]
  exact OriginalRow227TriangleRoots09.product313_pos

theorem S_eq_root314 : S 314 = OriginalRow227TriangleRoots09.root314 := rfl

theorem root314_checked : sqrtCheck 314 (S 314) = true := by
  rw [S_eq_root314]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨25, by decide⟩

theorem root314_pos : 0 < (S 314).lo.toRat := by
  rw [S_eq_root314]
  exact OriginalRow227TriangleRoots09.root314_pos

theorem product314_pos : 0 < (roundedMul (-768) shift (S 314)).lo.toRat := by
  rw [S_eq_root314]
  exact OriginalRow227TriangleRoots09.product314_pos

theorem S_eq_root315 : S 315 = OriginalRow227TriangleRoots09.root315 := rfl

theorem root315_checked : sqrtCheck 315 (S 315) = true := by
  rw [S_eq_root315]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨26, by decide⟩

theorem root315_pos : 0 < (S 315).lo.toRat := by
  rw [S_eq_root315]
  exact OriginalRow227TriangleRoots09.root315_pos

theorem product315_pos : 0 < (roundedMul (-768) shift (S 315)).lo.toRat := by
  rw [S_eq_root315]
  exact OriginalRow227TriangleRoots09.product315_pos

theorem S_eq_root316 : S 316 = OriginalRow227TriangleRoots09.root316 := rfl

theorem root316_checked : sqrtCheck 316 (S 316) = true := by
  rw [S_eq_root316]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨27, by decide⟩

theorem root316_pos : 0 < (S 316).lo.toRat := by
  rw [S_eq_root316]
  exact OriginalRow227TriangleRoots09.root316_pos

theorem product316_pos : 0 < (roundedMul (-768) shift (S 316)).lo.toRat := by
  rw [S_eq_root316]
  exact OriginalRow227TriangleRoots09.product316_pos

theorem S_eq_root317 : S 317 = OriginalRow227TriangleRoots09.root317 := rfl

theorem root317_checked : sqrtCheck 317 (S 317) = true := by
  rw [S_eq_root317]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨28, by decide⟩

theorem root317_pos : 0 < (S 317).lo.toRat := by
  rw [S_eq_root317]
  exact OriginalRow227TriangleRoots09.root317_pos

theorem product317_pos : 0 < (roundedMul (-768) shift (S 317)).lo.toRat := by
  rw [S_eq_root317]
  exact OriginalRow227TriangleRoots09.product317_pos

theorem S_eq_root318 : S 318 = OriginalRow227TriangleRoots09.root318 := rfl

theorem root318_checked : sqrtCheck 318 (S 318) = true := by
  rw [S_eq_root318]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨29, by decide⟩

theorem root318_pos : 0 < (S 318).lo.toRat := by
  rw [S_eq_root318]
  exact OriginalRow227TriangleRoots09.root318_pos

theorem product318_pos : 0 < (roundedMul (-768) shift (S 318)).lo.toRat := by
  rw [S_eq_root318]
  exact OriginalRow227TriangleRoots09.product318_pos

theorem S_eq_root319 : S 319 = OriginalRow227TriangleRoots09.root319 := rfl

theorem root319_checked : sqrtCheck 319 (S 319) = true := by
  rw [S_eq_root319]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨30, by decide⟩

theorem root319_pos : 0 < (S 319).lo.toRat := by
  rw [S_eq_root319]
  exact OriginalRow227TriangleRoots09.root319_pos

theorem product319_pos : 0 < (roundedMul (-768) shift (S 319)).lo.toRat := by
  rw [S_eq_root319]
  exact OriginalRow227TriangleRoots09.product319_pos

theorem S_eq_root320 : S 320 = OriginalRow227TriangleRoots09.root320 := rfl

theorem root320_checked : sqrtCheck 320 (S 320) = true := by
  rw [S_eq_root320]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots09.entries OriginalRow227TriangleRoots09.checked ⟨31, by decide⟩

theorem root320_pos : 0 < (S 320).lo.toRat := by
  rw [S_eq_root320]
  exact OriginalRow227TriangleRoots09.root320_pos

theorem product320_pos : 0 < (roundedMul (-768) shift (S 320)).lo.toRat := by
  rw [S_eq_root320]
  exact OriginalRow227TriangleRoots09.product320_pos

end Grothe.UpperChaos.OriginalRow227RootBindings09

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root289) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root289_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root289_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product289_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root290) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root290_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root290_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product290_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root291) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root291_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root291_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product291_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root292) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root292_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root292_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product292_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root293) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root293_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root293_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product293_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root294) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root294_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root294_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product294_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root295) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root295_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root295_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product295_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root296) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root296_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root296_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product296_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root297) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root297_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root297_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product297_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root298) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root298_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root298_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product298_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root299) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root299_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root299_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product299_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root300) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root300_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root300_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product300_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root301) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root301_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root301_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product301_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root302) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root302_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root302_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product302_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root303) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root303_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root303_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product303_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root304) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root304_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root304_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product304_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root305) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root305_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root305_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product305_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root306) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root306_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root306_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product306_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root307) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root307_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root307_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product307_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root308) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root308_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root308_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product308_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root309) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root309_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root309_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product309_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root310) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root310_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root310_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product310_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root311) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root311_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root311_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product311_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root312) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root312_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root312_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product312_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root313) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root313_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root313_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product313_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root314) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root314_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root314_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product314_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root315) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root315_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root315_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product315_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root316) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root316_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root316_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product316_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root317) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root317_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root317_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product317_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root318) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root318_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root318_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product318_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root319) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root319_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root319_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product319_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.S_eq_root320) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root320_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.root320_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings09.product320_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
