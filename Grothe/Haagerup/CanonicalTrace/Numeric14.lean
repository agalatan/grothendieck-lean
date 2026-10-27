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

theorem coefficientStep12 :
    c12 * (((2*12+1)^2 : Nat) : Rat) / ((4*(12+1)*(12+2) : Nat) : Rat) = c13 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 14: reached coefficientStep12"
  out.flush

theorem coefficientStep24 :
    c24 * (((2*24+1)^2 : Nat) : Rat) / ((4*(24+1)*(24+2) : Nat) : Rat) = c25 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 26: reached coefficientStep24"
  out.flush

theorem coefficientStep40 :
    c40 * (((2*40+1)^2 : Nat) : Rat) / ((4*(40+1)*(40+2) : Nat) : Rat) = c41 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 42: reached coefficientStep40"
  out.flush

theorem coefficientStep56 :
    c56 * (((2*56+1)^2 : Nat) : Rat) / ((4*(56+1)*(56+2) : Nat) : Rat) = c57 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 58: reached coefficientStep56"
  out.flush

theorem coefficientStep72 :
    c72 * (((2*72+1)^2 : Nat) : Rat) / ((4*(72+1)*(72+2) : Nat) : Rat) = c73 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 74: reached coefficientStep72"
  out.flush

theorem differenceStep2_68 :
    d1_68 - d1_69 = d2_68 := by
  decide +kernel

theorem differenceStep4_67 :
    d3_67 - d3_68 = d4_67 := by
  decide +kernel

theorem differenceStep7_65 :
    d6_65 - d6_66 = d7_65 := by
  decide +kernel

theorem correctionStep8_conv_blockStep15 :
    convWithTail correctionStep8_conv_block15 correction9 correctionStep8_conv_result16 = correctionStep8_conv_result15 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep8_conv_blockStep15"
  out.flush

theorem correctionStep7_conv_blockStep9 :
    convWithTail correctionStep7_conv_block9 correction8 correctionStep7_conv_result10 = correctionStep7_conv_result9 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep7_conv_blockStep9"
  out.flush

theorem correctionStep7_conv_input :
    ratioY = correctionStep7_conv_suffix0 := by
  decide +kernel

theorem correctionStep6_conv_blockStep14 :
    convWithTail correctionStep6_conv_block14 correction7 correctionStep6_conv_result15 = correctionStep6_conv_result14 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep6_conv_blockStep14"
  out.flush

theorem correctionStep5_conv_blockStep21 :
    convWithTail correctionStep5_conv_block21 correction6 correctionStep5_conv_result22 = correctionStep5_conv_result21 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep5_conv_blockStep21"
  out.flush

theorem correctionStep5_conv_blockStep19 :
    convWithTail correctionStep5_conv_block19 correction6 correctionStep5_conv_result20 = correctionStep5_conv_result19 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep5_conv_blockStep19"
  out.flush

theorem correctionStep5_conv_blockStep3 :
    convWithTail correctionStep5_conv_block3 correction6 correctionStep5_conv_result4 = correctionStep5_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep5_conv_blockStep3"
  out.flush

theorem correctionStep4_conv_blockStep8 :
    convWithTail correctionStep4_conv_block8 correction5 correctionStep4_conv_result9 = correctionStep4_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep8"
  out.flush

theorem correctionStep3_conv_blockStep13 :
    convWithTail correctionStep3_conv_block13 correction4 correctionStep3_conv_result14 = correctionStep3_conv_result13 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep13"
  out.flush

theorem correctionStep2_conv_blockStep18 :
    convWithTail correctionStep2_conv_block18 correction3 correctionStep2_conv_result19 = correctionStep2_conv_result18 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep18"
  out.flush

theorem correctionStep2_conv_blockStep2 :
    convWithTail correctionStep2_conv_block2 correction3 correctionStep2_conv_result3 = correctionStep2_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep2"
  out.flush

theorem correctionStep1_conv_blockStep7 :
    convWithTail correctionStep1_conv_block7 correction2 correctionStep1_conv_result8 = correctionStep1_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep7"
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

theorem headStep63_conv_blockStep1 :
    convWithTail headStep63_conv_block1 head64 headStep63_conv_result2 = headStep63_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep63_conv_blockStep1"
  out.flush

theorem headStep62_conv_blockStep1 :
    convWithTail headStep62_conv_block1 head63 headStep62_conv_result2 = headStep62_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep62_conv_blockStep1"
  out.flush

