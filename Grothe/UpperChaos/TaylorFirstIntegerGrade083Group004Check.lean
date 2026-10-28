import Grothe.UpperChaos.TaylorFirstIntegerGrade083Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade083Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade083Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade083Part02048 = 172689387363619201731937508621361503308123213451687333616631523205605982006485074839934969506051069365452800 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade083Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade083Part02112 = 136903763797605663072540078360379612433891282719073101573929269316271611693467639738610508660979904126444896256 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade083Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade083Part02176 = 112337752602732328090582415278475749007983131209754099311754018101587741638927497677002188035093847541897232384 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade083Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade083Part02240 = 91856524430641589359022169689095724180563330455853235649573331256120554996289716988537781528115442757264211968 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade083Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade083Part02304 = 28290280831572327883522027205363838171373845638018879347213451230648996571628173212633283348961889617969152 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade083Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade083Part02368 = 75184520735357902555163765703700465861399827829799764178950073980464127212636071386035671769977501919452594176 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade083Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade083Part02432 = 61732862154059771521214671241395749414254002868515185611196128171916633027298369123277633385044175838274125824 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade083Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade083Part02496 = 50900684595233722027760609589154575380210847259348096304649592930419377136626517611530319646548788496627138560 := by decide +kernel

theorem group_length : firstCenterIntegerGrade083Group004.size = 512 := by
  simp only [firstCenterIntegerGrade083Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade083Group004 = 529117087983826168155899169398028601619781919401433188843016258731216300683823925773046671278614673638943621120 := by
  simp only [firstCenterIntegerGrade083Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade083Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade083Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade083Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
