import Grothe.Haagerup.CanonicalTrace.Shared
import Lean.Elab.Command

/-!
Agent-ID: codex-aa04. Literal checkpoints for the canonical Haagerup bound.
Independent kernel arithmetic; no other numerical module is imported.
Regenerate with tools/gen_haagerup_canonical_check.py.

Each arithmetic step is proved from literal inputs and assembled through
the defining recurrences. Progress identifiers are stable across parallel modules.
-/

set_option Elab.async false
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace Grothe.HaagerupCanonical.Trace

open GrotheKernel

theorem coefficientStep45 :
    c45 * (((2*45+1)^2 : Nat) : Rat) / ((4*(45+1)*(45+2) : Nat) : Rat) = c46 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 47: reached coefficientStep45"
  out.flush

theorem coefficientStep58 :
    c58 * (((2*58+1)^2 : Nat) : Rat) / ((4*(58+1)*(58+2) : Nat) : Rat) = c59 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 60: reached coefficientStep58"
  out.flush

theorem differenceStep1_68 :
    d0_68 - d0_69 = d1_68 := by
  decide +kernel

theorem differenceStep6_64 :
    d5_64 - d5_65 = d6_64 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 78: reached difference_order_6"
  out.flush

theorem correctionStep4_conv_blockStep5 :
    convWithTail correctionStep4_conv_block5 correction5 correctionStep4_conv_result6 = correctionStep4_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep5"
  out.flush

theorem correctionStep3_conv_blockStep5 :
    convWithTail correctionStep3_conv_block5 correction4 correctionStep3_conv_result6 = correctionStep3_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep5"
  out.flush

theorem correctionStep2_conv_blockStep18 :
    convWithTail correctionStep2_conv_block18 correction3 correctionStep2_conv_result19 = correctionStep2_conv_result18 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep18"
  out.flush

theorem correctionStep2_conv_blockStep7 :
    convWithTail correctionStep2_conv_block7 correction3 correctionStep2_conv_result8 = correctionStep2_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep7"
  out.flush

theorem correctionStep1_conv_blockStep9 :
    convWithTail correctionStep1_conv_block9 correction2 correctionStep1_conv_result10 = correctionStep1_conv_result9 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep9"
  out.flush

theorem correctionStep0_conv_blockStep11 :
    convWithTail correctionStep0_conv_block11 correction1 correctionStep0_conv_result12 = correctionStep0_conv_result11 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep11"
  out.flush

theorem tail_step_conv_blockStep8 :
    convWithTail tail_step_conv_block8 correction0 tail_step_conv_result9 = tail_step_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached tail_step_conv_blockStep8"
  out.flush

theorem headStep63_conv_blockStep0 :
    convWithTail headStep63_conv_block0 head64 headStep63_conv_result1 = headStep63_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep63_conv_blockStep0"
  out.flush

theorem headStep61_conv_blockStep4 :
    convWithTail headStep61_conv_block4 head62 headStep61_conv_result5 = headStep61_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep61_conv_blockStep4"
  out.flush

theorem headStep59_conv_blockStep0 :
    convWithTail headStep59_conv_block0 head60 headStep59_conv_result1 = headStep59_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep59_conv_blockStep0"
  out.flush

theorem headStep56_conv_blockStep2 :
    convWithTail headStep56_conv_block2 head57 headStep56_conv_result3 = headStep56_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep56_conv_blockStep2"
  out.flush

theorem headStep53_conv_blockStep4 :
    convWithTail headStep53_conv_block4 head54 headStep53_conv_result5 = headStep53_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep53_conv_blockStep4"
  out.flush

theorem headStep51_conv_blockStep0 :
    convWithTail headStep51_conv_block0 head52 headStep51_conv_result1 = headStep51_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep51_conv_blockStep0"
  out.flush

theorem headStep48_conv_blockStep2 :
    convWithTail headStep48_conv_block2 head49 headStep48_conv_result3 = headStep48_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep48_conv_blockStep2"
  out.flush

theorem headStep48_conv_input :
    ratioA = headStep48_conv_suffix0 := by
  decide +kernel

theorem headStep45_conv_blockStep4 :
    convWithTail headStep45_conv_block4 head46 headStep45_conv_result5 = headStep45_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep45_conv_blockStep4"
  out.flush

