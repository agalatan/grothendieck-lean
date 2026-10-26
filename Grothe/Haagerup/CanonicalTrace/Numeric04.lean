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

theorem differenceStep1_64 :
    d0_64 - d0_65 = d1_64 := by
  decide +kernel

theorem differenceStep3_65 :
    d2_65 - d2_66 = d3_65 := by
  decide +kernel

theorem differenceStep6_66 :
    d5_66 - d5_67 = d6_66 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 80: reached difference_order_6"
  out.flush

theorem ratioY_step_conv_blockStep12 :
    convWithTail ratioY_step_conv_block12 ratioA ratioY_step_conv_result13 = ratioY_step_conv_result12 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached ratioY_step_conv_blockStep12"
  out.flush

theorem correctionStep6_conv_blockStep10 :
    convWithTail correctionStep6_conv_block10 correction7 correctionStep6_conv_result11 = correctionStep6_conv_result10 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep6_conv_blockStep10"
  out.flush

theorem correctionStep5_conv_blockStep16 :
    convWithTail correctionStep5_conv_block16 correction6 correctionStep5_conv_result17 = correctionStep5_conv_result16 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep5_conv_blockStep16"
  out.flush

theorem correctionStep5_conv_blockStep0 :
    convWithTail correctionStep5_conv_block0 correction6 correctionStep5_conv_result1 = correctionStep5_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep5_conv_blockStep0"
  out.flush

theorem correctionStep4_conv_blockStep5 :
    convWithTail correctionStep4_conv_block5 correction5 correctionStep4_conv_result6 = correctionStep4_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep5"
  out.flush

theorem correctionStep3_conv_blockStep10 :
    convWithTail correctionStep3_conv_block10 correction4 correctionStep3_conv_result11 = correctionStep3_conv_result10 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep10"
  out.flush

theorem correctionStep2_conv_blockStep15 :
    convWithTail correctionStep2_conv_block15 correction3 correctionStep2_conv_result16 = correctionStep2_conv_result15 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep15"
  out.flush

theorem correctionStep1_conv_blockStep21 :
    convWithTail correctionStep1_conv_block21 correction2 correctionStep1_conv_result22 = correctionStep1_conv_result21 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep21"
  out.flush

theorem correctionStep1_conv_blockStep20 :
    convWithTail correctionStep1_conv_block20 correction2 correctionStep1_conv_result21 = correctionStep1_conv_result20 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep20"
  out.flush

theorem correctionStep1_conv_blockStep4 :
    convWithTail correctionStep1_conv_block4 correction2 correctionStep1_conv_result5 = correctionStep1_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep4"
  out.flush

theorem correctionStep0_conv_blockStep9 :
    convWithTail correctionStep0_conv_block9 correction1 correctionStep0_conv_result10 = correctionStep0_conv_result9 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep9"
  out.flush

theorem tail_step_conv_blockStep6 :
    convWithTail tail_step_conv_block6 correction0 tail_step_conv_result7 = tail_step_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached tail_step_conv_blockStep6"
  out.flush

theorem tail_step_conv_input :
    rI = tail_step_conv_suffix0 := by
  decide +kernel

theorem headStep61_conv_blockStep6 :
    convWithTail headStep61_conv_block6 head62 headStep61_conv_result7 = headStep61_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep61_conv_blockStep6"
  out.flush

theorem headStep59_conv_blockStep6 :
    convWithTail headStep59_conv_block6 head60 headStep59_conv_result7 = headStep59_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep59_conv_blockStep6"
  out.flush

theorem headStep57_conv_blockStep8 :
    convWithTail headStep57_conv_block8 head58 headStep57_conv_result9 = headStep57_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep57_conv_blockStep8"
  out.flush

theorem headStep57_conv_blockStep6 :
    convWithTail headStep57_conv_block6 head58 headStep57_conv_result7 = headStep57_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep57_conv_blockStep6"
  out.flush

