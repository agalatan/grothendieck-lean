import Grothe.UpperQuad.QuadEllipseTotal
import Grothe.UpperQuad.QuadPanelChain
import Grothe.UpperQuad.QuadRemainderRule

/-!
# `QuadRemainderHyp` from the per-panel ellipse bounds (part (Q) of `hQuad`)

`quadRemainderHyp_of_panels`: if every source panel `p` satisfies `PanelGood p (Ev p)` (the
accepted ellipse check: a sign of the profile on the panel and the remainder bound `Ev p` of the
extended integrand vector for every exact rule) and `Σ_p Ev p ≤ 1.06·10⁻¹²`, then
`QuadRemainderHyp`.  Proof: on each panel the production rule is admissible
(`source_rule_exact`), the extended integrands are the radial integrands
(`Fext_ofReal`, `radialIntegrand_eq_node`), the covered integral is the sum over the panels
(`setIntegral_covered_eq`) and the Gauss sum likewise (`gaussCoeffFull_canonical`); Minkowski over
the panels bounds the canonical vector, and the reflected entries are `√((d+1)/c) ≤ 1` times
canonical ones (`partCoefficient_reflection`), so `‖·‖² ≤ 2 (1.06·10⁻¹²)² ≤ (1.5·10⁻¹²)²`.

Agent-ID: claude-b9ee. Refs #303.
-/

namespace Grothe.UpperQuad.QuadRem

open MeasureTheory Set Grothe.UpperChaos Grothe.UpperChaos.Q0GaussAddressScan
open Grothe.UpperChaos.Q0GaussOrdinalEquiv Grothe.UpperChaos.Q0GaussProductionMass
open Grothe.UpperQuad.EllCheck

noncomputable section

/-- The error vector of panel `p` for the sign `ε`. -/
def panelErrV (ε : ℝ) (p : Fin sourcePanels.length) : EuclideanSpace ℂ canon :=
  (∫ s in ((sourcePanels.get p).lo : ℝ)..(sourcePanels.get p).hi, FextV ε s) -
    ∑ i : Fin (sourcePanels.get p).order, (sourceWeight ⟨p, i⟩ : ℂ) • FextV ε (sourceNode ⟨p, i⟩)

/-- The production nodes are interior to their panels. -/
lemma source_node_mem_Ioo (a : Address) :
    sourceNode a ∈ Ioo ((sourcePanels.get a.1).lo : ℝ) ((sourcePanels.get a.1).hi : ℝ) := by
  have hp := source_panel_lt a.1
  have hr : |sourceRoot a| < 1 :=
    (Grothe.UpperChaos.Q0GaussSelectedChoice.selectedFor
      (sourcePanels.get a.1).order (source_order_bounds a)).interior a.2
  have hx := abs_lt.mp hr
  have hw : 0 < (((sourcePanels.get a.1).hi : ℝ) - (sourcePanels.get a.1).lo) / 2 := by linarith
  have hleft := mul_pos hw (show 0 < 1 + sourceRoot a by linarith)
  have hright := mul_pos hw (show 0 < 1 - sourceRoot a by linarith)
  unfold sourceNode Grothe.UpperChaos.Q0LegendreInteger.panelNode
  constructor <;> nlinarith

/-- The sign of the profile identifies the sign used by the node coefficients. -/
lemma profileSign_eq {ε : ℝ} (hε : ε = 1 ∨ ε = -1) {s : ℝ} (hs : 0 < ε * vprof s) :
    F0ConditionalEvaluator.profileSign s = ε := by
  unfold F0ConditionalEvaluator.profileSign
  rcases hε with rfl | rfl
  · rw [one_mul] at hs; simp [not_lt.mpr hs.le]
  · have : vprof s < 0 := by linarith
    simp [this]

