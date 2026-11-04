import Grothe.UpperQuad.ContractSound
import Grothe.UpperQuad.ProfileSound
import Grothe.UpperQuad.RatioSound
import GrotheQuadKernel.Node

/-!
# Soundness of one node and of the node loop (layer (A) of #303, §11.1)

For a node spec `nd` (panel, rule order, root bracket, cutoff) and a root `x` in the bracket, the
real node is `s = panelNode lo hi x`, the weight `W = panelWeight lo hi (n−1) x`; the kernel's
`nodeS`/`nodeW` enclose them, `nodeShift` returns the sign `profileSign s` and an enclosure of
`profileShift s`, `nodeVals` encloses the signed canonical coefficients
`profileSign s ^ (c+d) · (canonicalCoefficient (profileShift s) (c, d)).re`, and one accumulation
step adds to the entry `[k][j][cIdx]` the exact term `ψ_{k,j}(s) e^{−s} W · (that coefficient)`
when `c + d ≤ cutoff` (`nodeTerm`).  The seed `J₀(A²) ∈ seedJ0I` is the analytic hypothesis S2.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad

open GrotheQuad Grothe.UpperChaos Grothe.UpperChaos.F0ConditionalEvaluator
  Grothe.UpperChaos.ConditionalSeedNormalization Grothe.UpperChaos.Q0LegendreInteger

/-! ### The canonical rank -/

/-- The number of canonical pairs of degree `< M`. -/
def prefixLen (dMax M : ℕ) : ℕ := (List.range M).foldl (fun s m => s + rowCount dMax m) 0

lemma prefixLen_succ (dMax M : ℕ) : prefixLen dMax (M + 1) = prefixLen dMax M + rowCount dMax M := by
  unfold prefixLen
  rw [foldl_range_succ]

lemma prefixLen_mono (dMax : ℕ) {M N : ℕ} (h : M ≤ N) : prefixLen dMax M ≤ prefixLen dMax N := by
  induction N with
  | zero =>
    have : M = 0 := by omega
    subst this
    exact le_refl _
  | succ N ih =>
    rcases Nat.lt_or_ge M (N + 1) with h' | h'
    · rw [prefixLen_succ]
      exact (ih (by omega)).trans (Nat.le_add_right _ _)
    · have : M = N + 1 := by omega
      subst this
      exact le_refl _

lemma levelPairs_length (dMax m : ℕ) : (levelPairs dMax m).length = rowCount dMax m := by
  simp [levelPairs]

lemma flatMap_levels_length (dMax M : ℕ) :
    ((List.range M).flatMap (levelPairs dMax)).length = prefixLen dMax M := by
  induction M with
  | zero => rfl
  | succ M ih =>
    rw [List.range_succ, List.flatMap_append, List.length_append, ih, prefixLen_succ]
    simp [levelPairs_length]

lemma flatMap_levels_getElem? (dMax D M i : ℕ) (hM : M ≤ D) (hi : i < rowCount dMax M) :
    ((List.range (D + 1)).flatMap (levelPairs dMax))[prefixLen dMax M + i]? =
      (levelPairs dMax M)[i]? := by
  induction D with
  | zero =>
    have hM0 : M = 0 := by omega
    subst hM0
    simp [prefixLen]
  | succ D ih =>
    rw [List.range_succ, List.flatMap_append]
    rcases Nat.lt_or_ge M (D + 1) with h | h
    · rw [List.getElem?_append_left]
      · exact ih (by omega)
      · rw [flatMap_levels_length]
        have := prefixLen_mono dMax (show M + 1 ≤ D + 1 by omega)
        rw [prefixLen_succ] at this
        omega
    · have hM' : M = D + 1 := by omega
      subst hM'
      rw [List.getElem?_append_right (by rw [flatMap_levels_length]; omega)]
      rw [flatMap_levels_length]
      simp

