import Grothe.UpperChaos.TaylorFirstIntegerGrade023Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade023Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade023Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade023Part00000 = 3259061074365360232868738377260426340685131238234180092848989925674751892976777239138749112241131127634011474624512 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade023Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade023Part00064 = 1283355478279487573151835656412237942603388561560616094279874723255281021393628903999442953153384850597967229353984 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade023Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade023Part00128 = 700232358214127513674964005358647204410897831024001518028742605940997217736665074626861284209827875363383909810176 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade023Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade023Part00192 = 138725502618064199282789903481514869575145122804919901910464668799037866697349565601899081031303964981990699040768 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade023Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade023Part00256 = 13419395031446143995937493876237548305029312534833842688923345866068336084602809162564200728591159312930140323840 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade023Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade023Part00320 = 6912486486873226737703727932955348851019167241592044387337425069363805612385939500875810975564436707640157929472 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade023Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade023Part00384 = 3295293407171824367317224333140062371271635876199551914856589778285205383916177156079783218267183217243834023936 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade023Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade023Part00448 = 1622464639503453740751465529529416151885516759585387354626608538197466691239323256284835595481634791607446274048 := by decide +kernel

theorem group_length : firstCenterIntegerGrade023Group000.size = 512 := by
  simp only [firstCenterIntegerGrade023Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade023Group000 = 5406624053042034167820037854184688732953768386035928433413815892921982812576565032442757061153552232606774891380736 := by
  simp only [firstCenterIntegerGrade023Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade023Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade023Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade023Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