/-- At real points with the panel sign, the extension is the radial integrand. -/
lemma Fext_eq_radial {ε : ℝ} (hε : ε = 1 ∨ ε = -1) {q c d : ℕ} (hx : (q, c, d) ∈ canon)
    {s : ℝ} (hs0 : 0 < s) (hs : 0 < ε * vprof s) :
    Fext ε q c d s = radialIntegrand q c d s := by
  obtain ⟨-, hd, hc⟩ := mem_canon.mp hx
  have hv : vprof s ≠ 0 := by intro h0; rw [h0, mul_zero] at hs; exact lt_irrefl _ hs
  rw [radialIntegrand_eq_node q c d hd hc hs0 hv, ← profileSign_eq hε hs]
  exact Fext_ofReal q c d hd hc hs0 hv

/-- The extended vector is continuous on a panel where the profile has the sign `ε`. -/
lemma continuousOn_FextV {ε : ℝ} (hε : ε = 1 ∨ ε = -1) {lo hi : ℝ}
    (hsign : ∀ s ∈ Icc lo hi, 0 < ε * vprof s) :
    ContinuousOn (fun s : ℝ => FextV ε (s : ℂ)) (Icc lo hi) := by
  intro s hs
  have hv : vC (s : ℂ) ≠ 0 := by
    rw [vC_ofReal]; intro h0
    have := hsign s hs
    rw [show vprof s = 0 by exact_mod_cast h0, mul_zero] at this
    exact lt_irrefl _ this
  have hε0 : ε ≠ 0 := by rcases hε with h | h <;> rw [h] <;> norm_num
  exact ((differentiableAt_FextV hε0 hv).continuousAt.comp
    Complex.continuous_ofReal.continuousAt).continuousWithinAt

