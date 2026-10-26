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

theorem coefficientStep21 :
    c21 * (((2*21+1)^2 : Nat) : Rat) / ((4*(21+1)*(21+2) : Nat) : Rat) = c22 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 23: reached coefficientStep21"
  out.flush

theorem coefficientStep29 :
    c29 * (((2*29+1)^2 : Nat) : Rat) / ((4*(29+1)*(29+2) : Nat) : Rat) = c30 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 31: reached coefficientStep29"
  out.flush

theorem coefficientStep37 :
    c37 * (((2*37+1)^2 : Nat) : Rat) / ((4*(37+1)*(37+2) : Nat) : Rat) = c38 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 39: reached coefficientStep37"
  out.flush

theorem coefficientStep47 :
    c47 * (((2*47+1)^2 : Nat) : Rat) / ((4*(47+1)*(47+2) : Nat) : Rat) = c48 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 49: reached coefficientStep47"
  out.flush

theorem coefficientStep60 :
    c60 * (((2*60+1)^2 : Nat) : Rat) / ((4*(60+1)*(60+2) : Nat) : Rat) = c61 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 62: reached coefficientStep60"
  out.flush

theorem differenceStep2_64 :
    d1_64 - d1_65 = d2_64 := by
  decide +kernel

theorem p_interval_eq :
    plQ.map ofRatI = pI := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 80: reached p_interval_eq"
  out.flush

theorem correctionStep4_conv_blockStep6 :
    convWithTail correctionStep4_conv_block6 correction5 correctionStep4_conv_result7 = correctionStep4_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep6"
  out.flush

theorem correctionStep3_conv_blockStep18 :
    convWithTail correctionStep3_conv_block18 correction4 correctionStep3_conv_result19 = correctionStep3_conv_result18 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep18"
  out.flush

theorem correctionStep3_conv_blockStep6 :
    convWithTail correctionStep3_conv_block6 correction4 correctionStep3_conv_result7 = correctionStep3_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep6"
  out.flush

theorem correctionStep2_conv_blockStep8 :
    convWithTail correctionStep2_conv_block8 correction3 correctionStep2_conv_result9 = correctionStep2_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep8"
  out.flush

theorem correctionStep1_conv_blockStep10 :
    convWithTail correctionStep1_conv_block10 correction2 correctionStep1_conv_result11 = correctionStep1_conv_result10 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep10"
  out.flush

theorem correctionStep0_conv_blockStep12 :
    convWithTail correctionStep0_conv_block12 correction1 correctionStep0_conv_result13 = correctionStep0_conv_result12 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep12"
  out.flush

theorem tail_step_conv_blockStep9 :
    convWithTail tail_step_conv_block9 correction0 tail_step_conv_result10 = tail_step_conv_result9 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached tail_step_conv_blockStep9"
  out.flush

theorem headStep62_conv_input :
    ratioA = headStep62_conv_suffix0 := by
  decide +kernel

theorem headStep61_conv_blockStep5 :
    convWithTail headStep61_conv_block5 head62 headStep61_conv_result6 = headStep61_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep61_conv_blockStep5"
  out.flush

theorem headStep59_conv_blockStep1 :
    convWithTail headStep59_conv_block1 head60 headStep59_conv_result2 = headStep59_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep59_conv_blockStep1"
  out.flush

theorem headStep56_conv_blockStep3 :
    convWithTail headStep56_conv_block3 head57 headStep56_conv_result4 = headStep56_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep56_conv_blockStep3"
  out.flush

theorem headStep53_conv_blockStep5 :
    convWithTail headStep53_conv_block5 head54 headStep53_conv_result6 = headStep53_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep53_conv_blockStep5"
  out.flush

theorem headStep51_conv_blockStep1 :
    convWithTail headStep51_conv_block1 head52 headStep51_conv_result2 = headStep51_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep51_conv_blockStep1"
  out.flush

theorem headStep48_conv_blockStep3 :
    convWithTail headStep48_conv_block3 head49 headStep48_conv_result4 = headStep48_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep48_conv_blockStep3"
  out.flush

theorem headStep46_conv_input :
    ratioA = headStep46_conv_suffix0 := by
  decide +kernel

