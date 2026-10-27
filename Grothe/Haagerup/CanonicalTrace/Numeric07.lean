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

theorem coefficientStep37 :
    c37 * (((2*37+1)^2 : Nat) : Rat) / ((4*(37+1)*(37+2) : Nat) : Rat) = c38 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 39: reached coefficientStep37"
  out.flush

theorem coefficientStep53 :
    c53 * (((2*53+1)^2 : Nat) : Rat) / ((4*(53+1)*(53+2) : Nat) : Rat) = c54 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 55: reached coefficientStep53"
  out.flush

theorem coefficientStep69 :
    c69 * (((2*69+1)^2 : Nat) : Rat) / ((4*(69+1)*(69+2) : Nat) : Rat) = c70 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 71: reached coefficientStep69"
  out.flush

theorem differenceStep2_69 :
    d1_69 - d1_70 = d2_69 := by
  decide +kernel

theorem differenceStep5_67 :
    d4_67 - d4_68 = d5_67 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 79: reached difference_order_5"
  out.flush

theorem ratioY_step_conv_blockStep10 :
    convWithTail ratioY_step_conv_block10 ratioA ratioY_step_conv_result11 = ratioY_step_conv_result10 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached ratioY_step_conv_blockStep10"
  out.flush

theorem correctionStep6_conv_blockStep7 :
    convWithTail correctionStep6_conv_block7 correction7 correctionStep6_conv_result8 = correctionStep6_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep6_conv_blockStep7"
  out.flush

theorem correctionStep5_conv_blockStep5 :
    convWithTail correctionStep5_conv_block5 correction6 correctionStep5_conv_result6 = correctionStep5_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep5_conv_blockStep5"
  out.flush

theorem correctionStep4_conv_blockStep10 :
    convWithTail correctionStep4_conv_block10 correction5 correctionStep4_conv_result11 = correctionStep4_conv_result10 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep10"
  out.flush

theorem correctionStep3_conv_blockStep15 :
    convWithTail correctionStep3_conv_block15 correction4 correctionStep3_conv_result16 = correctionStep3_conv_result15 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep15"
  out.flush

theorem correctionStep2_conv_blockStep20 :
    convWithTail correctionStep2_conv_block20 correction3 correctionStep2_conv_result21 = correctionStep2_conv_result20 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep20"
  out.flush

theorem correctionStep2_conv_blockStep4 :
    convWithTail correctionStep2_conv_block4 correction3 correctionStep2_conv_result5 = correctionStep2_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep4"
  out.flush

theorem correctionStep2_conv_input :
    ratioY = correctionStep2_conv_suffix0 := by
  decide +kernel

theorem correctionStep1_conv_blockStep9 :
    convWithTail correctionStep1_conv_block9 correction2 correctionStep1_conv_result10 = correctionStep1_conv_result9 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep9"
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

theorem headStep62_conv_blockStep3 :
    convWithTail headStep62_conv_block3 head63 headStep62_conv_result4 = headStep62_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep62_conv_blockStep3"
  out.flush

theorem headStep60_conv_blockStep3 :
    convWithTail headStep60_conv_block3 head61 headStep60_conv_result4 = headStep60_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep60_conv_blockStep3"
  out.flush

theorem headStep60_conv_input :
    ratioA = headStep60_conv_suffix0 := by
  decide +kernel

theorem headStep58_conv_blockStep3 :
    convWithTail headStep58_conv_block3 head59 headStep58_conv_result4 = headStep58_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep58_conv_blockStep3"
  out.flush

theorem headStep56_conv_blockStep8 :
    convWithTail headStep56_conv_block8 head57 headStep56_conv_result9 = headStep56_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep56_conv_blockStep8"
  out.flush

theorem headStep56_conv_blockStep3 :
    convWithTail headStep56_conv_block3 head57 headStep56_conv_result4 = headStep56_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep56_conv_blockStep3"
  out.flush

