import Grothe.UpperChaos.TaylorFirstIntegerGrade070Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade070Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade070Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade070Part02560 = 30222870528566322430073506144685170276257317881537477045902850149900247471230278073122959818660639138232926208 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade070Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade070Part02624 = 22421223685270246575071926508578204717115502919534297703653375155668024920999429862976861926025637916137488384 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade070Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade070Part02688 = 16253612930092974763764752496108765508579096352972883601530031820783296240449029488763051865540204492511772672 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade070Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade070Part02752 = 11579655491812359562224219799049590582282724546122607017768066387859940969263402576109094553092040520431042560 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade070Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade070Part02816 = 2206806962886478830505049277142579799689460652038386885283810648159098754075869087310633982619880377880150016 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade070Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade070Part02880 = 5953201047874826607666616544861113839034452338993761651268740161567614131218636719575070967083551685095718912 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade070Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade070Part02944 = 5626732965206158435670937990930904748379629320320242136768907284705693589746849832012656476846334242744958976 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade070Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade070Part03008 = 3836569383208516475298982630988443980774469633943371832246026982254284244519372648436777598362074650089881600 := by decide +kernel

theorem group_length : firstCenterIntegerGrade070Group005.size = 512 := by
  simp only [firstCenterIntegerGrade070Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade070Group005 = 98100672994917883680275991392344773452112653645463027874421808590898200321502868288307107188230363023123939328 := by
  simp only [firstCenterIntegerGrade070Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade070Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade070Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade070Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
