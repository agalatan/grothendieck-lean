import Grothe.UpperChaos.OriginalRow227RootLookup

/-! Generated root binding. Reuses every original named interval
and checked fact, without repeating root arithmetic or evaluating a large list.
Agent-ID: codex-aa04. Refs #293, #21. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227RootBindings08
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227RootLookup OriginalRow227TriangleShared

theorem S_eq_root257 : S 257 = OriginalRow227TriangleRoots08.root257 := rfl

theorem root257_checked : sqrtCheck 257 (S 257) = true := by
  rw [S_eq_root257]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨0, by decide⟩

theorem root257_pos : 0 < (S 257).lo.toRat := by
  rw [S_eq_root257]
  exact OriginalRow227TriangleRoots08.root257_pos

theorem product257_pos : 0 < (roundedMul (-768) shift (S 257)).lo.toRat := by
  rw [S_eq_root257]
  exact OriginalRow227TriangleRoots08.product257_pos

theorem S_eq_root258 : S 258 = OriginalRow227TriangleRoots08.root258 := rfl

theorem root258_checked : sqrtCheck 258 (S 258) = true := by
  rw [S_eq_root258]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨1, by decide⟩

theorem root258_pos : 0 < (S 258).lo.toRat := by
  rw [S_eq_root258]
  exact OriginalRow227TriangleRoots08.root258_pos

theorem product258_pos : 0 < (roundedMul (-768) shift (S 258)).lo.toRat := by
  rw [S_eq_root258]
  exact OriginalRow227TriangleRoots08.product258_pos

theorem S_eq_root259 : S 259 = OriginalRow227TriangleRoots08.root259 := rfl

theorem root259_checked : sqrtCheck 259 (S 259) = true := by
  rw [S_eq_root259]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨2, by decide⟩

theorem root259_pos : 0 < (S 259).lo.toRat := by
  rw [S_eq_root259]
  exact OriginalRow227TriangleRoots08.root259_pos

theorem product259_pos : 0 < (roundedMul (-768) shift (S 259)).lo.toRat := by
  rw [S_eq_root259]
  exact OriginalRow227TriangleRoots08.product259_pos

theorem S_eq_root260 : S 260 = OriginalRow227TriangleRoots08.root260 := rfl

theorem root260_checked : sqrtCheck 260 (S 260) = true := by
  rw [S_eq_root260]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨3, by decide⟩

theorem root260_pos : 0 < (S 260).lo.toRat := by
  rw [S_eq_root260]
  exact OriginalRow227TriangleRoots08.root260_pos

theorem product260_pos : 0 < (roundedMul (-768) shift (S 260)).lo.toRat := by
  rw [S_eq_root260]
  exact OriginalRow227TriangleRoots08.product260_pos

theorem S_eq_root261 : S 261 = OriginalRow227TriangleRoots08.root261 := rfl

theorem root261_checked : sqrtCheck 261 (S 261) = true := by
  rw [S_eq_root261]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨4, by decide⟩

theorem root261_pos : 0 < (S 261).lo.toRat := by
  rw [S_eq_root261]
  exact OriginalRow227TriangleRoots08.root261_pos

theorem product261_pos : 0 < (roundedMul (-768) shift (S 261)).lo.toRat := by
  rw [S_eq_root261]
  exact OriginalRow227TriangleRoots08.product261_pos

theorem S_eq_root262 : S 262 = OriginalRow227TriangleRoots08.root262 := rfl

theorem root262_checked : sqrtCheck 262 (S 262) = true := by
  rw [S_eq_root262]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨5, by decide⟩

theorem root262_pos : 0 < (S 262).lo.toRat := by
  rw [S_eq_root262]
  exact OriginalRow227TriangleRoots08.root262_pos

theorem product262_pos : 0 < (roundedMul (-768) shift (S 262)).lo.toRat := by
  rw [S_eq_root262]
  exact OriginalRow227TriangleRoots08.product262_pos

theorem S_eq_root263 : S 263 = OriginalRow227TriangleRoots08.root263 := rfl

theorem root263_checked : sqrtCheck 263 (S 263) = true := by
  rw [S_eq_root263]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨6, by decide⟩

