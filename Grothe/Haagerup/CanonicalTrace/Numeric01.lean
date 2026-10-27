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

theorem coefficientStep2 :
    c2 * (((2*2+1)^2 : Nat) : Rat) / ((4*(2+1)*(2+2) : Nat) : Rat) = c3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 4: reached coefficientStep2"
  out.flush

theorem coefficientStep11 :
    c11 * (((2*11+1)^2 : Nat) : Rat) / ((4*(11+1)*(11+2) : Nat) : Rat) = c12 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 13: reached coefficientStep11"
  out.flush

theorem coefficientStep23 :
    c23 * (((2*23+1)^2 : Nat) : Rat) / ((4*(23+1)*(23+2) : Nat) : Rat) = c24 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 25: reached coefficientStep23"
  out.flush

theorem coefficientStep39 :
    c39 * (((2*39+1)^2 : Nat) : Rat) / ((4*(39+1)*(39+2) : Nat) : Rat) = c40 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 41: reached coefficientStep39"
  out.flush

theorem coefficientStep55 :
    c55 * (((2*55+1)^2 : Nat) : Rat) / ((4*(55+1)*(55+2) : Nat) : Rat) = c56 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 57: reached coefficientStep55"
  out.flush

theorem coefficientStep71 :
    c71 * (((2*71+1)^2 : Nat) : Rat) / ((4*(71+1)*(71+2) : Nat) : Rat) = c72 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 73: reached coefficientStep71"
  out.flush

theorem differenceStep2_67 :
    d1_67 - d1_68 = d2_67 := by
  decide +kernel

theorem differenceStep4_66 :
    d3_66 - d3_67 = d4_66 := by
  decide +kernel

theorem differenceStep7_64 :
    d6_64 - d6_65 = d7_64 := by
  decide +kernel

theorem correctionStep8_conv_blockStep4 :
    convWithTail correctionStep8_conv_block4 correction9 correctionStep8_conv_result5 = correctionStep8_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep8_conv_blockStep4"
  out.flush

theorem correctionStep8_conv_input :
    ratioY = correctionStep8_conv_suffix0 := by
  decide +kernel

theorem correctionStep7_conv_blockStep18 :
    convWithTail correctionStep7_conv_block18 correction8 correctionStep7_conv_result19 = correctionStep7_conv_result18 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep7_conv_blockStep18"
  out.flush

theorem correctionStep7_conv_blockStep2 :
    convWithTail correctionStep7_conv_block2 correction8 correctionStep7_conv_result3 = correctionStep7_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep7_conv_blockStep2"
  out.flush

theorem correctionStep6_conv_blockStep21 :
    convWithTail correctionStep6_conv_block21 correction7 correctionStep6_conv_result22 = correctionStep6_conv_result21 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep6_conv_blockStep21"
  out.flush

theorem correctionStep6_conv_blockStep7 :
    convWithTail correctionStep6_conv_block7 correction7 correctionStep6_conv_result8 = correctionStep6_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep6_conv_blockStep7"
  out.flush

theorem correctionStep5_conv_blockStep12 :
    convWithTail correctionStep5_conv_block12 correction6 correctionStep5_conv_result13 = correctionStep5_conv_result12 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep5_conv_blockStep12"
  out.flush

theorem correctionStep4_conv_blockStep17 :
    convWithTail correctionStep4_conv_block17 correction5 correctionStep4_conv_result18 = correctionStep4_conv_result17 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep17"
  out.flush

theorem correctionStep4_conv_blockStep1 :
    convWithTail correctionStep4_conv_block1 correction5 correctionStep4_conv_result2 = correctionStep4_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep1"
  out.flush

theorem correctionStep3_conv_blockStep6 :
    convWithTail correctionStep3_conv_block6 correction4 correctionStep3_conv_result7 = correctionStep3_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep6"
  out.flush

theorem correctionStep2_conv_blockStep11 :
    convWithTail correctionStep2_conv_block11 correction3 correctionStep2_conv_result12 = correctionStep2_conv_result11 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep11"
  out.flush

theorem correctionStep1_conv_blockStep16 :
    convWithTail correctionStep1_conv_block16 correction2 correctionStep1_conv_result17 = correctionStep1_conv_result16 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep16"
  out.flush

theorem correctionStep1_conv_blockStep0 :
    convWithTail correctionStep1_conv_block0 correction2 correctionStep1_conv_result1 = correctionStep1_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep0"
  out.flush

theorem correctionStep0_conv_blockStep5 :
    convWithTail correctionStep0_conv_block5 correction1 correctionStep0_conv_result6 = correctionStep0_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep5"
  out.flush

