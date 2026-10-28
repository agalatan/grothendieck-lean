import Grothe.UpperChaos.TaylorFirstIntegerGrade090Group008Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade090Group008Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade090Part04096.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade090Part04096 = 1256177096440485153026559313371018283065819986083734345494533491391326972284594705065809975335684231403667456 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade090Part04160.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade090Part04160 = 3357056291884094493667419140244965499686216724045458552122295868560997472560493868048700370597523260178432 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade090Part04224.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade090Part04224 = 906153737037551465002279313302223659299971928277293287465914777386234949990979412728465023872788879615459328 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade090Part04288.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade090Part04288 = 658431601563439832402472766605138559157372728461704856793993488635467505525765674440300706671002606213529600 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade090Part04352.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade090Part04352 = 156615757781971509079527151567101221335932835122320768936721518835419988804507533673609469948058366510104576 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade090Part04416.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade090Part04416 = 319986574961199274140873039129337426818358874587617545465077850713155601817310820073026992240232575652593664 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade090Part04480.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade090Part04480 = 337293427232368589943832224007236662196451555944263903584100958239595456023227979996809706168366229048262656 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade090Part04544.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade090Part04544 = 228226174246486188895577322700397333476043277928600470020202430394307129807118042783457611032005821708894208 := by decide +kernel

theorem group_length : firstCenterIntegerGrade090Group008.size = 512 := by
  simp only [firstCenterIntegerGrade090Group008, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade090Group008 = 3866241425555386106984788549822698110849637403129580636312666811464068601726064662629528185638736233412689920 := by
  simp only [firstCenterIntegerGrade090Group008, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade090Group008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group008Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group008Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
