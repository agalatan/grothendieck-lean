import Grothe.Haagerup.CanonicalTrace.Chunk17
import Grothe.Haagerup.CanonicalData
import Lean.Elab.Command

/-!
Agent-ID: codex-aa04. Literal checkpoints for the canonical Haagerup bound.
Checkpoint module 19 of 20.
Regenerate with tools/gen_haagerup_canonical_check.py.

Each arithmetic step is proved from literal inputs and assembled through
the defining recurrences. Progress messages identify declarations reached.
-/

set_option Elab.async false
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace Grothe.HaagerupCanonical.Trace

open GrotheKernel Grothe.Upper.FiniteDifference

theorem coefficientGlue {k : Nat} {r s : Rat}
    (h : Grothe.haagR k = r)
    (hs : r * (((2*k+1)^2 : Nat) : Rat) / ((4*(k+1)*(k+2) : Nat) : Rat) = s) :
    Grothe.haagR (k+1) = s := by
  rw [Grothe.haagR, h, hs]

theorem differenceGlue {m k : Nat} {u v w : Rat}
    (hu : iterDiff m Grothe.haagR k = u)
    (hv : iterDiff m Grothe.haagR (k+1) = v)
    (hw : u-v = w) : iterDiff (m+1) Grothe.haagR k = w := by
  rw [iterDiff_succ_apply, hu, hv, hw]

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 181: reached source_glue"
  out.flush

theorem coefficientEq0 :
    Grothe.haagR 0 = c0 := by
  exact one_eq_c0

theorem coefficientEq1 :
    Grothe.haagR 1 = c1 := by
  exact coefficientGlue coefficientEq0 coefficientStep0

theorem coefficientEq2 :
    Grothe.haagR 2 = c2 := by
  exact coefficientGlue coefficientEq1 coefficientStep1

theorem coefficientEq3 :
    Grothe.haagR 3 = c3 := by
  exact coefficientGlue coefficientEq2 coefficientStep2

theorem coefficientEq4 :
    Grothe.haagR 4 = c4 := by
  exact coefficientGlue coefficientEq3 coefficientStep3

theorem coefficientEq5 :
    Grothe.haagR 5 = c5 := by
  exact coefficientGlue coefficientEq4 coefficientStep4

theorem coefficientEq6 :
    Grothe.haagR 6 = c6 := by
  exact coefficientGlue coefficientEq5 coefficientStep5

theorem coefficientEq7 :
    Grothe.haagR 7 = c7 := by
  exact coefficientGlue coefficientEq6 coefficientStep6

theorem coefficientEq8 :
    Grothe.haagR 8 = c8 := by
  exact coefficientGlue coefficientEq7 coefficientStep7

theorem coefficientEq9 :
    Grothe.haagR 9 = c9 := by
  exact coefficientGlue coefficientEq8 coefficientStep8

theorem coefficientEq10 :
    Grothe.haagR 10 = c10 := by
  exact coefficientGlue coefficientEq9 coefficientStep9

theorem coefficientEq11 :
    Grothe.haagR 11 = c11 := by
  exact coefficientGlue coefficientEq10 coefficientStep10

theorem coefficientEq12 :
    Grothe.haagR 12 = c12 := by
  exact coefficientGlue coefficientEq11 coefficientStep11

theorem coefficientEq13 :
    Grothe.haagR 13 = c13 := by
  exact coefficientGlue coefficientEq12 coefficientStep12

theorem coefficientEq14 :
    Grothe.haagR 14 = c14 := by
  exact coefficientGlue coefficientEq13 coefficientStep13

theorem coefficientEq15 :
    Grothe.haagR 15 = c15 := by
  exact coefficientGlue coefficientEq14 coefficientStep14

theorem coefficientEq16 :
    Grothe.haagR 16 = c16 := by
  exact coefficientGlue coefficientEq15 coefficientStep15

theorem coefficientEq17 :
    Grothe.haagR 17 = c17 := by
  exact coefficientGlue coefficientEq16 coefficientStep16

theorem coefficientEq18 :
    Grothe.haagR 18 = c18 := by
  exact coefficientGlue coefficientEq17 coefficientStep17

