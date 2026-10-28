import Grothe.UpperChaos.TaylorFirstIntegerGrade065Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade065Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade065Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade065Part00512 = 22010911161451886928453376925267900220910022441612818520458524940681117949256782345500482704122537188548459626496 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade065Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade065Part00576 = 15499563886975726471402970403480559179155933144317637964757571010682315458258771513096455096118884817847529242624 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade065Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade065Part00640 = 10574605206806318758610296123244616910438328928007309551210330293372158745600013369629194783852504616466504482816 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade065Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade065Part00704 = 7094548583439178261493658038027759317106515652057553688461937578760357810735865866912606174261940381186391015424 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade065Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade065Part00768 = 5046851154493267592496450762943093003515630313064730157950583047299236441186974383669916814033989543548990521344 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade065Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade065Part00832 = 4147634854930346131718975526775659188007855715664739007842904314188270528716546328228151398967181937443203973120 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade065Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade065Part00896 = 3881649014308249687751402754453366930859068333854062101139101019044439361374327313776384918966763730032490708992 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade065Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade065Part00960 = 3806178011947843475473161884061634368560742309953968248493389309162142770896583250706924279638196663519304220672 := by decide +kernel

theorem group_length : firstCenterIntegerGrade065Group001.size = 512 := by
  simp only [firstCenterIntegerGrade065Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade065Group001 = 72061941874352817307400292418254589118554096838532819240314341513190039066025864371520116169961998878592873791488 := by
  simp only [firstCenterIntegerGrade065Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade065Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade065Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade065Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
