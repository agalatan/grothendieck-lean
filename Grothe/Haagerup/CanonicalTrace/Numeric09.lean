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

theorem coefficientStep8 :
    c8 * (((2*8+1)^2 : Nat) : Rat) / ((4*(8+1)*(8+2) : Nat) : Rat) = c9 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 10: reached coefficientStep8"
  out.flush

theorem coefficientStep18 :
    c18 * (((2*18+1)^2 : Nat) : Rat) / ((4*(18+1)*(18+2) : Nat) : Rat) = c19 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 20: reached coefficientStep18"
  out.flush

theorem coefficientStep34 :
    c34 * (((2*34+1)^2 : Nat) : Rat) / ((4*(34+1)*(34+2) : Nat) : Rat) = c35 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 36: reached coefficientStep34"
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

theorem differenceStep2_66 :
    d1_66 - d1_67 = d2_66 := by
  decide +kernel

theorem differenceStep5_64 :
    d4_64 - d4_65 = d5_64 := by
  decide +kernel

theorem ratioY_step_conv_blockStep3 :
    convWithTail ratioY_step_conv_block3 ratioA ratioY_step_conv_result4 = ratioY_step_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached ratioY_step_conv_blockStep3"
  out.flush

theorem correctionStep6_conv_blockStep17 :
    convWithTail correctionStep6_conv_block17 correction7 correctionStep6_conv_result18 = correctionStep6_conv_result17 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep6_conv_blockStep17"
  out.flush

theorem correctionStep6_conv_blockStep2 :
    convWithTail correctionStep6_conv_block2 correction7 correctionStep6_conv_result3 = correctionStep6_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep6_conv_blockStep2"
  out.flush

theorem correctionStep5_conv_blockStep12 :
    convWithTail correctionStep5_conv_block12 correction6 correctionStep5_conv_result13 = correctionStep5_conv_result12 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep5_conv_blockStep12"
  out.flush

theorem correctionStep5_conv_input :
    ratioY = correctionStep5_conv_suffix0 := by
  decide +kernel

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

theorem headStep63_conv_input :
    ratioA = headStep63_conv_suffix0 := by
  decide +kernel

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

theorem headStep50_conv_blockStep8 :
    convWithTail headStep50_conv_block8 head51 headStep50_conv_result9 = headStep50_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep50_conv_blockStep8"
  out.flush

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

theorem headStep47_conv_input :
    ratioA = headStep47_conv_suffix0 := by
  decide +kernel

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

theorem headStep34_conv_blockStep8 :
    convWithTail headStep34_conv_block8 head35 headStep34_conv_result9 = headStep34_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep34_conv_blockStep8"
  out.flush

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

theorem headStep31_conv_input :
    ratioA = headStep31_conv_suffix0 := by
  decide +kernel

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

theorem headStep18_conv_blockStep8 :
    convWithTail headStep18_conv_block8 head19 headStep18_conv_result9 = headStep18_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep18_conv_blockStep8"
  out.flush

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

theorem headStep15_conv_input :
    ratioA = headStep15_conv_suffix0 := by
  decide +kernel

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

theorem headStep2_conv_blockStep8 :
    convWithTail headStep2_conv_block8 head3 headStep2_conv_result9 = headStep2_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep2_conv_blockStep8"
  out.flush

theorem headStep1_conv_blockStep2 :
    convWithTail headStep1_conv_block2 head2 headStep1_conv_result3 = headStep1_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep1_conv_blockStep2"
  out.flush

theorem final_step_conv_input :
    pI = final_step_conv_suffix0 := by
  decide +kernel

theorem powerStep9_conv_blockStep2 :
    convWithTail powerStep9_conv_block2 power8 powerStep9_conv_result3 = powerStep9_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep9_conv_blockStep2"
  out.flush

theorem powerStep12_conv_blockStep2 :
    convWithTail powerStep12_conv_block2 power11 powerStep12_conv_result3 = powerStep12_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep12_conv_blockStep2"
  out.flush

theorem powerStep14_conv_blockStep1 :
    convWithTail powerStep14_conv_block1 power13 powerStep14_conv_result2 = powerStep14_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep14_conv_blockStep1"
  out.flush

theorem seed_product_step_conv_blockStep3 :
    convWithTail seed_product_step_conv_block3 power17 seed_product_step_conv_result4 = seed_product_step_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached seed_product_step_conv_blockStep3"
  out.flush

theorem seed_product_step_conv_input :
    rI = seed_product_step_conv_suffix0 := by
  decide +kernel

theorem inverseProduct_step_conv_blockStep0 :
    convWithTail inverseProduct_step_conv_block0 inverseD inverseProduct_step_conv_result1 = inverseProduct_step_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached inverseProduct_step_conv_blockStep0"
  out.flush

end Grothe.HaagerupCanonical.Trace