theorem coefficientEq19 :
    Grothe.haagR 19 = c19 := by
  exact coefficientGlue coefficientEq18 coefficientStep18

theorem coefficientEq20 :
    Grothe.haagR 20 = c20 := by
  exact coefficientGlue coefficientEq19 coefficientStep19

theorem coefficientEq21 :
    Grothe.haagR 21 = c21 := by
  exact coefficientGlue coefficientEq20 coefficientStep20

theorem coefficientEq22 :
    Grothe.haagR 22 = c22 := by
  exact coefficientGlue coefficientEq21 coefficientStep21

theorem coefficientEq23 :
    Grothe.haagR 23 = c23 := by
  exact coefficientGlue coefficientEq22 coefficientStep22

theorem coefficientEq24 :
    Grothe.haagR 24 = c24 := by
  exact coefficientGlue coefficientEq23 coefficientStep23

theorem coefficientEq25 :
    Grothe.haagR 25 = c25 := by
  exact coefficientGlue coefficientEq24 coefficientStep24

theorem coefficientEq26 :
    Grothe.haagR 26 = c26 := by
  exact coefficientGlue coefficientEq25 coefficientStep25

theorem coefficientEq27 :
    Grothe.haagR 27 = c27 := by
  exact coefficientGlue coefficientEq26 coefficientStep26

theorem coefficientEq28 :
    Grothe.haagR 28 = c28 := by
  exact coefficientGlue coefficientEq27 coefficientStep27

theorem coefficientEq29 :
    Grothe.haagR 29 = c29 := by
  exact coefficientGlue coefficientEq28 coefficientStep28

theorem coefficientEq30 :
    Grothe.haagR 30 = c30 := by
  exact coefficientGlue coefficientEq29 coefficientStep29

theorem coefficientEq31 :
    Grothe.haagR 31 = c31 := by
  exact coefficientGlue coefficientEq30 coefficientStep30

theorem coefficientEq32 :
    Grothe.haagR 32 = c32 := by
  exact coefficientGlue coefficientEq31 coefficientStep31

theorem coefficientEq33 :
    Grothe.haagR 33 = c33 := by
  exact coefficientGlue coefficientEq32 coefficientStep32

theorem coefficientEq34 :
    Grothe.haagR 34 = c34 := by
  exact coefficientGlue coefficientEq33 coefficientStep33

theorem coefficientEq35 :
    Grothe.haagR 35 = c35 := by
  exact coefficientGlue coefficientEq34 coefficientStep34

theorem coefficientEq36 :
    Grothe.haagR 36 = c36 := by
  exact coefficientGlue coefficientEq35 coefficientStep35

theorem coefficientEq37 :
    Grothe.haagR 37 = c37 := by
  exact coefficientGlue coefficientEq36 coefficientStep36

theorem coefficientEq38 :
    Grothe.haagR 38 = c38 := by
  exact coefficientGlue coefficientEq37 coefficientStep37

theorem coefficientEq39 :
    Grothe.haagR 39 = c39 := by
  exact coefficientGlue coefficientEq38 coefficientStep38

theorem coefficientEq40 :
    Grothe.haagR 40 = c40 := by
  exact coefficientGlue coefficientEq39 coefficientStep39

theorem coefficientEq41 :
    Grothe.haagR 41 = c41 := by
  exact coefficientGlue coefficientEq40 coefficientStep40

theorem coefficientEq42 :
    Grothe.haagR 42 = c42 := by
  exact coefficientGlue coefficientEq41 coefficientStep41

theorem coefficientEq43 :
    Grothe.haagR 43 = c43 := by
  exact coefficientGlue coefficientEq42 coefficientStep42

theorem coefficientEq44 :
    Grothe.haagR 44 = c44 := by
  exact coefficientGlue coefficientEq43 coefficientStep43

theorem coefficientEq45 :
    Grothe.haagR 45 = c45 := by
  exact coefficientGlue coefficientEq44 coefficientStep44

theorem coefficientEq46 :
    Grothe.haagR 46 = c46 := by
  exact coefficientGlue coefficientEq45 coefficientStep45

