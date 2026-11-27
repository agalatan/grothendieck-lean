import Grothe.Lower.Sweep
import Grothe.Lower.RowParser
import Grothe.Lower.RowData06
import Grothe.Lower.RowData07
import Mathlib.Tactic.Eval

set_option warningAsError true
set_option maxRecDepth 50000
set_option maxHeartbeats 1600000

/-! # Quadratic bounds on the two outer potentials
The certificate selects knots from each original cap table. It checks the whole chord
between consecutive selected knots and the Lipschitz ray from the last one.
Agent-ID: codex-a7c4
-/

namespace Grothe.Lower.SparseOuter

private def stepOK (A B : ℚ) (p q : ℚ × ℚ) : Bool :=
  let s := (q.2 - p.2) / (q.1 - p.1)
  decide (p.1 < q.1 ∧ quadMax (p.2 - s * p.1) s (-B) p.1 q.1 ≤ A)

private def chainOK (A B L : ℚ) (p : ℚ × ℚ) : List (ℚ × ℚ) → Bool
  | [] => decide (0 ≤ B ∧ L ≤ 2*B*p.1 ∧ p.2 ≤ A+B*p.1^2)
  | q :: qs => stepOK A B p q && chainOK A B L q qs

private theorem chain_sound {Ψ : ℝ → ℝ} {nodes : List (ℚ × ℚ)} {L : ℚ}
    (h : CapsHold Ψ nodes L) (A B : ℚ) (qs : List (ℚ × ℚ)) (p : ℚ × ℚ)
    (hc : chainOK A B L p qs = true) (hmem : ∀ n ∈ p::qs, n ∈ nodes)
    (hp : 0 ≤ (p.1 : ℝ)) {t : ℝ} (ht : (p.1 : ℝ) ≤ t) : Ψ t ≤ (A : ℝ) + B*t^2 := by
  have hcap := h.caps p (hmem p (by simp))
  induction qs generalizing p with
  | nil =>
    obtain ⟨hB, hL, hA⟩ := of_decide_eq_true hc
    have b : (0 : ℝ) ≤ B := by exact_mod_cast hB
    have l : (L : ℝ) ≤ 2*(B : ℝ)*p.1 := by exact_mod_cast hL
    have a : (p.2 : ℝ) ≤ (A : ℝ)+(B : ℝ)*(p.1 : ℝ)^2 := by exact_mod_cast hA
    have hlip := h.lip p.1 t hp ht
    nlinarith only [hlip, hcap, a, mul_le_mul_of_nonneg_right l (sub_nonneg.mpr ht),
      mul_nonneg b (sq_nonneg (t - (p.1 : ℝ)))]
  | cons q qs ih =>
    obtain ⟨hstep, htail⟩ := Bool.and_eq_true_iff.mp hc
    obtain ⟨hpq, hmax⟩ := of_decide_eq_true hstep
    have pq : (p.1 : ℝ) < q.1 := by exact_mod_cast hpq
    by_cases htq : t ≤ (q.1 : ℝ)
    · have hch := chord_le Ψ h.convex p.1 q.1 p.2 q.2 t hp pq ht htq hcap
          (h.caps q (hmem q (by simp)))
      let s := (q.2-p.2)/(q.1-p.1)
      have hm := (quadVal_le_quadMax (p.2-s*p.1) s (-B) p.1 q.1 t ht htq).trans
        ((Rat.cast_le (K := ℝ)).mpr hmax)
      push_cast at hm
      have hs : (s : ℝ) = ((q.2 : ℝ)-p.2)/(q.1-p.1) := by simp [s]
      rw [← hs] at hch
      linarith only [hch, hm]
    · exact ih q htail (fun n hn => hmem n (List.mem_cons_of_mem _ hn)) (hp.trans pq.le)
          (le_of_not_ge htq) (h.caps q (hmem q (by simp)))


private def codes6 : List RowParser.NodeCode := eval% row06.nodeList.map fun (x,y) ↦
  ((x.num.natAbs,x.den), (y.num.natAbs,y.den))

private def decoded6 : List (ℚ × ℚ) := eval% row06.nodeList

private theorem decoded6_eq : row06.nodeList = decoded6 := by
  calc
    _ = codes6.map RowParser.nodeValue :=
      RowParser.decodeRow (by rfl) (by decide +kernel) (by decide +kernel)
    _ = decoded6 := by decide +kernel

private def tail6 : List (ℚ × ℚ) := eval%
  ([1, 3, 5, 8, 12, 16, 19, 21, 23, 24, 25, 26, 27, 28, 30, 34, 42, 59, 102] : List ℕ).map (fun i ↦ (row06.nodeList)[i]!)

private def start6 : ℚ × ℚ := eval% row06.nodeList[0]!

/-- Every nonnegative physical radius satisfies the quadratic bound for row 06. -/
theorem cap6 {Ψ : ℝ → ℝ} (h : CapsHold Ψ row06.nodeList row06.smax)
    {x : ℝ} (hx : 0 ≤ x) : Ψ x ≤ 1306702479/1000000000 + (563/500)*x^2 := by
  have hc : chainOK (1306702479/1000000000) (563/500) row06.smax start6 tail6 = true := by decide +kernel
  have subset : ∀ n ∈ start6::tail6, n ∈ decoded6 := by decide +kernel
  have hzero : start6.1 = 0 := by decide +kernel
  have result := chain_sound h (1306702479/1000000000) (563/500) tail6 start6 hc
    (by rw [decoded6_eq]; exact subset) (by simp [hzero]) (t := x)
    (by simpa only [hzero, Rat.cast_zero] using hx)
  simpa only [Rat.cast_div, Rat.cast_ofNat] using result


private def codes7 : List RowParser.NodeCode := eval% row07.nodeList.map fun (x,y) ↦
  ((x.num.natAbs,x.den), (y.num.natAbs,y.den))

private def decoded7 : List (ℚ × ℚ) := eval% row07.nodeList

private theorem decoded7_eq : row07.nodeList = decoded7 := by
  calc
    _ = codes7.map RowParser.nodeValue :=
      RowParser.decodeRow (by rfl) (by decide +kernel) (by decide +kernel)
    _ = decoded7 := by decide +kernel

private def tail7 : List (ℚ × ℚ) := eval%
  ([1, 2, 3, 5, 8, 14, 22, 30, 37, 43, 47, 50, 53, 56, 60, 68, 77, 95, 136] : List ℕ).map (fun i ↦ (row07.nodeList)[i]!)

private def start7 : ℚ × ℚ := eval% row07.nodeList[0]!

/-- Every nonnegative physical radius satisfies the quadratic bound for row 07. -/
theorem cap7 {Ψ : ℝ → ℝ} (h : CapsHold Ψ row07.nodeList row07.smax)
    {x : ℝ} (hx : 0 ≤ x) : Ψ x ≤ 132914743/100000000 + (227/200)*x^2 := by
  have hc : chainOK (132914743/100000000) (227/200) row07.smax start7 tail7 = true := by decide +kernel
  have subset : ∀ n ∈ start7::tail7, n ∈ decoded7 := by decide +kernel
  have hzero : start7.1 = 0 := by decide +kernel
  have result := chain_sound h (132914743/100000000) (227/200) tail7 start7 hc
    (by rw [decoded7_eq]; exact subset) (by simp [hzero]) (t := x)
    (by simpa only [hzero, Rat.cast_zero] using hx)
  simpa only [Rat.cast_div, Rat.cast_ofNat] using result

end Grothe.Lower.SparseOuter
