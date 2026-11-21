import Grothe.UpperReplacement.WideFacts
import Grothe.UpperReplacement.TailInputs
import Grothe.UpperReplacement.TailFacts.Numerics
import Grothe.UpperReplacement.TailFacts.Channel01
import Grothe.UpperReplacement.TailFacts.Channel02
import Grothe.UpperReplacement.TailFacts.Channel03
import Grothe.UpperReplacement.TailFacts.Channel04
import Grothe.UpperReplacement.TailFacts.Channel05
import Grothe.UpperReplacement.TailFacts.Channel06
import Grothe.UpperReplacement.TailFacts.Channel07
import Grothe.UpperReplacement.TailFacts.Channel08
import Grothe.UpperReplacement.TailFacts.Channel09
import Grothe.UpperReplacement.TailFacts.Channel10
import Grothe.UpperReplacement.TailFacts.Channel11
import Grothe.UpperReplacement.TailFacts.Channel12
import Grothe.UpperReplacement.TailFacts.Channel13
import Grothe.UpperReplacement.TailFacts.Channel14
import Grothe.UpperReplacement.TailFacts.Channel15
import Grothe.UpperReplacement.TailFacts.Channel16
import Grothe.UpperReplacement.TailFacts.Channel17

set_option warningAsError true

/-! All closed contour facts, assembled without a numerical premise. Agent-ID: codex-a7c4, gemini-1aa9. -/

namespace Grothe.UpperReplacement.TailFacts

open CircleCheck CircleWide GrotheKernel

set_option maxRecDepth 10000 in
theorem channel00 : TailInputs.analyticChecks 0 = true := by
  have hs : TailInputs.smoothing 0 = gtSmoothingM := rfl
  have hp : (TailInputs.channelAt 0).primary = [993 / 1000, -7 / 1000] := rfl
  have hq : TailInputs.secondary (TailInputs.channelAt 0) = [0, -1] := rfl
  have hr : TailInputs.radius 0 = 1033 / 1000 := rfl
  have hr' : (1033 / 1000 : Rat) + 1 / 100000 = 103301 / 100000 := by decide +kernel
  have hj : (TailInputs.channelAt 0).schur = 9 / 20 := rfl
  have hB : TailInputs.budget 0 = 7 / 5 := rfl
  have htol : TailInputs.tolerance 0 = D * D / 30000 := rfl
  rw [TailInputs.analyticChecks, Bool.and_eq_true_iff, hs, hp, hq, hr, hr', hj, hB, htol]
  exact ⟨WideFacts.first_gt_region, WideFacts.first_gt_circle⟩

theorem all_channels : ∀ i : Fin 18, TailInputs.analyticChecks i = true :=
  Fin.cases channel00 <|
  Fin.cases channel01 <|
  Fin.cases channel02 <|
  Fin.cases channel03 <|
  Fin.cases channel04 <|
  Fin.cases channel05 <|
  Fin.cases channel06 <|
  Fin.cases channel07 <|
  Fin.cases channel08 <|
  Fin.cases channel09 <|
  Fin.cases channel10 <|
  Fin.cases channel11 <|
  Fin.cases channel12 <|
  Fin.cases channel13 <|
  Fin.cases channel14 <|
  Fin.cases channel15 <|
  Fin.cases channel16 <|
  Fin.cases channel17 <|
  fun i ↦ Fin.elim0 i

end Grothe.UpperReplacement.TailFacts