theorem headStep60_conv_blockStep1 :
    convWithTail headStep60_conv_block1 head61 headStep60_conv_result2 = headStep60_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep60_conv_blockStep1"
  out.flush

theorem headStep58_conv_blockStep1 :
    convWithTail headStep58_conv_block1 head59 headStep58_conv_result2 = headStep58_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep58_conv_blockStep1"
  out.flush

theorem headStep56_conv_blockStep1 :
    convWithTail headStep56_conv_block1 head57 headStep56_conv_result2 = headStep56_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep56_conv_blockStep1"
  out.flush

theorem headStep54_conv_blockStep1 :
    convWithTail headStep54_conv_block1 head55 headStep54_conv_result2 = headStep54_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep54_conv_blockStep1"
  out.flush

theorem headStep52_conv_blockStep1 :
    convWithTail headStep52_conv_block1 head53 headStep52_conv_result2 = headStep52_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep52_conv_blockStep1"
  out.flush

theorem headStep51_conv_blockStep8 :
    convWithTail headStep51_conv_block8 head52 headStep51_conv_result9 = headStep51_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep51_conv_blockStep8"
  out.flush

theorem headStep50_conv_blockStep1 :
    convWithTail headStep50_conv_block1 head51 headStep50_conv_result2 = headStep50_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep50_conv_blockStep1"
  out.flush

theorem headStep49_conv_input :
    ratioA = headStep49_conv_suffix0 := by
  decide +kernel

theorem headStep48_conv_blockStep1 :
    convWithTail headStep48_conv_block1 head49 headStep48_conv_result2 = headStep48_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep48_conv_blockStep1"
  out.flush

theorem headStep46_conv_blockStep1 :
    convWithTail headStep46_conv_block1 head47 headStep46_conv_result2 = headStep46_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep46_conv_blockStep1"
  out.flush

theorem headStep44_conv_blockStep1 :
    convWithTail headStep44_conv_block1 head45 headStep44_conv_result2 = headStep44_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep44_conv_blockStep1"
  out.flush

theorem headStep42_conv_blockStep1 :
    convWithTail headStep42_conv_block1 head43 headStep42_conv_result2 = headStep42_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep42_conv_blockStep1"
  out.flush

theorem headStep40_conv_blockStep1 :
    convWithTail headStep40_conv_block1 head41 headStep40_conv_result2 = headStep40_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep40_conv_blockStep1"
  out.flush

theorem headStep38_conv_blockStep1 :
    convWithTail headStep38_conv_block1 head39 headStep38_conv_result2 = headStep38_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep38_conv_blockStep1"
  out.flush

theorem headStep36_conv_blockStep1 :
    convWithTail headStep36_conv_block1 head37 headStep36_conv_result2 = headStep36_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep36_conv_blockStep1"
  out.flush

theorem headStep35_conv_blockStep8 :
    convWithTail headStep35_conv_block8 head36 headStep35_conv_result9 = headStep35_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep35_conv_blockStep8"
  out.flush

theorem headStep34_conv_blockStep1 :
    convWithTail headStep34_conv_block1 head35 headStep34_conv_result2 = headStep34_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep34_conv_blockStep1"
  out.flush

theorem headStep33_conv_input :
    ratioA = headStep33_conv_suffix0 := by
  decide +kernel

theorem headStep32_conv_blockStep1 :
    convWithTail headStep32_conv_block1 head33 headStep32_conv_result2 = headStep32_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep32_conv_blockStep1"
  out.flush

theorem headStep30_conv_blockStep1 :
    convWithTail headStep30_conv_block1 head31 headStep30_conv_result2 = headStep30_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep30_conv_blockStep1"
  out.flush

theorem headStep28_conv_blockStep1 :
    convWithTail headStep28_conv_block1 head29 headStep28_conv_result2 = headStep28_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep28_conv_blockStep1"
  out.flush

theorem headStep26_conv_blockStep1 :
    convWithTail headStep26_conv_block1 head27 headStep26_conv_result2 = headStep26_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep26_conv_blockStep1"
  out.flush

theorem headStep24_conv_blockStep1 :
    convWithTail headStep24_conv_block1 head25 headStep24_conv_result2 = headStep24_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep24_conv_blockStep1"
  out.flush

