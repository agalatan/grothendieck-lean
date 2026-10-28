import Grothe.UpperChaos.TaylorFirstIntegerGrade071Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade071Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade071Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade071Part03584 = 56351107686120226269819096609226545742292736297633081863340250084271076682957672320660312607355287596171264 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade071Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade071Part03648 = 241804720983014943884077978074862609255426145778372436708916259723843239262027936323310548747214834901188608 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade071Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade071Part03712 = 305933889947857679158076046189042036690819246137269996600426793050571148033518937386867326997903380800602112 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade071Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade071Part03776 = 282332712072676350063705997755683104545437907231468174922358355402833932266960241156962422851739512704335872 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade071Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade071Part03840 = 234979376211648824846914877495241793602976911291632505037731153355052002465554248521408705375706487472521216 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade071Part03904.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade071Part03904 = 187632924498069947210416530855301681511397158080065417689632020032976938697838936334713448230749154721136640 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade071Part03968.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade071Part03968 = 152020628890041765517312856589463614365522793090910056064719125409870618344718401604360170745902447739273216 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade071Part04032.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade071Part04032 = 122613319781111807735940715615117482218113521004067593526962309884416672679357931028124459507973669640994816 := by decide +kernel

theorem group_length : firstCenterIntegerGrade071Group007.size = 512 := by
  simp only [firstCenterIntegerGrade071Group007, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade071Group007 = 1583668680070541544686264099183938867931986418911419262414086266943835628432934304676407395064544775576223744 := by
  simp only [firstCenterIntegerGrade071Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade071Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade071Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade071Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