theorem root263_pos : 0 < (S 263).lo.toRat := by
  rw [S_eq_root263]
  exact OriginalRow227TriangleRoots08.root263_pos

theorem product263_pos : 0 < (roundedMul (-768) shift (S 263)).lo.toRat := by
  rw [S_eq_root263]
  exact OriginalRow227TriangleRoots08.product263_pos

theorem S_eq_root264 : S 264 = OriginalRow227TriangleRoots08.root264 := rfl

theorem root264_checked : sqrtCheck 264 (S 264) = true := by
  rw [S_eq_root264]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨7, by decide⟩

theorem root264_pos : 0 < (S 264).lo.toRat := by
  rw [S_eq_root264]
  exact OriginalRow227TriangleRoots08.root264_pos

theorem product264_pos : 0 < (roundedMul (-768) shift (S 264)).lo.toRat := by
  rw [S_eq_root264]
  exact OriginalRow227TriangleRoots08.product264_pos

theorem S_eq_root265 : S 265 = OriginalRow227TriangleRoots08.root265 := rfl

theorem root265_checked : sqrtCheck 265 (S 265) = true := by
  rw [S_eq_root265]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨8, by decide⟩

theorem root265_pos : 0 < (S 265).lo.toRat := by
  rw [S_eq_root265]
  exact OriginalRow227TriangleRoots08.root265_pos

theorem product265_pos : 0 < (roundedMul (-768) shift (S 265)).lo.toRat := by
  rw [S_eq_root265]
  exact OriginalRow227TriangleRoots08.product265_pos

theorem S_eq_root266 : S 266 = OriginalRow227TriangleRoots08.root266 := rfl

theorem root266_checked : sqrtCheck 266 (S 266) = true := by
  rw [S_eq_root266]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨9, by decide⟩

theorem root266_pos : 0 < (S 266).lo.toRat := by
  rw [S_eq_root266]
  exact OriginalRow227TriangleRoots08.root266_pos

theorem product266_pos : 0 < (roundedMul (-768) shift (S 266)).lo.toRat := by
  rw [S_eq_root266]
  exact OriginalRow227TriangleRoots08.product266_pos

theorem S_eq_root267 : S 267 = OriginalRow227TriangleRoots08.root267 := rfl

theorem root267_checked : sqrtCheck 267 (S 267) = true := by
  rw [S_eq_root267]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨10, by decide⟩

theorem root267_pos : 0 < (S 267).lo.toRat := by
  rw [S_eq_root267]
  exact OriginalRow227TriangleRoots08.root267_pos

theorem product267_pos : 0 < (roundedMul (-768) shift (S 267)).lo.toRat := by
  rw [S_eq_root267]
  exact OriginalRow227TriangleRoots08.product267_pos

theorem S_eq_root268 : S 268 = OriginalRow227TriangleRoots08.root268 := rfl

theorem root268_checked : sqrtCheck 268 (S 268) = true := by
  rw [S_eq_root268]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨11, by decide⟩

theorem root268_pos : 0 < (S 268).lo.toRat := by
  rw [S_eq_root268]
  exact OriginalRow227TriangleRoots08.root268_pos

theorem product268_pos : 0 < (roundedMul (-768) shift (S 268)).lo.toRat := by
  rw [S_eq_root268]
  exact OriginalRow227TriangleRoots08.product268_pos

theorem S_eq_root269 : S 269 = OriginalRow227TriangleRoots08.root269 := rfl

theorem root269_checked : sqrtCheck 269 (S 269) = true := by
  rw [S_eq_root269]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨12, by decide⟩

theorem root269_pos : 0 < (S 269).lo.toRat := by
  rw [S_eq_root269]
  exact OriginalRow227TriangleRoots08.root269_pos

theorem product269_pos : 0 < (roundedMul (-768) shift (S 269)).lo.toRat := by
  rw [S_eq_root269]
  exact OriginalRow227TriangleRoots08.product269_pos

theorem S_eq_root270 : S 270 = OriginalRow227TriangleRoots08.root270 := rfl

theorem root270_checked : sqrtCheck 270 (S 270) = true := by
  rw [S_eq_root270]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨13, by decide⟩

