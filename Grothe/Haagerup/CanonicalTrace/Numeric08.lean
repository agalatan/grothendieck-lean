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

theorem coefficientStep62 :
    c62 * (((2*62+1)^2 : Nat) : Rat) / ((4*(62+1)*(62+2) : Nat) : Rat) = c63 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 64: reached coefficientStep62"
  out.flush

theorem differenceStep2_66 :
    d1_66 - d1_67 = d2_66 := by
  decide +kernel

theorem correctionStep5 :
    (addL [ofRatI d5_64] (convI ratioY correction6)).take 170 = correction5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 84: reached correctionStep5"
  out.flush

theorem correctionStep4_conv_blockStep17 :
    convWithTail correctionStep4_conv_block17 correction5 correctionStep4_conv_result18 = correctionStep4_conv_result17 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep17"
  out.flush

theorem correctionStep4_conv_blockStep2 :
    convWithTail correctionStep4_conv_block2 correction5 correctionStep4_conv_result3 = correctionStep4_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep2"
  out.flush

theorem correctionStep3_conv_blockStep8 :
    convWithTail correctionStep3_conv_block8 correction4 correctionStep3_conv_result9 = correctionStep3_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep8"
  out.flush

theorem correctionStep2_conv_blockStep10 :
    convWithTail correctionStep2_conv_block10 correction3 correctionStep2_conv_result11 = correctionStep2_conv_result10 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep10"
  out.flush

theorem correctionStep1_conv_blockStep12 :
    convWithTail correctionStep1_conv_block12 correction2 correctionStep1_conv_result13 = correctionStep1_conv_result12 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep12"
  out.flush

theorem correctionStep0_conv_blockStep14 :
    convWithTail correctionStep0_conv_block14 correction1 correctionStep0_conv_result15 = correctionStep0_conv_result14 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep14"
  out.flush

theorem tail_step_conv_blockStep11 :
    convWithTail tail_step_conv_block11 correction0 tail_step_conv_result12 = tail_step_conv_result11 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached tail_step_conv_blockStep11"
  out.flush

theorem headStep62_conv_blockStep1 :
    convWithTail headStep62_conv_block1 head63 headStep62_conv_result2 = headStep62_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep62_conv_blockStep1"
  out.flush

theorem headStep60_conv_input :
    ratioA = headStep60_conv_suffix0 := by
  decide +kernel

theorem headStep59_conv_blockStep3 :
    convWithTail headStep59_conv_block3 head60 headStep59_conv_result4 = headStep59_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep59_conv_blockStep3"
  out.flush

theorem headStep56_conv_blockStep5 :
    convWithTail headStep56_conv_block5 head57 headStep56_conv_result6 = headStep56_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep56_conv_blockStep5"
  out.flush

theorem headStep54_conv_blockStep1 :
    convWithTail headStep54_conv_block1 head55 headStep54_conv_result2 = headStep54_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep54_conv_blockStep1"
  out.flush

theorem headStep51_conv_blockStep3 :
    convWithTail headStep51_conv_block3 head52 headStep51_conv_result4 = headStep51_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep51_conv_blockStep3"
  out.flush

theorem headStep48_conv_blockStep5 :
    convWithTail headStep48_conv_block5 head49 headStep48_conv_result6 = headStep48_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep48_conv_blockStep5"
  out.flush

theorem headStep46_conv_blockStep1 :
    convWithTail headStep46_conv_block1 head47 headStep46_conv_result2 = headStep46_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep46_conv_blockStep1"
  out.flush

theorem headStep44_conv_input :
    ratioA = headStep44_conv_suffix0 := by
  decide +kernel

theorem headStep43_conv_blockStep3 :
    convWithTail headStep43_conv_block3 head44 headStep43_conv_result4 = headStep43_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep43_conv_blockStep3"
  out.flush

theorem headStep40_conv_blockStep5 :
    convWithTail headStep40_conv_block5 head41 headStep40_conv_result6 = headStep40_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep40_conv_blockStep5"
  out.flush