theorem tail_step_conv_blockStep2 :
    convWithTail tail_step_conv_block2 correction0 tail_step_conv_result3 = tail_step_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached tail_step_conv_blockStep2"
  out.flush

theorem headStep63_conv_blockStep2 :
    convWithTail headStep63_conv_block2 head64 headStep63_conv_result3 = headStep63_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep63_conv_blockStep2"
  out.flush

theorem headStep61_conv_blockStep2 :
    convWithTail headStep61_conv_block2 head62 headStep61_conv_result3 = headStep61_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep61_conv_blockStep2"
  out.flush

theorem headStep59_conv_blockStep2 :
    convWithTail headStep59_conv_block2 head60 headStep59_conv_result3 = headStep59_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep59_conv_blockStep2"
  out.flush

theorem headStep57_conv_blockStep8 :
    convWithTail headStep57_conv_block8 head58 headStep57_conv_result9 = headStep57_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep57_conv_blockStep8"
  out.flush

theorem headStep57_conv_blockStep2 :
    convWithTail headStep57_conv_block2 head58 headStep57_conv_result3 = headStep57_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep57_conv_blockStep2"
  out.flush

theorem headStep55_conv_blockStep2 :
    convWithTail headStep55_conv_block2 head56 headStep55_conv_result3 = headStep55_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep55_conv_blockStep2"
  out.flush

theorem headStep53_conv_blockStep2 :
    convWithTail headStep53_conv_block2 head54 headStep53_conv_result3 = headStep53_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep53_conv_blockStep2"
  out.flush

theorem headStep51_conv_blockStep2 :
    convWithTail headStep51_conv_block2 head52 headStep51_conv_result3 = headStep51_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep51_conv_blockStep2"
  out.flush

theorem headStep50_conv_input :
    ratioA = headStep50_conv_suffix0 := by
  decide +kernel

theorem headStep49_conv_blockStep2 :
    convWithTail headStep49_conv_block2 head50 headStep49_conv_result3 = headStep49_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep49_conv_blockStep2"
  out.flush

theorem headStep47_conv_blockStep2 :
    convWithTail headStep47_conv_block2 head48 headStep47_conv_result3 = headStep47_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep47_conv_blockStep2"
  out.flush

theorem headStep46_conv_blockStep8 :
    convWithTail headStep46_conv_block8 head47 headStep46_conv_result9 = headStep46_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep46_conv_blockStep8"
  out.flush

theorem headStep45_conv_blockStep2 :
    convWithTail headStep45_conv_block2 head46 headStep45_conv_result3 = headStep45_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep45_conv_blockStep2"
  out.flush

theorem headStep43_conv_blockStep2 :
    convWithTail headStep43_conv_block2 head44 headStep43_conv_result3 = headStep43_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep43_conv_blockStep2"
  out.flush

theorem headStep41_conv_blockStep2 :
    convWithTail headStep41_conv_block2 head42 headStep41_conv_result3 = headStep41_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep41_conv_blockStep2"
  out.flush

theorem headStep39_conv_blockStep2 :
    convWithTail headStep39_conv_block2 head40 headStep39_conv_result3 = headStep39_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep39_conv_blockStep2"
  out.flush

theorem headStep37_conv_blockStep2 :
    convWithTail headStep37_conv_block2 head38 headStep37_conv_result3 = headStep37_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep37_conv_blockStep2"
  out.flush

theorem headStep35_conv_blockStep2 :
    convWithTail headStep35_conv_block2 head36 headStep35_conv_result3 = headStep35_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep35_conv_blockStep2"
  out.flush

theorem headStep34_conv_input :
    ratioA = headStep34_conv_suffix0 := by
  decide +kernel

theorem headStep33_conv_blockStep2 :
    convWithTail headStep33_conv_block2 head34 headStep33_conv_result3 = headStep33_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep33_conv_blockStep2"
  out.flush

theorem headStep31_conv_blockStep2 :
    convWithTail headStep31_conv_block2 head32 headStep31_conv_result3 = headStep31_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep31_conv_blockStep2"
  out.flush

theorem headStep30_conv_blockStep8 :
    convWithTail headStep30_conv_block8 head31 headStep30_conv_result9 = headStep30_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep30_conv_blockStep8"
  out.flush

theorem headStep29_conv_blockStep2 :
    convWithTail headStep29_conv_block2 head30 headStep29_conv_result3 = headStep29_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep29_conv_blockStep2"
  out.flush

