import Grothe.LowerAnalytic.CoupledSteinData
import Grothe.LowerAnalytic.CoupledSteinGrid
import Grothe.LowerAnalytic.CoupledSteinWeights

set_option warningAsError true
set_option maxRecDepth 4000

/-! # Finite discounts for the coupled row08 and row09 Stein profile

The elaborator supplies compact candidate integer rectangles and prices. Each
candidate is compared with the original rational definition by the kernel.
The certified shape blocks then check every nonempty closed scale intersection.

Agent-ID: codex-a7c4
-/

namespace Grothe.LowerAnalytic.CoupledStein

open Grothe.Lower
open Grothe.Lower.SharedGate.WeightedSchur (pairGainQ)

private def K (w : ℚ) := curvature w row08.kappa row09.kappa row08.delta (pairGainQ w)
private def B (w d : ℚ) := (1-w)*cap08Tight+w*cap09Tight-d

private def gridPrices := prices.map fun (w,d) ↦ Grid.price w (K w) (B w d)
private def leftGroups := row08Cells.map (Grid.group (row08SubNodes.headD (0,0)).2)
private def rightGroups := row09Cells.map (Grid.group (row09SubNodes.headD (0,0)).2)
private def priceData : List Grid.Price := eval% gridPrices
private def leftData : List Grid.Group := eval% leftGroups
private def rightData : List Grid.Group := eval% rightGroups
private def stopData : ℤ := eval% ⌈Grid.scale*stop⌉

private theorem stop_eq : ⌈Grid.scale*stop⌉ = stopData := by decide +kernel
private theorem prices_eq : gridPrices = priceData := by decide +kernel

/-- Certify each shape block separately to bound peak kernel memory. -/
private abbrev BlockVerified (i : ℕ) : Prop :=
  leftGroups[i]? = leftData[i]? ∧ rightGroups[i]? = rightData[i]? ∧
    rightData.all (Grid.groupCheck stopData priceData (leftData[i]?.getD default)) = true

set_option Elab.async false
private theorem block00 : BlockVerified 0 := by decide +kernel
private theorem block01 : BlockVerified 1 := by decide +kernel
private theorem block02 : BlockVerified 2 := by decide +kernel
private theorem block03 : BlockVerified 3 := by decide +kernel
private theorem block04 : BlockVerified 4 := by decide +kernel
private theorem block05 : BlockVerified 5 := by decide +kernel
private theorem block06 : BlockVerified 6 := by decide +kernel
private theorem block07 : BlockVerified 7 := by decide +kernel
private theorem block08 : BlockVerified 8 := by decide +kernel
private theorem block09 : BlockVerified 9 := by decide +kernel
private theorem block10 : BlockVerified 10 := by decide +kernel
private theorem block11 : BlockVerified 11 := by decide +kernel

private theorem block_verified (i : ℕ) (hi : i < 12) : BlockVerified i := by
  interval_cases i
  · exact block00
  · exact block01
  · exact block02
  · exact block03
  · exact block04
  · exact block05
  · exact block06
  · exact block07
  · exact block08
  · exact block09
  · exact block10
  · exact block11

private theorem list_eq_of_twelve {α : Type} {xs ys : List α} (hx : xs.length = 12)
    (hy : ys.length = 12) (h : ∀ i < 12, xs[i]? = ys[i]?) : xs = ys := by
  apply List.ext_getElem?
  intro i
  by_cases hi : i < 12
  · exact h i hi
  · have hx' : xs.length ≤ i := by omega
    have hy' : ys.length ≤ i := by omega
    rw [getElem?_neg xs i (by omega), getElem?_neg ys i (by omega)]

private theorem left_eq : leftGroups = leftData :=
  list_eq_of_twelve (by rfl) (by rfl) fun i hi ↦ (block_verified i hi).1

private theorem right_eq : rightGroups = rightData :=
  list_eq_of_twelve (by rfl) (by rfl) fun i hi ↦ (block_verified i hi).2.1

private theorem runs (L : Grid.Group) (hl : L ∈ leftData) (R : Grid.Group) (hr : R ∈ rightData) :
    Grid.groupCheck stopData priceData L R := by
  obtain ⟨i,hi,he⟩ := List.mem_iff_getElem.mp hl
  have hlen : leftData.length = 12 := by rfl
  have hh := (block_verified i (hlen ▸ hi)).2.2
  rw [getElem?_pos leftData i hi,Option.getD_some,he] at hh
  exact List.all_eq_true.mp hh R hr

private theorem price_ranges :
    prices.all (fun p ↦ decide (0 ≤ p.1 ∧ p.1 ≤ 1 ∧ 0 ≤ B p.1 p.2 ∧ approxDiscount p.1 = p.2)) := by
  decide +kernel

/-- Every tabulated price is no larger than the exact continuous common-coordinate discount. -/
theorem price_le {w d : ℚ} (hp : (w,d) ∈ prices) : d ≤ rowDiscount w := by
  obtain ⟨h0,h1,hb,_⟩ := of_decide_eq_true (List.all_eq_true.mp price_ranges (w,d) hp)
  have h := Grid.worst_le (left := leftChords) (right := rightChords) (s := stop)
    (k := K w) h0 h1 hb fun l hl r hr hm ↦ by
      obtain ⟨L,hL,hlg,hl₀,hl₁⟩ := Grid.member_group hl
      obtain ⟨R,hR,hrg,hr₀,hr₁⟩ := Grid.member_group hr
      have hv := runs L (left_eq ▸ hL) R (right_eq ▸ hR)
      rw [← stop_eq, ← prices_eq] at hv
      exact Grid.groupCheck_sound hv hlg hrg hl₀ hl₁ hr₀ hr₁ hm (List.mem_map_of_mem hp)
  change _ ≤ (1-w)*cap08Tight+w*cap09Tight-worst (overlay stop leftChords rightChords) w (K w)
  change _ ≤ (1-w)*cap08Tight+w*cap09Tight-d at h
  linarith only [h]

theorem approxDiscount_le (w : ℚ) (hw : w ∈ prices.map Prod.fst) :
    approxDiscount w ≤ rowDiscount w := by
  obtain ⟨⟨w,d⟩,hp,rfl⟩ := List.mem_map.mp hw
  have he := (of_decide_eq_true (List.all_eq_true.mp price_ranges (w,d) hp)).2.2.2
  exact he.trans_le (price_le hp)

end Grothe.LowerAnalytic.CoupledStein