/-- The component `(q, c, d)` of a panel error vector is the panel's contribution to the error of
the
canonical coefficient. -/
lemma panelErrV_apply {ε : ℝ} (hε : ε = 1 ∨ ε = -1) (p : Fin sourcePanels.length)
    (hsign : ∀ s ∈ Icc ((sourcePanels.get p).lo : ℝ) (sourcePanels.get p).hi, 0 < ε * vprof s)
    (x : canon) :
    panelErrV ε p x = (∫ s in ((sourcePanels.get p).lo : ℝ)..(sourcePanels.get p).hi,
        radialIntegrand x.1.1 x.1.2.1 x.1.2.2 s) -
      ((∑ i : Fin (sourcePanels.get p).order,
        sourceWeight ⟨p, i⟩ * nodeF x.1.1 x.1.2.1 x.1.2.2 (sourceNode ⟨p, i⟩) : ℝ) : ℂ) := by
  set lo : ℝ := ((sourcePanels.get p).lo : ℝ) with hlodef
  set hi : ℝ := ((sourcePanels.get p).hi : ℝ) with hhidef
  have hlh : lo < hi := source_panel_lt p
  have hlo : 0 ≤ lo := panel_lo_nonneg p
  have hcont := continuousOn_FextV hε hsign
  have hint : IntervalIntegrable (fun s : ℝ => FextV ε (s : ℂ)) volume lo hi := by
    apply ContinuousOn.intervalIntegrable; rw [uIcc_of_le hlh.le]; exact hcont
  unfold panelErrV
  rw [← hlodef, ← hhidef, PiLp.sub_apply]
  congr 1
  · -- the integral component
    have hproj := (EuclideanSpace.proj (𝕜 := ℂ) x).intervalIntegral_comp_comm hint
    have hproj' : (∫ s in lo..hi, FextV ε (s : ℂ)).ofLp x =
        ∫ s in lo..hi, (FextV ε (s : ℂ)).ofLp x := hproj.symm
    rw [hproj']
    apply intervalIntegral.integral_congr_ae
    filter_upwards with s hs
    rw [uIoc_of_le hlh.le] at hs
    have hs0 : 0 < s := lt_of_le_of_lt hlo hs.1
    show (FextV ε (s : ℂ)) x = _
    exact Fext_eq_radial hε x.2 hs0 (hsign s ⟨hs.1.le, hs.2⟩)
  · -- the Gauss component
    rw [Complex.ofReal_sum, WithLp.ofLp_sum, Finset.sum_apply]
    apply Finset.sum_congr rfl
    intro i _
    have hnode := source_node_mem_panel ⟨p, i⟩
    have hint' : sourceNode ⟨p, i⟩ ∈ Ioo lo hi := source_node_mem_Ioo ⟨p, i⟩
    have hs0 : 0 < sourceNode ⟨p, i⟩ := lt_of_le_of_lt hlo hint'.1
    show (sourceWeight ⟨p, i⟩ : ℂ) * FextV ε (sourceNode ⟨p, i⟩ : ℂ) x = _
    push_cast
    congr 1
    obtain ⟨-, hd, hc⟩ := mem_canon.mp x.2
    have hv : vprof (sourceNode ⟨p, i⟩) ≠ 0 := by
      intro h0; have := hsign _ hnode; rw [h0, mul_zero] at this; exact lt_irrefl _ this
    show Fext ε x.1.1 x.1.2.1 x.1.2.2 (sourceNode ⟨p, i⟩ : ℂ) = _
    rw [← profileSign_eq hε (hsign _ hnode)]
    exact Fext_ofReal _ _ _ hd hc hs0 hv

/-- The error of the canonical coefficient `x`. -/
def errC (x : ℕ × ℕ × ℕ) : ℂ :=
  Tail.partCoefficient Tail.tailSetᶜ x.1 x.2.1 x.2.2 -
    ((gaussCoeffFull partitionSpecs rootOf x.1 x.2.1 x.2.2 : ℝ) : ℂ)

/-- **The canonical error vector is the sum of the panel errors.** -/
theorem errC_eq_sum {ε : Fin sourcePanels.length → ℝ} (hε : ∀ p, ε p = 1 ∨ ε p = -1)
    (hsign : ∀ p, ∀ s ∈ Icc ((sourcePanels.get p).lo : ℝ) (sourcePanels.get p).hi,
      0 < ε p * vprof s) (x : canon) :
    errC x.1 = ∑ p : Fin sourcePanels.length, panelErrV (ε p) p x := by
  obtain ⟨hq, hd, hc⟩ := mem_canon.mp x.2
  simp_rw [panelErrV_apply (hε _) _ (hsign _) x]
  rw [Finset.sum_sub_distrib]
  unfold errC
  refine congrArg₂ (fun a b => a - b) ?_ ?_
  · rw [partCoefficient_eq_radial Tail.measurableSet_tailSet.compl _ _ _ (by omega) hd]
    have hint : ∀ P ∈ sourcePanels, IntervalIntegrable
        (radialIntegrand x.1.1 x.1.2.1 x.1.2.2) volume (P.lo : ℝ) P.hi := by
      intro P hP
      obtain ⟨p, rfl⟩ := List.get_of_mem hP
      have hlh := source_panel_lt p
      have hlo := panel_lo_nonneg p
      have hcont := continuousOn_FextV (hε p) (hsign p)
      have hint : IntervalIntegrable (fun s : ℝ => FextV (ε p) (s : ℂ)) volume
          ((sourcePanels.get p).lo : ℝ) (sourcePanels.get p).hi := by
        apply ContinuousOn.intervalIntegrable; rw [uIcc_of_le hlh.le]; exact hcont
      have hcomp := (EuclideanSpace.proj (𝕜 := ℂ) x).continuous.comp_continuousOn hcont
      have hint2 : IntervalIntegrable (fun s : ℝ => Fext (ε p) x.1.1 x.1.2.1 x.1.2.2 (s : ℂ))
          volume ((sourcePanels.get p).lo : ℝ) (sourcePanels.get p).hi := by
        apply ContinuousOn.intervalIntegrable; rw [uIcc_of_le hlh.le]; exact hcomp
      apply hint2.congr
      rw [uIoc_of_le hlh.le]
      intro s hs
      exact Fext_eq_radial (hε p) x.2 (lt_of_le_of_lt hlo hs.1) (hsign p s ⟨hs.1.le, hs.2⟩)
    rw [setIntegral_covered_eq _ hint, ← Fin.sum_univ_fun_getElem]
    rfl
  · rw [gaussCoeffFull_canonical _ _ _ hq hd hc, Complex.ofReal_sum]

/-- The nested head sum as a sum over a sigma set. -/
lemma nested_eq_sigma (G : ℕ → ℕ → ℕ → ℝ) :
    ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1), G q c d =
      ∑ σ ∈ (Finset.range 251).sigma (fun q => Finset.range (q + 2) ×ˢ Finset.range (q + 1)),
        G σ.1 σ.2.1 σ.2.2 := by
  rw [Finset.sum_sigma]
  apply Finset.sum_congr rfl
  intro q _
  rw [Finset.sum_product]