lemma levelPairs_getElem? (dMax m i : ℕ) (hi : i < rowCount dMax m) :
    (levelPairs dMax m)[i]? =
      some ((rowRange dMax m).1 + i, m - ((rowRange dMax m).1 + i)) := by
  unfold levelPairs
  rw [List.getElem?_map, List.getElem?_range hi]
  rfl

/-- The canonical rank of a stored pair points to it. -/
lemma canonicalPairs_rank (D dMax c d : ℕ) (hc : c ≤ d + 1) (hd : d ≤ dMax) (hD : c + d ≤ D) :
    (canonicalPairs D dMax)[canonicalRank dMax c d]? = some (c, d) := by
  unfold canonicalPairs canonicalRank
  rw [List.getElem?_toArray]
  have hlo : (rowRange dMax (c + d)).1 = c + d - dMax := rfl
  have hi : c - (rowRange dMax (c + d)).1 < rowCount dMax (c + d) := by
    unfold rowCount rowRange
    simp only
    omega
  rw [show (List.range (c + d)).foldl (fun s m => s + rowCount dMax m) 0 = prefixLen dMax (c + d)
    from rfl]
  rw [flatMap_levels_getElem? dMax D (c + d) _ hD hi, levelPairs_getElem? dMax (c + d) _ hi]
  congr 1
  rw [hlo]
  ext <;> simp only <;> omega

lemma canonicalRank_lt (D dMax c d : ℕ) (hc : c ≤ d + 1) (hd : d ≤ dMax) (hD : c + d ≤ D) :
    canonicalRank dMax c d < (canonicalPairs D dMax).size := by
  have h := canonicalPairs_rank D dMax c d hc hd hD
  obtain ⟨hlt, -⟩ := Array.getElem?_eq_some_iff.mp h
  exact hlt

lemma canonicalPairs_getD_rank (D dMax c d : ℕ) (hc : c ≤ d + 1) (hd : d ≤ dMax) (hD : c + d ≤ D) :
    (canonicalPairs D dMax).getD (canonicalRank dMax c d) (0, 0) = (c, d) := by
  rw [Array.getD_eq_getD_getElem?, canonicalPairs_rank D dMax c d hc hd hD, Option.getD_some]

/-! ### The block layout -/

lemma pairOf_bounds (k cIdx : ℕ) (hk : k < numCharges) (hc : cIdx < blockSide k) :
    (pairOf k cIdx).1 ≤ (pairOf k cIdx).2 + 1 ∧ (pairOf k cIdx).2 ≤ 265 := by
  unfold pairOf blockSide numCharges at *
  split_ifs at hc ⊢ with h <;> simp only [beq_iff_eq] at h <;> omega

lemma selectedRanks_getD (k cIdx : ℕ) (hk : k < numCharges) (hc : cIdx < blockSide k) :
    (selectedRanks.getD k #[]).getD cIdx (0, 0) =
      ((pairOf k cIdx).1 + (pairOf k cIdx).2,
        canonicalRank 265 (pairOf k cIdx).1 (pairOf k cIdx).2) := by
  unfold selectedRanks
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, hk, hc, ↓reduceDIte, Option.getD_some]

lemma rawGet_accumulateNode (D : ℕ) (valsFx : Array Fx) (factors : Array (Array Fx)) (acc : Raw)
    (k j cIdx : ℕ) (hk : k < numCharges) (hj : j < blockSide k) (hc : cIdx < blockSide k) :
    rawGet (accumulateNode D valsFx factors acc) k j cIdx =
      addPair (rawGet acc k j cIdx) (contributionAt D valsFx factors k j cIdx) := by
  unfold accumulateNode accumulateRow contributionAt
  simp only [rawGet, Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, hk, hj, hc, ↓reduceDIte,
    Option.getD_some]
  split_ifs <;> simp [addPair]

lemma rawGet_rawZero (k j cIdx : ℕ) (hk : k < numCharges) (hj : j < blockSide k)
    (hc : cIdx < blockSide k) : rawGet rawZero k j cIdx = (0, 0) := by
  unfold rawZero rawGet
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, hk, hj, hc, ↓reduceDIte,
    Option.getD_some]

