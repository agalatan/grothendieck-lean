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

theorem coefficientStep11 :
    c11 * (((2*11+1)^2 : Nat) : Rat) / ((4*(11+1)*(11+2) : Nat) : Rat) = c12 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 13: reached coefficientStep11"
  out.flush

theorem coefficientStep16 :
    c16 * (((2*16+1)^2 : Nat) : Rat) / ((4*(16+1)*(16+2) : Nat) : Rat) = c17 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 18: reached coefficientStep16"
  out.flush

theorem coefficientStep24 :
    c24 * (((2*24+1)^2 : Nat) : Rat) / ((4*(24+1)*(24+2) : Nat) : Rat) = c25 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 26: reached coefficientStep24"
  out.flush

theorem coefficientStep32 :
    c32 * (((2*32+1)^2 : Nat) : Rat) / ((4*(32+1)*(32+2) : Nat) : Rat) = c33 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 34: reached coefficientStep32"
  out.flush

theorem coefficientStep40 :
    c40 * (((2*40+1)^2 : Nat) : Rat) / ((4*(40+1)*(40+2) : Nat) : Rat) = c41 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 42: reached coefficientStep40"
  out.flush

theorem coefficientStep50 :
    c50 * (((2*50+1)^2 : Nat) : Rat) / ((4*(50+1)*(50+2) : Nat) : Rat) = c51 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 52: reached coefficientStep50"
  out.flush

theorem coefficientStep66 :
    c66 * (((2*66+1)^2 : Nat) : Rat) / ((4*(66+1)*(66+2) : Nat) : Rat) = c67 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 68: reached coefficientStep66"
  out.flush

theorem differenceStep3_65 :
    d2_65 - d2_66 = d3_65 := by
  decide +kernel

theorem correctionStep3_conv_blockStep9 :
    convWithTail correctionStep3_conv_block9 correction4 correctionStep3_conv_result10 = correctionStep3_conv_result9 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep9"
  out.flush

theorem correctionStep2_conv_blockStep11 :
    convWithTail correctionStep2_conv_block11 correction3 correctionStep2_conv_result12 = correctionStep2_conv_result11 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep11"
  out.flush

theorem correctionStep1_conv_blockStep13 :
    convWithTail correctionStep1_conv_block13 correction2 correctionStep1_conv_result14 = correctionStep1_conv_result13 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep13"
  out.flush

theorem correctionStep1_conv_input :
    ratioY = correctionStep1_conv_suffix0 := by
  decide +kernel

theorem correctionStep0_conv_blockStep15 :
    convWithTail correctionStep0_conv_block15 correction1 correctionStep0_conv_result16 = correctionStep0_conv_result15 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep15"
  out.flush

theorem tail_step_conv_blockStep12 :
    convWithTail tail_step_conv_block12 correction0 tail_step_conv_result13 = tail_step_conv_result12 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached tail_step_conv_blockStep12"
  out.flush

theorem headStep62_conv_blockStep2 :
    convWithTail headStep62_conv_block2 head63 headStep62_conv_result3 = headStep62_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep62_conv_blockStep2"
  out.flush

theorem headStep59_conv_blockStep4 :
    convWithTail headStep59_conv_block4 head60 headStep59_conv_result5 = headStep59_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep59_conv_blockStep4"
  out.flush

theorem headStep57_conv_blockStep0 :
    convWithTail headStep57_conv_block0 head58 headStep57_conv_result1 = headStep57_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep57_conv_blockStep0"
  out.flush

theorem headStep56_conv_input :
    ratioA = headStep56_conv_suffix0 := by
  decide +kernel

theorem headStep54_conv_blockStep2 :
    convWithTail headStep54_conv_block2 head55 headStep54_conv_result3 = headStep54_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep54_conv_blockStep2"
  out.flush

theorem headStep51_conv_blockStep4 :
    convWithTail headStep51_conv_block4 head52 headStep51_conv_result5 = headStep51_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep51_conv_blockStep4"
  out.flush

theorem headStep49_conv_blockStep0 :
    convWithTail headStep49_conv_block0 head50 headStep49_conv_result1 = headStep49_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep49_conv_blockStep0"
  out.flush

theorem headStep46_conv_blockStep2 :
    convWithTail headStep46_conv_block2 head47 headStep46_conv_result3 = headStep46_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep46_conv_blockStep2"
  out.flush