theorem coefficientEq47 :
    Grothe.haagR 47 = c47 := by
  exact coefficientGlue coefficientEq46 coefficientStep46

theorem coefficientEq48 :
    Grothe.haagR 48 = c48 := by
  exact coefficientGlue coefficientEq47 coefficientStep47

theorem coefficientEq49 :
    Grothe.haagR 49 = c49 := by
  exact coefficientGlue coefficientEq48 coefficientStep48

theorem coefficientEq50 :
    Grothe.haagR 50 = c50 := by
  exact coefficientGlue coefficientEq49 coefficientStep49

theorem coefficientEq51 :
    Grothe.haagR 51 = c51 := by
  exact coefficientGlue coefficientEq50 coefficientStep50

theorem coefficientEq52 :
    Grothe.haagR 52 = c52 := by
  exact coefficientGlue coefficientEq51 coefficientStep51

theorem coefficientEq53 :
    Grothe.haagR 53 = c53 := by
  exact coefficientGlue coefficientEq52 coefficientStep52

theorem coefficientEq54 :
    Grothe.haagR 54 = c54 := by
  exact coefficientGlue coefficientEq53 coefficientStep53

theorem coefficientEq55 :
    Grothe.haagR 55 = c55 := by
  exact coefficientGlue coefficientEq54 coefficientStep54

theorem coefficientEq56 :
    Grothe.haagR 56 = c56 := by
  exact coefficientGlue coefficientEq55 coefficientStep55

theorem coefficientEq57 :
    Grothe.haagR 57 = c57 := by
  exact coefficientGlue coefficientEq56 coefficientStep56

theorem coefficientEq58 :
    Grothe.haagR 58 = c58 := by
  exact coefficientGlue coefficientEq57 coefficientStep57

theorem coefficientEq59 :
    Grothe.haagR 59 = c59 := by
  exact coefficientGlue coefficientEq58 coefficientStep58

theorem coefficientEq60 :
    Grothe.haagR 60 = c60 := by
  exact coefficientGlue coefficientEq59 coefficientStep59

theorem coefficientEq61 :
    Grothe.haagR 61 = c61 := by
  exact coefficientGlue coefficientEq60 coefficientStep60

theorem coefficientEq62 :
    Grothe.haagR 62 = c62 := by
  exact coefficientGlue coefficientEq61 coefficientStep61

theorem coefficientEq63 :
    Grothe.haagR 63 = c63 := by
  exact coefficientGlue coefficientEq62 coefficientStep62

theorem coefficientEq64 :
    Grothe.haagR 64 = c64 := by
  exact coefficientGlue coefficientEq63 coefficientStep63

theorem coefficientEq65 :
    Grothe.haagR 65 = c65 := by
  exact coefficientGlue coefficientEq64 coefficientStep64

theorem coefficientEq66 :
    Grothe.haagR 66 = c66 := by
  exact coefficientGlue coefficientEq65 coefficientStep65

theorem coefficientEq67 :
    Grothe.haagR 67 = c67 := by
  exact coefficientGlue coefficientEq66 coefficientStep66

theorem coefficientEq68 :
    Grothe.haagR 68 = c68 := by
  exact coefficientGlue coefficientEq67 coefficientStep67

theorem coefficientEq69 :
    Grothe.haagR 69 = c69 := by
  exact coefficientGlue coefficientEq68 coefficientStep68

theorem coefficientEq70 :
    Grothe.haagR 70 = c70 := by
  exact coefficientGlue coefficientEq69 coefficientStep69

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 182: reached coefficient_bindings"
  out.flush

theorem weights_binding :
    haagList Grothe.HaagerupCanonical.start = weights0 := by
  change haagList 64 = weights0
  exact weights_core

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 183: reached weights_binding"
  out.flush

theorem differenceEq0_64 :
    iterDiff 0 Grothe.haagR 64 = d0_64 := by
  exact coefficientEq64

theorem differenceEq0_65 :
    iterDiff 0 Grothe.haagR 65 = d0_65 := by
  exact coefficientEq65

