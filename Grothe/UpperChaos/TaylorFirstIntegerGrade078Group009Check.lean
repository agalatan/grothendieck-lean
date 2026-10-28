import Grothe.UpperChaos.TaylorFirstIntegerGrade078Group009Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade078Group009Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade078Part04608.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade078Part04608 = 58941725732932540539266971592450233295905208271722525400575406730219336900086535596170293483501572820303872 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade078Part04672.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade078Part04672 = 45316349714109907044035247550984309642838720272101514472106710456896549008709811951589215825205217332297728 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade078Part04736.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade078Part04736 = 16202140202832098034204250035453569017564731457096781904513051114839924284847356180319346468356175373008896 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade078Part04800.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade078Part04800 = 23442319872738227762286538066284584704926343344200268418913005796313506535299135605123277031676068132552704 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade078Part04864.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade078Part04864 = 31127830816668855433901870646330445667004135329293229797288585755081577071266522504638525017147632722640896 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade078Part04928.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade078Part04928 = 23912138672960527969811838715587337158022410281314600449286332950746039335795354134235692280674696843755520 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade078Part04992.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade078Part04992 = 22526971809974199837832593536289199780629106249460756188693127944454786322284644867344969773200239178547200 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade078Part05056.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade078Part05056 = 10506106392840135124947601639399259854115687804370148211195395870629036595820244723640003950020629503148032 := by decide +kernel

theorem group_length : firstCenterIntegerGrade078Group009.size = 512 := by
  simp only [firstCenterIntegerGrade078Group009, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade078Group009 = 231975583215056491746286911782778939121006343009559824842571616619180756054109605563061323829782231906254848 := by
  simp only [firstCenterIntegerGrade078Group009, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade078Group009Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade078Group009Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade078Group009Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