theorem headStep27_conv_blockStep2 :
    convWithTail headStep27_conv_block2 head28 headStep27_conv_result3 = headStep27_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep27_conv_blockStep2"
  out.flush

theorem headStep25_conv_blockStep2 :
    convWithTail headStep25_conv_block2 head26 headStep25_conv_result3 = headStep25_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep25_conv_blockStep2"
  out.flush

theorem headStep23_conv_blockStep2 :
    convWithTail headStep23_conv_block2 head24 headStep23_conv_result3 = headStep23_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep23_conv_blockStep2"
  out.flush

theorem headStep21_conv_blockStep2 :
    convWithTail headStep21_conv_block2 head22 headStep21_conv_result3 = headStep21_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep21_conv_blockStep2"
  out.flush

theorem headStep19_conv_blockStep2 :
    convWithTail headStep19_conv_block2 head20 headStep19_conv_result3 = headStep19_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep19_conv_blockStep2"
  out.flush

theorem headStep18_conv_input :
    ratioA = headStep18_conv_suffix0 := by
  decide +kernel

theorem headStep17_conv_blockStep2 :
    convWithTail headStep17_conv_block2 head18 headStep17_conv_result3 = headStep17_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep17_conv_blockStep2"
  out.flush

theorem headStep15_conv_blockStep2 :
    convWithTail headStep15_conv_block2 head16 headStep15_conv_result3 = headStep15_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep15_conv_blockStep2"
  out.flush

theorem headStep14_conv_blockStep8 :
    convWithTail headStep14_conv_block8 head15 headStep14_conv_result9 = headStep14_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep14_conv_blockStep8"
  out.flush

theorem headStep13_conv_blockStep2 :
    convWithTail headStep13_conv_block2 head14 headStep13_conv_result3 = headStep13_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep13_conv_blockStep2"
  out.flush

theorem headStep11_conv_blockStep2 :
    convWithTail headStep11_conv_block2 head12 headStep11_conv_result3 = headStep11_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep11_conv_blockStep2"
  out.flush

theorem headStep9_conv_blockStep2 :
    convWithTail headStep9_conv_block2 head10 headStep9_conv_result3 = headStep9_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep9_conv_blockStep2"
  out.flush

theorem headStep7_conv_blockStep2 :
    convWithTail headStep7_conv_block2 head8 headStep7_conv_result3 = headStep7_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep7_conv_blockStep2"
  out.flush

theorem headStep5_conv_blockStep2 :
    convWithTail headStep5_conv_block2 head6 headStep5_conv_result3 = headStep5_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep5_conv_blockStep2"
  out.flush

theorem headStep3_conv_blockStep2 :
    convWithTail headStep3_conv_block2 head4 headStep3_conv_result3 = headStep3_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep3_conv_blockStep2"
  out.flush

theorem headStep2_conv_input :
    ratioA = headStep2_conv_suffix0 := by
  decide +kernel

theorem headStep1_conv_blockStep2 :
    convWithTail headStep1_conv_block2 head2 headStep1_conv_result3 = headStep1_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep1_conv_blockStep2"
  out.flush

theorem powerStep9_conv_blockStep2 :
    convWithTail powerStep9_conv_block2 power8 powerStep9_conv_result3 = powerStep9_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep9_conv_blockStep2"
  out.flush

theorem powerStep10_conv_blockStep2 :
    convWithTail powerStep10_conv_block2 power9 powerStep10_conv_result3 = powerStep10_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep10_conv_blockStep2"
  out.flush

theorem powerStep15_conv_input :
    pI = powerStep15_conv_suffix0 := by
  decide +kernel

theorem powerStep16_conv_blockStep4 :
    convWithTail powerStep16_conv_block4 power15 powerStep16_conv_result5 = powerStep16_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep16_conv_blockStep4"
  out.flush

theorem powerStep16_conv_blockStep1 :
    convWithTail powerStep16_conv_block1 power15 powerStep16_conv_result2 = powerStep16_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep16_conv_blockStep1"
  out.flush

theorem seed_product_step_conv_blockStep11 :
    convWithTail seed_product_step_conv_block11 power17 seed_product_step_conv_result12 = seed_product_step_conv_result11 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached seed_product_step_conv_blockStep11"
  out.flush

theorem inverseProduct_step_conv_blockStep12 :
    convWithTail inverseProduct_step_conv_block12 inverseD inverseProduct_step_conv_result13 = inverseProduct_step_conv_result12 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached inverseProduct_step_conv_blockStep12"
  out.flush

end Grothe.HaagerupCanonical.Trace
