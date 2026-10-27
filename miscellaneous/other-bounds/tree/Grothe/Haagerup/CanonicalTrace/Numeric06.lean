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

theorem coefficientStep22 :
    c22 * (((2*22+1)^2 : Nat) : Rat) / ((4*(22+1)*(22+2) : Nat) : Rat) = c23 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 24: reached coefficientStep22"
  out.flush

theorem coefficientStep38 :
    c38 * (((2*38+1)^2 : Nat) : Rat) / ((4*(38+1)*(38+2) : Nat) : Rat) = c39 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 40: reached coefficientStep38"
  out.flush

theorem coefficientStep54 :
    c54 * (((2*54+1)^2 : Nat) : Rat) / ((4*(54+1)*(54+2) : Nat) : Rat) = c55 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 56: reached coefficientStep54"
  out.flush

theorem coefficientStep70 :
    c70 * (((2*70+1)^2 : Nat) : Rat) / ((4*(70+1)*(70+2) : Nat) : Rat) = c71 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 72: reached coefficientStep70"
  out.flush

theorem differenceStep2_66 :
    d1_66 - d1_67 = d2_66 := by
  decide +kernel

theorem differenceStep4_65 :
    d3_65 - d3_66 = d4_65 := by
  decide +kernel

theorem differenceStep6_68 :
    d5_68 - d5_69 = d6_68 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 82: reached difference_order_6"
  out.flush

theorem ratioY_step_conv_blockStep5 :
    convWithTail ratioY_step_conv_block5 ratioA ratioY_step_conv_result6 = ratioY_step_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached ratioY_step_conv_blockStep5"
  out.flush

theorem correctionStep9 :
    (addL [ofRatI d9_64] (convI ratioY correction10)).take 165 = correction9 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 93: reached correctionStep9"
  out.flush

theorem correctionStep8_conv_blockStep9 :
    convWithTail correctionStep8_conv_block9 correction9 correctionStep8_conv_result10 = correctionStep8_conv_result9 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep8_conv_blockStep9"
  out.flush

theorem correctionStep7_conv_blockStep14 :
    convWithTail correctionStep7_conv_block14 correction8 correctionStep7_conv_result15 = correctionStep7_conv_result14 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep7_conv_blockStep14"
  out.flush

theorem correctionStep6_conv_blockStep19 :
    convWithTail correctionStep6_conv_block19 correction7 correctionStep6_conv_result20 = correctionStep6_conv_result19 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep6_conv_blockStep19"
  out.flush

theorem correctionStep6_conv_blockStep3 :
    convWithTail correctionStep6_conv_block3 correction7 correctionStep6_conv_result4 = correctionStep6_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep6_conv_blockStep3"
  out.flush

theorem correctionStep5_conv_blockStep8 :
    convWithTail correctionStep5_conv_block8 correction6 correctionStep5_conv_result9 = correctionStep5_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep5_conv_blockStep8"
  out.flush

theorem correctionStep4_conv_blockStep13 :
    convWithTail correctionStep4_conv_block13 correction5 correctionStep4_conv_result14 = correctionStep4_conv_result13 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep13"
  out.flush

theorem correctionStep3_conv_blockStep18 :
    convWithTail correctionStep3_conv_block18 correction4 correctionStep3_conv_result19 = correctionStep3_conv_result18 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep18"
  out.flush

theorem correctionStep3_conv_blockStep2 :
    convWithTail correctionStep3_conv_block2 correction4 correctionStep3_conv_result3 = correctionStep3_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep2"
  out.flush

theorem correctionStep2_conv_blockStep7 :
    convWithTail correctionStep2_conv_block7 correction3 correctionStep2_conv_result8 = correctionStep2_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep7"
  out.flush

theorem correctionStep1_conv_blockStep12 :
    convWithTail correctionStep1_conv_block12 correction2 correctionStep1_conv_result13 = correctionStep1_conv_result12 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep12"
  out.flush

theorem correctionStep0_conv_blockStep17 :
    convWithTail correctionStep0_conv_block17 correction1 correctionStep0_conv_result18 = correctionStep0_conv_result17 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep17"
  out.flush

theorem correctionStep0_conv_blockStep1 :
    convWithTail correctionStep0_conv_block1 correction1 correctionStep0_conv_result2 = correctionStep0_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep1"
  out.flush

theorem headStep63_conv_blockStep3 :
    convWithTail headStep63_conv_block3 head64 headStep63_conv_result4 = headStep63_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep63_conv_blockStep3"
  out.flush