/-! ### The signed coefficients -/

/-- The sign `σ = ±1` as a real number. -/
def signOf (neg : Bool) : ℝ := if neg then -1 else 1

lemma mem_signedCoefficient (P : ℕ) {S u : ℝ} {scalar uI : Ival} (hS : mem S scalar) (hu : mem u uI)
    (neg : Bool) (c d : ℕ) :
    mem (signOf neg ^ (c + d) * (S * u)) (signedCoefficient P scalar neg c d uI) := by
  have h := mem_mulI P hS hu
  unfold signedCoefficient
  cases neg with
  | false =>
    simp only [signOf, Bool.false_eq_true, ↓reduceIte, one_pow, one_mul, Bool.false_and]
    exact h
  | true =>
    simp only [signOf, ↓reduceIte, Bool.true_and]
    rcases Nat.mod_two_eq_zero_or_one (c + d) with he | ho
    · have hpow : ((-1 : ℝ) ^ (c + d)) = 1 := by
        rw [← Nat.div_add_mod (c + d) 2, he, add_zero, pow_mul]; simp
      have hb : ((c + d) % 2 == 1) = false := by simp [he]
      rw [hpow, one_mul, hb]
      show mem (S * u) (mulI P scalar uI)
      exact h
    · have hpow : ((-1 : ℝ) ^ (c + d)) = -1 := by
        rw [← Nat.div_add_mod (c + d) 2, ho, pow_add, pow_mul]; simp
      have hb : ((c + d) % 2 == 1) = true := by simp [ho]
      rw [hpow, hb]
      show mem (-1 * (S * u)) (negI (mulI P scalar uI))
      have := mem_negI h
      convert this using 1
      ring

/-- Every entry of the canonical array encloses the signed coefficient
`σ^{c+d} · (canonicalCoefficient A (c, d)).re` (no transport widening). -/
lemma mem_canonicalTriangleI (P : ℕ) {A : ℝ} {aI scalar : Ival} (hA : mem A aI) (hA0 : 0 < A)
    (hS : mem (seedScalar A) scalar) (ratios : Array Ival)
    (hr : ∀ d, mem (OriginalPositiveMoment.ratio d (A ^ 2)) (ratios.getD d ⟨0, 1, 0⟩))
    (D : ℕ) (hsq : ∀ n, 1 ≤ n → n ≤ D → 0 < (sqrtNatI P n).lo)
    (hden : ∀ c, c < (D + 1) / 2 → 0 < (mulI P aI (sqrtNatI P (c + 1))).lo) (dMax i : ℕ)
    (hi : i < (canonicalPairs D dMax).size) (neg : Bool) :
    mem (signOf neg ^ (((canonicalPairs D dMax).getD i (0, 0)).1 + ((canonicalPairs D dMax).getD i (0, 0)).2) *
        (canonicalCoefficient A ((canonicalPairs D dMax).getD i (0, 0))).re)
      ((canonicalTriangleI P scalar neg zeroI aI ratios D dMax).getD i zeroI) := by
  unfold canonicalTriangleI canonicalFrom
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, hi, ↓reduceDIte, Option.getD_some]
  rw [← Array.getD_eq_getD_getElem?, ← Array.getD_eq_getD_getElem?]
  have hz : isZero zeroI = true := rfl
  simp only [actualCoefficient, hz, ↓reduceIte]
  have hu := mem_normalizedTriangleI P hA hA0 ratios hr D hsq hden dMax i hi
  have hre : (canonicalCoefficient A ((canonicalPairs D dMax).getD i (0, 0))).re =
      seedScalar A * uRe A ((canonicalPairs D dMax).getD i (0, 0)).1
        ((canonicalPairs D dMax).getD i (0, 0)).2 := by
    unfold uRe
    rw [canonicalCoefficient_eq_seed_mul hA0, Complex.re_ofReal_mul]
  rw [hre]
  exact mem_signedCoefficient P hS hu neg _ _

/-! ### The seed scalar -/

