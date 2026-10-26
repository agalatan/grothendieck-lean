import Grothe.Haagerup.CanonicalTrace.Numeric00
import Grothe.Haagerup.CanonicalTrace.Numeric01
import Grothe.Haagerup.CanonicalTrace.Numeric02
import Grothe.Haagerup.CanonicalTrace.Numeric03
import Grothe.Haagerup.CanonicalTrace.Numeric04
import Grothe.Haagerup.CanonicalTrace.Numeric05
import Grothe.Haagerup.CanonicalTrace.Numeric06
import Grothe.Haagerup.CanonicalTrace.Numeric07
import Grothe.Haagerup.CanonicalTrace.Numeric08
import Grothe.Haagerup.CanonicalTrace.Numeric09
import Grothe.Haagerup.CanonicalTrace.Numeric10
import Grothe.Haagerup.CanonicalTrace.Numeric11
import Grothe.Haagerup.CanonicalTrace.Numeric12
import Grothe.Haagerup.CanonicalTrace.Numeric13
import Grothe.Haagerup.CanonicalTrace.Numeric14
import Grothe.Haagerup.CanonicalTrace.Numeric15
import Lean.Elab.Command

/-!
Agent-ID: codex-aa04. Literal checkpoints for the canonical Haagerup bound.
Assemble the independent equalities using the defining recurrences.
Regenerate with tools/gen_haagerup_canonical_check.py.

Each arithmetic step is proved from literal inputs and assembled through
the defining recurrences. Progress identifiers are stable across parallel modules.
-/

set_option Elab.async false
set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace Grothe.HaagerupCanonical.Trace

open GrotheKernel

theorem auxiliaryEq64 :
    haagAux 0 64 c64 = weights64 := by
  rfl

theorem auxiliaryEq63 :
    haagAux 1 63 c63 = weights63 := by
  exact auxiliaryGlue coefficientStep63 auxiliaryEq64

theorem auxiliaryEq62 :
    haagAux 2 62 c62 = weights62 := by
  exact auxiliaryGlue coefficientStep62 auxiliaryEq63

theorem auxiliaryEq61 :
    haagAux 3 61 c61 = weights61 := by
  exact auxiliaryGlue coefficientStep61 auxiliaryEq62

theorem auxiliaryEq60 :
    haagAux 4 60 c60 = weights60 := by
  exact auxiliaryGlue coefficientStep60 auxiliaryEq61

theorem auxiliaryEq59 :
    haagAux 5 59 c59 = weights59 := by
  exact auxiliaryGlue coefficientStep59 auxiliaryEq60

theorem auxiliaryEq58 :
    haagAux 6 58 c58 = weights58 := by
  exact auxiliaryGlue coefficientStep58 auxiliaryEq59

theorem auxiliaryEq57 :
    haagAux 7 57 c57 = weights57 := by
  exact auxiliaryGlue coefficientStep57 auxiliaryEq58

theorem auxiliaryEq56 :
    haagAux 8 56 c56 = weights56 := by
  exact auxiliaryGlue coefficientStep56 auxiliaryEq57

theorem auxiliaryEq55 :
    haagAux 9 55 c55 = weights55 := by
  exact auxiliaryGlue coefficientStep55 auxiliaryEq56

theorem auxiliaryEq54 :
    haagAux 10 54 c54 = weights54 := by
  exact auxiliaryGlue coefficientStep54 auxiliaryEq55

theorem auxiliaryEq53 :
    haagAux 11 53 c53 = weights53 := by
  exact auxiliaryGlue coefficientStep53 auxiliaryEq54

theorem auxiliaryEq52 :
    haagAux 12 52 c52 = weights52 := by
  exact auxiliaryGlue coefficientStep52 auxiliaryEq53

theorem auxiliaryEq51 :
    haagAux 13 51 c51 = weights51 := by
  exact auxiliaryGlue coefficientStep51 auxiliaryEq52

theorem auxiliaryEq50 :
    haagAux 14 50 c50 = weights50 := by
  exact auxiliaryGlue coefficientStep50 auxiliaryEq51

theorem auxiliaryEq49 :
    haagAux 15 49 c49 = weights49 := by
  exact auxiliaryGlue coefficientStep49 auxiliaryEq50

theorem auxiliaryEq48 :
    haagAux 16 48 c48 = weights48 := by
  exact auxiliaryGlue coefficientStep48 auxiliaryEq49

theorem auxiliaryEq47 :
    haagAux 17 47 c47 = weights47 := by
  exact auxiliaryGlue coefficientStep47 auxiliaryEq48

theorem auxiliaryEq46 :
    haagAux 18 46 c46 = weights46 := by
  exact auxiliaryGlue coefficientStep46 auxiliaryEq47

theorem auxiliaryEq45 :
    haagAux 19 45 c45 = weights45 := by
  exact auxiliaryGlue coefficientStep45 auxiliaryEq46

theorem auxiliaryEq44 :
    haagAux 20 44 c44 = weights44 := by
  exact auxiliaryGlue coefficientStep44 auxiliaryEq45

theorem auxiliaryEq43 :
    haagAux 21 43 c43 = weights43 := by
  exact auxiliaryGlue coefficientStep43 auxiliaryEq44

theorem auxiliaryEq42 :
    haagAux 22 42 c42 = weights42 := by
  exact auxiliaryGlue coefficientStep42 auxiliaryEq43

theorem auxiliaryEq41 :
    haagAux 23 41 c41 = weights41 := by
  exact auxiliaryGlue coefficientStep41 auxiliaryEq42

theorem auxiliaryEq40 :
    haagAux 24 40 c40 = weights40 := by
  exact auxiliaryGlue coefficientStep40 auxiliaryEq41

theorem auxiliaryEq39 :
    haagAux 25 39 c39 = weights39 := by
  exact auxiliaryGlue coefficientStep39 auxiliaryEq40

theorem auxiliaryEq38 :
    haagAux 26 38 c38 = weights38 := by
  exact auxiliaryGlue coefficientStep38 auxiliaryEq39

theorem auxiliaryEq37 :
    haagAux 27 37 c37 = weights37 := by
  exact auxiliaryGlue coefficientStep37 auxiliaryEq38

theorem auxiliaryEq36 :
    haagAux 28 36 c36 = weights36 := by
  exact auxiliaryGlue coefficientStep36 auxiliaryEq37

theorem auxiliaryEq35 :
    haagAux 29 35 c35 = weights35 := by
  exact auxiliaryGlue coefficientStep35 auxiliaryEq36

theorem auxiliaryEq34 :
    haagAux 30 34 c34 = weights34 := by
  exact auxiliaryGlue coefficientStep34 auxiliaryEq35

theorem auxiliaryEq33 :
    haagAux 31 33 c33 = weights33 := by
  exact auxiliaryGlue coefficientStep33 auxiliaryEq34

theorem auxiliaryEq32 :
    haagAux 32 32 c32 = weights32 := by
  exact auxiliaryGlue coefficientStep32 auxiliaryEq33

theorem auxiliaryEq31 :
    haagAux 33 31 c31 = weights31 := by
  exact auxiliaryGlue coefficientStep31 auxiliaryEq32

theorem auxiliaryEq30 :
    haagAux 34 30 c30 = weights30 := by
  exact auxiliaryGlue coefficientStep30 auxiliaryEq31

theorem auxiliaryEq29 :
    haagAux 35 29 c29 = weights29 := by
  exact auxiliaryGlue coefficientStep29 auxiliaryEq30

theorem auxiliaryEq28 :
    haagAux 36 28 c28 = weights28 := by
  exact auxiliaryGlue coefficientStep28 auxiliaryEq29

theorem auxiliaryEq27 :
    haagAux 37 27 c27 = weights27 := by
  exact auxiliaryGlue coefficientStep27 auxiliaryEq28

theorem auxiliaryEq26 :
    haagAux 38 26 c26 = weights26 := by
  exact auxiliaryGlue coefficientStep26 auxiliaryEq27

theorem auxiliaryEq25 :
    haagAux 39 25 c25 = weights25 := by
  exact auxiliaryGlue coefficientStep25 auxiliaryEq26

theorem auxiliaryEq24 :
    haagAux 40 24 c24 = weights24 := by
  exact auxiliaryGlue coefficientStep24 auxiliaryEq25

theorem auxiliaryEq23 :
    haagAux 41 23 c23 = weights23 := by
  exact auxiliaryGlue coefficientStep23 auxiliaryEq24

theorem auxiliaryEq22 :
    haagAux 42 22 c22 = weights22 := by
  exact auxiliaryGlue coefficientStep22 auxiliaryEq23

theorem auxiliaryEq21 :
    haagAux 43 21 c21 = weights21 := by
  exact auxiliaryGlue coefficientStep21 auxiliaryEq22

theorem auxiliaryEq20 :
    haagAux 44 20 c20 = weights20 := by
  exact auxiliaryGlue coefficientStep20 auxiliaryEq21

theorem auxiliaryEq19 :
    haagAux 45 19 c19 = weights19 := by
  exact auxiliaryGlue coefficientStep19 auxiliaryEq20

theorem auxiliaryEq18 :
    haagAux 46 18 c18 = weights18 := by
  exact auxiliaryGlue coefficientStep18 auxiliaryEq19

theorem auxiliaryEq17 :
    haagAux 47 17 c17 = weights17 := by
  exact auxiliaryGlue coefficientStep17 auxiliaryEq18

theorem auxiliaryEq16 :
    haagAux 48 16 c16 = weights16 := by
  exact auxiliaryGlue coefficientStep16 auxiliaryEq17

theorem auxiliaryEq15 :
    haagAux 49 15 c15 = weights15 := by
  exact auxiliaryGlue coefficientStep15 auxiliaryEq16

theorem auxiliaryEq14 :
    haagAux 50 14 c14 = weights14 := by
  exact auxiliaryGlue coefficientStep14 auxiliaryEq15

theorem auxiliaryEq13 :
    haagAux 51 13 c13 = weights13 := by
  exact auxiliaryGlue coefficientStep13 auxiliaryEq14

theorem auxiliaryEq12 :
    haagAux 52 12 c12 = weights12 := by
  exact auxiliaryGlue coefficientStep12 auxiliaryEq13

theorem auxiliaryEq11 :
    haagAux 53 11 c11 = weights11 := by
  exact auxiliaryGlue coefficientStep11 auxiliaryEq12

theorem auxiliaryEq10 :
    haagAux 54 10 c10 = weights10 := by
  exact auxiliaryGlue coefficientStep10 auxiliaryEq11

theorem auxiliaryEq9 :
    haagAux 55 9 c9 = weights9 := by
  exact auxiliaryGlue coefficientStep9 auxiliaryEq10

theorem auxiliaryEq8 :
    haagAux 56 8 c8 = weights8 := by
  exact auxiliaryGlue coefficientStep8 auxiliaryEq9

theorem auxiliaryEq7 :
    haagAux 57 7 c7 = weights7 := by
  exact auxiliaryGlue coefficientStep7 auxiliaryEq8

theorem auxiliaryEq6 :
    haagAux 58 6 c6 = weights6 := by
  exact auxiliaryGlue coefficientStep6 auxiliaryEq7

theorem auxiliaryEq5 :
    haagAux 59 5 c5 = weights5 := by
  exact auxiliaryGlue coefficientStep5 auxiliaryEq6

theorem auxiliaryEq4 :
    haagAux 60 4 c4 = weights4 := by
  exact auxiliaryGlue coefficientStep4 auxiliaryEq5

theorem auxiliaryEq3 :
    haagAux 61 3 c3 = weights3 := by
  exact auxiliaryGlue coefficientStep3 auxiliaryEq4

theorem auxiliaryEq2 :
    haagAux 62 2 c2 = weights2 := by
  exact auxiliaryGlue coefficientStep2 auxiliaryEq3

theorem auxiliaryEq1 :
    haagAux 63 1 c1 = weights1 := by
  exact auxiliaryGlue coefficientStep1 auxiliaryEq2

theorem auxiliaryEq0 :
    haagAux 64 0 c0 = weights0 := by
  exact auxiliaryGlue coefficientStep0 auxiliaryEq1

theorem weights_core :
    haagList 64 = weights0 := by
  change haagAux 64 0 1 = weights0
  exact (congrArg (haagAux 64 0) one_eq_c0).trans auxiliaryEq0

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 72: reached weights_core"
  out.flush

theorem weights_take :
    weights0.take 64 = weights0 := by
  rfl

theorem correctionEq6 :
    hornerI 170 ratioY correctionWeights6 = correction6 := by
  rfl

theorem correctionEq5 :
    hornerI 170 ratioY correctionWeights5 = correction5 := by
  exact correctionGlue correctionEq6 correctionStep5

theorem correctionStep4_conv_suffixEq19 :
    convI correctionStep4_conv_suffix19 correction5 = correctionStep4_conv_result19 := by
  rfl

theorem correctionStep4_conv_suffixEq18 :
    convI correctionStep4_conv_suffix18 correction5 = correctionStep4_conv_result18 := by
  exact convBlockGlue correctionStep4_conv_suffixEq19 correctionStep4_conv_blockStep18

theorem correctionStep4_conv_suffixEq17 :
    convI correctionStep4_conv_suffix17 correction5 = correctionStep4_conv_result17 := by
  exact convBlockGlue correctionStep4_conv_suffixEq18 correctionStep4_conv_blockStep17

theorem correctionStep4_conv_suffixEq16 :
    convI correctionStep4_conv_suffix16 correction5 = correctionStep4_conv_result16 := by
  exact convBlockGlue correctionStep4_conv_suffixEq17 correctionStep4_conv_blockStep16

theorem correctionStep4_conv_suffixEq15 :
    convI correctionStep4_conv_suffix15 correction5 = correctionStep4_conv_result15 := by
  exact convBlockGlue correctionStep4_conv_suffixEq16 correctionStep4_conv_blockStep15

theorem correctionStep4_conv_suffixEq14 :
    convI correctionStep4_conv_suffix14 correction5 = correctionStep4_conv_result14 := by
  exact convBlockGlue correctionStep4_conv_suffixEq15 correctionStep4_conv_blockStep14

theorem correctionStep4_conv_suffixEq13 :
    convI correctionStep4_conv_suffix13 correction5 = correctionStep4_conv_result13 := by
  exact convBlockGlue correctionStep4_conv_suffixEq14 correctionStep4_conv_blockStep13

theorem correctionStep4_conv_suffixEq12 :
    convI correctionStep4_conv_suffix12 correction5 = correctionStep4_conv_result12 := by
  exact convBlockGlue correctionStep4_conv_suffixEq13 correctionStep4_conv_blockStep12

theorem correctionStep4_conv_suffixEq11 :
    convI correctionStep4_conv_suffix11 correction5 = correctionStep4_conv_result11 := by
  exact convBlockGlue correctionStep4_conv_suffixEq12 correctionStep4_conv_blockStep11

theorem correctionStep4_conv_suffixEq10 :
    convI correctionStep4_conv_suffix10 correction5 = correctionStep4_conv_result10 := by
  exact convBlockGlue correctionStep4_conv_suffixEq11 correctionStep4_conv_blockStep10

theorem correctionStep4_conv_suffixEq9 :
    convI correctionStep4_conv_suffix9 correction5 = correctionStep4_conv_result9 := by
  exact convBlockGlue correctionStep4_conv_suffixEq10 correctionStep4_conv_blockStep9

theorem correctionStep4_conv_suffixEq8 :
    convI correctionStep4_conv_suffix8 correction5 = correctionStep4_conv_result8 := by
  exact convBlockGlue correctionStep4_conv_suffixEq9 correctionStep4_conv_blockStep8

theorem correctionStep4_conv_suffixEq7 :
    convI correctionStep4_conv_suffix7 correction5 = correctionStep4_conv_result7 := by
  exact convBlockGlue correctionStep4_conv_suffixEq8 correctionStep4_conv_blockStep7

theorem correctionStep4_conv_suffixEq6 :
    convI correctionStep4_conv_suffix6 correction5 = correctionStep4_conv_result6 := by
  exact convBlockGlue correctionStep4_conv_suffixEq7 correctionStep4_conv_blockStep6

theorem correctionStep4_conv_suffixEq5 :
    convI correctionStep4_conv_suffix5 correction5 = correctionStep4_conv_result5 := by
  exact convBlockGlue correctionStep4_conv_suffixEq6 correctionStep4_conv_blockStep5

theorem correctionStep4_conv_suffixEq4 :
    convI correctionStep4_conv_suffix4 correction5 = correctionStep4_conv_result4 := by
  exact convBlockGlue correctionStep4_conv_suffixEq5 correctionStep4_conv_blockStep4

theorem correctionStep4_conv_suffixEq3 :
    convI correctionStep4_conv_suffix3 correction5 = correctionStep4_conv_result3 := by
  exact convBlockGlue correctionStep4_conv_suffixEq4 correctionStep4_conv_blockStep3

theorem correctionStep4_conv_suffixEq2 :
    convI correctionStep4_conv_suffix2 correction5 = correctionStep4_conv_result2 := by
  exact convBlockGlue correctionStep4_conv_suffixEq3 correctionStep4_conv_blockStep2

theorem correctionStep4_conv_suffixEq1 :
    convI correctionStep4_conv_suffix1 correction5 = correctionStep4_conv_result1 := by
  exact convBlockGlue correctionStep4_conv_suffixEq2 correctionStep4_conv_blockStep1

theorem correctionStep4_conv_suffixEq0 :
    convI correctionStep4_conv_suffix0 correction5 = correctionStep4_conv_result0 := by
  exact convBlockGlue correctionStep4_conv_suffixEq1 correctionStep4_conv_blockStep0

theorem correctionStep4_conv_eq :
    convI ratioY correction5 = correctionStep4_conv_result0 := by
  exact (congrArg (fun left => convI left correction5) correctionStep4_conv_input).trans correctionStep4_conv_suffixEq0

