import Grothe.UpperQuad.IntervalSound
import GrotheQuadKernel.Seed

/-!
# Soundness of the Machin enclosure of `π`

`arctan(1/n)` by its alternating series (`Real.hasSum_arctan`; the partial sums of an
alternating series with antitone terms sandwich the limit, so the tail is bounded by the next
term), and `π = 16 arctan(1/5) − 4 arctan(1/239)` from `Real.arctan_add` and `Real.arctan_one`.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad

open GrotheQuad Filter Topology

/-- The arctan series terms `f_j = x^{2j+1}/(2j+1)` (signs separate). -/
noncomputable def atanTerm (x : ℝ) (j : ℕ) : ℝ := x ^ (2 * j + 1) / (2 * j + 1)

lemma atanTerm_antitone {x : ℝ} (hx0 : 0 ≤ x) (hx1 : x ≤ 1) : Antitone (atanTerm x) := by
  apply antitone_nat_of_succ_le
  intro j
  unfold atanTerm
  push_cast
  have hp : x ^ (2 * (j + 1) + 1) ≤ x ^ (2 * j + 1) :=
    pow_le_pow_of_le_one hx0 hx1 (by omega)
  have hd : (0 : ℝ) < 2 * j + 1 := by positivity
  calc x ^ (2 * (j + 1) + 1) / (2 * ((j : ℝ) + 1) + 1) ≤ x ^ (2 * (j + 1) + 1) / (2 * j + 1) := by
        apply div_le_div_of_nonneg_left (by positivity) hd
        linarith
    _ ≤ x ^ (2 * j + 1) / (2 * j + 1) := div_le_div_of_nonneg_right hp hd.le

/-- The alternating-series tail bound: `|arctan x − Σ_{j<N} (−1)^j f_j| ≤ f_N` for `0 ≤ x < 1`. -/
lemma arctan_tail_le {x : ℝ} (hx0 : 0 ≤ x) (hx1 : x < 1) (N : ℕ) :
    |Real.arctan x - ∑ j ∈ Finset.range N, (-1) ^ j * atanTerm x j| ≤ atanTerm x N := by
  have hsum := Real.hasSum_arctan (x := x) (by rw [Real.norm_eq_abs, abs_of_nonneg hx0]; exact hx1)
  have hsum' : HasSum (fun j => (-1) ^ j * atanTerm x j) (Real.arctan x) := by
    convert hsum using 1
    funext j
    unfold atanTerm
    push_cast
    ring
  have hlim : Tendsto (fun n => ∑ j ∈ Finset.range n, (-1) ^ j * atanTerm x j) atTop
      (𝓝 (Real.arctan x)) := hsum'.tendsto_sum_nat
  have hanti := atanTerm_antitone hx0 hx1.le
  rw [abs_le]
  rcases Nat.even_or_odd N with ⟨k, hk⟩ | ⟨k, hk⟩
  · -- N = 2k: S_{2k} ≤ l ≤ S_{2k+1} = S_{2k} + f_{2k}
    have h1 := hanti.alternating_series_le_tendsto hlim k
    have h2 := hanti.tendsto_le_alternating_series hlim k
    rw [Finset.sum_range_succ] at h2
    have hpow : ((-1 : ℝ) ^ (2 * k)) = 1 := by rw [pow_mul]; simp
    rw [hpow, one_mul] at h2
    have hf : 0 ≤ atanTerm x (2 * k) := by unfold atanTerm; positivity
    rw [hk, show k + k = 2 * k by ring]
    constructor <;> linarith
  · -- N = 2k+1: S_{2k+2} = S_{2k+1} − f_{2k+1} ≤ l ≤ S_{2k+1}
    have h1 := hanti.alternating_series_le_tendsto hlim (k + 1)
    have h2 := hanti.tendsto_le_alternating_series hlim k
    rw [show 2 * (k + 1) = 2 * k + 1 + 1 by ring, Finset.sum_range_succ] at h1
    have hneg : ((-1 : ℝ) ^ (2 * k + 1)) = -1 := by rw [pow_succ, pow_mul]; simp
    rw [hneg, neg_one_mul] at h1
    have hf : 0 ≤ atanTerm x (2 * k + 1) := by unfold atanTerm; positivity
    rw [hk]
    constructor <;> linarith

