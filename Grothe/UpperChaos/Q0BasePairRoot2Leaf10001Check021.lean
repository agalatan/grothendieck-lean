import Grothe.UpperChaos.Q0BasePairRoot2Leaf10001Check020

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Leaf10001
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem gaussianField5_checked :
    intervalInputOK gaussianCertificate.centerInterval gaussianCertificate.centerApprox gaussianCertificate.centerValue 0 = true := by
  decide +kernel

theorem gaussianField6_checked :
    mulOK gaussianCertificate.centered gaussianCertificate.centerValue gaussianCertificate.output gaussianCertificate.productBudget = true := by
  decide +kernel

theorem gaussian_checked :
    RectangleExpCertificate.Verified gaussianArgumentModel gaussianCertificate := by
  exact ⟨gaussianField0_checked, gaussianField1_checked, gaussianField2_checked, gaussianField3_checked, gaussianField4_checked, gaussianField5_checked, gaussianField6_checked⟩

theorem aux2_checked :
    mulOK auxModel auxModel aux2Model (0 / 1) = true := by
  decide +kernel

theorem profile2_checked :
    mulOK profileModel profileModel profile2Model (1256143202838106331581113035 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

end Grothe.UpperChaos.Q0BasePairRoot2Leaf10001
