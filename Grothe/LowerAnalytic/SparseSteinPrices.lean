import Grothe.LowerAnalytic.SparseSteinSlabs
import Grothe.LowerAnalytic.CoupledSteinGrid

/-! # Certified mixture discounts on nineteen synchronized fourth-excess intervals

For each physical value of the fourth excess, both row potentials use the same
slab. Inside it their bracketing scale intervals are allowed to meet on a face.
-/

set_option warningAsError true
set_option maxRecDepth 5000

namespace Grothe.LowerAnalytic.SparseStein

open Grothe.Lower
open Grothe.Lower.SharedGate.WeightedSchur (pairGainQ)
open CoupledStein (curvature overlay rowChords discount worst stop)
open CoupledStein

private def K (w : ℚ) := curvature w row08.kappa row09.kappa row08.delta (pairGainQ w)
private def B (w d : ℚ) := (1-w)*cap08Tight+w*cap09Tight-d

def table (small : Bool) := if small then smallPrices else prices

def lookup (small : Bool) := if small then smallPrice else price

def stopAt (small : Bool) := if small then smallStop else stop

private def gridPrices (band : ScaleBand) := band.table.map fun (w,d) ↦ Grid.price w (K w) (B w d)
private def pairGroup (sl : Slice) := (Grid.group c08 sl.left, Grid.group c09 sl.right)
private def groups := slices.map pairGroup
private def groupData : List (Grid.Group × Grid.Group) := eval% groups

private def bands : List ScaleBand := .whole :: .small :: ScaleBand.restricted

private def sourceBank (band : ScaleBand) : ℤ × List Grid.Price :=
  (⌈Grid.scale*band.stop⌉, gridPrices band)

private def bank : List (ℤ × List Grid.Price) := eval% bands.map sourceBank

private theorem mem_bank (band : ScaleBand) : sourceBank band ∈ bank := by
  cases band <;> decide +kernel

private abbrev BlockVerified (i : ℕ) : Prop :=
  groups[i]? = groupData[i]? ∧
    let pair := groupData[i]?.getD default
    bank.all (fun item ↦ Grid.groupCheck item.1 item.2 pair.1 pair.2) = true

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
private theorem block12 : BlockVerified 12 := by decide +kernel
private theorem block13 : BlockVerified 13 := by decide +kernel
private theorem block14 : BlockVerified 14 := by decide +kernel
private theorem block15 : BlockVerified 15 := by decide +kernel
private theorem block16 : BlockVerified 16 := by decide +kernel
private theorem block17 : BlockVerified 17 := by decide +kernel
private theorem block18 : BlockVerified 18 := by decide +kernel

private theorem block_verified (i : ℕ) (hi : i < 19) : BlockVerified i := by
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
  · exact block12
  · exact block13
  · exact block14
  · exact block15
  · exact block16
  · exact block17
  · exact block18

private theorem group_verified (band : ScaleBand) (sl : Slice) (hs : sl ∈ slices) :
    Grid.groupCheck ⌈Grid.scale*band.stop⌉ (gridPrices band) (Grid.group c08 sl.left) (Grid.group c09 sl.right) := by
  obtain ⟨i,hi,rfl⟩ := List.mem_iff_getElem.mp hs
  have hsize : slices.length = 19 := by rfl
  obtain ⟨he,hb⟩ := block_verified i (hsize ▸ hi)
  have hl : groups[i]? = some (pairGroup slices[i]) := by simp [groups, getElem?_pos slices i hi]
  rw [← he, hl] at hb
  simp only [Option.getD_some, pairGroup] at hb
  exact List.all_eq_true.mp hb (sourceBank band) (mem_bank band)

private theorem price_ranges (band : ScaleBand) :
    (band.table).all (fun p ↦ decide (0 ≤ p.1 ∧ p.1 ≤ 1 ∧ 0 ≤ B p.1 p.2 ∧ band.lookup p.1 = p.2)) := by
  cases band <;> decide +kernel

/-- A common shape slab and a common actual scale certify each tabulated discount. -/
theorem price_le_band (band : ScaleBand) (sl : Slice) (hs : sl ∈ slices) (w : ℚ) (hw : w ∈ (band.table).map Prod.fst) :
    band.lookup w ≤ discount (overlay (band.stop) (rowChords c08 [sl.left]) (rowChords c09 [sl.right])) w
      row08.kappa row09.kappa cap08Tight cap09Tight row08.delta (pairGainQ w) := by
  obtain ⟨⟨w,d⟩,hp,rfl⟩ := List.mem_map.mp hw
  obtain ⟨h0,h1,hb,hp'⟩ := of_decide_eq_true (List.all_eq_true.mp (price_ranges band) (w,d) hp)
  have h := Grid.worst_le (left := rowChords c08 [sl.left]) (right := rowChords c09 [sl.right]) (s := band.stop)
    (k := K w) h0 h1 hb fun l hl r hr hm ↦ by
      obtain ⟨L,hL,hlg,hl₀,hl₁⟩ := Grid.member_group hl
      obtain ⟨R,hR,hrg,hr₀,hr₁⟩ := Grid.member_group hr
      simp only [List.map_cons, List.map_nil, List.mem_singleton] at hL hR
      subst L R
      exact Grid.groupCheck_sound (group_verified band sl hs) hlg hrg hl₀ hl₁ hr₀ hr₁ hm (List.mem_map_of_mem hp)
  rw [hp']
  change _ ≤ (1-w)*cap08Tight+w*cap09Tight-worst _ w (K w)
  change _ ≤ (1-w)*cap08Tight+w*cap09Tight-d at h
  linarith only [h]

/-- The original whole-range and small-range prices. -/
theorem price_le (small : Bool) (sl : Slice) (hs : sl ∈ slices) (w : ℚ) (hw : w ∈ (table small).map Prod.fst) :
    lookup small w ≤ discount (overlay (stopAt small) (rowChords c08 [sl.left]) (rowChords c09 [sl.right])) w
      row08.kappa row09.kappa cap08Tight cap09Tight row08.delta (pairGainQ w) := by
  cases small
  · exact price_le_band .whole sl hs w hw
  · exact price_le_band .small sl hs w hw

end Grothe.LowerAnalytic.SparseStein