/-- The loop of `arctanInvI`: `t = x^{2k+1}`, `s = Σ_{j<k} (−1)^j f_j`. -/
lemma arctanLoop_sound (P : ℕ) (hP : 1 ≤ P) {x : ℝ} {x2 : Ival} (hx2 : mem (x * x) x2) :
    ∀ (fuel k : ℕ) (t s : Ival), mem (x ^ (2 * k + 1)) t →
      mem (∑ j ∈ Finset.range k, (-1) ^ j * atanTerm x j) s →
      mem (∑ j ∈ Finset.range (k + fuel), (-1) ^ j * atanTerm x j) (arctanLoop P x2 fuel k t s).1 ∧
      mem (x ^ (2 * (k + fuel) + 1)) (arctanLoop P x2 fuel k t s).2 := by
  intro fuel
  induction fuel with
  | zero =>
    intro k t s ht hs
    simpa [arctanLoop] using ⟨hs, ht⟩
  | succ fuel ih =>
    intro k t s ht hs
    have ht' : mem (x ^ (2 * (k + 1) + 1)) (mulI P t x2) := by
      have := mem_mulI P ht hx2
      convert this using 1
      ring
    have hterm : mem (atanTerm x k) (divN P (2 * k + 1) t) := by
      have := mem_divN P hP (by omega : 0 < 2 * k + 1) ht
      unfold atanTerm
      convert this using 1
      push_cast
      ring
    have hs' : mem (∑ j ∈ Finset.range (k + 1), (-1) ^ j * atanTerm x j)
        (if k % 2 == 0 then addI P s (divN P (2 * k + 1) t) else subI P s (divN P (2 * k + 1) t)) := by
      rw [Finset.sum_range_succ]
      split_ifs with hk
      · have hk' : k % 2 = 0 := by simpa using hk
        have : ((-1 : ℝ) ^ k) = 1 := by
          rw [← Nat.div_add_mod k 2, hk', add_zero, pow_mul]; simp
        rw [this, one_mul]
        exact mem_addI P hs hterm
      · have hk' : k % 2 = 1 := by
          have := Nat.mod_two_eq_zero_or_one k
          simp at hk
          omega
        have : ((-1 : ℝ) ^ k) = -1 := by
          rw [← Nat.div_add_mod k 2, hk', pow_add, pow_mul]; simp
        rw [this, neg_one_mul, ← sub_eq_add_neg]
        exact mem_subI P hs hterm
    have := ih (k + 1) _ _ ht' hs'
    rw [show k + 1 + fuel = k + (fuel + 1) by ring] at this
    simpa [arctanLoop] using this

/-- `arctan(1/n) ∈ arctanInvI P N n` for `n ≥ 2`. -/
lemma mem_arctanInvI (P : ℕ) (hP : 1 ≤ P) (N n : ℕ) (hn : 2 ≤ n) :
    mem (Real.arctan (1 / n)) (arctanInvI P N n) := by
  have hx : mem (1 / (n : ℝ)) (divN P n (ofInt P 1)) := mem_divN P hP (by omega) (mem_one P)
  have hx0 : (0 : ℝ) ≤ 1 / n := by positivity
  have hx1 : (1 : ℝ) / n < 1 := by
    rw [div_lt_one (by positivity)]
    exact_mod_cast hn
  have hx2 : mem (1 / (n : ℝ) * (1 / n)) (sqI P (divN P n (ofInt P 1))) := mem_sqI P hx
  have h1 : mem ((1 / (n : ℝ)) ^ (2 * 0 + 1)) (divN P n (ofInt P 1)) := by simpa using hx
  have h2 : mem (∑ j ∈ Finset.range 0, (-1) ^ j * atanTerm (1 / n) j) zeroI := by
    simp; exact (mem_zeroI_iff 0).2 rfl
  obtain ⟨hs, ht⟩ := arctanLoop_sound P hP hx2 N 0 _ _ h1 h2
  simp only [zero_add] at hs ht
  set tI := (arctanLoop P (sqI P (divN P n (ofInt P 1))) N 0 (divN P n (ofInt P 1)) zeroI).2 with htI
  unfold arctanInvI
  rw [← htI]
  have hy : |Real.arctan (1 / n) - ∑ j ∈ Finset.range N, (-1) ^ j * atanTerm (1 / n) j| ≤
      bval (divN P (2 * N + 1) (absUpper tI)) := by
    refine (arctan_tail_le hx0 hx1 N).trans ?_
    have hb := mem_divN P hP (by omega : 0 < 2 * N + 1) (mem_absUpper tI)
    have hbv := (le_abs_self _).trans (abs_le_bval hb)
    have htb : atanTerm (1 / n) N ≤ bval tI / ((2 * N + 1 : ℕ) : ℝ) := by
      unfold atanTerm
      push_cast
      apply div_le_div_of_nonneg_right _ (by positivity)
      exact (le_abs_self _).trans (abs_le_bval ht)
    exact htb.trans hbv
  have := mem_widen P hs hy
  rwa [add_sub_cancel] at this

/-- Machin: `π = 16 arctan(1/5) − 4 arctan(1/239)`. -/
lemma pi_machin : Real.pi = 16 * Real.arctan (1 / 5) - 4 * Real.arctan (1 / 239) := by
  have h1 : Real.arctan (1 / 5) + Real.arctan (1 / 5) = Real.arctan (5 / 12) := by
    rw [Real.arctan_add (by norm_num)]; norm_num
  have h2 : Real.arctan (5 / 12) + Real.arctan (5 / 12) = Real.arctan (120 / 119) := by
    rw [Real.arctan_add (by norm_num)]; norm_num
  have h3 : Real.arctan (120 / 119) + Real.arctan (-(1 / 239)) = Real.arctan 1 := by
    rw [Real.arctan_add (by norm_num)]; norm_num
  rw [Real.arctan_neg, Real.arctan_one] at h3
  linarith

lemma mem_piMachinI (P : ℕ) (hP : 1 ≤ P) (N : ℕ) : mem Real.pi (piMachinI P N) := by
  rw [pi_machin]
  unfold piMachinI
  have h5 := mem_mulN P 16 (mem_arctanInvI P hP N 5 (by norm_num))
  have h239 := mem_mulN P 4 (mem_arctanInvI P hP N 239 (by norm_num))
  have := mem_subI P h5 h239
  push_cast at this
  exact this

end Grothe.UpperQuad
