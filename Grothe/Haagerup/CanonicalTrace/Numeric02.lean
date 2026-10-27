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

theorem coefficientStep10 :
    c10 * (((2*10+1)^2 : Nat) : Rat) / ((4*(10+1)*(10+2) : Nat) : Rat) = c11 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 12: reached coefficientStep10"
  out.flush

theorem coefficientStep20 :
    c20 * (((2*20+1)^2 : Nat) : Rat) / ((4*(20+1)*(20+2) : Nat) : Rat) = c21 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 22: reached coefficientStep20"
  out.flush

theorem coefficientStep36 :
    c36 * (((2*36+1)^2 : Nat) : Rat) / ((4*(36+1)*(36+2) : Nat) : Rat) = c37 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 38: reached coefficientStep36"
  out.flush

theorem coefficientStep52 :
    c52 * (((2*52+1)^2 : Nat) : Rat) / ((4*(52+1)*(52+2) : Nat) : Rat) = c53 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 54: reached coefficientStep52"
  out.flush

theorem coefficientStep68 :
    c68 * (((2*68+1)^2 : Nat) : Rat) / ((4*(68+1)*(68+2) : Nat) : Rat) = c69 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 70: reached coefficientStep68"
  out.flush

theorem differenceStep2_64 :
    d1_64 - d1_65 = d2_64 := by
  decide +kernel

theorem differenceStep3_71 :
    d2_71 - d2_72 = d3_71 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 79: reached difference_order_3"
  out.flush

theorem differenceStep6_66 :
    d5_66 - d5_67 = d6_66 := by
  decide +kernel

theorem r_interval_eq :
    rlQ.map ofRatI = rI := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 90: reached r_interval_eq"
  out.flush

theorem ratioY_step_conv_blockStep0 :
    convWithTail ratioY_step_conv_block0 ratioA ratioY_step_conv_result1 = ratioY_step_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached ratioY_step_conv_blockStep0"
  out.flush

theorem correctionStep8_conv_blockStep3 :
    convWithTail correctionStep8_conv_block3 correction9 correctionStep8_conv_result4 = correctionStep8_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep8_conv_blockStep3"
  out.flush

theorem correctionStep7_conv_blockStep21 :
    convWithTail correctionStep7_conv_block21 correction8 correctionStep7_conv_result22 = correctionStep7_conv_result21 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep7_conv_blockStep21"
  out.flush

theorem correctionStep7_conv_blockStep17 :
    convWithTail correctionStep7_conv_block17 correction8 correctionStep7_conv_result18 = correctionStep7_conv_result17 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep7_conv_blockStep17"
  out.flush

theorem correctionStep7_conv_blockStep1 :
    convWithTail correctionStep7_conv_block1 correction8 correctionStep7_conv_result2 = correctionStep7_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep7_conv_blockStep1"
  out.flush

theorem correctionStep6_conv_blockStep6 :
    convWithTail correctionStep6_conv_block6 correction7 correctionStep6_conv_result7 = correctionStep6_conv_result6 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep6_conv_blockStep6"
  out.flush

theorem correctionStep5_conv_blockStep11 :
    convWithTail correctionStep5_conv_block11 correction6 correctionStep5_conv_result12 = correctionStep5_conv_result11 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep5_conv_blockStep11"
  out.flush

theorem correctionStep4_conv_blockStep16 :
    convWithTail correctionStep4_conv_block16 correction5 correctionStep4_conv_result17 = correctionStep4_conv_result16 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep16"
  out.flush

theorem correctionStep4_conv_blockStep0 :
    convWithTail correctionStep4_conv_block0 correction5 correctionStep4_conv_result1 = correctionStep4_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep0"
  out.flush

theorem correctionStep3_conv_blockStep5 :
    convWithTail correctionStep3_conv_block5 correction4 correctionStep3_conv_result6 = correctionStep3_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep5"
  out.flush

theorem correctionStep2_conv_blockStep10 :
    convWithTail correctionStep2_conv_block10 correction3 correctionStep2_conv_result11 = correctionStep2_conv_result10 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep10"
  out.flush

theorem correctionStep1_conv_blockStep15 :
    convWithTail correctionStep1_conv_block15 correction2 correctionStep1_conv_result16 = correctionStep1_conv_result15 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep15"
  out.flush