theorem headStep22_conv_blockStep1 :
    convWithTail headStep22_conv_block1 head23 headStep22_conv_result2 = headStep22_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep22_conv_blockStep1"
  out.flush

theorem headStep20_conv_blockStep1 :
    convWithTail headStep20_conv_block1 head21 headStep20_conv_result2 = headStep20_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep20_conv_blockStep1"
  out.flush

theorem headStep19_conv_blockStep8 :
    convWithTail headStep19_conv_block8 head20 headStep19_conv_result9 = headStep19_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep19_conv_blockStep8"
  out.flush

theorem headStep18_conv_blockStep1 :
    convWithTail headStep18_conv_block1 head19 headStep18_conv_result2 = headStep18_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep18_conv_blockStep1"
  out.flush

theorem headStep17_conv_input :
    ratioA = headStep17_conv_suffix0 := by
  decide +kernel

theorem headStep16_conv_blockStep1 :
    convWithTail headStep16_conv_block1 head17 headStep16_conv_result2 = headStep16_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep16_conv_blockStep1"
  out.flush

theorem headStep14_conv_blockStep1 :
    convWithTail headStep14_conv_block1 head15 headStep14_conv_result2 = headStep14_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep14_conv_blockStep1"
  out.flush

theorem headStep12_conv_blockStep1 :
    convWithTail headStep12_conv_block1 head13 headStep12_conv_result2 = headStep12_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep12_conv_blockStep1"
  out.flush

theorem headStep10_conv_blockStep1 :
    convWithTail headStep10_conv_block1 head11 headStep10_conv_result2 = headStep10_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep10_conv_blockStep1"
  out.flush

theorem headStep8_conv_blockStep1 :
    convWithTail headStep8_conv_block1 head9 headStep8_conv_result2 = headStep8_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep8_conv_blockStep1"
  out.flush

theorem headStep6_conv_blockStep1 :
    convWithTail headStep6_conv_block1 head7 headStep6_conv_result2 = headStep6_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep6_conv_blockStep1"
  out.flush

theorem headStep4_conv_blockStep1 :
    convWithTail headStep4_conv_block1 head5 headStep4_conv_result2 = headStep4_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep4_conv_blockStep1"
  out.flush

theorem headStep3_conv_blockStep8 :
    convWithTail headStep3_conv_block8 head4 headStep3_conv_result9 = headStep3_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep3_conv_blockStep8"
  out.flush

theorem headStep2_conv_blockStep1 :
    convWithTail headStep2_conv_block1 head3 headStep2_conv_result2 = headStep2_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep2_conv_blockStep1"
  out.flush

theorem headStep1_conv_input :
    ratioA = headStep1_conv_suffix0 := by
  decide +kernel

theorem headStep0_conv_blockStep1 :
    convWithTail headStep0_conv_block1 head1 headStep0_conv_result2 = headStep0_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep0_conv_blockStep1"
  out.flush

theorem powerStep6_conv_blockStep3 :
    convWithTail powerStep6_conv_block3 power5 powerStep6_conv_result4 = powerStep6_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep6_conv_blockStep3"
  out.flush

theorem powerStep7_conv_blockStep1 :
    convWithTail powerStep7_conv_block1 power6 powerStep7_conv_result2 = powerStep7_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep7_conv_blockStep1"
  out.flush

theorem powerStep10_conv_blockStep0 :
    convWithTail powerStep10_conv_block0 power9 powerStep10_conv_result1 = powerStep10_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep10_conv_blockStep0"
  out.flush

theorem powerStep16_conv_input :
    pI = powerStep16_conv_suffix0 := by
  decide +kernel

theorem powerStep17_conv_blockStep3 :
    convWithTail powerStep17_conv_block3 power16 powerStep17_conv_result4 = powerStep17_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep17_conv_blockStep3"
  out.flush

theorem powerStep17_conv_blockStep1 :
    convWithTail powerStep17_conv_block1 power16 powerStep17_conv_result2 = powerStep17_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep17_conv_blockStep1"
  out.flush

theorem inverseProduct_step_conv_blockStep11 :
    convWithTail inverseProduct_step_conv_block11 inverseD inverseProduct_step_conv_result12 = inverseProduct_step_conv_result11 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached inverseProduct_step_conv_blockStep11"
  out.flush

end Grothe.HaagerupCanonical.Trace