theorem correctionStep4 :
    (addL [ofRatI d4_64] (convI ratioY correction5)).take 170 = correction4 := by
  rw [correctionStep4_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 85: reached correctionStep4"
  out.flush

theorem correctionEq4 :
    hornerI 170 ratioY correctionWeights4 = correction4 := by
  exact correctionGlue correctionEq5 correctionStep4

theorem correctionStep3_conv_suffixEq19 :
    convI correctionStep3_conv_suffix19 correction4 = correctionStep3_conv_result19 := by
  rfl

theorem correctionStep3_conv_suffixEq18 :
    convI correctionStep3_conv_suffix18 correction4 = correctionStep3_conv_result18 := by
  exact convBlockGlue correctionStep3_conv_suffixEq19 correctionStep3_conv_blockStep18

theorem correctionStep3_conv_suffixEq17 :
    convI correctionStep3_conv_suffix17 correction4 = correctionStep3_conv_result17 := by
  exact convBlockGlue correctionStep3_conv_suffixEq18 correctionStep3_conv_blockStep17

theorem correctionStep3_conv_suffixEq16 :
    convI correctionStep3_conv_suffix16 correction4 = correctionStep3_conv_result16 := by
  exact convBlockGlue correctionStep3_conv_suffixEq17 correctionStep3_conv_blockStep16

theorem correctionStep3_conv_suffixEq15 :
    convI correctionStep3_conv_suffix15 correction4 = correctionStep3_conv_result15 := by
  exact convBlockGlue correctionStep3_conv_suffixEq16 correctionStep3_conv_blockStep15

theorem correctionStep3_conv_suffixEq14 :
    convI correctionStep3_conv_suffix14 correction4 = correctionStep3_conv_result14 := by
  exact convBlockGlue correctionStep3_conv_suffixEq15 correctionStep3_conv_blockStep14

theorem correctionStep3_conv_suffixEq13 :
    convI correctionStep3_conv_suffix13 correction4 = correctionStep3_conv_result13 := by
  exact convBlockGlue correctionStep3_conv_suffixEq14 correctionStep3_conv_blockStep13

theorem correctionStep3_conv_suffixEq12 :
    convI correctionStep3_conv_suffix12 correction4 = correctionStep3_conv_result12 := by
  exact convBlockGlue correctionStep3_conv_suffixEq13 correctionStep3_conv_blockStep12

theorem correctionStep3_conv_suffixEq11 :
    convI correctionStep3_conv_suffix11 correction4 = correctionStep3_conv_result11 := by
  exact convBlockGlue correctionStep3_conv_suffixEq12 correctionStep3_conv_blockStep11

theorem correctionStep3_conv_suffixEq10 :
    convI correctionStep3_conv_suffix10 correction4 = correctionStep3_conv_result10 := by
  exact convBlockGlue correctionStep3_conv_suffixEq11 correctionStep3_conv_blockStep10

theorem correctionStep3_conv_suffixEq9 :
    convI correctionStep3_conv_suffix9 correction4 = correctionStep3_conv_result9 := by
  exact convBlockGlue correctionStep3_conv_suffixEq10 correctionStep3_conv_blockStep9

theorem correctionStep3_conv_suffixEq8 :
    convI correctionStep3_conv_suffix8 correction4 = correctionStep3_conv_result8 := by
  exact convBlockGlue correctionStep3_conv_suffixEq9 correctionStep3_conv_blockStep8

theorem correctionStep3_conv_suffixEq7 :
    convI correctionStep3_conv_suffix7 correction4 = correctionStep3_conv_result7 := by
  exact convBlockGlue correctionStep3_conv_suffixEq8 correctionStep3_conv_blockStep7

theorem correctionStep3_conv_suffixEq6 :
    convI correctionStep3_conv_suffix6 correction4 = correctionStep3_conv_result6 := by
  exact convBlockGlue correctionStep3_conv_suffixEq7 correctionStep3_conv_blockStep6

theorem correctionStep3_conv_suffixEq5 :
    convI correctionStep3_conv_suffix5 correction4 = correctionStep3_conv_result5 := by
  exact convBlockGlue correctionStep3_conv_suffixEq6 correctionStep3_conv_blockStep5

theorem correctionStep3_conv_suffixEq4 :
    convI correctionStep3_conv_suffix4 correction4 = correctionStep3_conv_result4 := by
  exact convBlockGlue correctionStep3_conv_suffixEq5 correctionStep3_conv_blockStep4

theorem correctionStep3_conv_suffixEq3 :
    convI correctionStep3_conv_suffix3 correction4 = correctionStep3_conv_result3 := by
  exact convBlockGlue correctionStep3_conv_suffixEq4 correctionStep3_conv_blockStep3

theorem correctionStep3_conv_suffixEq2 :
    convI correctionStep3_conv_suffix2 correction4 = correctionStep3_conv_result2 := by
  exact convBlockGlue correctionStep3_conv_suffixEq3 correctionStep3_conv_blockStep2

theorem correctionStep3_conv_suffixEq1 :
    convI correctionStep3_conv_suffix1 correction4 = correctionStep3_conv_result1 := by
  exact convBlockGlue correctionStep3_conv_suffixEq2 correctionStep3_conv_blockStep1

theorem correctionStep3_conv_suffixEq0 :
    convI correctionStep3_conv_suffix0 correction4 = correctionStep3_conv_result0 := by
  exact convBlockGlue correctionStep3_conv_suffixEq1 correctionStep3_conv_blockStep0

theorem correctionStep3_conv_eq :
    convI ratioY correction4 = correctionStep3_conv_result0 := by
  exact (congrArg (fun left => convI left correction4) correctionStep3_conv_input).trans correctionStep3_conv_suffixEq0

theorem correctionStep3 :
    (addL [ofRatI d3_64] (convI ratioY correction4)).take 170 = correction3 := by
  rw [correctionStep3_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 86: reached correctionStep3"
  out.flush

theorem correctionEq3 :
    hornerI 170 ratioY correctionWeights3 = correction3 := by
  exact correctionGlue correctionEq4 correctionStep3

theorem correctionStep2_conv_suffixEq19 :
    convI correctionStep2_conv_suffix19 correction3 = correctionStep2_conv_result19 := by
  rfl

theorem correctionStep2_conv_suffixEq18 :
    convI correctionStep2_conv_suffix18 correction3 = correctionStep2_conv_result18 := by
  exact convBlockGlue correctionStep2_conv_suffixEq19 correctionStep2_conv_blockStep18

theorem correctionStep2_conv_suffixEq17 :
    convI correctionStep2_conv_suffix17 correction3 = correctionStep2_conv_result17 := by
  exact convBlockGlue correctionStep2_conv_suffixEq18 correctionStep2_conv_blockStep17

theorem correctionStep2_conv_suffixEq16 :
    convI correctionStep2_conv_suffix16 correction3 = correctionStep2_conv_result16 := by
  exact convBlockGlue correctionStep2_conv_suffixEq17 correctionStep2_conv_blockStep16

theorem correctionStep2_conv_suffixEq15 :
    convI correctionStep2_conv_suffix15 correction3 = correctionStep2_conv_result15 := by
  exact convBlockGlue correctionStep2_conv_suffixEq16 correctionStep2_conv_blockStep15

theorem correctionStep2_conv_suffixEq14 :
    convI correctionStep2_conv_suffix14 correction3 = correctionStep2_conv_result14 := by
  exact convBlockGlue correctionStep2_conv_suffixEq15 correctionStep2_conv_blockStep14

theorem correctionStep2_conv_suffixEq13 :
    convI correctionStep2_conv_suffix13 correction3 = correctionStep2_conv_result13 := by
  exact convBlockGlue correctionStep2_conv_suffixEq14 correctionStep2_conv_blockStep13

theorem correctionStep2_conv_suffixEq12 :
    convI correctionStep2_conv_suffix12 correction3 = correctionStep2_conv_result12 := by
  exact convBlockGlue correctionStep2_conv_suffixEq13 correctionStep2_conv_blockStep12

theorem correctionStep2_conv_suffixEq11 :
    convI correctionStep2_conv_suffix11 correction3 = correctionStep2_conv_result11 := by
  exact convBlockGlue correctionStep2_conv_suffixEq12 correctionStep2_conv_blockStep11

theorem correctionStep2_conv_suffixEq10 :
    convI correctionStep2_conv_suffix10 correction3 = correctionStep2_conv_result10 := by
  exact convBlockGlue correctionStep2_conv_suffixEq11 correctionStep2_conv_blockStep10

theorem correctionStep2_conv_suffixEq9 :
    convI correctionStep2_conv_suffix9 correction3 = correctionStep2_conv_result9 := by
  exact convBlockGlue correctionStep2_conv_suffixEq10 correctionStep2_conv_blockStep9

theorem correctionStep2_conv_suffixEq8 :
    convI correctionStep2_conv_suffix8 correction3 = correctionStep2_conv_result8 := by
  exact convBlockGlue correctionStep2_conv_suffixEq9 correctionStep2_conv_blockStep8

theorem correctionStep2_conv_suffixEq7 :
    convI correctionStep2_conv_suffix7 correction3 = correctionStep2_conv_result7 := by
  exact convBlockGlue correctionStep2_conv_suffixEq8 correctionStep2_conv_blockStep7

theorem correctionStep2_conv_suffixEq6 :
    convI correctionStep2_conv_suffix6 correction3 = correctionStep2_conv_result6 := by
  exact convBlockGlue correctionStep2_conv_suffixEq7 correctionStep2_conv_blockStep6

theorem correctionStep2_conv_suffixEq5 :
    convI correctionStep2_conv_suffix5 correction3 = correctionStep2_conv_result5 := by
  exact convBlockGlue correctionStep2_conv_suffixEq6 correctionStep2_conv_blockStep5

theorem correctionStep2_conv_suffixEq4 :
    convI correctionStep2_conv_suffix4 correction3 = correctionStep2_conv_result4 := by
  exact convBlockGlue correctionStep2_conv_suffixEq5 correctionStep2_conv_blockStep4

theorem correctionStep2_conv_suffixEq3 :
    convI correctionStep2_conv_suffix3 correction3 = correctionStep2_conv_result3 := by
  exact convBlockGlue correctionStep2_conv_suffixEq4 correctionStep2_conv_blockStep3

theorem correctionStep2_conv_suffixEq2 :
    convI correctionStep2_conv_suffix2 correction3 = correctionStep2_conv_result2 := by
  exact convBlockGlue correctionStep2_conv_suffixEq3 correctionStep2_conv_blockStep2

theorem correctionStep2_conv_suffixEq1 :
    convI correctionStep2_conv_suffix1 correction3 = correctionStep2_conv_result1 := by
  exact convBlockGlue correctionStep2_conv_suffixEq2 correctionStep2_conv_blockStep1

theorem correctionStep2_conv_suffixEq0 :
    convI correctionStep2_conv_suffix0 correction3 = correctionStep2_conv_result0 := by
  exact convBlockGlue correctionStep2_conv_suffixEq1 correctionStep2_conv_blockStep0

theorem correctionStep2_conv_eq :
    convI ratioY correction3 = correctionStep2_conv_result0 := by
  exact (congrArg (fun left => convI left correction3) correctionStep2_conv_input).trans correctionStep2_conv_suffixEq0

theorem correctionStep2 :
    (addL [ofRatI d2_64] (convI ratioY correction3)).take 170 = correction2 := by
  rw [correctionStep2_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 87: reached correctionStep2"
  out.flush

theorem correctionEq2 :
    hornerI 170 ratioY correctionWeights2 = correction2 := by
  exact correctionGlue correctionEq3 correctionStep2

theorem correctionStep1_conv_suffixEq19 :
    convI correctionStep1_conv_suffix19 correction2 = correctionStep1_conv_result19 := by
  rfl

theorem correctionStep1_conv_suffixEq18 :
    convI correctionStep1_conv_suffix18 correction2 = correctionStep1_conv_result18 := by
  exact convBlockGlue correctionStep1_conv_suffixEq19 correctionStep1_conv_blockStep18

theorem correctionStep1_conv_suffixEq17 :
    convI correctionStep1_conv_suffix17 correction2 = correctionStep1_conv_result17 := by
  exact convBlockGlue correctionStep1_conv_suffixEq18 correctionStep1_conv_blockStep17

theorem correctionStep1_conv_suffixEq16 :
    convI correctionStep1_conv_suffix16 correction2 = correctionStep1_conv_result16 := by
  exact convBlockGlue correctionStep1_conv_suffixEq17 correctionStep1_conv_blockStep16

theorem correctionStep1_conv_suffixEq15 :
    convI correctionStep1_conv_suffix15 correction2 = correctionStep1_conv_result15 := by
  exact convBlockGlue correctionStep1_conv_suffixEq16 correctionStep1_conv_blockStep15

theorem correctionStep1_conv_suffixEq14 :
    convI correctionStep1_conv_suffix14 correction2 = correctionStep1_conv_result14 := by
  exact convBlockGlue correctionStep1_conv_suffixEq15 correctionStep1_conv_blockStep14

theorem correctionStep1_conv_suffixEq13 :
    convI correctionStep1_conv_suffix13 correction2 = correctionStep1_conv_result13 := by
  exact convBlockGlue correctionStep1_conv_suffixEq14 correctionStep1_conv_blockStep13

theorem correctionStep1_conv_suffixEq12 :
    convI correctionStep1_conv_suffix12 correction2 = correctionStep1_conv_result12 := by
  exact convBlockGlue correctionStep1_conv_suffixEq13 correctionStep1_conv_blockStep12

theorem correctionStep1_conv_suffixEq11 :
    convI correctionStep1_conv_suffix11 correction2 = correctionStep1_conv_result11 := by
  exact convBlockGlue correctionStep1_conv_suffixEq12 correctionStep1_conv_blockStep11

theorem correctionStep1_conv_suffixEq10 :
    convI correctionStep1_conv_suffix10 correction2 = correctionStep1_conv_result10 := by
  exact convBlockGlue correctionStep1_conv_suffixEq11 correctionStep1_conv_blockStep10

theorem correctionStep1_conv_suffixEq9 :
    convI correctionStep1_conv_suffix9 correction2 = correctionStep1_conv_result9 := by
  exact convBlockGlue correctionStep1_conv_suffixEq10 correctionStep1_conv_blockStep9

theorem correctionStep1_conv_suffixEq8 :
    convI correctionStep1_conv_suffix8 correction2 = correctionStep1_conv_result8 := by
  exact convBlockGlue correctionStep1_conv_suffixEq9 correctionStep1_conv_blockStep8

theorem correctionStep1_conv_suffixEq7 :
    convI correctionStep1_conv_suffix7 correction2 = correctionStep1_conv_result7 := by
  exact convBlockGlue correctionStep1_conv_suffixEq8 correctionStep1_conv_blockStep7

theorem correctionStep1_conv_suffixEq6 :
    convI correctionStep1_conv_suffix6 correction2 = correctionStep1_conv_result6 := by
  exact convBlockGlue correctionStep1_conv_suffixEq7 correctionStep1_conv_blockStep6

theorem correctionStep1_conv_suffixEq5 :
    convI correctionStep1_conv_suffix5 correction2 = correctionStep1_conv_result5 := by
  exact convBlockGlue correctionStep1_conv_suffixEq6 correctionStep1_conv_blockStep5

theorem correctionStep1_conv_suffixEq4 :
    convI correctionStep1_conv_suffix4 correction2 = correctionStep1_conv_result4 := by
  exact convBlockGlue correctionStep1_conv_suffixEq5 correctionStep1_conv_blockStep4

theorem correctionStep1_conv_suffixEq3 :
    convI correctionStep1_conv_suffix3 correction2 = correctionStep1_conv_result3 := by
  exact convBlockGlue correctionStep1_conv_suffixEq4 correctionStep1_conv_blockStep3

theorem correctionStep1_conv_suffixEq2 :
    convI correctionStep1_conv_suffix2 correction2 = correctionStep1_conv_result2 := by
  exact convBlockGlue correctionStep1_conv_suffixEq3 correctionStep1_conv_blockStep2

theorem correctionStep1_conv_suffixEq1 :
    convI correctionStep1_conv_suffix1 correction2 = correctionStep1_conv_result1 := by
  exact convBlockGlue correctionStep1_conv_suffixEq2 correctionStep1_conv_blockStep1

theorem correctionStep1_conv_suffixEq0 :
    convI correctionStep1_conv_suffix0 correction2 = correctionStep1_conv_result0 := by
  exact convBlockGlue correctionStep1_conv_suffixEq1 correctionStep1_conv_blockStep0

theorem correctionStep1_conv_eq :
    convI ratioY correction2 = correctionStep1_conv_result0 := by
  exact (congrArg (fun left => convI left correction2) correctionStep1_conv_input).trans correctionStep1_conv_suffixEq0

theorem correctionStep1 :
    (addL [ofRatI d1_64] (convI ratioY correction2)).take 170 = correction1 := by
  rw [correctionStep1_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 88: reached correctionStep1"
  out.flush

theorem correctionEq1 :
    hornerI 170 ratioY correctionWeights1 = correction1 := by
  exact correctionGlue correctionEq2 correctionStep1

theorem correctionStep0_conv_suffixEq19 :
    convI correctionStep0_conv_suffix19 correction1 = correctionStep0_conv_result19 := by
  rfl

theorem correctionStep0_conv_suffixEq18 :
    convI correctionStep0_conv_suffix18 correction1 = correctionStep0_conv_result18 := by
  exact convBlockGlue correctionStep0_conv_suffixEq19 correctionStep0_conv_blockStep18

theorem correctionStep0_conv_suffixEq17 :
    convI correctionStep0_conv_suffix17 correction1 = correctionStep0_conv_result17 := by
  exact convBlockGlue correctionStep0_conv_suffixEq18 correctionStep0_conv_blockStep17

theorem correctionStep0_conv_suffixEq16 :
    convI correctionStep0_conv_suffix16 correction1 = correctionStep0_conv_result16 := by
  exact convBlockGlue correctionStep0_conv_suffixEq17 correctionStep0_conv_blockStep16

theorem correctionStep0_conv_suffixEq15 :
    convI correctionStep0_conv_suffix15 correction1 = correctionStep0_conv_result15 := by
  exact convBlockGlue correctionStep0_conv_suffixEq16 correctionStep0_conv_blockStep15

theorem correctionStep0_conv_suffixEq14 :
    convI correctionStep0_conv_suffix14 correction1 = correctionStep0_conv_result14 := by
  exact convBlockGlue correctionStep0_conv_suffixEq15 correctionStep0_conv_blockStep14

theorem correctionStep0_conv_suffixEq13 :
    convI correctionStep0_conv_suffix13 correction1 = correctionStep0_conv_result13 := by
  exact convBlockGlue correctionStep0_conv_suffixEq14 correctionStep0_conv_blockStep13

theorem correctionStep0_conv_suffixEq12 :
    convI correctionStep0_conv_suffix12 correction1 = correctionStep0_conv_result12 := by
  exact convBlockGlue correctionStep0_conv_suffixEq13 correctionStep0_conv_blockStep12

theorem correctionStep0_conv_suffixEq11 :
    convI correctionStep0_conv_suffix11 correction1 = correctionStep0_conv_result11 := by
  exact convBlockGlue correctionStep0_conv_suffixEq12 correctionStep0_conv_blockStep11

theorem correctionStep0_conv_suffixEq10 :
    convI correctionStep0_conv_suffix10 correction1 = correctionStep0_conv_result10 := by
  exact convBlockGlue correctionStep0_conv_suffixEq11 correctionStep0_conv_blockStep10

theorem correctionStep0_conv_suffixEq9 :
    convI correctionStep0_conv_suffix9 correction1 = correctionStep0_conv_result9 := by
  exact convBlockGlue correctionStep0_conv_suffixEq10 correctionStep0_conv_blockStep9

theorem correctionStep0_conv_suffixEq8 :
    convI correctionStep0_conv_suffix8 correction1 = correctionStep0_conv_result8 := by
  exact convBlockGlue correctionStep0_conv_suffixEq9 correctionStep0_conv_blockStep8

theorem correctionStep0_conv_suffixEq7 :
    convI correctionStep0_conv_suffix7 correction1 = correctionStep0_conv_result7 := by
  exact convBlockGlue correctionStep0_conv_suffixEq8 correctionStep0_conv_blockStep7

theorem correctionStep0_conv_suffixEq6 :
    convI correctionStep0_conv_suffix6 correction1 = correctionStep0_conv_result6 := by
  exact convBlockGlue correctionStep0_conv_suffixEq7 correctionStep0_conv_blockStep6

theorem correctionStep0_conv_suffixEq5 :
    convI correctionStep0_conv_suffix5 correction1 = correctionStep0_conv_result5 := by
  exact convBlockGlue correctionStep0_conv_suffixEq6 correctionStep0_conv_blockStep5

theorem correctionStep0_conv_suffixEq4 :
    convI correctionStep0_conv_suffix4 correction1 = correctionStep0_conv_result4 := by
  exact convBlockGlue correctionStep0_conv_suffixEq5 correctionStep0_conv_blockStep4

theorem correctionStep0_conv_suffixEq3 :
    convI correctionStep0_conv_suffix3 correction1 = correctionStep0_conv_result3 := by
  exact convBlockGlue correctionStep0_conv_suffixEq4 correctionStep0_conv_blockStep3

theorem correctionStep0_conv_suffixEq2 :
    convI correctionStep0_conv_suffix2 correction1 = correctionStep0_conv_result2 := by
  exact convBlockGlue correctionStep0_conv_suffixEq3 correctionStep0_conv_blockStep2

theorem correctionStep0_conv_suffixEq1 :
    convI correctionStep0_conv_suffix1 correction1 = correctionStep0_conv_result1 := by
  exact convBlockGlue correctionStep0_conv_suffixEq2 correctionStep0_conv_blockStep1

theorem correctionStep0_conv_suffixEq0 :
    convI correctionStep0_conv_suffix0 correction1 = correctionStep0_conv_result0 := by
  exact convBlockGlue correctionStep0_conv_suffixEq1 correctionStep0_conv_blockStep0

theorem correctionStep0_conv_eq :
    convI ratioY correction1 = correctionStep0_conv_result0 := by
  exact (congrArg (fun left => convI left correction1) correctionStep0_conv_input).trans correctionStep0_conv_suffixEq0

theorem correctionStep0 :
    (addL [ofRatI d0_64] (convI ratioY correction1)).take 170 = correction0 := by
  rw [correctionStep0_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 89: reached correctionStep0"
  out.flush

theorem correctionEq0 :
    hornerI 170 ratioY correctionWeights0 = correction0 := by
  exact correctionGlue correctionEq1 correctionStep0

theorem tail_step_conv_suffixEq13 :
    convI tail_step_conv_suffix13 correction0 = tail_step_conv_result13 := by
  rfl

theorem tail_step_conv_suffixEq12 :
    convI tail_step_conv_suffix12 correction0 = tail_step_conv_result12 := by
  exact convBlockGlue tail_step_conv_suffixEq13 tail_step_conv_blockStep12

theorem tail_step_conv_suffixEq11 :
    convI tail_step_conv_suffix11 correction0 = tail_step_conv_result11 := by
  exact convBlockGlue tail_step_conv_suffixEq12 tail_step_conv_blockStep11

theorem tail_step_conv_suffixEq10 :
    convI tail_step_conv_suffix10 correction0 = tail_step_conv_result10 := by
  exact convBlockGlue tail_step_conv_suffixEq11 tail_step_conv_blockStep10

theorem tail_step_conv_suffixEq9 :
    convI tail_step_conv_suffix9 correction0 = tail_step_conv_result9 := by
  exact convBlockGlue tail_step_conv_suffixEq10 tail_step_conv_blockStep9

theorem tail_step_conv_suffixEq8 :
    convI tail_step_conv_suffix8 correction0 = tail_step_conv_result8 := by
  exact convBlockGlue tail_step_conv_suffixEq9 tail_step_conv_blockStep8

theorem tail_step_conv_suffixEq7 :
    convI tail_step_conv_suffix7 correction0 = tail_step_conv_result7 := by
  exact convBlockGlue tail_step_conv_suffixEq8 tail_step_conv_blockStep7

theorem tail_step_conv_suffixEq6 :
    convI tail_step_conv_suffix6 correction0 = tail_step_conv_result6 := by
  exact convBlockGlue tail_step_conv_suffixEq7 tail_step_conv_blockStep6

theorem tail_step_conv_suffixEq5 :
    convI tail_step_conv_suffix5 correction0 = tail_step_conv_result5 := by
  exact convBlockGlue tail_step_conv_suffixEq6 tail_step_conv_blockStep5

theorem tail_step_conv_suffixEq4 :
    convI tail_step_conv_suffix4 correction0 = tail_step_conv_result4 := by
  exact convBlockGlue tail_step_conv_suffixEq5 tail_step_conv_blockStep4

theorem tail_step_conv_suffixEq3 :
    convI tail_step_conv_suffix3 correction0 = tail_step_conv_result3 := by
  exact convBlockGlue tail_step_conv_suffixEq4 tail_step_conv_blockStep3

theorem tail_step_conv_suffixEq2 :
    convI tail_step_conv_suffix2 correction0 = tail_step_conv_result2 := by
  exact convBlockGlue tail_step_conv_suffixEq3 tail_step_conv_blockStep2

theorem tail_step_conv_suffixEq1 :
    convI tail_step_conv_suffix1 correction0 = tail_step_conv_result1 := by
  exact convBlockGlue tail_step_conv_suffixEq2 tail_step_conv_blockStep1

theorem tail_step_conv_suffixEq0 :
    convI tail_step_conv_suffix0 correction0 = tail_step_conv_result0 := by
  exact convBlockGlue tail_step_conv_suffixEq1 tail_step_conv_blockStep0

theorem tail_step_conv_eq :
    convI rI correction0 = tail_step_conv_result0 := by
  exact (congrArg (fun left => convI left correction0) tail_step_conv_input).trans tail_step_conv_suffixEq0

theorem tail_step :
    convI rI correction0 = tailI := by
  rw [tail_step_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 90: reached tail_step"
  out.flush

theorem headEq64 :
    hornerWithTailI 170 ratioA tailI weights64 = head64 := by
  rfl

theorem headStep63_conv_suffixEq6 :
    convI headStep63_conv_suffix6 head64 = headStep63_conv_result6 := by
  rfl

theorem headStep63_conv_suffixEq5 :
    convI headStep63_conv_suffix5 head64 = headStep63_conv_result5 := by
  exact convBlockGlue headStep63_conv_suffixEq6 headStep63_conv_blockStep5

theorem headStep63_conv_suffixEq4 :
    convI headStep63_conv_suffix4 head64 = headStep63_conv_result4 := by
  exact convBlockGlue headStep63_conv_suffixEq5 headStep63_conv_blockStep4

theorem headStep63_conv_suffixEq3 :
    convI headStep63_conv_suffix3 head64 = headStep63_conv_result3 := by
  exact convBlockGlue headStep63_conv_suffixEq4 headStep63_conv_blockStep3

theorem headStep63_conv_suffixEq2 :
    convI headStep63_conv_suffix2 head64 = headStep63_conv_result2 := by
  exact convBlockGlue headStep63_conv_suffixEq3 headStep63_conv_blockStep2

theorem headStep63_conv_suffixEq1 :
    convI headStep63_conv_suffix1 head64 = headStep63_conv_result1 := by
  exact convBlockGlue headStep63_conv_suffixEq2 headStep63_conv_blockStep1

theorem headStep63_conv_suffixEq0 :
    convI headStep63_conv_suffix0 head64 = headStep63_conv_result0 := by
  exact convBlockGlue headStep63_conv_suffixEq1 headStep63_conv_blockStep0

theorem headStep63_conv_eq :
    convI ratioA head64 = headStep63_conv_result0 := by
  exact (congrArg (fun left => convI left head64) headStep63_conv_input).trans headStep63_conv_suffixEq0

theorem headStep63 :
    (addL [ofRatI c63] (convI ratioA head64)).take 170 = head63 := by
  rw [headStep63_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 91: reached headStep63"
  out.flush

theorem headEq63 :
    hornerWithTailI 170 ratioA tailI weights63 = head63 := by
  exact headGlue headEq64 headStep63

theorem headStep62_conv_suffixEq6 :
    convI headStep62_conv_suffix6 head63 = headStep62_conv_result6 := by
  rfl

theorem headStep62_conv_suffixEq5 :
    convI headStep62_conv_suffix5 head63 = headStep62_conv_result5 := by
  exact convBlockGlue headStep62_conv_suffixEq6 headStep62_conv_blockStep5

theorem headStep62_conv_suffixEq4 :
    convI headStep62_conv_suffix4 head63 = headStep62_conv_result4 := by
  exact convBlockGlue headStep62_conv_suffixEq5 headStep62_conv_blockStep4

theorem headStep62_conv_suffixEq3 :
    convI headStep62_conv_suffix3 head63 = headStep62_conv_result3 := by
  exact convBlockGlue headStep62_conv_suffixEq4 headStep62_conv_blockStep3

theorem headStep62_conv_suffixEq2 :
    convI headStep62_conv_suffix2 head63 = headStep62_conv_result2 := by
  exact convBlockGlue headStep62_conv_suffixEq3 headStep62_conv_blockStep2

theorem headStep62_conv_suffixEq1 :
    convI headStep62_conv_suffix1 head63 = headStep62_conv_result1 := by
  exact convBlockGlue headStep62_conv_suffixEq2 headStep62_conv_blockStep1

theorem headStep62_conv_suffixEq0 :
    convI headStep62_conv_suffix0 head63 = headStep62_conv_result0 := by
  exact convBlockGlue headStep62_conv_suffixEq1 headStep62_conv_blockStep0

theorem headStep62_conv_eq :
    convI ratioA head63 = headStep62_conv_result0 := by
  exact (congrArg (fun left => convI left head63) headStep62_conv_input).trans headStep62_conv_suffixEq0

theorem headStep62 :
    (addL [ofRatI c62] (convI ratioA head63)).take 170 = head62 := by
  rw [headStep62_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 92: reached headStep62"
  out.flush

theorem headEq62 :
    hornerWithTailI 170 ratioA tailI weights62 = head62 := by
  exact headGlue headEq63 headStep62

theorem headStep61_conv_suffixEq6 :
    convI headStep61_conv_suffix6 head62 = headStep61_conv_result6 := by
  rfl

theorem headStep61_conv_suffixEq5 :
    convI headStep61_conv_suffix5 head62 = headStep61_conv_result5 := by
  exact convBlockGlue headStep61_conv_suffixEq6 headStep61_conv_blockStep5

theorem headStep61_conv_suffixEq4 :
    convI headStep61_conv_suffix4 head62 = headStep61_conv_result4 := by
  exact convBlockGlue headStep61_conv_suffixEq5 headStep61_conv_blockStep4

theorem headStep61_conv_suffixEq3 :
    convI headStep61_conv_suffix3 head62 = headStep61_conv_result3 := by
  exact convBlockGlue headStep61_conv_suffixEq4 headStep61_conv_blockStep3

theorem headStep61_conv_suffixEq2 :
    convI headStep61_conv_suffix2 head62 = headStep61_conv_result2 := by
  exact convBlockGlue headStep61_conv_suffixEq3 headStep61_conv_blockStep2

theorem headStep61_conv_suffixEq1 :
    convI headStep61_conv_suffix1 head62 = headStep61_conv_result1 := by
  exact convBlockGlue headStep61_conv_suffixEq2 headStep61_conv_blockStep1

theorem headStep61_conv_suffixEq0 :
    convI headStep61_conv_suffix0 head62 = headStep61_conv_result0 := by
  exact convBlockGlue headStep61_conv_suffixEq1 headStep61_conv_blockStep0

theorem headStep61_conv_eq :
    convI ratioA head62 = headStep61_conv_result0 := by
  exact (congrArg (fun left => convI left head62) headStep61_conv_input).trans headStep61_conv_suffixEq0

theorem headStep61 :
    (addL [ofRatI c61] (convI ratioA head62)).take 170 = head61 := by
  rw [headStep61_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 93: reached headStep61"
  out.flush

theorem headEq61 :
    hornerWithTailI 170 ratioA tailI weights61 = head61 := by
  exact headGlue headEq62 headStep61

theorem headStep60_conv_suffixEq6 :
    convI headStep60_conv_suffix6 head61 = headStep60_conv_result6 := by
  rfl

theorem headStep60_conv_suffixEq5 :
    convI headStep60_conv_suffix5 head61 = headStep60_conv_result5 := by
  exact convBlockGlue headStep60_conv_suffixEq6 headStep60_conv_blockStep5

theorem headStep60_conv_suffixEq4 :
    convI headStep60_conv_suffix4 head61 = headStep60_conv_result4 := by
  exact convBlockGlue headStep60_conv_suffixEq5 headStep60_conv_blockStep4

theorem headStep60_conv_suffixEq3 :
    convI headStep60_conv_suffix3 head61 = headStep60_conv_result3 := by
  exact convBlockGlue headStep60_conv_suffixEq4 headStep60_conv_blockStep3

theorem headStep60_conv_suffixEq2 :
    convI headStep60_conv_suffix2 head61 = headStep60_conv_result2 := by
  exact convBlockGlue headStep60_conv_suffixEq3 headStep60_conv_blockStep2

theorem headStep60_conv_suffixEq1 :
    convI headStep60_conv_suffix1 head61 = headStep60_conv_result1 := by
  exact convBlockGlue headStep60_conv_suffixEq2 headStep60_conv_blockStep1

theorem headStep60_conv_suffixEq0 :
    convI headStep60_conv_suffix0 head61 = headStep60_conv_result0 := by
  exact convBlockGlue headStep60_conv_suffixEq1 headStep60_conv_blockStep0

theorem headStep60_conv_eq :
    convI ratioA head61 = headStep60_conv_result0 := by
  exact (congrArg (fun left => convI left head61) headStep60_conv_input).trans headStep60_conv_suffixEq0

theorem headStep60 :
    (addL [ofRatI c60] (convI ratioA head61)).take 170 = head60 := by
  rw [headStep60_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 94: reached headStep60"
  out.flush

theorem headEq60 :
    hornerWithTailI 170 ratioA tailI weights60 = head60 := by
  exact headGlue headEq61 headStep60

theorem headStep59_conv_suffixEq6 :
    convI headStep59_conv_suffix6 head60 = headStep59_conv_result6 := by
  rfl

theorem headStep59_conv_suffixEq5 :
    convI headStep59_conv_suffix5 head60 = headStep59_conv_result5 := by
  exact convBlockGlue headStep59_conv_suffixEq6 headStep59_conv_blockStep5

theorem headStep59_conv_suffixEq4 :
    convI headStep59_conv_suffix4 head60 = headStep59_conv_result4 := by
  exact convBlockGlue headStep59_conv_suffixEq5 headStep59_conv_blockStep4

theorem headStep59_conv_suffixEq3 :
    convI headStep59_conv_suffix3 head60 = headStep59_conv_result3 := by
  exact convBlockGlue headStep59_conv_suffixEq4 headStep59_conv_blockStep3

theorem headStep59_conv_suffixEq2 :
    convI headStep59_conv_suffix2 head60 = headStep59_conv_result2 := by
  exact convBlockGlue headStep59_conv_suffixEq3 headStep59_conv_blockStep2

theorem headStep59_conv_suffixEq1 :
    convI headStep59_conv_suffix1 head60 = headStep59_conv_result1 := by
  exact convBlockGlue headStep59_conv_suffixEq2 headStep59_conv_blockStep1

theorem headStep59_conv_suffixEq0 :
    convI headStep59_conv_suffix0 head60 = headStep59_conv_result0 := by
  exact convBlockGlue headStep59_conv_suffixEq1 headStep59_conv_blockStep0

theorem headStep59_conv_eq :
    convI ratioA head60 = headStep59_conv_result0 := by
  exact (congrArg (fun left => convI left head60) headStep59_conv_input).trans headStep59_conv_suffixEq0

theorem headStep59 :
    (addL [ofRatI c59] (convI ratioA head60)).take 170 = head59 := by
  rw [headStep59_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 95: reached headStep59"
  out.flush

theorem headEq59 :
    hornerWithTailI 170 ratioA tailI weights59 = head59 := by
  exact headGlue headEq60 headStep59

theorem headStep58_conv_suffixEq6 :
    convI headStep58_conv_suffix6 head59 = headStep58_conv_result6 := by
  rfl

theorem headStep58_conv_suffixEq5 :
    convI headStep58_conv_suffix5 head59 = headStep58_conv_result5 := by
  exact convBlockGlue headStep58_conv_suffixEq6 headStep58_conv_blockStep5

theorem headStep58_conv_suffixEq4 :
    convI headStep58_conv_suffix4 head59 = headStep58_conv_result4 := by
  exact convBlockGlue headStep58_conv_suffixEq5 headStep58_conv_blockStep4

theorem headStep58_conv_suffixEq3 :
    convI headStep58_conv_suffix3 head59 = headStep58_conv_result3 := by
  exact convBlockGlue headStep58_conv_suffixEq4 headStep58_conv_blockStep3

theorem headStep58_conv_suffixEq2 :
    convI headStep58_conv_suffix2 head59 = headStep58_conv_result2 := by
  exact convBlockGlue headStep58_conv_suffixEq3 headStep58_conv_blockStep2

theorem headStep58_conv_suffixEq1 :
    convI headStep58_conv_suffix1 head59 = headStep58_conv_result1 := by
  exact convBlockGlue headStep58_conv_suffixEq2 headStep58_conv_blockStep1

theorem headStep58_conv_suffixEq0 :
    convI headStep58_conv_suffix0 head59 = headStep58_conv_result0 := by
  exact convBlockGlue headStep58_conv_suffixEq1 headStep58_conv_blockStep0

theorem headStep58_conv_eq :
    convI ratioA head59 = headStep58_conv_result0 := by
  exact (congrArg (fun left => convI left head59) headStep58_conv_input).trans headStep58_conv_suffixEq0

theorem headStep58 :
    (addL [ofRatI c58] (convI ratioA head59)).take 170 = head58 := by
  rw [headStep58_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 96: reached headStep58"
  out.flush

theorem headEq58 :
    hornerWithTailI 170 ratioA tailI weights58 = head58 := by
  exact headGlue headEq59 headStep58

theorem headStep57_conv_suffixEq6 :
    convI headStep57_conv_suffix6 head58 = headStep57_conv_result6 := by
  rfl

theorem headStep57_conv_suffixEq5 :
    convI headStep57_conv_suffix5 head58 = headStep57_conv_result5 := by
  exact convBlockGlue headStep57_conv_suffixEq6 headStep57_conv_blockStep5

theorem headStep57_conv_suffixEq4 :
    convI headStep57_conv_suffix4 head58 = headStep57_conv_result4 := by
  exact convBlockGlue headStep57_conv_suffixEq5 headStep57_conv_blockStep4

theorem headStep57_conv_suffixEq3 :
    convI headStep57_conv_suffix3 head58 = headStep57_conv_result3 := by
  exact convBlockGlue headStep57_conv_suffixEq4 headStep57_conv_blockStep3

theorem headStep57_conv_suffixEq2 :
    convI headStep57_conv_suffix2 head58 = headStep57_conv_result2 := by
  exact convBlockGlue headStep57_conv_suffixEq3 headStep57_conv_blockStep2

theorem headStep57_conv_suffixEq1 :
    convI headStep57_conv_suffix1 head58 = headStep57_conv_result1 := by
  exact convBlockGlue headStep57_conv_suffixEq2 headStep57_conv_blockStep1

theorem headStep57_conv_suffixEq0 :
    convI headStep57_conv_suffix0 head58 = headStep57_conv_result0 := by
  exact convBlockGlue headStep57_conv_suffixEq1 headStep57_conv_blockStep0

theorem headStep57_conv_eq :
    convI ratioA head58 = headStep57_conv_result0 := by
  exact (congrArg (fun left => convI left head58) headStep57_conv_input).trans headStep57_conv_suffixEq0

theorem headStep57 :
    (addL [ofRatI c57] (convI ratioA head58)).take 170 = head57 := by
  rw [headStep57_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 97: reached headStep57"
  out.flush

theorem headEq57 :
    hornerWithTailI 170 ratioA tailI weights57 = head57 := by
  exact headGlue headEq58 headStep57

theorem headStep56_conv_suffixEq6 :
    convI headStep56_conv_suffix6 head57 = headStep56_conv_result6 := by
  rfl

theorem headStep56_conv_suffixEq5 :
    convI headStep56_conv_suffix5 head57 = headStep56_conv_result5 := by
  exact convBlockGlue headStep56_conv_suffixEq6 headStep56_conv_blockStep5

theorem headStep56_conv_suffixEq4 :
    convI headStep56_conv_suffix4 head57 = headStep56_conv_result4 := by
  exact convBlockGlue headStep56_conv_suffixEq5 headStep56_conv_blockStep4

theorem headStep56_conv_suffixEq3 :
    convI headStep56_conv_suffix3 head57 = headStep56_conv_result3 := by
  exact convBlockGlue headStep56_conv_suffixEq4 headStep56_conv_blockStep3

theorem headStep56_conv_suffixEq2 :
    convI headStep56_conv_suffix2 head57 = headStep56_conv_result2 := by
  exact convBlockGlue headStep56_conv_suffixEq3 headStep56_conv_blockStep2

theorem headStep56_conv_suffixEq1 :
    convI headStep56_conv_suffix1 head57 = headStep56_conv_result1 := by
  exact convBlockGlue headStep56_conv_suffixEq2 headStep56_conv_blockStep1

theorem headStep56_conv_suffixEq0 :
    convI headStep56_conv_suffix0 head57 = headStep56_conv_result0 := by
  exact convBlockGlue headStep56_conv_suffixEq1 headStep56_conv_blockStep0

theorem headStep56_conv_eq :
    convI ratioA head57 = headStep56_conv_result0 := by
  exact (congrArg (fun left => convI left head57) headStep56_conv_input).trans headStep56_conv_suffixEq0

theorem headStep56 :
    (addL [ofRatI c56] (convI ratioA head57)).take 170 = head56 := by
  rw [headStep56_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 98: reached headStep56"
  out.flush

theorem headEq56 :
    hornerWithTailI 170 ratioA tailI weights56 = head56 := by
  exact headGlue headEq57 headStep56

theorem headStep55_conv_suffixEq6 :
    convI headStep55_conv_suffix6 head56 = headStep55_conv_result6 := by
  rfl

theorem headStep55_conv_suffixEq5 :
    convI headStep55_conv_suffix5 head56 = headStep55_conv_result5 := by
  exact convBlockGlue headStep55_conv_suffixEq6 headStep55_conv_blockStep5

theorem headStep55_conv_suffixEq4 :
    convI headStep55_conv_suffix4 head56 = headStep55_conv_result4 := by
  exact convBlockGlue headStep55_conv_suffixEq5 headStep55_conv_blockStep4

theorem headStep55_conv_suffixEq3 :
    convI headStep55_conv_suffix3 head56 = headStep55_conv_result3 := by
  exact convBlockGlue headStep55_conv_suffixEq4 headStep55_conv_blockStep3

theorem headStep55_conv_suffixEq2 :
    convI headStep55_conv_suffix2 head56 = headStep55_conv_result2 := by
  exact convBlockGlue headStep55_conv_suffixEq3 headStep55_conv_blockStep2

theorem headStep55_conv_suffixEq1 :
    convI headStep55_conv_suffix1 head56 = headStep55_conv_result1 := by
  exact convBlockGlue headStep55_conv_suffixEq2 headStep55_conv_blockStep1

theorem headStep55_conv_suffixEq0 :
    convI headStep55_conv_suffix0 head56 = headStep55_conv_result0 := by
  exact convBlockGlue headStep55_conv_suffixEq1 headStep55_conv_blockStep0

theorem headStep55_conv_eq :
    convI ratioA head56 = headStep55_conv_result0 := by
  exact (congrArg (fun left => convI left head56) headStep55_conv_input).trans headStep55_conv_suffixEq0

theorem headStep55 :
    (addL [ofRatI c55] (convI ratioA head56)).take 170 = head55 := by
  rw [headStep55_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 99: reached headStep55"
  out.flush

theorem headEq55 :
    hornerWithTailI 170 ratioA tailI weights55 = head55 := by
  exact headGlue headEq56 headStep55

theorem headStep54_conv_suffixEq6 :
    convI headStep54_conv_suffix6 head55 = headStep54_conv_result6 := by
  rfl

theorem headStep54_conv_suffixEq5 :
    convI headStep54_conv_suffix5 head55 = headStep54_conv_result5 := by
  exact convBlockGlue headStep54_conv_suffixEq6 headStep54_conv_blockStep5

theorem headStep54_conv_suffixEq4 :
    convI headStep54_conv_suffix4 head55 = headStep54_conv_result4 := by
  exact convBlockGlue headStep54_conv_suffixEq5 headStep54_conv_blockStep4

theorem headStep54_conv_suffixEq3 :
    convI headStep54_conv_suffix3 head55 = headStep54_conv_result3 := by
  exact convBlockGlue headStep54_conv_suffixEq4 headStep54_conv_blockStep3

theorem headStep54_conv_suffixEq2 :
    convI headStep54_conv_suffix2 head55 = headStep54_conv_result2 := by
  exact convBlockGlue headStep54_conv_suffixEq3 headStep54_conv_blockStep2

theorem headStep54_conv_suffixEq1 :
    convI headStep54_conv_suffix1 head55 = headStep54_conv_result1 := by
  exact convBlockGlue headStep54_conv_suffixEq2 headStep54_conv_blockStep1

theorem headStep54_conv_suffixEq0 :
    convI headStep54_conv_suffix0 head55 = headStep54_conv_result0 := by
  exact convBlockGlue headStep54_conv_suffixEq1 headStep54_conv_blockStep0

theorem headStep54_conv_eq :
    convI ratioA head55 = headStep54_conv_result0 := by
  exact (congrArg (fun left => convI left head55) headStep54_conv_input).trans headStep54_conv_suffixEq0

theorem headStep54 :
    (addL [ofRatI c54] (convI ratioA head55)).take 170 = head54 := by
  rw [headStep54_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 100: reached headStep54"
  out.flush

theorem headEq54 :
    hornerWithTailI 170 ratioA tailI weights54 = head54 := by
  exact headGlue headEq55 headStep54

theorem headStep53_conv_suffixEq6 :
    convI headStep53_conv_suffix6 head54 = headStep53_conv_result6 := by
  rfl

theorem headStep53_conv_suffixEq5 :
    convI headStep53_conv_suffix5 head54 = headStep53_conv_result5 := by
  exact convBlockGlue headStep53_conv_suffixEq6 headStep53_conv_blockStep5

theorem headStep53_conv_suffixEq4 :
    convI headStep53_conv_suffix4 head54 = headStep53_conv_result4 := by
  exact convBlockGlue headStep53_conv_suffixEq5 headStep53_conv_blockStep4

theorem headStep53_conv_suffixEq3 :
    convI headStep53_conv_suffix3 head54 = headStep53_conv_result3 := by
  exact convBlockGlue headStep53_conv_suffixEq4 headStep53_conv_blockStep3

theorem headStep53_conv_suffixEq2 :
    convI headStep53_conv_suffix2 head54 = headStep53_conv_result2 := by
  exact convBlockGlue headStep53_conv_suffixEq3 headStep53_conv_blockStep2

theorem headStep53_conv_suffixEq1 :
    convI headStep53_conv_suffix1 head54 = headStep53_conv_result1 := by
  exact convBlockGlue headStep53_conv_suffixEq2 headStep53_conv_blockStep1

theorem headStep53_conv_suffixEq0 :
    convI headStep53_conv_suffix0 head54 = headStep53_conv_result0 := by
  exact convBlockGlue headStep53_conv_suffixEq1 headStep53_conv_blockStep0

theorem headStep53_conv_eq :
    convI ratioA head54 = headStep53_conv_result0 := by
  exact (congrArg (fun left => convI left head54) headStep53_conv_input).trans headStep53_conv_suffixEq0

theorem headStep53 :
    (addL [ofRatI c53] (convI ratioA head54)).take 170 = head53 := by
  rw [headStep53_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 101: reached headStep53"
  out.flush

theorem headEq53 :
    hornerWithTailI 170 ratioA tailI weights53 = head53 := by
  exact headGlue headEq54 headStep53

theorem headStep52_conv_suffixEq6 :
    convI headStep52_conv_suffix6 head53 = headStep52_conv_result6 := by
  rfl

theorem headStep52_conv_suffixEq5 :
    convI headStep52_conv_suffix5 head53 = headStep52_conv_result5 := by
  exact convBlockGlue headStep52_conv_suffixEq6 headStep52_conv_blockStep5

theorem headStep52_conv_suffixEq4 :
    convI headStep52_conv_suffix4 head53 = headStep52_conv_result4 := by
  exact convBlockGlue headStep52_conv_suffixEq5 headStep52_conv_blockStep4

theorem headStep52_conv_suffixEq3 :
    convI headStep52_conv_suffix3 head53 = headStep52_conv_result3 := by
  exact convBlockGlue headStep52_conv_suffixEq4 headStep52_conv_blockStep3

theorem headStep52_conv_suffixEq2 :
    convI headStep52_conv_suffix2 head53 = headStep52_conv_result2 := by
  exact convBlockGlue headStep52_conv_suffixEq3 headStep52_conv_blockStep2

theorem headStep52_conv_suffixEq1 :
    convI headStep52_conv_suffix1 head53 = headStep52_conv_result1 := by
  exact convBlockGlue headStep52_conv_suffixEq2 headStep52_conv_blockStep1

theorem headStep52_conv_suffixEq0 :
    convI headStep52_conv_suffix0 head53 = headStep52_conv_result0 := by
  exact convBlockGlue headStep52_conv_suffixEq1 headStep52_conv_blockStep0

theorem headStep52_conv_eq :
    convI ratioA head53 = headStep52_conv_result0 := by
  exact (congrArg (fun left => convI left head53) headStep52_conv_input).trans headStep52_conv_suffixEq0

theorem headStep52 :
    (addL [ofRatI c52] (convI ratioA head53)).take 170 = head52 := by
  rw [headStep52_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 102: reached headStep52"
  out.flush

theorem headEq52 :
    hornerWithTailI 170 ratioA tailI weights52 = head52 := by
  exact headGlue headEq53 headStep52

theorem headStep51_conv_suffixEq6 :
    convI headStep51_conv_suffix6 head52 = headStep51_conv_result6 := by
  rfl

theorem headStep51_conv_suffixEq5 :
    convI headStep51_conv_suffix5 head52 = headStep51_conv_result5 := by
  exact convBlockGlue headStep51_conv_suffixEq6 headStep51_conv_blockStep5

theorem headStep51_conv_suffixEq4 :
    convI headStep51_conv_suffix4 head52 = headStep51_conv_result4 := by
  exact convBlockGlue headStep51_conv_suffixEq5 headStep51_conv_blockStep4

theorem headStep51_conv_suffixEq3 :
    convI headStep51_conv_suffix3 head52 = headStep51_conv_result3 := by
  exact convBlockGlue headStep51_conv_suffixEq4 headStep51_conv_blockStep3

theorem headStep51_conv_suffixEq2 :
    convI headStep51_conv_suffix2 head52 = headStep51_conv_result2 := by
  exact convBlockGlue headStep51_conv_suffixEq3 headStep51_conv_blockStep2

theorem headStep51_conv_suffixEq1 :
    convI headStep51_conv_suffix1 head52 = headStep51_conv_result1 := by
  exact convBlockGlue headStep51_conv_suffixEq2 headStep51_conv_blockStep1

theorem headStep51_conv_suffixEq0 :
    convI headStep51_conv_suffix0 head52 = headStep51_conv_result0 := by
  exact convBlockGlue headStep51_conv_suffixEq1 headStep51_conv_blockStep0

theorem headStep51_conv_eq :
    convI ratioA head52 = headStep51_conv_result0 := by
  exact (congrArg (fun left => convI left head52) headStep51_conv_input).trans headStep51_conv_suffixEq0

theorem headStep51 :
    (addL [ofRatI c51] (convI ratioA head52)).take 170 = head51 := by
  rw [headStep51_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 103: reached headStep51"
  out.flush

theorem headEq51 :
    hornerWithTailI 170 ratioA tailI weights51 = head51 := by
  exact headGlue headEq52 headStep51

theorem headStep50_conv_suffixEq6 :
    convI headStep50_conv_suffix6 head51 = headStep50_conv_result6 := by
  rfl

theorem headStep50_conv_suffixEq5 :
    convI headStep50_conv_suffix5 head51 = headStep50_conv_result5 := by
  exact convBlockGlue headStep50_conv_suffixEq6 headStep50_conv_blockStep5

theorem headStep50_conv_suffixEq4 :
    convI headStep50_conv_suffix4 head51 = headStep50_conv_result4 := by
  exact convBlockGlue headStep50_conv_suffixEq5 headStep50_conv_blockStep4

theorem headStep50_conv_suffixEq3 :
    convI headStep50_conv_suffix3 head51 = headStep50_conv_result3 := by
  exact convBlockGlue headStep50_conv_suffixEq4 headStep50_conv_blockStep3

theorem headStep50_conv_suffixEq2 :
    convI headStep50_conv_suffix2 head51 = headStep50_conv_result2 := by
  exact convBlockGlue headStep50_conv_suffixEq3 headStep50_conv_blockStep2

theorem headStep50_conv_suffixEq1 :
    convI headStep50_conv_suffix1 head51 = headStep50_conv_result1 := by
  exact convBlockGlue headStep50_conv_suffixEq2 headStep50_conv_blockStep1

theorem headStep50_conv_suffixEq0 :
    convI headStep50_conv_suffix0 head51 = headStep50_conv_result0 := by
  exact convBlockGlue headStep50_conv_suffixEq1 headStep50_conv_blockStep0

theorem headStep50_conv_eq :
    convI ratioA head51 = headStep50_conv_result0 := by
  exact (congrArg (fun left => convI left head51) headStep50_conv_input).trans headStep50_conv_suffixEq0

theorem headStep50 :
    (addL [ofRatI c50] (convI ratioA head51)).take 170 = head50 := by
  rw [headStep50_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 104: reached headStep50"
  out.flush

theorem headEq50 :
    hornerWithTailI 170 ratioA tailI weights50 = head50 := by
  exact headGlue headEq51 headStep50

theorem headStep49_conv_suffixEq6 :
    convI headStep49_conv_suffix6 head50 = headStep49_conv_result6 := by
  rfl

theorem headStep49_conv_suffixEq5 :
    convI headStep49_conv_suffix5 head50 = headStep49_conv_result5 := by
  exact convBlockGlue headStep49_conv_suffixEq6 headStep49_conv_blockStep5

theorem headStep49_conv_suffixEq4 :
    convI headStep49_conv_suffix4 head50 = headStep49_conv_result4 := by
  exact convBlockGlue headStep49_conv_suffixEq5 headStep49_conv_blockStep4

theorem headStep49_conv_suffixEq3 :
    convI headStep49_conv_suffix3 head50 = headStep49_conv_result3 := by
  exact convBlockGlue headStep49_conv_suffixEq4 headStep49_conv_blockStep3

theorem headStep49_conv_suffixEq2 :
    convI headStep49_conv_suffix2 head50 = headStep49_conv_result2 := by
  exact convBlockGlue headStep49_conv_suffixEq3 headStep49_conv_blockStep2

theorem headStep49_conv_suffixEq1 :
    convI headStep49_conv_suffix1 head50 = headStep49_conv_result1 := by
  exact convBlockGlue headStep49_conv_suffixEq2 headStep49_conv_blockStep1

theorem headStep49_conv_suffixEq0 :
    convI headStep49_conv_suffix0 head50 = headStep49_conv_result0 := by
  exact convBlockGlue headStep49_conv_suffixEq1 headStep49_conv_blockStep0

theorem headStep49_conv_eq :
    convI ratioA head50 = headStep49_conv_result0 := by
  exact (congrArg (fun left => convI left head50) headStep49_conv_input).trans headStep49_conv_suffixEq0

theorem headStep49 :
    (addL [ofRatI c49] (convI ratioA head50)).take 170 = head49 := by
  rw [headStep49_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 105: reached headStep49"
  out.flush

theorem headEq49 :
    hornerWithTailI 170 ratioA tailI weights49 = head49 := by
  exact headGlue headEq50 headStep49

theorem headStep48_conv_suffixEq6 :
    convI headStep48_conv_suffix6 head49 = headStep48_conv_result6 := by
  rfl

theorem headStep48_conv_suffixEq5 :
    convI headStep48_conv_suffix5 head49 = headStep48_conv_result5 := by
  exact convBlockGlue headStep48_conv_suffixEq6 headStep48_conv_blockStep5

theorem headStep48_conv_suffixEq4 :
    convI headStep48_conv_suffix4 head49 = headStep48_conv_result4 := by
  exact convBlockGlue headStep48_conv_suffixEq5 headStep48_conv_blockStep4

theorem headStep48_conv_suffixEq3 :
    convI headStep48_conv_suffix3 head49 = headStep48_conv_result3 := by
  exact convBlockGlue headStep48_conv_suffixEq4 headStep48_conv_blockStep3

theorem headStep48_conv_suffixEq2 :
    convI headStep48_conv_suffix2 head49 = headStep48_conv_result2 := by
  exact convBlockGlue headStep48_conv_suffixEq3 headStep48_conv_blockStep2

theorem headStep48_conv_suffixEq1 :
    convI headStep48_conv_suffix1 head49 = headStep48_conv_result1 := by
  exact convBlockGlue headStep48_conv_suffixEq2 headStep48_conv_blockStep1

theorem headStep48_conv_suffixEq0 :
    convI headStep48_conv_suffix0 head49 = headStep48_conv_result0 := by
  exact convBlockGlue headStep48_conv_suffixEq1 headStep48_conv_blockStep0

theorem headStep48_conv_eq :
    convI ratioA head49 = headStep48_conv_result0 := by
  exact (congrArg (fun left => convI left head49) headStep48_conv_input).trans headStep48_conv_suffixEq0

theorem headStep48 :
    (addL [ofRatI c48] (convI ratioA head49)).take 170 = head48 := by
  rw [headStep48_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 106: reached headStep48"
  out.flush

theorem headEq48 :
    hornerWithTailI 170 ratioA tailI weights48 = head48 := by
  exact headGlue headEq49 headStep48

theorem headStep47_conv_suffixEq6 :
    convI headStep47_conv_suffix6 head48 = headStep47_conv_result6 := by
  rfl

theorem headStep47_conv_suffixEq5 :
    convI headStep47_conv_suffix5 head48 = headStep47_conv_result5 := by
  exact convBlockGlue headStep47_conv_suffixEq6 headStep47_conv_blockStep5

theorem headStep47_conv_suffixEq4 :
    convI headStep47_conv_suffix4 head48 = headStep47_conv_result4 := by
  exact convBlockGlue headStep47_conv_suffixEq5 headStep47_conv_blockStep4

theorem headStep47_conv_suffixEq3 :
    convI headStep47_conv_suffix3 head48 = headStep47_conv_result3 := by
  exact convBlockGlue headStep47_conv_suffixEq4 headStep47_conv_blockStep3

theorem headStep47_conv_suffixEq2 :
    convI headStep47_conv_suffix2 head48 = headStep47_conv_result2 := by
  exact convBlockGlue headStep47_conv_suffixEq3 headStep47_conv_blockStep2

theorem headStep47_conv_suffixEq1 :
    convI headStep47_conv_suffix1 head48 = headStep47_conv_result1 := by
  exact convBlockGlue headStep47_conv_suffixEq2 headStep47_conv_blockStep1

theorem headStep47_conv_suffixEq0 :
    convI headStep47_conv_suffix0 head48 = headStep47_conv_result0 := by
  exact convBlockGlue headStep47_conv_suffixEq1 headStep47_conv_blockStep0

theorem headStep47_conv_eq :
    convI ratioA head48 = headStep47_conv_result0 := by
  exact (congrArg (fun left => convI left head48) headStep47_conv_input).trans headStep47_conv_suffixEq0

theorem headStep47 :
    (addL [ofRatI c47] (convI ratioA head48)).take 170 = head47 := by
  rw [headStep47_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 107: reached headStep47"
  out.flush

theorem headEq47 :
    hornerWithTailI 170 ratioA tailI weights47 = head47 := by
  exact headGlue headEq48 headStep47

theorem headStep46_conv_suffixEq6 :
    convI headStep46_conv_suffix6 head47 = headStep46_conv_result6 := by
  rfl

theorem headStep46_conv_suffixEq5 :
    convI headStep46_conv_suffix5 head47 = headStep46_conv_result5 := by
  exact convBlockGlue headStep46_conv_suffixEq6 headStep46_conv_blockStep5

theorem headStep46_conv_suffixEq4 :
    convI headStep46_conv_suffix4 head47 = headStep46_conv_result4 := by
  exact convBlockGlue headStep46_conv_suffixEq5 headStep46_conv_blockStep4

theorem headStep46_conv_suffixEq3 :
    convI headStep46_conv_suffix3 head47 = headStep46_conv_result3 := by
  exact convBlockGlue headStep46_conv_suffixEq4 headStep46_conv_blockStep3

theorem headStep46_conv_suffixEq2 :
    convI headStep46_conv_suffix2 head47 = headStep46_conv_result2 := by
  exact convBlockGlue headStep46_conv_suffixEq3 headStep46_conv_blockStep2

theorem headStep46_conv_suffixEq1 :
    convI headStep46_conv_suffix1 head47 = headStep46_conv_result1 := by
  exact convBlockGlue headStep46_conv_suffixEq2 headStep46_conv_blockStep1

theorem headStep46_conv_suffixEq0 :
    convI headStep46_conv_suffix0 head47 = headStep46_conv_result0 := by
  exact convBlockGlue headStep46_conv_suffixEq1 headStep46_conv_blockStep0

theorem headStep46_conv_eq :
    convI ratioA head47 = headStep46_conv_result0 := by
  exact (congrArg (fun left => convI left head47) headStep46_conv_input).trans headStep46_conv_suffixEq0

theorem headStep46 :
    (addL [ofRatI c46] (convI ratioA head47)).take 170 = head46 := by
  rw [headStep46_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 108: reached headStep46"
  out.flush

theorem headEq46 :
    hornerWithTailI 170 ratioA tailI weights46 = head46 := by
  exact headGlue headEq47 headStep46

theorem headStep45_conv_suffixEq6 :
    convI headStep45_conv_suffix6 head46 = headStep45_conv_result6 := by
  rfl

theorem headStep45_conv_suffixEq5 :
    convI headStep45_conv_suffix5 head46 = headStep45_conv_result5 := by
  exact convBlockGlue headStep45_conv_suffixEq6 headStep45_conv_blockStep5

theorem headStep45_conv_suffixEq4 :
    convI headStep45_conv_suffix4 head46 = headStep45_conv_result4 := by
  exact convBlockGlue headStep45_conv_suffixEq5 headStep45_conv_blockStep4

theorem headStep45_conv_suffixEq3 :
    convI headStep45_conv_suffix3 head46 = headStep45_conv_result3 := by
  exact convBlockGlue headStep45_conv_suffixEq4 headStep45_conv_blockStep3

theorem headStep45_conv_suffixEq2 :
    convI headStep45_conv_suffix2 head46 = headStep45_conv_result2 := by
  exact convBlockGlue headStep45_conv_suffixEq3 headStep45_conv_blockStep2

theorem headStep45_conv_suffixEq1 :
    convI headStep45_conv_suffix1 head46 = headStep45_conv_result1 := by
  exact convBlockGlue headStep45_conv_suffixEq2 headStep45_conv_blockStep1

theorem headStep45_conv_suffixEq0 :
    convI headStep45_conv_suffix0 head46 = headStep45_conv_result0 := by
  exact convBlockGlue headStep45_conv_suffixEq1 headStep45_conv_blockStep0

theorem headStep45_conv_eq :
    convI ratioA head46 = headStep45_conv_result0 := by
  exact (congrArg (fun left => convI left head46) headStep45_conv_input).trans headStep45_conv_suffixEq0

theorem headStep45 :
    (addL [ofRatI c45] (convI ratioA head46)).take 170 = head45 := by
  rw [headStep45_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 109: reached headStep45"
  out.flush

theorem headEq45 :
    hornerWithTailI 170 ratioA tailI weights45 = head45 := by
  exact headGlue headEq46 headStep45

theorem headStep44_conv_suffixEq6 :
    convI headStep44_conv_suffix6 head45 = headStep44_conv_result6 := by
  rfl

theorem headStep44_conv_suffixEq5 :
    convI headStep44_conv_suffix5 head45 = headStep44_conv_result5 := by
  exact convBlockGlue headStep44_conv_suffixEq6 headStep44_conv_blockStep5

theorem headStep44_conv_suffixEq4 :
    convI headStep44_conv_suffix4 head45 = headStep44_conv_result4 := by
  exact convBlockGlue headStep44_conv_suffixEq5 headStep44_conv_blockStep4

theorem headStep44_conv_suffixEq3 :
    convI headStep44_conv_suffix3 head45 = headStep44_conv_result3 := by
  exact convBlockGlue headStep44_conv_suffixEq4 headStep44_conv_blockStep3

theorem headStep44_conv_suffixEq2 :
    convI headStep44_conv_suffix2 head45 = headStep44_conv_result2 := by
  exact convBlockGlue headStep44_conv_suffixEq3 headStep44_conv_blockStep2

theorem headStep44_conv_suffixEq1 :
    convI headStep44_conv_suffix1 head45 = headStep44_conv_result1 := by
  exact convBlockGlue headStep44_conv_suffixEq2 headStep44_conv_blockStep1

theorem headStep44_conv_suffixEq0 :
    convI headStep44_conv_suffix0 head45 = headStep44_conv_result0 := by
  exact convBlockGlue headStep44_conv_suffixEq1 headStep44_conv_blockStep0

theorem headStep44_conv_eq :
    convI ratioA head45 = headStep44_conv_result0 := by
  exact (congrArg (fun left => convI left head45) headStep44_conv_input).trans headStep44_conv_suffixEq0

theorem headStep44 :
    (addL [ofRatI c44] (convI ratioA head45)).take 170 = head44 := by
  rw [headStep44_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 110: reached headStep44"
  out.flush

theorem headEq44 :
    hornerWithTailI 170 ratioA tailI weights44 = head44 := by
  exact headGlue headEq45 headStep44

theorem headStep43_conv_suffixEq6 :
    convI headStep43_conv_suffix6 head44 = headStep43_conv_result6 := by
  rfl

theorem headStep43_conv_suffixEq5 :
    convI headStep43_conv_suffix5 head44 = headStep43_conv_result5 := by
  exact convBlockGlue headStep43_conv_suffixEq6 headStep43_conv_blockStep5

theorem headStep43_conv_suffixEq4 :
    convI headStep43_conv_suffix4 head44 = headStep43_conv_result4 := by
  exact convBlockGlue headStep43_conv_suffixEq5 headStep43_conv_blockStep4

theorem headStep43_conv_suffixEq3 :
    convI headStep43_conv_suffix3 head44 = headStep43_conv_result3 := by
  exact convBlockGlue headStep43_conv_suffixEq4 headStep43_conv_blockStep3

theorem headStep43_conv_suffixEq2 :
    convI headStep43_conv_suffix2 head44 = headStep43_conv_result2 := by
  exact convBlockGlue headStep43_conv_suffixEq3 headStep43_conv_blockStep2

theorem headStep43_conv_suffixEq1 :
    convI headStep43_conv_suffix1 head44 = headStep43_conv_result1 := by
  exact convBlockGlue headStep43_conv_suffixEq2 headStep43_conv_blockStep1

theorem headStep43_conv_suffixEq0 :
    convI headStep43_conv_suffix0 head44 = headStep43_conv_result0 := by
  exact convBlockGlue headStep43_conv_suffixEq1 headStep43_conv_blockStep0

theorem headStep43_conv_eq :
    convI ratioA head44 = headStep43_conv_result0 := by
  exact (congrArg (fun left => convI left head44) headStep43_conv_input).trans headStep43_conv_suffixEq0

theorem headStep43 :
    (addL [ofRatI c43] (convI ratioA head44)).take 170 = head43 := by
  rw [headStep43_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 111: reached headStep43"
  out.flush

theorem headEq43 :
    hornerWithTailI 170 ratioA tailI weights43 = head43 := by
  exact headGlue headEq44 headStep43

theorem headStep42_conv_suffixEq6 :
    convI headStep42_conv_suffix6 head43 = headStep42_conv_result6 := by
  rfl

theorem headStep42_conv_suffixEq5 :
    convI headStep42_conv_suffix5 head43 = headStep42_conv_result5 := by
  exact convBlockGlue headStep42_conv_suffixEq6 headStep42_conv_blockStep5

theorem headStep42_conv_suffixEq4 :
    convI headStep42_conv_suffix4 head43 = headStep42_conv_result4 := by
  exact convBlockGlue headStep42_conv_suffixEq5 headStep42_conv_blockStep4

theorem headStep42_conv_suffixEq3 :
    convI headStep42_conv_suffix3 head43 = headStep42_conv_result3 := by
  exact convBlockGlue headStep42_conv_suffixEq4 headStep42_conv_blockStep3

theorem headStep42_conv_suffixEq2 :
    convI headStep42_conv_suffix2 head43 = headStep42_conv_result2 := by
  exact convBlockGlue headStep42_conv_suffixEq3 headStep42_conv_blockStep2

theorem headStep42_conv_suffixEq1 :
    convI headStep42_conv_suffix1 head43 = headStep42_conv_result1 := by
  exact convBlockGlue headStep42_conv_suffixEq2 headStep42_conv_blockStep1

theorem headStep42_conv_suffixEq0 :
    convI headStep42_conv_suffix0 head43 = headStep42_conv_result0 := by
  exact convBlockGlue headStep42_conv_suffixEq1 headStep42_conv_blockStep0

theorem headStep42_conv_eq :
    convI ratioA head43 = headStep42_conv_result0 := by
  exact (congrArg (fun left => convI left head43) headStep42_conv_input).trans headStep42_conv_suffixEq0

theorem headStep42 :
    (addL [ofRatI c42] (convI ratioA head43)).take 170 = head42 := by
  rw [headStep42_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 112: reached headStep42"
  out.flush

theorem headEq42 :
    hornerWithTailI 170 ratioA tailI weights42 = head42 := by
  exact headGlue headEq43 headStep42

theorem headStep41_conv_suffixEq6 :
    convI headStep41_conv_suffix6 head42 = headStep41_conv_result6 := by
  rfl

theorem headStep41_conv_suffixEq5 :
    convI headStep41_conv_suffix5 head42 = headStep41_conv_result5 := by
  exact convBlockGlue headStep41_conv_suffixEq6 headStep41_conv_blockStep5

theorem headStep41_conv_suffixEq4 :
    convI headStep41_conv_suffix4 head42 = headStep41_conv_result4 := by
  exact convBlockGlue headStep41_conv_suffixEq5 headStep41_conv_blockStep4

theorem headStep41_conv_suffixEq3 :
    convI headStep41_conv_suffix3 head42 = headStep41_conv_result3 := by
  exact convBlockGlue headStep41_conv_suffixEq4 headStep41_conv_blockStep3

theorem headStep41_conv_suffixEq2 :
    convI headStep41_conv_suffix2 head42 = headStep41_conv_result2 := by
  exact convBlockGlue headStep41_conv_suffixEq3 headStep41_conv_blockStep2

theorem headStep41_conv_suffixEq1 :
    convI headStep41_conv_suffix1 head42 = headStep41_conv_result1 := by
  exact convBlockGlue headStep41_conv_suffixEq2 headStep41_conv_blockStep1

theorem headStep41_conv_suffixEq0 :
    convI headStep41_conv_suffix0 head42 = headStep41_conv_result0 := by
  exact convBlockGlue headStep41_conv_suffixEq1 headStep41_conv_blockStep0

theorem headStep41_conv_eq :
    convI ratioA head42 = headStep41_conv_result0 := by
  exact (congrArg (fun left => convI left head42) headStep41_conv_input).trans headStep41_conv_suffixEq0

theorem headStep41 :
    (addL [ofRatI c41] (convI ratioA head42)).take 170 = head41 := by
  rw [headStep41_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 113: reached headStep41"
  out.flush

theorem headEq41 :
    hornerWithTailI 170 ratioA tailI weights41 = head41 := by
  exact headGlue headEq42 headStep41

theorem headStep40_conv_suffixEq6 :
    convI headStep40_conv_suffix6 head41 = headStep40_conv_result6 := by
  rfl

theorem headStep40_conv_suffixEq5 :
    convI headStep40_conv_suffix5 head41 = headStep40_conv_result5 := by
  exact convBlockGlue headStep40_conv_suffixEq6 headStep40_conv_blockStep5

theorem headStep40_conv_suffixEq4 :
    convI headStep40_conv_suffix4 head41 = headStep40_conv_result4 := by
  exact convBlockGlue headStep40_conv_suffixEq5 headStep40_conv_blockStep4

theorem headStep40_conv_suffixEq3 :
    convI headStep40_conv_suffix3 head41 = headStep40_conv_result3 := by
  exact convBlockGlue headStep40_conv_suffixEq4 headStep40_conv_blockStep3

theorem headStep40_conv_suffixEq2 :
    convI headStep40_conv_suffix2 head41 = headStep40_conv_result2 := by
  exact convBlockGlue headStep40_conv_suffixEq3 headStep40_conv_blockStep2

theorem headStep40_conv_suffixEq1 :
    convI headStep40_conv_suffix1 head41 = headStep40_conv_result1 := by
  exact convBlockGlue headStep40_conv_suffixEq2 headStep40_conv_blockStep1

theorem headStep40_conv_suffixEq0 :
    convI headStep40_conv_suffix0 head41 = headStep40_conv_result0 := by
  exact convBlockGlue headStep40_conv_suffixEq1 headStep40_conv_blockStep0

theorem headStep40_conv_eq :
    convI ratioA head41 = headStep40_conv_result0 := by
  exact (congrArg (fun left => convI left head41) headStep40_conv_input).trans headStep40_conv_suffixEq0

theorem headStep40 :
    (addL [ofRatI c40] (convI ratioA head41)).take 170 = head40 := by
  rw [headStep40_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 114: reached headStep40"
  out.flush

theorem headEq40 :
    hornerWithTailI 170 ratioA tailI weights40 = head40 := by
  exact headGlue headEq41 headStep40

theorem headStep39_conv_suffixEq6 :
    convI headStep39_conv_suffix6 head40 = headStep39_conv_result6 := by
  rfl

theorem headStep39_conv_suffixEq5 :
    convI headStep39_conv_suffix5 head40 = headStep39_conv_result5 := by
  exact convBlockGlue headStep39_conv_suffixEq6 headStep39_conv_blockStep5

theorem headStep39_conv_suffixEq4 :
    convI headStep39_conv_suffix4 head40 = headStep39_conv_result4 := by
  exact convBlockGlue headStep39_conv_suffixEq5 headStep39_conv_blockStep4

theorem headStep39_conv_suffixEq3 :
    convI headStep39_conv_suffix3 head40 = headStep39_conv_result3 := by
  exact convBlockGlue headStep39_conv_suffixEq4 headStep39_conv_blockStep3

theorem headStep39_conv_suffixEq2 :
    convI headStep39_conv_suffix2 head40 = headStep39_conv_result2 := by
  exact convBlockGlue headStep39_conv_suffixEq3 headStep39_conv_blockStep2

theorem headStep39_conv_suffixEq1 :
    convI headStep39_conv_suffix1 head40 = headStep39_conv_result1 := by
  exact convBlockGlue headStep39_conv_suffixEq2 headStep39_conv_blockStep1

theorem headStep39_conv_suffixEq0 :
    convI headStep39_conv_suffix0 head40 = headStep39_conv_result0 := by
  exact convBlockGlue headStep39_conv_suffixEq1 headStep39_conv_blockStep0

theorem headStep39_conv_eq :
    convI ratioA head40 = headStep39_conv_result0 := by
  exact (congrArg (fun left => convI left head40) headStep39_conv_input).trans headStep39_conv_suffixEq0

theorem headStep39 :
    (addL [ofRatI c39] (convI ratioA head40)).take 170 = head39 := by
  rw [headStep39_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 115: reached headStep39"
  out.flush

theorem headEq39 :
    hornerWithTailI 170 ratioA tailI weights39 = head39 := by
  exact headGlue headEq40 headStep39

theorem headStep38_conv_suffixEq6 :
    convI headStep38_conv_suffix6 head39 = headStep38_conv_result6 := by
  rfl

theorem headStep38_conv_suffixEq5 :
    convI headStep38_conv_suffix5 head39 = headStep38_conv_result5 := by
  exact convBlockGlue headStep38_conv_suffixEq6 headStep38_conv_blockStep5

theorem headStep38_conv_suffixEq4 :
    convI headStep38_conv_suffix4 head39 = headStep38_conv_result4 := by
  exact convBlockGlue headStep38_conv_suffixEq5 headStep38_conv_blockStep4

theorem headStep38_conv_suffixEq3 :
    convI headStep38_conv_suffix3 head39 = headStep38_conv_result3 := by
  exact convBlockGlue headStep38_conv_suffixEq4 headStep38_conv_blockStep3

theorem headStep38_conv_suffixEq2 :
    convI headStep38_conv_suffix2 head39 = headStep38_conv_result2 := by
  exact convBlockGlue headStep38_conv_suffixEq3 headStep38_conv_blockStep2

theorem headStep38_conv_suffixEq1 :
    convI headStep38_conv_suffix1 head39 = headStep38_conv_result1 := by
  exact convBlockGlue headStep38_conv_suffixEq2 headStep38_conv_blockStep1

theorem headStep38_conv_suffixEq0 :
    convI headStep38_conv_suffix0 head39 = headStep38_conv_result0 := by
  exact convBlockGlue headStep38_conv_suffixEq1 headStep38_conv_blockStep0

theorem headStep38_conv_eq :
    convI ratioA head39 = headStep38_conv_result0 := by
  exact (congrArg (fun left => convI left head39) headStep38_conv_input).trans headStep38_conv_suffixEq0

theorem headStep38 :
    (addL [ofRatI c38] (convI ratioA head39)).take 170 = head38 := by
  rw [headStep38_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 116: reached headStep38"
  out.flush

theorem headEq38 :
    hornerWithTailI 170 ratioA tailI weights38 = head38 := by
  exact headGlue headEq39 headStep38

theorem headStep37_conv_suffixEq6 :
    convI headStep37_conv_suffix6 head38 = headStep37_conv_result6 := by
  rfl

theorem headStep37_conv_suffixEq5 :
    convI headStep37_conv_suffix5 head38 = headStep37_conv_result5 := by
  exact convBlockGlue headStep37_conv_suffixEq6 headStep37_conv_blockStep5

theorem headStep37_conv_suffixEq4 :
    convI headStep37_conv_suffix4 head38 = headStep37_conv_result4 := by
  exact convBlockGlue headStep37_conv_suffixEq5 headStep37_conv_blockStep4

theorem headStep37_conv_suffixEq3 :
    convI headStep37_conv_suffix3 head38 = headStep37_conv_result3 := by
  exact convBlockGlue headStep37_conv_suffixEq4 headStep37_conv_blockStep3

theorem headStep37_conv_suffixEq2 :
    convI headStep37_conv_suffix2 head38 = headStep37_conv_result2 := by
  exact convBlockGlue headStep37_conv_suffixEq3 headStep37_conv_blockStep2

theorem headStep37_conv_suffixEq1 :
    convI headStep37_conv_suffix1 head38 = headStep37_conv_result1 := by
  exact convBlockGlue headStep37_conv_suffixEq2 headStep37_conv_blockStep1

theorem headStep37_conv_suffixEq0 :
    convI headStep37_conv_suffix0 head38 = headStep37_conv_result0 := by
  exact convBlockGlue headStep37_conv_suffixEq1 headStep37_conv_blockStep0

theorem headStep37_conv_eq :
    convI ratioA head38 = headStep37_conv_result0 := by
  exact (congrArg (fun left => convI left head38) headStep37_conv_input).trans headStep37_conv_suffixEq0

theorem headStep37 :
    (addL [ofRatI c37] (convI ratioA head38)).take 170 = head37 := by
  rw [headStep37_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 117: reached headStep37"
  out.flush

theorem headEq37 :
    hornerWithTailI 170 ratioA tailI weights37 = head37 := by
  exact headGlue headEq38 headStep37

theorem headStep36_conv_suffixEq6 :
    convI headStep36_conv_suffix6 head37 = headStep36_conv_result6 := by
  rfl

theorem headStep36_conv_suffixEq5 :
    convI headStep36_conv_suffix5 head37 = headStep36_conv_result5 := by
  exact convBlockGlue headStep36_conv_suffixEq6 headStep36_conv_blockStep5

theorem headStep36_conv_suffixEq4 :
    convI headStep36_conv_suffix4 head37 = headStep36_conv_result4 := by
  exact convBlockGlue headStep36_conv_suffixEq5 headStep36_conv_blockStep4

theorem headStep36_conv_suffixEq3 :
    convI headStep36_conv_suffix3 head37 = headStep36_conv_result3 := by
  exact convBlockGlue headStep36_conv_suffixEq4 headStep36_conv_blockStep3

theorem headStep36_conv_suffixEq2 :
    convI headStep36_conv_suffix2 head37 = headStep36_conv_result2 := by
  exact convBlockGlue headStep36_conv_suffixEq3 headStep36_conv_blockStep2

theorem headStep36_conv_suffixEq1 :
    convI headStep36_conv_suffix1 head37 = headStep36_conv_result1 := by
  exact convBlockGlue headStep36_conv_suffixEq2 headStep36_conv_blockStep1

theorem headStep36_conv_suffixEq0 :
    convI headStep36_conv_suffix0 head37 = headStep36_conv_result0 := by
  exact convBlockGlue headStep36_conv_suffixEq1 headStep36_conv_blockStep0

theorem headStep36_conv_eq :
    convI ratioA head37 = headStep36_conv_result0 := by
  exact (congrArg (fun left => convI left head37) headStep36_conv_input).trans headStep36_conv_suffixEq0

theorem headStep36 :
    (addL [ofRatI c36] (convI ratioA head37)).take 170 = head36 := by
  rw [headStep36_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 118: reached headStep36"
  out.flush

theorem headEq36 :
    hornerWithTailI 170 ratioA tailI weights36 = head36 := by
  exact headGlue headEq37 headStep36

theorem headStep35_conv_suffixEq6 :
    convI headStep35_conv_suffix6 head36 = headStep35_conv_result6 := by
  rfl

theorem headStep35_conv_suffixEq5 :
    convI headStep35_conv_suffix5 head36 = headStep35_conv_result5 := by
  exact convBlockGlue headStep35_conv_suffixEq6 headStep35_conv_blockStep5

theorem headStep35_conv_suffixEq4 :
    convI headStep35_conv_suffix4 head36 = headStep35_conv_result4 := by
  exact convBlockGlue headStep35_conv_suffixEq5 headStep35_conv_blockStep4

theorem headStep35_conv_suffixEq3 :
    convI headStep35_conv_suffix3 head36 = headStep35_conv_result3 := by
  exact convBlockGlue headStep35_conv_suffixEq4 headStep35_conv_blockStep3

theorem headStep35_conv_suffixEq2 :
    convI headStep35_conv_suffix2 head36 = headStep35_conv_result2 := by
  exact convBlockGlue headStep35_conv_suffixEq3 headStep35_conv_blockStep2

theorem headStep35_conv_suffixEq1 :
    convI headStep35_conv_suffix1 head36 = headStep35_conv_result1 := by
  exact convBlockGlue headStep35_conv_suffixEq2 headStep35_conv_blockStep1

theorem headStep35_conv_suffixEq0 :
    convI headStep35_conv_suffix0 head36 = headStep35_conv_result0 := by
  exact convBlockGlue headStep35_conv_suffixEq1 headStep35_conv_blockStep0

theorem headStep35_conv_eq :
    convI ratioA head36 = headStep35_conv_result0 := by
  exact (congrArg (fun left => convI left head36) headStep35_conv_input).trans headStep35_conv_suffixEq0

theorem headStep35 :
    (addL [ofRatI c35] (convI ratioA head36)).take 170 = head35 := by
  rw [headStep35_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 119: reached headStep35"
  out.flush

theorem headEq35 :
    hornerWithTailI 170 ratioA tailI weights35 = head35 := by
  exact headGlue headEq36 headStep35

theorem headStep34_conv_suffixEq6 :
    convI headStep34_conv_suffix6 head35 = headStep34_conv_result6 := by
  rfl

theorem headStep34_conv_suffixEq5 :
    convI headStep34_conv_suffix5 head35 = headStep34_conv_result5 := by
  exact convBlockGlue headStep34_conv_suffixEq6 headStep34_conv_blockStep5

theorem headStep34_conv_suffixEq4 :
    convI headStep34_conv_suffix4 head35 = headStep34_conv_result4 := by
  exact convBlockGlue headStep34_conv_suffixEq5 headStep34_conv_blockStep4

theorem headStep34_conv_suffixEq3 :
    convI headStep34_conv_suffix3 head35 = headStep34_conv_result3 := by
  exact convBlockGlue headStep34_conv_suffixEq4 headStep34_conv_blockStep3

theorem headStep34_conv_suffixEq2 :
    convI headStep34_conv_suffix2 head35 = headStep34_conv_result2 := by
  exact convBlockGlue headStep34_conv_suffixEq3 headStep34_conv_blockStep2

theorem headStep34_conv_suffixEq1 :
    convI headStep34_conv_suffix1 head35 = headStep34_conv_result1 := by
  exact convBlockGlue headStep34_conv_suffixEq2 headStep34_conv_blockStep1

theorem headStep34_conv_suffixEq0 :
    convI headStep34_conv_suffix0 head35 = headStep34_conv_result0 := by
  exact convBlockGlue headStep34_conv_suffixEq1 headStep34_conv_blockStep0

theorem headStep34_conv_eq :
    convI ratioA head35 = headStep34_conv_result0 := by
  exact (congrArg (fun left => convI left head35) headStep34_conv_input).trans headStep34_conv_suffixEq0

theorem headStep34 :
    (addL [ofRatI c34] (convI ratioA head35)).take 170 = head34 := by
  rw [headStep34_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 120: reached headStep34"
  out.flush

theorem headEq34 :
    hornerWithTailI 170 ratioA tailI weights34 = head34 := by
  exact headGlue headEq35 headStep34

theorem headStep33_conv_suffixEq6 :
    convI headStep33_conv_suffix6 head34 = headStep33_conv_result6 := by
  rfl

theorem headStep33_conv_suffixEq5 :
    convI headStep33_conv_suffix5 head34 = headStep33_conv_result5 := by
  exact convBlockGlue headStep33_conv_suffixEq6 headStep33_conv_blockStep5

theorem headStep33_conv_suffixEq4 :
    convI headStep33_conv_suffix4 head34 = headStep33_conv_result4 := by
  exact convBlockGlue headStep33_conv_suffixEq5 headStep33_conv_blockStep4

theorem headStep33_conv_suffixEq3 :
    convI headStep33_conv_suffix3 head34 = headStep33_conv_result3 := by
  exact convBlockGlue headStep33_conv_suffixEq4 headStep33_conv_blockStep3

theorem headStep33_conv_suffixEq2 :
    convI headStep33_conv_suffix2 head34 = headStep33_conv_result2 := by
  exact convBlockGlue headStep33_conv_suffixEq3 headStep33_conv_blockStep2

theorem headStep33_conv_suffixEq1 :
    convI headStep33_conv_suffix1 head34 = headStep33_conv_result1 := by
  exact convBlockGlue headStep33_conv_suffixEq2 headStep33_conv_blockStep1

theorem headStep33_conv_suffixEq0 :
    convI headStep33_conv_suffix0 head34 = headStep33_conv_result0 := by
  exact convBlockGlue headStep33_conv_suffixEq1 headStep33_conv_blockStep0

theorem headStep33_conv_eq :
    convI ratioA head34 = headStep33_conv_result0 := by
  exact (congrArg (fun left => convI left head34) headStep33_conv_input).trans headStep33_conv_suffixEq0

theorem headStep33 :
    (addL [ofRatI c33] (convI ratioA head34)).take 170 = head33 := by
  rw [headStep33_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 121: reached headStep33"
  out.flush

theorem headEq33 :
    hornerWithTailI 170 ratioA tailI weights33 = head33 := by
  exact headGlue headEq34 headStep33

theorem headStep32_conv_suffixEq6 :
    convI headStep32_conv_suffix6 head33 = headStep32_conv_result6 := by
  rfl

theorem headStep32_conv_suffixEq5 :
    convI headStep32_conv_suffix5 head33 = headStep32_conv_result5 := by
  exact convBlockGlue headStep32_conv_suffixEq6 headStep32_conv_blockStep5

theorem headStep32_conv_suffixEq4 :
    convI headStep32_conv_suffix4 head33 = headStep32_conv_result4 := by
  exact convBlockGlue headStep32_conv_suffixEq5 headStep32_conv_blockStep4

theorem headStep32_conv_suffixEq3 :
    convI headStep32_conv_suffix3 head33 = headStep32_conv_result3 := by
  exact convBlockGlue headStep32_conv_suffixEq4 headStep32_conv_blockStep3

theorem headStep32_conv_suffixEq2 :
    convI headStep32_conv_suffix2 head33 = headStep32_conv_result2 := by
  exact convBlockGlue headStep32_conv_suffixEq3 headStep32_conv_blockStep2

theorem headStep32_conv_suffixEq1 :
    convI headStep32_conv_suffix1 head33 = headStep32_conv_result1 := by
  exact convBlockGlue headStep32_conv_suffixEq2 headStep32_conv_blockStep1

theorem headStep32_conv_suffixEq0 :
    convI headStep32_conv_suffix0 head33 = headStep32_conv_result0 := by
  exact convBlockGlue headStep32_conv_suffixEq1 headStep32_conv_blockStep0

theorem headStep32_conv_eq :
    convI ratioA head33 = headStep32_conv_result0 := by
  exact (congrArg (fun left => convI left head33) headStep32_conv_input).trans headStep32_conv_suffixEq0

theorem headStep32 :
    (addL [ofRatI c32] (convI ratioA head33)).take 170 = head32 := by
  rw [headStep32_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 122: reached headStep32"
  out.flush

theorem headEq32 :
    hornerWithTailI 170 ratioA tailI weights32 = head32 := by
  exact headGlue headEq33 headStep32

theorem headStep31_conv_suffixEq6 :
    convI headStep31_conv_suffix6 head32 = headStep31_conv_result6 := by
  rfl

theorem headStep31_conv_suffixEq5 :
    convI headStep31_conv_suffix5 head32 = headStep31_conv_result5 := by
  exact convBlockGlue headStep31_conv_suffixEq6 headStep31_conv_blockStep5

theorem headStep31_conv_suffixEq4 :
    convI headStep31_conv_suffix4 head32 = headStep31_conv_result4 := by
  exact convBlockGlue headStep31_conv_suffixEq5 headStep31_conv_blockStep4

theorem headStep31_conv_suffixEq3 :
    convI headStep31_conv_suffix3 head32 = headStep31_conv_result3 := by
  exact convBlockGlue headStep31_conv_suffixEq4 headStep31_conv_blockStep3

theorem headStep31_conv_suffixEq2 :
    convI headStep31_conv_suffix2 head32 = headStep31_conv_result2 := by
  exact convBlockGlue headStep31_conv_suffixEq3 headStep31_conv_blockStep2

theorem headStep31_conv_suffixEq1 :
    convI headStep31_conv_suffix1 head32 = headStep31_conv_result1 := by
  exact convBlockGlue headStep31_conv_suffixEq2 headStep31_conv_blockStep1

theorem headStep31_conv_suffixEq0 :
    convI headStep31_conv_suffix0 head32 = headStep31_conv_result0 := by
  exact convBlockGlue headStep31_conv_suffixEq1 headStep31_conv_blockStep0

theorem headStep31_conv_eq :
    convI ratioA head32 = headStep31_conv_result0 := by
  exact (congrArg (fun left => convI left head32) headStep31_conv_input).trans headStep31_conv_suffixEq0

theorem headStep31 :
    (addL [ofRatI c31] (convI ratioA head32)).take 170 = head31 := by
  rw [headStep31_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 123: reached headStep31"
  out.flush

theorem headEq31 :
    hornerWithTailI 170 ratioA tailI weights31 = head31 := by
  exact headGlue headEq32 headStep31

theorem headStep30_conv_suffixEq6 :
    convI headStep30_conv_suffix6 head31 = headStep30_conv_result6 := by
  rfl

theorem headStep30_conv_suffixEq5 :
    convI headStep30_conv_suffix5 head31 = headStep30_conv_result5 := by
  exact convBlockGlue headStep30_conv_suffixEq6 headStep30_conv_blockStep5

theorem headStep30_conv_suffixEq4 :
    convI headStep30_conv_suffix4 head31 = headStep30_conv_result4 := by
  exact convBlockGlue headStep30_conv_suffixEq5 headStep30_conv_blockStep4

theorem headStep30_conv_suffixEq3 :
    convI headStep30_conv_suffix3 head31 = headStep30_conv_result3 := by
  exact convBlockGlue headStep30_conv_suffixEq4 headStep30_conv_blockStep3

theorem headStep30_conv_suffixEq2 :
    convI headStep30_conv_suffix2 head31 = headStep30_conv_result2 := by
  exact convBlockGlue headStep30_conv_suffixEq3 headStep30_conv_blockStep2

theorem headStep30_conv_suffixEq1 :
    convI headStep30_conv_suffix1 head31 = headStep30_conv_result1 := by
  exact convBlockGlue headStep30_conv_suffixEq2 headStep30_conv_blockStep1

theorem headStep30_conv_suffixEq0 :
    convI headStep30_conv_suffix0 head31 = headStep30_conv_result0 := by
  exact convBlockGlue headStep30_conv_suffixEq1 headStep30_conv_blockStep0

theorem headStep30_conv_eq :
    convI ratioA head31 = headStep30_conv_result0 := by
  exact (congrArg (fun left => convI left head31) headStep30_conv_input).trans headStep30_conv_suffixEq0

theorem headStep30 :
    (addL [ofRatI c30] (convI ratioA head31)).take 170 = head30 := by
  rw [headStep30_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 124: reached headStep30"
  out.flush

theorem headEq30 :
    hornerWithTailI 170 ratioA tailI weights30 = head30 := by
  exact headGlue headEq31 headStep30

theorem headStep29_conv_suffixEq6 :
    convI headStep29_conv_suffix6 head30 = headStep29_conv_result6 := by
  rfl

theorem headStep29_conv_suffixEq5 :
    convI headStep29_conv_suffix5 head30 = headStep29_conv_result5 := by
  exact convBlockGlue headStep29_conv_suffixEq6 headStep29_conv_blockStep5

theorem headStep29_conv_suffixEq4 :
    convI headStep29_conv_suffix4 head30 = headStep29_conv_result4 := by
  exact convBlockGlue headStep29_conv_suffixEq5 headStep29_conv_blockStep4

theorem headStep29_conv_suffixEq3 :
    convI headStep29_conv_suffix3 head30 = headStep29_conv_result3 := by
  exact convBlockGlue headStep29_conv_suffixEq4 headStep29_conv_blockStep3

theorem headStep29_conv_suffixEq2 :
    convI headStep29_conv_suffix2 head30 = headStep29_conv_result2 := by
  exact convBlockGlue headStep29_conv_suffixEq3 headStep29_conv_blockStep2

theorem headStep29_conv_suffixEq1 :
    convI headStep29_conv_suffix1 head30 = headStep29_conv_result1 := by
  exact convBlockGlue headStep29_conv_suffixEq2 headStep29_conv_blockStep1

theorem headStep29_conv_suffixEq0 :
    convI headStep29_conv_suffix0 head30 = headStep29_conv_result0 := by
  exact convBlockGlue headStep29_conv_suffixEq1 headStep29_conv_blockStep0

theorem headStep29_conv_eq :
    convI ratioA head30 = headStep29_conv_result0 := by
  exact (congrArg (fun left => convI left head30) headStep29_conv_input).trans headStep29_conv_suffixEq0

theorem headStep29 :
    (addL [ofRatI c29] (convI ratioA head30)).take 170 = head29 := by
  rw [headStep29_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 125: reached headStep29"
  out.flush

theorem headEq29 :
    hornerWithTailI 170 ratioA tailI weights29 = head29 := by
  exact headGlue headEq30 headStep29

theorem headStep28_conv_suffixEq6 :
    convI headStep28_conv_suffix6 head29 = headStep28_conv_result6 := by
  rfl

theorem headStep28_conv_suffixEq5 :
    convI headStep28_conv_suffix5 head29 = headStep28_conv_result5 := by
  exact convBlockGlue headStep28_conv_suffixEq6 headStep28_conv_blockStep5

theorem headStep28_conv_suffixEq4 :
    convI headStep28_conv_suffix4 head29 = headStep28_conv_result4 := by
  exact convBlockGlue headStep28_conv_suffixEq5 headStep28_conv_blockStep4

theorem headStep28_conv_suffixEq3 :
    convI headStep28_conv_suffix3 head29 = headStep28_conv_result3 := by
  exact convBlockGlue headStep28_conv_suffixEq4 headStep28_conv_blockStep3

theorem headStep28_conv_suffixEq2 :
    convI headStep28_conv_suffix2 head29 = headStep28_conv_result2 := by
  exact convBlockGlue headStep28_conv_suffixEq3 headStep28_conv_blockStep2

theorem headStep28_conv_suffixEq1 :
    convI headStep28_conv_suffix1 head29 = headStep28_conv_result1 := by
  exact convBlockGlue headStep28_conv_suffixEq2 headStep28_conv_blockStep1

theorem headStep28_conv_suffixEq0 :
    convI headStep28_conv_suffix0 head29 = headStep28_conv_result0 := by
  exact convBlockGlue headStep28_conv_suffixEq1 headStep28_conv_blockStep0

theorem headStep28_conv_eq :
    convI ratioA head29 = headStep28_conv_result0 := by
  exact (congrArg (fun left => convI left head29) headStep28_conv_input).trans headStep28_conv_suffixEq0

theorem headStep28 :
    (addL [ofRatI c28] (convI ratioA head29)).take 170 = head28 := by
  rw [headStep28_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 126: reached headStep28"
  out.flush

theorem headEq28 :
    hornerWithTailI 170 ratioA tailI weights28 = head28 := by
  exact headGlue headEq29 headStep28

theorem headStep27_conv_suffixEq6 :
    convI headStep27_conv_suffix6 head28 = headStep27_conv_result6 := by
  rfl

theorem headStep27_conv_suffixEq5 :
    convI headStep27_conv_suffix5 head28 = headStep27_conv_result5 := by
  exact convBlockGlue headStep27_conv_suffixEq6 headStep27_conv_blockStep5

theorem headStep27_conv_suffixEq4 :
    convI headStep27_conv_suffix4 head28 = headStep27_conv_result4 := by
  exact convBlockGlue headStep27_conv_suffixEq5 headStep27_conv_blockStep4

theorem headStep27_conv_suffixEq3 :
    convI headStep27_conv_suffix3 head28 = headStep27_conv_result3 := by
  exact convBlockGlue headStep27_conv_suffixEq4 headStep27_conv_blockStep3

theorem headStep27_conv_suffixEq2 :
    convI headStep27_conv_suffix2 head28 = headStep27_conv_result2 := by
  exact convBlockGlue headStep27_conv_suffixEq3 headStep27_conv_blockStep2

theorem headStep27_conv_suffixEq1 :
    convI headStep27_conv_suffix1 head28 = headStep27_conv_result1 := by
  exact convBlockGlue headStep27_conv_suffixEq2 headStep27_conv_blockStep1

theorem headStep27_conv_suffixEq0 :
    convI headStep27_conv_suffix0 head28 = headStep27_conv_result0 := by
  exact convBlockGlue headStep27_conv_suffixEq1 headStep27_conv_blockStep0

theorem headStep27_conv_eq :
    convI ratioA head28 = headStep27_conv_result0 := by
  exact (congrArg (fun left => convI left head28) headStep27_conv_input).trans headStep27_conv_suffixEq0

theorem headStep27 :
    (addL [ofRatI c27] (convI ratioA head28)).take 170 = head27 := by
  rw [headStep27_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 127: reached headStep27"
  out.flush

theorem headEq27 :
    hornerWithTailI 170 ratioA tailI weights27 = head27 := by
  exact headGlue headEq28 headStep27

theorem headStep26_conv_suffixEq6 :
    convI headStep26_conv_suffix6 head27 = headStep26_conv_result6 := by
  rfl

theorem headStep26_conv_suffixEq5 :
    convI headStep26_conv_suffix5 head27 = headStep26_conv_result5 := by
  exact convBlockGlue headStep26_conv_suffixEq6 headStep26_conv_blockStep5

theorem headStep26_conv_suffixEq4 :
    convI headStep26_conv_suffix4 head27 = headStep26_conv_result4 := by
  exact convBlockGlue headStep26_conv_suffixEq5 headStep26_conv_blockStep4

theorem headStep26_conv_suffixEq3 :
    convI headStep26_conv_suffix3 head27 = headStep26_conv_result3 := by
  exact convBlockGlue headStep26_conv_suffixEq4 headStep26_conv_blockStep3

theorem headStep26_conv_suffixEq2 :
    convI headStep26_conv_suffix2 head27 = headStep26_conv_result2 := by
  exact convBlockGlue headStep26_conv_suffixEq3 headStep26_conv_blockStep2

theorem headStep26_conv_suffixEq1 :
    convI headStep26_conv_suffix1 head27 = headStep26_conv_result1 := by
  exact convBlockGlue headStep26_conv_suffixEq2 headStep26_conv_blockStep1

theorem headStep26_conv_suffixEq0 :
    convI headStep26_conv_suffix0 head27 = headStep26_conv_result0 := by
  exact convBlockGlue headStep26_conv_suffixEq1 headStep26_conv_blockStep0

theorem headStep26_conv_eq :
    convI ratioA head27 = headStep26_conv_result0 := by
  exact (congrArg (fun left => convI left head27) headStep26_conv_input).trans headStep26_conv_suffixEq0

theorem headStep26 :
    (addL [ofRatI c26] (convI ratioA head27)).take 170 = head26 := by
  rw [headStep26_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 128: reached headStep26"
  out.flush

theorem headEq26 :
    hornerWithTailI 170 ratioA tailI weights26 = head26 := by
  exact headGlue headEq27 headStep26

theorem headStep25_conv_suffixEq6 :
    convI headStep25_conv_suffix6 head26 = headStep25_conv_result6 := by
  rfl

theorem headStep25_conv_suffixEq5 :
    convI headStep25_conv_suffix5 head26 = headStep25_conv_result5 := by
  exact convBlockGlue headStep25_conv_suffixEq6 headStep25_conv_blockStep5

theorem headStep25_conv_suffixEq4 :
    convI headStep25_conv_suffix4 head26 = headStep25_conv_result4 := by
  exact convBlockGlue headStep25_conv_suffixEq5 headStep25_conv_blockStep4

theorem headStep25_conv_suffixEq3 :
    convI headStep25_conv_suffix3 head26 = headStep25_conv_result3 := by
  exact convBlockGlue headStep25_conv_suffixEq4 headStep25_conv_blockStep3

theorem headStep25_conv_suffixEq2 :
    convI headStep25_conv_suffix2 head26 = headStep25_conv_result2 := by
  exact convBlockGlue headStep25_conv_suffixEq3 headStep25_conv_blockStep2

theorem headStep25_conv_suffixEq1 :
    convI headStep25_conv_suffix1 head26 = headStep25_conv_result1 := by
  exact convBlockGlue headStep25_conv_suffixEq2 headStep25_conv_blockStep1

theorem headStep25_conv_suffixEq0 :
    convI headStep25_conv_suffix0 head26 = headStep25_conv_result0 := by
  exact convBlockGlue headStep25_conv_suffixEq1 headStep25_conv_blockStep0

theorem headStep25_conv_eq :
    convI ratioA head26 = headStep25_conv_result0 := by
  exact (congrArg (fun left => convI left head26) headStep25_conv_input).trans headStep25_conv_suffixEq0

theorem headStep25 :
    (addL [ofRatI c25] (convI ratioA head26)).take 170 = head25 := by
  rw [headStep25_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 129: reached headStep25"
  out.flush

theorem headEq25 :
    hornerWithTailI 170 ratioA tailI weights25 = head25 := by
  exact headGlue headEq26 headStep25

theorem headStep24_conv_suffixEq6 :
    convI headStep24_conv_suffix6 head25 = headStep24_conv_result6 := by
  rfl

theorem headStep24_conv_suffixEq5 :
    convI headStep24_conv_suffix5 head25 = headStep24_conv_result5 := by
  exact convBlockGlue headStep24_conv_suffixEq6 headStep24_conv_blockStep5

theorem headStep24_conv_suffixEq4 :
    convI headStep24_conv_suffix4 head25 = headStep24_conv_result4 := by
  exact convBlockGlue headStep24_conv_suffixEq5 headStep24_conv_blockStep4

theorem headStep24_conv_suffixEq3 :
    convI headStep24_conv_suffix3 head25 = headStep24_conv_result3 := by
  exact convBlockGlue headStep24_conv_suffixEq4 headStep24_conv_blockStep3

theorem headStep24_conv_suffixEq2 :
    convI headStep24_conv_suffix2 head25 = headStep24_conv_result2 := by
  exact convBlockGlue headStep24_conv_suffixEq3 headStep24_conv_blockStep2

theorem headStep24_conv_suffixEq1 :
    convI headStep24_conv_suffix1 head25 = headStep24_conv_result1 := by
  exact convBlockGlue headStep24_conv_suffixEq2 headStep24_conv_blockStep1

theorem headStep24_conv_suffixEq0 :
    convI headStep24_conv_suffix0 head25 = headStep24_conv_result0 := by
  exact convBlockGlue headStep24_conv_suffixEq1 headStep24_conv_blockStep0

theorem headStep24_conv_eq :
    convI ratioA head25 = headStep24_conv_result0 := by
  exact (congrArg (fun left => convI left head25) headStep24_conv_input).trans headStep24_conv_suffixEq0

theorem headStep24 :
    (addL [ofRatI c24] (convI ratioA head25)).take 170 = head24 := by
  rw [headStep24_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 130: reached headStep24"
  out.flush

theorem headEq24 :
    hornerWithTailI 170 ratioA tailI weights24 = head24 := by
  exact headGlue headEq25 headStep24

theorem headStep23_conv_suffixEq6 :
    convI headStep23_conv_suffix6 head24 = headStep23_conv_result6 := by
  rfl

theorem headStep23_conv_suffixEq5 :
    convI headStep23_conv_suffix5 head24 = headStep23_conv_result5 := by
  exact convBlockGlue headStep23_conv_suffixEq6 headStep23_conv_blockStep5

theorem headStep23_conv_suffixEq4 :
    convI headStep23_conv_suffix4 head24 = headStep23_conv_result4 := by
  exact convBlockGlue headStep23_conv_suffixEq5 headStep23_conv_blockStep4

theorem headStep23_conv_suffixEq3 :
    convI headStep23_conv_suffix3 head24 = headStep23_conv_result3 := by
  exact convBlockGlue headStep23_conv_suffixEq4 headStep23_conv_blockStep3

theorem headStep23_conv_suffixEq2 :
    convI headStep23_conv_suffix2 head24 = headStep23_conv_result2 := by
  exact convBlockGlue headStep23_conv_suffixEq3 headStep23_conv_blockStep2

theorem headStep23_conv_suffixEq1 :
    convI headStep23_conv_suffix1 head24 = headStep23_conv_result1 := by
  exact convBlockGlue headStep23_conv_suffixEq2 headStep23_conv_blockStep1

theorem headStep23_conv_suffixEq0 :
    convI headStep23_conv_suffix0 head24 = headStep23_conv_result0 := by
  exact convBlockGlue headStep23_conv_suffixEq1 headStep23_conv_blockStep0

theorem headStep23_conv_eq :
    convI ratioA head24 = headStep23_conv_result0 := by
  exact (congrArg (fun left => convI left head24) headStep23_conv_input).trans headStep23_conv_suffixEq0

theorem headStep23 :
    (addL [ofRatI c23] (convI ratioA head24)).take 170 = head23 := by
  rw [headStep23_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 131: reached headStep23"
  out.flush

theorem headEq23 :
    hornerWithTailI 170 ratioA tailI weights23 = head23 := by
  exact headGlue headEq24 headStep23

theorem headStep22_conv_suffixEq6 :
    convI headStep22_conv_suffix6 head23 = headStep22_conv_result6 := by
  rfl

theorem headStep22_conv_suffixEq5 :
    convI headStep22_conv_suffix5 head23 = headStep22_conv_result5 := by
  exact convBlockGlue headStep22_conv_suffixEq6 headStep22_conv_blockStep5

theorem headStep22_conv_suffixEq4 :
    convI headStep22_conv_suffix4 head23 = headStep22_conv_result4 := by
  exact convBlockGlue headStep22_conv_suffixEq5 headStep22_conv_blockStep4

theorem headStep22_conv_suffixEq3 :
    convI headStep22_conv_suffix3 head23 = headStep22_conv_result3 := by
  exact convBlockGlue headStep22_conv_suffixEq4 headStep22_conv_blockStep3

theorem headStep22_conv_suffixEq2 :
    convI headStep22_conv_suffix2 head23 = headStep22_conv_result2 := by
  exact convBlockGlue headStep22_conv_suffixEq3 headStep22_conv_blockStep2

theorem headStep22_conv_suffixEq1 :
    convI headStep22_conv_suffix1 head23 = headStep22_conv_result1 := by
  exact convBlockGlue headStep22_conv_suffixEq2 headStep22_conv_blockStep1

theorem headStep22_conv_suffixEq0 :
    convI headStep22_conv_suffix0 head23 = headStep22_conv_result0 := by
  exact convBlockGlue headStep22_conv_suffixEq1 headStep22_conv_blockStep0

theorem headStep22_conv_eq :
    convI ratioA head23 = headStep22_conv_result0 := by
  exact (congrArg (fun left => convI left head23) headStep22_conv_input).trans headStep22_conv_suffixEq0

theorem headStep22 :
    (addL [ofRatI c22] (convI ratioA head23)).take 170 = head22 := by
  rw [headStep22_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 132: reached headStep22"
  out.flush

theorem headEq22 :
    hornerWithTailI 170 ratioA tailI weights22 = head22 := by
  exact headGlue headEq23 headStep22

theorem headStep21_conv_suffixEq6 :
    convI headStep21_conv_suffix6 head22 = headStep21_conv_result6 := by
  rfl

theorem headStep21_conv_suffixEq5 :
    convI headStep21_conv_suffix5 head22 = headStep21_conv_result5 := by
  exact convBlockGlue headStep21_conv_suffixEq6 headStep21_conv_blockStep5

theorem headStep21_conv_suffixEq4 :
    convI headStep21_conv_suffix4 head22 = headStep21_conv_result4 := by
  exact convBlockGlue headStep21_conv_suffixEq5 headStep21_conv_blockStep4

theorem headStep21_conv_suffixEq3 :
    convI headStep21_conv_suffix3 head22 = headStep21_conv_result3 := by
  exact convBlockGlue headStep21_conv_suffixEq4 headStep21_conv_blockStep3

theorem headStep21_conv_suffixEq2 :
    convI headStep21_conv_suffix2 head22 = headStep21_conv_result2 := by
  exact convBlockGlue headStep21_conv_suffixEq3 headStep21_conv_blockStep2

theorem headStep21_conv_suffixEq1 :
    convI headStep21_conv_suffix1 head22 = headStep21_conv_result1 := by
  exact convBlockGlue headStep21_conv_suffixEq2 headStep21_conv_blockStep1

theorem headStep21_conv_suffixEq0 :
    convI headStep21_conv_suffix0 head22 = headStep21_conv_result0 := by
  exact convBlockGlue headStep21_conv_suffixEq1 headStep21_conv_blockStep0

theorem headStep21_conv_eq :
    convI ratioA head22 = headStep21_conv_result0 := by
  exact (congrArg (fun left => convI left head22) headStep21_conv_input).trans headStep21_conv_suffixEq0

theorem headStep21 :
    (addL [ofRatI c21] (convI ratioA head22)).take 170 = head21 := by
  rw [headStep21_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 133: reached headStep21"
  out.flush

theorem headEq21 :
    hornerWithTailI 170 ratioA tailI weights21 = head21 := by
  exact headGlue headEq22 headStep21

theorem headStep20_conv_suffixEq6 :
    convI headStep20_conv_suffix6 head21 = headStep20_conv_result6 := by
  rfl

theorem headStep20_conv_suffixEq5 :
    convI headStep20_conv_suffix5 head21 = headStep20_conv_result5 := by
  exact convBlockGlue headStep20_conv_suffixEq6 headStep20_conv_blockStep5

theorem headStep20_conv_suffixEq4 :
    convI headStep20_conv_suffix4 head21 = headStep20_conv_result4 := by
  exact convBlockGlue headStep20_conv_suffixEq5 headStep20_conv_blockStep4

theorem headStep20_conv_suffixEq3 :
    convI headStep20_conv_suffix3 head21 = headStep20_conv_result3 := by
  exact convBlockGlue headStep20_conv_suffixEq4 headStep20_conv_blockStep3

theorem headStep20_conv_suffixEq2 :
    convI headStep20_conv_suffix2 head21 = headStep20_conv_result2 := by
  exact convBlockGlue headStep20_conv_suffixEq3 headStep20_conv_blockStep2

theorem headStep20_conv_suffixEq1 :
    convI headStep20_conv_suffix1 head21 = headStep20_conv_result1 := by
  exact convBlockGlue headStep20_conv_suffixEq2 headStep20_conv_blockStep1

theorem headStep20_conv_suffixEq0 :
    convI headStep20_conv_suffix0 head21 = headStep20_conv_result0 := by
  exact convBlockGlue headStep20_conv_suffixEq1 headStep20_conv_blockStep0

theorem headStep20_conv_eq :
    convI ratioA head21 = headStep20_conv_result0 := by
  exact (congrArg (fun left => convI left head21) headStep20_conv_input).trans headStep20_conv_suffixEq0

theorem headStep20 :
    (addL [ofRatI c20] (convI ratioA head21)).take 170 = head20 := by
  rw [headStep20_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 134: reached headStep20"
  out.flush

theorem headEq20 :
    hornerWithTailI 170 ratioA tailI weights20 = head20 := by
  exact headGlue headEq21 headStep20

theorem headStep19_conv_suffixEq6 :
    convI headStep19_conv_suffix6 head20 = headStep19_conv_result6 := by
  rfl

theorem headStep19_conv_suffixEq5 :
    convI headStep19_conv_suffix5 head20 = headStep19_conv_result5 := by
  exact convBlockGlue headStep19_conv_suffixEq6 headStep19_conv_blockStep5

theorem headStep19_conv_suffixEq4 :
    convI headStep19_conv_suffix4 head20 = headStep19_conv_result4 := by
  exact convBlockGlue headStep19_conv_suffixEq5 headStep19_conv_blockStep4

theorem headStep19_conv_suffixEq3 :
    convI headStep19_conv_suffix3 head20 = headStep19_conv_result3 := by
  exact convBlockGlue headStep19_conv_suffixEq4 headStep19_conv_blockStep3

theorem headStep19_conv_suffixEq2 :
    convI headStep19_conv_suffix2 head20 = headStep19_conv_result2 := by
  exact convBlockGlue headStep19_conv_suffixEq3 headStep19_conv_blockStep2

theorem headStep19_conv_suffixEq1 :
    convI headStep19_conv_suffix1 head20 = headStep19_conv_result1 := by
  exact convBlockGlue headStep19_conv_suffixEq2 headStep19_conv_blockStep1

theorem headStep19_conv_suffixEq0 :
    convI headStep19_conv_suffix0 head20 = headStep19_conv_result0 := by
  exact convBlockGlue headStep19_conv_suffixEq1 headStep19_conv_blockStep0

theorem headStep19_conv_eq :
    convI ratioA head20 = headStep19_conv_result0 := by
  exact (congrArg (fun left => convI left head20) headStep19_conv_input).trans headStep19_conv_suffixEq0

theorem headStep19 :
    (addL [ofRatI c19] (convI ratioA head20)).take 170 = head19 := by
  rw [headStep19_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 135: reached headStep19"
  out.flush

theorem headEq19 :
    hornerWithTailI 170 ratioA tailI weights19 = head19 := by
  exact headGlue headEq20 headStep19

theorem headStep18_conv_suffixEq6 :
    convI headStep18_conv_suffix6 head19 = headStep18_conv_result6 := by
  rfl

theorem headStep18_conv_suffixEq5 :
    convI headStep18_conv_suffix5 head19 = headStep18_conv_result5 := by
  exact convBlockGlue headStep18_conv_suffixEq6 headStep18_conv_blockStep5

theorem headStep18_conv_suffixEq4 :
    convI headStep18_conv_suffix4 head19 = headStep18_conv_result4 := by
  exact convBlockGlue headStep18_conv_suffixEq5 headStep18_conv_blockStep4

theorem headStep18_conv_suffixEq3 :
    convI headStep18_conv_suffix3 head19 = headStep18_conv_result3 := by
  exact convBlockGlue headStep18_conv_suffixEq4 headStep18_conv_blockStep3

theorem headStep18_conv_suffixEq2 :
    convI headStep18_conv_suffix2 head19 = headStep18_conv_result2 := by
  exact convBlockGlue headStep18_conv_suffixEq3 headStep18_conv_blockStep2

theorem headStep18_conv_suffixEq1 :
    convI headStep18_conv_suffix1 head19 = headStep18_conv_result1 := by
  exact convBlockGlue headStep18_conv_suffixEq2 headStep18_conv_blockStep1

theorem headStep18_conv_suffixEq0 :
    convI headStep18_conv_suffix0 head19 = headStep18_conv_result0 := by
  exact convBlockGlue headStep18_conv_suffixEq1 headStep18_conv_blockStep0

theorem headStep18_conv_eq :
    convI ratioA head19 = headStep18_conv_result0 := by
  exact (congrArg (fun left => convI left head19) headStep18_conv_input).trans headStep18_conv_suffixEq0

theorem headStep18 :
    (addL [ofRatI c18] (convI ratioA head19)).take 170 = head18 := by
  rw [headStep18_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 136: reached headStep18"
  out.flush

theorem headEq18 :
    hornerWithTailI 170 ratioA tailI weights18 = head18 := by
  exact headGlue headEq19 headStep18

theorem headStep17_conv_suffixEq6 :
    convI headStep17_conv_suffix6 head18 = headStep17_conv_result6 := by
  rfl

theorem headStep17_conv_suffixEq5 :
    convI headStep17_conv_suffix5 head18 = headStep17_conv_result5 := by
  exact convBlockGlue headStep17_conv_suffixEq6 headStep17_conv_blockStep5

theorem headStep17_conv_suffixEq4 :
    convI headStep17_conv_suffix4 head18 = headStep17_conv_result4 := by
  exact convBlockGlue headStep17_conv_suffixEq5 headStep17_conv_blockStep4

theorem headStep17_conv_suffixEq3 :
    convI headStep17_conv_suffix3 head18 = headStep17_conv_result3 := by
  exact convBlockGlue headStep17_conv_suffixEq4 headStep17_conv_blockStep3

theorem headStep17_conv_suffixEq2 :
    convI headStep17_conv_suffix2 head18 = headStep17_conv_result2 := by
  exact convBlockGlue headStep17_conv_suffixEq3 headStep17_conv_blockStep2

theorem headStep17_conv_suffixEq1 :
    convI headStep17_conv_suffix1 head18 = headStep17_conv_result1 := by
  exact convBlockGlue headStep17_conv_suffixEq2 headStep17_conv_blockStep1

theorem headStep17_conv_suffixEq0 :
    convI headStep17_conv_suffix0 head18 = headStep17_conv_result0 := by
  exact convBlockGlue headStep17_conv_suffixEq1 headStep17_conv_blockStep0

theorem headStep17_conv_eq :
    convI ratioA head18 = headStep17_conv_result0 := by
  exact (congrArg (fun left => convI left head18) headStep17_conv_input).trans headStep17_conv_suffixEq0

theorem headStep17 :
    (addL [ofRatI c17] (convI ratioA head18)).take 170 = head17 := by
  rw [headStep17_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 137: reached headStep17"
  out.flush

theorem headEq17 :
    hornerWithTailI 170 ratioA tailI weights17 = head17 := by
  exact headGlue headEq18 headStep17

theorem headStep16_conv_suffixEq6 :
    convI headStep16_conv_suffix6 head17 = headStep16_conv_result6 := by
  rfl

theorem headStep16_conv_suffixEq5 :
    convI headStep16_conv_suffix5 head17 = headStep16_conv_result5 := by
  exact convBlockGlue headStep16_conv_suffixEq6 headStep16_conv_blockStep5

theorem headStep16_conv_suffixEq4 :
    convI headStep16_conv_suffix4 head17 = headStep16_conv_result4 := by
  exact convBlockGlue headStep16_conv_suffixEq5 headStep16_conv_blockStep4

theorem headStep16_conv_suffixEq3 :
    convI headStep16_conv_suffix3 head17 = headStep16_conv_result3 := by
  exact convBlockGlue headStep16_conv_suffixEq4 headStep16_conv_blockStep3

theorem headStep16_conv_suffixEq2 :
    convI headStep16_conv_suffix2 head17 = headStep16_conv_result2 := by
  exact convBlockGlue headStep16_conv_suffixEq3 headStep16_conv_blockStep2

theorem headStep16_conv_suffixEq1 :
    convI headStep16_conv_suffix1 head17 = headStep16_conv_result1 := by
  exact convBlockGlue headStep16_conv_suffixEq2 headStep16_conv_blockStep1

theorem headStep16_conv_suffixEq0 :
    convI headStep16_conv_suffix0 head17 = headStep16_conv_result0 := by
  exact convBlockGlue headStep16_conv_suffixEq1 headStep16_conv_blockStep0

theorem headStep16_conv_eq :
    convI ratioA head17 = headStep16_conv_result0 := by
  exact (congrArg (fun left => convI left head17) headStep16_conv_input).trans headStep16_conv_suffixEq0

theorem headStep16 :
    (addL [ofRatI c16] (convI ratioA head17)).take 170 = head16 := by
  rw [headStep16_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 138: reached headStep16"
  out.flush

theorem headEq16 :
    hornerWithTailI 170 ratioA tailI weights16 = head16 := by
  exact headGlue headEq17 headStep16

theorem headStep15_conv_suffixEq6 :
    convI headStep15_conv_suffix6 head16 = headStep15_conv_result6 := by
  rfl

theorem headStep15_conv_suffixEq5 :
    convI headStep15_conv_suffix5 head16 = headStep15_conv_result5 := by
  exact convBlockGlue headStep15_conv_suffixEq6 headStep15_conv_blockStep5

theorem headStep15_conv_suffixEq4 :
    convI headStep15_conv_suffix4 head16 = headStep15_conv_result4 := by
  exact convBlockGlue headStep15_conv_suffixEq5 headStep15_conv_blockStep4

theorem headStep15_conv_suffixEq3 :
    convI headStep15_conv_suffix3 head16 = headStep15_conv_result3 := by
  exact convBlockGlue headStep15_conv_suffixEq4 headStep15_conv_blockStep3

theorem headStep15_conv_suffixEq2 :
    convI headStep15_conv_suffix2 head16 = headStep15_conv_result2 := by
  exact convBlockGlue headStep15_conv_suffixEq3 headStep15_conv_blockStep2

theorem headStep15_conv_suffixEq1 :
    convI headStep15_conv_suffix1 head16 = headStep15_conv_result1 := by
  exact convBlockGlue headStep15_conv_suffixEq2 headStep15_conv_blockStep1

theorem headStep15_conv_suffixEq0 :
    convI headStep15_conv_suffix0 head16 = headStep15_conv_result0 := by
  exact convBlockGlue headStep15_conv_suffixEq1 headStep15_conv_blockStep0

theorem headStep15_conv_eq :
    convI ratioA head16 = headStep15_conv_result0 := by
  exact (congrArg (fun left => convI left head16) headStep15_conv_input).trans headStep15_conv_suffixEq0

theorem headStep15 :
    (addL [ofRatI c15] (convI ratioA head16)).take 170 = head15 := by
  rw [headStep15_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 139: reached headStep15"
  out.flush

theorem headEq15 :
    hornerWithTailI 170 ratioA tailI weights15 = head15 := by
  exact headGlue headEq16 headStep15

theorem headStep14_conv_suffixEq6 :
    convI headStep14_conv_suffix6 head15 = headStep14_conv_result6 := by
  rfl

theorem headStep14_conv_suffixEq5 :
    convI headStep14_conv_suffix5 head15 = headStep14_conv_result5 := by
  exact convBlockGlue headStep14_conv_suffixEq6 headStep14_conv_blockStep5

theorem headStep14_conv_suffixEq4 :
    convI headStep14_conv_suffix4 head15 = headStep14_conv_result4 := by
  exact convBlockGlue headStep14_conv_suffixEq5 headStep14_conv_blockStep4

theorem headStep14_conv_suffixEq3 :
    convI headStep14_conv_suffix3 head15 = headStep14_conv_result3 := by
  exact convBlockGlue headStep14_conv_suffixEq4 headStep14_conv_blockStep3

theorem headStep14_conv_suffixEq2 :
    convI headStep14_conv_suffix2 head15 = headStep14_conv_result2 := by
  exact convBlockGlue headStep14_conv_suffixEq3 headStep14_conv_blockStep2

theorem headStep14_conv_suffixEq1 :
    convI headStep14_conv_suffix1 head15 = headStep14_conv_result1 := by
  exact convBlockGlue headStep14_conv_suffixEq2 headStep14_conv_blockStep1

theorem headStep14_conv_suffixEq0 :
    convI headStep14_conv_suffix0 head15 = headStep14_conv_result0 := by
  exact convBlockGlue headStep14_conv_suffixEq1 headStep14_conv_blockStep0

theorem headStep14_conv_eq :
    convI ratioA head15 = headStep14_conv_result0 := by
  exact (congrArg (fun left => convI left head15) headStep14_conv_input).trans headStep14_conv_suffixEq0

theorem headStep14 :
    (addL [ofRatI c14] (convI ratioA head15)).take 170 = head14 := by
  rw [headStep14_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 140: reached headStep14"
  out.flush

theorem headEq14 :
    hornerWithTailI 170 ratioA tailI weights14 = head14 := by
  exact headGlue headEq15 headStep14

theorem headStep13_conv_suffixEq6 :
    convI headStep13_conv_suffix6 head14 = headStep13_conv_result6 := by
  rfl

theorem headStep13_conv_suffixEq5 :
    convI headStep13_conv_suffix5 head14 = headStep13_conv_result5 := by
  exact convBlockGlue headStep13_conv_suffixEq6 headStep13_conv_blockStep5

theorem headStep13_conv_suffixEq4 :
    convI headStep13_conv_suffix4 head14 = headStep13_conv_result4 := by
  exact convBlockGlue headStep13_conv_suffixEq5 headStep13_conv_blockStep4

theorem headStep13_conv_suffixEq3 :
    convI headStep13_conv_suffix3 head14 = headStep13_conv_result3 := by
  exact convBlockGlue headStep13_conv_suffixEq4 headStep13_conv_blockStep3

theorem headStep13_conv_suffixEq2 :
    convI headStep13_conv_suffix2 head14 = headStep13_conv_result2 := by
  exact convBlockGlue headStep13_conv_suffixEq3 headStep13_conv_blockStep2

theorem headStep13_conv_suffixEq1 :
    convI headStep13_conv_suffix1 head14 = headStep13_conv_result1 := by
  exact convBlockGlue headStep13_conv_suffixEq2 headStep13_conv_blockStep1

theorem headStep13_conv_suffixEq0 :
    convI headStep13_conv_suffix0 head14 = headStep13_conv_result0 := by
  exact convBlockGlue headStep13_conv_suffixEq1 headStep13_conv_blockStep0

theorem headStep13_conv_eq :
    convI ratioA head14 = headStep13_conv_result0 := by
  exact (congrArg (fun left => convI left head14) headStep13_conv_input).trans headStep13_conv_suffixEq0

theorem headStep13 :
    (addL [ofRatI c13] (convI ratioA head14)).take 170 = head13 := by
  rw [headStep13_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 141: reached headStep13"
  out.flush

theorem headEq13 :
    hornerWithTailI 170 ratioA tailI weights13 = head13 := by
  exact headGlue headEq14 headStep13

theorem headStep12_conv_suffixEq6 :
    convI headStep12_conv_suffix6 head13 = headStep12_conv_result6 := by
  rfl

theorem headStep12_conv_suffixEq5 :
    convI headStep12_conv_suffix5 head13 = headStep12_conv_result5 := by
  exact convBlockGlue headStep12_conv_suffixEq6 headStep12_conv_blockStep5

theorem headStep12_conv_suffixEq4 :
    convI headStep12_conv_suffix4 head13 = headStep12_conv_result4 := by
  exact convBlockGlue headStep12_conv_suffixEq5 headStep12_conv_blockStep4

theorem headStep12_conv_suffixEq3 :
    convI headStep12_conv_suffix3 head13 = headStep12_conv_result3 := by
  exact convBlockGlue headStep12_conv_suffixEq4 headStep12_conv_blockStep3

theorem headStep12_conv_suffixEq2 :
    convI headStep12_conv_suffix2 head13 = headStep12_conv_result2 := by
  exact convBlockGlue headStep12_conv_suffixEq3 headStep12_conv_blockStep2

theorem headStep12_conv_suffixEq1 :
    convI headStep12_conv_suffix1 head13 = headStep12_conv_result1 := by
  exact convBlockGlue headStep12_conv_suffixEq2 headStep12_conv_blockStep1

theorem headStep12_conv_suffixEq0 :
    convI headStep12_conv_suffix0 head13 = headStep12_conv_result0 := by
  exact convBlockGlue headStep12_conv_suffixEq1 headStep12_conv_blockStep0

theorem headStep12_conv_eq :
    convI ratioA head13 = headStep12_conv_result0 := by
  exact (congrArg (fun left => convI left head13) headStep12_conv_input).trans headStep12_conv_suffixEq0

theorem headStep12 :
    (addL [ofRatI c12] (convI ratioA head13)).take 170 = head12 := by
  rw [headStep12_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 142: reached headStep12"
  out.flush

theorem headEq12 :
    hornerWithTailI 170 ratioA tailI weights12 = head12 := by
  exact headGlue headEq13 headStep12

theorem headStep11_conv_suffixEq6 :
    convI headStep11_conv_suffix6 head12 = headStep11_conv_result6 := by
  rfl

theorem headStep11_conv_suffixEq5 :
    convI headStep11_conv_suffix5 head12 = headStep11_conv_result5 := by
  exact convBlockGlue headStep11_conv_suffixEq6 headStep11_conv_blockStep5

theorem headStep11_conv_suffixEq4 :
    convI headStep11_conv_suffix4 head12 = headStep11_conv_result4 := by
  exact convBlockGlue headStep11_conv_suffixEq5 headStep11_conv_blockStep4

theorem headStep11_conv_suffixEq3 :
    convI headStep11_conv_suffix3 head12 = headStep11_conv_result3 := by
  exact convBlockGlue headStep11_conv_suffixEq4 headStep11_conv_blockStep3

theorem headStep11_conv_suffixEq2 :
    convI headStep11_conv_suffix2 head12 = headStep11_conv_result2 := by
  exact convBlockGlue headStep11_conv_suffixEq3 headStep11_conv_blockStep2

theorem headStep11_conv_suffixEq1 :
    convI headStep11_conv_suffix1 head12 = headStep11_conv_result1 := by
  exact convBlockGlue headStep11_conv_suffixEq2 headStep11_conv_blockStep1

theorem headStep11_conv_suffixEq0 :
    convI headStep11_conv_suffix0 head12 = headStep11_conv_result0 := by
  exact convBlockGlue headStep11_conv_suffixEq1 headStep11_conv_blockStep0

theorem headStep11_conv_eq :
    convI ratioA head12 = headStep11_conv_result0 := by
  exact (congrArg (fun left => convI left head12) headStep11_conv_input).trans headStep11_conv_suffixEq0

theorem headStep11 :
    (addL [ofRatI c11] (convI ratioA head12)).take 170 = head11 := by
  rw [headStep11_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 143: reached headStep11"
  out.flush

theorem headEq11 :
    hornerWithTailI 170 ratioA tailI weights11 = head11 := by
  exact headGlue headEq12 headStep11

theorem headStep10_conv_suffixEq6 :
    convI headStep10_conv_suffix6 head11 = headStep10_conv_result6 := by
  rfl

theorem headStep10_conv_suffixEq5 :
    convI headStep10_conv_suffix5 head11 = headStep10_conv_result5 := by
  exact convBlockGlue headStep10_conv_suffixEq6 headStep10_conv_blockStep5

theorem headStep10_conv_suffixEq4 :
    convI headStep10_conv_suffix4 head11 = headStep10_conv_result4 := by
  exact convBlockGlue headStep10_conv_suffixEq5 headStep10_conv_blockStep4

theorem headStep10_conv_suffixEq3 :
    convI headStep10_conv_suffix3 head11 = headStep10_conv_result3 := by
  exact convBlockGlue headStep10_conv_suffixEq4 headStep10_conv_blockStep3

theorem headStep10_conv_suffixEq2 :
    convI headStep10_conv_suffix2 head11 = headStep10_conv_result2 := by
  exact convBlockGlue headStep10_conv_suffixEq3 headStep10_conv_blockStep2

theorem headStep10_conv_suffixEq1 :
    convI headStep10_conv_suffix1 head11 = headStep10_conv_result1 := by
  exact convBlockGlue headStep10_conv_suffixEq2 headStep10_conv_blockStep1

theorem headStep10_conv_suffixEq0 :
    convI headStep10_conv_suffix0 head11 = headStep10_conv_result0 := by
  exact convBlockGlue headStep10_conv_suffixEq1 headStep10_conv_blockStep0

theorem headStep10_conv_eq :
    convI ratioA head11 = headStep10_conv_result0 := by
  exact (congrArg (fun left => convI left head11) headStep10_conv_input).trans headStep10_conv_suffixEq0

theorem headStep10 :
    (addL [ofRatI c10] (convI ratioA head11)).take 170 = head10 := by
  rw [headStep10_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 144: reached headStep10"
  out.flush

theorem headEq10 :
    hornerWithTailI 170 ratioA tailI weights10 = head10 := by
  exact headGlue headEq11 headStep10

theorem headStep9_conv_suffixEq6 :
    convI headStep9_conv_suffix6 head10 = headStep9_conv_result6 := by
  rfl

theorem headStep9_conv_suffixEq5 :
    convI headStep9_conv_suffix5 head10 = headStep9_conv_result5 := by
  exact convBlockGlue headStep9_conv_suffixEq6 headStep9_conv_blockStep5

theorem headStep9_conv_suffixEq4 :
    convI headStep9_conv_suffix4 head10 = headStep9_conv_result4 := by
  exact convBlockGlue headStep9_conv_suffixEq5 headStep9_conv_blockStep4

theorem headStep9_conv_suffixEq3 :
    convI headStep9_conv_suffix3 head10 = headStep9_conv_result3 := by
  exact convBlockGlue headStep9_conv_suffixEq4 headStep9_conv_blockStep3

theorem headStep9_conv_suffixEq2 :
    convI headStep9_conv_suffix2 head10 = headStep9_conv_result2 := by
  exact convBlockGlue headStep9_conv_suffixEq3 headStep9_conv_blockStep2

theorem headStep9_conv_suffixEq1 :
    convI headStep9_conv_suffix1 head10 = headStep9_conv_result1 := by
  exact convBlockGlue headStep9_conv_suffixEq2 headStep9_conv_blockStep1

theorem headStep9_conv_suffixEq0 :
    convI headStep9_conv_suffix0 head10 = headStep9_conv_result0 := by
  exact convBlockGlue headStep9_conv_suffixEq1 headStep9_conv_blockStep0

theorem headStep9_conv_eq :
    convI ratioA head10 = headStep9_conv_result0 := by
  exact (congrArg (fun left => convI left head10) headStep9_conv_input).trans headStep9_conv_suffixEq0

theorem headStep9 :
    (addL [ofRatI c9] (convI ratioA head10)).take 170 = head9 := by
  rw [headStep9_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 145: reached headStep9"
  out.flush

theorem headEq9 :
    hornerWithTailI 170 ratioA tailI weights9 = head9 := by
  exact headGlue headEq10 headStep9

theorem headStep8_conv_suffixEq6 :
    convI headStep8_conv_suffix6 head9 = headStep8_conv_result6 := by
  rfl

theorem headStep8_conv_suffixEq5 :
    convI headStep8_conv_suffix5 head9 = headStep8_conv_result5 := by
  exact convBlockGlue headStep8_conv_suffixEq6 headStep8_conv_blockStep5

theorem headStep8_conv_suffixEq4 :
    convI headStep8_conv_suffix4 head9 = headStep8_conv_result4 := by
  exact convBlockGlue headStep8_conv_suffixEq5 headStep8_conv_blockStep4

theorem headStep8_conv_suffixEq3 :
    convI headStep8_conv_suffix3 head9 = headStep8_conv_result3 := by
  exact convBlockGlue headStep8_conv_suffixEq4 headStep8_conv_blockStep3

theorem headStep8_conv_suffixEq2 :
    convI headStep8_conv_suffix2 head9 = headStep8_conv_result2 := by
  exact convBlockGlue headStep8_conv_suffixEq3 headStep8_conv_blockStep2

theorem headStep8_conv_suffixEq1 :
    convI headStep8_conv_suffix1 head9 = headStep8_conv_result1 := by
  exact convBlockGlue headStep8_conv_suffixEq2 headStep8_conv_blockStep1

theorem headStep8_conv_suffixEq0 :
    convI headStep8_conv_suffix0 head9 = headStep8_conv_result0 := by
  exact convBlockGlue headStep8_conv_suffixEq1 headStep8_conv_blockStep0

theorem headStep8_conv_eq :
    convI ratioA head9 = headStep8_conv_result0 := by
  exact (congrArg (fun left => convI left head9) headStep8_conv_input).trans headStep8_conv_suffixEq0

theorem headStep8 :
    (addL [ofRatI c8] (convI ratioA head9)).take 170 = head8 := by
  rw [headStep8_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 146: reached headStep8"
  out.flush

theorem headEq8 :
    hornerWithTailI 170 ratioA tailI weights8 = head8 := by
  exact headGlue headEq9 headStep8

theorem headStep7_conv_suffixEq6 :
    convI headStep7_conv_suffix6 head8 = headStep7_conv_result6 := by
  rfl

theorem headStep7_conv_suffixEq5 :
    convI headStep7_conv_suffix5 head8 = headStep7_conv_result5 := by
  exact convBlockGlue headStep7_conv_suffixEq6 headStep7_conv_blockStep5

theorem headStep7_conv_suffixEq4 :
    convI headStep7_conv_suffix4 head8 = headStep7_conv_result4 := by
  exact convBlockGlue headStep7_conv_suffixEq5 headStep7_conv_blockStep4

theorem headStep7_conv_suffixEq3 :
    convI headStep7_conv_suffix3 head8 = headStep7_conv_result3 := by
  exact convBlockGlue headStep7_conv_suffixEq4 headStep7_conv_blockStep3

theorem headStep7_conv_suffixEq2 :
    convI headStep7_conv_suffix2 head8 = headStep7_conv_result2 := by
  exact convBlockGlue headStep7_conv_suffixEq3 headStep7_conv_blockStep2

theorem headStep7_conv_suffixEq1 :
    convI headStep7_conv_suffix1 head8 = headStep7_conv_result1 := by
  exact convBlockGlue headStep7_conv_suffixEq2 headStep7_conv_blockStep1

theorem headStep7_conv_suffixEq0 :
    convI headStep7_conv_suffix0 head8 = headStep7_conv_result0 := by
  exact convBlockGlue headStep7_conv_suffixEq1 headStep7_conv_blockStep0

theorem headStep7_conv_eq :
    convI ratioA head8 = headStep7_conv_result0 := by
  exact (congrArg (fun left => convI left head8) headStep7_conv_input).trans headStep7_conv_suffixEq0

theorem headStep7 :
    (addL [ofRatI c7] (convI ratioA head8)).take 170 = head7 := by
  rw [headStep7_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 147: reached headStep7"
  out.flush

theorem headEq7 :
    hornerWithTailI 170 ratioA tailI weights7 = head7 := by
  exact headGlue headEq8 headStep7

theorem headStep6_conv_suffixEq6 :
    convI headStep6_conv_suffix6 head7 = headStep6_conv_result6 := by
  rfl

theorem headStep6_conv_suffixEq5 :
    convI headStep6_conv_suffix5 head7 = headStep6_conv_result5 := by
  exact convBlockGlue headStep6_conv_suffixEq6 headStep6_conv_blockStep5

theorem headStep6_conv_suffixEq4 :
    convI headStep6_conv_suffix4 head7 = headStep6_conv_result4 := by
  exact convBlockGlue headStep6_conv_suffixEq5 headStep6_conv_blockStep4

theorem headStep6_conv_suffixEq3 :
    convI headStep6_conv_suffix3 head7 = headStep6_conv_result3 := by
  exact convBlockGlue headStep6_conv_suffixEq4 headStep6_conv_blockStep3

theorem headStep6_conv_suffixEq2 :
    convI headStep6_conv_suffix2 head7 = headStep6_conv_result2 := by
  exact convBlockGlue headStep6_conv_suffixEq3 headStep6_conv_blockStep2

theorem headStep6_conv_suffixEq1 :
    convI headStep6_conv_suffix1 head7 = headStep6_conv_result1 := by
  exact convBlockGlue headStep6_conv_suffixEq2 headStep6_conv_blockStep1

theorem headStep6_conv_suffixEq0 :
    convI headStep6_conv_suffix0 head7 = headStep6_conv_result0 := by
  exact convBlockGlue headStep6_conv_suffixEq1 headStep6_conv_blockStep0

theorem headStep6_conv_eq :
    convI ratioA head7 = headStep6_conv_result0 := by
  exact (congrArg (fun left => convI left head7) headStep6_conv_input).trans headStep6_conv_suffixEq0

theorem headStep6 :
    (addL [ofRatI c6] (convI ratioA head7)).take 170 = head6 := by
  rw [headStep6_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 148: reached headStep6"
  out.flush

theorem headEq6 :
    hornerWithTailI 170 ratioA tailI weights6 = head6 := by
  exact headGlue headEq7 headStep6

theorem headStep5_conv_suffixEq6 :
    convI headStep5_conv_suffix6 head6 = headStep5_conv_result6 := by
  rfl

theorem headStep5_conv_suffixEq5 :
    convI headStep5_conv_suffix5 head6 = headStep5_conv_result5 := by
  exact convBlockGlue headStep5_conv_suffixEq6 headStep5_conv_blockStep5

theorem headStep5_conv_suffixEq4 :
    convI headStep5_conv_suffix4 head6 = headStep5_conv_result4 := by
  exact convBlockGlue headStep5_conv_suffixEq5 headStep5_conv_blockStep4

theorem headStep5_conv_suffixEq3 :
    convI headStep5_conv_suffix3 head6 = headStep5_conv_result3 := by
  exact convBlockGlue headStep5_conv_suffixEq4 headStep5_conv_blockStep3

theorem headStep5_conv_suffixEq2 :
    convI headStep5_conv_suffix2 head6 = headStep5_conv_result2 := by
  exact convBlockGlue headStep5_conv_suffixEq3 headStep5_conv_blockStep2

theorem headStep5_conv_suffixEq1 :
    convI headStep5_conv_suffix1 head6 = headStep5_conv_result1 := by
  exact convBlockGlue headStep5_conv_suffixEq2 headStep5_conv_blockStep1

theorem headStep5_conv_suffixEq0 :
    convI headStep5_conv_suffix0 head6 = headStep5_conv_result0 := by
  exact convBlockGlue headStep5_conv_suffixEq1 headStep5_conv_blockStep0

theorem headStep5_conv_eq :
    convI ratioA head6 = headStep5_conv_result0 := by
  exact (congrArg (fun left => convI left head6) headStep5_conv_input).trans headStep5_conv_suffixEq0

theorem headStep5 :
    (addL [ofRatI c5] (convI ratioA head6)).take 170 = head5 := by
  rw [headStep5_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 149: reached headStep5"
  out.flush

theorem headEq5 :
    hornerWithTailI 170 ratioA tailI weights5 = head5 := by
  exact headGlue headEq6 headStep5

theorem headStep4_conv_suffixEq6 :
    convI headStep4_conv_suffix6 head5 = headStep4_conv_result6 := by
  rfl

theorem headStep4_conv_suffixEq5 :
    convI headStep4_conv_suffix5 head5 = headStep4_conv_result5 := by
  exact convBlockGlue headStep4_conv_suffixEq6 headStep4_conv_blockStep5

theorem headStep4_conv_suffixEq4 :
    convI headStep4_conv_suffix4 head5 = headStep4_conv_result4 := by
  exact convBlockGlue headStep4_conv_suffixEq5 headStep4_conv_blockStep4

theorem headStep4_conv_suffixEq3 :
    convI headStep4_conv_suffix3 head5 = headStep4_conv_result3 := by
  exact convBlockGlue headStep4_conv_suffixEq4 headStep4_conv_blockStep3

theorem headStep4_conv_suffixEq2 :
    convI headStep4_conv_suffix2 head5 = headStep4_conv_result2 := by
  exact convBlockGlue headStep4_conv_suffixEq3 headStep4_conv_blockStep2

theorem headStep4_conv_suffixEq1 :
    convI headStep4_conv_suffix1 head5 = headStep4_conv_result1 := by
  exact convBlockGlue headStep4_conv_suffixEq2 headStep4_conv_blockStep1

theorem headStep4_conv_suffixEq0 :
    convI headStep4_conv_suffix0 head5 = headStep4_conv_result0 := by
  exact convBlockGlue headStep4_conv_suffixEq1 headStep4_conv_blockStep0

theorem headStep4_conv_eq :
    convI ratioA head5 = headStep4_conv_result0 := by
  exact (congrArg (fun left => convI left head5) headStep4_conv_input).trans headStep4_conv_suffixEq0

theorem headStep4 :
    (addL [ofRatI c4] (convI ratioA head5)).take 170 = head4 := by
  rw [headStep4_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 150: reached headStep4"
  out.flush

theorem headEq4 :
    hornerWithTailI 170 ratioA tailI weights4 = head4 := by
  exact headGlue headEq5 headStep4

theorem headStep3_conv_suffixEq6 :
    convI headStep3_conv_suffix6 head4 = headStep3_conv_result6 := by
  rfl

theorem headStep3_conv_suffixEq5 :
    convI headStep3_conv_suffix5 head4 = headStep3_conv_result5 := by
  exact convBlockGlue headStep3_conv_suffixEq6 headStep3_conv_blockStep5

theorem headStep3_conv_suffixEq4 :
    convI headStep3_conv_suffix4 head4 = headStep3_conv_result4 := by
  exact convBlockGlue headStep3_conv_suffixEq5 headStep3_conv_blockStep4

theorem headStep3_conv_suffixEq3 :
    convI headStep3_conv_suffix3 head4 = headStep3_conv_result3 := by
  exact convBlockGlue headStep3_conv_suffixEq4 headStep3_conv_blockStep3

theorem headStep3_conv_suffixEq2 :
    convI headStep3_conv_suffix2 head4 = headStep3_conv_result2 := by
  exact convBlockGlue headStep3_conv_suffixEq3 headStep3_conv_blockStep2

theorem headStep3_conv_suffixEq1 :
    convI headStep3_conv_suffix1 head4 = headStep3_conv_result1 := by
  exact convBlockGlue headStep3_conv_suffixEq2 headStep3_conv_blockStep1

theorem headStep3_conv_suffixEq0 :
    convI headStep3_conv_suffix0 head4 = headStep3_conv_result0 := by
  exact convBlockGlue headStep3_conv_suffixEq1 headStep3_conv_blockStep0

theorem headStep3_conv_eq :
    convI ratioA head4 = headStep3_conv_result0 := by
  exact (congrArg (fun left => convI left head4) headStep3_conv_input).trans headStep3_conv_suffixEq0

theorem headStep3 :
    (addL [ofRatI c3] (convI ratioA head4)).take 170 = head3 := by
  rw [headStep3_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 151: reached headStep3"
  out.flush

theorem headEq3 :
    hornerWithTailI 170 ratioA tailI weights3 = head3 := by
  exact headGlue headEq4 headStep3

theorem headStep2_conv_suffixEq6 :
    convI headStep2_conv_suffix6 head3 = headStep2_conv_result6 := by
  rfl

theorem headStep2_conv_suffixEq5 :
    convI headStep2_conv_suffix5 head3 = headStep2_conv_result5 := by
  exact convBlockGlue headStep2_conv_suffixEq6 headStep2_conv_blockStep5

theorem headStep2_conv_suffixEq4 :
    convI headStep2_conv_suffix4 head3 = headStep2_conv_result4 := by
  exact convBlockGlue headStep2_conv_suffixEq5 headStep2_conv_blockStep4

theorem headStep2_conv_suffixEq3 :
    convI headStep2_conv_suffix3 head3 = headStep2_conv_result3 := by
  exact convBlockGlue headStep2_conv_suffixEq4 headStep2_conv_blockStep3

theorem headStep2_conv_suffixEq2 :
    convI headStep2_conv_suffix2 head3 = headStep2_conv_result2 := by
  exact convBlockGlue headStep2_conv_suffixEq3 headStep2_conv_blockStep2

theorem headStep2_conv_suffixEq1 :
    convI headStep2_conv_suffix1 head3 = headStep2_conv_result1 := by
  exact convBlockGlue headStep2_conv_suffixEq2 headStep2_conv_blockStep1

theorem headStep2_conv_suffixEq0 :
    convI headStep2_conv_suffix0 head3 = headStep2_conv_result0 := by
  exact convBlockGlue headStep2_conv_suffixEq1 headStep2_conv_blockStep0

theorem headStep2_conv_eq :
    convI ratioA head3 = headStep2_conv_result0 := by
  exact (congrArg (fun left => convI left head3) headStep2_conv_input).trans headStep2_conv_suffixEq0

theorem headStep2 :
    (addL [ofRatI c2] (convI ratioA head3)).take 170 = head2 := by
  rw [headStep2_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 152: reached headStep2"
  out.flush

theorem headEq2 :
    hornerWithTailI 170 ratioA tailI weights2 = head2 := by
  exact headGlue headEq3 headStep2

theorem headStep1_conv_suffixEq6 :
    convI headStep1_conv_suffix6 head2 = headStep1_conv_result6 := by
  rfl

theorem headStep1_conv_suffixEq5 :
    convI headStep1_conv_suffix5 head2 = headStep1_conv_result5 := by
  exact convBlockGlue headStep1_conv_suffixEq6 headStep1_conv_blockStep5

theorem headStep1_conv_suffixEq4 :
    convI headStep1_conv_suffix4 head2 = headStep1_conv_result4 := by
  exact convBlockGlue headStep1_conv_suffixEq5 headStep1_conv_blockStep4

theorem headStep1_conv_suffixEq3 :
    convI headStep1_conv_suffix3 head2 = headStep1_conv_result3 := by
  exact convBlockGlue headStep1_conv_suffixEq4 headStep1_conv_blockStep3

theorem headStep1_conv_suffixEq2 :
    convI headStep1_conv_suffix2 head2 = headStep1_conv_result2 := by
  exact convBlockGlue headStep1_conv_suffixEq3 headStep1_conv_blockStep2

theorem headStep1_conv_suffixEq1 :
    convI headStep1_conv_suffix1 head2 = headStep1_conv_result1 := by
  exact convBlockGlue headStep1_conv_suffixEq2 headStep1_conv_blockStep1

theorem headStep1_conv_suffixEq0 :
    convI headStep1_conv_suffix0 head2 = headStep1_conv_result0 := by
  exact convBlockGlue headStep1_conv_suffixEq1 headStep1_conv_blockStep0

theorem headStep1_conv_eq :
    convI ratioA head2 = headStep1_conv_result0 := by
  exact (congrArg (fun left => convI left head2) headStep1_conv_input).trans headStep1_conv_suffixEq0

theorem headStep1 :
    (addL [ofRatI c1] (convI ratioA head2)).take 170 = head1 := by
  rw [headStep1_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 153: reached headStep1"
  out.flush

theorem headEq1 :
    hornerWithTailI 170 ratioA tailI weights1 = head1 := by
  exact headGlue headEq2 headStep1

theorem headStep0_conv_suffixEq6 :
    convI headStep0_conv_suffix6 head1 = headStep0_conv_result6 := by
  rfl

theorem headStep0_conv_suffixEq5 :
    convI headStep0_conv_suffix5 head1 = headStep0_conv_result5 := by
  exact convBlockGlue headStep0_conv_suffixEq6 headStep0_conv_blockStep5

theorem headStep0_conv_suffixEq4 :
    convI headStep0_conv_suffix4 head1 = headStep0_conv_result4 := by
  exact convBlockGlue headStep0_conv_suffixEq5 headStep0_conv_blockStep4

theorem headStep0_conv_suffixEq3 :
    convI headStep0_conv_suffix3 head1 = headStep0_conv_result3 := by
  exact convBlockGlue headStep0_conv_suffixEq4 headStep0_conv_blockStep3

theorem headStep0_conv_suffixEq2 :
    convI headStep0_conv_suffix2 head1 = headStep0_conv_result2 := by
  exact convBlockGlue headStep0_conv_suffixEq3 headStep0_conv_blockStep2

theorem headStep0_conv_suffixEq1 :
    convI headStep0_conv_suffix1 head1 = headStep0_conv_result1 := by
  exact convBlockGlue headStep0_conv_suffixEq2 headStep0_conv_blockStep1

theorem headStep0_conv_suffixEq0 :
    convI headStep0_conv_suffix0 head1 = headStep0_conv_result0 := by
  exact convBlockGlue headStep0_conv_suffixEq1 headStep0_conv_blockStep0

theorem headStep0_conv_eq :
    convI ratioA head1 = headStep0_conv_result0 := by
  exact (congrArg (fun left => convI left head1) headStep0_conv_input).trans headStep0_conv_suffixEq0

theorem headStep0 :
    (addL [ofRatI c0] (convI ratioA head1)).take 170 = head0 := by
  rw [headStep0_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 154: reached headStep0"
  out.flush

theorem headEq0 :
    hornerWithTailI 170 ratioA tailI weights0 = head0 := by
  exact headGlue headEq1 headStep0

theorem final_step_conv_suffixEq3 :
    convI final_step_conv_suffix3 head0 = final_step_conv_result3 := by
  rfl

theorem final_step_conv_suffixEq2 :
    convI final_step_conv_suffix2 head0 = final_step_conv_result2 := by
  exact convBlockGlue final_step_conv_suffixEq3 final_step_conv_blockStep2

theorem final_step_conv_suffixEq1 :
    convI final_step_conv_suffix1 head0 = final_step_conv_result1 := by
  exact convBlockGlue final_step_conv_suffixEq2 final_step_conv_blockStep1

theorem final_step_conv_suffixEq0 :
    convI final_step_conv_suffix0 head0 = final_step_conv_result0 := by
  exact convBlockGlue final_step_conv_suffixEq1 final_step_conv_blockStep0

theorem final_step_conv_eq :
    convI pI head0 = final_step_conv_result0 := by
  exact (congrArg (fun left => convI left head0) final_step_conv_input).trans final_step_conv_suffixEq0

theorem final_step :
    convI pI head0 = completedI := by
  rw [final_step_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 155: reached final_step"
  out.flush

theorem powerEq1 :
    polyPowI pI 1 = power1 := by
  exact powerGlue powerEq0 powerStep1

theorem powerEq2 :
    polyPowI pI 2 = power2 := by
  exact powerGlue powerEq1 powerStep2

theorem powerEq3 :
    polyPowI pI 3 = power3 := by
  exact powerGlue powerEq2 powerStep3

theorem powerEq4 :
    polyPowI pI 4 = power4 := by
  exact powerGlue powerEq3 powerStep4

theorem powerEq5 :
    polyPowI pI 5 = power5 := by
  exact powerGlue powerEq4 powerStep5

theorem powerEq6 :
    polyPowI pI 6 = power6 := by
  exact powerGlue powerEq5 powerStep6

theorem powerEq7 :
    polyPowI pI 7 = power7 := by
  exact powerGlue powerEq6 powerStep7

theorem powerEq8 :
    polyPowI pI 8 = power8 := by
  exact powerGlue powerEq7 powerStep8

theorem powerEq9 :
    polyPowI pI 9 = power9 := by
  exact powerGlue powerEq8 powerStep9

theorem powerEq10 :
    polyPowI pI 10 = power10 := by
  exact powerGlue powerEq9 powerStep10

theorem powerStep11_conv_suffixEq3 :
    convI powerStep11_conv_suffix3 power10 = powerStep11_conv_result3 := by
  rfl

theorem powerStep11_conv_suffixEq2 :
    convI powerStep11_conv_suffix2 power10 = powerStep11_conv_result2 := by
  exact convBlockGlue powerStep11_conv_suffixEq3 powerStep11_conv_blockStep2

theorem powerStep11_conv_suffixEq1 :
    convI powerStep11_conv_suffix1 power10 = powerStep11_conv_result1 := by
  exact convBlockGlue powerStep11_conv_suffixEq2 powerStep11_conv_blockStep1

theorem powerStep11_conv_suffixEq0 :
    convI powerStep11_conv_suffix0 power10 = powerStep11_conv_result0 := by
  exact convBlockGlue powerStep11_conv_suffixEq1 powerStep11_conv_blockStep0

theorem powerStep11_conv_eq :
    convI pI power10 = powerStep11_conv_result0 := by
  exact (congrArg (fun left => convI left power10) powerStep11_conv_input).trans powerStep11_conv_suffixEq0

theorem powerStep11 :
    convI pI power10 = power11 := by
  rw [powerStep11_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 168: reached powerStep11"
  out.flush

theorem powerEq11 :
    polyPowI pI 11 = power11 := by
  exact powerGlue powerEq10 powerStep11

theorem powerStep12_conv_suffixEq3 :
    convI powerStep12_conv_suffix3 power11 = powerStep12_conv_result3 := by
  rfl

theorem powerStep12_conv_suffixEq2 :
    convI powerStep12_conv_suffix2 power11 = powerStep12_conv_result2 := by
  exact convBlockGlue powerStep12_conv_suffixEq3 powerStep12_conv_blockStep2

theorem powerStep12_conv_suffixEq1 :
    convI powerStep12_conv_suffix1 power11 = powerStep12_conv_result1 := by
  exact convBlockGlue powerStep12_conv_suffixEq2 powerStep12_conv_blockStep1

theorem powerStep12_conv_suffixEq0 :
    convI powerStep12_conv_suffix0 power11 = powerStep12_conv_result0 := by
  exact convBlockGlue powerStep12_conv_suffixEq1 powerStep12_conv_blockStep0

theorem powerStep12_conv_eq :
    convI pI power11 = powerStep12_conv_result0 := by
  exact (congrArg (fun left => convI left power11) powerStep12_conv_input).trans powerStep12_conv_suffixEq0

theorem powerStep12 :
    convI pI power11 = power12 := by
  rw [powerStep12_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 169: reached powerStep12"
  out.flush

theorem powerEq12 :
    polyPowI pI 12 = power12 := by
  exact powerGlue powerEq11 powerStep12

theorem powerStep13_conv_suffixEq3 :
    convI powerStep13_conv_suffix3 power12 = powerStep13_conv_result3 := by
  rfl

theorem powerStep13_conv_suffixEq2 :
    convI powerStep13_conv_suffix2 power12 = powerStep13_conv_result2 := by
  exact convBlockGlue powerStep13_conv_suffixEq3 powerStep13_conv_blockStep2

theorem powerStep13_conv_suffixEq1 :
    convI powerStep13_conv_suffix1 power12 = powerStep13_conv_result1 := by
  exact convBlockGlue powerStep13_conv_suffixEq2 powerStep13_conv_blockStep1

theorem powerStep13_conv_suffixEq0 :
    convI powerStep13_conv_suffix0 power12 = powerStep13_conv_result0 := by
  exact convBlockGlue powerStep13_conv_suffixEq1 powerStep13_conv_blockStep0

theorem powerStep13_conv_eq :
    convI pI power12 = powerStep13_conv_result0 := by
  exact (congrArg (fun left => convI left power12) powerStep13_conv_input).trans powerStep13_conv_suffixEq0

theorem powerStep13 :
    convI pI power12 = power13 := by
  rw [powerStep13_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 170: reached powerStep13"
  out.flush

theorem powerEq13 :
    polyPowI pI 13 = power13 := by
  exact powerGlue powerEq12 powerStep13

theorem powerStep14_conv_suffixEq3 :
    convI powerStep14_conv_suffix3 power13 = powerStep14_conv_result3 := by
  rfl

theorem powerStep14_conv_suffixEq2 :
    convI powerStep14_conv_suffix2 power13 = powerStep14_conv_result2 := by
  exact convBlockGlue powerStep14_conv_suffixEq3 powerStep14_conv_blockStep2

theorem powerStep14_conv_suffixEq1 :
    convI powerStep14_conv_suffix1 power13 = powerStep14_conv_result1 := by
  exact convBlockGlue powerStep14_conv_suffixEq2 powerStep14_conv_blockStep1

theorem powerStep14_conv_suffixEq0 :
    convI powerStep14_conv_suffix0 power13 = powerStep14_conv_result0 := by
  exact convBlockGlue powerStep14_conv_suffixEq1 powerStep14_conv_blockStep0

theorem powerStep14_conv_eq :
    convI pI power13 = powerStep14_conv_result0 := by
  exact (congrArg (fun left => convI left power13) powerStep14_conv_input).trans powerStep14_conv_suffixEq0

theorem powerStep14 :
    convI pI power13 = power14 := by
  rw [powerStep14_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 171: reached powerStep14"
  out.flush

theorem powerEq14 :
    polyPowI pI 14 = power14 := by
  exact powerGlue powerEq13 powerStep14

theorem powerStep15_conv_suffixEq3 :
    convI powerStep15_conv_suffix3 power14 = powerStep15_conv_result3 := by
  rfl

theorem powerStep15_conv_suffixEq2 :
    convI powerStep15_conv_suffix2 power14 = powerStep15_conv_result2 := by
  exact convBlockGlue powerStep15_conv_suffixEq3 powerStep15_conv_blockStep2

theorem powerStep15_conv_suffixEq1 :
    convI powerStep15_conv_suffix1 power14 = powerStep15_conv_result1 := by
  exact convBlockGlue powerStep15_conv_suffixEq2 powerStep15_conv_blockStep1

theorem powerStep15_conv_suffixEq0 :
    convI powerStep15_conv_suffix0 power14 = powerStep15_conv_result0 := by
  exact convBlockGlue powerStep15_conv_suffixEq1 powerStep15_conv_blockStep0

theorem powerStep15_conv_eq :
    convI pI power14 = powerStep15_conv_result0 := by
  exact (congrArg (fun left => convI left power14) powerStep15_conv_input).trans powerStep15_conv_suffixEq0

theorem powerStep15 :
    convI pI power14 = power15 := by
  rw [powerStep15_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 172: reached powerStep15"
  out.flush

theorem powerEq15 :
    polyPowI pI 15 = power15 := by
  exact powerGlue powerEq14 powerStep15

theorem powerStep16_conv_suffixEq3 :
    convI powerStep16_conv_suffix3 power15 = powerStep16_conv_result3 := by
  rfl

theorem powerStep16_conv_suffixEq2 :
    convI powerStep16_conv_suffix2 power15 = powerStep16_conv_result2 := by
  exact convBlockGlue powerStep16_conv_suffixEq3 powerStep16_conv_blockStep2

theorem powerStep16_conv_suffixEq1 :
    convI powerStep16_conv_suffix1 power15 = powerStep16_conv_result1 := by
  exact convBlockGlue powerStep16_conv_suffixEq2 powerStep16_conv_blockStep1

theorem powerStep16_conv_suffixEq0 :
    convI powerStep16_conv_suffix0 power15 = powerStep16_conv_result0 := by
  exact convBlockGlue powerStep16_conv_suffixEq1 powerStep16_conv_blockStep0

theorem powerStep16_conv_eq :
    convI pI power15 = powerStep16_conv_result0 := by
  exact (congrArg (fun left => convI left power15) powerStep16_conv_input).trans powerStep16_conv_suffixEq0

theorem powerStep16 :
    convI pI power15 = power16 := by
  rw [powerStep16_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 173: reached powerStep16"
  out.flush

theorem powerEq16 :
    polyPowI pI 16 = power16 := by
  exact powerGlue powerEq15 powerStep16

theorem powerStep17_conv_suffixEq3 :
    convI powerStep17_conv_suffix3 power16 = powerStep17_conv_result3 := by
  rfl

theorem powerStep17_conv_suffixEq2 :
    convI powerStep17_conv_suffix2 power16 = powerStep17_conv_result2 := by
  exact convBlockGlue powerStep17_conv_suffixEq3 powerStep17_conv_blockStep2

theorem powerStep17_conv_suffixEq1 :
    convI powerStep17_conv_suffix1 power16 = powerStep17_conv_result1 := by
  exact convBlockGlue powerStep17_conv_suffixEq2 powerStep17_conv_blockStep1

theorem powerStep17_conv_suffixEq0 :
    convI powerStep17_conv_suffix0 power16 = powerStep17_conv_result0 := by
  exact convBlockGlue powerStep17_conv_suffixEq1 powerStep17_conv_blockStep0

theorem powerStep17_conv_eq :
    convI pI power16 = powerStep17_conv_result0 := by
  exact (congrArg (fun left => convI left power16) powerStep17_conv_input).trans powerStep17_conv_suffixEq0

theorem powerStep17 :
    convI pI power16 = power17 := by
  rw [powerStep17_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 174: reached powerStep17"
  out.flush

theorem powerEq17 :
    polyPowI pI 17 = power17 := by
  exact powerGlue powerEq16 powerStep17

theorem seed_product_step_conv_suffixEq13 :
    convI seed_product_step_conv_suffix13 power17 = seed_product_step_conv_result13 := by
  rfl

theorem seed_product_step_conv_suffixEq12 :
    convI seed_product_step_conv_suffix12 power17 = seed_product_step_conv_result12 := by
  exact convBlockGlue seed_product_step_conv_suffixEq13 seed_product_step_conv_blockStep12

theorem seed_product_step_conv_suffixEq11 :
    convI seed_product_step_conv_suffix11 power17 = seed_product_step_conv_result11 := by
  exact convBlockGlue seed_product_step_conv_suffixEq12 seed_product_step_conv_blockStep11

theorem seed_product_step_conv_suffixEq10 :
    convI seed_product_step_conv_suffix10 power17 = seed_product_step_conv_result10 := by
  exact convBlockGlue seed_product_step_conv_suffixEq11 seed_product_step_conv_blockStep10

theorem seed_product_step_conv_suffixEq9 :
    convI seed_product_step_conv_suffix9 power17 = seed_product_step_conv_result9 := by
  exact convBlockGlue seed_product_step_conv_suffixEq10 seed_product_step_conv_blockStep9

theorem seed_product_step_conv_suffixEq8 :
    convI seed_product_step_conv_suffix8 power17 = seed_product_step_conv_result8 := by
  exact convBlockGlue seed_product_step_conv_suffixEq9 seed_product_step_conv_blockStep8

theorem seed_product_step_conv_suffixEq7 :
    convI seed_product_step_conv_suffix7 power17 = seed_product_step_conv_result7 := by
  exact convBlockGlue seed_product_step_conv_suffixEq8 seed_product_step_conv_blockStep7

theorem seed_product_step_conv_suffixEq6 :
    convI seed_product_step_conv_suffix6 power17 = seed_product_step_conv_result6 := by
  exact convBlockGlue seed_product_step_conv_suffixEq7 seed_product_step_conv_blockStep6

theorem seed_product_step_conv_suffixEq5 :
    convI seed_product_step_conv_suffix5 power17 = seed_product_step_conv_result5 := by
  exact convBlockGlue seed_product_step_conv_suffixEq6 seed_product_step_conv_blockStep5

theorem seed_product_step_conv_suffixEq4 :
    convI seed_product_step_conv_suffix4 power17 = seed_product_step_conv_result4 := by
  exact convBlockGlue seed_product_step_conv_suffixEq5 seed_product_step_conv_blockStep4

theorem seed_product_step_conv_suffixEq3 :
    convI seed_product_step_conv_suffix3 power17 = seed_product_step_conv_result3 := by
  exact convBlockGlue seed_product_step_conv_suffixEq4 seed_product_step_conv_blockStep3

theorem seed_product_step_conv_suffixEq2 :
    convI seed_product_step_conv_suffix2 power17 = seed_product_step_conv_result2 := by
  exact convBlockGlue seed_product_step_conv_suffixEq3 seed_product_step_conv_blockStep2

theorem seed_product_step_conv_suffixEq1 :
    convI seed_product_step_conv_suffix1 power17 = seed_product_step_conv_result1 := by
  exact convBlockGlue seed_product_step_conv_suffixEq2 seed_product_step_conv_blockStep1

theorem seed_product_step_conv_suffixEq0 :
    convI seed_product_step_conv_suffix0 power17 = seed_product_step_conv_result0 := by
  exact convBlockGlue seed_product_step_conv_suffixEq1 seed_product_step_conv_blockStep0

theorem seed_product_step_conv_eq :
    convI rI power17 = seed_product_step_conv_result0 := by
  exact (congrArg (fun left => convI left power17) seed_product_step_conv_input).trans seed_product_step_conv_suffixEq0

theorem seed_product_step :
    convI rI power17 = seedI := by
  rw [seed_product_step_conv_eq] <;> decide +kernel

run_cmd do
  let out ← IO.getStdout
  out.putStrLn "Canonical trace 175: reached seed_product_step"
  out.flush

end Grothe.HaagerupCanonical.Trace
