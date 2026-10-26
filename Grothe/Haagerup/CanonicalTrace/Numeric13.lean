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

theorem coefficientStep0 :
    c0 * (((2*0+1)^2 : Nat) : Rat) / ((4*(0+1)*(0+2) : Nat) : Rat) = c1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 2: reached coefficientStep0"
  out.flush

theorem coefficientStep5 :
    c5 * (((2*5+1)^2 : Nat) : Rat) / ((4*(5+1)*(5+2) : Nat) : Rat) = c6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 7: reached coefficientStep5"
  out.flush

theorem coefficientStep14 :
    c14 * (((2*14+1)^2 : Nat) : Rat) / ((4*(14+1)*(14+2) : Nat) : Rat) = c15 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 16: reached coefficientStep14"
  out.flush

theorem coefficientStep30 :
    c30 * (((2*30+1)^2 : Nat) : Rat) / ((4*(30+1)*(30+2) : Nat) : Rat) = c31 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 32: reached coefficientStep30"
  out.flush

theorem coefficientStep46 :
    c46 * (((2*46+1)^2 : Nat) : Rat) / ((4*(46+1)*(46+2) : Nat) : Rat) = c47 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 48: reached coefficientStep46"
  out.flush

theorem coefficientStep62 :
    c62 * (((2*62+1)^2 : Nat) : Rat) / ((4*(62+1)*(62+2) : Nat) : Rat) = c63 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 64: reached coefficientStep62"
  out.flush

theorem differenceStep1_70 :
    d0_70 - d0_71 = d1_70 := by
  decide +kernel

theorem differenceStep4_65 :
    d3_65 - d3_66 = d4_65 := by
  decide +kernel

theorem r_interval_eq :
    rlQ.map ofRatI = rI := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 85: reached r_interval_eq"
  out.flush

theorem ratioY_step_conv_blockStep6 :
    convWithTail ratioY_step_conv_block6 ratioA ratioY_step_conv_result7 = ratioY_step_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached ratioY_step_conv_blockStep6"
  out.flush

theorem correctionStep6_conv_blockStep20 :
    convWithTail correctionStep6_conv_block20 correction7 correctionStep6_conv_result21 = correctionStep6_conv_result20 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep6_conv_blockStep20"
  out.flush

theorem correctionStep6_conv_blockStep5 :
    convWithTail correctionStep6_conv_block5 correction7 correctionStep6_conv_result6 = correctionStep6_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep6_conv_blockStep5"
  out.flush

theorem correctionStep5_conv_blockStep7 :
    convWithTail correctionStep5_conv_block7 correction6 correctionStep5_conv_result8 = correctionStep5_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep5_conv_blockStep7"
  out.flush

theorem correctionStep4_conv_blockStep12 :
    convWithTail correctionStep4_conv_block12 correction5 correctionStep4_conv_result13 = correctionStep4_conv_result12 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep12"
  out.flush

theorem correctionStep3_conv_blockStep17 :
    convWithTail correctionStep3_conv_block17 correction4 correctionStep3_conv_result18 = correctionStep3_conv_result17 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep17"
  out.flush

theorem correctionStep3_conv_blockStep1 :
    convWithTail correctionStep3_conv_block1 correction4 correctionStep3_conv_result2 = correctionStep3_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep1"
  out.flush

theorem correctionStep2_conv_blockStep6 :
    convWithTail correctionStep2_conv_block6 correction3 correctionStep2_conv_result7 = correctionStep2_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep6"
  out.flush

theorem correctionStep1_conv_blockStep11 :
    convWithTail correctionStep1_conv_block11 correction2 correctionStep1_conv_result12 = correctionStep1_conv_result11 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep11"
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

theorem headStep63_conv_blockStep3 :
    convWithTail headStep63_conv_block3 head64 headStep63_conv_result4 = headStep63_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep63_conv_blockStep3"
  out.flush

theorem headStep62_conv_blockStep5 :
    convWithTail headStep62_conv_block5 head63 headStep62_conv_result6 = headStep62_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep62_conv_blockStep5"
  out.flush

