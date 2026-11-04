import Grothe.UpperChaos.OriginalRow227CheckpointData
import Grothe.UpperChaos.OriginalRow227RootBindings00
import Grothe.UpperChaos.OriginalRow227RootBindings01
import Grothe.UpperChaos.OriginalRow227RootBindings02
import Grothe.UpperChaos.OriginalRow227RootBindings03
import Grothe.UpperChaos.OriginalRow227RootBindings04
import Grothe.UpperChaos.OriginalRow227RootBindings05
import Grothe.UpperChaos.OriginalRow227RootBindings06
import Grothe.UpperChaos.OriginalRow227RootBindings07
import Grothe.UpperChaos.OriginalRow227RootBindings08
import Grothe.UpperChaos.OriginalRow227RootBindings09
import Grothe.UpperChaos.OriginalRow227RootBindings10
import Grothe.UpperChaos.OriginalRow227RootBindings11
import Grothe.UpperChaos.OriginalRow227RootBindings12
import Grothe.UpperChaos.OriginalRow227RootBindings13
import Grothe.UpperChaos.OriginalRow227RootBindings14
import Grothe.UpperChaos.OriginalRow227RootBindings15

/-! Generated root binding. Reuses every original named interval
and checked fact, without repeating root arithmetic or evaluating a large list.
Agent-ID: codex-aa04. Refs #293, #21. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227Roots
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227RootLookup OriginalRow227TriangleShared

