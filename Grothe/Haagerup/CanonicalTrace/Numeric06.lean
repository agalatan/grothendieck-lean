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

theorem coefficientStep1 :
    c1 * (((2*1+1)^2 : Nat) : Rat) / ((4*(1+1)*(1+2) : Nat) : Rat) = c2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 3: reached coefficientStep1"
  out.flush

theorem coefficientStep5 :
    c5 * (((2*5+1)^2 : Nat) : Rat) / ((4*(5+1)*(5+2) : Nat) : Rat) = c6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 7: reached coefficientStep5"
  out.flush

theorem coefficientStep9 :
    c9 * (((2*9+1)^2 : Nat) : Rat) / ((4*(9+1)*(9+2) : Nat) : Rat) = c10 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 11: reached coefficientStep9"
  out.flush

theorem coefficientStep14 :
    c14 * (((2*14+1)^2 : Nat) : Rat) / ((4*(14+1)*(14+2) : Nat) : Rat) = c15 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 16: reached coefficientStep14"
  out.flush

theorem coefficientStep22 :
    c22 * (((2*22+1)^2 : Nat) : Rat) / ((4*(22+1)*(22+2) : Nat) : Rat) = c23 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 24: reached coefficientStep22"
  out.flush

theorem coefficientStep30 :
    c30 * (((2*30+1)^2 : Nat) : Rat) / ((4*(30+1)*(30+2) : Nat) : Rat) = c31 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 32: reached coefficientStep30"
  out.flush

theorem coefficientStep38 :
    c38 * (((2*38+1)^2 : Nat) : Rat) / ((4*(38+1)*(38+2) : Nat) : Rat) = c39 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 40: reached coefficientStep38"
  out.flush

theorem coefficientStep48 :
    c48 * (((2*48+1)^2 : Nat) : Rat) / ((4*(48+1)*(48+2) : Nat) : Rat) = c49 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 50: reached coefficientStep48"
  out.flush

theorem coefficientStep61 :
    c61 * (((2*61+1)^2 : Nat) : Rat) / ((4*(61+1)*(61+2) : Nat) : Rat) = c62 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 63: reached coefficientStep61"
  out.flush

theorem differenceStep2_65 :
    d1_65 - d1_66 = d2_65 := by
  decide +kernel

theorem r_interval_eq :
    rlQ.map ofRatI = rI := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 81: reached r_interval_eq"
  out.flush

theorem correctionStep4_conv_blockStep9 :
    convWithTail correctionStep4_conv_block9 correction5 correctionStep4_conv_result10 = correctionStep4_conv_result9 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep9"
  out.flush

theorem correctionStep3_conv_blockStep10 :
    convWithTail correctionStep3_conv_block10 correction4 correctionStep3_conv_result11 = correctionStep3_conv_result10 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep10"
  out.flush

theorem correctionStep2_conv_blockStep12 :
    convWithTail correctionStep2_conv_block12 correction3 correctionStep2_conv_result13 = correctionStep2_conv_result12 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep12"
  out.flush

theorem correctionStep1_conv_blockStep14 :
    convWithTail correctionStep1_conv_block14 correction2 correctionStep1_conv_result15 = correctionStep1_conv_result14 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep14"
  out.flush

theorem correctionStep0_conv_blockStep16 :
    convWithTail correctionStep0_conv_block16 correction1 correctionStep0_conv_result17 = correctionStep0_conv_result16 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep16"
  out.flush

theorem correctionStep0_conv_blockStep0 :
    convWithTail correctionStep0_conv_block0 correction1 correctionStep0_conv_result1 = correctionStep0_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep0"
  out.flush

theorem headStep62_conv_blockStep3 :
    convWithTail headStep62_conv_block3 head63 headStep62_conv_result4 = headStep62_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep62_conv_blockStep3"
  out.flush

theorem headStep61_conv_input :
    ratioA = headStep61_conv_suffix0 := by
  decide +kernel

theorem headStep59_conv_blockStep5 :
    convWithTail headStep59_conv_block5 head60 headStep59_conv_result6 = headStep59_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep59_conv_blockStep5"
  out.flush

theorem headStep57_conv_blockStep1 :
    convWithTail headStep57_conv_block1 head58 headStep57_conv_result2 = headStep57_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep57_conv_blockStep1"
  out.flush

theorem headStep54_conv_blockStep3 :
    convWithTail headStep54_conv_block3 head55 headStep54_conv_result4 = headStep54_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep54_conv_blockStep3"
  out.flush

theorem headStep51_conv_blockStep5 :
    convWithTail headStep51_conv_block5 head52 headStep51_conv_result6 = headStep51_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep51_conv_blockStep5"
  out.flush

