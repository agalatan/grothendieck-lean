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

theorem coefficientStep29 :
    c29 * (((2*29+1)^2 : Nat) : Rat) / ((4*(29+1)*(29+2) : Nat) : Rat) = c30 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 31: reached coefficientStep29"
  out.flush

theorem coefficientStep45 :
    c45 * (((2*45+1)^2 : Nat) : Rat) / ((4*(45+1)*(45+2) : Nat) : Rat) = c46 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 47: reached coefficientStep45"
  out.flush

theorem coefficientStep61 :
    c61 * (((2*61+1)^2 : Nat) : Rat) / ((4*(61+1)*(61+2) : Nat) : Rat) = c62 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 63: reached coefficientStep61"
  out.flush

theorem differenceStep1_67 :
    d0_67 - d0_68 = d1_67 := by
  decide +kernel

theorem differenceStep3_64 :
    d2_64 - d2_65 = d3_64 := by
  decide +kernel

theorem differenceStep5_65 :
    d4_65 - d4_66 = d5_65 := by
  decide +kernel

theorem differenceStep8_66 :
    d7_66 - d7_67 = d8_66 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 84: reached difference_order_8"
  out.flush

theorem ratioY_step_conv_blockStep11 :
    convWithTail ratioY_step_conv_block11 ratioA ratioY_step_conv_result12 = ratioY_step_conv_result11 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached ratioY_step_conv_blockStep11"
  out.flush

theorem ratioY_step_conv_blockStep8 :
    convWithTail ratioY_step_conv_block8 ratioA ratioY_step_conv_result9 = ratioY_step_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached ratioY_step_conv_blockStep8"
  out.flush

theorem correctionStep8_conv_blockStep16 :
    convWithTail correctionStep8_conv_block16 correction9 correctionStep8_conv_result17 = correctionStep8_conv_result16 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep8_conv_blockStep16"
  out.flush

theorem correctionStep8_conv_blockStep0 :
    convWithTail correctionStep8_conv_block0 correction9 correctionStep8_conv_result1 = correctionStep8_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep8_conv_blockStep0"
  out.flush

theorem correctionStep7_conv_blockStep10 :
    convWithTail correctionStep7_conv_block10 correction8 correctionStep7_conv_result11 = correctionStep7_conv_result10 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep7_conv_blockStep10"
  out.flush

theorem correctionStep6_conv_blockStep15 :
    convWithTail correctionStep6_conv_block15 correction7 correctionStep6_conv_result16 = correctionStep6_conv_result15 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep6_conv_blockStep15"
  out.flush

theorem correctionStep5_conv_blockStep20 :
    convWithTail correctionStep5_conv_block20 correction6 correctionStep5_conv_result21 = correctionStep5_conv_result20 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep5_conv_blockStep20"
  out.flush

theorem correctionStep5_conv_blockStep4 :
    convWithTail correctionStep5_conv_block4 correction6 correctionStep5_conv_result5 = correctionStep5_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep5_conv_blockStep4"
  out.flush

theorem correctionStep4_conv_blockStep9 :
    convWithTail correctionStep4_conv_block9 correction5 correctionStep4_conv_result10 = correctionStep4_conv_result9 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep9"
  out.flush

theorem correctionStep3_conv_blockStep14 :
    convWithTail correctionStep3_conv_block14 correction4 correctionStep3_conv_result15 = correctionStep3_conv_result14 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep14"
  out.flush

theorem correctionStep2_conv_blockStep19 :
    convWithTail correctionStep2_conv_block19 correction3 correctionStep2_conv_result20 = correctionStep2_conv_result19 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep19"
  out.flush

theorem correctionStep2_conv_blockStep3 :
    convWithTail correctionStep2_conv_block3 correction3 correctionStep2_conv_result4 = correctionStep2_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep3"
  out.flush

theorem correctionStep2_conv_input :
    ratioY = correctionStep2_conv_suffix0 := by
  decide +kernel

theorem correctionStep1_conv_blockStep8 :
    convWithTail correctionStep1_conv_block8 correction2 correctionStep1_conv_result9 = correctionStep1_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep8"
  out.flush

theorem correctionStep0_conv_blockStep13 :
    convWithTail correctionStep0_conv_block13 correction1 correctionStep0_conv_result14 = correctionStep0_conv_result13 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep13"
  out.flush