theorem headStep57_conv_input :
    ratioA = headStep57_conv_suffix0 := by
  decide +kernel

theorem headStep55_conv_blockStep6 :
    convWithTail headStep55_conv_block6 head56 headStep55_conv_result7 = headStep55_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep55_conv_blockStep6"
  out.flush

theorem headStep53_conv_blockStep6 :
    convWithTail headStep53_conv_block6 head54 headStep53_conv_result7 = headStep53_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep53_conv_blockStep6"
  out.flush

theorem headStep51_conv_blockStep6 :
    convWithTail headStep51_conv_block6 head52 headStep51_conv_result7 = headStep51_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep51_conv_blockStep6"
  out.flush

theorem headStep49_conv_blockStep6 :
    convWithTail headStep49_conv_block6 head50 headStep49_conv_result7 = headStep49_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep49_conv_blockStep6"
  out.flush

theorem headStep47_conv_blockStep6 :
    convWithTail headStep47_conv_block6 head48 headStep47_conv_result7 = headStep47_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep47_conv_blockStep6"
  out.flush

theorem headStep45_conv_blockStep6 :
    convWithTail headStep45_conv_block6 head46 headStep45_conv_result7 = headStep45_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep45_conv_blockStep6"
  out.flush

theorem headStep43_conv_blockStep6 :
    convWithTail headStep43_conv_block6 head44 headStep43_conv_result7 = headStep43_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep43_conv_blockStep6"
  out.flush

theorem headStep41_conv_blockStep8 :
    convWithTail headStep41_conv_block8 head42 headStep41_conv_result9 = headStep41_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep41_conv_blockStep8"
  out.flush

theorem headStep41_conv_blockStep6 :
    convWithTail headStep41_conv_block6 head42 headStep41_conv_result7 = headStep41_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep41_conv_blockStep6"
  out.flush

theorem headStep41_conv_input :
    ratioA = headStep41_conv_suffix0 := by
  decide +kernel

theorem headStep39_conv_blockStep6 :
    convWithTail headStep39_conv_block6 head40 headStep39_conv_result7 = headStep39_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep39_conv_blockStep6"
  out.flush

theorem headStep37_conv_blockStep6 :
    convWithTail headStep37_conv_block6 head38 headStep37_conv_result7 = headStep37_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep37_conv_blockStep6"
  out.flush

theorem headStep35_conv_blockStep6 :
    convWithTail headStep35_conv_block6 head36 headStep35_conv_result7 = headStep35_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep35_conv_blockStep6"
  out.flush

theorem headStep33_conv_blockStep6 :
    convWithTail headStep33_conv_block6 head34 headStep33_conv_result7 = headStep33_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep33_conv_blockStep6"
  out.flush

theorem headStep31_conv_blockStep6 :
    convWithTail headStep31_conv_block6 head32 headStep31_conv_result7 = headStep31_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep31_conv_blockStep6"
  out.flush

theorem headStep29_conv_blockStep6 :
    convWithTail headStep29_conv_block6 head30 headStep29_conv_result7 = headStep29_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep29_conv_blockStep6"
  out.flush

theorem headStep27_conv_blockStep6 :
    convWithTail headStep27_conv_block6 head28 headStep27_conv_result7 = headStep27_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep27_conv_blockStep6"
  out.flush

theorem headStep25_conv_blockStep8 :
    convWithTail headStep25_conv_block8 head26 headStep25_conv_result9 = headStep25_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep25_conv_blockStep8"
  out.flush

theorem headStep25_conv_blockStep6 :
    convWithTail headStep25_conv_block6 head26 headStep25_conv_result7 = headStep25_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep25_conv_blockStep6"
  out.flush

theorem headStep25_conv_input :
    ratioA = headStep25_conv_suffix0 := by
  decide +kernel