theorem headStep38_conv_blockStep1 :
    convWithTail headStep38_conv_block1 head39 headStep38_conv_result2 = headStep38_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep38_conv_blockStep1"
  out.flush

theorem headStep35_conv_blockStep3 :
    convWithTail headStep35_conv_block3 head36 headStep35_conv_result4 = headStep35_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep35_conv_blockStep3"
  out.flush

theorem headStep32_conv_blockStep5 :
    convWithTail headStep32_conv_block5 head33 headStep32_conv_result6 = headStep32_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep32_conv_blockStep5"
  out.flush

theorem headStep30_conv_blockStep1 :
    convWithTail headStep30_conv_block1 head31 headStep30_conv_result2 = headStep30_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep30_conv_blockStep1"
  out.flush

theorem headStep28_conv_input :
    ratioA = headStep28_conv_suffix0 := by
  decide +kernel

theorem headStep27_conv_blockStep3 :
    convWithTail headStep27_conv_block3 head28 headStep27_conv_result4 = headStep27_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep27_conv_blockStep3"
  out.flush

theorem headStep24_conv_blockStep5 :
    convWithTail headStep24_conv_block5 head25 headStep24_conv_result6 = headStep24_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep24_conv_blockStep5"
  out.flush

theorem headStep22_conv_blockStep1 :
    convWithTail headStep22_conv_block1 head23 headStep22_conv_result2 = headStep22_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep22_conv_blockStep1"
  out.flush

theorem headStep19_conv_blockStep3 :
    convWithTail headStep19_conv_block3 head20 headStep19_conv_result4 = headStep19_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep19_conv_blockStep3"
  out.flush

theorem headStep16_conv_blockStep5 :
    convWithTail headStep16_conv_block5 head17 headStep16_conv_result6 = headStep16_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep16_conv_blockStep5"
  out.flush

theorem headStep14_conv_blockStep1 :
    convWithTail headStep14_conv_block1 head15 headStep14_conv_result2 = headStep14_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep14_conv_blockStep1"
  out.flush

theorem headStep12_conv_input :
    ratioA = headStep12_conv_suffix0 := by
  decide +kernel

theorem headStep11_conv_blockStep3 :
    convWithTail headStep11_conv_block3 head12 headStep11_conv_result4 = headStep11_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep11_conv_blockStep3"
  out.flush

theorem headStep8_conv_blockStep5 :
    convWithTail headStep8_conv_block5 head9 headStep8_conv_result6 = headStep8_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep8_conv_blockStep5"
  out.flush

theorem headStep6_conv_blockStep1 :
    convWithTail headStep6_conv_block1 head7 headStep6_conv_result2 = headStep6_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep6_conv_blockStep1"
  out.flush

theorem headStep3_conv_blockStep3 :
    convWithTail headStep3_conv_block3 head4 headStep3_conv_result4 = headStep3_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep3_conv_blockStep3"
  out.flush

theorem headStep0_conv_blockStep5 :
    convWithTail headStep0_conv_block5 head1 headStep0_conv_result6 = headStep0_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep0_conv_blockStep5"
  out.flush

theorem powerStep1 :
    convI pI power0 = power1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 158: reached powerStep1"
  out.flush

theorem powerStep11_conv_blockStep1 :
    convWithTail powerStep11_conv_block1 power10 powerStep11_conv_result2 = powerStep11_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep11_conv_blockStep1"
  out.flush

theorem seed_product_step_conv_blockStep10 :
    convWithTail seed_product_step_conv_block10 power17 seed_product_step_conv_result11 = seed_product_step_conv_result10 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached seed_product_step_conv_blockStep10"
  out.flush

theorem seed_product_step_conv_blockStep0 :
    convWithTail seed_product_step_conv_block0 power17 seed_product_step_conv_result1 = seed_product_step_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached seed_product_step_conv_blockStep0"
  out.flush

end Grothe.HaagerupCanonical.Trace
