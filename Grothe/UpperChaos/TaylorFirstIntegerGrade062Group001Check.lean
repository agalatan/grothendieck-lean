import Grothe.UpperChaos.TaylorFirstIntegerGrade062Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade062Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade062Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade062Part00512 = 29298767203879177156180960746184412624686783545689315689702623475037840931105417754186888836447766004815261335552 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade062Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade062Part00576 = 18824054530800320339727931941264300876204698613221519687682265587237292794923267330885228126943170863629810532352 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade062Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade062Part00640 = 12024241661742749283003694508991185989496542090393126522628155775912770380413890561392932275620801852994444328960 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade062Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade062Part00704 = 8472287016291077744685130744104855677696736123295328580946727403257398143458815474981413662459058464069404065792 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade062Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade062Part00768 = 7061715783957046920843575433845763437578985954574062422393397590343489829070089090586216660001202391000794791936 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade062Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade062Part00832 = 6690111179965929859358184618349987262300042342492528376378828875453195779168385207394429611753260190521869991936 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade062Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade062Part00896 = 6603361618997465482167338988453087007062647994494621915725383722727939606611583097413449148476452040901880971264 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade062Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade062Part00960 = 6407519048443090917238600794052036240632503403020017899758515809984895879593817548408480356289924103771059650560 := by decide +kernel

theorem group_length : firstCenterIntegerGrade062Group001.size = 512 := by
  simp only [firstCenterIntegerGrade062Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade062Group001 = 95382058044076857703205417775245629115658940067180521095215898239954823344345266065249038677991635911704525668352 := by
  simp only [firstCenterIntegerGrade062Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade062Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade062Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade062Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
