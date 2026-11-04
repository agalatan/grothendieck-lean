import Grothe.UpperQuad.IntervalSound
import GrotheQuadKernel.Profile
import Grothe.UpperChaos.F0ConditionalEvaluator

/-!
# Soundness of the profile, sign and shift evaluation

The kernel evaluates master's `vprof` exactly as defined (`Rounder.lean`: `lagHalf`, `binHalf`,
`nrmHalf`), so `vprofI` encloses `vprof s`, `scaledProfileI` encloses `κ · vprof s`, and
`profileShiftI` returns the sign `profileSign s` and an enclosure of `profileShift s`
(`F0ConditionalEvaluator`), for profile data equal to `profileQ`, `aQ`.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad

open GrotheQuad Grothe.UpperChaos Grothe.UpperChaos.F0ConditionalEvaluator

/-! ### The half-integer Laguerre profile -/

/-- The rational `binHalfRat j k` is `binHalf j k`, with a positive denominator. -/
lemma binHalfRat_eq (j k : ℕ) :
    0 < (binHalfRat j k).2 ∧
      ((binHalfRat j k).1 : ℝ) / ((binHalfRat j k).2 : ℝ) = binHalf j k := by
  unfold binHalfRat binHalf
  generalize j - k = m
  induction m with
  | zero => simp
  | succ m ih =>
    rw [foldl_range_succ, Finset.prod_range_succ]
    obtain ⟨hpos, heq⟩ := ih
    set F := (List.range m).foldl
      (fun p i => (p.1 * ((2 * k + 1 + 2 * i : ℕ) : ℤ), p.2 * (2 * (i + 1)))) (1, 1) with hF
    clear_value F
    refine ⟨Nat.mul_pos hpos (by omega), ?_⟩
    simp only
    rw [← heq]
    have h2 : (F.2 : ℝ) ≠ 0 := by exact_mod_cast hpos.ne'
    have h3 : ((m : ℝ) + 1) ≠ 0 := by positivity
    push_cast
    field_simp

