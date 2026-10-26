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

theorem coefficientStep15 :
    c15 * (((2*15+1)^2 : Nat) : Rat) / ((4*(15+1)*(15+2) : Nat) : Rat) = c16 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 17: reached coefficientStep15"
  out.flush

theorem coefficientStep31 :
    c31 * (((2*31+1)^2 : Nat) : Rat) / ((4*(31+1)*(31+2) : Nat) : Rat) = c32 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 33: reached coefficientStep31"
  out.flush

theorem coefficientStep47 :
    c47 * (((2*47+1)^2 : Nat) : Rat) / ((4*(47+1)*(47+2) : Nat) : Rat) = c48 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 49: reached coefficientStep47"
  out.flush

theorem coefficientStep63 :
    c63 * (((2*63+1)^2 : Nat) : Rat) / ((4*(63+1)*(63+2) : Nat) : Rat) = c64 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 65: reached coefficientStep63"
  out.flush

theorem differenceStep1_71 :
    d0_71 - d0_72 = d1_71 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 75: reached difference_order_1"
  out.flush

theorem differenceStep4_66 :
    d3_66 - d3_67 = d4_66 := by
  decide +kernel

theorem ratioA_step :
    zeroI :: convI pI pI = ratioA := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 86: reached ratioA_step"
  out.flush

theorem ratioY_step_conv_input :
    rI = ratioY_step_conv_suffix0 := by
  decide +kernel

theorem correctionStep6_conv_blockStep11 :
    convWithTail correctionStep6_conv_block11 correction7 correctionStep6_conv_result12 = correctionStep6_conv_result11 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep6_conv_blockStep11"
  out.flush

theorem correctionStep5_conv_blockStep17 :
    convWithTail correctionStep5_conv_block17 correction6 correctionStep5_conv_result18 = correctionStep5_conv_result17 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep5_conv_blockStep17"
  out.flush

theorem correctionStep5_conv_blockStep1 :
    convWithTail correctionStep5_conv_block1 correction6 correctionStep5_conv_result2 = correctionStep5_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep5_conv_blockStep1"
  out.flush

theorem correctionStep4_conv_blockStep6 :
    convWithTail correctionStep4_conv_block6 correction5 correctionStep4_conv_result7 = correctionStep4_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep6"
  out.flush

theorem correctionStep3_conv_blockStep11 :
    convWithTail correctionStep3_conv_block11 correction4 correctionStep3_conv_result12 = correctionStep3_conv_result11 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep11"
  out.flush

theorem correctionStep2_conv_blockStep16 :
    convWithTail correctionStep2_conv_block16 correction3 correctionStep2_conv_result17 = correctionStep2_conv_result16 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep16"
  out.flush

theorem correctionStep2_conv_blockStep0 :
    convWithTail correctionStep2_conv_block0 correction3 correctionStep2_conv_result1 = correctionStep2_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep0"
  out.flush

theorem correctionStep1_conv_blockStep5 :
    convWithTail correctionStep1_conv_block5 correction2 correctionStep1_conv_result6 = correctionStep1_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep5"
  out.flush

theorem correctionStep0_conv_blockStep10 :
    convWithTail correctionStep0_conv_block10 correction1 correctionStep0_conv_result11 = correctionStep0_conv_result10 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep10"
  out.flush

theorem tail_step_conv_blockStep7 :
    convWithTail tail_step_conv_block7 correction0 tail_step_conv_result8 = tail_step_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached tail_step_conv_blockStep7"
  out.flush

theorem headStep63_conv_blockStep2 :
    convWithTail headStep63_conv_block2 head64 headStep63_conv_result3 = headStep63_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep63_conv_blockStep2"
  out.flush

theorem headStep61_conv_blockStep7 :
    convWithTail headStep61_conv_block7 head62 headStep61_conv_result8 = headStep61_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep61_conv_blockStep7"
  out.flush

theorem headStep59_conv_blockStep7 :
    convWithTail headStep59_conv_block7 head60 headStep59_conv_result8 = headStep59_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep59_conv_blockStep7"
  out.flush

theorem headStep58_conv_blockStep8 :
    convWithTail headStep58_conv_block8 head59 headStep58_conv_result9 = headStep58_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep58_conv_blockStep8"
  out.flush