theorem root_properties (n : ℕ) (hn : 0 < n) (hnM : n < 502) :
    sqrtCheck n (S n) = true ∧ 0 < (S n).lo.toRat ∧
      0 < (roundedMul (-768) shift (S n)).lo.toRat := by
  by_cases h251 : n < 251
  ·
    by_cases h126 : n < 126
    ·
      by_cases h63 : n < 63
      ·
        by_cases h32 : n < 32
        ·
          by_cases h16 : n < 16
          ·
            by_cases h8 : n < 8
            ·
              by_cases h4 : n < 4
              ·
                by_cases h2 : n < 2
                ·
                  have he : n = 1 := by omega
                  subst n
                  exact ⟨OriginalRow227RootBindings00.root1_checked, OriginalRow227RootBindings00.root1_pos,
                    OriginalRow227RootBindings00.product1_pos⟩
                ·
                  by_cases h3 : n < 3
                  ·
                    have he : n = 2 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root2_checked, OriginalRow227RootBindings00.root2_pos,
                      OriginalRow227RootBindings00.product2_pos⟩
                  ·
                    have he : n = 3 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root3_checked, OriginalRow227RootBindings00.root3_pos,
                      OriginalRow227RootBindings00.product3_pos⟩
              ·
                by_cases h6 : n < 6
                ·
                  by_cases h5 : n < 5
                  ·
                    have he : n = 4 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root4_checked, OriginalRow227RootBindings00.root4_pos,
                      OriginalRow227RootBindings00.product4_pos⟩
                  ·
                    have he : n = 5 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root5_checked, OriginalRow227RootBindings00.root5_pos,
                      OriginalRow227RootBindings00.product5_pos⟩
                ·
                  by_cases h7 : n < 7
                  ·
                    have he : n = 6 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root6_checked, OriginalRow227RootBindings00.root6_pos,
                      OriginalRow227RootBindings00.product6_pos⟩
                  ·
                    have he : n = 7 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root7_checked, OriginalRow227RootBindings00.root7_pos,
                      OriginalRow227RootBindings00.product7_pos⟩
            ·
              by_cases h12 : n < 12
              ·
                by_cases h10 : n < 10
                ·
                  by_cases h9 : n < 9
                  ·
                    have he : n = 8 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root8_checked, OriginalRow227RootBindings00.root8_pos,
                      OriginalRow227RootBindings00.product8_pos⟩
                  ·
                    have he : n = 9 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root9_checked, OriginalRow227RootBindings00.root9_pos,
                      OriginalRow227RootBindings00.product9_pos⟩
                ·
                  by_cases h11 : n < 11
                  ·
                    have he : n = 10 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root10_checked, OriginalRow227RootBindings00.root10_pos,
                      OriginalRow227RootBindings00.product10_pos⟩
                  ·
                    have he : n = 11 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root11_checked, OriginalRow227RootBindings00.root11_pos,
                      OriginalRow227RootBindings00.product11_pos⟩
              ·
                by_cases h14 : n < 14
                ·
                  by_cases h13 : n < 13
                  ·
                    have he : n = 12 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root12_checked, OriginalRow227RootBindings00.root12_pos,
                      OriginalRow227RootBindings00.product12_pos⟩
                  ·
                    have he : n = 13 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root13_checked, OriginalRow227RootBindings00.root13_pos,
                      OriginalRow227RootBindings00.product13_pos⟩
                ·
                  by_cases h15 : n < 15
                  ·
                    have he : n = 14 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root14_checked, OriginalRow227RootBindings00.root14_pos,
                      OriginalRow227RootBindings00.product14_pos⟩
                  ·
                    have he : n = 15 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root15_checked, OriginalRow227RootBindings00.root15_pos,
                      OriginalRow227RootBindings00.product15_pos⟩
          ·
            by_cases h24 : n < 24
            ·
              by_cases h20 : n < 20
              ·
                by_cases h18 : n < 18
                ·
                  by_cases h17 : n < 17
                  ·
                    have he : n = 16 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root16_checked, OriginalRow227RootBindings00.root16_pos,
                      OriginalRow227RootBindings00.product16_pos⟩
                  ·
                    have he : n = 17 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root17_checked, OriginalRow227RootBindings00.root17_pos,
                      OriginalRow227RootBindings00.product17_pos⟩
                ·
                  by_cases h19 : n < 19
                  ·
                    have he : n = 18 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root18_checked, OriginalRow227RootBindings00.root18_pos,
                      OriginalRow227RootBindings00.product18_pos⟩
                  ·
                    have he : n = 19 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root19_checked, OriginalRow227RootBindings00.root19_pos,
                      OriginalRow227RootBindings00.product19_pos⟩
              ·
                by_cases h22 : n < 22
                ·
                  by_cases h21 : n < 21
                  ·
                    have he : n = 20 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root20_checked, OriginalRow227RootBindings00.root20_pos,
                      OriginalRow227RootBindings00.product20_pos⟩
                  ·
                    have he : n = 21 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root21_checked, OriginalRow227RootBindings00.root21_pos,
                      OriginalRow227RootBindings00.product21_pos⟩
                ·
                  by_cases h23 : n < 23
                  ·
                    have he : n = 22 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root22_checked, OriginalRow227RootBindings00.root22_pos,
                      OriginalRow227RootBindings00.product22_pos⟩
                  ·
                    have he : n = 23 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root23_checked, OriginalRow227RootBindings00.root23_pos,
                      OriginalRow227RootBindings00.product23_pos⟩
            ·
              by_cases h28 : n < 28
              ·
                by_cases h26 : n < 26
                ·
                  by_cases h25 : n < 25
                  ·
                    have he : n = 24 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root24_checked, OriginalRow227RootBindings00.root24_pos,
                      OriginalRow227RootBindings00.product24_pos⟩
                  ·
                    have he : n = 25 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root25_checked, OriginalRow227RootBindings00.root25_pos,
                      OriginalRow227RootBindings00.product25_pos⟩
                ·
                  by_cases h27 : n < 27
                  ·
                    have he : n = 26 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root26_checked, OriginalRow227RootBindings00.root26_pos,
                      OriginalRow227RootBindings00.product26_pos⟩
                  ·
                    have he : n = 27 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root27_checked, OriginalRow227RootBindings00.root27_pos,
                      OriginalRow227RootBindings00.product27_pos⟩
              ·
                by_cases h30 : n < 30
                ·
                  by_cases h29 : n < 29
                  ·
                    have he : n = 28 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root28_checked, OriginalRow227RootBindings00.root28_pos,
                      OriginalRow227RootBindings00.product28_pos⟩
                  ·
                    have he : n = 29 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root29_checked, OriginalRow227RootBindings00.root29_pos,
                      OriginalRow227RootBindings00.product29_pos⟩
                ·
                  by_cases h31 : n < 31
                  ·
                    have he : n = 30 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root30_checked, OriginalRow227RootBindings00.root30_pos,
                      OriginalRow227RootBindings00.product30_pos⟩
                  ·
                    have he : n = 31 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings00.root31_checked, OriginalRow227RootBindings00.root31_pos,
                      OriginalRow227RootBindings00.product31_pos⟩
        ·
          by_cases h47 : n < 47
          ·
            by_cases h39 : n < 39
            ·
              by_cases h35 : n < 35
              ·
                by_cases h33 : n < 33
                ·
                  have he : n = 32 := by omega
                  subst n
                  exact ⟨OriginalRow227RootBindings00.root32_checked, OriginalRow227RootBindings00.root32_pos,
                    OriginalRow227RootBindings00.product32_pos⟩
                ·
                  by_cases h34 : n < 34
                  ·
                    have he : n = 33 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root33_checked, OriginalRow227RootBindings01.root33_pos,
                      OriginalRow227RootBindings01.product33_pos⟩
                  ·
                    have he : n = 34 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root34_checked, OriginalRow227RootBindings01.root34_pos,
                      OriginalRow227RootBindings01.product34_pos⟩
              ·
                by_cases h37 : n < 37
                ·
                  by_cases h36 : n < 36
                  ·
                    have he : n = 35 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root35_checked, OriginalRow227RootBindings01.root35_pos,
                      OriginalRow227RootBindings01.product35_pos⟩
                  ·
                    have he : n = 36 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root36_checked, OriginalRow227RootBindings01.root36_pos,
                      OriginalRow227RootBindings01.product36_pos⟩
                ·
                  by_cases h38 : n < 38
                  ·
                    have he : n = 37 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root37_checked, OriginalRow227RootBindings01.root37_pos,
                      OriginalRow227RootBindings01.product37_pos⟩
                  ·
                    have he : n = 38 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root38_checked, OriginalRow227RootBindings01.root38_pos,
                      OriginalRow227RootBindings01.product38_pos⟩
            ·
              by_cases h43 : n < 43
              ·
                by_cases h41 : n < 41
                ·
                  by_cases h40 : n < 40
                  ·
                    have he : n = 39 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root39_checked, OriginalRow227RootBindings01.root39_pos,
                      OriginalRow227RootBindings01.product39_pos⟩
                  ·
                    have he : n = 40 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root40_checked, OriginalRow227RootBindings01.root40_pos,
                      OriginalRow227RootBindings01.product40_pos⟩
                ·
                  by_cases h42 : n < 42
                  ·
                    have he : n = 41 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root41_checked, OriginalRow227RootBindings01.root41_pos,
                      OriginalRow227RootBindings01.product41_pos⟩
                  ·
                    have he : n = 42 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root42_checked, OriginalRow227RootBindings01.root42_pos,
                      OriginalRow227RootBindings01.product42_pos⟩
              ·
                by_cases h45 : n < 45
                ·
                  by_cases h44 : n < 44
                  ·
                    have he : n = 43 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root43_checked, OriginalRow227RootBindings01.root43_pos,
                      OriginalRow227RootBindings01.product43_pos⟩
                  ·
                    have he : n = 44 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root44_checked, OriginalRow227RootBindings01.root44_pos,
                      OriginalRow227RootBindings01.product44_pos⟩
                ·
                  by_cases h46 : n < 46
                  ·
                    have he : n = 45 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root45_checked, OriginalRow227RootBindings01.root45_pos,
                      OriginalRow227RootBindings01.product45_pos⟩
                  ·
                    have he : n = 46 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root46_checked, OriginalRow227RootBindings01.root46_pos,
                      OriginalRow227RootBindings01.product46_pos⟩
          ·
            by_cases h55 : n < 55
            ·
              by_cases h51 : n < 51
              ·
                by_cases h49 : n < 49
                ·
                  by_cases h48 : n < 48
                  ·
                    have he : n = 47 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root47_checked, OriginalRow227RootBindings01.root47_pos,
                      OriginalRow227RootBindings01.product47_pos⟩
                  ·
                    have he : n = 48 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root48_checked, OriginalRow227RootBindings01.root48_pos,
                      OriginalRow227RootBindings01.product48_pos⟩
                ·
                  by_cases h50 : n < 50
                  ·
                    have he : n = 49 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root49_checked, OriginalRow227RootBindings01.root49_pos,
                      OriginalRow227RootBindings01.product49_pos⟩
                  ·
                    have he : n = 50 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root50_checked, OriginalRow227RootBindings01.root50_pos,
                      OriginalRow227RootBindings01.product50_pos⟩
              ·
                by_cases h53 : n < 53
                ·
                  by_cases h52 : n < 52
                  ·
                    have he : n = 51 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root51_checked, OriginalRow227RootBindings01.root51_pos,
                      OriginalRow227RootBindings01.product51_pos⟩
                  ·
                    have he : n = 52 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root52_checked, OriginalRow227RootBindings01.root52_pos,
                      OriginalRow227RootBindings01.product52_pos⟩
                ·
                  by_cases h54 : n < 54
                  ·
                    have he : n = 53 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root53_checked, OriginalRow227RootBindings01.root53_pos,
                      OriginalRow227RootBindings01.product53_pos⟩
                  ·
                    have he : n = 54 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root54_checked, OriginalRow227RootBindings01.root54_pos,
                      OriginalRow227RootBindings01.product54_pos⟩
            ·
              by_cases h59 : n < 59
              ·
                by_cases h57 : n < 57
                ·
                  by_cases h56 : n < 56
                  ·
                    have he : n = 55 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root55_checked, OriginalRow227RootBindings01.root55_pos,
                      OriginalRow227RootBindings01.product55_pos⟩
                  ·
                    have he : n = 56 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root56_checked, OriginalRow227RootBindings01.root56_pos,
                      OriginalRow227RootBindings01.product56_pos⟩
                ·
                  by_cases h58 : n < 58
                  ·
                    have he : n = 57 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root57_checked, OriginalRow227RootBindings01.root57_pos,
                      OriginalRow227RootBindings01.product57_pos⟩
                  ·
                    have he : n = 58 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root58_checked, OriginalRow227RootBindings01.root58_pos,
                      OriginalRow227RootBindings01.product58_pos⟩
              ·
                by_cases h61 : n < 61
                ·
                  by_cases h60 : n < 60
                  ·
                    have he : n = 59 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root59_checked, OriginalRow227RootBindings01.root59_pos,
                      OriginalRow227RootBindings01.product59_pos⟩
                  ·
                    have he : n = 60 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root60_checked, OriginalRow227RootBindings01.root60_pos,
                      OriginalRow227RootBindings01.product60_pos⟩
                ·
                  by_cases h62 : n < 62
                  ·
                    have he : n = 61 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root61_checked, OriginalRow227RootBindings01.root61_pos,
                      OriginalRow227RootBindings01.product61_pos⟩
                  ·
                    have he : n = 62 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root62_checked, OriginalRow227RootBindings01.root62_pos,
                      OriginalRow227RootBindings01.product62_pos⟩
      ·
        by_cases h94 : n < 94
        ·
          by_cases h78 : n < 78
          ·
            by_cases h70 : n < 70
            ·
              by_cases h66 : n < 66
              ·
                by_cases h64 : n < 64
                ·
                  have he : n = 63 := by omega
                  subst n
                  exact ⟨OriginalRow227RootBindings01.root63_checked, OriginalRow227RootBindings01.root63_pos,
                    OriginalRow227RootBindings01.product63_pos⟩
                ·
                  by_cases h65 : n < 65
                  ·
                    have he : n = 64 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings01.root64_checked, OriginalRow227RootBindings01.root64_pos,
                      OriginalRow227RootBindings01.product64_pos⟩
                  ·
                    have he : n = 65 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root65_checked, OriginalRow227RootBindings02.root65_pos,
                      OriginalRow227RootBindings02.product65_pos⟩
              ·
                by_cases h68 : n < 68
                ·
                  by_cases h67 : n < 67
                  ·
                    have he : n = 66 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root66_checked, OriginalRow227RootBindings02.root66_pos,
                      OriginalRow227RootBindings02.product66_pos⟩
                  ·
                    have he : n = 67 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root67_checked, OriginalRow227RootBindings02.root67_pos,
                      OriginalRow227RootBindings02.product67_pos⟩
                ·
                  by_cases h69 : n < 69
                  ·
                    have he : n = 68 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root68_checked, OriginalRow227RootBindings02.root68_pos,
                      OriginalRow227RootBindings02.product68_pos⟩
                  ·
                    have he : n = 69 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root69_checked, OriginalRow227RootBindings02.root69_pos,
                      OriginalRow227RootBindings02.product69_pos⟩
            ·
              by_cases h74 : n < 74
              ·
                by_cases h72 : n < 72
                ·
                  by_cases h71 : n < 71
                  ·
                    have he : n = 70 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root70_checked, OriginalRow227RootBindings02.root70_pos,
                      OriginalRow227RootBindings02.product70_pos⟩
                  ·
                    have he : n = 71 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root71_checked, OriginalRow227RootBindings02.root71_pos,
                      OriginalRow227RootBindings02.product71_pos⟩
                ·
                  by_cases h73 : n < 73
                  ·
                    have he : n = 72 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root72_checked, OriginalRow227RootBindings02.root72_pos,
                      OriginalRow227RootBindings02.product72_pos⟩
                  ·
                    have he : n = 73 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root73_checked, OriginalRow227RootBindings02.root73_pos,
                      OriginalRow227RootBindings02.product73_pos⟩
              ·
                by_cases h76 : n < 76
                ·
                  by_cases h75 : n < 75
                  ·
                    have he : n = 74 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root74_checked, OriginalRow227RootBindings02.root74_pos,
                      OriginalRow227RootBindings02.product74_pos⟩
                  ·
                    have he : n = 75 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root75_checked, OriginalRow227RootBindings02.root75_pos,
                      OriginalRow227RootBindings02.product75_pos⟩
                ·
                  by_cases h77 : n < 77
                  ·
                    have he : n = 76 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root76_checked, OriginalRow227RootBindings02.root76_pos,
                      OriginalRow227RootBindings02.product76_pos⟩
                  ·
                    have he : n = 77 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root77_checked, OriginalRow227RootBindings02.root77_pos,
                      OriginalRow227RootBindings02.product77_pos⟩
          ·
            by_cases h86 : n < 86
            ·
              by_cases h82 : n < 82
              ·
                by_cases h80 : n < 80
                ·
                  by_cases h79 : n < 79
                  ·
                    have he : n = 78 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root78_checked, OriginalRow227RootBindings02.root78_pos,
                      OriginalRow227RootBindings02.product78_pos⟩
                  ·
                    have he : n = 79 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root79_checked, OriginalRow227RootBindings02.root79_pos,
                      OriginalRow227RootBindings02.product79_pos⟩
                ·
                  by_cases h81 : n < 81
                  ·
                    have he : n = 80 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root80_checked, OriginalRow227RootBindings02.root80_pos,
                      OriginalRow227RootBindings02.product80_pos⟩
                  ·
                    have he : n = 81 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root81_checked, OriginalRow227RootBindings02.root81_pos,
                      OriginalRow227RootBindings02.product81_pos⟩
              ·
                by_cases h84 : n < 84
                ·
                  by_cases h83 : n < 83
                  ·
                    have he : n = 82 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root82_checked, OriginalRow227RootBindings02.root82_pos,
                      OriginalRow227RootBindings02.product82_pos⟩
                  ·
                    have he : n = 83 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root83_checked, OriginalRow227RootBindings02.root83_pos,
                      OriginalRow227RootBindings02.product83_pos⟩
                ·
                  by_cases h85 : n < 85
                  ·
                    have he : n = 84 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root84_checked, OriginalRow227RootBindings02.root84_pos,
                      OriginalRow227RootBindings02.product84_pos⟩
                  ·
                    have he : n = 85 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root85_checked, OriginalRow227RootBindings02.root85_pos,
                      OriginalRow227RootBindings02.product85_pos⟩
            ·
              by_cases h90 : n < 90
              ·
                by_cases h88 : n < 88
                ·
                  by_cases h87 : n < 87
                  ·
                    have he : n = 86 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root86_checked, OriginalRow227RootBindings02.root86_pos,
                      OriginalRow227RootBindings02.product86_pos⟩
                  ·
                    have he : n = 87 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root87_checked, OriginalRow227RootBindings02.root87_pos,
                      OriginalRow227RootBindings02.product87_pos⟩
                ·
                  by_cases h89 : n < 89
                  ·
                    have he : n = 88 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root88_checked, OriginalRow227RootBindings02.root88_pos,
                      OriginalRow227RootBindings02.product88_pos⟩
                  ·
                    have he : n = 89 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root89_checked, OriginalRow227RootBindings02.root89_pos,
                      OriginalRow227RootBindings02.product89_pos⟩
              ·
                by_cases h92 : n < 92
                ·
                  by_cases h91 : n < 91
                  ·
                    have he : n = 90 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root90_checked, OriginalRow227RootBindings02.root90_pos,
                      OriginalRow227RootBindings02.product90_pos⟩
                  ·
                    have he : n = 91 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root91_checked, OriginalRow227RootBindings02.root91_pos,
                      OriginalRow227RootBindings02.product91_pos⟩
                ·
                  by_cases h93 : n < 93
                  ·
                    have he : n = 92 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root92_checked, OriginalRow227RootBindings02.root92_pos,
                      OriginalRow227RootBindings02.product92_pos⟩
                  ·
                    have he : n = 93 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root93_checked, OriginalRow227RootBindings02.root93_pos,
                      OriginalRow227RootBindings02.product93_pos⟩
        ·
          by_cases h110 : n < 110
          ·
            by_cases h102 : n < 102
            ·
              by_cases h98 : n < 98
              ·
                by_cases h96 : n < 96
                ·
                  by_cases h95 : n < 95
                  ·
                    have he : n = 94 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root94_checked, OriginalRow227RootBindings02.root94_pos,
                      OriginalRow227RootBindings02.product94_pos⟩
                  ·
                    have he : n = 95 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root95_checked, OriginalRow227RootBindings02.root95_pos,
                      OriginalRow227RootBindings02.product95_pos⟩
                ·
                  by_cases h97 : n < 97
                  ·
                    have he : n = 96 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings02.root96_checked, OriginalRow227RootBindings02.root96_pos,
                      OriginalRow227RootBindings02.product96_pos⟩
                  ·
                    have he : n = 97 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root97_checked, OriginalRow227RootBindings03.root97_pos,
                      OriginalRow227RootBindings03.product97_pos⟩
              ·
                by_cases h100 : n < 100
                ·
                  by_cases h99 : n < 99
                  ·
                    have he : n = 98 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root98_checked, OriginalRow227RootBindings03.root98_pos,
                      OriginalRow227RootBindings03.product98_pos⟩
                  ·
                    have he : n = 99 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root99_checked, OriginalRow227RootBindings03.root99_pos,
                      OriginalRow227RootBindings03.product99_pos⟩
                ·
                  by_cases h101 : n < 101
                  ·
                    have he : n = 100 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root100_checked, OriginalRow227RootBindings03.root100_pos,
                      OriginalRow227RootBindings03.product100_pos⟩
                  ·
                    have he : n = 101 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root101_checked, OriginalRow227RootBindings03.root101_pos,
                      OriginalRow227RootBindings03.product101_pos⟩
            ·
              by_cases h106 : n < 106
              ·
                by_cases h104 : n < 104
                ·
                  by_cases h103 : n < 103
                  ·
                    have he : n = 102 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root102_checked, OriginalRow227RootBindings03.root102_pos,
                      OriginalRow227RootBindings03.product102_pos⟩
                  ·
                    have he : n = 103 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root103_checked, OriginalRow227RootBindings03.root103_pos,
                      OriginalRow227RootBindings03.product103_pos⟩
                ·
                  by_cases h105 : n < 105
                  ·
                    have he : n = 104 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root104_checked, OriginalRow227RootBindings03.root104_pos,
                      OriginalRow227RootBindings03.product104_pos⟩
                  ·
                    have he : n = 105 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root105_checked, OriginalRow227RootBindings03.root105_pos,
                      OriginalRow227RootBindings03.product105_pos⟩
              ·
                by_cases h108 : n < 108
                ·
                  by_cases h107 : n < 107
                  ·
                    have he : n = 106 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root106_checked, OriginalRow227RootBindings03.root106_pos,
                      OriginalRow227RootBindings03.product106_pos⟩
                  ·
                    have he : n = 107 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root107_checked, OriginalRow227RootBindings03.root107_pos,
                      OriginalRow227RootBindings03.product107_pos⟩
                ·
                  by_cases h109 : n < 109
                  ·
                    have he : n = 108 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root108_checked, OriginalRow227RootBindings03.root108_pos,
                      OriginalRow227RootBindings03.product108_pos⟩
                  ·
                    have he : n = 109 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root109_checked, OriginalRow227RootBindings03.root109_pos,
                      OriginalRow227RootBindings03.product109_pos⟩
          ·
            by_cases h118 : n < 118
            ·
              by_cases h114 : n < 114
              ·
                by_cases h112 : n < 112
                ·
                  by_cases h111 : n < 111
                  ·
                    have he : n = 110 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root110_checked, OriginalRow227RootBindings03.root110_pos,
                      OriginalRow227RootBindings03.product110_pos⟩
                  ·
                    have he : n = 111 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root111_checked, OriginalRow227RootBindings03.root111_pos,
                      OriginalRow227RootBindings03.product111_pos⟩
                ·
                  by_cases h113 : n < 113
                  ·
                    have he : n = 112 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root112_checked, OriginalRow227RootBindings03.root112_pos,
                      OriginalRow227RootBindings03.product112_pos⟩
                  ·
                    have he : n = 113 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root113_checked, OriginalRow227RootBindings03.root113_pos,
                      OriginalRow227RootBindings03.product113_pos⟩
              ·
                by_cases h116 : n < 116
                ·
                  by_cases h115 : n < 115
                  ·
                    have he : n = 114 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root114_checked, OriginalRow227RootBindings03.root114_pos,
                      OriginalRow227RootBindings03.product114_pos⟩
                  ·
                    have he : n = 115 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root115_checked, OriginalRow227RootBindings03.root115_pos,
                      OriginalRow227RootBindings03.product115_pos⟩
                ·
                  by_cases h117 : n < 117
                  ·
                    have he : n = 116 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root116_checked, OriginalRow227RootBindings03.root116_pos,
                      OriginalRow227RootBindings03.product116_pos⟩
                  ·
                    have he : n = 117 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root117_checked, OriginalRow227RootBindings03.root117_pos,
                      OriginalRow227RootBindings03.product117_pos⟩
            ·
              by_cases h122 : n < 122
              ·
                by_cases h120 : n < 120
                ·
                  by_cases h119 : n < 119
                  ·
                    have he : n = 118 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root118_checked, OriginalRow227RootBindings03.root118_pos,
                      OriginalRow227RootBindings03.product118_pos⟩
                  ·
                    have he : n = 119 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root119_checked, OriginalRow227RootBindings03.root119_pos,
                      OriginalRow227RootBindings03.product119_pos⟩
                ·
                  by_cases h121 : n < 121
                  ·
                    have he : n = 120 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root120_checked, OriginalRow227RootBindings03.root120_pos,
                      OriginalRow227RootBindings03.product120_pos⟩
                  ·
                    have he : n = 121 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root121_checked, OriginalRow227RootBindings03.root121_pos,
                      OriginalRow227RootBindings03.product121_pos⟩
              ·
                by_cases h124 : n < 124
                ·
                  by_cases h123 : n < 123
                  ·
                    have he : n = 122 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root122_checked, OriginalRow227RootBindings03.root122_pos,
                      OriginalRow227RootBindings03.product122_pos⟩
                  ·
                    have he : n = 123 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root123_checked, OriginalRow227RootBindings03.root123_pos,
                      OriginalRow227RootBindings03.product123_pos⟩
                ·
                  by_cases h125 : n < 125
                  ·
                    have he : n = 124 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root124_checked, OriginalRow227RootBindings03.root124_pos,
                      OriginalRow227RootBindings03.product124_pos⟩
                  ·
                    have he : n = 125 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root125_checked, OriginalRow227RootBindings03.root125_pos,
                      OriginalRow227RootBindings03.product125_pos⟩
    ·
      by_cases h188 : n < 188
      ·
        by_cases h157 : n < 157
        ·
          by_cases h141 : n < 141
          ·
            by_cases h133 : n < 133
            ·
              by_cases h129 : n < 129
              ·
                by_cases h127 : n < 127
                ·
                  have he : n = 126 := by omega
                  subst n
                  exact ⟨OriginalRow227RootBindings03.root126_checked, OriginalRow227RootBindings03.root126_pos,
                    OriginalRow227RootBindings03.product126_pos⟩
                ·
                  by_cases h128 : n < 128
                  ·
                    have he : n = 127 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root127_checked, OriginalRow227RootBindings03.root127_pos,
                      OriginalRow227RootBindings03.product127_pos⟩
                  ·
                    have he : n = 128 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings03.root128_checked, OriginalRow227RootBindings03.root128_pos,
                      OriginalRow227RootBindings03.product128_pos⟩
              ·
                by_cases h131 : n < 131
                ·
                  by_cases h130 : n < 130
                  ·
                    have he : n = 129 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root129_checked, OriginalRow227RootBindings04.root129_pos,
                      OriginalRow227RootBindings04.product129_pos⟩
                  ·
                    have he : n = 130 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root130_checked, OriginalRow227RootBindings04.root130_pos,
                      OriginalRow227RootBindings04.product130_pos⟩
                ·
                  by_cases h132 : n < 132
                  ·
                    have he : n = 131 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root131_checked, OriginalRow227RootBindings04.root131_pos,
                      OriginalRow227RootBindings04.product131_pos⟩
                  ·
                    have he : n = 132 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root132_checked, OriginalRow227RootBindings04.root132_pos,
                      OriginalRow227RootBindings04.product132_pos⟩
            ·
              by_cases h137 : n < 137
              ·
                by_cases h135 : n < 135
                ·
                  by_cases h134 : n < 134
                  ·
                    have he : n = 133 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root133_checked, OriginalRow227RootBindings04.root133_pos,
                      OriginalRow227RootBindings04.product133_pos⟩
                  ·
                    have he : n = 134 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root134_checked, OriginalRow227RootBindings04.root134_pos,
                      OriginalRow227RootBindings04.product134_pos⟩
                ·
                  by_cases h136 : n < 136
                  ·
                    have he : n = 135 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root135_checked, OriginalRow227RootBindings04.root135_pos,
                      OriginalRow227RootBindings04.product135_pos⟩
                  ·
                    have he : n = 136 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root136_checked, OriginalRow227RootBindings04.root136_pos,
                      OriginalRow227RootBindings04.product136_pos⟩
              ·
                by_cases h139 : n < 139
                ·
                  by_cases h138 : n < 138
                  ·
                    have he : n = 137 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root137_checked, OriginalRow227RootBindings04.root137_pos,
                      OriginalRow227RootBindings04.product137_pos⟩
                  ·
                    have he : n = 138 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root138_checked, OriginalRow227RootBindings04.root138_pos,
                      OriginalRow227RootBindings04.product138_pos⟩
                ·
                  by_cases h140 : n < 140
                  ·
                    have he : n = 139 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root139_checked, OriginalRow227RootBindings04.root139_pos,
                      OriginalRow227RootBindings04.product139_pos⟩
                  ·
                    have he : n = 140 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root140_checked, OriginalRow227RootBindings04.root140_pos,
                      OriginalRow227RootBindings04.product140_pos⟩
          ·
            by_cases h149 : n < 149
            ·
              by_cases h145 : n < 145
              ·
                by_cases h143 : n < 143
                ·
                  by_cases h142 : n < 142
                  ·
                    have he : n = 141 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root141_checked, OriginalRow227RootBindings04.root141_pos,
                      OriginalRow227RootBindings04.product141_pos⟩
                  ·
                    have he : n = 142 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root142_checked, OriginalRow227RootBindings04.root142_pos,
                      OriginalRow227RootBindings04.product142_pos⟩
                ·
                  by_cases h144 : n < 144
                  ·
                    have he : n = 143 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root143_checked, OriginalRow227RootBindings04.root143_pos,
                      OriginalRow227RootBindings04.product143_pos⟩
                  ·
                    have he : n = 144 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root144_checked, OriginalRow227RootBindings04.root144_pos,
                      OriginalRow227RootBindings04.product144_pos⟩
              ·
                by_cases h147 : n < 147
                ·
                  by_cases h146 : n < 146
                  ·
                    have he : n = 145 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root145_checked, OriginalRow227RootBindings04.root145_pos,
                      OriginalRow227RootBindings04.product145_pos⟩
                  ·
                    have he : n = 146 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root146_checked, OriginalRow227RootBindings04.root146_pos,
                      OriginalRow227RootBindings04.product146_pos⟩
                ·
                  by_cases h148 : n < 148
                  ·
                    have he : n = 147 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root147_checked, OriginalRow227RootBindings04.root147_pos,
                      OriginalRow227RootBindings04.product147_pos⟩
                  ·
                    have he : n = 148 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root148_checked, OriginalRow227RootBindings04.root148_pos,
                      OriginalRow227RootBindings04.product148_pos⟩
            ·
              by_cases h153 : n < 153
              ·
                by_cases h151 : n < 151
                ·
                  by_cases h150 : n < 150
                  ·
                    have he : n = 149 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root149_checked, OriginalRow227RootBindings04.root149_pos,
                      OriginalRow227RootBindings04.product149_pos⟩
                  ·
                    have he : n = 150 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root150_checked, OriginalRow227RootBindings04.root150_pos,
                      OriginalRow227RootBindings04.product150_pos⟩
                ·
                  by_cases h152 : n < 152
                  ·
                    have he : n = 151 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root151_checked, OriginalRow227RootBindings04.root151_pos,
                      OriginalRow227RootBindings04.product151_pos⟩
                  ·
                    have he : n = 152 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root152_checked, OriginalRow227RootBindings04.root152_pos,
                      OriginalRow227RootBindings04.product152_pos⟩
              ·
                by_cases h155 : n < 155
                ·
                  by_cases h154 : n < 154
                  ·
                    have he : n = 153 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root153_checked, OriginalRow227RootBindings04.root153_pos,
                      OriginalRow227RootBindings04.product153_pos⟩
                  ·
                    have he : n = 154 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root154_checked, OriginalRow227RootBindings04.root154_pos,
                      OriginalRow227RootBindings04.product154_pos⟩
                ·
                  by_cases h156 : n < 156
                  ·
                    have he : n = 155 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root155_checked, OriginalRow227RootBindings04.root155_pos,
                      OriginalRow227RootBindings04.product155_pos⟩
                  ·
                    have he : n = 156 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root156_checked, OriginalRow227RootBindings04.root156_pos,
                      OriginalRow227RootBindings04.product156_pos⟩
        ·
          by_cases h172 : n < 172
          ·
            by_cases h164 : n < 164
            ·
              by_cases h160 : n < 160
              ·
                by_cases h158 : n < 158
                ·
                  have he : n = 157 := by omega
                  subst n
                  exact ⟨OriginalRow227RootBindings04.root157_checked, OriginalRow227RootBindings04.root157_pos,
                    OriginalRow227RootBindings04.product157_pos⟩
                ·
                  by_cases h159 : n < 159
                  ·
                    have he : n = 158 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root158_checked, OriginalRow227RootBindings04.root158_pos,
                      OriginalRow227RootBindings04.product158_pos⟩
                  ·
                    have he : n = 159 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root159_checked, OriginalRow227RootBindings04.root159_pos,
                      OriginalRow227RootBindings04.product159_pos⟩
              ·
                by_cases h162 : n < 162
                ·
                  by_cases h161 : n < 161
                  ·
                    have he : n = 160 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings04.root160_checked, OriginalRow227RootBindings04.root160_pos,
                      OriginalRow227RootBindings04.product160_pos⟩
                  ·
                    have he : n = 161 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root161_checked, OriginalRow227RootBindings05.root161_pos,
                      OriginalRow227RootBindings05.product161_pos⟩
                ·
                  by_cases h163 : n < 163
                  ·
                    have he : n = 162 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root162_checked, OriginalRow227RootBindings05.root162_pos,
                      OriginalRow227RootBindings05.product162_pos⟩
                  ·
                    have he : n = 163 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root163_checked, OriginalRow227RootBindings05.root163_pos,
                      OriginalRow227RootBindings05.product163_pos⟩
            ·
              by_cases h168 : n < 168
              ·
                by_cases h166 : n < 166
                ·
                  by_cases h165 : n < 165
                  ·
                    have he : n = 164 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root164_checked, OriginalRow227RootBindings05.root164_pos,
                      OriginalRow227RootBindings05.product164_pos⟩
                  ·
                    have he : n = 165 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root165_checked, OriginalRow227RootBindings05.root165_pos,
                      OriginalRow227RootBindings05.product165_pos⟩
                ·
                  by_cases h167 : n < 167
                  ·
                    have he : n = 166 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root166_checked, OriginalRow227RootBindings05.root166_pos,
                      OriginalRow227RootBindings05.product166_pos⟩
                  ·
                    have he : n = 167 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root167_checked, OriginalRow227RootBindings05.root167_pos,
                      OriginalRow227RootBindings05.product167_pos⟩
              ·
                by_cases h170 : n < 170
                ·
                  by_cases h169 : n < 169
                  ·
                    have he : n = 168 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root168_checked, OriginalRow227RootBindings05.root168_pos,
                      OriginalRow227RootBindings05.product168_pos⟩
                  ·
                    have he : n = 169 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root169_checked, OriginalRow227RootBindings05.root169_pos,
                      OriginalRow227RootBindings05.product169_pos⟩
                ·
                  by_cases h171 : n < 171
                  ·
                    have he : n = 170 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root170_checked, OriginalRow227RootBindings05.root170_pos,
                      OriginalRow227RootBindings05.product170_pos⟩
                  ·
                    have he : n = 171 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root171_checked, OriginalRow227RootBindings05.root171_pos,
                      OriginalRow227RootBindings05.product171_pos⟩
          ·
            by_cases h180 : n < 180
            ·
              by_cases h176 : n < 176
              ·
                by_cases h174 : n < 174
                ·
                  by_cases h173 : n < 173
                  ·
                    have he : n = 172 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root172_checked, OriginalRow227RootBindings05.root172_pos,
                      OriginalRow227RootBindings05.product172_pos⟩
                  ·
                    have he : n = 173 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root173_checked, OriginalRow227RootBindings05.root173_pos,
                      OriginalRow227RootBindings05.product173_pos⟩
                ·
                  by_cases h175 : n < 175
                  ·
                    have he : n = 174 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root174_checked, OriginalRow227RootBindings05.root174_pos,
                      OriginalRow227RootBindings05.product174_pos⟩
                  ·
                    have he : n = 175 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root175_checked, OriginalRow227RootBindings05.root175_pos,
                      OriginalRow227RootBindings05.product175_pos⟩
              ·
                by_cases h178 : n < 178
                ·
                  by_cases h177 : n < 177
                  ·
                    have he : n = 176 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root176_checked, OriginalRow227RootBindings05.root176_pos,
                      OriginalRow227RootBindings05.product176_pos⟩
                  ·
                    have he : n = 177 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root177_checked, OriginalRow227RootBindings05.root177_pos,
                      OriginalRow227RootBindings05.product177_pos⟩
                ·
                  by_cases h179 : n < 179
                  ·
                    have he : n = 178 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root178_checked, OriginalRow227RootBindings05.root178_pos,
                      OriginalRow227RootBindings05.product178_pos⟩
                  ·
                    have he : n = 179 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root179_checked, OriginalRow227RootBindings05.root179_pos,
                      OriginalRow227RootBindings05.product179_pos⟩
            ·
              by_cases h184 : n < 184
              ·
                by_cases h182 : n < 182
                ·
                  by_cases h181 : n < 181
                  ·
                    have he : n = 180 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root180_checked, OriginalRow227RootBindings05.root180_pos,
                      OriginalRow227RootBindings05.product180_pos⟩
                  ·
                    have he : n = 181 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root181_checked, OriginalRow227RootBindings05.root181_pos,
                      OriginalRow227RootBindings05.product181_pos⟩
                ·
                  by_cases h183 : n < 183
                  ·
                    have he : n = 182 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root182_checked, OriginalRow227RootBindings05.root182_pos,
                      OriginalRow227RootBindings05.product182_pos⟩
                  ·
                    have he : n = 183 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root183_checked, OriginalRow227RootBindings05.root183_pos,
                      OriginalRow227RootBindings05.product183_pos⟩
              ·
                by_cases h186 : n < 186
                ·
                  by_cases h185 : n < 185
                  ·
                    have he : n = 184 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root184_checked, OriginalRow227RootBindings05.root184_pos,
                      OriginalRow227RootBindings05.product184_pos⟩
                  ·
                    have he : n = 185 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root185_checked, OriginalRow227RootBindings05.root185_pos,
                      OriginalRow227RootBindings05.product185_pos⟩
                ·
                  by_cases h187 : n < 187
                  ·
                    have he : n = 186 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root186_checked, OriginalRow227RootBindings05.root186_pos,
                      OriginalRow227RootBindings05.product186_pos⟩
                  ·
                    have he : n = 187 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root187_checked, OriginalRow227RootBindings05.root187_pos,
                      OriginalRow227RootBindings05.product187_pos⟩
      ·
        by_cases h219 : n < 219
        ·
          by_cases h203 : n < 203
          ·
            by_cases h195 : n < 195
            ·
              by_cases h191 : n < 191
              ·
                by_cases h189 : n < 189
                ·
                  have he : n = 188 := by omega
                  subst n
                  exact ⟨OriginalRow227RootBindings05.root188_checked, OriginalRow227RootBindings05.root188_pos,
                    OriginalRow227RootBindings05.product188_pos⟩
                ·
                  by_cases h190 : n < 190
                  ·
                    have he : n = 189 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root189_checked, OriginalRow227RootBindings05.root189_pos,
                      OriginalRow227RootBindings05.product189_pos⟩
                  ·
                    have he : n = 190 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root190_checked, OriginalRow227RootBindings05.root190_pos,
                      OriginalRow227RootBindings05.product190_pos⟩
              ·
                by_cases h193 : n < 193
                ·
                  by_cases h192 : n < 192
                  ·
                    have he : n = 191 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root191_checked, OriginalRow227RootBindings05.root191_pos,
                      OriginalRow227RootBindings05.product191_pos⟩
                  ·
                    have he : n = 192 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings05.root192_checked, OriginalRow227RootBindings05.root192_pos,
                      OriginalRow227RootBindings05.product192_pos⟩
                ·
                  by_cases h194 : n < 194
                  ·
                    have he : n = 193 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root193_checked, OriginalRow227RootBindings06.root193_pos,
                      OriginalRow227RootBindings06.product193_pos⟩
                  ·
                    have he : n = 194 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root194_checked, OriginalRow227RootBindings06.root194_pos,
                      OriginalRow227RootBindings06.product194_pos⟩
            ·
              by_cases h199 : n < 199
              ·
                by_cases h197 : n < 197
                ·
                  by_cases h196 : n < 196
                  ·
                    have he : n = 195 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root195_checked, OriginalRow227RootBindings06.root195_pos,
                      OriginalRow227RootBindings06.product195_pos⟩
                  ·
                    have he : n = 196 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root196_checked, OriginalRow227RootBindings06.root196_pos,
                      OriginalRow227RootBindings06.product196_pos⟩
                ·
                  by_cases h198 : n < 198
                  ·
                    have he : n = 197 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root197_checked, OriginalRow227RootBindings06.root197_pos,
                      OriginalRow227RootBindings06.product197_pos⟩
                  ·
                    have he : n = 198 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root198_checked, OriginalRow227RootBindings06.root198_pos,
                      OriginalRow227RootBindings06.product198_pos⟩
              ·
                by_cases h201 : n < 201
                ·
                  by_cases h200 : n < 200
                  ·
                    have he : n = 199 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root199_checked, OriginalRow227RootBindings06.root199_pos,
                      OriginalRow227RootBindings06.product199_pos⟩
                  ·
                    have he : n = 200 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root200_checked, OriginalRow227RootBindings06.root200_pos,
                      OriginalRow227RootBindings06.product200_pos⟩
                ·
                  by_cases h202 : n < 202
                  ·
                    have he : n = 201 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root201_checked, OriginalRow227RootBindings06.root201_pos,
                      OriginalRow227RootBindings06.product201_pos⟩
                  ·
                    have he : n = 202 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root202_checked, OriginalRow227RootBindings06.root202_pos,
                      OriginalRow227RootBindings06.product202_pos⟩
          ·
            by_cases h211 : n < 211
            ·
              by_cases h207 : n < 207
              ·
                by_cases h205 : n < 205
                ·
                  by_cases h204 : n < 204
                  ·
                    have he : n = 203 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root203_checked, OriginalRow227RootBindings06.root203_pos,
                      OriginalRow227RootBindings06.product203_pos⟩
                  ·
                    have he : n = 204 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root204_checked, OriginalRow227RootBindings06.root204_pos,
                      OriginalRow227RootBindings06.product204_pos⟩
                ·
                  by_cases h206 : n < 206
                  ·
                    have he : n = 205 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root205_checked, OriginalRow227RootBindings06.root205_pos,
                      OriginalRow227RootBindings06.product205_pos⟩
                  ·
                    have he : n = 206 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root206_checked, OriginalRow227RootBindings06.root206_pos,
                      OriginalRow227RootBindings06.product206_pos⟩
              ·
                by_cases h209 : n < 209
                ·
                  by_cases h208 : n < 208
                  ·
                    have he : n = 207 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root207_checked, OriginalRow227RootBindings06.root207_pos,
                      OriginalRow227RootBindings06.product207_pos⟩
                  ·
                    have he : n = 208 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root208_checked, OriginalRow227RootBindings06.root208_pos,
                      OriginalRow227RootBindings06.product208_pos⟩
                ·
                  by_cases h210 : n < 210
                  ·
                    have he : n = 209 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root209_checked, OriginalRow227RootBindings06.root209_pos,
                      OriginalRow227RootBindings06.product209_pos⟩
                  ·
                    have he : n = 210 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root210_checked, OriginalRow227RootBindings06.root210_pos,
                      OriginalRow227RootBindings06.product210_pos⟩
            ·
              by_cases h215 : n < 215
              ·
                by_cases h213 : n < 213
                ·
                  by_cases h212 : n < 212
                  ·
                    have he : n = 211 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root211_checked, OriginalRow227RootBindings06.root211_pos,
                      OriginalRow227RootBindings06.product211_pos⟩
                  ·
                    have he : n = 212 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root212_checked, OriginalRow227RootBindings06.root212_pos,
                      OriginalRow227RootBindings06.product212_pos⟩
                ·
                  by_cases h214 : n < 214
                  ·
                    have he : n = 213 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root213_checked, OriginalRow227RootBindings06.root213_pos,
                      OriginalRow227RootBindings06.product213_pos⟩
                  ·
                    have he : n = 214 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root214_checked, OriginalRow227RootBindings06.root214_pos,
                      OriginalRow227RootBindings06.product214_pos⟩
              ·
                by_cases h217 : n < 217
                ·
                  by_cases h216 : n < 216
                  ·
                    have he : n = 215 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root215_checked, OriginalRow227RootBindings06.root215_pos,
                      OriginalRow227RootBindings06.product215_pos⟩
                  ·
                    have he : n = 216 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root216_checked, OriginalRow227RootBindings06.root216_pos,
                      OriginalRow227RootBindings06.product216_pos⟩
                ·
                  by_cases h218 : n < 218
                  ·
                    have he : n = 217 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root217_checked, OriginalRow227RootBindings06.root217_pos,
                      OriginalRow227RootBindings06.product217_pos⟩
                  ·
                    have he : n = 218 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root218_checked, OriginalRow227RootBindings06.root218_pos,
                      OriginalRow227RootBindings06.product218_pos⟩
        ·
          by_cases h235 : n < 235
          ·
            by_cases h227 : n < 227
            ·
              by_cases h223 : n < 223
              ·
                by_cases h221 : n < 221
                ·
                  by_cases h220 : n < 220
                  ·
                    have he : n = 219 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root219_checked, OriginalRow227RootBindings06.root219_pos,
                      OriginalRow227RootBindings06.product219_pos⟩
                  ·
                    have he : n = 220 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root220_checked, OriginalRow227RootBindings06.root220_pos,
                      OriginalRow227RootBindings06.product220_pos⟩
                ·
                  by_cases h222 : n < 222
                  ·
                    have he : n = 221 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root221_checked, OriginalRow227RootBindings06.root221_pos,
                      OriginalRow227RootBindings06.product221_pos⟩
                  ·
                    have he : n = 222 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root222_checked, OriginalRow227RootBindings06.root222_pos,
                      OriginalRow227RootBindings06.product222_pos⟩
              ·
                by_cases h225 : n < 225
                ·
                  by_cases h224 : n < 224
                  ·
                    have he : n = 223 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root223_checked, OriginalRow227RootBindings06.root223_pos,
                      OriginalRow227RootBindings06.product223_pos⟩
                  ·
                    have he : n = 224 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings06.root224_checked, OriginalRow227RootBindings06.root224_pos,
                      OriginalRow227RootBindings06.product224_pos⟩
                ·
                  by_cases h226 : n < 226
                  ·
                    have he : n = 225 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root225_checked, OriginalRow227RootBindings07.root225_pos,
                      OriginalRow227RootBindings07.product225_pos⟩
                  ·
                    have he : n = 226 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root226_checked, OriginalRow227RootBindings07.root226_pos,
                      OriginalRow227RootBindings07.product226_pos⟩
            ·
              by_cases h231 : n < 231
              ·
                by_cases h229 : n < 229
                ·
                  by_cases h228 : n < 228
                  ·
                    have he : n = 227 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root227_checked, OriginalRow227RootBindings07.root227_pos,
                      OriginalRow227RootBindings07.product227_pos⟩
                  ·
                    have he : n = 228 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root228_checked, OriginalRow227RootBindings07.root228_pos,
                      OriginalRow227RootBindings07.product228_pos⟩
                ·
                  by_cases h230 : n < 230
                  ·
                    have he : n = 229 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root229_checked, OriginalRow227RootBindings07.root229_pos,
                      OriginalRow227RootBindings07.product229_pos⟩
                  ·
                    have he : n = 230 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root230_checked, OriginalRow227RootBindings07.root230_pos,
                      OriginalRow227RootBindings07.product230_pos⟩
              ·
                by_cases h233 : n < 233
                ·
                  by_cases h232 : n < 232
                  ·
                    have he : n = 231 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root231_checked, OriginalRow227RootBindings07.root231_pos,
                      OriginalRow227RootBindings07.product231_pos⟩
                  ·
                    have he : n = 232 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root232_checked, OriginalRow227RootBindings07.root232_pos,
                      OriginalRow227RootBindings07.product232_pos⟩
                ·
                  by_cases h234 : n < 234
                  ·
                    have he : n = 233 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root233_checked, OriginalRow227RootBindings07.root233_pos,
                      OriginalRow227RootBindings07.product233_pos⟩
                  ·
                    have he : n = 234 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root234_checked, OriginalRow227RootBindings07.root234_pos,
                      OriginalRow227RootBindings07.product234_pos⟩
          ·
            by_cases h243 : n < 243
            ·
              by_cases h239 : n < 239
              ·
                by_cases h237 : n < 237
                ·
                  by_cases h236 : n < 236
                  ·
                    have he : n = 235 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root235_checked, OriginalRow227RootBindings07.root235_pos,
                      OriginalRow227RootBindings07.product235_pos⟩
                  ·
                    have he : n = 236 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root236_checked, OriginalRow227RootBindings07.root236_pos,
                      OriginalRow227RootBindings07.product236_pos⟩
                ·
                  by_cases h238 : n < 238
                  ·
                    have he : n = 237 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root237_checked, OriginalRow227RootBindings07.root237_pos,
                      OriginalRow227RootBindings07.product237_pos⟩
                  ·
                    have he : n = 238 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root238_checked, OriginalRow227RootBindings07.root238_pos,
                      OriginalRow227RootBindings07.product238_pos⟩
              ·
                by_cases h241 : n < 241
                ·
                  by_cases h240 : n < 240
                  ·
                    have he : n = 239 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root239_checked, OriginalRow227RootBindings07.root239_pos,
                      OriginalRow227RootBindings07.product239_pos⟩
                  ·
                    have he : n = 240 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root240_checked, OriginalRow227RootBindings07.root240_pos,
                      OriginalRow227RootBindings07.product240_pos⟩
                ·
                  by_cases h242 : n < 242
                  ·
                    have he : n = 241 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root241_checked, OriginalRow227RootBindings07.root241_pos,
                      OriginalRow227RootBindings07.product241_pos⟩
                  ·
                    have he : n = 242 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root242_checked, OriginalRow227RootBindings07.root242_pos,
                      OriginalRow227RootBindings07.product242_pos⟩
            ·
              by_cases h247 : n < 247
              ·
                by_cases h245 : n < 245
                ·
                  by_cases h244 : n < 244
                  ·
                    have he : n = 243 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root243_checked, OriginalRow227RootBindings07.root243_pos,
                      OriginalRow227RootBindings07.product243_pos⟩
                  ·
                    have he : n = 244 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root244_checked, OriginalRow227RootBindings07.root244_pos,
                      OriginalRow227RootBindings07.product244_pos⟩
                ·
                  by_cases h246 : n < 246
                  ·
                    have he : n = 245 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root245_checked, OriginalRow227RootBindings07.root245_pos,
                      OriginalRow227RootBindings07.product245_pos⟩
                  ·
                    have he : n = 246 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root246_checked, OriginalRow227RootBindings07.root246_pos,
                      OriginalRow227RootBindings07.product246_pos⟩
              ·
                by_cases h249 : n < 249
                ·
                  by_cases h248 : n < 248
                  ·
                    have he : n = 247 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root247_checked, OriginalRow227RootBindings07.root247_pos,
                      OriginalRow227RootBindings07.product247_pos⟩
                  ·
                    have he : n = 248 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root248_checked, OriginalRow227RootBindings07.root248_pos,
                      OriginalRow227RootBindings07.product248_pos⟩
                ·
                  by_cases h250 : n < 250
                  ·
                    have he : n = 249 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root249_checked, OriginalRow227RootBindings07.root249_pos,
                      OriginalRow227RootBindings07.product249_pos⟩
                  ·
                    have he : n = 250 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root250_checked, OriginalRow227RootBindings07.root250_pos,
                      OriginalRow227RootBindings07.product250_pos⟩
  ·
    by_cases h376 : n < 376
    ·
      by_cases h313 : n < 313
      ·
        by_cases h282 : n < 282
        ·
          by_cases h266 : n < 266
          ·
            by_cases h258 : n < 258
            ·
              by_cases h254 : n < 254
              ·
                by_cases h252 : n < 252
                ·
                  have he : n = 251 := by omega
                  subst n
                  exact ⟨OriginalRow227RootBindings07.root251_checked, OriginalRow227RootBindings07.root251_pos,
                    OriginalRow227RootBindings07.product251_pos⟩
                ·
                  by_cases h253 : n < 253
                  ·
                    have he : n = 252 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root252_checked, OriginalRow227RootBindings07.root252_pos,
                      OriginalRow227RootBindings07.product252_pos⟩
                  ·
                    have he : n = 253 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root253_checked, OriginalRow227RootBindings07.root253_pos,
                      OriginalRow227RootBindings07.product253_pos⟩
              ·
                by_cases h256 : n < 256
                ·
                  by_cases h255 : n < 255
                  ·
                    have he : n = 254 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root254_checked, OriginalRow227RootBindings07.root254_pos,
                      OriginalRow227RootBindings07.product254_pos⟩
                  ·
                    have he : n = 255 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root255_checked, OriginalRow227RootBindings07.root255_pos,
                      OriginalRow227RootBindings07.product255_pos⟩
                ·
                  by_cases h257 : n < 257
                  ·
                    have he : n = 256 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings07.root256_checked, OriginalRow227RootBindings07.root256_pos,
                      OriginalRow227RootBindings07.product256_pos⟩
                  ·
                    have he : n = 257 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root257_checked, OriginalRow227RootBindings08.root257_pos,
                      OriginalRow227RootBindings08.product257_pos⟩
            ·
              by_cases h262 : n < 262
              ·
                by_cases h260 : n < 260
                ·
                  by_cases h259 : n < 259
                  ·
                    have he : n = 258 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root258_checked, OriginalRow227RootBindings08.root258_pos,
                      OriginalRow227RootBindings08.product258_pos⟩
                  ·
                    have he : n = 259 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root259_checked, OriginalRow227RootBindings08.root259_pos,
                      OriginalRow227RootBindings08.product259_pos⟩
                ·
                  by_cases h261 : n < 261
                  ·
                    have he : n = 260 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root260_checked, OriginalRow227RootBindings08.root260_pos,
                      OriginalRow227RootBindings08.product260_pos⟩
                  ·
                    have he : n = 261 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root261_checked, OriginalRow227RootBindings08.root261_pos,
                      OriginalRow227RootBindings08.product261_pos⟩
              ·
                by_cases h264 : n < 264
                ·
                  by_cases h263 : n < 263
                  ·
                    have he : n = 262 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root262_checked, OriginalRow227RootBindings08.root262_pos,
                      OriginalRow227RootBindings08.product262_pos⟩
                  ·
                    have he : n = 263 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root263_checked, OriginalRow227RootBindings08.root263_pos,
                      OriginalRow227RootBindings08.product263_pos⟩
                ·
                  by_cases h265 : n < 265
                  ·
                    have he : n = 264 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root264_checked, OriginalRow227RootBindings08.root264_pos,
                      OriginalRow227RootBindings08.product264_pos⟩
                  ·
                    have he : n = 265 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root265_checked, OriginalRow227RootBindings08.root265_pos,
                      OriginalRow227RootBindings08.product265_pos⟩
          ·
            by_cases h274 : n < 274
            ·
              by_cases h270 : n < 270
              ·
                by_cases h268 : n < 268
                ·
                  by_cases h267 : n < 267
                  ·
                    have he : n = 266 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root266_checked, OriginalRow227RootBindings08.root266_pos,
                      OriginalRow227RootBindings08.product266_pos⟩
                  ·
                    have he : n = 267 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root267_checked, OriginalRow227RootBindings08.root267_pos,
                      OriginalRow227RootBindings08.product267_pos⟩
                ·
                  by_cases h269 : n < 269
                  ·
                    have he : n = 268 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root268_checked, OriginalRow227RootBindings08.root268_pos,
                      OriginalRow227RootBindings08.product268_pos⟩
                  ·
                    have he : n = 269 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root269_checked, OriginalRow227RootBindings08.root269_pos,
                      OriginalRow227RootBindings08.product269_pos⟩
              ·
                by_cases h272 : n < 272
                ·
                  by_cases h271 : n < 271
                  ·
                    have he : n = 270 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root270_checked, OriginalRow227RootBindings08.root270_pos,
                      OriginalRow227RootBindings08.product270_pos⟩
                  ·
                    have he : n = 271 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root271_checked, OriginalRow227RootBindings08.root271_pos,
                      OriginalRow227RootBindings08.product271_pos⟩
                ·
                  by_cases h273 : n < 273
                  ·
                    have he : n = 272 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root272_checked, OriginalRow227RootBindings08.root272_pos,
                      OriginalRow227RootBindings08.product272_pos⟩
                  ·
                    have he : n = 273 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root273_checked, OriginalRow227RootBindings08.root273_pos,
                      OriginalRow227RootBindings08.product273_pos⟩
            ·
              by_cases h278 : n < 278
              ·
                by_cases h276 : n < 276
                ·
                  by_cases h275 : n < 275
                  ·
                    have he : n = 274 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root274_checked, OriginalRow227RootBindings08.root274_pos,
                      OriginalRow227RootBindings08.product274_pos⟩
                  ·
                    have he : n = 275 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root275_checked, OriginalRow227RootBindings08.root275_pos,
                      OriginalRow227RootBindings08.product275_pos⟩
                ·
                  by_cases h277 : n < 277
                  ·
                    have he : n = 276 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root276_checked, OriginalRow227RootBindings08.root276_pos,
                      OriginalRow227RootBindings08.product276_pos⟩
                  ·
                    have he : n = 277 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root277_checked, OriginalRow227RootBindings08.root277_pos,
                      OriginalRow227RootBindings08.product277_pos⟩
              ·
                by_cases h280 : n < 280
                ·
                  by_cases h279 : n < 279
                  ·
                    have he : n = 278 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root278_checked, OriginalRow227RootBindings08.root278_pos,
                      OriginalRow227RootBindings08.product278_pos⟩
                  ·
                    have he : n = 279 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root279_checked, OriginalRow227RootBindings08.root279_pos,
                      OriginalRow227RootBindings08.product279_pos⟩
                ·
                  by_cases h281 : n < 281
                  ·
                    have he : n = 280 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root280_checked, OriginalRow227RootBindings08.root280_pos,
                      OriginalRow227RootBindings08.product280_pos⟩
                  ·
                    have he : n = 281 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root281_checked, OriginalRow227RootBindings08.root281_pos,
                      OriginalRow227RootBindings08.product281_pos⟩
        ·
          by_cases h297 : n < 297
          ·
            by_cases h289 : n < 289
            ·
              by_cases h285 : n < 285
              ·
                by_cases h283 : n < 283
                ·
                  have he : n = 282 := by omega
                  subst n
                  exact ⟨OriginalRow227RootBindings08.root282_checked, OriginalRow227RootBindings08.root282_pos,
                    OriginalRow227RootBindings08.product282_pos⟩
                ·
                  by_cases h284 : n < 284
                  ·
                    have he : n = 283 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root283_checked, OriginalRow227RootBindings08.root283_pos,
                      OriginalRow227RootBindings08.product283_pos⟩
                  ·
                    have he : n = 284 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root284_checked, OriginalRow227RootBindings08.root284_pos,
                      OriginalRow227RootBindings08.product284_pos⟩
              ·
                by_cases h287 : n < 287
                ·
                  by_cases h286 : n < 286
                  ·
                    have he : n = 285 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root285_checked, OriginalRow227RootBindings08.root285_pos,
                      OriginalRow227RootBindings08.product285_pos⟩
                  ·
                    have he : n = 286 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root286_checked, OriginalRow227RootBindings08.root286_pos,
                      OriginalRow227RootBindings08.product286_pos⟩
                ·
                  by_cases h288 : n < 288
                  ·
                    have he : n = 287 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root287_checked, OriginalRow227RootBindings08.root287_pos,
                      OriginalRow227RootBindings08.product287_pos⟩
                  ·
                    have he : n = 288 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings08.root288_checked, OriginalRow227RootBindings08.root288_pos,
                      OriginalRow227RootBindings08.product288_pos⟩
            ·
              by_cases h293 : n < 293
              ·
                by_cases h291 : n < 291
                ·
                  by_cases h290 : n < 290
                  ·
                    have he : n = 289 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root289_checked, OriginalRow227RootBindings09.root289_pos,
                      OriginalRow227RootBindings09.product289_pos⟩
                  ·
                    have he : n = 290 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root290_checked, OriginalRow227RootBindings09.root290_pos,
                      OriginalRow227RootBindings09.product290_pos⟩
                ·
                  by_cases h292 : n < 292
                  ·
                    have he : n = 291 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root291_checked, OriginalRow227RootBindings09.root291_pos,
                      OriginalRow227RootBindings09.product291_pos⟩
                  ·
                    have he : n = 292 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root292_checked, OriginalRow227RootBindings09.root292_pos,
                      OriginalRow227RootBindings09.product292_pos⟩
              ·
                by_cases h295 : n < 295
                ·
                  by_cases h294 : n < 294
                  ·
                    have he : n = 293 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root293_checked, OriginalRow227RootBindings09.root293_pos,
                      OriginalRow227RootBindings09.product293_pos⟩
                  ·
                    have he : n = 294 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root294_checked, OriginalRow227RootBindings09.root294_pos,
                      OriginalRow227RootBindings09.product294_pos⟩
                ·
                  by_cases h296 : n < 296
                  ·
                    have he : n = 295 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root295_checked, OriginalRow227RootBindings09.root295_pos,
                      OriginalRow227RootBindings09.product295_pos⟩
                  ·
                    have he : n = 296 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root296_checked, OriginalRow227RootBindings09.root296_pos,
                      OriginalRow227RootBindings09.product296_pos⟩
          ·
            by_cases h305 : n < 305
            ·
              by_cases h301 : n < 301
              ·
                by_cases h299 : n < 299
                ·
                  by_cases h298 : n < 298
                  ·
                    have he : n = 297 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root297_checked, OriginalRow227RootBindings09.root297_pos,
                      OriginalRow227RootBindings09.product297_pos⟩
                  ·
                    have he : n = 298 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root298_checked, OriginalRow227RootBindings09.root298_pos,
                      OriginalRow227RootBindings09.product298_pos⟩
                ·
                  by_cases h300 : n < 300
                  ·
                    have he : n = 299 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root299_checked, OriginalRow227RootBindings09.root299_pos,
                      OriginalRow227RootBindings09.product299_pos⟩
                  ·
                    have he : n = 300 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root300_checked, OriginalRow227RootBindings09.root300_pos,
                      OriginalRow227RootBindings09.product300_pos⟩
              ·
                by_cases h303 : n < 303
                ·
                  by_cases h302 : n < 302
                  ·
                    have he : n = 301 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root301_checked, OriginalRow227RootBindings09.root301_pos,
                      OriginalRow227RootBindings09.product301_pos⟩
                  ·
                    have he : n = 302 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root302_checked, OriginalRow227RootBindings09.root302_pos,
                      OriginalRow227RootBindings09.product302_pos⟩
                ·
                  by_cases h304 : n < 304
                  ·
                    have he : n = 303 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root303_checked, OriginalRow227RootBindings09.root303_pos,
                      OriginalRow227RootBindings09.product303_pos⟩
                  ·
                    have he : n = 304 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root304_checked, OriginalRow227RootBindings09.root304_pos,
                      OriginalRow227RootBindings09.product304_pos⟩
            ·
              by_cases h309 : n < 309
              ·
                by_cases h307 : n < 307
                ·
                  by_cases h306 : n < 306
                  ·
                    have he : n = 305 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root305_checked, OriginalRow227RootBindings09.root305_pos,
                      OriginalRow227RootBindings09.product305_pos⟩
                  ·
                    have he : n = 306 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root306_checked, OriginalRow227RootBindings09.root306_pos,
                      OriginalRow227RootBindings09.product306_pos⟩
                ·
                  by_cases h308 : n < 308
                  ·
                    have he : n = 307 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root307_checked, OriginalRow227RootBindings09.root307_pos,
                      OriginalRow227RootBindings09.product307_pos⟩
                  ·
                    have he : n = 308 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root308_checked, OriginalRow227RootBindings09.root308_pos,
                      OriginalRow227RootBindings09.product308_pos⟩
              ·
                by_cases h311 : n < 311
                ·
                  by_cases h310 : n < 310
                  ·
                    have he : n = 309 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root309_checked, OriginalRow227RootBindings09.root309_pos,
                      OriginalRow227RootBindings09.product309_pos⟩
                  ·
                    have he : n = 310 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root310_checked, OriginalRow227RootBindings09.root310_pos,
                      OriginalRow227RootBindings09.product310_pos⟩
                ·
                  by_cases h312 : n < 312
                  ·
                    have he : n = 311 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root311_checked, OriginalRow227RootBindings09.root311_pos,
                      OriginalRow227RootBindings09.product311_pos⟩
                  ·
                    have he : n = 312 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root312_checked, OriginalRow227RootBindings09.root312_pos,
                      OriginalRow227RootBindings09.product312_pos⟩
      ·
        by_cases h344 : n < 344
        ·
          by_cases h328 : n < 328
          ·
            by_cases h320 : n < 320
            ·
              by_cases h316 : n < 316
              ·
                by_cases h314 : n < 314
                ·
                  have he : n = 313 := by omega
                  subst n
                  exact ⟨OriginalRow227RootBindings09.root313_checked, OriginalRow227RootBindings09.root313_pos,
                    OriginalRow227RootBindings09.product313_pos⟩
                ·
                  by_cases h315 : n < 315
                  ·
                    have he : n = 314 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root314_checked, OriginalRow227RootBindings09.root314_pos,
                      OriginalRow227RootBindings09.product314_pos⟩
                  ·
                    have he : n = 315 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root315_checked, OriginalRow227RootBindings09.root315_pos,
                      OriginalRow227RootBindings09.product315_pos⟩
              ·
                by_cases h318 : n < 318
                ·
                  by_cases h317 : n < 317
                  ·
                    have he : n = 316 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root316_checked, OriginalRow227RootBindings09.root316_pos,
                      OriginalRow227RootBindings09.product316_pos⟩
                  ·
                    have he : n = 317 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root317_checked, OriginalRow227RootBindings09.root317_pos,
                      OriginalRow227RootBindings09.product317_pos⟩
                ·
                  by_cases h319 : n < 319
                  ·
                    have he : n = 318 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root318_checked, OriginalRow227RootBindings09.root318_pos,
                      OriginalRow227RootBindings09.product318_pos⟩
                  ·
                    have he : n = 319 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root319_checked, OriginalRow227RootBindings09.root319_pos,
                      OriginalRow227RootBindings09.product319_pos⟩
            ·
              by_cases h324 : n < 324
              ·
                by_cases h322 : n < 322
                ·
                  by_cases h321 : n < 321
                  ·
                    have he : n = 320 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings09.root320_checked, OriginalRow227RootBindings09.root320_pos,
                      OriginalRow227RootBindings09.product320_pos⟩
                  ·
                    have he : n = 321 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root321_checked, OriginalRow227RootBindings10.root321_pos,
                      OriginalRow227RootBindings10.product321_pos⟩
                ·
                  by_cases h323 : n < 323
                  ·
                    have he : n = 322 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root322_checked, OriginalRow227RootBindings10.root322_pos,
                      OriginalRow227RootBindings10.product322_pos⟩
                  ·
                    have he : n = 323 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root323_checked, OriginalRow227RootBindings10.root323_pos,
                      OriginalRow227RootBindings10.product323_pos⟩
              ·
                by_cases h326 : n < 326
                ·
                  by_cases h325 : n < 325
                  ·
                    have he : n = 324 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root324_checked, OriginalRow227RootBindings10.root324_pos,
                      OriginalRow227RootBindings10.product324_pos⟩
                  ·
                    have he : n = 325 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root325_checked, OriginalRow227RootBindings10.root325_pos,
                      OriginalRow227RootBindings10.product325_pos⟩
                ·
                  by_cases h327 : n < 327
                  ·
                    have he : n = 326 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root326_checked, OriginalRow227RootBindings10.root326_pos,
                      OriginalRow227RootBindings10.product326_pos⟩
                  ·
                    have he : n = 327 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root327_checked, OriginalRow227RootBindings10.root327_pos,
                      OriginalRow227RootBindings10.product327_pos⟩
          ·
            by_cases h336 : n < 336
            ·
              by_cases h332 : n < 332
              ·
                by_cases h330 : n < 330
                ·
                  by_cases h329 : n < 329
                  ·
                    have he : n = 328 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root328_checked, OriginalRow227RootBindings10.root328_pos,
                      OriginalRow227RootBindings10.product328_pos⟩
                  ·
                    have he : n = 329 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root329_checked, OriginalRow227RootBindings10.root329_pos,
                      OriginalRow227RootBindings10.product329_pos⟩
                ·
                  by_cases h331 : n < 331
                  ·
                    have he : n = 330 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root330_checked, OriginalRow227RootBindings10.root330_pos,
                      OriginalRow227RootBindings10.product330_pos⟩
                  ·
                    have he : n = 331 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root331_checked, OriginalRow227RootBindings10.root331_pos,
                      OriginalRow227RootBindings10.product331_pos⟩
              ·
                by_cases h334 : n < 334
                ·
                  by_cases h333 : n < 333
                  ·
                    have he : n = 332 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root332_checked, OriginalRow227RootBindings10.root332_pos,
                      OriginalRow227RootBindings10.product332_pos⟩
                  ·
                    have he : n = 333 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root333_checked, OriginalRow227RootBindings10.root333_pos,
                      OriginalRow227RootBindings10.product333_pos⟩
                ·
                  by_cases h335 : n < 335
                  ·
                    have he : n = 334 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root334_checked, OriginalRow227RootBindings10.root334_pos,
                      OriginalRow227RootBindings10.product334_pos⟩
                  ·
                    have he : n = 335 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root335_checked, OriginalRow227RootBindings10.root335_pos,
                      OriginalRow227RootBindings10.product335_pos⟩
            ·
              by_cases h340 : n < 340
              ·
                by_cases h338 : n < 338
                ·
                  by_cases h337 : n < 337
                  ·
                    have he : n = 336 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root336_checked, OriginalRow227RootBindings10.root336_pos,
                      OriginalRow227RootBindings10.product336_pos⟩
                  ·
                    have he : n = 337 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root337_checked, OriginalRow227RootBindings10.root337_pos,
                      OriginalRow227RootBindings10.product337_pos⟩
                ·
                  by_cases h339 : n < 339
                  ·
                    have he : n = 338 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root338_checked, OriginalRow227RootBindings10.root338_pos,
                      OriginalRow227RootBindings10.product338_pos⟩
                  ·
                    have he : n = 339 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root339_checked, OriginalRow227RootBindings10.root339_pos,
                      OriginalRow227RootBindings10.product339_pos⟩
              ·
                by_cases h342 : n < 342
                ·
                  by_cases h341 : n < 341
                  ·
                    have he : n = 340 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root340_checked, OriginalRow227RootBindings10.root340_pos,
                      OriginalRow227RootBindings10.product340_pos⟩
                  ·
                    have he : n = 341 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root341_checked, OriginalRow227RootBindings10.root341_pos,
                      OriginalRow227RootBindings10.product341_pos⟩
                ·
                  by_cases h343 : n < 343
                  ·
                    have he : n = 342 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root342_checked, OriginalRow227RootBindings10.root342_pos,
                      OriginalRow227RootBindings10.product342_pos⟩
                  ·
                    have he : n = 343 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root343_checked, OriginalRow227RootBindings10.root343_pos,
                      OriginalRow227RootBindings10.product343_pos⟩
        ·
          by_cases h360 : n < 360
          ·
            by_cases h352 : n < 352
            ·
              by_cases h348 : n < 348
              ·
                by_cases h346 : n < 346
                ·
                  by_cases h345 : n < 345
                  ·
                    have he : n = 344 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root344_checked, OriginalRow227RootBindings10.root344_pos,
                      OriginalRow227RootBindings10.product344_pos⟩
                  ·
                    have he : n = 345 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root345_checked, OriginalRow227RootBindings10.root345_pos,
                      OriginalRow227RootBindings10.product345_pos⟩
                ·
                  by_cases h347 : n < 347
                  ·
                    have he : n = 346 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root346_checked, OriginalRow227RootBindings10.root346_pos,
                      OriginalRow227RootBindings10.product346_pos⟩
                  ·
                    have he : n = 347 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root347_checked, OriginalRow227RootBindings10.root347_pos,
                      OriginalRow227RootBindings10.product347_pos⟩
              ·
                by_cases h350 : n < 350
                ·
                  by_cases h349 : n < 349
                  ·
                    have he : n = 348 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root348_checked, OriginalRow227RootBindings10.root348_pos,
                      OriginalRow227RootBindings10.product348_pos⟩
                  ·
                    have he : n = 349 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root349_checked, OriginalRow227RootBindings10.root349_pos,
                      OriginalRow227RootBindings10.product349_pos⟩
                ·
                  by_cases h351 : n < 351
                  ·
                    have he : n = 350 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root350_checked, OriginalRow227RootBindings10.root350_pos,
                      OriginalRow227RootBindings10.product350_pos⟩
                  ·
                    have he : n = 351 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root351_checked, OriginalRow227RootBindings10.root351_pos,
                      OriginalRow227RootBindings10.product351_pos⟩
            ·
              by_cases h356 : n < 356
              ·
                by_cases h354 : n < 354
                ·
                  by_cases h353 : n < 353
                  ·
                    have he : n = 352 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings10.root352_checked, OriginalRow227RootBindings10.root352_pos,
                      OriginalRow227RootBindings10.product352_pos⟩
                  ·
                    have he : n = 353 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root353_checked, OriginalRow227RootBindings11.root353_pos,
                      OriginalRow227RootBindings11.product353_pos⟩
                ·
                  by_cases h355 : n < 355
                  ·
                    have he : n = 354 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root354_checked, OriginalRow227RootBindings11.root354_pos,
                      OriginalRow227RootBindings11.product354_pos⟩
                  ·
                    have he : n = 355 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root355_checked, OriginalRow227RootBindings11.root355_pos,
                      OriginalRow227RootBindings11.product355_pos⟩
              ·
                by_cases h358 : n < 358
                ·
                  by_cases h357 : n < 357
                  ·
                    have he : n = 356 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root356_checked, OriginalRow227RootBindings11.root356_pos,
                      OriginalRow227RootBindings11.product356_pos⟩
                  ·
                    have he : n = 357 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root357_checked, OriginalRow227RootBindings11.root357_pos,
                      OriginalRow227RootBindings11.product357_pos⟩
                ·
                  by_cases h359 : n < 359
                  ·
                    have he : n = 358 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root358_checked, OriginalRow227RootBindings11.root358_pos,
                      OriginalRow227RootBindings11.product358_pos⟩
                  ·
                    have he : n = 359 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root359_checked, OriginalRow227RootBindings11.root359_pos,
                      OriginalRow227RootBindings11.product359_pos⟩
          ·
            by_cases h368 : n < 368
            ·
              by_cases h364 : n < 364
              ·
                by_cases h362 : n < 362
                ·
                  by_cases h361 : n < 361
                  ·
                    have he : n = 360 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root360_checked, OriginalRow227RootBindings11.root360_pos,
                      OriginalRow227RootBindings11.product360_pos⟩
                  ·
                    have he : n = 361 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root361_checked, OriginalRow227RootBindings11.root361_pos,
                      OriginalRow227RootBindings11.product361_pos⟩
                ·
                  by_cases h363 : n < 363
                  ·
                    have he : n = 362 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root362_checked, OriginalRow227RootBindings11.root362_pos,
                      OriginalRow227RootBindings11.product362_pos⟩
                  ·
                    have he : n = 363 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root363_checked, OriginalRow227RootBindings11.root363_pos,
                      OriginalRow227RootBindings11.product363_pos⟩
              ·
                by_cases h366 : n < 366
                ·
                  by_cases h365 : n < 365
                  ·
                    have he : n = 364 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root364_checked, OriginalRow227RootBindings11.root364_pos,
                      OriginalRow227RootBindings11.product364_pos⟩
                  ·
                    have he : n = 365 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root365_checked, OriginalRow227RootBindings11.root365_pos,
                      OriginalRow227RootBindings11.product365_pos⟩
                ·
                  by_cases h367 : n < 367
                  ·
                    have he : n = 366 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root366_checked, OriginalRow227RootBindings11.root366_pos,
                      OriginalRow227RootBindings11.product366_pos⟩
                  ·
                    have he : n = 367 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root367_checked, OriginalRow227RootBindings11.root367_pos,
                      OriginalRow227RootBindings11.product367_pos⟩
            ·
              by_cases h372 : n < 372
              ·
                by_cases h370 : n < 370
                ·
                  by_cases h369 : n < 369
                  ·
                    have he : n = 368 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root368_checked, OriginalRow227RootBindings11.root368_pos,
                      OriginalRow227RootBindings11.product368_pos⟩
                  ·
                    have he : n = 369 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root369_checked, OriginalRow227RootBindings11.root369_pos,
                      OriginalRow227RootBindings11.product369_pos⟩
                ·
                  by_cases h371 : n < 371
                  ·
                    have he : n = 370 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root370_checked, OriginalRow227RootBindings11.root370_pos,
                      OriginalRow227RootBindings11.product370_pos⟩
                  ·
                    have he : n = 371 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root371_checked, OriginalRow227RootBindings11.root371_pos,
                      OriginalRow227RootBindings11.product371_pos⟩
              ·
                by_cases h374 : n < 374
                ·
                  by_cases h373 : n < 373
                  ·
                    have he : n = 372 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root372_checked, OriginalRow227RootBindings11.root372_pos,
                      OriginalRow227RootBindings11.product372_pos⟩
                  ·
                    have he : n = 373 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root373_checked, OriginalRow227RootBindings11.root373_pos,
                      OriginalRow227RootBindings11.product373_pos⟩
                ·
                  by_cases h375 : n < 375
                  ·
                    have he : n = 374 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root374_checked, OriginalRow227RootBindings11.root374_pos,
                      OriginalRow227RootBindings11.product374_pos⟩
                  ·
                    have he : n = 375 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root375_checked, OriginalRow227RootBindings11.root375_pos,
                      OriginalRow227RootBindings11.product375_pos⟩
    ·
      by_cases h439 : n < 439
      ·
        by_cases h407 : n < 407
        ·
          by_cases h391 : n < 391
          ·
            by_cases h383 : n < 383
            ·
              by_cases h379 : n < 379
              ·
                by_cases h377 : n < 377
                ·
                  have he : n = 376 := by omega
                  subst n
                  exact ⟨OriginalRow227RootBindings11.root376_checked, OriginalRow227RootBindings11.root376_pos,
                    OriginalRow227RootBindings11.product376_pos⟩
                ·
                  by_cases h378 : n < 378
                  ·
                    have he : n = 377 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root377_checked, OriginalRow227RootBindings11.root377_pos,
                      OriginalRow227RootBindings11.product377_pos⟩
                  ·
                    have he : n = 378 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root378_checked, OriginalRow227RootBindings11.root378_pos,
                      OriginalRow227RootBindings11.product378_pos⟩
              ·
                by_cases h381 : n < 381
                ·
                  by_cases h380 : n < 380
                  ·
                    have he : n = 379 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root379_checked, OriginalRow227RootBindings11.root379_pos,
                      OriginalRow227RootBindings11.product379_pos⟩
                  ·
                    have he : n = 380 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root380_checked, OriginalRow227RootBindings11.root380_pos,
                      OriginalRow227RootBindings11.product380_pos⟩
                ·
                  by_cases h382 : n < 382
                  ·
                    have he : n = 381 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root381_checked, OriginalRow227RootBindings11.root381_pos,
                      OriginalRow227RootBindings11.product381_pos⟩
                  ·
                    have he : n = 382 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root382_checked, OriginalRow227RootBindings11.root382_pos,
                      OriginalRow227RootBindings11.product382_pos⟩
            ·
              by_cases h387 : n < 387
              ·
                by_cases h385 : n < 385
                ·
                  by_cases h384 : n < 384
                  ·
                    have he : n = 383 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root383_checked, OriginalRow227RootBindings11.root383_pos,
                      OriginalRow227RootBindings11.product383_pos⟩
                  ·
                    have he : n = 384 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings11.root384_checked, OriginalRow227RootBindings11.root384_pos,
                      OriginalRow227RootBindings11.product384_pos⟩
                ·
                  by_cases h386 : n < 386
                  ·
                    have he : n = 385 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root385_checked, OriginalRow227RootBindings12.root385_pos,
                      OriginalRow227RootBindings12.product385_pos⟩
                  ·
                    have he : n = 386 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root386_checked, OriginalRow227RootBindings12.root386_pos,
                      OriginalRow227RootBindings12.product386_pos⟩
              ·
                by_cases h389 : n < 389
                ·
                  by_cases h388 : n < 388
                  ·
                    have he : n = 387 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root387_checked, OriginalRow227RootBindings12.root387_pos,
                      OriginalRow227RootBindings12.product387_pos⟩
                  ·
                    have he : n = 388 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root388_checked, OriginalRow227RootBindings12.root388_pos,
                      OriginalRow227RootBindings12.product388_pos⟩
                ·
                  by_cases h390 : n < 390
                  ·
                    have he : n = 389 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root389_checked, OriginalRow227RootBindings12.root389_pos,
                      OriginalRow227RootBindings12.product389_pos⟩
                  ·
                    have he : n = 390 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root390_checked, OriginalRow227RootBindings12.root390_pos,
                      OriginalRow227RootBindings12.product390_pos⟩
          ·
            by_cases h399 : n < 399
            ·
              by_cases h395 : n < 395
              ·
                by_cases h393 : n < 393
                ·
                  by_cases h392 : n < 392
                  ·
                    have he : n = 391 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root391_checked, OriginalRow227RootBindings12.root391_pos,
                      OriginalRow227RootBindings12.product391_pos⟩
                  ·
                    have he : n = 392 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root392_checked, OriginalRow227RootBindings12.root392_pos,
                      OriginalRow227RootBindings12.product392_pos⟩
                ·
                  by_cases h394 : n < 394
                  ·
                    have he : n = 393 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root393_checked, OriginalRow227RootBindings12.root393_pos,
                      OriginalRow227RootBindings12.product393_pos⟩
                  ·
                    have he : n = 394 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root394_checked, OriginalRow227RootBindings12.root394_pos,
                      OriginalRow227RootBindings12.product394_pos⟩
              ·
                by_cases h397 : n < 397
                ·
                  by_cases h396 : n < 396
                  ·
                    have he : n = 395 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root395_checked, OriginalRow227RootBindings12.root395_pos,
                      OriginalRow227RootBindings12.product395_pos⟩
                  ·
                    have he : n = 396 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root396_checked, OriginalRow227RootBindings12.root396_pos,
                      OriginalRow227RootBindings12.product396_pos⟩
                ·
                  by_cases h398 : n < 398
                  ·
                    have he : n = 397 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root397_checked, OriginalRow227RootBindings12.root397_pos,
                      OriginalRow227RootBindings12.product397_pos⟩
                  ·
                    have he : n = 398 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root398_checked, OriginalRow227RootBindings12.root398_pos,
                      OriginalRow227RootBindings12.product398_pos⟩
            ·
              by_cases h403 : n < 403
              ·
                by_cases h401 : n < 401
                ·
                  by_cases h400 : n < 400
                  ·
                    have he : n = 399 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root399_checked, OriginalRow227RootBindings12.root399_pos,
                      OriginalRow227RootBindings12.product399_pos⟩
                  ·
                    have he : n = 400 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root400_checked, OriginalRow227RootBindings12.root400_pos,
                      OriginalRow227RootBindings12.product400_pos⟩
                ·
                  by_cases h402 : n < 402
                  ·
                    have he : n = 401 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root401_checked, OriginalRow227RootBindings12.root401_pos,
                      OriginalRow227RootBindings12.product401_pos⟩
                  ·
                    have he : n = 402 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root402_checked, OriginalRow227RootBindings12.root402_pos,
                      OriginalRow227RootBindings12.product402_pos⟩
              ·
                by_cases h405 : n < 405
                ·
                  by_cases h404 : n < 404
                  ·
                    have he : n = 403 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root403_checked, OriginalRow227RootBindings12.root403_pos,
                      OriginalRow227RootBindings12.product403_pos⟩
                  ·
                    have he : n = 404 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root404_checked, OriginalRow227RootBindings12.root404_pos,
                      OriginalRow227RootBindings12.product404_pos⟩
                ·
                  by_cases h406 : n < 406
                  ·
                    have he : n = 405 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root405_checked, OriginalRow227RootBindings12.root405_pos,
                      OriginalRow227RootBindings12.product405_pos⟩
                  ·
                    have he : n = 406 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root406_checked, OriginalRow227RootBindings12.root406_pos,
                      OriginalRow227RootBindings12.product406_pos⟩
        ·
          by_cases h423 : n < 423
          ·
            by_cases h415 : n < 415
            ·
              by_cases h411 : n < 411
              ·
                by_cases h409 : n < 409
                ·
                  by_cases h408 : n < 408
                  ·
                    have he : n = 407 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root407_checked, OriginalRow227RootBindings12.root407_pos,
                      OriginalRow227RootBindings12.product407_pos⟩
                  ·
                    have he : n = 408 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root408_checked, OriginalRow227RootBindings12.root408_pos,
                      OriginalRow227RootBindings12.product408_pos⟩
                ·
                  by_cases h410 : n < 410
                  ·
                    have he : n = 409 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root409_checked, OriginalRow227RootBindings12.root409_pos,
                      OriginalRow227RootBindings12.product409_pos⟩
                  ·
                    have he : n = 410 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root410_checked, OriginalRow227RootBindings12.root410_pos,
                      OriginalRow227RootBindings12.product410_pos⟩
              ·
                by_cases h413 : n < 413
                ·
                  by_cases h412 : n < 412
                  ·
                    have he : n = 411 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root411_checked, OriginalRow227RootBindings12.root411_pos,
                      OriginalRow227RootBindings12.product411_pos⟩
                  ·
                    have he : n = 412 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root412_checked, OriginalRow227RootBindings12.root412_pos,
                      OriginalRow227RootBindings12.product412_pos⟩
                ·
                  by_cases h414 : n < 414
                  ·
                    have he : n = 413 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root413_checked, OriginalRow227RootBindings12.root413_pos,
                      OriginalRow227RootBindings12.product413_pos⟩
                  ·
                    have he : n = 414 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root414_checked, OriginalRow227RootBindings12.root414_pos,
                      OriginalRow227RootBindings12.product414_pos⟩
            ·
              by_cases h419 : n < 419
              ·
                by_cases h417 : n < 417
                ·
                  by_cases h416 : n < 416
                  ·
                    have he : n = 415 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root415_checked, OriginalRow227RootBindings12.root415_pos,
                      OriginalRow227RootBindings12.product415_pos⟩
                  ·
                    have he : n = 416 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings12.root416_checked, OriginalRow227RootBindings12.root416_pos,
                      OriginalRow227RootBindings12.product416_pos⟩
                ·
                  by_cases h418 : n < 418
                  ·
                    have he : n = 417 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root417_checked, OriginalRow227RootBindings13.root417_pos,
                      OriginalRow227RootBindings13.product417_pos⟩
                  ·
                    have he : n = 418 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root418_checked, OriginalRow227RootBindings13.root418_pos,
                      OriginalRow227RootBindings13.product418_pos⟩
              ·
                by_cases h421 : n < 421
                ·
                  by_cases h420 : n < 420
                  ·
                    have he : n = 419 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root419_checked, OriginalRow227RootBindings13.root419_pos,
                      OriginalRow227RootBindings13.product419_pos⟩
                  ·
                    have he : n = 420 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root420_checked, OriginalRow227RootBindings13.root420_pos,
                      OriginalRow227RootBindings13.product420_pos⟩
                ·
                  by_cases h422 : n < 422
                  ·
                    have he : n = 421 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root421_checked, OriginalRow227RootBindings13.root421_pos,
                      OriginalRow227RootBindings13.product421_pos⟩
                  ·
                    have he : n = 422 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root422_checked, OriginalRow227RootBindings13.root422_pos,
                      OriginalRow227RootBindings13.product422_pos⟩
          ·
            by_cases h431 : n < 431
            ·
              by_cases h427 : n < 427
              ·
                by_cases h425 : n < 425
                ·
                  by_cases h424 : n < 424
                  ·
                    have he : n = 423 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root423_checked, OriginalRow227RootBindings13.root423_pos,
                      OriginalRow227RootBindings13.product423_pos⟩
                  ·
                    have he : n = 424 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root424_checked, OriginalRow227RootBindings13.root424_pos,
                      OriginalRow227RootBindings13.product424_pos⟩
                ·
                  by_cases h426 : n < 426
                  ·
                    have he : n = 425 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root425_checked, OriginalRow227RootBindings13.root425_pos,
                      OriginalRow227RootBindings13.product425_pos⟩
                  ·
                    have he : n = 426 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root426_checked, OriginalRow227RootBindings13.root426_pos,
                      OriginalRow227RootBindings13.product426_pos⟩
              ·
                by_cases h429 : n < 429
                ·
                  by_cases h428 : n < 428
                  ·
                    have he : n = 427 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root427_checked, OriginalRow227RootBindings13.root427_pos,
                      OriginalRow227RootBindings13.product427_pos⟩
                  ·
                    have he : n = 428 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root428_checked, OriginalRow227RootBindings13.root428_pos,
                      OriginalRow227RootBindings13.product428_pos⟩
                ·
                  by_cases h430 : n < 430
                  ·
                    have he : n = 429 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root429_checked, OriginalRow227RootBindings13.root429_pos,
                      OriginalRow227RootBindings13.product429_pos⟩
                  ·
                    have he : n = 430 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root430_checked, OriginalRow227RootBindings13.root430_pos,
                      OriginalRow227RootBindings13.product430_pos⟩
            ·
              by_cases h435 : n < 435
              ·
                by_cases h433 : n < 433
                ·
                  by_cases h432 : n < 432
                  ·
                    have he : n = 431 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root431_checked, OriginalRow227RootBindings13.root431_pos,
                      OriginalRow227RootBindings13.product431_pos⟩
                  ·
                    have he : n = 432 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root432_checked, OriginalRow227RootBindings13.root432_pos,
                      OriginalRow227RootBindings13.product432_pos⟩
                ·
                  by_cases h434 : n < 434
                  ·
                    have he : n = 433 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root433_checked, OriginalRow227RootBindings13.root433_pos,
                      OriginalRow227RootBindings13.product433_pos⟩
                  ·
                    have he : n = 434 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root434_checked, OriginalRow227RootBindings13.root434_pos,
                      OriginalRow227RootBindings13.product434_pos⟩
              ·
                by_cases h437 : n < 437
                ·
                  by_cases h436 : n < 436
                  ·
                    have he : n = 435 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root435_checked, OriginalRow227RootBindings13.root435_pos,
                      OriginalRow227RootBindings13.product435_pos⟩
                  ·
                    have he : n = 436 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root436_checked, OriginalRow227RootBindings13.root436_pos,
                      OriginalRow227RootBindings13.product436_pos⟩
                ·
                  by_cases h438 : n < 438
                  ·
                    have he : n = 437 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root437_checked, OriginalRow227RootBindings13.root437_pos,
                      OriginalRow227RootBindings13.product437_pos⟩
                  ·
                    have he : n = 438 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root438_checked, OriginalRow227RootBindings13.root438_pos,
                      OriginalRow227RootBindings13.product438_pos⟩
      ·
        by_cases h470 : n < 470
        ·
          by_cases h454 : n < 454
          ·
            by_cases h446 : n < 446
            ·
              by_cases h442 : n < 442
              ·
                by_cases h440 : n < 440
                ·
                  have he : n = 439 := by omega
                  subst n
                  exact ⟨OriginalRow227RootBindings13.root439_checked, OriginalRow227RootBindings13.root439_pos,
                    OriginalRow227RootBindings13.product439_pos⟩
                ·
                  by_cases h441 : n < 441
                  ·
                    have he : n = 440 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root440_checked, OriginalRow227RootBindings13.root440_pos,
                      OriginalRow227RootBindings13.product440_pos⟩
                  ·
                    have he : n = 441 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root441_checked, OriginalRow227RootBindings13.root441_pos,
                      OriginalRow227RootBindings13.product441_pos⟩
              ·
                by_cases h444 : n < 444
                ·
                  by_cases h443 : n < 443
                  ·
                    have he : n = 442 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root442_checked, OriginalRow227RootBindings13.root442_pos,
                      OriginalRow227RootBindings13.product442_pos⟩
                  ·
                    have he : n = 443 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root443_checked, OriginalRow227RootBindings13.root443_pos,
                      OriginalRow227RootBindings13.product443_pos⟩
                ·
                  by_cases h445 : n < 445
                  ·
                    have he : n = 444 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root444_checked, OriginalRow227RootBindings13.root444_pos,
                      OriginalRow227RootBindings13.product444_pos⟩
                  ·
                    have he : n = 445 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root445_checked, OriginalRow227RootBindings13.root445_pos,
                      OriginalRow227RootBindings13.product445_pos⟩
            ·
              by_cases h450 : n < 450
              ·
                by_cases h448 : n < 448
                ·
                  by_cases h447 : n < 447
                  ·
                    have he : n = 446 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root446_checked, OriginalRow227RootBindings13.root446_pos,
                      OriginalRow227RootBindings13.product446_pos⟩
                  ·
                    have he : n = 447 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root447_checked, OriginalRow227RootBindings13.root447_pos,
                      OriginalRow227RootBindings13.product447_pos⟩
                ·
                  by_cases h449 : n < 449
                  ·
                    have he : n = 448 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings13.root448_checked, OriginalRow227RootBindings13.root448_pos,
                      OriginalRow227RootBindings13.product448_pos⟩
                  ·
                    have he : n = 449 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root449_checked, OriginalRow227RootBindings14.root449_pos,
                      OriginalRow227RootBindings14.product449_pos⟩
              ·
                by_cases h452 : n < 452
                ·
                  by_cases h451 : n < 451
                  ·
                    have he : n = 450 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root450_checked, OriginalRow227RootBindings14.root450_pos,
                      OriginalRow227RootBindings14.product450_pos⟩
                  ·
                    have he : n = 451 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root451_checked, OriginalRow227RootBindings14.root451_pos,
                      OriginalRow227RootBindings14.product451_pos⟩
                ·
                  by_cases h453 : n < 453
                  ·
                    have he : n = 452 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root452_checked, OriginalRow227RootBindings14.root452_pos,
                      OriginalRow227RootBindings14.product452_pos⟩
                  ·
                    have he : n = 453 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root453_checked, OriginalRow227RootBindings14.root453_pos,
                      OriginalRow227RootBindings14.product453_pos⟩
          ·
            by_cases h462 : n < 462
            ·
              by_cases h458 : n < 458
              ·
                by_cases h456 : n < 456
                ·
                  by_cases h455 : n < 455
                  ·
                    have he : n = 454 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root454_checked, OriginalRow227RootBindings14.root454_pos,
                      OriginalRow227RootBindings14.product454_pos⟩
                  ·
                    have he : n = 455 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root455_checked, OriginalRow227RootBindings14.root455_pos,
                      OriginalRow227RootBindings14.product455_pos⟩
                ·
                  by_cases h457 : n < 457
                  ·
                    have he : n = 456 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root456_checked, OriginalRow227RootBindings14.root456_pos,
                      OriginalRow227RootBindings14.product456_pos⟩
                  ·
                    have he : n = 457 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root457_checked, OriginalRow227RootBindings14.root457_pos,
                      OriginalRow227RootBindings14.product457_pos⟩
              ·
                by_cases h460 : n < 460
                ·
                  by_cases h459 : n < 459
                  ·
                    have he : n = 458 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root458_checked, OriginalRow227RootBindings14.root458_pos,
                      OriginalRow227RootBindings14.product458_pos⟩
                  ·
                    have he : n = 459 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root459_checked, OriginalRow227RootBindings14.root459_pos,
                      OriginalRow227RootBindings14.product459_pos⟩
                ·
                  by_cases h461 : n < 461
                  ·
                    have he : n = 460 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root460_checked, OriginalRow227RootBindings14.root460_pos,
                      OriginalRow227RootBindings14.product460_pos⟩
                  ·
                    have he : n = 461 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root461_checked, OriginalRow227RootBindings14.root461_pos,
                      OriginalRow227RootBindings14.product461_pos⟩
            ·
              by_cases h466 : n < 466
              ·
                by_cases h464 : n < 464
                ·
                  by_cases h463 : n < 463
                  ·
                    have he : n = 462 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root462_checked, OriginalRow227RootBindings14.root462_pos,
                      OriginalRow227RootBindings14.product462_pos⟩
                  ·
                    have he : n = 463 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root463_checked, OriginalRow227RootBindings14.root463_pos,
                      OriginalRow227RootBindings14.product463_pos⟩
                ·
                  by_cases h465 : n < 465
                  ·
                    have he : n = 464 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root464_checked, OriginalRow227RootBindings14.root464_pos,
                      OriginalRow227RootBindings14.product464_pos⟩
                  ·
                    have he : n = 465 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root465_checked, OriginalRow227RootBindings14.root465_pos,
                      OriginalRow227RootBindings14.product465_pos⟩
              ·
                by_cases h468 : n < 468
                ·
                  by_cases h467 : n < 467
                  ·
                    have he : n = 466 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root466_checked, OriginalRow227RootBindings14.root466_pos,
                      OriginalRow227RootBindings14.product466_pos⟩
                  ·
                    have he : n = 467 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root467_checked, OriginalRow227RootBindings14.root467_pos,
                      OriginalRow227RootBindings14.product467_pos⟩
                ·
                  by_cases h469 : n < 469
                  ·
                    have he : n = 468 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root468_checked, OriginalRow227RootBindings14.root468_pos,
                      OriginalRow227RootBindings14.product468_pos⟩
                  ·
                    have he : n = 469 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root469_checked, OriginalRow227RootBindings14.root469_pos,
                      OriginalRow227RootBindings14.product469_pos⟩
        ·
          by_cases h486 : n < 486
          ·
            by_cases h478 : n < 478
            ·
              by_cases h474 : n < 474
              ·
                by_cases h472 : n < 472
                ·
                  by_cases h471 : n < 471
                  ·
                    have he : n = 470 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root470_checked, OriginalRow227RootBindings14.root470_pos,
                      OriginalRow227RootBindings14.product470_pos⟩
                  ·
                    have he : n = 471 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root471_checked, OriginalRow227RootBindings14.root471_pos,
                      OriginalRow227RootBindings14.product471_pos⟩
                ·
                  by_cases h473 : n < 473
                  ·
                    have he : n = 472 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root472_checked, OriginalRow227RootBindings14.root472_pos,
                      OriginalRow227RootBindings14.product472_pos⟩
                  ·
                    have he : n = 473 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root473_checked, OriginalRow227RootBindings14.root473_pos,
                      OriginalRow227RootBindings14.product473_pos⟩
              ·
                by_cases h476 : n < 476
                ·
                  by_cases h475 : n < 475
                  ·
                    have he : n = 474 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root474_checked, OriginalRow227RootBindings14.root474_pos,
                      OriginalRow227RootBindings14.product474_pos⟩
                  ·
                    have he : n = 475 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root475_checked, OriginalRow227RootBindings14.root475_pos,
                      OriginalRow227RootBindings14.product475_pos⟩
                ·
                  by_cases h477 : n < 477
                  ·
                    have he : n = 476 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root476_checked, OriginalRow227RootBindings14.root476_pos,
                      OriginalRow227RootBindings14.product476_pos⟩
                  ·
                    have he : n = 477 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root477_checked, OriginalRow227RootBindings14.root477_pos,
                      OriginalRow227RootBindings14.product477_pos⟩
            ·
              by_cases h482 : n < 482
              ·
                by_cases h480 : n < 480
                ·
                  by_cases h479 : n < 479
                  ·
                    have he : n = 478 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root478_checked, OriginalRow227RootBindings14.root478_pos,
                      OriginalRow227RootBindings14.product478_pos⟩
                  ·
                    have he : n = 479 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root479_checked, OriginalRow227RootBindings14.root479_pos,
                      OriginalRow227RootBindings14.product479_pos⟩
                ·
                  by_cases h481 : n < 481
                  ·
                    have he : n = 480 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings14.root480_checked, OriginalRow227RootBindings14.root480_pos,
                      OriginalRow227RootBindings14.product480_pos⟩
                  ·
                    have he : n = 481 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings15.root481_checked, OriginalRow227RootBindings15.root481_pos,
                      OriginalRow227RootBindings15.product481_pos⟩
              ·
                by_cases h484 : n < 484
                ·
                  by_cases h483 : n < 483
                  ·
                    have he : n = 482 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings15.root482_checked, OriginalRow227RootBindings15.root482_pos,
                      OriginalRow227RootBindings15.product482_pos⟩
                  ·
                    have he : n = 483 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings15.root483_checked, OriginalRow227RootBindings15.root483_pos,
                      OriginalRow227RootBindings15.product483_pos⟩
                ·
                  by_cases h485 : n < 485
                  ·
                    have he : n = 484 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings15.root484_checked, OriginalRow227RootBindings15.root484_pos,
                      OriginalRow227RootBindings15.product484_pos⟩
                  ·
                    have he : n = 485 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings15.root485_checked, OriginalRow227RootBindings15.root485_pos,
                      OriginalRow227RootBindings15.product485_pos⟩
          ·
            by_cases h494 : n < 494
            ·
              by_cases h490 : n < 490
              ·
                by_cases h488 : n < 488
                ·
                  by_cases h487 : n < 487
                  ·
                    have he : n = 486 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings15.root486_checked, OriginalRow227RootBindings15.root486_pos,
                      OriginalRow227RootBindings15.product486_pos⟩
                  ·
                    have he : n = 487 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings15.root487_checked, OriginalRow227RootBindings15.root487_pos,
                      OriginalRow227RootBindings15.product487_pos⟩
                ·
                  by_cases h489 : n < 489
                  ·
                    have he : n = 488 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings15.root488_checked, OriginalRow227RootBindings15.root488_pos,
                      OriginalRow227RootBindings15.product488_pos⟩
                  ·
                    have he : n = 489 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings15.root489_checked, OriginalRow227RootBindings15.root489_pos,
                      OriginalRow227RootBindings15.product489_pos⟩
              ·
                by_cases h492 : n < 492
                ·
                  by_cases h491 : n < 491
                  ·
                    have he : n = 490 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings15.root490_checked, OriginalRow227RootBindings15.root490_pos,
                      OriginalRow227RootBindings15.product490_pos⟩
                  ·
                    have he : n = 491 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings15.root491_checked, OriginalRow227RootBindings15.root491_pos,
                      OriginalRow227RootBindings15.product491_pos⟩
                ·
                  by_cases h493 : n < 493
                  ·
                    have he : n = 492 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings15.root492_checked, OriginalRow227RootBindings15.root492_pos,
                      OriginalRow227RootBindings15.product492_pos⟩
                  ·
                    have he : n = 493 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings15.root493_checked, OriginalRow227RootBindings15.root493_pos,
                      OriginalRow227RootBindings15.product493_pos⟩
            ·
              by_cases h498 : n < 498
              ·
                by_cases h496 : n < 496
                ·
                  by_cases h495 : n < 495
                  ·
                    have he : n = 494 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings15.root494_checked, OriginalRow227RootBindings15.root494_pos,
                      OriginalRow227RootBindings15.product494_pos⟩
                  ·
                    have he : n = 495 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings15.root495_checked, OriginalRow227RootBindings15.root495_pos,
                      OriginalRow227RootBindings15.product495_pos⟩
                ·
                  by_cases h497 : n < 497
                  ·
                    have he : n = 496 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings15.root496_checked, OriginalRow227RootBindings15.root496_pos,
                      OriginalRow227RootBindings15.product496_pos⟩
                  ·
                    have he : n = 497 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings15.root497_checked, OriginalRow227RootBindings15.root497_pos,
                      OriginalRow227RootBindings15.product497_pos⟩
              ·
                by_cases h500 : n < 500
                ·
                  by_cases h499 : n < 499
                  ·
                    have he : n = 498 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings15.root498_checked, OriginalRow227RootBindings15.root498_pos,
                      OriginalRow227RootBindings15.product498_pos⟩
                  ·
                    have he : n = 499 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings15.root499_checked, OriginalRow227RootBindings15.root499_pos,
                      OriginalRow227RootBindings15.product499_pos⟩
                ·
                  by_cases h501 : n < 501
                  ·
                    have he : n = 500 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings15.root500_checked, OriginalRow227RootBindings15.root500_pos,
                      OriginalRow227RootBindings15.product500_pos⟩
                  ·
                    have he : n = 501 := by omega
                    subst n
                    exact ⟨OriginalRow227RootBindings15.root501_checked, OriginalRow227RootBindings15.root501_pos,
                      OriginalRow227RootBindings15.product501_pos⟩

theorem root_checked (n : ℕ) (hn : 0 < n) (hnM : n < 502) :
    sqrtCheck n (S n) = true := (root_properties n hn hnM).1

theorem root_pos (n : ℕ) (hn : 0 < n) (hnM : n < 502) :
    0 < (S n).lo.toRat := (root_properties n hn hnM).2.1

theorem product_pos (c : ℕ) (hc : c + 1 < 502) :
    0 < (roundedMul (-768) shift (S (c + 1))).lo.toRat :=
  (root_properties (c + 1) (by omega) hc).2.2

theorem midpoint_enclosed : (OriginalMomentSeedData.midpointQ : ℝ) ∈ shift :=
  ⟨(Rat.cast_le (K := ℝ)).mpr OriginalRow227CheckpointData.midpoint_enclosed.1,
    (Rat.cast_le (K := ℝ)).mpr OriginalRow227CheckpointData.midpoint_enclosed.2⟩

end Grothe.UpperChaos.OriginalRow227Roots

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227Roots.root_properties) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227Roots.root_checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227Roots.root_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227Roots.product_pos) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227Roots.midpoint_enclosed) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
