import Grothe.UpperChaos.Q0GaussPolynomialOrder01
import Grothe.UpperChaos.Q0GaussPolynomialOrder02
import Grothe.UpperChaos.Q0GaussPolynomialOrder03
import Grothe.UpperChaos.Q0GaussPolynomialOrder04
import Grothe.UpperChaos.Q0GaussPolynomialOrder05
import Grothe.UpperChaos.Q0GaussPolynomialOrder06
import Grothe.UpperChaos.Q0GaussPolynomialOrder07
import Grothe.UpperChaos.Q0GaussPolynomialOrder08
import Grothe.UpperChaos.Q0GaussPolynomialOrder09
import Grothe.UpperChaos.Q0GaussPolynomialOrder10
import Grothe.UpperChaos.Q0GaussPolynomialOrder11
import Grothe.UpperChaos.Q0GaussPolynomialOrder12
import Grothe.UpperChaos.Q0GaussPolynomialOrder13
import Grothe.UpperChaos.Q0GaussPolynomialOrder14
import Grothe.UpperChaos.Q0GaussPolynomialOrder15
import Grothe.UpperChaos.Q0GaussPolynomialOrder16
import Grothe.UpperChaos.Q0GaussPolynomialOrder17
import Grothe.UpperChaos.Q0GaussPolynomialOrder18
import Grothe.UpperChaos.Q0GaussPolynomialOrder19
import Grothe.UpperChaos.Q0GaussPolynomialOrder20
import Grothe.UpperChaos.Q0GaussPolynomialOrder21
import Grothe.UpperChaos.Q0GaussPolynomialOrder22
import Grothe.UpperChaos.Q0GaussPolynomialOrder23
import Grothe.UpperChaos.Q0GaussPolynomialOrder24
import Grothe.UpperChaos.Q0GaussPolynomialOrder25
import Grothe.UpperChaos.Q0GaussPolynomialOrder26
import Grothe.UpperChaos.Q0GaussPolynomialOrder27
import Grothe.UpperChaos.Q0GaussPolynomialOrder28
import Grothe.UpperChaos.Q0GaussPolynomialOrder29
import Grothe.UpperChaos.Q0GaussPolynomialOrder30
import Grothe.UpperChaos.Q0GaussPolynomialOrder31
import Grothe.UpperChaos.Q0GaussPolynomialOrder32
import Grothe.UpperChaos.Q0GaussPolynomialOrder33
import Grothe.UpperChaos.Q0GaussPolynomialOrder34
import Grothe.UpperChaos.Q0GaussPolynomialOrder35
import Grothe.UpperChaos.Q0GaussPolynomialOrder36
import Grothe.UpperChaos.Q0GaussPolynomialOrder37
import Grothe.UpperChaos.Q0GaussPolynomialOrder38
import Grothe.UpperChaos.Q0GaussPolynomialOrder39
import Grothe.UpperChaos.Q0GaussPolynomialOrder40
import Grothe.UpperChaos.Q0GaussPolynomialOrder41
import Grothe.UpperChaos.Q0GaussPolynomialOrder42
import Grothe.UpperChaos.Q0GaussPolynomialOrder43
import Grothe.UpperChaos.Q0GaussPolynomialOrder44
import Grothe.UpperChaos.Q0GaussPolynomialOrder45
import Grothe.UpperChaos.Q0GaussPolynomialOrder46
import Grothe.UpperChaos.Q0GaussPolynomialOrder47
import Grothe.UpperChaos.Q0GaussPolynomialOrder48
import Grothe.UpperChaos.Q0GaussPolynomialOrder49
import Grothe.UpperChaos.Q0GaussPolynomialOrder50
import Grothe.UpperChaos.Q0GaussPolynomialOrder51
import Grothe.UpperChaos.Q0GaussPolynomialOrder52
import Grothe.UpperChaos.Q0GaussPolynomialOrder53
import Grothe.UpperChaos.Q0GaussPolynomialOrder54
import Grothe.UpperChaos.Q0GaussPolynomialOrder55
import Grothe.UpperChaos.Q0GaussPolynomialOrder56
import Grothe.UpperChaos.Q0GaussPolynomialOrder57
import Grothe.UpperChaos.Q0GaussPolynomialOrder58
import Grothe.UpperChaos.Q0GaussPolynomialOrder59
import Grothe.UpperChaos.Q0GaussPolynomialOrder60
import Grothe.UpperChaos.Q0GaussPolynomialOrder61
import Grothe.UpperChaos.Q0GaussPolynomialOrder62
import Grothe.UpperChaos.Q0GaussPolynomialOrder63
import Grothe.UpperChaos.Q0GaussPolynomialOrder64