theorem headStep57_conv_blockStep7 :
    convWithTail headStep57_conv_block7 head58 headStep57_conv_result8 = headStep57_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep57_conv_blockStep7"
  out.flush

theorem headStep55_conv_blockStep7 :
    convWithTail headStep55_conv_block7 head56 headStep55_conv_result8 = headStep55_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep55_conv_blockStep7"
  out.flush

theorem headStep53_conv_blockStep7 :
    convWithTail headStep53_conv_block7 head54 headStep53_conv_result8 = headStep53_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep53_conv_blockStep7"
  out.flush

theorem headStep51_conv_blockStep7 :
    convWithTail headStep51_conv_block7 head52 headStep51_conv_result8 = headStep51_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep51_conv_blockStep7"
  out.flush

theorem headStep50_conv_input :
    ratioA = headStep50_conv_suffix0 := by
  decide +kernel

theorem headStep49_conv_blockStep7 :
    convWithTail headStep49_conv_block7 head50 headStep49_conv_result8 = headStep49_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep49_conv_blockStep7"
  out.flush

theorem headStep47_conv_blockStep7 :
    convWithTail headStep47_conv_block7 head48 headStep47_conv_result8 = headStep47_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep47_conv_blockStep7"
  out.flush

theorem headStep45_conv_blockStep7 :
    convWithTail headStep45_conv_block7 head46 headStep45_conv_result8 = headStep45_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep45_conv_blockStep7"
  out.flush

theorem headStep43_conv_blockStep7 :
    convWithTail headStep43_conv_block7 head44 headStep43_conv_result8 = headStep43_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep43_conv_blockStep7"
  out.flush

theorem headStep42_conv_blockStep8 :
    convWithTail headStep42_conv_block8 head43 headStep42_conv_result9 = headStep42_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep42_conv_blockStep8"
  out.flush

theorem headStep41_conv_blockStep7 :
    convWithTail headStep41_conv_block7 head42 headStep41_conv_result8 = headStep41_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep41_conv_blockStep7"
  out.flush

theorem headStep39_conv_blockStep7 :
    convWithTail headStep39_conv_block7 head40 headStep39_conv_result8 = headStep39_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep39_conv_blockStep7"
  out.flush

theorem headStep37_conv_blockStep7 :
    convWithTail headStep37_conv_block7 head38 headStep37_conv_result8 = headStep37_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep37_conv_blockStep7"
  out.flush

theorem headStep35_conv_blockStep7 :
    convWithTail headStep35_conv_block7 head36 headStep35_conv_result8 = headStep35_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep35_conv_blockStep7"
  out.flush

theorem headStep34_conv_input :
    ratioA = headStep34_conv_suffix0 := by
  decide +kernel

theorem headStep33_conv_blockStep7 :
    convWithTail headStep33_conv_block7 head34 headStep33_conv_result8 = headStep33_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep33_conv_blockStep7"
  out.flush

theorem headStep31_conv_blockStep7 :
    convWithTail headStep31_conv_block7 head32 headStep31_conv_result8 = headStep31_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep31_conv_blockStep7"
  out.flush

theorem headStep29_conv_blockStep7 :
    convWithTail headStep29_conv_block7 head30 headStep29_conv_result8 = headStep29_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep29_conv_blockStep7"
  out.flush

theorem headStep27_conv_blockStep7 :
    convWithTail headStep27_conv_block7 head28 headStep27_conv_result8 = headStep27_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep27_conv_blockStep7"
  out.flush

theorem headStep26_conv_blockStep8 :
    convWithTail headStep26_conv_block8 head27 headStep26_conv_result9 = headStep26_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep26_conv_blockStep8"
  out.flush

theorem headStep25_conv_blockStep7 :
    convWithTail headStep25_conv_block7 head26 headStep25_conv_result8 = headStep25_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep25_conv_blockStep7"
  out.flush

theorem headStep23_conv_blockStep7 :
    convWithTail headStep23_conv_block7 head24 headStep23_conv_result8 = headStep23_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep23_conv_blockStep7"
  out.flush