theorem headStep60_conv_blockStep5 :
    convWithTail headStep60_conv_block5 head61 headStep60_conv_result6 = headStep60_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep60_conv_blockStep5"
  out.flush

theorem headStep58_conv_blockStep5 :
    convWithTail headStep58_conv_block5 head59 headStep58_conv_result6 = headStep58_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep58_conv_blockStep5"
  out.flush

theorem headStep56_conv_blockStep5 :
    convWithTail headStep56_conv_block5 head57 headStep56_conv_result6 = headStep56_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep56_conv_blockStep5"
  out.flush

theorem headStep54_conv_blockStep5 :
    convWithTail headStep54_conv_block5 head55 headStep54_conv_result6 = headStep54_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep54_conv_blockStep5"
  out.flush

theorem headStep53_conv_blockStep8 :
    convWithTail headStep53_conv_block8 head54 headStep53_conv_result9 = headStep53_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep53_conv_blockStep8"
  out.flush

theorem headStep52_conv_blockStep5 :
    convWithTail headStep52_conv_block5 head53 headStep52_conv_result6 = headStep52_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep52_conv_blockStep5"
  out.flush

theorem headStep51_conv_input :
    ratioA = headStep51_conv_suffix0 := by
  decide +kernel

theorem headStep50_conv_blockStep5 :
    convWithTail headStep50_conv_block5 head51 headStep50_conv_result6 = headStep50_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep50_conv_blockStep5"
  out.flush

theorem headStep48_conv_blockStep5 :
    convWithTail headStep48_conv_block5 head49 headStep48_conv_result6 = headStep48_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep48_conv_blockStep5"
  out.flush

theorem headStep46_conv_blockStep5 :
    convWithTail headStep46_conv_block5 head47 headStep46_conv_result6 = headStep46_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep46_conv_blockStep5"
  out.flush

theorem headStep44_conv_blockStep5 :
    convWithTail headStep44_conv_block5 head45 headStep44_conv_result6 = headStep44_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep44_conv_blockStep5"
  out.flush

theorem headStep42_conv_blockStep5 :
    convWithTail headStep42_conv_block5 head43 headStep42_conv_result6 = headStep42_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep42_conv_blockStep5"
  out.flush

theorem headStep40_conv_blockStep5 :
    convWithTail headStep40_conv_block5 head41 headStep40_conv_result6 = headStep40_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep40_conv_blockStep5"
  out.flush

theorem headStep38_conv_blockStep5 :
    convWithTail headStep38_conv_block5 head39 headStep38_conv_result6 = headStep38_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep38_conv_blockStep5"
  out.flush

theorem headStep37_conv_blockStep8 :
    convWithTail headStep37_conv_block8 head38 headStep37_conv_result9 = headStep37_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep37_conv_blockStep8"
  out.flush

theorem headStep36_conv_blockStep5 :
    convWithTail headStep36_conv_block5 head37 headStep36_conv_result6 = headStep36_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep36_conv_blockStep5"
  out.flush

theorem headStep35_conv_input :
    ratioA = headStep35_conv_suffix0 := by
  decide +kernel

theorem headStep34_conv_blockStep5 :
    convWithTail headStep34_conv_block5 head35 headStep34_conv_result6 = headStep34_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep34_conv_blockStep5"
  out.flush

theorem headStep32_conv_blockStep5 :
    convWithTail headStep32_conv_block5 head33 headStep32_conv_result6 = headStep32_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep32_conv_blockStep5"
  out.flush

theorem headStep30_conv_blockStep5 :
    convWithTail headStep30_conv_block5 head31 headStep30_conv_result6 = headStep30_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep30_conv_blockStep5"
  out.flush

theorem headStep28_conv_blockStep5 :
    convWithTail headStep28_conv_block5 head29 headStep28_conv_result6 = headStep28_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep28_conv_blockStep5"
  out.flush

theorem headStep26_conv_blockStep5 :
    convWithTail headStep26_conv_block5 head27 headStep26_conv_result6 = headStep26_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep26_conv_blockStep5"
  out.flush

theorem headStep24_conv_blockStep5 :
    convWithTail headStep24_conv_block5 head25 headStep24_conv_result6 = headStep24_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep24_conv_blockStep5"
  out.flush

