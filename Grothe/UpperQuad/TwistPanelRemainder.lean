import Grothe.UpperQuad.TwistTail
import Grothe.UpperQuad.RootIdent
import Grothe.UpperQuad.QuadPanelChain
import Grothe.UpperQuad.QuadRemainderRule
import Grothe.UpperQuad.GaussRemainderEllipse

/-!
# Full twisted-vector remainder from the production panels

The vector contains every graded mode used by `TwistRemainderHyp`, without a canonical-pair
restriction or a reflection factor. Its exact Gauss sum is regrouped over the production source
panels. An extension on each panel, identified on the positive real slice, therefore gives the
actual covered-set remainder by the triangle inequality. The final theorem uses the existing
Banach-valued Bernstein-ellipse bound and the actual production rules.

Agent-ID: codex-1a87. Refs #334, #332.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.TwistPanels

open MeasureTheory Set GrotheQuad Grothe.UpperChaos
open Grothe.UpperChaos.Q0GaussAddressScan Grothe.UpperChaos.Q0GaussOrdinalEquiv
open Grothe.UpperChaos.Q0GaussProductionMass

noncomputable section

/-- The complete finite vector in the twisted remainder hypothesis. -/
abbrev Vector (j : ℕ) := EuclideanSpace ℂ (idx3 (twistParams j).Q)

/-- The exact production Gauss sum regrouped by panel, with all graded modes retained. -/
theorem twistGauss_eq_panels (j : ℕ) (hj : j = 1 ∨ j = 2 ∨ j = 3) (q c d : ℕ) :
    twistGauss j q c d =
      ∑ p : Fin sourcePanels.length, ∑ i : Fin (sourcePanels.get p).order,
        sourceWeight ⟨p, i⟩ * twistIntegrand j q c d (sourceNode ⟨p, i⟩) := by
  rw [twistGauss_eq j hj, sum_partitionSpecs, Fintype.sum_sigma]
  apply Finset.sum_congr rfl
  intro p _
  apply Finset.sum_congr rfl
  intro i _
  simp only [nodeWR, nodeSR, specNode_rootOf, specWeight_rootOf]

/-- The vector error of one production panel for its chosen complex extension. -/
def panelError (j : ℕ) (p : Fin sourcePanels.length) (F : ℂ → Vector j) : Vector j :=
  (∫ s in ((sourcePanels.get p).lo : ℝ)..(sourcePanels.get p).hi, F (s : ℂ)) -
    ∑ i : Fin (sourcePanels.get p).order,
      (sourceWeight ⟨p, i⟩ : ℂ) • F (sourceNode ⟨p, i⟩)

/-- The actual covered-set discrepancy as a finite Euclidean vector. -/
def errorVector (j : ℕ) : Vector j := WithLp.toLp 2 fun x ↦
  twistPart j Tail.tailSetᶜ x.1.1 x.1.2.1 x.1.2.2 -
    (twistGauss j x.1.1 x.1.2.1 x.1.2.2 : ℂ)

private lemma mem_mode {j : ℕ} (x : idx3 (twistParams j).Q) :
    x.1.1 < (twistParams j).Q ∧ x.1.2.1 < x.1.1 + 2 ∧ x.1.2.2 < x.1.1 + 1 := by
  have hx := x.2
  simpa only [idx3, Finset.mem_sigma, Finset.mem_product, Finset.mem_range] using hx

/-- The Euclidean norm is precisely the nested square sum in the target hypothesis. -/
theorem norm_errorVector_sq (j : ℕ) :
    ‖errorVector j‖ ^ 2 =
      ∑ q ∈ Finset.range (twistParams j).Q, ∑ c ∈ Finset.range (q + 2),
        ∑ d ∈ Finset.range (q + 1),
          ‖twistPart j Tail.tailSetᶜ q c d - (twistGauss j q c d : ℂ)‖ ^ 2 := by
  rw [sum3_eq, errorVector, EuclideanSpace.norm_eq,
    Real.sq_sqrt (Finset.sum_nonneg fun _ _ ↦ sq_nonneg _),
    ← Finset.sum_coe_sort (idx3 (twistParams j).Q)]