theorem correctionStep0_conv_blockStep20 :
    convWithTail correctionStep0_conv_block20 correction1 correctionStep0_conv_result21 = correctionStep0_conv_result20 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep20"
  out.flush

theorem correctionStep0_conv_blockStep4 :
    convWithTail correctionStep0_conv_block4 correction1 correctionStep0_conv_result5 = correctionStep0_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep4"
  out.flush

theorem tail_step_conv_blockStep1 :
    convWithTail tail_step_conv_block1 correction0 tail_step_conv_result2 = tail_step_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached tail_step_conv_blockStep1"
  out.flush

theorem headStep63_conv_blockStep5 :
    convWithTail headStep63_conv_block5 head64 headStep63_conv_result6 = headStep63_conv_result5 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep63_conv_blockStep5"
  out.flush

theorem headStep61_conv_blockStep1 :
    convWithTail headStep61_conv_block1 head62 headStep61_conv_result2 = headStep61_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep61_conv_blockStep1"
  out.flush

theorem headStep59_conv_blockStep1 :
    convWithTail headStep59_conv_block1 head60 headStep59_conv_result2 = headStep59_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep59_conv_blockStep1"
  out.flush

theorem headStep57_conv_blockStep1 :
    convWithTail headStep57_conv_block1 head58 headStep57_conv_result2 = headStep57_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep57_conv_blockStep1"
  out.flush

theorem headStep56_conv_blockStep8 :
    convWithTail headStep56_conv_block8 head57 headStep56_conv_result9 = headStep56_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep56_conv_blockStep8"
  out.flush

theorem headStep55_conv_blockStep1 :
    convWithTail headStep55_conv_block1 head56 headStep55_conv_result2 = headStep55_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep55_conv_blockStep1"
  out.flush

theorem headStep53_conv_blockStep1 :
    convWithTail headStep53_conv_block1 head54 headStep53_conv_result2 = headStep53_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep53_conv_blockStep1"
  out.flush

theorem headStep53_conv_input :
    ratioA = headStep53_conv_suffix0 := by
  decide +kernel

theorem headStep51_conv_blockStep1 :
    convWithTail headStep51_conv_block1 head52 headStep51_conv_result2 = headStep51_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep51_conv_blockStep1"
  out.flush

theorem headStep49_conv_blockStep1 :
    convWithTail headStep49_conv_block1 head50 headStep49_conv_result2 = headStep49_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep49_conv_blockStep1"
  out.flush

theorem headStep47_conv_blockStep1 :
    convWithTail headStep47_conv_block1 head48 headStep47_conv_result2 = headStep47_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep47_conv_blockStep1"
  out.flush

theorem headStep45_conv_blockStep8 :
    convWithTail headStep45_conv_block8 head46 headStep45_conv_result9 = headStep45_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep45_conv_blockStep8"
  out.flush

theorem headStep45_conv_blockStep1 :
    convWithTail headStep45_conv_block1 head46 headStep45_conv_result2 = headStep45_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep45_conv_blockStep1"
  out.flush

theorem headStep43_conv_blockStep1 :
    convWithTail headStep43_conv_block1 head44 headStep43_conv_result2 = headStep43_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep43_conv_blockStep1"
  out.flush

theorem headStep41_conv_blockStep1 :
    convWithTail headStep41_conv_block1 head42 headStep41_conv_result2 = headStep41_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep41_conv_blockStep1"
  out.flush

theorem headStep39_conv_blockStep1 :
    convWithTail headStep39_conv_block1 head40 headStep39_conv_result2 = headStep39_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep39_conv_blockStep1"
  out.flush

theorem headStep37_conv_blockStep1 :
    convWithTail headStep37_conv_block1 head38 headStep37_conv_result2 = headStep37_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep37_conv_blockStep1"
  out.flush

theorem headStep37_conv_input :
    ratioA = headStep37_conv_suffix0 := by
  decide +kernel

theorem headStep35_conv_blockStep1 :
    convWithTail headStep35_conv_block1 head36 headStep35_conv_result2 = headStep35_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep35_conv_blockStep1"
  out.flush

theorem headStep33_conv_blockStep1 :
    convWithTail headStep33_conv_block1 head34 headStep33_conv_result2 = headStep33_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep33_conv_blockStep1"
  out.flush

theorem headStep31_conv_blockStep1 :
    convWithTail headStep31_conv_block1 head32 headStep31_conv_result2 = headStep31_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep31_conv_blockStep1"
  out.flush

