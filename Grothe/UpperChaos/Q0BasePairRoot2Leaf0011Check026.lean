import Grothe.UpperChaos.Q0BasePairRoot2Leaf0011Check025

/-! Generated bounded arithmetic block (2 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Leaf0011
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem companionNumerator_checked :
    mulOK twiceProfileModel companionFactorModel companionNumeratorModel (9465971974676783503992835849321 / 730750818665451459101842416358141509827966271488) = true := by
  decide +kernel

theorem companionOutput_checked :
    mulOK companionNumeratorModel commonModel companionOutputModel (21058674287025224359347843199 / 91343852333181432387730302044767688728495783936) = true := by
  decide +kernel

end Grothe.UpperChaos.Q0BasePairRoot2Leaf0011