lemma mem_seedScalarI (P : ℕ) (hP : 1 ≤ P) {piI aI : Ival} (hpi : mem Real.pi piI) {A : ℝ}
    (hA : mem A aI)
    (hJ : mem (OriginalPositiveMoment.moment 0 (A ^ 2)) (seedJ0I P piI (sqI P aI))) :
    mem (seedScalar A) (seedScalarI P piI aI) := by
  unfold seedScalar seedScalarI
  exact mem_mulI P (mem_mulI P (mem_divN P hP (by norm_num) (mem_sqrtI P Real.pi_pos.le hpi)) hA) hJ

/-! ### One node -/

/-- The real node of a spec at the root `x`. -/
noncomputable def specNode (nd : NodeSpec) (x : ℝ) : ℝ :=
  panelNode ((nd.loN : ℝ) / nd.loD) ((nd.hiN : ℝ) / nd.hiD) x

/-- The real weight of a spec at the root `x`. -/
noncomputable def specWeight (nd : NodeSpec) (x : ℝ) : ℝ :=
  panelWeight ((nd.loN : ℝ) / nd.loD) ((nd.hiN : ℝ) / nd.hiD) (nd.order - 1) x

/-- The signed canonical coefficient of a node. -/
noncomputable def nodeCoef (s : ℝ) (p : ℕ × ℕ) : ℝ :=
  profileSign s ^ (p.1 + p.2) * (canonicalCoefficient (profileShift s) p).re

/-- The flags of `nodeValid`, unpacked. -/
lemma nodeValid_unpack (P : ℕ) (nd : NodeSpec) (aI : Ival) (h : nodeValid P nd aI = true) :
    bracketOK P nd.order nd.bracket = true ∧ 0 < nd.loD ∧ 0 < nd.hiD ∧ 1 ≤ nd.order ∧
      weightValid P nd = true ∧ isPos (nodeS P nd) = true ∧
      nodeFactorsValid P (nodeS P nd) = true ∧ isPos aI = true ∧
      ratiosValid P (sqI P aI) (ratioDepth nd.cutoff) = true ∧
      (∀ n, n < nd.cutoff + 1 → isPos (sqrtNatI P (n + 1)) = true) ∧
      (∀ c, c < (nd.cutoff + 1) / 2 + 1 → isPos (mulI P aI (sqrtNatI P (c + 1))) = true) := by
  unfold nodeValid at h
  simp only [Bool.and_eq_true, decide_eq_true_eq, List.all_eq_true, List.mem_range] at h
  obtain ⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, h5⟩, h6⟩, h7⟩, h8⟩, h9⟩, h10⟩, h11⟩ := h
  exact ⟨h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11⟩

lemma mem_nodeS (P : ℕ) (hP : 1 ≤ P) (nd : NodeSpec) {x : ℝ} (hx : mem x nd.bracket.toIval)
    (hlo : 0 < nd.loD) (hhi : 0 < nd.hiD) : mem (specNode nd x) (nodeS P nd) :=
  mem_panelNode P hP hx nd.loN nd.hiN nd.loD nd.hiD hlo hhi

lemma mem_nodeW (P : ℕ) (hP : 1 ≤ P) (nd : NodeSpec) {x : ℝ} (hx : mem x nd.bracket.toIval)
    (hlo : 0 < nd.loD) (hhi : 0 < nd.hiD) (hn : 1 ≤ nd.order) (hw : weightValid P nd = true) :
    mem (specWeight nd x) (nodeW P nd) := by
  unfold specWeight panelWeight nodeW panelHalfI panelLoI
  exact mem_mulI P (mem_divN P hP (by norm_num) (mem_subI P (mem_ratI P hP _ hhi) (mem_ratI P hP _ hlo)))
    (mem_weightI P hP hx nd.order hn (lo_pos_of_isPos hw))