theorem tail_step_conv_blockStep10 :
    convWithTail tail_step_conv_block10 correction0 tail_step_conv_result11 = tail_step_conv_result10 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached tail_step_conv_blockStep10"
  out.flush

theorem headStep62_conv_blockStep2 :
    convWithTail headStep62_conv_block2 head63 headStep62_conv_result3 = headStep62_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep62_conv_blockStep2"
  out.flush

theorem headStep60_conv_blockStep2 :
    convWithTail headStep60_conv_block2 head61 headStep60_conv_result3 = headStep60_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep60_conv_blockStep2"
  out.flush

theorem headStep60_conv_input :
    ratioA = headStep60_conv_suffix0 := by
  decide +kernel

theorem headStep58_conv_blockStep2 :
    convWithTail headStep58_conv_block2 head59 headStep58_conv_result3 = headStep58_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep58_conv_blockStep2"
  out.flush

theorem headStep56_conv_blockStep2 :
    convWithTail headStep56_conv_block2 head57 headStep56_conv_result3 = headStep56_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep56_conv_blockStep2"
  out.flush

theorem headStep54_conv_blockStep2 :
    convWithTail headStep54_conv_block2 head55 headStep54_conv_result3 = headStep54_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep54_conv_blockStep2"
  out.flush

theorem headStep52_conv_blockStep2 :
    convWithTail headStep52_conv_block2 head53 headStep52_conv_result3 = headStep52_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep52_conv_blockStep2"
  out.flush

theorem headStep50_conv_blockStep2 :
    convWithTail headStep50_conv_block2 head51 headStep50_conv_result3 = headStep50_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep50_conv_blockStep2"
  out.flush

theorem headStep48_conv_blockStep2 :
    convWithTail headStep48_conv_block2 head49 headStep48_conv_result3 = headStep48_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep48_conv_blockStep2"
  out.flush

theorem headStep46_conv_blockStep2 :
    convWithTail headStep46_conv_block2 head47 headStep46_conv_result3 = headStep46_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep46_conv_blockStep2"
  out.flush

theorem headStep44_conv_blockStep2 :
    convWithTail headStep44_conv_block2 head45 headStep44_conv_result3 = headStep44_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep44_conv_blockStep2"
  out.flush

theorem headStep44_conv_input :
    ratioA = headStep44_conv_suffix0 := by
  decide +kernel

theorem headStep42_conv_blockStep2 :
    convWithTail headStep42_conv_block2 head43 headStep42_conv_result3 = headStep42_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep42_conv_blockStep2"
  out.flush

theorem headStep40_conv_blockStep8 :
    convWithTail headStep40_conv_block8 head41 headStep40_conv_result9 = headStep40_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep40_conv_blockStep8"
  out.flush

theorem headStep40_conv_blockStep2 :
    convWithTail headStep40_conv_block2 head41 headStep40_conv_result3 = headStep40_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep40_conv_blockStep2"
  out.flush

theorem headStep38_conv_blockStep2 :
    convWithTail headStep38_conv_block2 head39 headStep38_conv_result3 = headStep38_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep38_conv_blockStep2"
  out.flush

theorem headStep36_conv_blockStep2 :
    convWithTail headStep36_conv_block2 head37 headStep36_conv_result3 = headStep36_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep36_conv_blockStep2"
  out.flush

theorem headStep34_conv_blockStep2 :
    convWithTail headStep34_conv_block2 head35 headStep34_conv_result3 = headStep34_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep34_conv_blockStep2"
  out.flush

theorem headStep32_conv_blockStep2 :
    convWithTail headStep32_conv_block2 head33 headStep32_conv_result3 = headStep32_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep32_conv_blockStep2"
  out.flush

theorem headStep30_conv_blockStep2 :
    convWithTail headStep30_conv_block2 head31 headStep30_conv_result3 = headStep30_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep30_conv_blockStep2"
  out.flush

theorem headStep28_conv_blockStep2 :
    convWithTail headStep28_conv_block2 head29 headStep28_conv_result3 = headStep28_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep28_conv_blockStep2"
  out.flush

theorem headStep28_conv_input :
    ratioA = headStep28_conv_suffix0 := by
  decide +kernel

theorem headStep26_conv_blockStep2 :
    convWithTail headStep26_conv_block2 head27 headStep26_conv_result3 = headStep26_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep26_conv_blockStep2"
  out.flush

theorem headStep24_conv_blockStep8 :
    convWithTail headStep24_conv_block8 head25 headStep24_conv_result9 = headStep24_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep24_conv_blockStep8"
  out.flush