theorem headStep43_conv_blockStep4 :
    convWithTail headStep43_conv_block4 head44 headStep43_conv_result5 = headStep43_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep43_conv_blockStep4"
  out.flush

theorem headStep41_conv_blockStep0 :
    convWithTail headStep41_conv_block0 head42 headStep41_conv_result1 = headStep41_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep41_conv_blockStep0"
  out.flush

theorem headStep40_conv_input :
    ratioA = headStep40_conv_suffix0 := by
  decide +kernel

theorem headStep38_conv_blockStep2 :
    convWithTail headStep38_conv_block2 head39 headStep38_conv_result3 = headStep38_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep38_conv_blockStep2"
  out.flush

theorem headStep35_conv_blockStep4 :
    convWithTail headStep35_conv_block4 head36 headStep35_conv_result5 = headStep35_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep35_conv_blockStep4"
  out.flush

theorem headStep33_conv_blockStep0 :
    convWithTail headStep33_conv_block0 head34 headStep33_conv_result1 = headStep33_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep33_conv_blockStep0"
  out.flush

theorem headStep30_conv_blockStep2 :
    convWithTail headStep30_conv_block2 head31 headStep30_conv_result3 = headStep30_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep30_conv_blockStep2"
  out.flush

theorem headStep27_conv_blockStep4 :
    convWithTail headStep27_conv_block4 head28 headStep27_conv_result5 = headStep27_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep27_conv_blockStep4"
  out.flush

theorem headStep25_conv_blockStep0 :
    convWithTail headStep25_conv_block0 head26 headStep25_conv_result1 = headStep25_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep25_conv_blockStep0"
  out.flush

theorem headStep24_conv_input :
    ratioA = headStep24_conv_suffix0 := by
  decide +kernel

theorem headStep22_conv_blockStep2 :
    convWithTail headStep22_conv_block2 head23 headStep22_conv_result3 = headStep22_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep22_conv_blockStep2"
  out.flush

theorem headStep19_conv_blockStep4 :
    convWithTail headStep19_conv_block4 head20 headStep19_conv_result5 = headStep19_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep19_conv_blockStep4"
  out.flush

theorem headStep17_conv_blockStep0 :
    convWithTail headStep17_conv_block0 head18 headStep17_conv_result1 = headStep17_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep17_conv_blockStep0"
  out.flush

theorem headStep14_conv_blockStep2 :
    convWithTail headStep14_conv_block2 head15 headStep14_conv_result3 = headStep14_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep14_conv_blockStep2"
  out.flush

theorem headStep11_conv_blockStep4 :
    convWithTail headStep11_conv_block4 head12 headStep11_conv_result5 = headStep11_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep11_conv_blockStep4"
  out.flush

theorem headStep9_conv_blockStep0 :
    convWithTail headStep9_conv_block0 head10 headStep9_conv_result1 = headStep9_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep9_conv_blockStep0"
  out.flush

theorem headStep8_conv_input :
    ratioA = headStep8_conv_suffix0 := by
  decide +kernel

theorem headStep6_conv_blockStep2 :
    convWithTail headStep6_conv_block2 head7 headStep6_conv_result3 = headStep6_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep6_conv_blockStep2"
  out.flush

theorem headStep3_conv_blockStep4 :
    convWithTail headStep3_conv_block4 head4 headStep3_conv_result5 = headStep3_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep3_conv_blockStep4"
  out.flush

theorem headStep1_conv_blockStep0 :
    convWithTail headStep1_conv_block0 head2 headStep1_conv_result1 = headStep1_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep1_conv_blockStep0"
  out.flush

theorem powerStep4 :
    convI pI power3 = power4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 161: reached powerStep4"
  out.flush

theorem powerStep11_conv_blockStep2 :
    convWithTail powerStep11_conv_block2 power10 powerStep11_conv_result3 = powerStep11_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep11_conv_blockStep2"
  out.flush

theorem powerStep14_conv_input :
    pI = powerStep14_conv_suffix0 := by
  decide +kernel

theorem seed_product_step_conv_blockStep11 :
    convWithTail seed_product_step_conv_block11 power17 seed_product_step_conv_result12 = seed_product_step_conv_result11 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached seed_product_step_conv_blockStep11"
  out.flush

theorem seed_product_step_conv_blockStep1 :
    convWithTail seed_product_step_conv_block1 power17 seed_product_step_conv_result2 = seed_product_step_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached seed_product_step_conv_blockStep1"
  out.flush

end Grothe.HaagerupCanonical.Trace
