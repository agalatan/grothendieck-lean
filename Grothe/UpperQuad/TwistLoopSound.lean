import Grothe.UpperQuad.TwistNodeSound
import Grothe.UpperQuad.Partition
import GrotheQuadExtKernel.TwistLoop

/-!
# Soundness of the twisted node outputs, of the node loop and of its two checks

* `twistNode_sound`: the node's `I`-contribution encloses `e^{−s} W Σ_{c+d ≤ D_out} V_{c,d}(s)
  J_{c,d}(s)` (`nodeITerm`) and its low-band entries enclose `e^{−s} W ψ_i(s) J_{c,d}(s)`
  (`nodeLowTerm`), at the scale `2^{2 KOut}`; `V_{c,d}(s) = Σ_q c(q,c,d) ψ_{(q,c,d)}(s)` with the
  exact dyadic center `c(q,c,d) = center[gradedFlat q c d] / 2^E` (`centerR`).
* `twistSpecs_sound`: an accepted node list (`twistSpecs … = some acc`) adds the exact terms of
  every node at the root of its bracket (`rootOf`) to the accumulator.
* `iPartialOK_sound`, `lowBandOK_sound`: the two checks bound the exact Gauss sums.

Agent-ID: claude-b9ee. Refs #41, #313.
-/

namespace Grothe.UpperQuad

open GrotheQuad Grothe.UpperChaos Grothe.UpperChaos.F0ConditionalEvaluator

noncomputable section

/-! ### Fixed point at the output scale -/

/-- `x ∈ a / 2^KOut`. -/
def memOut (x : ℝ) (a : Fx) : Prop := memSc KOut x (a.lo, a.hi)

lemma memOut_toOut {x : ℝ} {a : Ival} (hx : mem x a) : memOut x (toOut a) :=
  memSc_toFixed KOut hx

lemma memSc_mulFx {x y : ℝ} {a b : Fx} (hx : memOut x a) (hy : memOut y b) :
    memSc (2 * KOut) (x * y) (mulFx a b) :=
  memSc_mulPair (p := (a.lo, a.hi)) (q := (b.lo, b.hi)) hx hy

lemma memOut_roundOut {x : ℝ} {p : ℤ × ℤ} (hx : memSc (2 * KOut) x p) : memOut x (roundOut p) := by
  have := memSc_shift (K := KOut) (s := KOut)
    (by rw [show KOut + KOut = 2 * KOut by ring]; exact hx)
  exact this

lemma memSc_foldl_add {K : ℕ} {f : ℕ → ℝ} {g : ℕ → ℤ × ℤ} (n : ℕ)
    (h : ∀ k, k < n → memSc K (f k) (g k)) {x : ℝ} {acc : ℤ × ℤ} (hacc : memSc K x acc) :
    memSc K (x + ∑ k ∈ Finset.range n, f k)
      ((List.range n).foldl (fun acc k => addPair acc (g k)) acc) := by
  induction n with
  | zero => simpa using hacc
  | succ n ih =>
    rw [List.range_succ, List.foldl_append, List.foldl_cons, List.foldl_nil, Finset.sum_range_succ,
      ← add_assoc]
    exact memSc_addPair (ih fun k hk => h k (by omega)) (h n (by omega))

lemma memSc_foldl_add2 {K : ℕ} {f : ℕ → ℕ → ℝ} {g : ℕ → ℕ → ℤ × ℤ} (m : ℕ → ℕ) (n : ℕ)
    (h : ∀ c d, c < n → d < m c → memSc K (f c d) (g c d)) {x : ℝ} {acc : ℤ × ℤ}
    (hacc : memSc K x acc) :
    memSc K (x + ∑ c ∈ Finset.range n, ∑ d ∈ Finset.range (m c), f c d)
      ((List.range n).foldl (fun acc c =>
        (List.range (m c)).foldl (fun acc d => addPair acc (g c d)) acc) acc) := by
  induction n with
  | zero => simpa using hacc
  | succ n ih =>
    rw [List.range_succ, List.foldl_append, List.foldl_cons, List.foldl_nil, Finset.sum_range_succ,
      ← add_assoc]
    exact memSc_foldl_add (m n) (fun d hd => h n d (by omega) hd)
      (ih fun c d hc hd => h c d (by omega) hd)

/-! ### The real node terms -/

/-- The exact dyadic center coefficient `c(q, c, d) = center[gradedFlat q c d] / 2^E`. -/
def centerR (center : Array Int) (E q c d : ℕ) : ℝ :=
  (center.getD (gradedFlat q c d) 0 : ℝ) / 2 ^ E

/-- The primary radial factor of the mode `(q, c, d)`: `ψ = radialFactor (radialKM q c d) s`. -/
def psiR (q c d : ℕ) (s : ℝ) : ℝ :=
  RadialLaguerre.radialFactor (radialKM q c d).1 (radialKM q c d).2 s

/-- The center's conditional vector
`V_{c,d}(s) = Σ_{q ≥ max(c−1, d), q < Q} c(q,c,d) ψ_{(q,c,d)}(s)`. -/
def centerVR (prm : TwistParams) (center : Array Int) (s : ℝ) (c d : ℕ) : ℝ :=
  ∑ i ∈ Finset.range (prm.Q - max (c - 1) d),
    centerR center prm.E (max (c - 1) d + i) c d * psiR (max (c - 1) d + i) c d s

/-- The node's exact `I`-term `e^{−s} W Σ_{c+d ≤ D_out} V_{c,d}(s) J_{c,d}(s)`. -/
def nodeITerm (prm : TwistParams) (center : Array Int) (s W : ℝ) : ℝ :=
  Real.exp (-s) * W * ∑ c ∈ Finset.range (prm.Dout + 1), ∑ d ∈ Finset.range (prm.Dout + 1 - c),
    centerVR prm center s c d * (twistCoef prm.j s (c, d)).re

/-- The node's exact low-band term `e^{−s} W ψ_{(q,c,d)}(s) J_{c,d}(s)`. -/
def nodeLowTerm (prm : TwistParams) (s W : ℝ) (q c d : ℕ) : ℝ :=
  Real.exp (-s) * W * (psiR q c d s * (twistCoef prm.j s (c, d)).re)

lemma radialKM_sum (q c d : ℕ) (hc : c ≤ q + 1) (hd : d ≤ q) :
    (radialKM q c d).1 + (radialKM q c d).2 ≤ q + 1 := by
  unfold radialKM; split_ifs <;> simp <;> omega

lemma mem_psiTable (P : ℕ) (hP : 1 ≤ P) (Q : ℕ) (hQ : Q ≤ 502) {s : ℝ} {sI : Ival} (hs0 : 0 ≤ s)
    (hs : mem s sI) (k m : ℕ) (hkm : k + m ≤ Q) :
    memOut (RadialLaguerre.radialFactor k m s) (psiGet (psiTable P Q sI) k m) := by
  unfold psiGet psiTable
  dsimp only
  have hk : k < Q + 1 := by omega
  have hm : m < Q + 1 - k := by omega
  rw [getD_ofFn _ hk, getD_ofFn _ hm]
  apply memOut_toOut
  exact mem_radialFactorI P hP k m (by omega)
    (mem_lagTable P Q hQ (fun j hj => mem_negExpTerms P hP hs Q j hj) k m (by omega) (by omega))
    (mem_powTable P (mem_sqrtI P hs0 hs) Q k (by omega))

lemma memOut_centerOut (center : Array Int) (E q c d : ℕ) (hE : E ≤ KOut) :
    memOut (centerR center E q c d) (centerOut center E q c d) := by
  unfold memOut memSc centerOut centerR
  have h : ((center.getD (gradedFlat q c d) 0 : ℤ) : ℝ) / 2 ^ E * (2 : ℝ) ^ KOut =
      ((center.getD (gradedFlat q c d) 0 * pow2 (KOut - E) : ℤ) : ℝ) := by
    have h2 : (2 : ℝ) ^ KOut = 2 ^ (KOut - E) * 2 ^ E := by rw [← pow_add, Nat.sub_add_cancel hE]
    rw [Int.cast_mul, pow2_cast, h2]
    field_simp
  simp only
  rw [h]
  exact ⟨le_rfl, le_rfl⟩

lemma memOut_centerV (P : ℕ) (hP : 1 ≤ P) (prm : TwistParams) (hQ : prm.Q ≤ 502)
    (hE : prm.E ≤ KOut) (hDQ : prm.Dout + 1 = 2 * prm.Q) (center : Array Int) {s : ℝ} {sI : Ival}
    (hs0 : 0 ≤ s) (hs : mem s sI) (c d : ℕ) (hcd : c + d ≤ prm.Dout) :
    memOut (centerVR prm center s c d)
      (((centerV prm center (psiTable P prm.Q sI)).getD c #[]).getD d ⟨0, 0⟩) := by
  unfold centerV
  have hc : c < prm.Dout + 1 := by omega
  have hd : d < prm.Dout + 1 - c := by omega
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, hc, hd, ↓reduceDIte,
    Option.getD_some]
  apply memOut_roundOut
  apply memSc_sumPairs
  intro i hi
  apply memSc_mulFx (memOut_centerOut center prm.E _ c d hE)
  apply mem_psiTable P hP prm.Q hQ hs0 hs
  have := radialKM_sum (max (c - 1) d + i) c d (by omega) (by omega)
  omega

/-! ### One node -/

/-- The shape of the three powers' parameters used by the node outputs. -/
structure ParamsOK (prm : TwistParams) : Prop where
  hj : 1 ≤ prm.j
  hDin : twistDin prm ≤ 502
  hQ : prm.Q ≤ 502
  hE : prm.E ≤ KOut
  hDQ : prm.Dout + 1 = 2 * prm.Q
  hlow : twistQlow prm ≤ prm.Q

lemma paramsOK_twistParams (j : ℕ) (hj : j = 1 ∨ j = 2 ∨ j = 3) : ParamsOK (twistParams j) := by
  rcases hj with rfl | rfl | rfl <;>
    exact ⟨by decide, by decide, by decide, by decide, by decide, by decide⟩

lemma getJ_eq (P : ℕ) (prm : TwistParams) (tabs : TwistTables) (piI sI : Ival) (neg : Bool)
    (aI : Ival) (c d : ℕ) (hcd : c + d ≤ prm.Dout) :
    (((twistJ P prm tabs piI sI neg aI).map fun row => row.map toOut).getD c #[]).getD d ⟨0, 0⟩ =
      toOut (ivGet (twistJ P prm tabs piI sI neg aI) c d) := by
  have hJ : ∀ (f : ℕ → ℕ → Ival), (((ivOfFn prm.Dout f).map fun row => row.map toOut).getD c
      #[]).getD d ⟨0, 0⟩ = toOut (ivGet (ivOfFn prm.Dout f) c d) := by
    intro f
    unfold ivOfFn ivGet
    have hc : c < prm.Dout + 1 := by omega
    have hd : d < prm.Dout + 1 - c := by omega
    simp [Array.getD_eq_getD_getElem?, hc, hd]
  unfold twistJ
  exact hJ _

/-- **The node outputs**: the `I`-term and the low-band terms are enclosed. -/
theorem twistNode_sound (P : ℕ) (hP : 1 ≤ P) {piI : Ival} (hpi : mem Real.pi piI)
    (hW : WatsonHyp 70) {prm : TwistParams} (hprm : ParamsOK prm) {tabs : TwistTables}
    (htab : TwistTablesOK P prm tabs) {s W : ℝ} {sI wI : Ival} {neg : Bool} {aI : Ival}
    (hnd : NodeData P piI s sI neg aI) (_hw : mem W wI)
    (hfac : mem (Real.exp (-s) * W) (mulI P (expNegI P 400 sI) wI))
    (hexp : expAlphaValid P prm.j sI = true)
    (hA'pos : isPos (mulI P (sqrtI P (lamI P prm.j)) aI) = true)
    (hrv : ratiosValid P (sqI P (mulI P (sqrtI P (lamI P prm.j)) aI))
      (ratioDepth (twistDin prm)) = true)
    (hsq : ∀ n, n < twistDin prm + 1 → isPos (sqrtNatI P (n + 1)) = true)
    (hden : ∀ c, c < (twistDin prm + 1) / 2 + 1 →
      isPos (mulI P (mulI P (sqrtI P (lamI P prm.j)) aI) (sqrtNatI P (c + 1))) = true) :
    memSc (2 * KOut) (nodeITerm prm tabs.center s W)
        (twistNode P prm tabs piI sI wI neg aI).iPart ∧
      ∀ q c d, q < twistQlow prm → c < q + 2 → d < q + 1 →
        memSc (2 * KOut) (nodeLowTerm prm s W q c d)
          (lowGet (twistNode P prm tabs piI sI wI neg aI).low q c d) := by
  have hJ := fun c d hcd =>
    twistJ_sound P hP hpi hW hprm.hDin htab hnd hexp hA'pos hrv hsq hden c d hcd
  have hs0 := hnd.pos.le
  have hF : memOut (Real.exp (-s) * W) (toOut (mulI P (expNegI P 400 sI) wI)) := memOut_toOut hfac
  constructor
  · unfold twistNode nodeITerm
    simp only
    apply memSc_mulFx hF
    apply memOut_roundOut
    have := memSc_foldl_add2 (K := 2 * KOut) (fun c => prm.Dout + 1 - c) (prm.Dout + 1)
      (f := fun c d => centerVR prm tabs.center s c d * (twistCoef prm.j s (c, d)).re)
      (g := fun c d => mulFx (((centerV prm tabs.center (psiTable P prm.Q sI)).getD c #[]).getD d
        ⟨0, 0⟩) ((((twistJ P prm tabs piI sI neg aI).map fun row => row.map toOut).getD c #[]).getD
          d ⟨0, 0⟩))
      (fun c d hc hd => by
        rw [getJ_eq P prm tabs piI sI neg aI c d (by omega)]
        exact memSc_mulFx (memOut_centerV P hP prm hprm.hQ hprm.hE hprm.hDQ tabs.center hs0
          hnd.mem_s c d (by omega)) (memOut_toOut (hJ c d (by omega))))
      (memSc_zero (2 * KOut))
    simpa only [zero_add] using this
  · intro q c d hq hc hd
    unfold twistNode lowGet
    dsimp only
    rw [getD_ofFn _ hq, getD_ofFn _ hc, getD_ofFn _ hd]
    have hcd : c + d ≤ prm.Dout := by have := hprm.hlow; have := hprm.hDQ; omega
    unfold nodeLowTerm
    apply memSc_mulFx hF
    apply memOut_roundOut
    rw [getJ_eq P prm tabs piI sI neg aI c d hcd]
    apply memSc_mulFx _ (memOut_toOut (hJ c d hcd))
    unfold psiR
    apply mem_psiTable P hP prm.Q hprm.hQ hs0 hnd.mem_s
    have := radialKM_sum q c d (by omega) (by omega)
    have := hprm.hlow
    omega

/-! ### The node loop -/

/-- The exact enclosure state of an accumulator. -/
def AccOK (Qlow : ℕ) (I : ℝ) (L : ℕ → ℕ → ℕ → ℝ) (acc : TwAcc) : Prop :=
  memSc (2 * KOut) I acc.iPart ∧
    ∀ q c d, q < Qlow → c < q + 2 → d < q + 1 → memSc (2 * KOut) (L q c d) (lowGet acc.low q c d)

lemma lowGet_twAccAdd (Qlow : ℕ) (acc : TwAcc) (out : TwistNodeOut) (q c d : ℕ) (hq : q < Qlow)
    (hc : c < q + 2) (hd : d < q + 1) :
    lowGet (twAccAdd Qlow acc out).low q c d =
      addPair (lowGet acc.low q c d) (lowGet out.low q c d) := by
  unfold twAccAdd lowGet
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, hq, hc, hd, ↓reduceDIte,
    Option.getD_some]

lemma lowGet_twAccZero (Qlow q c d : ℕ) (hq : q < Qlow) (hc : c < q + 2) (hd : d < q + 1) :
    lowGet (twAccZero Qlow).low q c d = (0, 0) := by
  unfold twAccZero lowGet
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, hq, hc, hd, ↓reduceDIte,
    Option.getD_some]

lemma accOK_zero (Qlow : ℕ) : AccOK Qlow 0 (fun _ _ _ => 0) (twAccZero Qlow) :=
  ⟨memSc_zero _, fun q c d hq hc hd => by
    rw [lowGet_twAccZero Qlow q c d hq hc hd]; exact memSc_zero _⟩

/-- The real node and weight of a spec at its root. -/
def nodeSR (nd : NodeSpec) : ℝ := specNode nd (rootOf nd)
def nodeWR (nd : NodeSpec) : ℝ := specWeight nd (rootOf nd)

/-- **One spec**: an accepted node adds its exact terms. -/
theorem twistSpec_sound (P : ℕ) (hP : 1 ≤ P) {piI : Ival} (hpi : mem Real.pi piI)
    (hW : WatsonHyp 70) {pd : ProfileData} (hpd : profileAgrees pd)
    (hpv : profileValid P piI pd = true) {prm : TwistParams} (hprm : ParamsOK prm)
    {tabs : TwistTables} (htab : TwistTablesOK P prm tabs) (nd : NodeSpec) {I : ℝ}
    {L : ℕ → ℕ → ℕ → ℝ} {acc acc' : TwAcc} (hacc : AccOK (twistQlow prm) I L acc)
    (h : twistSpec P piI pd prm tabs nd acc = some acc') :
    AccOK (twistQlow prm) (I + nodeITerm prm tabs.center (nodeSR nd) (nodeWR nd))
      (fun q c d => L q c d + nodeLowTerm prm (nodeSR nd) (nodeWR nd) q c d) acc' := by
  unfold twistSpec at h
  split at h
  · exact absurd h (by simp)
  · rename_i neg aI hshift
    split_ifs at h with hvalid
    simp only [Option.some.injEq] at h
    subst h
    obtain ⟨hbr, hlo, hhi, hord, hwv, hspos, hfv, hexp, -, -, hA'pos, hrv, hsq, hden⟩ :=
      twistValid_unpack P prm nd aI hvalid
    have hx := (rootOf_spec bracketPrec (by decide) nd hbr).1
    have hs := mem_nodeS P hP nd hx hlo hhi
    have hs0 : 0 < nodeSR nd := pos_of_isPos hspos hs
    have hWm := mem_nodeW P hP nd hx hlo hhi hord hwv
    have hn : ∀ j, j < pd.coeffs.size → 0 < (nrmHalfI P (sqrtI P piI) j).lo := by
      intro j hj
      unfold profileValid at hpv
      simp only [List.all_eq_true, List.mem_range] at hpv
      exact lo_pos_of_isPos (hpv j hj)
    unfold nodeShift at hshift
    split at hshift
    · exact absurd hshift (by simp)
    · rename_i v neg' aI' hps
      simp only [Option.some.injEq, Prod.mk.injEq] at hshift
      obtain ⟨rfl, rfl⟩ := hshift
      obtain ⟨hv0, hsign, hA⟩ := profileShiftI_sound P hP hpi hpd hs0.le hs hn hps
      have hnd : NodeData P piI (nodeSR nd) (nodeS P nd) neg' aI' :=
        ⟨hs0, hs, hv0, by rw [hsign]; rfl, hA⟩
      have hfac : mem (Real.exp (-nodeSR nd) * nodeWR nd) (mulI P (expNegI P 400 (nodeS P nd))
          (nodeW P nd)) := by
        unfold nodeFactorsValid at hfv
        simp only [Bool.and_eq_true] at hfv
        exact mem_mulI P (mem_expNegI P hP 400 hs0.le hs hfv.1 hfv.2) hWm
      obtain ⟨hI, hL⟩ := twistNode_sound P hP hpi hW hprm htab hnd hWm hfac hexp hA'pos hrv hsq hden
      refine ⟨memSc_addPair hacc.1 hI, fun q c d hq hc hd => ?_⟩
      rw [lowGet_twAccAdd _ _ _ q c d hq hc hd]
      exact memSc_addPair (hacc.2 q c d hq hc hd) (hL q c d hq hc hd)

lemma twistSpecs_cons (P : ℕ) (piI : Ival) (pd : ProfileData) (prm : TwistParams)
    (tabs : TwistTables) (nd : NodeSpec) (rest : List NodeSpec) (acc : TwAcc) :
    twistSpecs P piI pd prm tabs (nd :: rest) acc =
      (twistSpec P piI pd prm tabs nd acc).bind (twistSpecs P piI pd prm tabs rest) := rfl

/-- **The node loop**: an accepted list of specs adds the exact terms of all its nodes. -/
theorem twistSpecs_sound (P : ℕ) (hP : 1 ≤ P) {piI : Ival} (hpi : mem Real.pi piI)
    (hW : WatsonHyp 70) {pd : ProfileData} (hpd : profileAgrees pd)
    (hpv : profileValid P piI pd = true) {prm : TwistParams} (hprm : ParamsOK prm)
    {tabs : TwistTables} (htab : TwistTablesOK P prm tabs) :
    ∀ (specs : List NodeSpec) {I : ℝ} {L : ℕ → ℕ → ℕ → ℝ} {acc acc' : TwAcc},
      AccOK (twistQlow prm) I L acc → twistSpecs P piI pd prm tabs specs acc = some acc' →
      AccOK (twistQlow prm)
        (I + (specs.map fun nd => nodeITerm prm tabs.center (nodeSR nd) (nodeWR nd)).sum)
        (fun q c d => L q c d +
          (specs.map fun nd => nodeLowTerm prm (nodeSR nd) (nodeWR nd) q c d).sum) acc' := by
  intro specs
  induction specs with
  | nil =>
    intro I L acc acc' hacc h
    simp only [twistSpecs, Option.some.injEq] at h
    subst h
    simpa using hacc
  | cons nd rest ih =>
    intro I L acc acc' hacc h
    rw [twistSpecs_cons, Option.bind_eq_some_iff] at h
    obtain ⟨acc₁, h1, h2⟩ := h
    have hstep := twistSpec_sound P hP hpi hW hpd hpv hprm htab nd hacc h1
    have := ih hstep h2
    simp only [List.map_cons, List.sum_cons, ← add_assoc]
    exact this

/-! ### The two checks -/

/-- `iPartialOK`: the lower end of the `I`-partial is at least `num / den`. -/
theorem iPartialOK_sound {acc : TwAcc} {I : ℝ} (hI : memSc (2 * KOut) I acc.iPart) {num : ℤ}
    {den : ℕ} (hden : 0 < den) (h : iPartialOK acc num den = true) : (num : ℝ) / den ≤ I := by
  unfold iPartialOK at h
  have h' : num * pow2 (2 * KOut) ≤ acc.iPart.1 * den := by simpa using h
  have hR : (num : ℝ) * (2 : ℝ) ^ (2 * KOut) ≤ (acc.iPart.1 : ℝ) * den := by
    have := (Int.cast_le (R := ℝ)).mpr h'
    push_cast [pow2_cast] at this
    exact this
  have hpos : (0 : ℝ) < (2 : ℝ) ^ (2 * KOut) := by positivity
  have hd : (0 : ℝ) < den := by exact_mod_cast hden
  rw [div_le_iff₀ hd]
  have h1 := hI.1
  nlinarith

/-- The excursion bound: `|x − t / 2^{2 KOut}| ≤ excursion / 2^{2 KOut}` for `x` in the enclosure.
-/
lemma abs_sub_le_excursionTw {x : ℝ} {e : ℤ × ℤ} (hx : memSc (2 * KOut) x e) (t : ℤ) :
    |x - (t : ℝ) / 2 ^ (2 * KOut)| ≤ (excursionTw e t : ℝ) / 2 ^ (2 * KOut) := by
  have hpos : (0 : ℝ) < (2 : ℝ) ^ (2 * KOut) := by positivity
  rw [le_div_iff₀ hpos, ← abs_of_pos hpos, ← abs_mul, abs_of_pos hpos, sub_mul,
    div_mul_cancel₀ _ hpos.ne']
  unfold excursionTw
  push_cast
  rw [abs_le]
  constructor <;> [skip; skip] <;>
    nlinarith [hx.1, hx.2, le_max_left (max ((e.2 : ℝ) - t) (t - e.1)) 0,
      le_max_right (max ((e.2 : ℝ) - t) (t - e.1)) 0, le_max_left ((e.2 : ℝ) - t) (t - e.1),
      le_max_right ((e.2 : ℝ) - t) (t - e.1)]

end

end Grothe.UpperQuad