theorem headStep43_conv_blockStep0 :
    convWithTail headStep43_conv_block0 head44 headStep43_conv_result1 = headStep43_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep43_conv_blockStep0"
  out.flush

theorem headStep40_conv_blockStep2 :
    convWithTail headStep40_conv_block2 head41 headStep40_conv_result3 = headStep40_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep40_conv_blockStep2"
  out.flush

theorem headStep37_conv_blockStep4 :
    convWithTail headStep37_conv_block4 head38 headStep37_conv_result5 = headStep37_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep37_conv_blockStep4"
  out.flush

theorem headStep35_conv_blockStep0 :
    convWithTail headStep35_conv_block0 head36 headStep35_conv_result1 = headStep35_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep35_conv_blockStep0"
  out.flush

theorem headStep32_conv_blockStep2 :
    convWithTail headStep32_conv_block2 head33 headStep32_conv_result3 = headStep32_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep32_conv_blockStep2"
  out.flush

theorem headStep32_conv_input :
    ratioA = headStep32_conv_suffix0 := by
  decide +kernel

theorem headStep29_conv_blockStep4 :
    convWithTail headStep29_conv_block4 head30 headStep29_conv_result5 = headStep29_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep29_conv_blockStep4"
  out.flush

theorem headStep27_conv_blockStep0 :
    convWithTail headStep27_conv_block0 head28 headStep27_conv_result1 = headStep27_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep27_conv_blockStep0"
  out.flush

theorem headStep24_conv_blockStep2 :
    convWithTail headStep24_conv_block2 head25 headStep24_conv_result3 = headStep24_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep24_conv_blockStep2"
  out.flush

theorem headStep21_conv_blockStep4 :
    convWithTail headStep21_conv_block4 head22 headStep21_conv_result5 = headStep21_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep21_conv_blockStep4"
  out.flush

theorem headStep19_conv_blockStep0 :
    convWithTail headStep19_conv_block0 head20 headStep19_conv_result1 = headStep19_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep19_conv_blockStep0"
  out.flush

theorem headStep16_conv_blockStep2 :
    convWithTail headStep16_conv_block2 head17 headStep16_conv_result3 = headStep16_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep16_conv_blockStep2"
  out.flush

theorem headStep16_conv_input :
    ratioA = headStep16_conv_suffix0 := by
  decide +kernel

theorem headStep13_conv_blockStep4 :
    convWithTail headStep13_conv_block4 head14 headStep13_conv_result5 = headStep13_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep13_conv_blockStep4"
  out.flush

theorem headStep11_conv_blockStep0 :
    convWithTail headStep11_conv_block0 head12 headStep11_conv_result1 = headStep11_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep11_conv_blockStep0"
  out.flush

theorem headStep8_conv_blockStep2 :
    convWithTail headStep8_conv_block2 head9 headStep8_conv_result3 = headStep8_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep8_conv_blockStep2"
  out.flush

theorem headStep5_conv_blockStep4 :
    convWithTail headStep5_conv_block4 head6 headStep5_conv_result5 = headStep5_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep5_conv_blockStep4"
  out.flush

theorem headStep3_conv_blockStep0 :
    convWithTail headStep3_conv_block0 head4 headStep3_conv_result1 = headStep3_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep3_conv_blockStep0"
  out.flush

theorem headStep0_conv_blockStep2 :
    convWithTail headStep0_conv_block2 head1 headStep0_conv_result3 = headStep0_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep0_conv_blockStep2"
  out.flush

theorem headStep0_conv_input :
    ratioA = headStep0_conv_suffix0 := by
  decide +kernel

theorem powerStep10 :
    convI pI power9 = power10 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 167: reached powerStep10"
  out.flush

theorem powerStep14_conv_blockStep2 :
    convWithTail powerStep14_conv_block2 power13 powerStep14_conv_result3 = powerStep14_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep14_conv_blockStep2"
  out.flush

theorem defect_literal_ok :
    decide (absSum defectI ≤ ofRatLo defectCapQ) = true := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 180: reached defect_literal_ok"
  out.flush

end Grothe.HaagerupCanonical.Trace