theorem headStep54_conv_blockStep3 :
    convWithTail headStep54_conv_block3 head55 headStep54_conv_result4 = headStep54_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep54_conv_blockStep3"
  out.flush

theorem headStep52_conv_blockStep3 :
    convWithTail headStep52_conv_block3 head53 headStep52_conv_result4 = headStep52_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep52_conv_blockStep3"
  out.flush

theorem headStep50_conv_blockStep3 :
    convWithTail headStep50_conv_block3 head51 headStep50_conv_result4 = headStep50_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep50_conv_blockStep3"
  out.flush

theorem headStep48_conv_blockStep3 :
    convWithTail headStep48_conv_block3 head49 headStep48_conv_result4 = headStep48_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep48_conv_blockStep3"
  out.flush

theorem headStep46_conv_blockStep3 :
    convWithTail headStep46_conv_block3 head47 headStep46_conv_result4 = headStep46_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep46_conv_blockStep3"
  out.flush

theorem headStep44_conv_blockStep3 :
    convWithTail headStep44_conv_block3 head45 headStep44_conv_result4 = headStep44_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep44_conv_blockStep3"
  out.flush

theorem headStep44_conv_input :
    ratioA = headStep44_conv_suffix0 := by
  decide +kernel

theorem headStep42_conv_blockStep3 :
    convWithTail headStep42_conv_block3 head43 headStep42_conv_result4 = headStep42_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep42_conv_blockStep3"
  out.flush

theorem headStep40_conv_blockStep8 :
    convWithTail headStep40_conv_block8 head41 headStep40_conv_result9 = headStep40_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep40_conv_blockStep8"
  out.flush

theorem headStep40_conv_blockStep3 :
    convWithTail headStep40_conv_block3 head41 headStep40_conv_result4 = headStep40_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep40_conv_blockStep3"
  out.flush

theorem headStep38_conv_blockStep3 :
    convWithTail headStep38_conv_block3 head39 headStep38_conv_result4 = headStep38_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep38_conv_blockStep3"
  out.flush

theorem headStep36_conv_blockStep3 :
    convWithTail headStep36_conv_block3 head37 headStep36_conv_result4 = headStep36_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep36_conv_blockStep3"
  out.flush

theorem headStep34_conv_blockStep3 :
    convWithTail headStep34_conv_block3 head35 headStep34_conv_result4 = headStep34_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep34_conv_blockStep3"
  out.flush

theorem headStep32_conv_blockStep3 :
    convWithTail headStep32_conv_block3 head33 headStep32_conv_result4 = headStep32_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep32_conv_blockStep3"
  out.flush

theorem headStep30_conv_blockStep3 :
    convWithTail headStep30_conv_block3 head31 headStep30_conv_result4 = headStep30_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep30_conv_blockStep3"
  out.flush

theorem headStep28_conv_blockStep3 :
    convWithTail headStep28_conv_block3 head29 headStep28_conv_result4 = headStep28_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep28_conv_blockStep3"
  out.flush

theorem headStep28_conv_input :
    ratioA = headStep28_conv_suffix0 := by
  decide +kernel

theorem headStep26_conv_blockStep3 :
    convWithTail headStep26_conv_block3 head27 headStep26_conv_result4 = headStep26_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep26_conv_blockStep3"
  out.flush

theorem headStep24_conv_blockStep8 :
    convWithTail headStep24_conv_block8 head25 headStep24_conv_result9 = headStep24_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep24_conv_blockStep8"
  out.flush

theorem headStep24_conv_blockStep3 :
    convWithTail headStep24_conv_block3 head25 headStep24_conv_result4 = headStep24_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep24_conv_blockStep3"
  out.flush

theorem headStep22_conv_blockStep3 :
    convWithTail headStep22_conv_block3 head23 headStep22_conv_result4 = headStep22_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep22_conv_blockStep3"
  out.flush

theorem headStep20_conv_blockStep3 :
    convWithTail headStep20_conv_block3 head21 headStep20_conv_result4 = headStep20_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep20_conv_blockStep3"
  out.flush