theorem headStep22_conv_blockStep5 :
    convWithTail headStep22_conv_block5 head23 headStep22_conv_result6 = headStep22_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep22_conv_blockStep5"
  out.flush

theorem headStep21_conv_blockStep8 :
    convWithTail headStep21_conv_block8 head22 headStep21_conv_result9 = headStep21_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep21_conv_blockStep8"
  out.flush

theorem headStep20_conv_blockStep5 :
    convWithTail headStep20_conv_block5 head21 headStep20_conv_result6 = headStep20_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep20_conv_blockStep5"
  out.flush

theorem headStep19_conv_input :
    ratioA = headStep19_conv_suffix0 := by
  decide +kernel

theorem headStep18_conv_blockStep5 :
    convWithTail headStep18_conv_block5 head19 headStep18_conv_result6 = headStep18_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep18_conv_blockStep5"
  out.flush

theorem headStep16_conv_blockStep5 :
    convWithTail headStep16_conv_block5 head17 headStep16_conv_result6 = headStep16_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep16_conv_blockStep5"
  out.flush

theorem headStep14_conv_blockStep5 :
    convWithTail headStep14_conv_block5 head15 headStep14_conv_result6 = headStep14_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep14_conv_blockStep5"
  out.flush

theorem headStep12_conv_blockStep5 :
    convWithTail headStep12_conv_block5 head13 headStep12_conv_result6 = headStep12_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep12_conv_blockStep5"
  out.flush

theorem headStep10_conv_blockStep5 :
    convWithTail headStep10_conv_block5 head11 headStep10_conv_result6 = headStep10_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep10_conv_blockStep5"
  out.flush

theorem headStep8_conv_blockStep5 :
    convWithTail headStep8_conv_block5 head9 headStep8_conv_result6 = headStep8_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep8_conv_blockStep5"
  out.flush

theorem headStep6_conv_blockStep5 :
    convWithTail headStep6_conv_block5 head7 headStep6_conv_result6 = headStep6_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep6_conv_blockStep5"
  out.flush

theorem headStep5_conv_blockStep8 :
    convWithTail headStep5_conv_block8 head6 headStep5_conv_result9 = headStep5_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep5_conv_blockStep8"
  out.flush

theorem headStep4_conv_blockStep5 :
    convWithTail headStep4_conv_block5 head5 headStep4_conv_result6 = headStep4_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep4_conv_blockStep5"
  out.flush

theorem headStep3_conv_input :
    ratioA = headStep3_conv_suffix0 := by
  decide +kernel

theorem headStep2_conv_blockStep5 :
    convWithTail headStep2_conv_block5 head3 headStep2_conv_result6 = headStep2_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep2_conv_blockStep5"
  out.flush

theorem headStep0_conv_blockStep5 :
    convWithTail headStep0_conv_block5 head1 headStep0_conv_result6 = headStep0_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep0_conv_blockStep5"
  out.flush

theorem powerStep5 :
    convI pI power4 = power5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 168: reached powerStep5"
  out.flush

theorem powerStep8_conv_blockStep1 :
    convWithTail powerStep8_conv_block1 power7 powerStep8_conv_result2 = powerStep8_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep8_conv_blockStep1"
  out.flush

theorem powerStep11_conv_blockStep0 :
    convWithTail powerStep11_conv_block0 power10 powerStep11_conv_result1 = powerStep11_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep11_conv_blockStep0"
  out.flush

theorem powerStep14_conv_input :
    pI = powerStep14_conv_suffix0 := by
  decide +kernel

theorem powerStep16_conv_blockStep3 :
    convWithTail powerStep16_conv_block3 power15 powerStep16_conv_result4 = powerStep16_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep16_conv_blockStep3"
  out.flush

theorem inverseProduct_step_conv_blockStep3 :
    convWithTail inverseProduct_step_conv_block3 inverseD inverseProduct_step_conv_result4 = inverseProduct_step_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached inverseProduct_step_conv_blockStep3"
  out.flush

end Grothe.HaagerupCanonical.Trace