theorem root270_pos : 0 < (S 270).lo.toRat := by
  rw [S_eq_root270]
  exact OriginalRow227TriangleRoots08.root270_pos

theorem product270_pos : 0 < (roundedMul (-768) shift (S 270)).lo.toRat := by
  rw [S_eq_root270]
  exact OriginalRow227TriangleRoots08.product270_pos

theorem S_eq_root271 : S 271 = OriginalRow227TriangleRoots08.root271 := rfl

theorem root271_checked : sqrtCheck 271 (S 271) = true := by
  rw [S_eq_root271]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨14, by decide⟩

theorem root271_pos : 0 < (S 271).lo.toRat := by
  rw [S_eq_root271]
  exact OriginalRow227TriangleRoots08.root271_pos

theorem product271_pos : 0 < (roundedMul (-768) shift (S 271)).lo.toRat := by
  rw [S_eq_root271]
  exact OriginalRow227TriangleRoots08.product271_pos

theorem S_eq_root272 : S 272 = OriginalRow227TriangleRoots08.root272 := rfl

theorem root272_checked : sqrtCheck 272 (S 272) = true := by
  rw [S_eq_root272]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨15, by decide⟩

theorem root272_pos : 0 < (S 272).lo.toRat := by
  rw [S_eq_root272]
  exact OriginalRow227TriangleRoots08.root272_pos

theorem product272_pos : 0 < (roundedMul (-768) shift (S 272)).lo.toRat := by
  rw [S_eq_root272]
  exact OriginalRow227TriangleRoots08.product272_pos

theorem S_eq_root273 : S 273 = OriginalRow227TriangleRoots08.root273 := rfl

theorem root273_checked : sqrtCheck 273 (S 273) = true := by
  rw [S_eq_root273]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨16, by decide⟩

theorem root273_pos : 0 < (S 273).lo.toRat := by
  rw [S_eq_root273]
  exact OriginalRow227TriangleRoots08.root273_pos

theorem product273_pos : 0 < (roundedMul (-768) shift (S 273)).lo.toRat := by
  rw [S_eq_root273]
  exact OriginalRow227TriangleRoots08.product273_pos

theorem S_eq_root274 : S 274 = OriginalRow227TriangleRoots08.root274 := rfl

theorem root274_checked : sqrtCheck 274 (S 274) = true := by
  rw [S_eq_root274]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨17, by decide⟩

theorem root274_pos : 0 < (S 274).lo.toRat := by
  rw [S_eq_root274]
  exact OriginalRow227TriangleRoots08.root274_pos

theorem product274_pos : 0 < (roundedMul (-768) shift (S 274)).lo.toRat := by
  rw [S_eq_root274]
  exact OriginalRow227TriangleRoots08.product274_pos

theorem S_eq_root275 : S 275 = OriginalRow227TriangleRoots08.root275 := rfl

theorem root275_checked : sqrtCheck 275 (S 275) = true := by
  rw [S_eq_root275]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨18, by decide⟩

theorem root275_pos : 0 < (S 275).lo.toRat := by
  rw [S_eq_root275]
  exact OriginalRow227TriangleRoots08.root275_pos

theorem product275_pos : 0 < (roundedMul (-768) shift (S 275)).lo.toRat := by
  rw [S_eq_root275]
  exact OriginalRow227TriangleRoots08.product275_pos

theorem S_eq_root276 : S 276 = OriginalRow227TriangleRoots08.root276 := rfl

theorem root276_checked : sqrtCheck 276 (S 276) = true := by
  rw [S_eq_root276]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨19, by decide⟩

theorem root276_pos : 0 < (S 276).lo.toRat := by
  rw [S_eq_root276]
  exact OriginalRow227TriangleRoots08.root276_pos

theorem product276_pos : 0 < (roundedMul (-768) shift (S 276)).lo.toRat := by
  rw [S_eq_root276]
  exact OriginalRow227TriangleRoots08.product276_pos

theorem S_eq_root277 : S 277 = OriginalRow227TriangleRoots08.root277 := rfl

theorem root277_checked : sqrtCheck 277 (S 277) = true := by
  rw [S_eq_root277]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨20, by decide⟩

