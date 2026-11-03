import Grothe.UpperChaos.Q0BasePairRoot10Leaf110Check003

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot10Leaf110
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem inverseHorner2_mul_checked :
    mulOK inverseTail3.output inverseCertificate.argument inverseproduct2 (1573849681276633391626672938005 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem inverseHorner2_add_checked :
    addOK inverseproduct2 (((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 2 (constant 0)) inverseresult2 0 = true := by
  decide +kernel

theorem inverseHorner2_checked :
    inverseTail2.check inverseCertificate.argument [((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 2 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 3 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 4 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 5 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 6 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 7 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 8 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 9 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 10 (constant 0)] = true := by
  exact Trace.check_cons inverseCertificate.argument (((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 2 (constant 0))
    [((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 3 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 4 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 5 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 6 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 7 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 8 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 9 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 10 (constant 0)]
    inverseproduct2 inverseresult2 (1573849681276633391626672938005 / 1461501637330902918203684832716283019655932542976) 0 inverseTail3
    inverseHorner3_checked inverseHorner2_mul_checked inverseHorner2_add_checked

theorem inverseHorner1_mul_checked :
    mulOK inverseTail2.output inverseCertificate.argument inverseproduct1 (1573849681276633391626672938005 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem inverseHorner1_add_checked :
    addOK inverseproduct1 (((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 1 (constant 0)) inverseresult1 0 = true := by
  decide +kernel

theorem inverseHorner1_checked :
    inverseTail1.check inverseCertificate.argument [((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 1 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 2 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 3 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 4 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 5 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 6 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 7 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 8 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 9 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 10 (constant 0)] = true := by
  exact Trace.check_cons inverseCertificate.argument (((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 1 (constant 0))
    [((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 2 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 3 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 4 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 5 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 6 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 7 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 8 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 9 (constant 0), ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant).getD 10 (constant 0)]
    inverseproduct1 inverseresult1 (1573849681276633391626672938005 / 1461501637330902918203684832716283019655932542976) 0 inverseTail2
    inverseHorner2_checked inverseHorner1_mul_checked inverseHorner1_add_checked

end Grothe.UpperChaos.Q0BasePairRoot10Leaf110
