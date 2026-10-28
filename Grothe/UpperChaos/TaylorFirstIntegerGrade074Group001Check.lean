import Grothe.UpperChaos.TaylorFirstIntegerGrade074Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade074Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade074Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade074Part00512 = 7244393060701469424801095394050877003073249209787409385303820435182250202718775248761303021638392598933368995840 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade074Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade074Part00576 = 5948823277546893877635853711415318972866653929869421073703247802353504284170403412377055106894801314810137935872 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade074Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade074Part00640 = 4821552784146048140530896324972646625945287999808942790250996406548442367990371728510199333266724672579590684672 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade074Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade074Part00704 = 3703501635036126988055962236770107874850097496688051055057467569146159964265155480797548878066169600683865538560 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade074Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade074Part00768 = 1553547646271956405211687639547748450391968206715921568397125990340456124431264798585341508392683579679635931136 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade074Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade074Part00832 = 1149156778661992078063958886552238734338338795399352698991887946111943656163104231864834467105519267481598820352 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade074Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade074Part00896 = 1922442031917844532066246969469992989716274220135460507610980405167728502992089330454611822561235889611792711680 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade074Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade074Part00960 = 1459776377347404670151296895154389106403814251851057448113106600886194389888124750054295126697828664172752142336 := by decide +kernel

theorem group_length : firstCenterIntegerGrade074Group001.size = 512 := by
  simp only [firstCenterIntegerGrade074Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade074Group001 = 27803193591629736116516998057933319757585684110255616527428633155736679492619288981405189264623355587952742760448 := by
  simp only [firstCenterIntegerGrade074Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade074Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade074Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade074Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