theorem root277_pos : 0 < (S 277).lo.toRat := by
  rw [S_eq_root277]
  exact OriginalRow227TriangleRoots08.root277_pos

theorem product277_pos : 0 < (roundedMul (-768) shift (S 277)).lo.toRat := by
  rw [S_eq_root277]
  exact OriginalRow227TriangleRoots08.product277_pos

theorem S_eq_root278 : S 278 = OriginalRow227TriangleRoots08.root278 := rfl

theorem root278_checked : sqrtCheck 278 (S 278) = true := by
  rw [S_eq_root278]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨21, by decide⟩

theorem root278_pos : 0 < (S 278).lo.toRat := by
  rw [S_eq_root278]
  exact OriginalRow227TriangleRoots08.root278_pos

theorem product278_pos : 0 < (roundedMul (-768) shift (S 278)).lo.toRat := by
  rw [S_eq_root278]
  exact OriginalRow227TriangleRoots08.product278_pos

theorem S_eq_root279 : S 279 = OriginalRow227TriangleRoots08.root279 := rfl

theorem root279_checked : sqrtCheck 279 (S 279) = true := by
  rw [S_eq_root279]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨22, by decide⟩

theorem root279_pos : 0 < (S 279).lo.toRat := by
  rw [S_eq_root279]
  exact OriginalRow227TriangleRoots08.root279_pos

theorem product279_pos : 0 < (roundedMul (-768) shift (S 279)).lo.toRat := by
  rw [S_eq_root279]
  exact OriginalRow227TriangleRoots08.product279_pos

theorem S_eq_root280 : S 280 = OriginalRow227TriangleRoots08.root280 := rfl

theorem root280_checked : sqrtCheck 280 (S 280) = true := by
  rw [S_eq_root280]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨23, by decide⟩

theorem root280_pos : 0 < (S 280).lo.toRat := by
  rw [S_eq_root280]
  exact OriginalRow227TriangleRoots08.root280_pos

theorem product280_pos : 0 < (roundedMul (-768) shift (S 280)).lo.toRat := by
  rw [S_eq_root280]
  exact OriginalRow227TriangleRoots08.product280_pos

theorem S_eq_root281 : S 281 = OriginalRow227TriangleRoots08.root281 := rfl

theorem root281_checked : sqrtCheck 281 (S 281) = true := by
  rw [S_eq_root281]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨24, by decide⟩

theorem root281_pos : 0 < (S 281).lo.toRat := by
  rw [S_eq_root281]
  exact OriginalRow227TriangleRoots08.root281_pos

theorem product281_pos : 0 < (roundedMul (-768) shift (S 281)).lo.toRat := by
  rw [S_eq_root281]
  exact OriginalRow227TriangleRoots08.product281_pos

theorem S_eq_root282 : S 282 = OriginalRow227TriangleRoots08.root282 := rfl

theorem root282_checked : sqrtCheck 282 (S 282) = true := by
  rw [S_eq_root282]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨25, by decide⟩

theorem root282_pos : 0 < (S 282).lo.toRat := by
  rw [S_eq_root282]
  exact OriginalRow227TriangleRoots08.root282_pos

theorem product282_pos : 0 < (roundedMul (-768) shift (S 282)).lo.toRat := by
  rw [S_eq_root282]
  exact OriginalRow227TriangleRoots08.product282_pos

theorem S_eq_root283 : S 283 = OriginalRow227TriangleRoots08.root283 := rfl

theorem root283_checked : sqrtCheck 283 (S 283) = true := by
  rw [S_eq_root283]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨26, by decide⟩

theorem root283_pos : 0 < (S 283).lo.toRat := by
  rw [S_eq_root283]
  exact OriginalRow227TriangleRoots08.root283_pos

theorem product283_pos : 0 < (roundedMul (-768) shift (S 283)).lo.toRat := by
  rw [S_eq_root283]
  exact OriginalRow227TriangleRoots08.product283_pos

theorem S_eq_root284 : S 284 = OriginalRow227TriangleRoots08.root284 := rfl

theorem root284_checked : sqrtCheck 284 (S 284) = true := by
  rw [S_eq_root284]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨27, by decide⟩

