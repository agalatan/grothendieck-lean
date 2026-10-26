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

theorem coefficientStep3 :
    c3 * (((2*3+1)^2 : Nat) : Rat) / ((4*(3+1)*(3+2) : Nat) : Rat) = c4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 5: reached coefficientStep3"
  out.flush

theorem coefficientStep7 :
    c7 * (((2*7+1)^2 : Nat) : Rat) / ((4*(7+1)*(7+2) : Nat) : Rat) = c8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 9: reached coefficientStep7"
  out.flush

theorem coefficientStep12 :
    c12 * (((2*12+1)^2 : Nat) : Rat) / ((4*(12+1)*(12+2) : Nat) : Rat) = c13 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 14: reached coefficientStep12"
  out.flush

theorem coefficientStep17 :
    c17 * (((2*17+1)^2 : Nat) : Rat) / ((4*(17+1)*(17+2) : Nat) : Rat) = c18 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 19: reached coefficientStep17"
  out.flush

theorem coefficientStep25 :
    c25 * (((2*25+1)^2 : Nat) : Rat) / ((4*(25+1)*(25+2) : Nat) : Rat) = c26 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 27: reached coefficientStep25"
  out.flush

theorem coefficientStep33 :
    c33 * (((2*33+1)^2 : Nat) : Rat) / ((4*(33+1)*(33+2) : Nat) : Rat) = c34 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 35: reached coefficientStep33"
  out.flush

theorem coefficientStep41 :
    c41 * (((2*41+1)^2 : Nat) : Rat) / ((4*(41+1)*(41+2) : Nat) : Rat) = c42 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 43: reached coefficientStep41"
  out.flush

theorem coefficientStep51 :
    c51 * (((2*51+1)^2 : Nat) : Rat) / ((4*(51+1)*(51+2) : Nat) : Rat) = c52 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 53: reached coefficientStep51"
  out.flush

theorem coefficientStep67 :
    c67 * (((2*67+1)^2 : Nat) : Rat) / ((4*(67+1)*(67+2) : Nat) : Rat) = c68 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 69: reached coefficientStep67"
  out.flush

theorem differenceStep3_66 :
    d2_66 - d2_67 = d3_66 := by
  decide +kernel

theorem correctionStep4_conv_blockStep7 :
    convWithTail correctionStep4_conv_block7 correction5 correctionStep4_conv_result8 = correctionStep4_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep7"
  out.flush

theorem correctionStep3_conv_blockStep7 :
    convWithTail correctionStep3_conv_block7 correction4 correctionStep3_conv_result8 = correctionStep3_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep7"
  out.flush

theorem correctionStep2_conv_blockStep9 :
    convWithTail correctionStep2_conv_block9 correction3 correctionStep2_conv_result10 = correctionStep2_conv_result9 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep9"
  out.flush

theorem correctionStep1_conv_blockStep11 :
    convWithTail correctionStep1_conv_block11 correction2 correctionStep1_conv_result12 = correctionStep1_conv_result11 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep11"
  out.flush

theorem correctionStep0_conv_blockStep13 :
    convWithTail correctionStep0_conv_block13 correction1 correctionStep0_conv_result14 = correctionStep0_conv_result13 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep13"
  out.flush

theorem correctionStep0_conv_input :
    ratioY = correctionStep0_conv_suffix0 := by
  decide +kernel

theorem tail_step_conv_blockStep10 :
    convWithTail tail_step_conv_block10 correction0 tail_step_conv_result11 = tail_step_conv_result10 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached tail_step_conv_blockStep10"
  out.flush

theorem headStep62_conv_blockStep0 :
    convWithTail headStep62_conv_block0 head63 headStep62_conv_result1 = headStep62_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep62_conv_blockStep0"
  out.flush

theorem headStep59_conv_blockStep2 :
    convWithTail headStep59_conv_block2 head60 headStep59_conv_result3 = headStep59_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep59_conv_blockStep2"
  out.flush

theorem headStep56_conv_blockStep4 :
    convWithTail headStep56_conv_block4 head57 headStep56_conv_result5 = headStep56_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep56_conv_blockStep4"
  out.flush

theorem headStep55_conv_input :
    ratioA = headStep55_conv_suffix0 := by
  decide +kernel

theorem headStep54_conv_blockStep0 :
    convWithTail headStep54_conv_block0 head55 headStep54_conv_result1 = headStep54_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep54_conv_blockStep0"
  out.flush

theorem headStep51_conv_blockStep2 :
    convWithTail headStep51_conv_block2 head52 headStep51_conv_result3 = headStep51_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep51_conv_blockStep2"
  out.flush