theorem headStep62_conv_blockStep8 :
    convWithTail headStep62_conv_block8 head63 headStep62_conv_result9 = headStep62_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep62_conv_blockStep8"
  out.flush

theorem headStep62_conv_blockStep6 :
    convWithTail headStep62_conv_block6 head63 headStep62_conv_result7 = headStep62_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep62_conv_blockStep6"
  out.flush

theorem headStep60_conv_blockStep6 :
    convWithTail headStep60_conv_block6 head61 headStep60_conv_result7 = headStep60_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep60_conv_blockStep6"
  out.flush

theorem headStep58_conv_blockStep6 :
    convWithTail headStep58_conv_block6 head59 headStep58_conv_result7 = headStep58_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep58_conv_blockStep6"
  out.flush

theorem headStep56_conv_blockStep6 :
    convWithTail headStep56_conv_block6 head57 headStep56_conv_result7 = headStep56_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep56_conv_blockStep6"
  out.flush

theorem headStep54_conv_blockStep8 :
    convWithTail headStep54_conv_block8 head55 headStep54_conv_result9 = headStep54_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep54_conv_blockStep8"
  out.flush

theorem headStep54_conv_blockStep6 :
    convWithTail headStep54_conv_block6 head55 headStep54_conv_result7 = headStep54_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep54_conv_blockStep6"
  out.flush

theorem headStep52_conv_blockStep6 :
    convWithTail headStep52_conv_block6 head53 headStep52_conv_result7 = headStep52_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep52_conv_blockStep6"
  out.flush

theorem headStep51_conv_input :
    ratioA = headStep51_conv_suffix0 := by
  decide +kernel

theorem headStep50_conv_blockStep6 :
    convWithTail headStep50_conv_block6 head51 headStep50_conv_result7 = headStep50_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep50_conv_blockStep6"
  out.flush

theorem headStep48_conv_blockStep6 :
    convWithTail headStep48_conv_block6 head49 headStep48_conv_result7 = headStep48_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep48_conv_blockStep6"
  out.flush

theorem headStep46_conv_blockStep6 :
    convWithTail headStep46_conv_block6 head47 headStep46_conv_result7 = headStep46_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep46_conv_blockStep6"
  out.flush

theorem headStep44_conv_blockStep6 :
    convWithTail headStep44_conv_block6 head45 headStep44_conv_result7 = headStep44_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep44_conv_blockStep6"
  out.flush

theorem headStep42_conv_blockStep6 :
    convWithTail headStep42_conv_block6 head43 headStep42_conv_result7 = headStep42_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep42_conv_blockStep6"
  out.flush

theorem headStep40_conv_blockStep6 :
    convWithTail headStep40_conv_block6 head41 headStep40_conv_result7 = headStep40_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep40_conv_blockStep6"
  out.flush

theorem headStep38_conv_blockStep8 :
    convWithTail headStep38_conv_block8 head39 headStep38_conv_result9 = headStep38_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep38_conv_blockStep8"
  out.flush

theorem headStep38_conv_blockStep6 :
    convWithTail headStep38_conv_block6 head39 headStep38_conv_result7 = headStep38_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep38_conv_blockStep6"
  out.flush

theorem headStep36_conv_blockStep6 :
    convWithTail headStep36_conv_block6 head37 headStep36_conv_result7 = headStep36_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep36_conv_blockStep6"
  out.flush

theorem headStep35_conv_input :
    ratioA = headStep35_conv_suffix0 := by
  decide +kernel

theorem headStep34_conv_blockStep6 :
    convWithTail headStep34_conv_block6 head35 headStep34_conv_result7 = headStep34_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep34_conv_blockStep6"
  out.flush

theorem headStep32_conv_blockStep6 :
    convWithTail headStep32_conv_block6 head33 headStep32_conv_result7 = headStep32_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep32_conv_blockStep6"
  out.flush

theorem headStep30_conv_blockStep6 :
    convWithTail headStep30_conv_block6 head31 headStep30_conv_result7 = headStep30_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep30_conv_blockStep6"
  out.flush

theorem headStep28_conv_blockStep6 :
    convWithTail headStep28_conv_block6 head29 headStep28_conv_result7 = headStep28_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep28_conv_blockStep6"
  out.flush

theorem headStep26_conv_blockStep6 :
    convWithTail headStep26_conv_block6 head27 headStep26_conv_result7 = headStep26_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep26_conv_blockStep6"
  out.flush