theorem root284_pos : 0 < (S 284).lo.toRat := by
  rw [S_eq_root284]
  exact OriginalRow227TriangleRoots08.root284_pos

theorem product284_pos : 0 < (roundedMul (-768) shift (S 284)).lo.toRat := by
  rw [S_eq_root284]
  exact OriginalRow227TriangleRoots08.product284_pos

theorem S_eq_root285 : S 285 = OriginalRow227TriangleRoots08.root285 := rfl

theorem root285_checked : sqrtCheck 285 (S 285) = true := by
  rw [S_eq_root285]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨28, by decide⟩

theorem root285_pos : 0 < (S 285).lo.toRat := by
  rw [S_eq_root285]
  exact OriginalRow227TriangleRoots08.root285_pos

theorem product285_pos : 0 < (roundedMul (-768) shift (S 285)).lo.toRat := by
  rw [S_eq_root285]
  exact OriginalRow227TriangleRoots08.product285_pos

theorem S_eq_root286 : S 286 = OriginalRow227TriangleRoots08.root286 := rfl

theorem root286_checked : sqrtCheck 286 (S 286) = true := by
  rw [S_eq_root286]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨29, by decide⟩

theorem root286_pos : 0 < (S 286).lo.toRat := by
  rw [S_eq_root286]
  exact OriginalRow227TriangleRoots08.root286_pos

theorem product286_pos : 0 < (roundedMul (-768) shift (S 286)).lo.toRat := by
  rw [S_eq_root286]
  exact OriginalRow227TriangleRoots08.product286_pos

theorem S_eq_root287 : S 287 = OriginalRow227TriangleRoots08.root287 := rfl

theorem root287_checked : sqrtCheck 287 (S 287) = true := by
  rw [S_eq_root287]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨30, by decide⟩

theorem root287_pos : 0 < (S 287).lo.toRat := by
  rw [S_eq_root287]
  exact OriginalRow227TriangleRoots08.root287_pos

theorem product287_pos : 0 < (roundedMul (-768) shift (S 287)).lo.toRat := by
  rw [S_eq_root287]
  exact OriginalRow227TriangleRoots08.product287_pos

theorem S_eq_root288 : S 288 = OriginalRow227TriangleRoots08.root288 := rfl

theorem root288_checked : sqrtCheck 288 (S 288) = true := by
  rw [S_eq_root288]
  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)
    OriginalRow227TriangleRoots08.entries OriginalRow227TriangleRoots08.checked ⟨31, by decide⟩

theorem root288_pos : 0 < (S 288).lo.toRat := by
  rw [S_eq_root288]
  exact OriginalRow227TriangleRoots08.root288_pos

theorem product288_pos : 0 < (roundedMul (-768) shift (S 288)).lo.toRat := by
  rw [S_eq_root288]
  exact OriginalRow227TriangleRoots08.product288_pos

end Grothe.UpperChaos.OriginalRow227RootBindings08

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root257) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root257_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root257_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product257_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root258) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root258_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root258_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product258_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root259) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root259_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root259_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product259_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root260) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root260_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root260_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product260_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root261) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root261_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root261_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product261_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root262) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root262_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root262_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product262_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root263) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root263_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root263_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product263_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root264) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root264_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root264_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product264_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root265) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root265_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root265_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product265_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root266) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root266_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root266_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product266_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root267) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root267_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root267_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product267_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root268) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root268_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root268_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product268_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root269) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root269_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root269_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product269_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root270) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root270_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root270_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product270_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root271) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root271_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root271_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product271_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root272) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root272_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root272_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product272_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root273) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root273_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root273_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product273_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root274) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root274_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root274_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product274_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root275) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root275_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root275_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product275_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root276) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root276_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root276_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product276_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root277) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root277_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root277_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product277_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root278) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root278_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root278_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product278_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root279) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root279_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root279_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product279_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root280) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root280_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root280_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product280_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root281) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root281_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root281_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product281_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root282) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root282_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root282_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product282_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root283) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root283_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root283_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product283_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root284) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root284_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root284_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product284_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root285) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root285_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root285_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product285_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root286) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root286_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root286_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product286_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root287) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root287_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root287_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product287_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.S_eq_root288) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root288_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.root288_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227RootBindings08.product288_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
