import Grothe.UpperChaos.Q0GaussSelectedRulesAudit
import Grothe.UpperChaos.Q0GaussIndexedContext
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Connect safe order/rule context lookup to the same
selected-root families. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0GaussSelectedLookup

theorem order01 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[0]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule01 := by
  rfl

theorem rule01 (i : Fin 1) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule01[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule01.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule01.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule01.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule01.context_lookup i

theorem order02 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[1]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule02 := by
  rfl

theorem rule02 (i : Fin 2) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule02[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule02.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule02.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule02.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule02.context_lookup i

theorem order03 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[2]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule03 := by
  rfl

theorem rule03 (i : Fin 3) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule03[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule03.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule03.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule03.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule03.context_lookup i

theorem order04 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[3]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule04 := by
  rfl

theorem rule04 (i : Fin 4) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule04[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule04.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule04.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule04.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule04.context_lookup i

theorem order05 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[4]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule05 := by
  rfl

theorem rule05 (i : Fin 5) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule05[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule05.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule05.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule05.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule05.context_lookup i

theorem order06 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[5]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule06 := by
  rfl

theorem rule06 (i : Fin 6) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule06[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule06.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule06.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule06.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule06.context_lookup i

theorem order07 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[6]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule07 := by
  rfl

theorem rule07 (i : Fin 7) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule07[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule07.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule07.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule07.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule07.context_lookup i

theorem order08 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[7]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule08 := by
  rfl

theorem rule08 (i : Fin 8) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule08[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule08.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule08.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule08.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule08.context_lookup i

theorem order09 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[8]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule09 := by
  rfl

theorem rule09 (i : Fin 9) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule09[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule09.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule09.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule09.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule09.context_lookup i

theorem order10 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[9]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule10 := by
  rfl

theorem rule10 (i : Fin 10) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule10[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule10.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule10.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule10.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule10.context_lookup i

theorem order11 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[10]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule11 := by
  rfl

theorem rule11 (i : Fin 11) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule11[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule11.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule11.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule11.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule11.context_lookup i

theorem order12 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[11]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule12 := by
  rfl

theorem rule12 (i : Fin 12) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule12[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule12.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule12.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule12.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule12.context_lookup i

theorem order13 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[12]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule13 := by
  rfl

theorem rule13 (i : Fin 13) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule13[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule13.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule13.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule13.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule13.context_lookup i

theorem order14 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[13]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule14 := by
  rfl

theorem rule14 (i : Fin 14) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule14[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule14.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule14.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule14.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule14.context_lookup i

theorem order15 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[14]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule15 := by
  rfl

theorem rule15 (i : Fin 15) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule15[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule15.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule15.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule15.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule15.context_lookup i

theorem order16 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[15]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule16 := by
  rfl

theorem rule16 (i : Fin 16) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule16[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule16.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule16.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule16.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule16.context_lookup i

theorem order17 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[16]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule17 := by
  rfl

theorem rule17 (i : Fin 17) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule17[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule17.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule17.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule17.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule17.context_lookup i

theorem order18 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[17]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule18 := by
  rfl

theorem rule18 (i : Fin 18) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule18[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule18.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule18.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule18.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule18.context_lookup i

theorem order19 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[18]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule19 := by
  rfl

theorem rule19 (i : Fin 19) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule19[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule19.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule19.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule19.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule19.context_lookup i

theorem order20 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[19]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule20 := by
  rfl

theorem rule20 (i : Fin 20) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule20[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule20.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule20.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule20.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule20.context_lookup i

theorem order21 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[20]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule21 := by
  rfl

theorem rule21 (i : Fin 21) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule21[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule21.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule21.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule21.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule21.context_lookup i

theorem order22 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[21]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule22 := by
  rfl

theorem rule22 (i : Fin 22) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule22[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule22.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule22.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule22.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule22.context_lookup i

theorem order23 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[22]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule23 := by
  rfl

theorem rule23 (i : Fin 23) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule23[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule23.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule23.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule23.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule23.context_lookup i

theorem order24 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[23]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule24 := by
  rfl

theorem rule24 (i : Fin 24) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule24[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule24.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule24.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule24.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule24.context_lookup i

theorem order25 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[24]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule25 := by
  rfl

theorem rule25 (i : Fin 25) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule25[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule25.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule25.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule25.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule25.context_lookup i

theorem order26 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[25]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule26 := by
  rfl

theorem rule26 (i : Fin 26) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule26[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule26.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule26.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule26.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule26.context_lookup i

theorem order27 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[26]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule27 := by
  rfl

theorem rule27 (i : Fin 27) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule27[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule27.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule27.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule27.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule27.context_lookup i

theorem order28 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[27]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule28 := by
  rfl

theorem rule28 (i : Fin 28) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule28[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule28.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule28.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule28.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule28.context_lookup i

theorem order29 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[28]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule29 := by
  rfl

theorem rule29 (i : Fin 29) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule29[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule29.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule29.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule29.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule29.context_lookup i

theorem order30 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[29]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule30 := by
  rfl

theorem rule30 (i : Fin 30) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule30[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule30.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule30.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule30.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule30.context_lookup i

theorem order31 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[30]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule31 := by
  rfl

theorem rule31 (i : Fin 31) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule31[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule31.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule31.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule31.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule31.context_lookup i

theorem order32 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[31]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule32 := by
  rfl

theorem rule32 (i : Fin 32) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule32[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule32.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule32.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule32.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule32.context_lookup i

theorem order33 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[32]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule33 := by
  rfl

theorem rule33 (i : Fin 33) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule33[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule33.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule33.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule33.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule33.context_lookup i

theorem order34 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[33]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule34 := by
  rfl

theorem rule34 (i : Fin 34) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule34[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule34.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule34.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule34.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule34.context_lookup i

theorem order35 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[34]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule35 := by
  rfl

theorem rule35 (i : Fin 35) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule35[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule35.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule35.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule35.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule35.context_lookup i

theorem order36 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[35]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule36 := by
  rfl

theorem rule36 (i : Fin 36) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule36[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule36.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule36.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule36.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule36.context_lookup i

theorem order37 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[36]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule37 := by
  rfl

theorem rule37 (i : Fin 37) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule37[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule37.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule37.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule37.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule37.context_lookup i

theorem order38 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[37]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule38 := by
  rfl

theorem rule38 (i : Fin 38) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule38[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule38.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule38.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule38.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule38.context_lookup i

theorem order39 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[38]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule39 := by
  rfl

theorem rule39 (i : Fin 39) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule39[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule39.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule39.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule39.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule39.context_lookup i

theorem order40 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[39]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule40 := by
  rfl

theorem rule40 (i : Fin 40) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule40[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule40.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule40.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule40.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule40.context_lookup i

theorem order41 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[40]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule41 := by
  rfl

theorem rule41 (i : Fin 41) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule41[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule41.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule41.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule41.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule41.context_lookup i

theorem order42 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[41]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule42 := by
  rfl

theorem rule42 (i : Fin 42) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule42[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule42.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule42.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule42.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule42.context_lookup i

theorem order43 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[42]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule43 := by
  rfl

theorem rule43 (i : Fin 43) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule43[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule43.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule43.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule43.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule43.context_lookup i

theorem order44 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[43]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule44 := by
  rfl

theorem rule44 (i : Fin 44) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule44[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule44.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule44.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule44.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule44.context_lookup i

theorem order45 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[44]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule45 := by
  rfl

theorem rule45 (i : Fin 45) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule45[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule45.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule45.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule45.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule45.context_lookup i

theorem order46 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[45]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule46 := by
  rfl

theorem rule46 (i : Fin 46) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule46[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule46.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule46.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule46.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule46.context_lookup i

theorem order47 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[46]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule47 := by
  rfl

theorem rule47 (i : Fin 47) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule47[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule47.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule47.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule47.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule47.context_lookup i

theorem order48 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[47]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule48 := by
  rfl

theorem rule48 (i : Fin 48) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule48[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule48.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule48.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule48.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule48.context_lookup i

theorem order49 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[48]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule49 := by
  rfl

theorem rule49 (i : Fin 49) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule49[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule49.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule49.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule49.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule49.context_lookup i

theorem order50 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[49]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule50 := by
  rfl

theorem rule50 (i : Fin 50) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule50[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule50.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule50.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule50.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule50.context_lookup i

theorem order51 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[50]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule51 := by
  rfl

theorem rule51 (i : Fin 51) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule51[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule51.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule51.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule51.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule51.context_lookup i

theorem order52 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[51]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule52 := by
  rfl

theorem rule52 (i : Fin 52) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule52[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule52.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule52.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule52.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule52.context_lookup i

theorem order53 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[52]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule53 := by
  rfl

theorem rule53 (i : Fin 53) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule53[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule53.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule53.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule53.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule53.context_lookup i

theorem order54 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[53]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule54 := by
  rfl

theorem rule54 (i : Fin 54) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule54[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule54.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule54.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule54.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule54.context_lookup i

theorem order55 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[54]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule55 := by
  rfl

theorem rule55 (i : Fin 55) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule55[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule55.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule55.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule55.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule55.context_lookup i

theorem order56 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[55]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule56 := by
  rfl

theorem rule56 (i : Fin 56) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule56[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule56.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule56.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule56.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule56.context_lookup i

theorem order57 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[56]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule57 := by
  rfl

theorem rule57 (i : Fin 57) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule57[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule57.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule57.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule57.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule57.context_lookup i

theorem order58 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[57]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule58 := by
  rfl

theorem rule58 (i : Fin 58) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule58[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule58.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule58.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule58.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule58.context_lookup i

theorem order59 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[58]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule59 := by
  rfl

theorem rule59 (i : Fin 59) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule59[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule59.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule59.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule59.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule59.context_lookup i

theorem order60 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[59]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule60 := by
  rfl

theorem rule60 (i : Fin 60) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule60[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule60.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule60.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule60.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule60.context_lookup i

theorem order61 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[60]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule61 := by
  rfl

theorem rule61 (i : Fin 61) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule61[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule61.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule61.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule61.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule61.context_lookup i

theorem order62 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[61]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule62 := by
  rfl

theorem rule62 (i : Fin 62) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule62[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule62.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule62.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule62.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule62.context_lookup i

theorem order63 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[62]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule63 := by
  rfl

theorem rule63 (i : Fin 63) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule63[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule63.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule63.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule63.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule63.context_lookup i

theorem order64 :
    Grothe.UpperChaos.Q0GaussIndexedContext.rules[63]? = some Grothe.UpperChaos.Q0GaussIndexedContext.rule64 := by
  rfl

theorem rule64 (i : Fin 64) :
    Grothe.UpperChaos.Q0GaussIndexedContext.rule64[i.val]? = some (Grothe.UpperChaos.Q0GaussSelectedRule64.selected.lower i,
      Grothe.UpperChaos.Q0GaussSelectedRule64.selected.upper i) := by
  change Grothe.UpperChaos.Q0GaussSelectedRule64.indexedContext[i.val]? = _
  exact Grothe.UpperChaos.Q0GaussSelectedRule64.context_lookup i

end Grothe.UpperChaos.Q0GaussSelectedLookup

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let targets : Array Name := #[
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order01,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule01,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order02,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule02,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order03,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule03,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order04,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule04,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order05,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule05,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order06,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule06,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order07,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule07,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order08,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule08,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order09,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule09,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order10,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule10,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order11,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule11,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order12,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule12,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order13,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule13,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order14,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule14,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order15,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule15,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order16,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule16,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order17,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule17,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order18,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule18,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order19,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule19,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order20,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule20,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order21,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule21,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order22,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule22,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order23,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule23,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order24,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule24,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order25,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule25,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order26,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule26,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order27,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule27,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order28,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule28,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order29,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule29,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order30,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule30,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order31,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule31,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order32,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule32,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order33,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule33,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order34,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule34,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order35,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule35,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order36,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule36,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order37,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule37,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order38,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule38,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order39,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule39,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order40,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule40,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order41,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule41,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order42,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule42,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order43,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule43,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order44,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule44,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order45,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule45,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order46,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule46,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order47,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule47,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order48,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule48,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order49,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule49,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order50,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule50,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order51,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule51,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order52,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule52,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order53,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule53,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order54,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule54,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order55,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule55,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order56,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule56,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order57,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule57,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order58,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule58,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order59,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule59,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order60,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule60,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order61,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule61,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order62,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule62,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order63,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule63,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.order64,
    ``Grothe.UpperChaos.Q0GaussSelectedLookup.rule64]
  for target in targets do
    let dependencies ← Lean.collectAxioms target
    logInfo m!"Selected context audit {target}: {dependencies}"
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