/-- A nonnegative function summed over the image of an injective map into `canon`. -/
lemma sum_image_le_canon {S : Finset (Σ _ : ℕ, ℕ × ℕ)} (φ : (Σ _ : ℕ, ℕ × ℕ) → ℕ × ℕ × ℕ)
    (hinj : ∀ a ∈ S, ∀ b ∈ S, φ a = φ b → a = b) (hmem : ∀ a ∈ S, φ a ∈ canon)
    (F : ℕ × ℕ × ℕ → ℝ) (hF : ∀ x, 0 ≤ F x) :
    ∑ a ∈ S, F (φ a) ≤ ∑ x ∈ canon, F x := by
  rw [← Finset.sum_image hinj]
  apply Finset.sum_le_sum_of_subset_of_nonneg
  · intro x hx
    obtain ⟨a, ha, rfl⟩ := Finset.mem_image.mp hx
    exact hmem a ha
  · exact fun x _ _ => hF x

/-- **The head sum is at most twice the canonical sum** when every reflected entry is dominated by
its canonical partner. -/
theorem nested_le_two_canon (F : ℕ × ℕ × ℕ → ℝ) (hF : ∀ x, 0 ≤ F x)
    (hrefl : ∀ q c d, q < 251 → c < q + 2 → d < q + 1 → d + 1 < c →
      F (q, c, d) ≤ F (q, d + 1, c - 1)) :
    ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1), F (q, c, d) ≤
      2 * ∑ x ∈ canon, F x := by
  obtain ⟨S, hSdef⟩ : ∃ S : Finset (Σ _ : ℕ, ℕ × ℕ),
      S = (Finset.range 251).sigma (fun q => Finset.range (q + 2) ×ˢ Finset.range (q + 1)) :=
    ⟨_, rfl⟩
  have hS : ∀ σ ∈ S, σ.1 < 251 ∧ σ.2.1 < σ.1 + 2 ∧ σ.2.2 < σ.1 + 1 := by
    intro σ hσ
    rw [hSdef] at hσ
    simp only [Finset.mem_sigma, Finset.mem_product, Finset.mem_range] at hσ
    exact ⟨hσ.1, hσ.2.1, hσ.2.2⟩
  rw [nested_eq_sigma (fun q c d => F (q, c, d)), ← hSdef]
  rw [← Finset.sum_filter_add_sum_filter_not S (fun σ => σ.2.1 ≤ σ.2.2 + 1)]
  have hinjφ : ∀ a ∈ S.filter (fun σ => σ.2.1 ≤ σ.2.2 + 1),
      ∀ b ∈ S.filter (fun σ => σ.2.1 ≤ σ.2.2 + 1),
      (a.1, a.2.1, a.2.2) = (b.1, b.2.1, b.2.2) → a = b := by
    rintro ⟨a1, a2, a3⟩ - ⟨b1, b2, b3⟩ - h
    simp only [Prod.mk.injEq] at h
    obtain ⟨rfl, rfl, rfl⟩ := h; rfl
  have hmemφ : ∀ a ∈ S.filter (fun σ => σ.2.1 ≤ σ.2.2 + 1), (a.1, a.2.1, a.2.2) ∈ canon := by
    intro a ha
    rw [Finset.mem_filter] at ha
    obtain ⟨h1, h2, h3⟩ := hS a ha.1
    exact mem_canon.mpr ⟨h1, by simp only; omega, ha.2⟩
  have hA := sum_image_le_canon (fun a => (a.1, a.2.1, a.2.2)) hinjφ hmemφ F hF
  have hinjψ : ∀ a ∈ S.filter (fun σ => ¬ σ.2.1 ≤ σ.2.2 + 1),
      ∀ b ∈ S.filter (fun σ => ¬ σ.2.1 ≤ σ.2.2 + 1),
      (a.1, a.2.2 + 1, a.2.1 - 1) = (b.1, b.2.2 + 1, b.2.1 - 1) → a = b := by
    rintro ⟨a1, a2, a3⟩ ha ⟨b1, b2, b3⟩ hb h
    rw [Finset.mem_filter] at ha hb
    simp only [Prod.mk.injEq] at h ha hb
    obtain ⟨rfl, h2, h3⟩ := h
    have : a3 = b3 := by omega
    have : a2 = b2 := by omega
    subst_vars; rfl
  have hmemψ : ∀ a ∈ S.filter (fun σ => ¬ σ.2.1 ≤ σ.2.2 + 1),
      (a.1, a.2.2 + 1, a.2.1 - 1) ∈ canon := by
    intro a ha
    rw [Finset.mem_filter] at ha
    obtain ⟨h1, h2, h3⟩ := hS a ha.1
    exact mem_canon.mpr ⟨h1, by simp only; omega, by simp only; omega⟩
  have hB := sum_image_le_canon (fun a => (a.1, a.2.2 + 1, a.2.1 - 1)) hinjψ hmemψ F hF
  have hB' : ∑ σ ∈ S.filter (fun σ => ¬ σ.2.1 ≤ σ.2.2 + 1), F (σ.1, σ.2.1, σ.2.2) ≤
      ∑ σ ∈ S.filter (fun σ => ¬ σ.2.1 ≤ σ.2.2 + 1), F (σ.1, σ.2.2 + 1, σ.2.1 - 1) := by
    apply Finset.sum_le_sum
    intro σ hσ
    rw [Finset.mem_filter] at hσ
    obtain ⟨h1, h2, h3⟩ := hS σ hσ.1
    exact hrefl _ _ _ h1 h2 h3 (by omega)
  linarith