theorem headStep49_conv_blockStep1 :
    convWithTail headStep49_conv_block1 head50 headStep49_conv_result2 = headStep49_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep49_conv_blockStep1"
  out.flush

theorem headStep46_conv_blockStep3 :
    convWithTail headStep46_conv_block3 head47 headStep46_conv_result4 = headStep46_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep46_conv_blockStep3"
  out.flush

theorem headStep45_conv_input :
    ratioA = headStep45_conv_suffix0 := by
  decide +kernel

theorem headStep43_conv_blockStep5 :
    convWithTail headStep43_conv_block5 head44 headStep43_conv_result6 = headStep43_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep43_conv_blockStep5"
  out.flush

theorem headStep41_conv_blockStep1 :
    convWithTail headStep41_conv_block1 head42 headStep41_conv_result2 = headStep41_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep41_conv_blockStep1"
  out.flush

theorem headStep38_conv_blockStep3 :
    convWithTail headStep38_conv_block3 head39 headStep38_conv_result4 = headStep38_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep38_conv_blockStep3"
  out.flush

theorem headStep35_conv_blockStep5 :
    convWithTail headStep35_conv_block5 head36 headStep35_conv_result6 = headStep35_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep35_conv_blockStep5"
  out.flush

theorem headStep33_conv_blockStep1 :
    convWithTail headStep33_conv_block1 head34 headStep33_conv_result2 = headStep33_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep33_conv_blockStep1"
  out.flush

theorem headStep30_conv_blockStep3 :
    convWithTail headStep30_conv_block3 head31 headStep30_conv_result4 = headStep30_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep30_conv_blockStep3"
  out.flush

theorem headStep29_conv_input :
    ratioA = headStep29_conv_suffix0 := by
  decide +kernel

theorem headStep27_conv_blockStep5 :
    convWithTail headStep27_conv_block5 head28 headStep27_conv_result6 = headStep27_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep27_conv_blockStep5"
  out.flush

theorem headStep25_conv_blockStep1 :
    convWithTail headStep25_conv_block1 head26 headStep25_conv_result2 = headStep25_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep25_conv_blockStep1"
  out.flush

theorem headStep22_conv_blockStep3 :
    convWithTail headStep22_conv_block3 head23 headStep22_conv_result4 = headStep22_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep22_conv_blockStep3"
  out.flush

theorem headStep19_conv_blockStep5 :
    convWithTail headStep19_conv_block5 head20 headStep19_conv_result6 = headStep19_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep19_conv_blockStep5"
  out.flush

theorem headStep17_conv_blockStep1 :
    convWithTail headStep17_conv_block1 head18 headStep17_conv_result2 = headStep17_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep17_conv_blockStep1"
  out.flush

theorem headStep14_conv_blockStep3 :
    convWithTail headStep14_conv_block3 head15 headStep14_conv_result4 = headStep14_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep14_conv_blockStep3"
  out.flush

theorem headStep13_conv_input :
    ratioA = headStep13_conv_suffix0 := by
  decide +kernel

theorem headStep11_conv_blockStep5 :
    convWithTail headStep11_conv_block5 head12 headStep11_conv_result6 = headStep11_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep11_conv_blockStep5"
  out.flush

theorem headStep9_conv_blockStep1 :
    convWithTail headStep9_conv_block1 head10 headStep9_conv_result2 = headStep9_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep9_conv_blockStep1"
  out.flush

theorem headStep6_conv_blockStep3 :
    convWithTail headStep6_conv_block3 head7 headStep6_conv_result4 = headStep6_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep6_conv_blockStep3"
  out.flush

theorem headStep3_conv_blockStep5 :
    convWithTail headStep3_conv_block5 head4 headStep3_conv_result6 = headStep3_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep3_conv_blockStep5"
  out.flush

theorem headStep1_conv_blockStep1 :
    convWithTail headStep1_conv_block1 head2 headStep1_conv_result2 = headStep1_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep1_conv_blockStep1"
  out.flush

theorem powerEq0 :
    polyPowI pI 0 = power0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 157: reached powerEq0"
  out.flush

theorem powerStep12_conv_blockStep0 :
    convWithTail powerStep12_conv_block0 power11 powerStep12_conv_result1 = powerStep12_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep12_conv_blockStep0"
  out.flush

theorem seed_product_step_conv_blockStep12 :
    convWithTail seed_product_step_conv_block12 power17 seed_product_step_conv_result13 = seed_product_step_conv_result12 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached seed_product_step_conv_blockStep12"
  out.flush

theorem seed_product_step_conv_blockStep2 :
    convWithTail seed_product_step_conv_block2 power17 seed_product_step_conv_result3 = seed_product_step_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached seed_product_step_conv_blockStep2"
  out.flush

end Grothe.HaagerupCanonical.Trace