theorem headStep18_conv_blockStep3 :
    convWithTail headStep18_conv_block3 head19 headStep18_conv_result4 = headStep18_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep18_conv_blockStep3"
  out.flush

theorem headStep16_conv_blockStep3 :
    convWithTail headStep16_conv_block3 head17 headStep16_conv_result4 = headStep16_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep16_conv_blockStep3"
  out.flush

theorem headStep14_conv_blockStep3 :
    convWithTail headStep14_conv_block3 head15 headStep14_conv_result4 = headStep14_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep14_conv_blockStep3"
  out.flush

theorem headStep12_conv_blockStep3 :
    convWithTail headStep12_conv_block3 head13 headStep12_conv_result4 = headStep12_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep12_conv_blockStep3"
  out.flush

theorem headStep12_conv_input :
    ratioA = headStep12_conv_suffix0 := by
  decide +kernel

theorem headStep10_conv_blockStep3 :
    convWithTail headStep10_conv_block3 head11 headStep10_conv_result4 = headStep10_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep10_conv_blockStep3"
  out.flush

theorem headStep8_conv_blockStep8 :
    convWithTail headStep8_conv_block8 head9 headStep8_conv_result9 = headStep8_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep8_conv_blockStep8"
  out.flush

theorem headStep8_conv_blockStep3 :
    convWithTail headStep8_conv_block3 head9 headStep8_conv_result4 = headStep8_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep8_conv_blockStep3"
  out.flush

theorem headStep6_conv_blockStep3 :
    convWithTail headStep6_conv_block3 head7 headStep6_conv_result4 = headStep6_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep6_conv_blockStep3"
  out.flush

theorem headStep4_conv_blockStep3 :
    convWithTail headStep4_conv_block3 head5 headStep4_conv_result4 = headStep4_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep4_conv_blockStep3"
  out.flush

theorem headStep2_conv_blockStep3 :
    convWithTail headStep2_conv_block3 head3 headStep2_conv_result4 = headStep2_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep2_conv_blockStep3"
  out.flush

theorem headStep0_conv_blockStep3 :
    convWithTail headStep0_conv_block3 head1 headStep0_conv_result4 = headStep0_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep0_conv_blockStep3"
  out.flush

theorem powerStep1 :
    convI pI power0 = power1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 164: reached powerStep1"
  out.flush

theorem powerStep7_conv_blockStep3 :
    convWithTail powerStep7_conv_block3 power6 powerStep7_conv_result4 = powerStep7_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep7_conv_blockStep3"
  out.flush

theorem powerStep7_conv_blockStep2 :
    convWithTail powerStep7_conv_block2 power6 powerStep7_conv_result3 = powerStep7_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep7_conv_blockStep2"
  out.flush

theorem powerStep9_conv_blockStep4 :
    convWithTail powerStep9_conv_block4 power8 powerStep9_conv_result5 = powerStep9_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep9_conv_blockStep4"
  out.flush

theorem powerStep13_conv_blockStep0 :
    convWithTail powerStep13_conv_block0 power12 powerStep13_conv_result1 = powerStep13_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep13_conv_blockStep0"
  out.flush

theorem powerStep14_conv_blockStep3 :
    convWithTail powerStep14_conv_block3 power13 powerStep14_conv_result4 = powerStep14_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep14_conv_blockStep3"
  out.flush

theorem seed_product_step_conv_blockStep5 :
    convWithTail seed_product_step_conv_block5 power17 seed_product_step_conv_result6 = seed_product_step_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached seed_product_step_conv_blockStep5"
  out.flush

theorem inverseProduct_step_conv_blockStep8 :
    convWithTail inverseProduct_step_conv_block8 inverseD inverseProduct_step_conv_result9 = inverseProduct_step_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached inverseProduct_step_conv_blockStep8"
  out.flush

theorem inverseProduct_step_conv_input :
    rI = inverseProduct_step_conv_suffix0 := by
  decide +kernel

end Grothe.HaagerupCanonical.Trace