theorem headStep24_conv_blockStep6 :
    convWithTail headStep24_conv_block6 head25 headStep24_conv_result7 = headStep24_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep24_conv_blockStep6"
  out.flush

theorem headStep22_conv_blockStep8 :
    convWithTail headStep22_conv_block8 head23 headStep22_conv_result9 = headStep22_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep22_conv_blockStep8"
  out.flush

theorem headStep22_conv_blockStep6 :
    convWithTail headStep22_conv_block6 head23 headStep22_conv_result7 = headStep22_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep22_conv_blockStep6"
  out.flush

theorem headStep20_conv_blockStep6 :
    convWithTail headStep20_conv_block6 head21 headStep20_conv_result7 = headStep20_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep20_conv_blockStep6"
  out.flush

theorem headStep19_conv_input :
    ratioA = headStep19_conv_suffix0 := by
  decide +kernel

theorem headStep18_conv_blockStep6 :
    convWithTail headStep18_conv_block6 head19 headStep18_conv_result7 = headStep18_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep18_conv_blockStep6"
  out.flush

theorem headStep16_conv_blockStep6 :
    convWithTail headStep16_conv_block6 head17 headStep16_conv_result7 = headStep16_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep16_conv_blockStep6"
  out.flush

theorem headStep14_conv_blockStep6 :
    convWithTail headStep14_conv_block6 head15 headStep14_conv_result7 = headStep14_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep14_conv_blockStep6"
  out.flush

theorem headStep12_conv_blockStep6 :
    convWithTail headStep12_conv_block6 head13 headStep12_conv_result7 = headStep12_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep12_conv_blockStep6"
  out.flush

theorem headStep10_conv_blockStep6 :
    convWithTail headStep10_conv_block6 head11 headStep10_conv_result7 = headStep10_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep10_conv_blockStep6"
  out.flush

theorem headStep8_conv_blockStep6 :
    convWithTail headStep8_conv_block6 head9 headStep8_conv_result7 = headStep8_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep8_conv_blockStep6"
  out.flush

theorem headStep6_conv_blockStep8 :
    convWithTail headStep6_conv_block8 head7 headStep6_conv_result9 = headStep6_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep6_conv_blockStep8"
  out.flush

theorem headStep6_conv_blockStep6 :
    convWithTail headStep6_conv_block6 head7 headStep6_conv_result7 = headStep6_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep6_conv_blockStep6"
  out.flush

theorem headStep4_conv_blockStep6 :
    convWithTail headStep4_conv_block6 head5 headStep4_conv_result7 = headStep4_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep4_conv_blockStep6"
  out.flush

theorem headStep3_conv_input :
    ratioA = headStep3_conv_suffix0 := by
  decide +kernel

theorem headStep2_conv_blockStep6 :
    convWithTail headStep2_conv_block6 head3 headStep2_conv_result7 = headStep2_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep2_conv_blockStep6"
  out.flush

theorem headStep0_conv_blockStep6 :
    convWithTail headStep0_conv_block6 head1 headStep0_conv_result7 = headStep0_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep0_conv_blockStep6"
  out.flush

theorem powerStep7_conv_blockStep4 :
    convWithTail powerStep7_conv_block4 power6 powerStep7_conv_result5 = powerStep7_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep7_conv_blockStep4"
  out.flush

theorem powerStep8_conv_blockStep2 :
    convWithTail powerStep8_conv_block2 power7 powerStep8_conv_result3 = powerStep8_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep8_conv_blockStep2"
  out.flush

theorem powerStep11_conv_blockStep1 :
    convWithTail powerStep11_conv_block1 power10 powerStep11_conv_result2 = powerStep11_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep11_conv_blockStep1"
  out.flush

theorem powerStep14_conv_input :
    pI = powerStep14_conv_suffix0 := by
  decide +kernel

theorem powerStep15_conv_blockStep0 :
    convWithTail powerStep15_conv_block0 power14 powerStep15_conv_result1 = powerStep15_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep15_conv_blockStep0"
  out.flush

theorem seed_product_step_conv_blockStep6 :
    convWithTail seed_product_step_conv_block6 power17 seed_product_step_conv_result7 = seed_product_step_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached seed_product_step_conv_blockStep6"
  out.flush

theorem inverseProduct_step_conv_blockStep2 :
    convWithTail inverseProduct_step_conv_block2 inverseD inverseProduct_step_conv_result3 = inverseProduct_step_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached inverseProduct_step_conv_blockStep2"
  out.flush

end Grothe.HaagerupCanonical.Trace