theorem differenceEq0_66 :
    iterDiff 0 Grothe.haagR 66 = d0_66 := by
  exact coefficientEq66

theorem differenceEq0_67 :
    iterDiff 0 Grothe.haagR 67 = d0_67 := by
  exact coefficientEq67

theorem differenceEq0_68 :
    iterDiff 0 Grothe.haagR 68 = d0_68 := by
  exact coefficientEq68

theorem differenceEq0_69 :
    iterDiff 0 Grothe.haagR 69 = d0_69 := by
  exact coefficientEq69

theorem differenceEq0_70 :
    iterDiff 0 Grothe.haagR 70 = d0_70 := by
  exact coefficientEq70

theorem differenceEq1_64 :
    iterDiff 1 Grothe.haagR 64 = d1_64 := by
  exact differenceGlue differenceEq0_64 differenceEq0_65 differenceStep1_64

theorem differenceEq1_65 :
    iterDiff 1 Grothe.haagR 65 = d1_65 := by
  exact differenceGlue differenceEq0_65 differenceEq0_66 differenceStep1_65

theorem differenceEq1_66 :
    iterDiff 1 Grothe.haagR 66 = d1_66 := by
  exact differenceGlue differenceEq0_66 differenceEq0_67 differenceStep1_66

theorem differenceEq1_67 :
    iterDiff 1 Grothe.haagR 67 = d1_67 := by
  exact differenceGlue differenceEq0_67 differenceEq0_68 differenceStep1_67

theorem differenceEq1_68 :
    iterDiff 1 Grothe.haagR 68 = d1_68 := by
  exact differenceGlue differenceEq0_68 differenceEq0_69 differenceStep1_68

theorem differenceEq1_69 :
    iterDiff 1 Grothe.haagR 69 = d1_69 := by
  exact differenceGlue differenceEq0_69 differenceEq0_70 differenceStep1_69

theorem differenceEq2_64 :
    iterDiff 2 Grothe.haagR 64 = d2_64 := by
  exact differenceGlue differenceEq1_64 differenceEq1_65 differenceStep2_64

theorem differenceEq2_65 :
    iterDiff 2 Grothe.haagR 65 = d2_65 := by
  exact differenceGlue differenceEq1_65 differenceEq1_66 differenceStep2_65

theorem differenceEq2_66 :
    iterDiff 2 Grothe.haagR 66 = d2_66 := by
  exact differenceGlue differenceEq1_66 differenceEq1_67 differenceStep2_66

theorem differenceEq2_67 :
    iterDiff 2 Grothe.haagR 67 = d2_67 := by
  exact differenceGlue differenceEq1_67 differenceEq1_68 differenceStep2_67

theorem differenceEq2_68 :
    iterDiff 2 Grothe.haagR 68 = d2_68 := by
  exact differenceGlue differenceEq1_68 differenceEq1_69 differenceStep2_68

theorem differenceEq3_64 :
    iterDiff 3 Grothe.haagR 64 = d3_64 := by
  exact differenceGlue differenceEq2_64 differenceEq2_65 differenceStep3_64

theorem differenceEq3_65 :
    iterDiff 3 Grothe.haagR 65 = d3_65 := by
  exact differenceGlue differenceEq2_65 differenceEq2_66 differenceStep3_65

theorem differenceEq3_66 :
    iterDiff 3 Grothe.haagR 66 = d3_66 := by
  exact differenceGlue differenceEq2_66 differenceEq2_67 differenceStep3_66

theorem differenceEq3_67 :
    iterDiff 3 Grothe.haagR 67 = d3_67 := by
  exact differenceGlue differenceEq2_67 differenceEq2_68 differenceStep3_67

theorem differenceEq4_64 :
    iterDiff 4 Grothe.haagR 64 = d4_64 := by
  exact differenceGlue differenceEq3_64 differenceEq3_65 differenceStep4_64

theorem differenceEq4_65 :
    iterDiff 4 Grothe.haagR 65 = d4_65 := by
  exact differenceGlue differenceEq3_65 differenceEq3_66 differenceStep4_65

theorem differenceEq4_66 :
    iterDiff 4 Grothe.haagR 66 = d4_66 := by
  exact differenceGlue differenceEq3_66 differenceEq3_67 differenceStep4_66

