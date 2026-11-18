import Grothe.UpperChaos.HermiteC2Basis

/-!
# Complete angular-mode enumeration for the cell certificate

Agent-ID: codex-a7c4.

The relative angular frequency is `m = p₁-q₁`. Charge one fixes the other frequency to `1-m`.
The remaining radial orders are the minima of the two Hermite index pairs. These identities
account for all angular frequencies in a finite chaos head, including the negative ones.
-/

namespace Grothe.UpperReplacement

open Grothe.UpperChaos

/-- Convert relative angular frequency and two Laguerre orders to a Hermite index. -/
def cellMode (m : ℤ) (a b : ℕ) : Idx2 :=
  ((a + m.toNat, a + (-m).toNat), (b + (1 - m).toNat, b + (m - 1).toNat))

/-- First radial grade where a relative angular frequency can occur. -/
def modeShift (m : ℤ) : ℕ := if m ≤ 0 then (-m).toNat else (m - 1).toNat

theorem cellMode_charge (m : ℤ) (a b : ℕ) :
    (cellMode m a b).1.1 + (cellMode m a b).2.1 =
      (cellMode m a b).1.2 + (cellMode m a b).2.2 + 1 := by
  simp only [cellMode]
  omega

theorem cellMode_frequency (m : ℤ) (a b : ℕ) :
    ((cellMode m a b).1.1 : ℤ) - (cellMode m a b).1.2 = m := by
  simp only [cellMode]
  omega

theorem cellMode_radial_left (m : ℤ) (a b : ℕ) :
    min (cellMode m a b).1.1 (cellMode m a b).1.2 = a := by
  simp only [cellMode]
  omega

theorem cellMode_radial_right (m : ℤ) (a b : ℕ) :
    min (cellMode m a b).2.1 (cellMode m a b).2.2 = b := by
  simp only [cellMode]
  omega

theorem cellMode_grade (m : ℤ) (a b : ℕ) :
    (cellMode m a b).1.2 + (cellMode m a b).2.2 = modeShift m + a + b := by
  simp only [cellMode, modeShift]
  split_ifs <;> omega

/-- No Hermite index of charge one is missing from the cell enumeration. -/
theorem cellMode_reconstruct (i : Idx2)
    (hc : i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1) :
    cellMode ((i.1.1 : ℤ) - i.1.2) (min i.1.1 i.1.2) (min i.2.1 i.2.2) = i := by
  ext <;> simp only [cellMode] <;> omega

/-- Distinct angular/radial coordinates never double-count a Hermite index. -/
theorem cellMode_injective : Function.Injective
    (fun v : ℤ × ℕ × ℕ ↦ cellMode v.1 v.2.1 v.2.2) := by
  rintro ⟨m, a, b⟩ ⟨n, c, d⟩ he
  have hm := congrArg (fun i : Idx2 ↦ (i.1.1 : ℤ) - i.1.2) he
  have ha := congrArg (fun i : Idx2 ↦ min i.1.1 i.1.2) he
  have hb := congrArg (fun i : Idx2 ↦ min i.2.1 i.2.2) he
  simp only [cellMode_frequency] at hm
  simp only [cellMode_radial_left] at ha
  simp only [cellMode_radial_right] at hb
  exact Prod.ext hm (Prod.ext ha hb)

/-- A head through radial grade `K` needs frequencies precisely within `[-K,K+1]`;
the radial orders satisfy the corresponding triangular cutoff. -/
theorem cellMode_head_iff (m : ℤ) (a b K : ℕ) :
    (cellMode m a b).1.2 + (cellMode m a b).2.2 ≤ K ↔
      -(K : ℤ) ≤ m ∧ m ≤ (K : ℤ) + 1 ∧ modeShift m + a + b ≤ K := by
  rw [cellMode_grade]
  constructor
  · intro h
    refine ⟨?_, ?_, h⟩ <;> unfold modeShift at h <;> split_ifs at h <;> omega
  · exact fun h ↦ h.2.2

/-- In particular, degree 501 uses 502 angular frequencies, without a discarded mode tail. -/
theorem frequency_range_501 (i : Idx2)
    (hc : i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1)
    (hd : i.1.1 + i.1.2 + i.2.1 + i.2.2 ≤ 501) :
    (-250 : ℤ) ≤ (i.1.1 : ℤ) - i.1.2 ∧ (i.1.1 : ℤ) - i.1.2 ≤ 251 := by
  omega

end Grothe.UpperReplacement