/-- Real-slice identification transports each component of a panel error. No value at zero
is required: the interval integral uses `Ioc`, and every production node is positive. -/
theorem panelError_apply (j : ℕ) (p : Fin sourcePanels.length) (F : ℂ → Vector j)
    (hcont : ContinuousOn (fun s : ℝ ↦ F (s : ℂ))
      (Icc ((sourcePanels.get p).lo : ℝ) (sourcePanels.get p).hi))
    (hslice : ∀ x : idx3 (twistParams j).Q, ∀ s : ℝ,
      s ∈ Icc ((sourcePanels.get p).lo : ℝ) (sourcePanels.get p).hi → 0 < s →
      F (s : ℂ) x = (twistIntegrand j x.1.1 x.1.2.1 x.1.2.2 s : ℂ))
    (x : idx3 (twistParams j).Q) :
    panelError j p F x =
      (∫ s in ((sourcePanels.get p).lo : ℝ)..(sourcePanels.get p).hi,
        (twistIntegrand j x.1.1 x.1.2.1 x.1.2.2 s : ℂ)) -
      ((∑ i : Fin (sourcePanels.get p).order, sourceWeight ⟨p, i⟩ *
        twistIntegrand j x.1.1 x.1.2.1 x.1.2.2 (sourceNode ⟨p, i⟩) : ℝ) : ℂ) := by
  have hlh := source_panel_lt p
  have hint : IntervalIntegrable (fun s : ℝ ↦ F (s : ℂ)) volume
      ((sourcePanels.get p).lo : ℝ) (sourcePanels.get p).hi := by
    apply ContinuousOn.intervalIntegrable
    rw [uIcc_of_le hlh.le]
    exact hcont
  unfold panelError
  rw [PiLp.sub_apply]
  refine congrArg₂ (fun a b : ℂ ↦ a - b) ?_ ?_
  · have hproj :
        (∫ s in ((sourcePanels.get p).lo : ℝ)..(sourcePanels.get p).hi,
          F (s : ℂ)).ofLp x =
        ∫ s in ((sourcePanels.get p).lo : ℝ)..(sourcePanels.get p).hi,
          (F (s : ℂ)).ofLp x :=
      ((EuclideanSpace.proj (𝕜 := ℂ) x).intervalIntegral_comp_comm hint).symm
    rw [hproj]
    apply intervalIntegral.integral_congr_ae
    filter_upwards with s hs
    rw [uIoc_of_le hlh.le] at hs
    exact hslice x s ⟨hs.1.le, hs.2⟩
      (lt_of_le_of_lt (QuadRem.panel_lo_nonneg p) hs.1)
  · rw [Complex.ofReal_sum, WithLp.ofLp_sum, Finset.sum_apply]
    apply Finset.sum_congr rfl
    intro i _
    change (sourceWeight ⟨p, i⟩ : ℂ) * F (sourceNode ⟨p, i⟩) x = _
    rw [hslice x _ (source_node_mem_panel ⟨p, i⟩) (sourceNode_pos ⟨p, i⟩)]
    push_cast
    rfl