theorem headStep45_conv_blockStep5 :
    convWithTail headStep45_conv_block5 head46 headStep45_conv_result6 = headStep45_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep45_conv_blockStep5"
  out.flush

theorem headStep43_conv_blockStep1 :
    convWithTail headStep43_conv_block1 head44 headStep43_conv_result2 = headStep43_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep43_conv_blockStep1"
  out.flush

theorem headStep40_conv_blockStep3 :
    convWithTail headStep40_conv_block3 head41 headStep40_conv_result4 = headStep40_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep40_conv_blockStep3"
  out.flush

theorem headStep37_conv_blockStep5 :
    convWithTail headStep37_conv_block5 head38 headStep37_conv_result6 = headStep37_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep37_conv_blockStep5"
  out.flush

theorem headStep35_conv_blockStep1 :
    convWithTail headStep35_conv_block1 head36 headStep35_conv_result2 = headStep35_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep35_conv_blockStep1"
  out.flush

theorem headStep32_conv_blockStep3 :
    convWithTail headStep32_conv_block3 head33 headStep32_conv_result4 = headStep32_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep32_conv_blockStep3"
  out.flush

theorem headStep30_conv_input :
    ratioA = headStep30_conv_suffix0 := by
  decide +kernel

theorem headStep29_conv_blockStep5 :
    convWithTail headStep29_conv_block5 head30 headStep29_conv_result6 = headStep29_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep29_conv_blockStep5"
  out.flush

theorem headStep27_conv_blockStep1 :
    convWithTail headStep27_conv_block1 head28 headStep27_conv_result2 = headStep27_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep27_conv_blockStep1"
  out.flush

theorem headStep24_conv_blockStep3 :
    convWithTail headStep24_conv_block3 head25 headStep24_conv_result4 = headStep24_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep24_conv_blockStep3"
  out.flush

theorem headStep21_conv_blockStep5 :
    convWithTail headStep21_conv_block5 head22 headStep21_conv_result6 = headStep21_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep21_conv_blockStep5"
  out.flush

theorem headStep19_conv_blockStep1 :
    convWithTail headStep19_conv_block1 head20 headStep19_conv_result2 = headStep19_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep19_conv_blockStep1"
  out.flush

theorem headStep16_conv_blockStep3 :
    convWithTail headStep16_conv_block3 head17 headStep16_conv_result4 = headStep16_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep16_conv_blockStep3"
  out.flush

theorem headStep14_conv_input :
    ratioA = headStep14_conv_suffix0 := by
  decide +kernel

theorem headStep13_conv_blockStep5 :
    convWithTail headStep13_conv_block5 head14 headStep13_conv_result6 = headStep13_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep13_conv_blockStep5"
  out.flush

theorem headStep11_conv_blockStep1 :
    convWithTail headStep11_conv_block1 head12 headStep11_conv_result2 = headStep11_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep11_conv_blockStep1"
  out.flush

theorem headStep8_conv_blockStep3 :
    convWithTail headStep8_conv_block3 head9 headStep8_conv_result4 = headStep8_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep8_conv_blockStep3"
  out.flush

theorem headStep5_conv_blockStep5 :
    convWithTail headStep5_conv_block5 head6 headStep5_conv_result6 = headStep5_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep5_conv_blockStep5"
  out.flush

theorem headStep3_conv_blockStep1 :
    convWithTail headStep3_conv_block1 head4 headStep3_conv_result2 = headStep3_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep3_conv_blockStep1"
  out.flush

theorem headStep0_conv_blockStep3 :
    convWithTail headStep0_conv_block3 head1 headStep0_conv_result4 = headStep0_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep0_conv_blockStep3"
  out.flush

theorem completed_literal_ok :
    decide (absSum (addL completedI [negI (ofRatI slopeQ)]) ≤ ofRatLo prefixCapQ) = true := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 156: reached completed_literal_ok"
  out.flush

theorem powerStep9 :
    convI pI power8 = power9 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 166: reached powerStep9"
  out.flush

theorem powerStep15_conv_blockStep0 :
    convWithTail powerStep15_conv_block0 power14 powerStep15_conv_result1 = powerStep15_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep15_conv_blockStep0"
  out.flush

end Grothe.HaagerupCanonical.Trace