theorem headStep23_conv_blockStep6 :
    convWithTail headStep23_conv_block6 head24 headStep23_conv_result7 = headStep23_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep23_conv_blockStep6"
  out.flush

theorem headStep21_conv_blockStep6 :
    convWithTail headStep21_conv_block6 head22 headStep21_conv_result7 = headStep21_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep21_conv_blockStep6"
  out.flush

theorem headStep19_conv_blockStep6 :
    convWithTail headStep19_conv_block6 head20 headStep19_conv_result7 = headStep19_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep19_conv_blockStep6"
  out.flush

theorem headStep17_conv_blockStep6 :
    convWithTail headStep17_conv_block6 head18 headStep17_conv_result7 = headStep17_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep17_conv_blockStep6"
  out.flush

theorem headStep15_conv_blockStep6 :
    convWithTail headStep15_conv_block6 head16 headStep15_conv_result7 = headStep15_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep15_conv_blockStep6"
  out.flush

theorem headStep13_conv_blockStep6 :
    convWithTail headStep13_conv_block6 head14 headStep13_conv_result7 = headStep13_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep13_conv_blockStep6"
  out.flush

theorem headStep11_conv_blockStep6 :
    convWithTail headStep11_conv_block6 head12 headStep11_conv_result7 = headStep11_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep11_conv_blockStep6"
  out.flush

theorem headStep9_conv_blockStep8 :
    convWithTail headStep9_conv_block8 head10 headStep9_conv_result9 = headStep9_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep9_conv_blockStep8"
  out.flush

theorem headStep9_conv_blockStep6 :
    convWithTail headStep9_conv_block6 head10 headStep9_conv_result7 = headStep9_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep9_conv_blockStep6"
  out.flush

theorem headStep9_conv_input :
    ratioA = headStep9_conv_suffix0 := by
  decide +kernel

theorem headStep7_conv_blockStep6 :
    convWithTail headStep7_conv_block6 head8 headStep7_conv_result7 = headStep7_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep7_conv_blockStep6"
  out.flush

theorem headStep5_conv_blockStep6 :
    convWithTail headStep5_conv_block6 head6 headStep5_conv_result7 = headStep5_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep5_conv_blockStep6"
  out.flush

theorem headStep3_conv_blockStep6 :
    convWithTail headStep3_conv_block6 head4 headStep3_conv_result7 = headStep3_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep3_conv_blockStep6"
  out.flush

theorem headStep1_conv_blockStep6 :
    convWithTail headStep1_conv_block6 head2 headStep1_conv_result7 = headStep1_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep1_conv_blockStep6"
  out.flush

theorem final_step_conv_blockStep2 :
    convWithTail final_step_conv_block2 head0 final_step_conv_result3 = final_step_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached final_step_conv_blockStep2"
  out.flush

theorem powerStep2 :
    convI pI power1 = power2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 165: reached powerStep2"
  out.flush

theorem powerStep8_conv_input :
    pI = powerStep8_conv_suffix0 := by
  decide +kernel

theorem powerStep11_conv_blockStep3 :
    convWithTail powerStep11_conv_block3 power10 powerStep11_conv_result4 = powerStep11_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep11_conv_blockStep3"
  out.flush

theorem powerStep15_conv_blockStep2 :
    convWithTail powerStep15_conv_block2 power14 powerStep15_conv_result3 = powerStep15_conv_result2 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep15_conv_blockStep2"
  out.flush

theorem seed_product_step_conv_blockStep8 :
    convWithTail seed_product_step_conv_block8 power17 seed_product_step_conv_result9 = seed_product_step_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached seed_product_step_conv_blockStep8"
  out.flush

theorem inverseProduct_step_conv_blockStep10 :
    convWithTail inverseProduct_step_conv_block10 inverseD inverseProduct_step_conv_result11 = inverseProduct_step_conv_result10 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached inverseProduct_step_conv_blockStep10"
  out.flush

end Grothe.HaagerupCanonical.Trace