set_option maxRecDepth 20000 in
/-- The actual error vector is the sum of every production panel's vector error. -/
theorem errorVector_eq_sum (j : ℕ) (hj : j = 1 ∨ j = 2 ∨ j = 3)
    (F : Fin sourcePanels.length → ℂ → Vector j)
    (hcont : ∀ p, ContinuousOn (fun s : ℝ ↦ F p (s : ℂ))
      (Icc ((sourcePanels.get p).lo : ℝ) (sourcePanels.get p).hi))
    (hslice : ∀ p, ∀ x : idx3 (twistParams j).Q, ∀ s : ℝ,
      s ∈ Icc ((sourcePanels.get p).lo : ℝ) (sourcePanels.get p).hi → 0 < s →
      F p (s : ℂ) x = (twistIntegrand j x.1.1 x.1.2.1 x.1.2.2 s : ℂ)) :
    errorVector j = ∑ p, panelError j p (F p) := by
  ext x
  rw [errorVector, PiLp.toLp_apply, WithLp.ofLp_sum, Finset.sum_apply]
  simp_rw [panelError_apply j _ _ (hcont _) (hslice _) x]
  rw [Finset.sum_sub_distrib]
  refine congrArg₂ (fun a b : ℂ ↦ a - b) ?_ ?_
  · obtain ⟨_, hc, hd⟩ := mem_mode x
    rw [twistPart_eq_radial j Tail.measurableSet_tailSet.compl _ _ _ (by omega) (by omega),
      inter_comm]
    have hint : ∀ P ∈ sourcePanels, IntervalIntegrable
        (fun s : ℝ ↦ (twistIntegrand j x.1.1 x.1.2.1 x.1.2.2 s : ℂ))
        volume (P.lo : ℝ) P.hi := by
      intro P hP
      obtain ⟨p, rfl⟩ := List.get_of_mem hP
      have hlh := source_panel_lt p
      have hcpt := (EuclideanSpace.proj (𝕜 := ℂ) x).continuous.comp_continuousOn (hcont p)
      have hint : IntervalIntegrable (fun s : ℝ ↦ F p (s : ℂ) x) volume
          ((sourcePanels.get p).lo : ℝ) (sourcePanels.get p).hi := by
        apply ContinuousOn.intervalIntegrable
        rw [uIcc_of_le hlh.le]
        exact hcpt
      apply hint.congr
      rw [uIoc_of_le hlh.le]
      intro s hs
      exact hslice p x s ⟨hs.1.le, hs.2⟩
        (lt_of_le_of_lt (QuadRem.panel_lo_nonneg p) hs.1)
    rw [QuadRem.setIntegral_covered_eq _ hint, ← Fin.sum_univ_fun_getElem]
    rfl
  · rw [twistGauss_eq_panels j hj, Complex.ofReal_sum]

set_option maxRecDepth 20000 in
/-- A sum of bounds on the full panel vectors gives the actual twisted remainder hypothesis. -/
theorem remainder_of_panel_bounds (j : ℕ) (hj : j = 1 ∨ j = 2 ∨ j = 3)
    (F : Fin sourcePanels.length → ℂ → Vector j)
    (hcont : ∀ p, ContinuousOn (fun s : ℝ ↦ F p (s : ℂ))
      (Icc ((sourcePanels.get p).lo : ℝ) (sourcePanels.get p).hi))
    (hslice : ∀ p, ∀ x : idx3 (twistParams j).Q, ∀ s : ℝ,
      s ∈ Icc ((sourcePanels.get p).lo : ℝ) (sourcePanels.get p).hi → 0 < s →
      F p (s : ℂ) x = (twistIntegrand j x.1.1 x.1.2.1 x.1.2.2 s : ℂ))
    (E : Fin sourcePanels.length → ℝ)
    (hE : ∀ p, ‖panelError j p (F p)‖ ≤ E p) {ρ : ℝ}
    (hsum : ∑ p, E p ≤ ρ) : TwistRemainderHyp j ρ := by
  have hn : ‖errorVector j‖ ≤ ρ := by
    rw [errorVector_eq_sum j hj F hcont hslice]
    have htriangle : ‖∑ p, panelError j p (F p)‖ ≤ ∑ p, ‖panelError j p (F p)‖ :=
      norm_sum_le Finset.univ (fun p ↦ panelError j p (F p))
    have hbound : ∑ p, ‖panelError j p (F p)‖ ≤ ∑ p, E p :=
      Finset.sum_le_sum fun p _ ↦ hE p
    exact htriangle.trans (hbound.trans hsum)
  change _ ≤ ρ ^ 2
  rw [← norm_errorVector_sq]
  exact pow_le_pow_left₀ (norm_nonneg _) hn 2

/-- The ellipse hypotheses imply continuity along the whole real panel, including zero. -/
theorem continuousOn_of_ellipse (j : ℕ) (p : Fin sourcePanels.length) (F : ℂ → Vector j)
    {ρ : ℝ} (hρ : 1 < ρ)
    (hF : ∀ w : ℂ, ρ⁻¹ ≤ ‖w‖ → ‖w‖ ≤ ρ →
      DifferentiableAt ℂ F (Remainder.ellipsePt (sourcePanels.get p).lo
        (sourcePanels.get p).hi w)) :
    ContinuousOn (fun s : ℝ ↦ F (s : ℂ))
      (Icc ((sourcePanels.get p).lo : ℝ) (sourcePanels.get p).hi) := by
  intro s hs
  obtain ⟨hw, hpt, _⟩ := Remainder.ellipsePt_arccos (source_panel_lt p) hs
  have hd := hF _ (by rw [hw]; exact (inv_lt_one_of_one_lt₀ hρ).le)
    (by rw [hw]; exact hρ.le)
  rw [hpt] at hd
  exact (hd.continuousAt.comp Complex.continuous_ofReal.continuousAt).continuousWithinAt

