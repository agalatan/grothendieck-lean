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

theorem differenceStep1_69 :
    d0_69 - d0_70 = d1_69 := by
  decide +kernel

theorem differenceStep4_64 :
    d3_64 - d3_65 = d4_64 := by
  decide +kernel

theorem p_interval_eq :
    plQ.map ofRatI = pI := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 84: reached p_interval_eq"
  out.flush

theorem ratioY_step_conv_blockStep1 :
    convWithTail ratioY_step_conv_block1 ratioA ratioY_step_conv_result2 = ratioY_step_conv_result1 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached ratioY_step_conv_blockStep1"
  out.flush

theorem correctionStep6_conv_blockStep15 :
    convWithTail correctionStep6_conv_block15 correction7 correctionStep6_conv_result16 = correctionStep6_conv_result15 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep6_conv_blockStep15"
  out.flush

theorem correctionStep6_conv_blockStep0 :
    convWithTail correctionStep6_conv_block0 correction7 correctionStep6_conv_result1 = correctionStep6_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep6_conv_blockStep0"
  out.flush

theorem correctionStep5_conv_blockStep10 :
    convWithTail correctionStep5_conv_block10 correction6 correctionStep5_conv_result11 = correctionStep5_conv_result10 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep5_conv_blockStep10"
  out.flush

theorem correctionStep4_conv_blockStep15 :
    convWithTail correctionStep4_conv_block15 correction5 correctionStep4_conv_result16 = correctionStep4_conv_result15 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep4_conv_blockStep15"
  out.flush

theorem correctionStep3_conv_blockStep20 :
    convWithTail correctionStep3_conv_block20 correction4 correctionStep3_conv_result21 = correctionStep3_conv_result20 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep20"
  out.flush

theorem correctionStep3_conv_blockStep4 :
    convWithTail correctionStep3_conv_block4 correction4 correctionStep3_conv_result5 = correctionStep3_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep3_conv_blockStep4"
  out.flush

theorem correctionStep2_conv_blockStep9 :
    convWithTail correctionStep2_conv_block9 correction3 correctionStep2_conv_result10 = correctionStep2_conv_result9 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep2_conv_blockStep9"
  out.flush

theorem correctionStep1_conv_blockStep14 :
    convWithTail correctionStep1_conv_block14 correction2 correctionStep1_conv_result15 = correctionStep1_conv_result14 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep1_conv_blockStep14"
  out.flush

theorem correctionStep0_conv_blockStep19 :
    convWithTail correctionStep0_conv_block19 correction1 correctionStep0_conv_result20 = correctionStep0_conv_result19 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep19"
  out.flush

theorem correctionStep0_conv_blockStep3 :
    convWithTail correctionStep0_conv_block3 correction1 correctionStep0_conv_result4 = correctionStep0_conv_result3 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached correctionStep0_conv_blockStep3"
  out.flush

theorem tail_step_conv_blockStep0 :
    convWithTail tail_step_conv_block0 correction0 tail_step_conv_result1 = tail_step_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached tail_step_conv_blockStep0"
  out.flush

theorem headStep63_conv_blockStep4 :
    convWithTail headStep63_conv_block4 head64 headStep63_conv_result5 = headStep63_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep63_conv_blockStep4"
  out.flush

theorem headStep61_conv_blockStep0 :
    convWithTail headStep61_conv_block0 head62 headStep61_conv_result1 = headStep61_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep61_conv_blockStep0"
  out.flush

theorem headStep59_conv_blockStep0 :
    convWithTail headStep59_conv_block0 head60 headStep59_conv_result1 = headStep59_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep59_conv_blockStep0"
  out.flush

theorem headStep57_conv_blockStep0 :
    convWithTail headStep57_conv_block0 head58 headStep57_conv_result1 = headStep57_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep57_conv_blockStep0"
  out.flush

theorem headStep55_conv_blockStep0 :
    convWithTail headStep55_conv_block0 head56 headStep55_conv_result1 = headStep55_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep55_conv_blockStep0"
  out.flush

theorem headStep53_conv_blockStep0 :
    convWithTail headStep53_conv_block0 head54 headStep53_conv_result1 = headStep53_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep53_conv_blockStep0"
  out.flush

theorem headStep52_conv_input :
    ratioA = headStep52_conv_suffix0 := by
  decide +kernel

theorem headStep51_conv_blockStep0 :
    convWithTail headStep51_conv_block0 head52 headStep51_conv_result1 = headStep51_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep51_conv_blockStep0"
  out.flush

theorem headStep49_conv_blockStep0 :
    convWithTail headStep49_conv_block0 head50 headStep49_conv_result1 = headStep49_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep49_conv_blockStep0"
  out.flush

theorem headStep48_conv_blockStep8 :
    convWithTail headStep48_conv_block8 head49 headStep48_conv_result9 = headStep48_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep48_conv_blockStep8"
  out.flush

theorem headStep47_conv_blockStep0 :
    convWithTail headStep47_conv_block0 head48 headStep47_conv_result1 = headStep47_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep47_conv_blockStep0"
  out.flush

theorem headStep45_conv_blockStep0 :
    convWithTail headStep45_conv_block0 head46 headStep45_conv_result1 = headStep45_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep45_conv_blockStep0"
  out.flush

theorem headStep43_conv_blockStep0 :
    convWithTail headStep43_conv_block0 head44 headStep43_conv_result1 = headStep43_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep43_conv_blockStep0"
  out.flush

theorem headStep41_conv_blockStep0 :
    convWithTail headStep41_conv_block0 head42 headStep41_conv_result1 = headStep41_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep41_conv_blockStep0"
  out.flush