/-- The reflected errors are dominated by their canonical partners. -/
lemma errC_reflection (q c d : ℕ) (_hq : q < 251) (hc : c < q + 2) (hd : d < q + 1)
    (href : d + 1 < c) : ‖errC (q, c, d)‖ ^ 2 ≤ ‖errC (q, d + 1, c - 1)‖ ^ 2 := by
  have hpart := partCoefficient_reflection Tail.measurableSet_tailSet.compl q c d (by omega)
    (by omega) href
  have hgauss : gaussCoeffFull partitionSpecs rootOf q c d =
      gaussCoeffFull partitionSpecs rootOf q (d + 1) (c - 1) *
        Real.sqrt (((d + 1 : ℕ) : ℝ) / (c : ℝ)) := by
    unfold gaussCoeffFull gradeValue
    split_ifs <;> first | omega | simp
  have he : errC (q, c, d) =
      (Real.sqrt (((d + 1 : ℕ) : ℝ) / (c : ℝ)) : ℂ) * errC (q, d + 1, c - 1) := by
    unfold errC
    simp only
    rw [hpart, hgauss]
    push_cast
    ring
  have hr : Real.sqrt (((d + 1 : ℕ) : ℝ) / (c : ℝ)) ≤ 1 := by
    rw [Real.sqrt_le_one]
    rw [div_le_one (by exact_mod_cast (show 0 < c by omega))]
    exact_mod_cast href.le
  rw [he, norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg (Real.sqrt_nonneg _),
    mul_pow]
  have h0 := Real.sqrt_nonneg (((d + 1 : ℕ) : ℝ) / (c : ℝ))
  have : Real.sqrt (((d + 1 : ℕ) : ℝ) / (c : ℝ)) ^ 2 ≤ 1 := by nlinarith
  nlinarith [sq_nonneg ‖errC (q, d + 1, c - 1)‖]

