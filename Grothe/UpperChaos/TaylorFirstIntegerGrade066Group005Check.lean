import Grothe.UpperChaos.TaylorFirstIntegerGrade066Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade066Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade066Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade066Part02560 = 19526478310580011090814750719256180706150048427130779114947495471180655886289359611437714089948572873071263744 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade066Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade066Part02624 = 13703275326883901615753112210066720050918519041812545660953826403592552126299327898878055052122363091816022016 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade066Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade066Part02688 = 9452720790260785050172498564338655412161153153379149663012235365450511882448898919159185991894264129181974528 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade066Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade066Part02752 = 6450617631798646069427257435853688750940062323362966655156795179178331321115540421597162926312980875304763392 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade066Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade066Part02816 = 4363119999450208674793326586242099635150083785440360643236548953391279672898219389722446153762429064173322240 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade066Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade066Part02880 = 2898456458397704070420808588295991952618028814205104615746135262004808062924272792821779172924443881757474816 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade066Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade066Part02944 = 1930932296801804443806420687516488505320217403504141443182934595106972649058560562103962123549780616899723264 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade066Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade066Part03008 = 1415564732045597890916905340805667783394597624437465695091874096653605268209346543120919443612364424402173952 := by decide +kernel

theorem group_length : firstCenterIntegerGrade066Group005.size = 512 := by
  simp only [firstCenterIntegerGrade066Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade066Group005 = 59741165546218658906105080132375492796652710573272513491327845326558716869243526138841224954127198956606717952 := by
  simp only [firstCenterIntegerGrade066Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade066Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade066Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade066Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
