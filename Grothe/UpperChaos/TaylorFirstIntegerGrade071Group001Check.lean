import Grothe.UpperChaos.TaylorFirstIntegerGrade071Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade071Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade071Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade071Part00512 = 4833168811129462022678270795635394789826111581218517429173632406812923550906305876397345936400152905808131129344 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade071Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade071Part00576 = 9150852354181220161669951595662734267866637387780263752469941065268893788576983801649486169374659004429240369152 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade071Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade071Part00640 = 7015333156199365225421637408827890914745188839114805244492337592980629697125697050952468029404962997217722892288 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade071Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade071Part00704 = 5055988241711010551785839125227339874495507884534378499553645032082961017625954730051810552870238841400310366208 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade071Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade071Part00768 = 3530908105829079024771663328474441286476937160278156720145528155537633342696089210260456922711273096841535684608 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade071Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade071Part00832 = 2516044458716474541405455699619004228559636656773894162844876752809458675314342524552438032500708752361529540608 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade071Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade071Part00896 = 1931639914156624134534846362154660812190968765741586218693399401447253561484803719699278329064096982874055507968 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade071Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade071Part00960 = 626465662492561497007677550621228378127027962117287965905902581770970348665192046717166894666782171455341723648 := by decide +kernel

theorem group_length : firstCenterIntegerGrade071Group001.size = 512 := by
  simp only [firstCenterIntegerGrade071Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade071Group001 = 34660400704415797159275341866222694552288016237558889993279262988710723982395368960280450866992874752387867213824 := by
  simp only [firstCenterIntegerGrade071Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade071Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade071Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade071Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