lemma mem_lagHalfTerm (P : ℕ) (hP : 1 ≤ P) (j k : ℕ) {s : ℝ} {sI : Ival} (hs : mem s sI) :
    mem ((-1) ^ k * binHalf j k * s ^ k / (k.factorial : ℝ)) (lagHalfTerm P j k sI) := by
  obtain ⟨hpos, heq⟩ := binHalfRat_eq j k
  unfold lagHalfTerm
  simp only
  have ht : mem (binHalf j k * s ^ k / (k.factorial : ℝ))
      (divN P (factNat k) (mulI P (ratI P (binHalfRat j k).1 (binHalfRat j k).2) (powI P sI k))) := by
    rw [factNat_eq, ← heq]
    exact mem_divN P hP (Nat.factorial_pos k) (mem_mulI P (mem_ratI P hP _ hpos) (mem_powI P hs k))
  split_ifs with hk
  · have hk' : k % 2 = 1 := by simpa using hk
    have hneg : ((-1 : ℝ) ^ k) = -1 := by
      rw [← Nat.div_add_mod k 2, hk', pow_add, pow_mul]; simp
    rw [hneg]
    have := mem_negI ht
    convert this using 1
    ring
  · have hk' : k % 2 = 0 := by
      have := Nat.mod_two_eq_zero_or_one k
      simp at hk
      omega
    have hone : ((-1 : ℝ) ^ k) = 1 := by
      rw [← Nat.div_add_mod k 2, hk', add_zero, pow_mul]; simp
    rw [hone, one_mul]
    exact ht

lemma mem_lagHalfI (P : ℕ) (hP : 1 ≤ P) (j : ℕ) {s : ℝ} {sI : Ival} (hs : mem s sI) :
    mem (lagHalf j s) (lagHalfI P j sI) := by
  unfold lagHalf lagHalfI
  exact mem_sumRangeI P (j + 1) fun k _ => mem_lagHalfTerm P hP j k hs

lemma mem_nrmHalfI (P : ℕ) (hP : 1 ≤ P) {sqrtPi : Ival} (hpi : mem (Real.sqrt Real.pi) sqrtPi)
    (j : ℕ) : mem (nrmHalf j) (nrmHalfI P sqrtPi j) := by
  unfold nrmHalf nrmHalfI
  apply mem_sqrtI P (by positivity)
  rw [factNat_eq, factNat_eq]
  have h := mem_mulI P hpi (mem_divN P hP (by positivity : 0 < 4 ^ j * (j.factorial) ^ 2)
    (mem_ofNat P (2 * j).factorial))
  convert h using 1
  push_cast
  ring

/-- The profile data agrees with `profileQ` and `aQ`. -/
def profileAgrees (pd : ProfileData) : Prop :=
  pd.coeffs.size = Grothe.Upper.profileQ.length ∧
    (∀ j, j < pd.coeffs.size →
      (((pd.coeffs.getD j (0, 1)).1 : ℝ) / ((pd.coeffs.getD j (0, 1)).2 : ℝ) =
        ((Grothe.Upper.profileQ.getD j 0 : ℚ) : ℝ)) ∧ 0 < (pd.coeffs.getD j (0, 1)).2) ∧
    ((pd.aN : ℝ) / (pd.aD : ℝ) = ((Grothe.Upper.aQ : ℚ) : ℝ) ∧ 0 < pd.aD)

lemma mem_vprofI (P : ℕ) (hP : 1 ≤ P) {piI : Ival} (hpi : mem Real.pi piI) {pd : ProfileData}
    (hpd : profileAgrees pd) {s : ℝ} {sI : Ival} (hs : mem s sI)
    (hn : ∀ j, j < pd.coeffs.size → 0 < (nrmHalfI P (sqrtI P piI) j).lo) :
    mem (vprof s) (vprofI P piI pd sI) := by
  unfold vprof vprofI
  rw [← hpd.1]
  apply mem_sumRangeI P pd.coeffs.size
  intro j hj
  unfold vprofTerm
  obtain ⟨hcoef, hden⟩ := hpd.2.1 j hj
  rw [← hcoef]
  exact mem_divI P (mem_mulI P (mem_ratI P hP _ hden) (mem_lagHalfI P hP j hs))
    (mem_nrmHalfI P hP (mem_sqrtI P Real.pi_pos.le hpi) j) (hn j hj)

lemma mem_kappaI (P : ℕ) (hP : 1 ≤ P) {pd : ProfileData} (hpd : profileAgrees pd) :
    mem (Real.sqrt (1 + ((Grothe.Upper.aQ : ℚ) : ℝ) ^ 2)) (kappaI P pd) := by
  unfold kappaI
  apply mem_sqrtI P (by positivity)
  rw [← hpd.2.2.1, sq]
  exact mem_addI P (mem_one P) (mem_sqI P (mem_ratI P hP _ hpd.2.2.2))

lemma mem_scaledProfileI (P : ℕ) (hP : 1 ≤ P) {piI : Ival} (hpi : mem Real.pi piI)
    {pd : ProfileData} (hpd : profileAgrees pd) {s : ℝ} {sI : Ival} (hs : mem s sI)
    (hn : ∀ j, j < pd.coeffs.size → 0 < (nrmHalfI P (sqrtI P piI) j).lo) :
    mem (Real.sqrt (1 + ((Grothe.Upper.aQ : ℚ) : ℝ) ^ 2) * vprof s) (scaledProfileI P piI pd sI) :=
  mem_mulI P (mem_kappaI P hP hpd) (mem_vprofI P hP hpi hpd hs hn)

/-- `profileShiftI` is sound: the sign is `profileSign s`, the profile is nonzero, and the shift
`profileShift s` lies in the returned enclosure. -/
lemma profileShiftI_sound (P : ℕ) (hP : 1 ≤ P) {piI : Ival} (hpi : mem Real.pi piI)
    {pd : ProfileData} (hpd : profileAgrees pd) {s : ℝ} {sI : Ival} (hs0 : 0 ≤ s) (hs : mem s sI)
    (hn : ∀ j, j < pd.coeffs.size → 0 < (nrmHalfI P (sqrtI P piI) j).lo)
    {v : Ival} {neg : Bool} {sh : Ival} (h : profileShiftI P piI pd sI = some (v, neg, sh)) :
    vprof s ≠ 0 ∧ profileSign s = (if neg then -1 else 1) ∧ mem (profileShift s) sh := by
  have hv := mem_scaledProfileI P hP hpi hpd hs hn
  have hk : 0 < Real.sqrt (1 + ((Grothe.Upper.aQ : ℚ) : ℝ) ^ 2) := Real.sqrt_pos.2 (by positivity)
  unfold profileShiftI at h
  split_ifs at h with hpos hneg
  · simp only [Option.some.injEq, Prod.mk.injEq] at h
    obtain ⟨rfl, rfl, rfl⟩ := h
    have hvp : 0 < Real.sqrt (1 + ((Grothe.Upper.aQ : ℚ) : ℝ) ^ 2) * vprof s := pos_of_isPos hpos hv
    have hv0 : 0 < vprof s := by
      by_contra hc
      have : Real.sqrt (1 + ((Grothe.Upper.aQ : ℚ) : ℝ) ^ 2) * vprof s ≤ 0 :=
        mul_nonpos_of_nonneg_of_nonpos hk.le (not_lt.mp hc)
      linarith
    refine ⟨hv0.ne', ?_, ?_⟩
    · simp [profileSign, not_lt.mpr hv0.le]
    · unfold profileShift profileScale
      rw [abs_of_pos hv0]
      exact mem_divI P (mem_sqrtI P hs0 hs) hv (lo_pos_of_isPos hpos)
  · simp only [Option.some.injEq, Prod.mk.injEq] at h
    obtain ⟨rfl, rfl, rfl⟩ := h
    have hvn : Real.sqrt (1 + ((Grothe.Upper.aQ : ℚ) : ℝ) ^ 2) * vprof s < 0 := neg_of_isNeg hneg hv
    have hv0 : vprof s < 0 := by
      by_contra hc
      have : 0 ≤ Real.sqrt (1 + ((Grothe.Upper.aQ : ℚ) : ℝ) ^ 2) * vprof s :=
        mul_nonneg hk.le (not_lt.mp hc)
      linarith
    refine ⟨hv0.ne, ?_, ?_⟩
    · simp [profileSign, hv0]
    · unfold profileShift profileScale
      rw [abs_of_neg hv0]
      have hneg' : 0 < (negI (scaledProfileI P piI pd sI)).lo := by
        unfold isNeg at hneg
        simp only [negI]
        have : (scaledProfileI P piI pd sI).hi < 0 := by simpa using hneg
        omega
      have := mem_divI P (mem_sqrtI P hs0 hs) (mem_negI hv) hneg'
      convert this using 2
      ring

end Grothe.UpperQuad