theorem headStep21_conv_blockStep7 :
    convWithTail headStep21_conv_block7 head22 headStep21_conv_result8 = headStep21_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep21_conv_blockStep7"
  out.flush

theorem headStep19_conv_blockStep7 :
    convWithTail headStep19_conv_block7 head20 headStep19_conv_result8 = headStep19_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep19_conv_blockStep7"
  out.flush

theorem headStep18_conv_input :
    ratioA = headStep18_conv_suffix0 := by
  decide +kernel

theorem headStep17_conv_blockStep7 :
    convWithTail headStep17_conv_block7 head18 headStep17_conv_result8 = headStep17_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep17_conv_blockStep7"
  out.flush

theorem headStep15_conv_blockStep7 :
    convWithTail headStep15_conv_block7 head16 headStep15_conv_result8 = headStep15_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep15_conv_blockStep7"
  out.flush

theorem headStep13_conv_blockStep7 :
    convWithTail headStep13_conv_block7 head14 headStep13_conv_result8 = headStep13_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep13_conv_blockStep7"
  out.flush

theorem headStep11_conv_blockStep7 :
    convWithTail headStep11_conv_block7 head12 headStep11_conv_result8 = headStep11_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep11_conv_blockStep7"
  out.flush

theorem headStep10_conv_blockStep8 :
    convWithTail headStep10_conv_block8 head11 headStep10_conv_result9 = headStep10_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep10_conv_blockStep8"
  out.flush

theorem headStep9_conv_blockStep7 :
    convWithTail headStep9_conv_block7 head10 headStep9_conv_result8 = headStep9_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep9_conv_blockStep7"
  out.flush

theorem headStep7_conv_blockStep7 :
    convWithTail headStep7_conv_block7 head8 headStep7_conv_result8 = headStep7_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep7_conv_blockStep7"
  out.flush

theorem headStep5_conv_blockStep7 :
    convWithTail headStep5_conv_block7 head6 headStep5_conv_result8 = headStep5_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep5_conv_blockStep7"
  out.flush

theorem headStep3_conv_blockStep7 :
    convWithTail headStep3_conv_block7 head4 headStep3_conv_result8 = headStep3_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep3_conv_blockStep7"
  out.flush

theorem headStep2_conv_input :
    ratioA = headStep2_conv_suffix0 := by
  decide +kernel

theorem headStep1_conv_blockStep7 :
    convWithTail headStep1_conv_block7 head2 headStep1_conv_result8 = headStep1_conv_result7 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep1_conv_blockStep7"
  out.flush

theorem final_step_conv_blockStep3 :
    convWithTail final_step_conv_block3 head0 final_step_conv_result4 = final_step_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached final_step_conv_blockStep3"
  out.flush

theorem powerStep7_conv_blockStep4 :
    convWithTail powerStep7_conv_block4 power6 powerStep7_conv_result5 = powerStep7_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep7_conv_blockStep4"
  out.flush

theorem powerStep10_conv_blockStep1 :
    convWithTail powerStep10_conv_block1 power9 powerStep10_conv_result2 = powerStep10_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep10_conv_blockStep1"
  out.flush

theorem powerStep12_conv_blockStep4 :
    convWithTail powerStep12_conv_block4 power11 powerStep12_conv_result5 = powerStep12_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep12_conv_blockStep4"
  out.flush

theorem powerStep15_conv_input :
    pI = powerStep15_conv_suffix0 := by
  decide +kernel

theorem powerStep16_conv_blockStep0 :
    convWithTail powerStep16_conv_block0 power15 powerStep16_conv_result1 = powerStep16_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep16_conv_blockStep0"
  out.flush

theorem seed_product_step_conv_blockStep10 :
    convWithTail seed_product_step_conv_block10 power17 seed_product_step_conv_result11 = seed_product_step_conv_result10 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached seed_product_step_conv_blockStep10"
  out.flush

theorem inverseProduct_step_conv_blockStep6 :
    convWithTail inverseProduct_step_conv_block6 inverseD inverseProduct_step_conv_result7 = inverseProduct_step_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached inverseProduct_step_conv_blockStep6"
  out.flush

end Grothe.HaagerupCanonical.Trace