/-! Generated from exact rational witnesses; Lean must check every proof.
Input SHA256: 4cd3ca4c5d9983f1e71e6090724a0d86d39058b207b4400e4af7787a2320b0c6
Regenerate with tools/gen_gauss_polynomial_certificates.py.
Agent-ID: codex-2ca4. -/

open Polynomial MeasureTheory

namespace Grothe.UpperChaos.Q0GaussPolynomialCertificates

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData

theorem source01 : SourcePair 0 p00 p01 :=
  sourcePair_zero

theorem exactness01
    (node : Fin 1 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 0).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 2) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((1 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 0).1) ^ 2)) *
        f.eval (node i) := by
  simpa only [Nat.cast_one] using actual_exactness_of_check 0 p00 p01 w01 r01
    source01 Q0GaussPolynomialOrder01.identities_checked
    node hinj hroot f hf

theorem source02 : SourcePair 1 p01 p02 :=
  sourcePair_step 0 p00 p01 p02
    source01 Q0GaussPolynomialOrder02.recurrence_checked

theorem exactness02
    (node : Fin 2 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 1).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 4) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((2 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 1).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 1 p01 p02 w02 r02
    source02 Q0GaussPolynomialOrder02.identities_checked
    node hinj hroot f hf

theorem source03 : SourcePair 2 p02 p03 :=
  sourcePair_step 1 p01 p02 p03
    source02 Q0GaussPolynomialOrder03.recurrence_checked

theorem exactness03
    (node : Fin 3 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 2).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 6) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((3 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 2).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 2 p02 p03 w03 r03
    source03 Q0GaussPolynomialOrder03.identities_checked
    node hinj hroot f hf

theorem source04 : SourcePair 3 p03 p04 :=
  sourcePair_step 2 p02 p03 p04
    source03 Q0GaussPolynomialOrder04.recurrence_checked

theorem exactness04
    (node : Fin 4 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 3).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 8) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((4 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 3).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 3 p03 p04 w04 r04
    source04 Q0GaussPolynomialOrder04.identities_checked
    node hinj hroot f hf

theorem source05 : SourcePair 4 p04 p05 :=
  sourcePair_step 3 p03 p04 p05
    source04 Q0GaussPolynomialOrder05.recurrence_checked

theorem exactness05
    (node : Fin 5 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 4).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 10) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((5 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 4).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 4 p04 p05 w05 r05
    source05 Q0GaussPolynomialOrder05.identities_checked
    node hinj hroot f hf

theorem source06 : SourcePair 5 p05 p06 :=
  sourcePair_step 4 p04 p05 p06
    source05 Q0GaussPolynomialOrder06.recurrence_checked

theorem exactness06
    (node : Fin 6 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 5).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 12) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((6 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 5).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 5 p05 p06 w06 r06
    source06 Q0GaussPolynomialOrder06.identities_checked
    node hinj hroot f hf

theorem source07 : SourcePair 6 p06 p07 :=
  sourcePair_step 5 p05 p06 p07
    source06 Q0GaussPolynomialOrder07.recurrence_checked

theorem exactness07
    (node : Fin 7 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 6).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 14) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((7 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 6).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 6 p06 p07 w07 r07
    source07 Q0GaussPolynomialOrder07.identities_checked
    node hinj hroot f hf

theorem source08 : SourcePair 7 p07 p08 :=
  sourcePair_step 6 p06 p07 p08
    source07 Q0GaussPolynomialOrder08.recurrence_checked

theorem exactness08
    (node : Fin 8 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 7).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 16) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((8 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 7).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 7 p07 p08 w08 r08
    source08 Q0GaussPolynomialOrder08.identities_checked
    node hinj hroot f hf

theorem source09 : SourcePair 8 p08 p09 :=
  sourcePair_step 7 p07 p08 p09
    source08 Q0GaussPolynomialOrder09.recurrence_checked

theorem exactness09
    (node : Fin 9 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 8).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 18) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((9 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 8).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 8 p08 p09 w09 r09
    source09 Q0GaussPolynomialOrder09.identities_checked
    node hinj hroot f hf

theorem source10 : SourcePair 9 p09 p10 :=
  sourcePair_step 8 p08 p09 p10
    source09 Q0GaussPolynomialOrder10.recurrence_checked

theorem exactness10
    (node : Fin 10 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 9).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 20) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((10 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 9).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 9 p09 p10 w10 r10
    source10 Q0GaussPolynomialOrder10.identities_checked
    node hinj hroot f hf

theorem source11 : SourcePair 10 p10 p11 :=
  sourcePair_step 9 p09 p10 p11
    source10 Q0GaussPolynomialOrder11.recurrence_checked

theorem exactness11
    (node : Fin 11 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 10).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 22) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((11 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 10).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 10 p10 p11 w11 r11
    source11 Q0GaussPolynomialOrder11.identities_checked
    node hinj hroot f hf

theorem source12 : SourcePair 11 p11 p12 :=
  sourcePair_step 10 p10 p11 p12
    source11 Q0GaussPolynomialOrder12.recurrence_checked

theorem exactness12
    (node : Fin 12 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 11).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 24) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((12 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 11).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 11 p11 p12 w12 r12
    source12 Q0GaussPolynomialOrder12.identities_checked
    node hinj hroot f hf

theorem source13 : SourcePair 12 p12 p13 :=
  sourcePair_step 11 p11 p12 p13
    source12 Q0GaussPolynomialOrder13.recurrence_checked

theorem exactness13
    (node : Fin 13 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 12).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 26) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((13 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 12).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 12 p12 p13 w13 r13
    source13 Q0GaussPolynomialOrder13.identities_checked
    node hinj hroot f hf

theorem source14 : SourcePair 13 p13 p14 :=
  sourcePair_step 12 p12 p13 p14
    source13 Q0GaussPolynomialOrder14.recurrence_checked

theorem exactness14
    (node : Fin 14 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 13).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 28) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((14 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 13).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 13 p13 p14 w14 r14
    source14 Q0GaussPolynomialOrder14.identities_checked
    node hinj hroot f hf

theorem source15 : SourcePair 14 p14 p15 :=
  sourcePair_step 13 p13 p14 p15
    source14 Q0GaussPolynomialOrder15.recurrence_checked

theorem exactness15
    (node : Fin 15 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 14).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 30) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((15 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 14).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 14 p14 p15 w15 r15
    source15 Q0GaussPolynomialOrder15.identities_checked
    node hinj hroot f hf

theorem source16 : SourcePair 15 p15 p16 :=
  sourcePair_step 14 p14 p15 p16
    source15 Q0GaussPolynomialOrder16.recurrence_checked

theorem exactness16
    (node : Fin 16 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 15).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 32) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((16 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 15).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 15 p15 p16 w16 r16
    source16 Q0GaussPolynomialOrder16.identities_checked
    node hinj hroot f hf

theorem source17 : SourcePair 16 p16 p17 :=
  sourcePair_step 15 p15 p16 p17
    source16 Q0GaussPolynomialOrder17.recurrence_checked

theorem exactness17
    (node : Fin 17 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 16).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 34) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((17 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 16).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 16 p16 p17 w17 r17
    source17 Q0GaussPolynomialOrder17.identities_checked
    node hinj hroot f hf

theorem source18 : SourcePair 17 p17 p18 :=
  sourcePair_step 16 p16 p17 p18
    source17 Q0GaussPolynomialOrder18.recurrence_checked

theorem exactness18
    (node : Fin 18 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 17).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 36) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((18 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 17).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 17 p17 p18 w18 r18
    source18 Q0GaussPolynomialOrder18.identities_checked
    node hinj hroot f hf

theorem source19 : SourcePair 18 p18 p19 :=
  sourcePair_step 17 p17 p18 p19
    source18 Q0GaussPolynomialOrder19.recurrence_checked

theorem exactness19
    (node : Fin 19 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 18).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 38) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((19 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 18).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 18 p18 p19 w19 r19
    source19 Q0GaussPolynomialOrder19.identities_checked
    node hinj hroot f hf

theorem source20 : SourcePair 19 p19 p20 :=
  sourcePair_step 18 p18 p19 p20
    source19 Q0GaussPolynomialOrder20.recurrence_checked

theorem exactness20
    (node : Fin 20 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 19).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 40) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((20 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 19).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 19 p19 p20 w20 r20
    source20 Q0GaussPolynomialOrder20.identities_checked
    node hinj hroot f hf

theorem source21 : SourcePair 20 p20 p21 :=
  sourcePair_step 19 p19 p20 p21
    source20 Q0GaussPolynomialOrder21.recurrence_checked

theorem exactness21
    (node : Fin 21 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 20).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 42) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((21 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 20).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 20 p20 p21 w21 r21
    source21 Q0GaussPolynomialOrder21.identities_checked
    node hinj hroot f hf

theorem source22 : SourcePair 21 p21 p22 :=
  sourcePair_step 20 p20 p21 p22
    source21 Q0GaussPolynomialOrder22.recurrence_checked

theorem exactness22
    (node : Fin 22 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 21).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 44) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((22 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 21).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 21 p21 p22 w22 r22
    source22 Q0GaussPolynomialOrder22.identities_checked
    node hinj hroot f hf

theorem source23 : SourcePair 22 p22 p23 :=
  sourcePair_step 21 p21 p22 p23
    source22 Q0GaussPolynomialOrder23.recurrence_checked

theorem exactness23
    (node : Fin 23 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 22).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 46) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((23 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 22).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 22 p22 p23 w23 r23
    source23 Q0GaussPolynomialOrder23.identities_checked
    node hinj hroot f hf

theorem source24 : SourcePair 23 p23 p24 :=
  sourcePair_step 22 p22 p23 p24
    source23 Q0GaussPolynomialOrder24.recurrence_checked

theorem exactness24
    (node : Fin 24 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 23).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 48) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((24 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 23).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 23 p23 p24 w24 r24
    source24 Q0GaussPolynomialOrder24.identities_checked
    node hinj hroot f hf

theorem source25 : SourcePair 24 p24 p25 :=
  sourcePair_step 23 p23 p24 p25
    source24 Q0GaussPolynomialOrder25.recurrence_checked

theorem exactness25
    (node : Fin 25 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 24).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 50) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((25 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 24).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 24 p24 p25 w25 r25
    source25 Q0GaussPolynomialOrder25.identities_checked
    node hinj hroot f hf

theorem source26 : SourcePair 25 p25 p26 :=
  sourcePair_step 24 p24 p25 p26
    source25 Q0GaussPolynomialOrder26.recurrence_checked

theorem exactness26
    (node : Fin 26 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 25).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 52) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((26 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 25).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 25 p25 p26 w26 r26
    source26 Q0GaussPolynomialOrder26.identities_checked
    node hinj hroot f hf

theorem source27 : SourcePair 26 p26 p27 :=
  sourcePair_step 25 p25 p26 p27
    source26 Q0GaussPolynomialOrder27.recurrence_checked

theorem exactness27
    (node : Fin 27 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 26).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 54) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((27 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 26).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 26 p26 p27 w27 r27
    source27 Q0GaussPolynomialOrder27.identities_checked
    node hinj hroot f hf

theorem source28 : SourcePair 27 p27 p28 :=
  sourcePair_step 26 p26 p27 p28
    source27 Q0GaussPolynomialOrder28.recurrence_checked

theorem exactness28
    (node : Fin 28 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 27).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 56) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((28 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 27).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 27 p27 p28 w28 r28
    source28 Q0GaussPolynomialOrder28.identities_checked
    node hinj hroot f hf

theorem source29 : SourcePair 28 p28 p29 :=
  sourcePair_step 27 p27 p28 p29
    source28 Q0GaussPolynomialOrder29.recurrence_checked

theorem exactness29
    (node : Fin 29 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 28).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 58) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((29 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 28).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 28 p28 p29 w29 r29
    source29 Q0GaussPolynomialOrder29.identities_checked
    node hinj hroot f hf

theorem source30 : SourcePair 29 p29 p30 :=
  sourcePair_step 28 p28 p29 p30
    source29 Q0GaussPolynomialOrder30.recurrence_checked

theorem exactness30
    (node : Fin 30 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 29).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 60) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((30 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 29).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 29 p29 p30 w30 r30
    source30 Q0GaussPolynomialOrder30.identities_checked
    node hinj hroot f hf

theorem source31 : SourcePair 30 p30 p31 :=
  sourcePair_step 29 p29 p30 p31
    source30 Q0GaussPolynomialOrder31.recurrence_checked

theorem exactness31
    (node : Fin 31 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 30).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 62) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((31 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 30).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 30 p30 p31 w31 r31
    source31 Q0GaussPolynomialOrder31.identities_checked
    node hinj hroot f hf

theorem source32 : SourcePair 31 p31 p32 :=
  sourcePair_step 30 p30 p31 p32
    source31 Q0GaussPolynomialOrder32.recurrence_checked

theorem exactness32
    (node : Fin 32 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 31).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 64) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((32 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 31).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 31 p31 p32 w32 r32
    source32 Q0GaussPolynomialOrder32.identities_checked
    node hinj hroot f hf

theorem source33 : SourcePair 32 p32 p33 :=
  sourcePair_step 31 p31 p32 p33
    source32 Q0GaussPolynomialOrder33.recurrence_checked

theorem exactness33
    (node : Fin 33 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 32).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 66) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((33 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 32).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 32 p32 p33 w33 r33
    source33 Q0GaussPolynomialOrder33.identities_checked
    node hinj hroot f hf

theorem source34 : SourcePair 33 p33 p34 :=
  sourcePair_step 32 p32 p33 p34
    source33 Q0GaussPolynomialOrder34.recurrence_checked

theorem exactness34
    (node : Fin 34 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 33).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 68) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((34 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 33).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 33 p33 p34 w34 r34
    source34 Q0GaussPolynomialOrder34.identities_checked
    node hinj hroot f hf

theorem source35 : SourcePair 34 p34 p35 :=
  sourcePair_step 33 p33 p34 p35
    source34 Q0GaussPolynomialOrder35.recurrence_checked

theorem exactness35
    (node : Fin 35 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 34).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 70) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((35 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 34).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 34 p34 p35 w35 r35
    source35 Q0GaussPolynomialOrder35.identities_checked
    node hinj hroot f hf

theorem source36 : SourcePair 35 p35 p36 :=
  sourcePair_step 34 p34 p35 p36
    source35 Q0GaussPolynomialOrder36.recurrence_checked

theorem exactness36
    (node : Fin 36 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 35).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 72) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((36 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 35).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 35 p35 p36 w36 r36
    source36 Q0GaussPolynomialOrder36.identities_checked
    node hinj hroot f hf

theorem source37 : SourcePair 36 p36 p37 :=
  sourcePair_step 35 p35 p36 p37
    source36 Q0GaussPolynomialOrder37.recurrence_checked

theorem exactness37
    (node : Fin 37 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 36).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 74) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((37 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 36).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 36 p36 p37 w37 r37
    source37 Q0GaussPolynomialOrder37.identities_checked
    node hinj hroot f hf

theorem source38 : SourcePair 37 p37 p38 :=
  sourcePair_step 36 p36 p37 p38
    source37 Q0GaussPolynomialOrder38.recurrence_checked

theorem exactness38
    (node : Fin 38 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 37).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 76) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((38 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 37).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 37 p37 p38 w38 r38
    source38 Q0GaussPolynomialOrder38.identities_checked
    node hinj hroot f hf

theorem source39 : SourcePair 38 p38 p39 :=
  sourcePair_step 37 p37 p38 p39
    source38 Q0GaussPolynomialOrder39.recurrence_checked

theorem exactness39
    (node : Fin 39 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 38).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 78) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((39 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 38).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 38 p38 p39 w39 r39
    source39 Q0GaussPolynomialOrder39.identities_checked
    node hinj hroot f hf

theorem source40 : SourcePair 39 p39 p40 :=
  sourcePair_step 38 p38 p39 p40
    source39 Q0GaussPolynomialOrder40.recurrence_checked

theorem exactness40
    (node : Fin 40 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 39).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 80) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((40 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 39).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 39 p39 p40 w40 r40
    source40 Q0GaussPolynomialOrder40.identities_checked
    node hinj hroot f hf

theorem source41 : SourcePair 40 p40 p41 :=
  sourcePair_step 39 p39 p40 p41
    source40 Q0GaussPolynomialOrder41.recurrence_checked

theorem exactness41
    (node : Fin 41 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 40).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 82) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((41 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 40).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 40 p40 p41 w41 r41
    source41 Q0GaussPolynomialOrder41.identities_checked
    node hinj hroot f hf

theorem source42 : SourcePair 41 p41 p42 :=
  sourcePair_step 40 p40 p41 p42
    source41 Q0GaussPolynomialOrder42.recurrence_checked

theorem exactness42
    (node : Fin 42 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 41).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 84) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((42 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 41).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 41 p41 p42 w42 r42
    source42 Q0GaussPolynomialOrder42.identities_checked
    node hinj hroot f hf

theorem source43 : SourcePair 42 p42 p43 :=
  sourcePair_step 41 p41 p42 p43
    source42 Q0GaussPolynomialOrder43.recurrence_checked

theorem exactness43
    (node : Fin 43 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 42).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 86) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((43 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 42).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 42 p42 p43 w43 r43
    source43 Q0GaussPolynomialOrder43.identities_checked
    node hinj hroot f hf

theorem source44 : SourcePair 43 p43 p44 :=
  sourcePair_step 42 p42 p43 p44
    source43 Q0GaussPolynomialOrder44.recurrence_checked

theorem exactness44
    (node : Fin 44 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 43).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 88) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((44 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 43).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 43 p43 p44 w44 r44
    source44 Q0GaussPolynomialOrder44.identities_checked
    node hinj hroot f hf

theorem source45 : SourcePair 44 p44 p45 :=
  sourcePair_step 43 p43 p44 p45
    source44 Q0GaussPolynomialOrder45.recurrence_checked

theorem exactness45
    (node : Fin 45 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 44).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 90) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((45 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 44).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 44 p44 p45 w45 r45
    source45 Q0GaussPolynomialOrder45.identities_checked
    node hinj hroot f hf

theorem source46 : SourcePair 45 p45 p46 :=
  sourcePair_step 44 p44 p45 p46
    source45 Q0GaussPolynomialOrder46.recurrence_checked

theorem exactness46
    (node : Fin 46 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 45).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 92) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((46 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 45).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 45 p45 p46 w46 r46
    source46 Q0GaussPolynomialOrder46.identities_checked
    node hinj hroot f hf

theorem source47 : SourcePair 46 p46 p47 :=
  sourcePair_step 45 p45 p46 p47
    source46 Q0GaussPolynomialOrder47.recurrence_checked

theorem exactness47
    (node : Fin 47 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 46).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 94) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((47 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 46).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 46 p46 p47 w47 r47
    source47 Q0GaussPolynomialOrder47.identities_checked
    node hinj hroot f hf

theorem source48 : SourcePair 47 p47 p48 :=
  sourcePair_step 46 p46 p47 p48
    source47 Q0GaussPolynomialOrder48.recurrence_checked

theorem exactness48
    (node : Fin 48 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 47).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 96) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((48 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 47).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 47 p47 p48 w48 r48
    source48 Q0GaussPolynomialOrder48.identities_checked
    node hinj hroot f hf

theorem source49 : SourcePair 48 p48 p49 :=
  sourcePair_step 47 p47 p48 p49
    source48 Q0GaussPolynomialOrder49.recurrence_checked

theorem exactness49
    (node : Fin 49 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 48).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 98) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((49 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 48).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 48 p48 p49 w49 r49
    source49 Q0GaussPolynomialOrder49.identities_checked
    node hinj hroot f hf

theorem source50 : SourcePair 49 p49 p50 :=
  sourcePair_step 48 p48 p49 p50
    source49 Q0GaussPolynomialOrder50.recurrence_checked

theorem exactness50
    (node : Fin 50 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 49).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 100) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((50 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 49).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 49 p49 p50 w50 r50
    source50 Q0GaussPolynomialOrder50.identities_checked
    node hinj hroot f hf

theorem source51 : SourcePair 50 p50 p51 :=
  sourcePair_step 49 p49 p50 p51
    source50 Q0GaussPolynomialOrder51.recurrence_checked

theorem exactness51
    (node : Fin 51 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 50).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 102) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((51 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 50).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 50 p50 p51 w51 r51
    source51 Q0GaussPolynomialOrder51.identities_checked
    node hinj hroot f hf

theorem source52 : SourcePair 51 p51 p52 :=
  sourcePair_step 50 p50 p51 p52
    source51 Q0GaussPolynomialOrder52.recurrence_checked

theorem exactness52
    (node : Fin 52 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 51).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 104) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((52 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 51).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 51 p51 p52 w52 r52
    source52 Q0GaussPolynomialOrder52.identities_checked
    node hinj hroot f hf

theorem source53 : SourcePair 52 p52 p53 :=
  sourcePair_step 51 p51 p52 p53
    source52 Q0GaussPolynomialOrder53.recurrence_checked

theorem exactness53
    (node : Fin 53 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 52).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 106) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((53 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 52).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 52 p52 p53 w53 r53
    source53 Q0GaussPolynomialOrder53.identities_checked
    node hinj hroot f hf

theorem source54 : SourcePair 53 p53 p54 :=
  sourcePair_step 52 p52 p53 p54
    source53 Q0GaussPolynomialOrder54.recurrence_checked

theorem exactness54
    (node : Fin 54 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 53).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 108) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((54 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 53).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 53 p53 p54 w54 r54
    source54 Q0GaussPolynomialOrder54.identities_checked
    node hinj hroot f hf

theorem source55 : SourcePair 54 p54 p55 :=
  sourcePair_step 53 p53 p54 p55
    source54 Q0GaussPolynomialOrder55.recurrence_checked

theorem exactness55
    (node : Fin 55 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 54).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 110) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((55 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 54).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 54 p54 p55 w55 r55
    source55 Q0GaussPolynomialOrder55.identities_checked
    node hinj hroot f hf

theorem source56 : SourcePair 55 p55 p56 :=
  sourcePair_step 54 p54 p55 p56
    source55 Q0GaussPolynomialOrder56.recurrence_checked

theorem exactness56
    (node : Fin 56 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 55).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 112) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((56 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 55).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 55 p55 p56 w56 r56
    source56 Q0GaussPolynomialOrder56.identities_checked
    node hinj hroot f hf

theorem source57 : SourcePair 56 p56 p57 :=
  sourcePair_step 55 p55 p56 p57
    source56 Q0GaussPolynomialOrder57.recurrence_checked

theorem exactness57
    (node : Fin 57 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 56).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 114) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((57 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 56).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 56 p56 p57 w57 r57
    source57 Q0GaussPolynomialOrder57.identities_checked
    node hinj hroot f hf

theorem source58 : SourcePair 57 p57 p58 :=
  sourcePair_step 56 p56 p57 p58
    source57 Q0GaussPolynomialOrder58.recurrence_checked

theorem exactness58
    (node : Fin 58 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 57).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 116) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((58 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 57).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 57 p57 p58 w58 r58
    source58 Q0GaussPolynomialOrder58.identities_checked
    node hinj hroot f hf

theorem source59 : SourcePair 58 p58 p59 :=
  sourcePair_step 57 p57 p58 p59
    source58 Q0GaussPolynomialOrder59.recurrence_checked

theorem exactness59
    (node : Fin 59 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 58).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 118) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((59 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 58).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 58 p58 p59 w59 r59
    source59 Q0GaussPolynomialOrder59.identities_checked
    node hinj hroot f hf

theorem source60 : SourcePair 59 p59 p60 :=
  sourcePair_step 58 p58 p59 p60
    source59 Q0GaussPolynomialOrder60.recurrence_checked

theorem exactness60
    (node : Fin 60 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 59).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 120) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((60 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 59).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 59 p59 p60 w60 r60
    source60 Q0GaussPolynomialOrder60.identities_checked
    node hinj hroot f hf

theorem source61 : SourcePair 60 p60 p61 :=
  sourcePair_step 59 p59 p60 p61
    source60 Q0GaussPolynomialOrder61.recurrence_checked

theorem exactness61
    (node : Fin 61 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 60).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 122) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((61 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 60).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 60 p60 p61 w61 r61
    source61 Q0GaussPolynomialOrder61.identities_checked
    node hinj hroot f hf

theorem source62 : SourcePair 61 p61 p62 :=
  sourcePair_step 60 p60 p61 p62
    source61 Q0GaussPolynomialOrder62.recurrence_checked

theorem exactness62
    (node : Fin 62 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 61).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 124) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((62 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 61).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 61 p61 p62 w62 r62
    source62 Q0GaussPolynomialOrder62.identities_checked
    node hinj hroot f hf

theorem source63 : SourcePair 62 p62 p63 :=
  sourcePair_step 61 p61 p62 p63
    source62 Q0GaussPolynomialOrder63.recurrence_checked

theorem exactness63
    (node : Fin 63 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 62).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 126) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((63 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 62).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 62 p62 p63 w63 r63
    source63 Q0GaussPolynomialOrder63.identities_checked
    node hinj hroot f hf

theorem source64 : SourcePair 63 p63 p64 :=
  sourcePair_step 62 p62 p63 p64
    source63 Q0GaussPolynomialOrder64.recurrence_checked

theorem exactness64
    (node : Fin 64 → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) 63).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 128) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        ((64 : ℝ) ^ 2 * ((Q0LegendreInteger.realPair (node i) 63).1) ^ 2)) *
        f.eval (node i) := by
  exact actual_exactness_of_check 63 p63 p64 w64 r64
    source64 Q0GaussPolynomialOrder64.identities_checked
    node hinj hroot f hf