theorem differenceEq5_64 :
    iterDiff 5 Grothe.haagR 64 = d5_64 := by
  exact differenceGlue differenceEq4_64 differenceEq4_65 differenceStep5_64

theorem differenceEq5_65 :
    iterDiff 5 Grothe.haagR 65 = d5_65 := by
  exact differenceGlue differenceEq4_65 differenceEq4_66 differenceStep5_65

theorem differenceEq6_64 :
    iterDiff 6 Grothe.haagR 64 = d6_64 := by
  exact differenceGlue differenceEq5_64 differenceEq5_65 differenceStep6_64

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 184: reached difference_bindings"
  out.flush

theorem differences_binding :
    Grothe.HaagerupCanonical.differences = correctionWeights0 := by
  change [iterDiff 0 Grothe.haagR 64, iterDiff 1 Grothe.haagR 64, iterDiff 2 Grothe.haagR 64, iterDiff 3 Grothe.haagR 64, iterDiff 4 Grothe.haagR 64, iterDiff 5 Grothe.haagR 64] = correctionWeights0
  rw [differenceEq0_64, differenceEq1_64, differenceEq2_64, differenceEq3_64, differenceEq4_64, differenceEq5_64]
  rfl

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 185: reached differences_binding"
  out.flush

theorem pl_binding :
    Grothe.HaagerupPower.pl = plQ := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 186: reached pl_binding"
  out.flush

theorem rl_binding :
    Grothe.HaagerupPower.rl = rlQ := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 187: reached rl_binding"
  out.flush

theorem p_binding :
    Grothe.HaagerupPower.pl.map ofRatI = pI := by
  exact (congrArg (List.map ofRatI) pl_binding).trans p_interval_eq

theorem r_binding :
    Grothe.HaagerupPower.rl.map ofRatI = rI := by
  exact (congrArg (List.map ofRatI) rl_binding).trans r_interval_eq

theorem slope_binding :
    Grothe.HaagerupPower.slope = slopeQ := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 188: reached slope_binding"
  out.flush

theorem prefixCap_binding :
    Grothe.HaagerupCanonical.prefixCap = prefixCapQ := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 189: reached prefixCap_binding"
  out.flush

theorem seedCap_binding :
    Grothe.HaagerupPower.seedCap = seedCapQ := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 190: reached seedCap_binding"
  out.flush

theorem defectCap_binding :
    Grothe.HaagerupPower.defectCap = defectCapQ := by
  decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 191: reached defectCap_binding"
  out.flush

theorem completed_binding :
    completedHeadI Grothe.HaagerupCanonical.cutoff Grothe.HaagerupCanonical.start
      Grothe.HaagerupPower.pl Grothe.HaagerupPower.rl
      (haagList Grothe.HaagerupCanonical.start) Grothe.HaagerupCanonical.differences = completedI := by
  rw [weights_binding, differences_binding]
  change completedHeadI 170 64 Grothe.HaagerupPower.pl Grothe.HaagerupPower.rl
    weights0 correctionWeights0 = completedI
  simp only [completedHeadI, p_binding, r_binding, ratioA_step, ratioY_step,
    weights_take, correctionEq0, tail_step, headEq0, final_step]

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 192: reached completed_binding"
  out.flush

theorem seed_binding :
    convI (Grothe.HaagerupPower.rl.map ofRatI)
      (polyPowI (Grothe.HaagerupPower.pl.map ofRatI) Grothe.HaagerupPower.seedPower) = seedI := by
  simp only [p_binding, r_binding, Grothe.HaagerupPower.seedPower, powerEq17, seed_product_step]

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 193: reached seed_binding"
  out.flush

theorem defect_binding :
    resolventDefectI Grothe.HaagerupPower.pl Grothe.HaagerupPower.rl = defectI := by
  simp only [resolventDefectI, p_binding, r_binding, ratioA_step, inverseD_step,
    inverseProduct_step, defect_step]

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 194: reached defect_binding"
  out.flush

end Grothe.HaagerupCanonical.Trace
