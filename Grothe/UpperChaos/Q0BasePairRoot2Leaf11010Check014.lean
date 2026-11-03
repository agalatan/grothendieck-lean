import Grothe.UpperChaos.Q0BasePairRoot2Leaf11010Check013

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Leaf11010
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem dampingField5_checked :
    intervalInputOK dampingCertificate.centerInterval dampingCertificate.centerApprox dampingCertificate.centerValue 0 = true := by
  decide +kernel

theorem dampingField6_checked :
    mulOK dampingCertificate.centered dampingCertificate.centerValue dampingCertificate.output dampingCertificate.productBudget = true := by
  decide +kernel

theorem damping_checked :
    RectangleExpCertificate.Verified dampingArgumentModel dampingCertificate := by
  exact ⟨dampingField0_checked, dampingField1_checked, dampingField2_checked, dampingField3_checked, dampingField4_checked, dampingField5_checked, dampingField6_checked⟩

theorem gaussianHorner11_checked :
    gaussianTail11.check gaussianCertificate.delta [] = true := by
  rfl

theorem gaussianHorner10_mul_checked :
    mulOK gaussianTail11.output gaussianCertificate.delta gaussianproduct10 (0 / 1) = true := by
  decide +kernel

theorem gaussianHorner10_add_checked :
    addOK gaussianproduct10 (constant (1 / 1)) gaussianresult10 (0 / 1) = true := by
  decide +kernel

theorem gaussianHorner10_checked :
    gaussianTail10.check gaussianCertificate.delta [constant (1 / 1)] = true := by
  exact Trace.check_cons gaussianCertificate.delta (constant (1 / 1))
    []
    gaussianproduct10 gaussianresult10 (0 / 1) (0 / 1) gaussianTail11
    gaussianHorner11_checked gaussianHorner10_mul_checked gaussianHorner10_add_checked

end Grothe.UpperChaos.Q0BasePairRoot2Leaf11010