/-- The production panel's exact rule satisfies the vector-valued ellipse remainder estimate. -/
theorem norm_panelError_le_of_ellipse (j : ℕ) (p : Fin sourcePanels.length)
    (F : ℂ → Vector j) {ρ M : ℝ} (hρ : 1 < ρ)
    (hF : ∀ w : ℂ, ρ⁻¹ ≤ ‖w‖ → ‖w‖ ≤ ρ →
      DifferentiableAt ℂ F (Remainder.ellipsePt (sourcePanels.get p).lo
        (sourcePanels.get p).hi w))
    (hM : ∀ w : ℂ, ‖w‖ = ρ →
      ‖F (Remainder.ellipsePt (sourcePanels.get p).lo (sourcePanels.get p).hi w)‖ ≤ M) :
    ‖panelError j p F‖ ≤
      2 * (((sourcePanels.get p).hi : ℝ) - (sourcePanels.get p).lo) *
        (2 * M * (ρ⁻¹) ^ (2 * (sourcePanels.get p).order) / (1 - ρ⁻¹)) := by
  have hn := (scan_member_order_bounds sourcePanels 0 21577 complete_scan
    (sourcePanels.get p) (List.get_mem sourcePanels p)).1
  exact Remainder.gauss_remainder_ellipse (by omega) _ _ (source_panel_lt p)
    (fun i ↦ sourceNode ⟨p, i⟩) (fun i ↦ sourceWeight ⟨p, i⟩)
    (fun i ↦ source_node_mem_panel ⟨p, i⟩) (fun i ↦ (sourceWeight_pos ⟨p, i⟩).le)
    (QuadRem.source_rule_exact p) F hρ hF hM

/-- Certified ellipse bounds for every production panel discharge `TwistRemainderHyp`. -/
theorem remainder_of_ellipses (j : ℕ) (hj : j = 1 ∨ j = 2 ∨ j = 3)
    (F : Fin sourcePanels.length → ℂ → Vector j)
    (radius cap : Fin sourcePanels.length → ℝ)
    (hradius : ∀ p, 1 < radius p)
    (hF : ∀ p, ∀ w : ℂ, (radius p)⁻¹ ≤ ‖w‖ → ‖w‖ ≤ radius p →
      DifferentiableAt ℂ (F p) (Remainder.ellipsePt (sourcePanels.get p).lo
        (sourcePanels.get p).hi w))
    (hcap : ∀ p, ∀ w : ℂ, ‖w‖ = radius p →
      ‖F p (Remainder.ellipsePt (sourcePanels.get p).lo (sourcePanels.get p).hi w)‖ ≤ cap p)
    (hslice : ∀ p, ∀ x : idx3 (twistParams j).Q, ∀ s : ℝ,
      s ∈ Icc ((sourcePanels.get p).lo : ℝ) (sourcePanels.get p).hi → 0 < s →
      F p (s : ℂ) x = (twistIntegrand j x.1.1 x.1.2.1 x.1.2.2 s : ℂ))
    {ρ : ℝ}
    (hsum : ∑ p, 2 * (((sourcePanels.get p).hi : ℝ) - (sourcePanels.get p).lo) *
      (2 * cap p * ((radius p)⁻¹) ^ (2 * (sourcePanels.get p).order) /
        (1 - (radius p)⁻¹)) ≤ ρ) : TwistRemainderHyp j ρ := by
  apply remainder_of_panel_bounds j hj F
    (fun p ↦ continuousOn_of_ellipse j p (F p) (hradius p) (hF p)) hslice _ _ hsum
  intro p
  exact norm_panelError_le_of_ellipse j p (F p) (hradius p) (hF p) (hcap p)

end

end Grothe.UpperQuad.TwistPanels