theorem headStep48_conv_blockStep4 :
    convWithTail headStep48_conv_block4 head49 headStep48_conv_result5 = headStep48_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep48_conv_blockStep4"
  out.flush

theorem headStep46_conv_blockStep0 :
    convWithTail headStep46_conv_block0 head47 headStep46_conv_result1 = headStep46_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep46_conv_blockStep0"
  out.flush

theorem headStep43_conv_blockStep2 :
    convWithTail headStep43_conv_block2 head44 headStep43_conv_result3 = headStep43_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep43_conv_blockStep2"
  out.flush

theorem headStep40_conv_blockStep4 :
    convWithTail headStep40_conv_block4 head41 headStep40_conv_result5 = headStep40_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep40_conv_blockStep4"
  out.flush

theorem headStep39_conv_input :
    ratioA = headStep39_conv_suffix0 := by
  decide +kernel

theorem headStep38_conv_blockStep0 :
    convWithTail headStep38_conv_block0 head39 headStep38_conv_result1 = headStep38_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep38_conv_blockStep0"
  out.flush

theorem headStep35_conv_blockStep2 :
    convWithTail headStep35_conv_block2 head36 headStep35_conv_result3 = headStep35_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep35_conv_blockStep2"
  out.flush

theorem headStep32_conv_blockStep4 :
    convWithTail headStep32_conv_block4 head33 headStep32_conv_result5 = headStep32_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep32_conv_blockStep4"
  out.flush

theorem headStep30_conv_blockStep0 :
    convWithTail headStep30_conv_block0 head31 headStep30_conv_result1 = headStep30_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep30_conv_blockStep0"
  out.flush

theorem headStep27_conv_blockStep2 :
    convWithTail headStep27_conv_block2 head28 headStep27_conv_result3 = headStep27_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep27_conv_blockStep2"
  out.flush

theorem headStep24_conv_blockStep4 :
    convWithTail headStep24_conv_block4 head25 headStep24_conv_result5 = headStep24_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep24_conv_blockStep4"
  out.flush

theorem headStep23_conv_input :
    ratioA = headStep23_conv_suffix0 := by
  decide +kernel

theorem headStep22_conv_blockStep0 :
    convWithTail headStep22_conv_block0 head23 headStep22_conv_result1 = headStep22_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep22_conv_blockStep0"
  out.flush

theorem headStep19_conv_blockStep2 :
    convWithTail headStep19_conv_block2 head20 headStep19_conv_result3 = headStep19_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep19_conv_blockStep2"
  out.flush

theorem headStep16_conv_blockStep4 :
    convWithTail headStep16_conv_block4 head17 headStep16_conv_result5 = headStep16_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep16_conv_blockStep4"
  out.flush

theorem headStep14_conv_blockStep0 :
    convWithTail headStep14_conv_block0 head15 headStep14_conv_result1 = headStep14_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep14_conv_blockStep0"
  out.flush

theorem headStep11_conv_blockStep2 :
    convWithTail headStep11_conv_block2 head12 headStep11_conv_result3 = headStep11_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep11_conv_blockStep2"
  out.flush

theorem headStep8_conv_blockStep4 :
    convWithTail headStep8_conv_block4 head9 headStep8_conv_result5 = headStep8_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep8_conv_blockStep4"
  out.flush

theorem headStep7_conv_input :
    ratioA = headStep7_conv_suffix0 := by
  decide +kernel

theorem headStep6_conv_blockStep0 :
    convWithTail headStep6_conv_block0 head7 headStep6_conv_result1 = headStep6_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep6_conv_blockStep0"
  out.flush

theorem headStep3_conv_blockStep2 :
    convWithTail headStep3_conv_block2 head4 headStep3_conv_result3 = headStep3_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep3_conv_blockStep2"
  out.flush

theorem headStep0_conv_blockStep4 :
    convWithTail headStep0_conv_block4 head1 headStep0_conv_result5 = headStep0_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep0_conv_blockStep4"
  out.flush

theorem powerStep8 :
    convI pI power7 = power8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 165: reached powerStep8"
  out.flush

theorem powerStep11_conv_blockStep0 :
    convWithTail powerStep11_conv_block0 power10 powerStep11_conv_result1 = powerStep11_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep11_conv_blockStep0"
  out.flush

theorem powerStep15_conv_blockStep1 :
    convWithTail powerStep15_conv_block1 power14 powerStep15_conv_result2 = powerStep15_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep15_conv_blockStep1"
  out.flush

theorem powerStep15_conv_input :
    pI = powerStep15_conv_suffix0 := by
  decide +kernel

end Grothe.HaagerupCanonical.Trace