theorem headStep39_conv_blockStep0 :
    convWithTail headStep39_conv_block0 head40 headStep39_conv_result1 = headStep39_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep39_conv_blockStep0"
  out.flush

theorem headStep37_conv_blockStep0 :
    convWithTail headStep37_conv_block0 head38 headStep37_conv_result1 = headStep37_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep37_conv_blockStep0"
  out.flush

theorem headStep36_conv_input :
    ratioA = headStep36_conv_suffix0 := by
  decide +kernel

theorem headStep35_conv_blockStep0 :
    convWithTail headStep35_conv_block0 head36 headStep35_conv_result1 = headStep35_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep35_conv_blockStep0"
  out.flush

theorem headStep33_conv_blockStep0 :
    convWithTail headStep33_conv_block0 head34 headStep33_conv_result1 = headStep33_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep33_conv_blockStep0"
  out.flush

theorem headStep32_conv_blockStep8 :
    convWithTail headStep32_conv_block8 head33 headStep32_conv_result9 = headStep32_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep32_conv_blockStep8"
  out.flush

theorem headStep31_conv_blockStep0 :
    convWithTail headStep31_conv_block0 head32 headStep31_conv_result1 = headStep31_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep31_conv_blockStep0"
  out.flush

theorem headStep29_conv_blockStep0 :
    convWithTail headStep29_conv_block0 head30 headStep29_conv_result1 = headStep29_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep29_conv_blockStep0"
  out.flush

theorem headStep27_conv_blockStep0 :
    convWithTail headStep27_conv_block0 head28 headStep27_conv_result1 = headStep27_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep27_conv_blockStep0"
  out.flush

theorem headStep25_conv_blockStep0 :
    convWithTail headStep25_conv_block0 head26 headStep25_conv_result1 = headStep25_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep25_conv_blockStep0"
  out.flush

theorem headStep23_conv_blockStep0 :
    convWithTail headStep23_conv_block0 head24 headStep23_conv_result1 = headStep23_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep23_conv_blockStep0"
  out.flush

theorem headStep21_conv_blockStep0 :
    convWithTail headStep21_conv_block0 head22 headStep21_conv_result1 = headStep21_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep21_conv_blockStep0"
  out.flush

theorem headStep20_conv_input :
    ratioA = headStep20_conv_suffix0 := by
  decide +kernel

theorem headStep19_conv_blockStep0 :
    convWithTail headStep19_conv_block0 head20 headStep19_conv_result1 = headStep19_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep19_conv_blockStep0"
  out.flush

theorem headStep17_conv_blockStep0 :
    convWithTail headStep17_conv_block0 head18 headStep17_conv_result1 = headStep17_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep17_conv_blockStep0"
  out.flush

theorem headStep16_conv_blockStep8 :
    convWithTail headStep16_conv_block8 head17 headStep16_conv_result9 = headStep16_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep16_conv_blockStep8"
  out.flush

theorem headStep15_conv_blockStep0 :
    convWithTail headStep15_conv_block0 head16 headStep15_conv_result1 = headStep15_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep15_conv_blockStep0"
  out.flush

theorem headStep13_conv_blockStep0 :
    convWithTail headStep13_conv_block0 head14 headStep13_conv_result1 = headStep13_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep13_conv_blockStep0"
  out.flush

theorem headStep11_conv_blockStep0 :
    convWithTail headStep11_conv_block0 head12 headStep11_conv_result1 = headStep11_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep11_conv_blockStep0"
  out.flush

theorem headStep9_conv_blockStep0 :
    convWithTail headStep9_conv_block0 head10 headStep9_conv_result1 = headStep9_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep9_conv_blockStep0"
  out.flush

theorem headStep7_conv_blockStep0 :
    convWithTail headStep7_conv_block0 head8 headStep7_conv_result1 = headStep7_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep7_conv_blockStep0"
  out.flush

theorem headStep5_conv_blockStep0 :
    convWithTail headStep5_conv_block0 head6 headStep5_conv_result1 = headStep5_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep5_conv_blockStep0"
  out.flush

theorem headStep4_conv_input :
    ratioA = headStep4_conv_suffix0 := by
  decide +kernel

theorem headStep3_conv_blockStep0 :
    convWithTail headStep3_conv_block0 head4 headStep3_conv_result1 = headStep3_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep3_conv_blockStep0"
  out.flush

theorem headStep1_conv_blockStep0 :
    convWithTail headStep1_conv_block0 head2 headStep1_conv_result1 = headStep1_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep1_conv_blockStep0"
  out.flush

theorem headStep0_conv_blockStep8 :
    convWithTail headStep0_conv_block8 head1 headStep0_conv_result9 = headStep0_conv_result8 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached headStep0_conv_blockStep8"
  out.flush

theorem final_step_conv_blockStep4 :
    convWithTail final_step_conv_block4 head0 final_step_conv_result5 = final_step_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached final_step_conv_blockStep4"
  out.flush

theorem powerStep9_conv_blockStep0 :
    convWithTail powerStep9_conv_block0 power8 powerStep9_conv_result1 = powerStep9_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep9_conv_blockStep0"
  out.flush

theorem powerStep10_conv_blockStep4 :
    convWithTail powerStep10_conv_block4 power9 powerStep10_conv_result5 = powerStep10_conv_result4 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached powerStep10_conv_blockStep4"
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

theorem powerStep13_conv_input :
    pI = powerStep13_conv_suffix0 := by
  decide +kernel

theorem seed_product_step_conv_blockStep0 :
    convWithTail seed_product_step_conv_block0 power17 seed_product_step_conv_result1 = seed_product_step_conv_result0 := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical convolution: reached seed_product_step_conv_blockStep0"
  out.flush

end Grothe.HaagerupCanonical.Trace
