import Grothe.UpperChaos.TaylorFirstIntegerGrade079Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade079Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade079Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade079Part01024 = 1022810675950166684935014638442371077662639360778034620447368970713649919891695426842673543379594635851990040576 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade079Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade079Part01088 = 804544641517734668214208142377741670560172129415369683172612678795485223214522929578328309840816139292098166784 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade079Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade079Part01152 = 216665568253979434229376559270526898019059160977816118221694803103865271773045576831628891671433297914673233920 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade079Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade079Part01216 = 479648545001490162712179058372653498194758225845604922479987783902557392940004471097544216132821800812235718656 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade079Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade079Part01280 = 641942355500387409400847659618450698836128002136478142624349196602165728230262158182340442943581112243801030656 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade079Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade079Part01344 = 600631388965383484719167380774025065281806787861910370243019632672633016557086914156936665926339471683975380992 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade079Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade079Part01408 = 554338823912434776638488727813393771865860400932194386959948670399809554010093570031390195949697924987376107520 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade079Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade079Part01472 = 25100308077249395408538114050351811606154245135554751042316439046802914461197117660883952939254478648087937024 := by decide +kernel

theorem group_length : firstCenterIntegerGrade079Group002.size = 512 := by
  simp only [firstCenterIntegerGrade079Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade079Group002 = 4345682307178826016257820280719514492026578313082962995191298175236969021077908164381726218783538861434237616128 := by
  simp only [firstCenterIntegerGrade079Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade079Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade079Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade079Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