set_option maxRecDepth 20000 in
/-- **`QuadRemainderHyp` from the per-panel bounds.** -/
theorem quadRemainderHyp_of_panels (Ev : Fin sourcePanels.length → ℝ)
    (hgood : ∀ p, PanelGood (sourcePanels.get p) (Ev p))
    (hsum : ∑ p, Ev p ≤ (106 : ℝ) / 10 ^ 14) : QuadRemainderHyp := by
  choose ε hε hsign hbd using hgood
  have herr : ∀ p, ‖panelErrV (ε p) p‖ ≤ Ev p := by
    intro p
    have hb : 1 ≤ (sourcePanels.get p).order :=
      (scan_member_order_bounds sourcePanels 0 21577 complete_scan
        (sourcePanels.get p) (List.get_mem sourcePanels p)).1
    exact hbd p (fun i => sourceNode ⟨p, i⟩) (fun i => sourceWeight ⟨p, i⟩) hb
      (fun i => source_node_mem_panel ⟨p, i⟩) (fun i => (sourceWeight_pos ⟨p, i⟩).le)
      (source_rule_exact p)
  obtain ⟨V, hVdef⟩ : ∃ V : EuclideanSpace ℂ canon, V = WithLp.toLp 2 (fun x : canon => errC x.1) :=
    ⟨_, rfl⟩
  have hV : V = ∑ p, panelErrV (ε p) p := by
    ext x
    rw [hVdef, PiLp.toLp_apply, errC_eq_sum hε hsign x, WithLp.ofLp_sum, Finset.sum_apply]
  have hnV : ‖V‖ ≤ (106 : ℝ) / 10 ^ 14 := by
    rw [hV]
    have h1 : ‖∑ p, panelErrV (ε p) p‖ ≤ ∑ p, ‖panelErrV (ε p) p‖ :=
      norm_sum_le Finset.univ (fun p => panelErrV (ε p) p)
    have h2 : ∑ p, ‖panelErrV (ε p) p‖ ≤ ∑ p, Ev p := Finset.sum_le_sum fun p _ => herr p
    exact h1.trans (h2.trans hsum)
  have hcan : ∑ x ∈ canon, ‖errC x‖ ^ 2 ≤ ((106 : ℝ) / 10 ^ 14) ^ 2 := by
    have h1 : ‖V‖ ^ 2 = ∑ x ∈ canon, ‖errC x‖ ^ 2 := by
      rw [hVdef, EuclideanSpace.norm_eq, Real.sq_sqrt (Finset.sum_nonneg fun _ _ => sq_nonneg _),
        ← Finset.sum_coe_sort canon]
    rw [← h1]
    exact pow_le_pow_left₀ (norm_nonneg _) hnV 2
  unfold QuadRemainderHyp
  have hnest := nested_le_two_canon (fun x => ‖errC x‖ ^ 2) (fun x => sq_nonneg _)
    (fun q c d hq hc hd href => errC_reflection q c d hq hc hd href)
  calc _ = ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
        ‖errC (q, c, d)‖ ^ 2 := rfl
    _ ≤ 2 * ∑ x ∈ canon, ‖errC x‖ ^ 2 := hnest
    _ ≤ 2 * ((106 : ℝ) / 10 ^ 14) ^ 2 := by linarith
    _ ≤ ((15 : ℝ) / 10 ^ 13) ^ 2 := by norm_num

end

end Grothe.UpperQuad.QuadRem