/-- The ratios of a node, with the unit default beyond the computed depth. -/
lemma mem_nodeRatios (P : ℕ) (hP : 1 ≤ P) (nd : NodeSpec) {A : ℝ} {aI : Ival} (hA : mem A aI)
    (hv : ratiosValid P (sqI P aI) (ratioDepth nd.cutoff) = true) (d : ℕ) :
    mem (OriginalPositiveMoment.ratio d (A ^ 2)) ((nodeRatios P nd aI).getD d ⟨0, 1, 0⟩) := by
  unfold nodeRatios
  have hx2 : mem (A ^ 2) (sqI P aI) := by rw [sq]; exact mem_sqI P hA
  by_cases hd : d < (ratiosI P (sqI P aI) (ratioDepth nd.cutoff)).size
  · have h := mem_ratiosI P hP (sq_nonneg A) hx2 (ratioDepth nd.cutoff) hv d hd
    rw [Array.getD_eq_getD_getElem?, Array.getElem?_eq_getElem hd, Option.getD_some] at h ⊢
    exact h
  · rw [Array.getD_eq_getD_getElem?, Array.getElem?_eq_none (by omega), Option.getD_none]
    obtain ⟨h0, h1⟩ := OriginalPositiveMoment.ratio_mem_unit d (A ^ 2)
    constructor
    · simp; exact h0.le
    · simpa using h1

/-- One node is sound: the node, weight, sign, shift and every coefficient of the prefix. -/
theorem node_sound (P : ℕ) (hP : 1 ≤ P) {piI : Ival} (hpi : mem Real.pi piI) {pd : ProfileData}
    (hpd : profileAgrees pd) (hpv : profileValid P piI pd = true) (nd : NodeSpec) {x : ℝ}
    (hx : mem x nd.bracket.toIval) {neg : Bool} {aI : Ival}
    (hshift : nodeShift P piI pd nd = some (neg, aI)) (hvalid : nodeValid P nd aI = true)
    (hJ : mem (OriginalPositiveMoment.moment 0 (profileShift (specNode nd x) ^ 2))
      (seedJ0I P piI (sqI P aI))) :
    0 < specNode nd x ∧ mem (specNode nd x) (nodeS P nd) ∧ mem (specWeight nd x) (nodeW P nd) ∧
      vprof (specNode nd x) ≠ 0 ∧ profileSign (specNode nd x) = signOf neg ∧
      mem (profileShift (specNode nd x)) aI ∧ 0 < profileShift (specNode nd x) ∧
      ∀ i, i < (canonicalPairs nd.cutoff 265).size →
        mem (nodeCoef (specNode nd x) ((canonicalPairs nd.cutoff 265).getD i (0, 0)))
          ((nodeVals P piI nd neg aI).getD i zeroI) := by
  obtain ⟨hbr, hlo, hhi, hord, hw, hspos, hfv, hapos, hrv, hsq, hden⟩ := nodeValid_unpack P nd aI hvalid
  have hn : ∀ j, j < pd.coeffs.size → 0 < (nrmHalfI P (sqrtI P piI) j).lo := by
    intro j hj
    unfold profileValid at hpv
    simp only [List.all_eq_true, List.mem_range] at hpv
    exact lo_pos_of_isPos (hpv j hj)
  have hs := mem_nodeS P hP nd hx hlo hhi
  have hs0 : 0 < specNode nd x := pos_of_isPos hspos hs
  have hW := mem_nodeW P hP nd hx hlo hhi hord hw
  -- the shift
  unfold nodeShift at hshift
  split at hshift
  · exact absurd hshift (by simp)
  · rename_i v neg' aI' hps
    simp only [Option.some.injEq, Prod.mk.injEq] at hshift
    obtain ⟨rfl, rfl⟩ := hshift
    obtain ⟨hv0, hsign, hA⟩ := profileShiftI_sound P hP hpi hpd hs0.le hs hn hps
    have hA0 : 0 < profileShift (specNode nd x) := pos_of_isPos hapos hA
    refine ⟨hs0, hs, hW, hv0, hsign, hA, hA0, ?_⟩
    intro i hi
    unfold nodeVals nodeCoef
    rw [hsign]
    exact mem_canonicalTriangleI P hA hA0 (mem_seedScalarI P hP hpi hA hJ) (nodeRatios P nd _)
      (mem_nodeRatios P hP nd hA hrv) nd.cutoff
      (fun n hn1 hnD => lo_pos_of_isPos (by
        have := hsq (n - 1) (by omega)
        rwa [Nat.sub_add_cancel hn1] at this))
      (fun c hc => lo_pos_of_isPos (hden c (by omega))) 265 i hi _

