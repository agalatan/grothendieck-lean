import Grothe.Upper.Rounding.CellOverlapCore
import Grothe.Upper.Kernel.SmoothedStages

-- Agent-ID: codex-a7c4

set_option warningAsError true
set_option maxRecDepth 4096
set_option exponentiation.threshold 2048
namespace Grothe.Upper
open Grothe.Upper.Kernel Grothe.Upper.Kernel.Cell

private def modeOffset (m : ℕ) : ℕ :=
  (((m : ℤ) - 17).natAbs + (1 - ((m : ℤ) - 17)).natAbs - 1) / 2

attribute [local irreducible] Array.ofFn sumInt lagTable1024 binomArr251

private lemma gamma_at (b : Array (Array Nat)) (ov : OverlapBox) {m n j : ℕ}
    (hm : m < 36) (hn : n ≤ 250 - modeOffset m) (hj : j ≤ 250 - modeOffset m - n) :
    ( ((gammaCells b ov).getD m #[]).getD n #[]).getD j (false, 0, 0) = gammaCell b ov m n j := by
  unfold gammaCells
  rw [array_ofFn_getD _ m #[] hm]
  dsimp only
  rw [array_ofFn_getD _ n #[] (by simp only [Int.ofNat_eq_natCast]; change n < 250 - modeOffset m + 1; omega)]
  dsimp only
  rw [array_ofFn_getD _ j (false, 0, 0) (by
    simp only [Int.ofNat_eq_natCast]; change j < 250 - modeOffset m + 1 - n; omega)]

private lemma gammaMid_at (g : GammaCells) {m n j : ℕ}
    (hm : m < 36) (hn : n ≤ 250 - modeOffset m) (hj : j ≤ 250 - modeOffset m - n) :
    (((gammaMids g).getD m #[]).getD n #[]).getD j (0,0) =
      ((((g.getD m #[]).getD n #[]).getD j (false, 0, 0)).2) := by
  unfold gammaMids
  rw [array_ofFn_getD _ m #[] hm]
  dsimp only
  rw [array_ofFn_getD _ n #[] (by simp only [Int.ofNat_eq_natCast]; change n < 250 - modeOffset m + 1; omega)]
  dsimp only
  rw [array_ofFn_getD _ j (0,0) (by
    simp only [Int.ofNat_eq_natCast]; change j < 250 - modeOffset m + 1 - n; omega)]

private lemma gamma_pass {g : GammaCells} (h : gammaOK g = true) {m n j : ℕ}
    (hm : m < 36) (hn : n ≤ 250 - modeOffset m) (hj : j ≤ 250 - modeOffset m - n) :
    ((((g.getD m #[]).getD n #[]).getD j (false, 0, 0)).1) = true := by
  have h0 := List.all_eq_true.mp h m (List.mem_range.mpr hm)
  change ((List.range (250 - modeOffset m + 1)).all _) = true at h0
  have h1 := List.all_eq_true.mp h0 n (List.mem_range.mpr (by omega))
  exact List.all_eq_true.mp h1 j (List.mem_range.mpr (by
    change j < 250 - modeOffset m + 1 - n; omega))

private lemma dividedMid {x : ℝ} {iv : ℤ × ℤ} {d : ℕ} (hd : 0 < d)
    (hl : (iv.1 : ℝ) ≤ x * 2^560) (hu : x * 2^560 ≤ (iv.2 : ℝ))
    (hok : (toMid iv (Int.ofNat d * sh48)).1 = true) :
    |x / (d : ℝ) * 2^512 - ((toMid iv (Int.ofNat d * sh48)).2 : ℝ)| ≤ 1 := by
  have hden : (0 : ℤ) < Int.ofNat d * sh48 := by
    unfold sh48; simp only [Int.ofNat_eq_natCast]; positivity
  have hdR : (d : ℝ) ≠ 0 := by exact_mod_cast hd.ne'
  have hs : x / (d : ℝ) * 2^512 * ((Int.ofNat d * sh48 : ℤ) : ℝ) = x * 2^560 := by
    unfold sh48; push_cast [Int.ofNat_eq_natCast]; field_simp; ring
  exact midpoint_err_le_one (ediv_le_of_mul hden (by rw [hs]; exact hl))
    (le_neg_ediv_neg_of_mul hden (by rw [hs]; exact hu)) (of_decide_eq_true hok)

theorem gammaLookup_sound {cr ci : Array Int} {ov : OverlapBox}
    (hcomp : modeOverlapsAt sh416 sh680 cr ci lagTable1024 = (true,ov))
    (hg : gammaOK (gammaCells binomArr251 ov) = true)
    {k a b : ℕ} (hk : k ≤ 250) (ha : a ≤ k + 1) (hb : b ≤ k) :
    let gm := gammaMids (gammaCells binomArr251 ov)
    |(gScaled cr ci k a b).re * 2^512 - ((gLookup704 gm k a b).1 : ℝ)| ≤ 1 ∧
    |(gScaled cr ci k a b).im * 2^512 - ((gLookup704 gm k a b).2 : ℝ)| ≤ 1 := by
  apply gLookup704_sound_of_mid _ hk ha hb
  intro m hm
  dsimp only
  intro n hn j hj
  have hn' : n ≤ 250 - modeOffset m := hn
  have hj' : j ≤ 250 - modeOffset m - n := hj
  rw [gammaMid_at _ hm hn' hj', gamma_at _ _ hm hn' hj']
  have hgood := gamma_pass hg hm hn' hj'
  rw [gamma_at _ _ hm hn' hj'] at hgood
  have h := modeOverlapsAt_sound (bLag := 608) (by decide) (by rfl) (by unfold sh680; positivity)
    (fun _ ha _ hn _ hi => lagTable1024_sound ha hn hi) cr ci hcomp hm n hn j hj
  dsimp only at h
  have hs : (2 : ℝ) ^ (2 * 608 + 24) / (sh680 : ℝ) = 2^560 := by
    norm_num [sh680]
  rw [hs] at h
  let iv := ((ov.getD m #[]).getD n #[]).getD j ((0,0),(0,0))
  let d := (n+j).choose n * risingFact (n+j) (modeOffset m)
  have hd : 0 < d := mul_pos (Nat.choose_pos (by omega)) (risingFact_pos _ _)
  have hbino := getBinom_binomArr251 (n := n+j) (k := n) (by omega) (by omega)
  unfold gammaCell at hgood ⊢
  simp only [Int.ofNat_eq_natCast] at hgood ⊢
  rw [hbino] at hgood ⊢
  change ((toMid iv.1 (Int.ofNat d * sh48)).1 && (toMid iv.2 (Int.ofNat d * sh48)).1) = true at hgood
  rw [Bool.and_eq_true] at hgood
  obtain ⟨hr, hi⟩ := hgood
  exact ⟨dividedMid hd h.1 h.2.1 hr, dividedMid hd h.2.2.1 h.2.2.2 hi⟩

end Grothe.Upper
