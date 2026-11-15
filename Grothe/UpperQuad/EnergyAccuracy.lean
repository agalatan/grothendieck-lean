-- Grothe/UpperQuad/EnergyAccuracy.lean
import Grothe.UpperEnergyBudget
import Grothe.UpperQuad.Facts.Budget

/-!
# The existing block certificates with their quantitative energy budget

The block soundness argument retains its final error parameter and uses a
weighted square inequality to combine the analytic quadrature and interval-width
errors. Its production instantiation uses the unchanged checks and rational budget
in EnergyBudget. The expensive block facts and their import closure remain
unchanged.

Agent-ID: codex-9b17. Refs #379.
-/

namespace Grothe.UpperQuad

open MeasureTheory GrotheQuad Grothe.UpperChaos Grothe.UpperChaos.FixedChaosSmoothing
  Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries Grothe.Upper
  Grothe.UpperChaos.F0ConditionalEvaluator
open scoped InnerProductSpace

private theorem hclose_of_blocks_quantitative (P : ℕ) (hP : 1 ≤ P) {piI : Ival} (hpi : mem Real.pi piI)
    {pd : ProfileData} (hpd : profileAgrees pd) (hpv : profileValid P piI pd = true)
    (specs : List NodeSpec) (x : NodeSpec → ℝ) (hx : ∀ nd ∈ specs, mem (x nd) nd.bracket.toIval)
    (hJ : ∀ nd ∈ specs, ∀ neg aI, nodeShift P piI pd nd = some (neg, aI) →
      mem (OriginalPositiveMoment.moment 0 (profileShift (specNode nd (x nd)) ^ 2))
        (seedJ0I P piI (sqI P aI)))
    (nb : ℕ) (bounds : ℕ → ℕ) (hmono : Monotone bounds) (h0 : bounds 0 = 0) (hnb : bounds nb = 251)
    (blk : ℕ → ℕ) (hblk : ∀ q, q < 251 → blk q < nb ∧ bounds (blk q) ≤ q ∧ q < bounds (blk q + 1))
    (R : ℕ → Raw)
    (hacc : ∀ b, b < nb → accumulateSpecs P piI pd (bounds b) (bounds (b + 1)) specs rawZero = some (R b))
    {ρ : ℝ} (hQuad : ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2),
      ∑ d ∈ Finset.range (q + 1),
        ‖baseGradedCoefficient q c d - ((gaussCoeff specs x q c d : ℝ) : ℂ)‖ ^ 2 ≤ ρ ^ 2)
    (eps bnd : ℕ → ℤ)
    (hE : ∀ b, b < nb → energyOKBlock (R b) frozenFx tableFx (eps b) (bounds b) (bounds (b + 1)) = true)
    (hW : ∀ b, b < nb → rawDistOKBlock (R b) frozenFx (bnd b) (bounds b) (bounds (b + 1)) = true)
    {evenNum : ℤ} (hEven : evenExcursion tableFx ≤ evenNum)
    {δ Δ τ : ℝ} (hδ0 : 0 ≤ δ)
    (hδ : (EnergyBudget.quadWeightQ : ℝ) * ρ ^ 2 +
      (EnergyBudget.intervalWeightQ : ℝ) *
        (((∑ b ∈ Finset.range nb, bnd b : ℤ) : ℝ) / 2 ^ (2 * KFix)) ≤ δ ^ 2)
    (hsmoothing : δ + (4 / 10 ^ 15 : ℝ) * ((501 / 500 : ℝ) + δ) ≤ Δ)
    (hbudget : (2 * (501 / 500 : ℝ) + 3 * Δ) * Δ +
      (((∑ b ∈ Finset.range nb, eps b + evenNum : ℤ) : ℝ)) / 2 ^ (2 * KFix) ≤ τ) :
    ∑ p ∈ headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp (Xfun frozenCorrectionFn)) p -
        (energyTable p : ℝ)| ≤ τ := by
  have hy : (0 : ℝ) < 2 ^ (2 * KFix) := pow_pos two_pos _
  -- the grade matrices of the block of `q` enclose `G + frozen` and hence the lower ends
  have hG : ∀ q c d, q < 251 → c < q + 2 → d < q + 1 →
      memFx (gaussCoeff specs x q c d + ((frozenQ q c d : ℚ) : ℝ))
        (getFx (gradeMatrix (R (blk q)) frozenFx q) c d) := by
    intro q c d hq hc hd
    obtain ⟨hb, hlo, hhi⟩ := hblk q hq
    have h := memFx_gradeMatrix (v := fun q c d => ((frozenQ q c d : ℚ) : ℝ))
      (qLo := bounds (blk q)) (qHi := bounds (blk q + 1))
      (gaussRaw_of_block P hP hpi hpd hpv _ _ specs x hx hJ (hacc (blk q) hb))
      (fun q c d => memFx_frozenFx q c d) q (by omega) hlo hhi c d hc hd
    unfold gaussCoeff gradeValue at *
    simpa only [add_zero] using h
  have hA : ∀ q c d, q < 251 → c < q + 2 → d < q + 1 →
      memFx ((b0Blocks R blk q c d : ℚ) : ℝ) (getFx (gradeMatrix (R (blk q)) frozenFx q) c d) :=
    fun q c d hq hc hd => memFx_loQ (hG q c d hq hc hd)
  have hblkEq : ∀ b q, b < nb → bounds b ≤ q → q < bounds (b + 1) → blk q = b := by
    intro b q hb hlo hhi
    have hq : q < 251 := by
      have := hmono (show b + 1 ≤ nb by omega)
      omega
    obtain ⟨hb', hlo', hhi'⟩ := hblk q hq
    by_contra hne
    rcases Nat.lt_or_gt_of_ne hne with h | h
    · have := hmono (show blk q + 1 ≤ b by omega); omega
    · have := hmono (show b + 1 ≤ blk q by omega); omega
  -- `htable` by blocks
  have htable : ∑ p ∈ headIdx 501,
      |energy (retainedSmoothed (a0Blocks R blk)) p - (energyTable p : ℝ)| ≤
        (((∑ b ∈ Finset.range nb, eps b + evenNum : ℤ) : ℝ)) / 2 ^ (2 * KFix) := by
    unfold retainedSmoothed
    rw [retainedProductionCoeff_a0Blocks, le_div_iff₀ hy]
    have hs := sum_oddHead_blocks (fun p =>
      |energy (gradedHermite 251 (productionSmoothedCoeff (b0Blocks R blk))) p - (energyTable p : ℝ)|)
      bounds hmono nb
    rw [h0, hnb] at hs
    rw [sum_headIdx_split, hs, add_mul, Finset.sum_mul]
    push_cast
    apply add_le_add
    · apply Finset.sum_le_sum
      intro b hb
      rw [Finset.mem_range] at hb
      have hle : bounds b ≤ bounds (b + 1) := hmono (Nat.le_succ b)
      have hbnd : bounds (b + 1) ≤ 251 := by rw [← hnb]; exact hmono (by omega)
      rw [sum_oddHead' (bounds b) (bounds (b + 1)) hle hbnd]
      exact energyOKBlock_sound (b0Blocks R blk) (raw := R b) (frozen := frozenFx)
        (tab := fun p => ((energyTable p : ℚ) : ℝ)) (bounds b) (bounds (b + 1)) hbnd
        (fun q c d hlo hhi hc hd => by
          have hq : q < 251 := by omega
          have := hA q c d hq hc hd
          rwa [hblkEq b q hb hlo hhi] at this)
        (fun n m _ => memFx2_tableFx n m) (hE b hb)
    · exact (evenExcursion_sound (productionSmoothedCoeff (b0Blocks R blk))
        (tab := fun p => ((energyTable p : ℚ) : ℝ)) (fun n m _ => memFx2_tableFx n m)).trans
        (by exact_mod_cast hEven)
  -- `hraw` by blocks
  have hraw : ‖productionF0Head - gradedHermite 251 (a0Blocks R blk)‖ ≤ δ := by
    have hsumW : ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
        (gaussCoeff specs x q c d + ((frozenQ q c d : ℚ) : ℝ) -
          ((b0Blocks R blk q c d : ℚ) : ℝ)) ^ 2 ≤
        ((∑ b ∈ Finset.range nb, bnd b : ℤ) : ℝ) / 2 ^ (2 * KFix) := by
      rw [le_div_iff₀ hy]
      have hs := sum_range_blocks (fun q => ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
        (gaussCoeff specs x q c d + ((frozenQ q c d : ℚ) : ℝ) -
          ((b0Blocks R blk q c d : ℚ) : ℝ)) ^ 2) bounds hmono h0 nb
      rw [hnb] at hs
      rw [hs, Finset.sum_mul]
      push_cast
      apply Finset.sum_le_sum
      intro b hb
      rw [Finset.mem_range] at hb
      have hbW := hW b hb
      unfold rawDistOKBlock at hbW
      simp only [decide_eq_true_eq] at hbW
      have hbW' : (gradeWidthSqBlock (R b) frozenFx (bounds b) (bounds (b + 1)) : ℝ) ≤ bnd b := by
        exact_mod_cast hbW
      refine le_trans ?_ hbW'
      have h := gradeWidthSqBlock_sound (raw := R b) (frozen := frozenFx)
        (Y := fun q c d => gaussCoeff specs x q c d + ((frozenQ q c d : ℚ) : ℝ)) (bounds b)
        (bounds (b + 1)) (fun q c d hlo hhi hc hd => by
          have hq : q < 251 := by
            have := hmono (show b + 1 ≤ nb by omega); omega
          have := hG q c d hq hc hd
          rwa [hblkEq b q hb hlo hhi] at this)
      have heq : ∑ i ∈ Finset.range (bounds (b + 1) - bounds b), ∑ c ∈ Finset.range (bounds b + i + 2),
          ∑ d ∈ Finset.range (bounds b + i + 1),
            (gaussCoeff specs x (bounds b + i) c d + ((frozenQ (bounds b + i) c d : ℚ) : ℝ) -
              ((b0Blocks R blk (bounds b + i) c d : ℚ) : ℝ)) ^ 2 =
          ∑ i ∈ Finset.range (bounds (b + 1) - bounds b), ∑ c ∈ Finset.range (bounds b + i + 2),
          ∑ d ∈ Finset.range (bounds b + i + 1),
            (gaussCoeff specs x (bounds b + i) c d + ((frozenQ (bounds b + i) c d : ℚ) : ℝ) -
              ((loQ (getFx (gradeMatrix (R b) frozenFx (bounds b + i)) c d) : ℚ) : ℝ)) ^ 2 := by
        apply Finset.sum_congr rfl
        intro i hi
        rw [Finset.mem_range] at hi
        apply Finset.sum_congr rfl
        intro c _
        apply Finset.sum_congr rfl
        intro d _
        unfold b0Blocks
        rw [hblkEq b (bounds b + i) hb (by omega) (by omega)]
      rw [heq]
      exact h
    rw [← sq_le_sq₀ (norm_nonneg _) hδ0, norm_productionF0Head_sub_sq]
    have hterm : ∀ q c d, ‖baseGradedCoefficient q c d - (a0Blocks R blk q c d : ℂ)‖ ^ 2 ≤
        (EnergyBudget.quadWeightQ : ℝ) *
          ‖baseGradedCoefficient q c d - ((gaussCoeff specs x q c d : ℝ) : ℂ)‖ ^ 2 +
        (EnergyBudget.intervalWeightQ : ℝ) * (gaussCoeff specs x q c d + ((frozenQ q c d : ℚ) : ℝ) -
          ((b0Blocks R blk q c d : ℚ) : ℝ)) ^ 2 := by
      intro q c d
      set u := baseGradedCoefficient q c d - ((gaussCoeff specs x q c d : ℝ) : ℂ) with hu
      set w := gaussCoeff specs x q c d + ((frozenQ q c d : ℚ) : ℝ) -
        ((b0Blocks R blk q c d : ℚ) : ℝ) with hw
      have hsplit : baseGradedCoefficient q c d - (a0Blocks R blk q c d : ℂ) = u + (w : ℂ) := by
        rw [hu, hw]
        unfold a0Blocks
        push_cast
        ring
      rw [hsplit]
      have h1 : ‖u + (w : ℂ)‖ ≤ ‖u‖ + |w| := by
        have := norm_add_le u (w : ℂ)
        rwa [Complex.norm_real, Real.norm_eq_abs] at this
      calc ‖u + (w : ℂ)‖ ^ 2 = ‖u + (w : ℂ)‖ * ‖u + (w : ℂ)‖ := sq _
        _ ≤ (‖u‖ + |w|) * (‖u‖ + |w|) := mul_self_le_mul_self (norm_nonneg _) h1
        _ ≤ (EnergyBudget.quadWeightQ : ℝ) * ‖u‖ ^ 2 +
            (EnergyBudget.intervalWeightQ : ℝ) * w ^ 2 := by
          have hsq : 0 ≤ (‖u‖ - (10 ^ 10 : ℝ) * |w|) ^ 2 := sq_nonneg _
          have habs : |w| ^ 2 = w ^ 2 := sq_abs w
          norm_num [EnergyBudget.quadWeightQ, EnergyBudget.intervalWeightQ]
          nlinarith only [hsq, habs]
    calc ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
          ‖baseGradedCoefficient q c d - (a0Blocks R blk q c d : ℂ)‖ ^ 2
        ≤ ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
          ((EnergyBudget.quadWeightQ : ℝ) *
            ‖baseGradedCoefficient q c d - ((gaussCoeff specs x q c d : ℝ) : ℂ)‖ ^ 2 +
            (EnergyBudget.intervalWeightQ : ℝ) * (gaussCoeff specs x q c d + ((frozenQ q c d : ℚ) : ℝ) -
              ((b0Blocks R blk q c d : ℚ) : ℝ)) ^ 2) := by
          exact Finset.sum_le_sum fun q _ => Finset.sum_le_sum fun c _ =>
            Finset.sum_le_sum fun d _ => hterm q c d
      _ = (EnergyBudget.quadWeightQ : ℝ) * (∑ q ∈ Finset.range 251,
            ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
            ‖baseGradedCoefficient q c d - ((gaussCoeff specs x q c d : ℝ) : ℂ)‖ ^ 2) +
          (EnergyBudget.intervalWeightQ : ℝ) * (∑ q ∈ Finset.range 251,
            ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
            (gaussCoeff specs x q c d + ((frozenQ q c d : ℚ) : ℝ) -
              ((b0Blocks R blk q c d : ℚ) : ℝ)) ^ 2) := by
          simp only [Finset.sum_add_distrib, Finset.mul_sum]
      _ ≤ (EnergyBudget.quadWeightQ : ℝ) * ρ ^ 2 +
          (EnergyBudget.intervalWeightQ : ℝ) *
            (((∑ b ∈ Finset.range nb, bnd b : ℤ) : ℝ) / 2 ^ (2 * KFix)) :=
          add_le_add
            (mul_le_mul_of_nonneg_left hQuad (by norm_num [EnergyBudget.quadWeightQ]))
            (mul_le_mul_of_nonneg_left hsumW (by norm_num [EnergyBudget.intervalWeightQ]))
      _ ≤ δ ^ 2 := hδ
  exact selected_energy_close_of_raw_error (a0Blocks R blk) hraw htable hsmoothing hbudget

namespace Facts

/-- The existing twelve block checks certify the sharper selected-energy error,
with the same Watson and Gauss--Legendre inputs as the production certificate. -/
theorem hclose_of_blockFacts_certified
    (hf : ∀ b, b < 12 → blockFact b epsBlock bndBlock = true)
    (hEven : evenFact = true) (hWatson : WatsonHyp 70) (hQuad : QuadHyp) :
    ∑ p ∈ headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) p - (energyTable p : ℝ)| ≤
      (EnergyBudget.errorQ : ℝ) := by
  have hspec := fun b (hb : b < 12) => (blockFact_spec (hf b hb)).2
  have hpv : profileValid P0 piI profile = true :=
    (blockFact_spec (hf 0 (by norm_num))).1
  let R : ℕ → Raw := fun b => if hb : b < 12 then Classical.choose (hspec b hb) else rawZero
  have hR : ∀ b, (hb : b < 12) →
      accumulateSpecs P0 piI profile (bounds b) (bounds (b + 1)) partitionSpecs rawZero = some (R b) ∧
        energyOKBlock (R b) frozenFx tableFx epsBlock (bounds b) (bounds (b + 1)) = true ∧
        rawDistOKBlock (R b) frozenFx bndBlock (bounds b) (bounds (b + 1)) = true := by
    intro b hb
    simp only [R, hb, ↓reduceDIte]
    exact Classical.choose_spec (hspec b hb)
  have hx : ∀ nd ∈ partitionSpecs, mem (rootOf nd) nd.bracket.toIval :=
    rootOf_mem_of_accepted P0 piI profile (bounds 0) (bounds 1) partitionSpecs (R 0)
      (hR 0 (by norm_num)).1
  have hvalid := accumulateSpecs_valid P0 piI profile (bounds 0) (bounds 1)
    partitionSpecs rawZero (R 0) (hR 0 (by norm_num)).1
  have hJ : ∀ nd ∈ partitionSpecs, ∀ neg aI,
      nodeShift P0 piI profile nd = some (neg, aI) →
        mem (OriginalPositiveMoment.moment 0 (profileShift (specNode nd (rootOf nd)) ^ 2))
          (seedJ0I P0 piI (sqI P0 aI)) := by
    intro nd hnd neg aI hshift
    obtain ⟨neg', aI', hshift', hv⟩ := hvalid nd hnd
    rw [hshift] at hshift'
    simp only [Option.some.injEq, Prod.mk.injEq] at hshift'
    obtain ⟨rfl, rfl⟩ := hshift'
    exact seed_of_shift hWatson hpv nd hshift hv (hx nd hnd)
  apply hclose_of_blocks_quantitative P0 (by decide) mem_piI profile_agrees hpv
    partitionSpecs rootOf hx hJ 12 bounds bounds_mono (by decide) (by decide)
    blk blk_spec R (fun b hb => (hR b hb).1) hQuad
    (fun _ => epsBlock) (fun _ => bndBlock)
    (fun b hb => (hR b hb).2.1) (fun b hb => (hR b hb).2.2) (evenFact_spec hEven)
    (δ := (EnergyBudget.rawQ : ℝ)) (Δ := (EnergyBudget.smoothQ : ℝ))
  · norm_num [EnergyBudget.rawQ]
  · norm_num [rhoQ, bndBlock, KFix, EnergyBudget.quadWeightQ,
      EnergyBudget.intervalWeightQ, EnergyBudget.rawQ]
  · norm_num [EnergyBudget.rawQ, EnergyBudget.smoothQ]
  · norm_num [epsBlock, KFix, EnergyBudget.smoothQ, EnergyBudget.errorQ]

end Facts

end Grothe.UpperQuad
