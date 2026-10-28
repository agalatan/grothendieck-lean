import Grothe.UpperChaos.TaylorFirstIntegerGrade074Group010Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade074Group010Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade074Part05120.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade074Part05120 = 18734845748191392303308898282646574912042223451854242745842893240485635560924238637782543274251226540146688 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade074Part05184.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade074Part05184 = 19087622285592041615668648747126197151875717247680557508414462302501333049944712173799496170534634845634560 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade074Part05248.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade074Part05248 = 8368908230789627744442993891122233121871665306357844508721471035647370903033571319895453437675198333583360 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade074Part05312.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade074Part05312 = 8811511923619345502761101019781454660454044390143246771973827865689782726276286670066940014945740636815360 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade074Part05376.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade074Part05376 = 29088842321653476115831170841363237915800759698286528581920306906821040136454113667103067263747122236751872 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade074Part05440.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade074Part05440 = 32303951070928079638937102095443558774280078415457091410173663989523924095485509326261562015833418400530432 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade074Part05504.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade074Part05504 = 20185450313024083178524934921718491866967778026218788426096142553951656637101934190787460736038933505245184 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade074Part05568.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade074Part05568 = 9075789599531822420751748671944252363404475128242326094526891820204340039730662006354261953734417410162688 := by decide +kernel

theorem group_length : firstCenterIntegerGrade074Group010.size = 512 := by
  simp only [firstCenterIntegerGrade074Group010, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade074Group010 = 145656921493329868520226598471146000766696741664240626047669659714825083148951027992050784866760691908870144 := by
  simp only [firstCenterIntegerGrade074Group010, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade074Group010Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade074Group010Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade074Group010Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