theorem headStep29_conv_blockStep8 :
    convWithTail headStep29_conv_block8 head30 headStep29_conv_result9 = headStep29_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep29_conv_blockStep8"
  out.flush

theorem headStep29_conv_blockStep1 :
    convWithTail headStep29_conv_block1 head30 headStep29_conv_result2 = headStep29_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep29_conv_blockStep1"
  out.flush

theorem headStep27_conv_blockStep1 :
    convWithTail headStep27_conv_block1 head28 headStep27_conv_result2 = headStep27_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep27_conv_blockStep1"
  out.flush

theorem headStep25_conv_blockStep1 :
    convWithTail headStep25_conv_block1 head26 headStep25_conv_result2 = headStep25_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep25_conv_blockStep1"
  out.flush

theorem headStep23_conv_blockStep1 :
    convWithTail headStep23_conv_block1 head24 headStep23_conv_result2 = headStep23_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep23_conv_blockStep1"
  out.flush

theorem headStep21_conv_blockStep1 :
    convWithTail headStep21_conv_block1 head22 headStep21_conv_result2 = headStep21_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep21_conv_blockStep1"
  out.flush

theorem headStep21_conv_input :
    ratioA = headStep21_conv_suffix0 := by
  decide +kernel

theorem headStep19_conv_blockStep1 :
    convWithTail headStep19_conv_block1 head20 headStep19_conv_result2 = headStep19_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep19_conv_blockStep1"
  out.flush

theorem headStep17_conv_blockStep1 :
    convWithTail headStep17_conv_block1 head18 headStep17_conv_result2 = headStep17_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep17_conv_blockStep1"
  out.flush

theorem headStep15_conv_blockStep1 :
    convWithTail headStep15_conv_block1 head16 headStep15_conv_result2 = headStep15_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep15_conv_blockStep1"
  out.flush

theorem headStep13_conv_blockStep8 :
    convWithTail headStep13_conv_block8 head14 headStep13_conv_result9 = headStep13_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep13_conv_blockStep8"
  out.flush

theorem headStep13_conv_blockStep1 :
    convWithTail headStep13_conv_block1 head14 headStep13_conv_result2 = headStep13_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep13_conv_blockStep1"
  out.flush

theorem headStep11_conv_blockStep1 :
    convWithTail headStep11_conv_block1 head12 headStep11_conv_result2 = headStep11_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep11_conv_blockStep1"
  out.flush

theorem headStep9_conv_blockStep1 :
    convWithTail headStep9_conv_block1 head10 headStep9_conv_result2 = headStep9_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep9_conv_blockStep1"
  out.flush

theorem headStep7_conv_blockStep1 :
    convWithTail headStep7_conv_block1 head8 headStep7_conv_result2 = headStep7_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep7_conv_blockStep1"
  out.flush

theorem headStep5_conv_blockStep1 :
    convWithTail headStep5_conv_block1 head6 headStep5_conv_result2 = headStep5_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep5_conv_blockStep1"
  out.flush

theorem headStep5_conv_input :
    ratioA = headStep5_conv_suffix0 := by
  decide +kernel

theorem headStep3_conv_blockStep1 :
    convWithTail headStep3_conv_block1 head4 headStep3_conv_result2 = headStep3_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep3_conv_blockStep1"
  out.flush

theorem headStep1_conv_blockStep1 :
    convWithTail headStep1_conv_block1 head2 headStep1_conv_result2 = headStep1_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep1_conv_blockStep1"
  out.flush

theorem powerStep9_conv_blockStep1 :
    convWithTail powerStep9_conv_block1 power8 powerStep9_conv_result2 = powerStep9_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep9_conv_blockStep1"
  out.flush

theorem powerStep10_conv_blockStep1 :
    convWithTail powerStep10_conv_block1 power9 powerStep10_conv_result2 = powerStep10_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep10_conv_blockStep1"
  out.flush

theorem powerStep12_conv_input :
    pI = powerStep12_conv_suffix0 := by
  decide +kernel

theorem powerStep15_conv_blockStep4 :
    convWithTail powerStep15_conv_block4 power14 powerStep15_conv_result5 = powerStep15_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep15_conv_blockStep4"
  out.flush

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

end Grothe.HaagerupCanonical.Trace