theorem headStep24_conv_blockStep2 :
    convWithTail headStep24_conv_block2 head25 headStep24_conv_result3 = headStep24_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep24_conv_blockStep2"
  out.flush

theorem headStep22_conv_blockStep2 :
    convWithTail headStep22_conv_block2 head23 headStep22_conv_result3 = headStep22_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep22_conv_blockStep2"
  out.flush

theorem headStep20_conv_blockStep2 :
    convWithTail headStep20_conv_block2 head21 headStep20_conv_result3 = headStep20_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep20_conv_blockStep2"
  out.flush

theorem headStep18_conv_blockStep2 :
    convWithTail headStep18_conv_block2 head19 headStep18_conv_result3 = headStep18_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep18_conv_blockStep2"
  out.flush

theorem headStep16_conv_blockStep2 :
    convWithTail headStep16_conv_block2 head17 headStep16_conv_result3 = headStep16_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep16_conv_blockStep2"
  out.flush

theorem headStep14_conv_blockStep2 :
    convWithTail headStep14_conv_block2 head15 headStep14_conv_result3 = headStep14_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep14_conv_blockStep2"
  out.flush

theorem headStep12_conv_blockStep2 :
    convWithTail headStep12_conv_block2 head13 headStep12_conv_result3 = headStep12_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep12_conv_blockStep2"
  out.flush

theorem headStep12_conv_input :
    ratioA = headStep12_conv_suffix0 := by
  decide +kernel

theorem headStep10_conv_blockStep2 :
    convWithTail headStep10_conv_block2 head11 headStep10_conv_result3 = headStep10_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep10_conv_blockStep2"
  out.flush

theorem headStep8_conv_blockStep8 :
    convWithTail headStep8_conv_block8 head9 headStep8_conv_result9 = headStep8_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep8_conv_blockStep8"
  out.flush

theorem headStep8_conv_blockStep2 :
    convWithTail headStep8_conv_block2 head9 headStep8_conv_result3 = headStep8_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep8_conv_blockStep2"
  out.flush

theorem headStep6_conv_blockStep2 :
    convWithTail headStep6_conv_block2 head7 headStep6_conv_result3 = headStep6_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep6_conv_blockStep2"
  out.flush

theorem headStep4_conv_blockStep2 :
    convWithTail headStep4_conv_block2 head5 headStep4_conv_result3 = headStep4_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep4_conv_blockStep2"
  out.flush

theorem headStep2_conv_blockStep2 :
    convWithTail headStep2_conv_block2 head3 headStep2_conv_result3 = headStep2_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep2_conv_blockStep2"
  out.flush

theorem headStep0_conv_blockStep2 :
    convWithTail headStep0_conv_block2 head1 headStep0_conv_result3 = headStep0_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep0_conv_blockStep2"
  out.flush

theorem final_step_conv_blockStep4 :
    convWithTail final_step_conv_block4 head0 final_step_conv_result5 = final_step_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached final_step_conv_blockStep4"
  out.flush

theorem powerStep1 :
    convI pI power0 = power1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 171: reached powerStep1"
  out.flush

theorem powerStep7_conv_blockStep2 :
    convWithTail powerStep7_conv_block2 power6 powerStep7_conv_result3 = powerStep7_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep7_conv_blockStep2"
  out.flush

theorem powerStep13_conv_blockStep3 :
    convWithTail powerStep13_conv_block3 power12 powerStep13_conv_result4 = powerStep13_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep13_conv_blockStep3"
  out.flush

theorem powerStep13_conv_blockStep2 :
    convWithTail powerStep13_conv_block2 power12 powerStep13_conv_result3 = powerStep13_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep13_conv_blockStep2"
  out.flush

theorem seed_product_step_conv_blockStep0 :
    convWithTail seed_product_step_conv_block0 power17 seed_product_step_conv_result1 = seed_product_step_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached seed_product_step_conv_blockStep0"
  out.flush

theorem inverseProduct_step_conv_blockStep5 :
    convWithTail inverseProduct_step_conv_block5 inverseD inverseProduct_step_conv_result6 = inverseProduct_step_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached inverseProduct_step_conv_blockStep5"
  out.flush

theorem inverseProduct_step_conv_input :
    rI = inverseProduct_step_conv_suffix0 := by
  decide +kernel

end Grothe.HaagerupCanonical.Trace