/-! ### The accumulation -/

/-- The exact contribution of the node `s` (weight `W`, cutoff `D`) to the entry `(k, j, cIdx)`:
zero outside the degree-501 triangle (`activeCols`) and for the omitted pairs of the cutoff. -/
noncomputable def nodeTerm (s W : ℝ) (D k j cIdx : ℕ) : ℝ :=
  if cIdx < activeCols k j ∧ (pairOf k cIdx).1 + (pairOf k cIdx).2 ≤ D then
    RadialLaguerre.radialFactor k j s * (Real.exp (-s) * W) * nodeCoef s (pairOf k cIdx)
  else 0

lemma memFx2_contributionAt {s W : ℝ} (D : ℕ) {valsFx : Array Fx} {factors : Array (Array Fx)}
    (k j cIdx : ℕ) (hk : k < numCharges) (_hj : j < blockSide k) (hc : cIdx < blockSide k)
    (hF : memFx (RadialLaguerre.radialFactor k j s * (Real.exp (-s) * W))
      ((factors.getD k #[]).getD j default))
    (hvals : ∀ i, i < (canonicalPairs D 265).size →
      memFx (nodeCoef s ((canonicalPairs D 265).getD i (0, 0))) (valsFx.getD i default)) :
    memFx2 (nodeTerm s W D k j cIdx) (contributionAt D valsFx factors k j cIdx) := by
  unfold contributionAt contributionOf nodeTerm
  rw [selectedRanks_getD k cIdx hk hc]
  obtain ⟨hcd, hd⟩ := pairOf_bounds k cIdx hk hc
  simp only
  by_cases hact : cIdx < activeCols k j
  · by_cases hdeg : (pairOf k cIdx).1 + (pairOf k cIdx).2 ≤ D
    · simp only [hact, hdeg, and_self, ↓reduceIte]
      have hlt := canonicalRank_lt D 265 _ _ hcd hd hdeg
      have hv := hvals _ hlt
      rw [canonicalPairs_getD_rank D 265 _ _ hcd hd hdeg] at hv
      exact memFx2_mulFx hF hv
    · simp only [hact, hdeg, and_false, ↓reduceIte]
      exact memFx2_zero
  · simp only [hact, false_and, ↓reduceIte]
    exact memFx2_zero

/-- One accumulation step adds the node's exact terms to every entry. -/
lemma accumulateNode_sound {s W : ℝ} (D : ℕ) {valsFx : Array Fx} {factors : Array (Array Fx)}
    (acc : Raw) (V : ℕ → ℕ → ℕ → ℝ)
    (hacc : ∀ k j cIdx, k < numCharges → j < blockSide k → cIdx < blockSide k →
      memFx2 (V k j cIdx) (rawGet acc k j cIdx))
    (hF : ∀ k j, k < numCharges → j < blockSide k →
      memFx (RadialLaguerre.radialFactor k j s * (Real.exp (-s) * W))
        ((factors.getD k #[]).getD j default))
    (hvals : ∀ i, i < (canonicalPairs D 265).size →
      memFx (nodeCoef s ((canonicalPairs D 265).getD i (0, 0))) (valsFx.getD i default)) :
    ∀ k j cIdx, k < numCharges → j < blockSide k → cIdx < blockSide k →
      memFx2 (V k j cIdx + nodeTerm s W D k j cIdx)
        (rawGet (accumulateNode D valsFx factors acc) k j cIdx) := by
  intro k j cIdx hk hj hc
  rw [rawGet_accumulateNode D valsFx factors acc k j cIdx hk hj hc]
  exact memFx2_addPair (hacc k j cIdx hk hj hc)
    (memFx2_contributionAt D k j cIdx hk hj hc (hF k j hk hj) hvals)

lemma memFx_map_toFx {x : ℝ} (vals : Array Ival) (i : ℕ) (hi : i < vals.size)
    (h : mem x (vals.getD i zeroI)) : memFx x ((vals.map toFx).getD i default) := by
  rw [Array.getD_eq_getD_getElem?, Array.getElem?_map, Array.getElem?_eq_getElem hi,
    Option.map_some, Option.getD_some]
  rw [Array.getD_eq_getD_getElem?, Array.getElem?_eq_getElem hi, Option.getD_some] at h
  exact memFx_toFx h

lemma nodeVals_size (P : ℕ) (piI : Ival) (nd : NodeSpec) (neg : Bool) (aI : Ival) :
    (nodeVals P piI nd neg aI).size = (canonicalPairs nd.cutoff 265).size := by
  simp [nodeVals, canonicalTriangleI, canonicalFrom]

/-- The exact term of a node spec at the root `x`. -/
noncomputable def specTerm (nd : NodeSpec) (x : ℝ) (k j cIdx : ℕ) : ℝ :=
  nodeTerm (specNode nd x) (specWeight nd x) nd.cutoff k j cIdx

/-- `accumulateSpec` adds the exact node terms (given the seed enclosure of the node). -/
theorem accumulateSpec_sound (P : ℕ) (hP : 1 ≤ P) {piI : Ival} (hpi : mem Real.pi piI)
    {pd : ProfileData} (hpd : profileAgrees pd) (hpv : profileValid P piI pd = true)
    (nd : NodeSpec) {x : ℝ} (hx : mem x nd.bracket.toIval)
    (hJ : ∀ neg aI, nodeShift P piI pd nd = some (neg, aI) →
      mem (OriginalPositiveMoment.moment 0 (profileShift (specNode nd x) ^ 2))
        (seedJ0I P piI (sqI P aI)))
    (acc acc' : Raw) (V : ℕ → ℕ → ℕ → ℝ)
    (hacc : ∀ k j cIdx, k < numCharges → j < blockSide k → cIdx < blockSide k →
      memFx2 (V k j cIdx) (rawGet acc k j cIdx))
    (h : accumulateSpec P piI pd nd acc = some acc') :
    ∀ k j cIdx, k < numCharges → j < blockSide k → cIdx < blockSide k →
      memFx2 (V k j cIdx + specTerm nd x k j cIdx) (rawGet acc' k j cIdx) := by
  unfold accumulateSpec at h
  split at h
  · exact absurd h (by simp)
  · rename_i neg aI hshift
    split_ifs at h with hvalid
    · simp only [Option.some.injEq] at h
      subst h
      obtain ⟨hs0, hs, hW, -, -, -, -, hvals⟩ :=
        node_sound P hP hpi hpd hpv nd hx hshift hvalid (hJ neg aI hshift)
      obtain ⟨-, -, -, -, -, -, hfv, -⟩ := nodeValid_unpack P nd aI hvalid
      apply accumulateNode_sound nd.cutoff acc V hacc
      · intro k j hk hj
        exact memFx_nodeFactors P hP hs0.le hs hW hfv k j hk hj
      · intro i hi
        exact memFx_map_toFx _ i (by rw [nodeVals_size]; exact hi) (hvals i hi)

lemma accumulateSpecs_nil (P : ℕ) (piI : Ival) (pd : ProfileData) (acc : Raw) :
    accumulateSpecs P piI pd [] acc = some acc := rfl

lemma accumulateSpecs_cons (P : ℕ) (piI : Ival) (pd : ProfileData) (nd : NodeSpec)
    (rest : List NodeSpec) (acc : Raw) :
    accumulateSpecs P piI pd (nd :: rest) acc =
      (accumulateSpec P piI pd nd acc).bind (accumulateSpecs P piI pd rest) := rfl

/-- The node loop adds the exact terms of every node (`x` gives the root of each spec). -/
theorem accumulateSpecs_sound (P : ℕ) (hP : 1 ≤ P) {piI : Ival} (hpi : mem Real.pi piI)
    {pd : ProfileData} (hpd : profileAgrees pd) (hpv : profileValid P piI pd = true)
    (specs : List NodeSpec) (x : NodeSpec → ℝ)
    (hx : ∀ nd ∈ specs, mem (x nd) nd.bracket.toIval)
    (hJ : ∀ nd ∈ specs, ∀ neg aI, nodeShift P piI pd nd = some (neg, aI) →
      mem (OriginalPositiveMoment.moment 0 (profileShift (specNode nd (x nd)) ^ 2))
        (seedJ0I P piI (sqI P aI))) :
    ∀ (acc acc' : Raw) (V : ℕ → ℕ → ℕ → ℝ),
      (∀ k j cIdx, k < numCharges → j < blockSide k → cIdx < blockSide k →
        memFx2 (V k j cIdx) (rawGet acc k j cIdx)) →
      accumulateSpecs P piI pd specs acc = some acc' →
      ∀ k j cIdx, k < numCharges → j < blockSide k → cIdx < blockSide k →
        memFx2 (V k j cIdx + (specs.map fun nd => specTerm nd (x nd) k j cIdx).sum)
          (rawGet acc' k j cIdx) := by
  induction specs with
  | nil =>
    intro acc acc' V hacc h k j cIdx hk hj hc
    rw [accumulateSpecs_nil, Option.some.injEq] at h
    subst h
    simpa using hacc k j cIdx hk hj hc
  | cons nd rest ih =>
    intro acc acc' V hacc h k j cIdx hk hj hc
    rw [accumulateSpecs_cons, Option.bind_eq_some_iff] at h
    obtain ⟨acc₁, hcase, h⟩ := h
    · have hstep := accumulateSpec_sound P hP hpi hpd hpv nd (hx nd (by simp))
        (hJ nd (by simp)) acc acc₁ V hacc hcase
      have := ih (fun nd' hnd' => hx nd' (by simp [hnd'])) (fun nd' hnd' => hJ nd' (by simp [hnd']))
        acc₁ acc' (fun k j cIdx => V k j cIdx + specTerm nd (x nd) k j cIdx) hstep h k j cIdx hk hj hc
      simpa [add_assoc] using this

/-- The whole partition from the zero accumulator. -/
theorem accumulateSpecs_zero_sound (P : ℕ) (hP : 1 ≤ P) {piI : Ival} (hpi : mem Real.pi piI)
    {pd : ProfileData} (hpd : profileAgrees pd) (hpv : profileValid P piI pd = true)
    (specs : List NodeSpec) (x : NodeSpec → ℝ)
    (hx : ∀ nd ∈ specs, mem (x nd) nd.bracket.toIval)
    (hJ : ∀ nd ∈ specs, ∀ neg aI, nodeShift P piI pd nd = some (neg, aI) →
      mem (OriginalPositiveMoment.moment 0 (profileShift (specNode nd (x nd)) ^ 2))
        (seedJ0I P piI (sqI P aI)))
    (acc' : Raw) (h : accumulateSpecs P piI pd specs rawZero = some acc') :
    ∀ k j cIdx, k < numCharges → j < blockSide k → cIdx < blockSide k →
      memFx2 ((specs.map fun nd => specTerm nd (x nd) k j cIdx).sum) (rawGet acc' k j cIdx) := by
  intro k j cIdx hk hj hc
  have := accumulateSpecs_sound P hP hpi hpd hpv specs x hx hJ rawZero acc' (fun _ _ _ => 0)
    (fun k j cIdx hk hj hc => by rw [rawGet_rawZero k j cIdx hk hj hc]; exact memFx2_zero) h
    k j cIdx hk hj hc
  rwa [zero_add] at this

end Grothe.UpperQuad