/-- Every order used by the production rule, with finite polynomial inputs discharged. -/
theorem exactness (k : Fin 64)
    (node : Fin (k.val + 1) → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (Q0LegendreInteger.realPair (node i) k.val).2 = 0)
    (f : ℝ[X]) (hf : f.natDegree < 2 * (k.val + 1)) :
    (∫ x in (-1 : ℝ)..1, f.eval x) =
      ∑ i, (2 * (1 - node i ^ 2) /
        (((k.val + 1 : ℕ) : ℝ) ^ 2 *
          ((Q0LegendreInteger.realPair (node i) k.val).1) ^ 2)) * f.eval (node i) := by
  fin_cases k
  · simpa only [Nat.cast_one] using exactness01 node hinj hroot f hf
  · exact exactness02 node hinj hroot f hf
  · exact exactness03 node hinj hroot f hf
  · exact exactness04 node hinj hroot f hf
  · exact exactness05 node hinj hroot f hf
  · exact exactness06 node hinj hroot f hf
  · exact exactness07 node hinj hroot f hf
  · exact exactness08 node hinj hroot f hf
  · exact exactness09 node hinj hroot f hf
  · exact exactness10 node hinj hroot f hf
  · exact exactness11 node hinj hroot f hf
  · exact exactness12 node hinj hroot f hf
  · exact exactness13 node hinj hroot f hf
  · exact exactness14 node hinj hroot f hf
  · exact exactness15 node hinj hroot f hf
  · exact exactness16 node hinj hroot f hf
  · exact exactness17 node hinj hroot f hf
  · exact exactness18 node hinj hroot f hf
  · exact exactness19 node hinj hroot f hf
  · exact exactness20 node hinj hroot f hf
  · exact exactness21 node hinj hroot f hf
  · exact exactness22 node hinj hroot f hf
  · exact exactness23 node hinj hroot f hf
  · exact exactness24 node hinj hroot f hf
  · exact exactness25 node hinj hroot f hf
  · exact exactness26 node hinj hroot f hf
  · exact exactness27 node hinj hroot f hf
  · exact exactness28 node hinj hroot f hf
  · exact exactness29 node hinj hroot f hf
  · exact exactness30 node hinj hroot f hf
  · exact exactness31 node hinj hroot f hf
  · exact exactness32 node hinj hroot f hf
  · exact exactness33 node hinj hroot f hf
  · exact exactness34 node hinj hroot f hf
  · exact exactness35 node hinj hroot f hf
  · exact exactness36 node hinj hroot f hf
  · exact exactness37 node hinj hroot f hf
  · exact exactness38 node hinj hroot f hf
  · exact exactness39 node hinj hroot f hf
  · exact exactness40 node hinj hroot f hf
  · exact exactness41 node hinj hroot f hf
  · exact exactness42 node hinj hroot f hf
  · exact exactness43 node hinj hroot f hf
  · exact exactness44 node hinj hroot f hf
  · exact exactness45 node hinj hroot f hf
  · exact exactness46 node hinj hroot f hf
  · exact exactness47 node hinj hroot f hf
  · exact exactness48 node hinj hroot f hf
  · exact exactness49 node hinj hroot f hf
  · exact exactness50 node hinj hroot f hf
  · exact exactness51 node hinj hroot f hf
  · exact exactness52 node hinj hroot f hf
  · exact exactness53 node hinj hroot f hf
  · exact exactness54 node hinj hroot f hf
  · exact exactness55 node hinj hroot f hf
  · exact exactness56 node hinj hroot f hf
  · exact exactness57 node hinj hroot f hf
  · exact exactness58 node hinj hroot f hf
  · exact exactness59 node hinj hroot f hf
  · exact exactness60 node hinj hroot f hf
  · exact exactness61 node hinj hroot f hf
  · exact exactness62 node hinj hroot f hf
  · exact exactness63 node hinj hroot f hf
  · exact exactness64 node hinj hroot f hf

end Grothe.UpperChaos.Q0GaussPolynomialCertificates
