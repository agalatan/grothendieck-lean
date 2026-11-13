import Grothe.UpperQuad.QuadEllipseDiskSound
import Grothe.UpperQuad.QuadEllipseGeom

/-!
# Soundness of the ellipse checker, part 3: one panel

`panelErr_sound`: if the checker accepts the panel `p` with its plan and returns `E`, then (with the
panel sign `ε`) the profile keeps the sign `ε` on the panel, and every `n`-point rule on the panel
with nonnegative weights, exact through degree `2n − 1`, integrates the extended integrand vector
`FextV ε` within some `Ev ∈ E` (Bernstein ellipse `E_ρ` of the plan, covered by the plan's disks).

Agent-ID: claude-b9ee. Refs #303.
-/

namespace Grothe.UpperQuad.EllCheck

open GrotheQuad Grothe.UpperQuad Grothe.UpperChaos Grothe.UpperQuad.QuadRem
open Grothe.UpperQuad.Remainder

/-- The accepted disks of a panel, and the sum enclosure. -/
lemma panelM2_sound (hc : chatOK = true) {pos : Bool} {lo hi : ℚ} {pl : Plan}
    (hR : 0 ≤ (pl.R : ℝ)) {m2 : Ival} (h : panelM2 gList pos lo hi pl = some m2) :
    ∃ S, mem S m2 ∧ ∀ j, j < pl.m →
      devR (diskCentre lo hi pl j) pl.R < sgn pos * tcoef 0 (diskCentre lo hi pl j) ∧
      ∀ z : ℂ, ‖z - (diskCentre lo hi pl j : ℝ)‖ ≤ pl.R → ‖FextV (sgn pos) z‖ ^ 2 ≤ S := by
  unfold panelM2 at h
  -- induction over the fold: the partial sums enclose sums of nonnegative disk bounds
  suffices H : ∀ n, n ≤ pl.m → ∀ acc : Ival,
      (List.range n).foldl (fun acc j =>
        match acc, diskM2 gList pos (diskCentre lo hi pl j) pl.R pl.tau with
        | some a, some b => some (addI P a b)
        | _, _ => none) (some zeroI) = some acc →
      ∃ S, mem S acc ∧ 0 ≤ S ∧ ∀ j, j < n →
        devR (diskCentre lo hi pl j) pl.R < sgn pos * tcoef 0 (diskCentre lo hi pl j) ∧
        ∀ z : ℂ, ‖z - (diskCentre lo hi pl j : ℝ)‖ ≤ pl.R → ‖FextV (sgn pos) z‖ ^ 2 ≤ S by
    obtain ⟨S, hS, -, hall⟩ := H pl.m le_rfl m2 h
    exact ⟨S, hS, hall⟩
  intro n
  induction n with
  | zero =>
    intro _ acc hacc
    simp only [List.range_zero, List.foldl_nil, Option.some.injEq] at hacc
    subst hacc
    exact ⟨0, (mem_zeroI_iff 0).2 rfl, le_rfl, fun j hj => absurd hj (Nat.not_lt_zero _)⟩
  | succ n ih =>
    intro hn acc hacc
    rw [foldl_range_succ] at hacc
    generalize hprev : (List.range n).foldl (fun acc j =>
        match acc, diskM2 gList pos (diskCentre lo hi pl j) pl.R pl.tau with
        | some a, some b => some (addI P a b)
        | _, _ => none) (some zeroI) = prev at hacc
    cases prev with
    | none => simp at hacc
    | some a =>
      cases hd : diskM2 gList pos (diskCentre lo hi pl n) pl.R pl.tau with
      | none => rw [hd] at hacc; simp at hacc
      | some b =>
        rw [hd] at hacc
        simp only [Option.some.injEq] at hacc
        subst hacc
        obtain ⟨S, hSm, hS0, hall⟩ := ih (by omega) a hprev
        obtain ⟨hsgn, B, hBm, hB⟩ := diskM2_sound hc hR hd
        have hB0 : 0 ≤ B := (sq_nonneg _).trans (hB (diskCentre lo hi pl n : ℝ) (by simpa using hR))
        refine ⟨S + B, mem_addI P hSm hBm, by positivity, fun j hj => ?_⟩
        rcases Nat.lt_succ_iff_lt_or_eq.mp hj with hj | rfl
        · obtain ⟨h1, h2⟩ := hall j hj
          exact ⟨h1, fun z hz => (h2 z hz).trans (by linarith)⟩
        · exact ⟨hsgn, fun z hz => (hB z hz).trans (by linarith)⟩

/-- The extended vector is analytic where the profile does not vanish. -/
lemma differentiableAt_FextV {ε : ℝ} (hε : ε ≠ 0) {z : ℂ} (hv : vC z ≠ 0) :
    DifferentiableAt ℂ (FextV ε) z := by
  have h : FextV ε = fun z => (EuclideanSpace.equiv canon ℂ).symm
      (fun x : canon => Fext ε x.1.1 x.1.2.1 x.1.2.2 z) := rfl
  rw [h]
  exact (EuclideanSpace.equiv canon ℂ).symm.differentiableAt.comp z
    (differentiableAt_pi.mpr fun x => differentiableAt_Fext ε hε _ _ _ hv)

/-- On an accepted disk the profile does not vanish. -/
lemma vC_ne_zero_of_disk {ε x R : ℝ} (hR : 0 ≤ R) (hsgn : devR x R < ε * tcoef 0 x)
    (hε : ε = 1 ∨ ε = -1) {z : ℂ} (hz : ‖z - x‖ ≤ R) : vC z ≠ 0 := by
  obtain ⟨ζ, hζ⟩ := IsAlgClosed.exists_pow_nat_eq z (by norm_num : 0 < 2)
  have hd : DiskPoint ε x R z ζ := ⟨hR, hz, hζ, hε, hsgn⟩
  have h1 := hd.norm_vC_ge
  intro h0
  rw [h0, norm_zero] at h1
  linarith

/-- On an accepted disk the profile has the sign `ε` at real points. -/
lemma sign_of_disk {ε x R : ℝ} (hR : 0 ≤ R) (hsgn : devR x R < ε * tcoef 0 x)
    (hε : ε = 1 ∨ ε = -1) {s : ℝ} (hs : |s - x| ≤ R) : 0 < ε * vprof s := by
  have hz : ‖(s : ℂ) - x‖ ≤ R := by
    rw [← Complex.ofReal_sub, Complex.norm_real, Real.norm_eq_abs]; exact hs
  have hd := norm_vC_sub_le x hR hz
  rw [vC_ofReal, ← Complex.ofReal_sub, Complex.norm_real, Real.norm_eq_abs] at hd
  have habs : |ε| = 1 := by rcases hε with h | h <;> simp [h]
  have : ε * (vprof s - tcoef 0 x) ≥ -devR x R := by
    have := abs_le.mp ((abs_mul ε _).symm ▸ (by rw [habs, one_mul]; exact hd) :
      |ε * (vprof s - tcoef 0 x)| ≤ devR x R)
    linarith [this.1]
  nlinarith

lemma planGeomOK_spec {lo hi : ℚ} {pl : Plan} (h : planGeomOK lo hi pl = true) :
    1 < pl.rho ∧ 1 ≤ pl.m ∧ 0 ≤ pl.R ∧
      ((halfAxes lo hi pl).1 / pl.m) ^ 2 + (halfAxes lo hi pl).2 ^ 2 ≤ pl.R ^ 2 ∧
      0 < pl.tau ∧ pl.tau < 1 ∧ lo < hi := by
  unfold planGeomOK at h
  simp only [Bool.and_eq_true, decide_eq_true_eq] at h
  tauto

/-- Accepted plan geometry covers every point of the closed annulus image by a plan disk. -/
theorem planGeomOK_disk_cover {lo hi : ℚ} {pl : Plan} (hgeo : planGeomOK lo hi pl = true)
    {w : ℂ} (h1 : (pl.rho : ℝ)⁻¹ ≤ ‖w‖) (h2 : ‖w‖ ≤ (pl.rho : ℝ)) :
    ∃ i : ℕ, i < pl.m ∧ ‖ellipsePt lo hi w - (diskCentre lo hi pl i : ℝ)‖ ≤ (pl.R : ℝ) := by
  obtain ⟨hρ, hm, hR, hcov, -, -, hlh⟩ := planGeomOK_spec hgeo
  have hR' : (0 : ℝ) ≤ pl.R := by exact_mod_cast hR
  have hlh' : (lo : ℝ) < hi := by exact_mod_cast hlh
  have hρ' : (1 : ℝ) < pl.rho := by exact_mod_cast hρ
  obtain ⟨A, hA⟩ : ∃ A : ℝ, A = ((halfAxes lo hi pl).1 : ℝ) := ⟨_, rfl⟩
  obtain ⟨B, hB⟩ : ∃ B : ℝ, B = ((halfAxes lo hi pl).2 : ℝ) := ⟨_, rfl⟩
  have hAe : A = ((hi : ℝ) - lo) / 2 *
      (((pl.rho : ℝ) + (pl.rho : ℝ)⁻¹) / 2) := by
    rw [hA]
    unfold halfAxes
    push_cast
    ring
  have hBe : B = ((hi : ℝ) - lo) / 2 *
      (((pl.rho : ℝ) - (pl.rho : ℝ)⁻¹) / 2) := by
    rw [hB]
    unfold halfAxes
    push_cast
    ring
  have hA0 : 0 < A := by
    rw [hAe]
    have h1 : 0 < (pl.rho : ℝ) := by linarith
    have h2 : 0 < ((hi : ℝ) - lo) / 2 := by linarith
    positivity
  have hm' : 0 < pl.m := by omega
  have hcov' : (A / pl.m) ^ 2 + B ^ 2 ≤ (pl.R : ℝ) ^ 2 := by
    rw [hA, hB]
    exact_mod_cast hcov
  obtain ⟨hre, him⟩ := ellipsePt_re_im_le hlh'.le hρ' h1 h2
  rw [← hAe] at hre
  rw [← hBe] at him
  obtain ⟨i, hi', hiz⟩ := exists_disk_cover hA0 hm' hcov' hR' hre him
  refine ⟨i, hi', ?_⟩
  have hx : ((diskCentre lo hi pl i : ℚ) : ℝ) =
      ((lo : ℝ) + hi) / 2 - A + 2 * A / pl.m * (i + 1 / 2) := by
    unfold diskCentre
    rw [hA]
    push_cast
    ring
  rwa [hx]

/-- The conclusion for one panel: a sign `ε` of the profile on the panel and the remainder bound
`Ev` for every admissible rule. -/
def PanelGood (p : Grothe.UpperChaos.Q0GaussAddress.Panel) (Ev : ℝ) : Prop :=
  ∃ ε : ℝ, (ε = 1 ∨ ε = -1) ∧
    (∀ s : ℝ, s ∈ Set.Icc (p.lo : ℝ) p.hi → 0 < ε * vprof s) ∧
    ∀ (node weight : Fin p.order → ℝ), 0 < p.order →
      (∀ i, node i ∈ Set.Icc (p.lo : ℝ) p.hi) → (∀ i, 0 ≤ weight i) →
      (∀ q : Polynomial ℝ, q.natDegree < 2 * p.order →
        ∫ s in (p.lo : ℝ)..p.hi, q.eval s = ∑ i, weight i * q.eval (node i)) →
      ‖(∫ s in (p.lo : ℝ)..p.hi, FextV ε s) - ∑ i, (weight i : ℂ) • FextV ε (node i)‖ ≤ Ev

/-- **One accepted panel.** -/
theorem panelErr_sound (hc : chatOK = true) (p : Grothe.UpperChaos.Q0GaussAddress.Panel)
    (pl : Plan) {E : Ival} (h : panelErr gList p pl = some E) :
    ∃ Ev, mem Ev E ∧ PanelGood p Ev := by
  unfold panelErr at h
  dsimp only at h
  split_ifs at h with hgeo hsign
  simp only [Bool.not_eq_true', Bool.not_eq_false] at hgeo
  cases hm2 : panelM2 gList (isPos (taylorI (qI ((p.lo + p.hi) / 2)) 0)) p.lo p.hi pl with
  | none => rw [hm2] at h; simp at h
  | some m2 =>
    rw [hm2] at h
    simp only at h
    obtain ⟨hρ, -, hR, -, -, -, hlh⟩ := planGeomOK_spec hgeo
    set pos := isPos (taylorI (qI ((p.lo + p.hi) / 2)) 0) with hpos
    have hR' : (0 : ℝ) ≤ pl.R := by exact_mod_cast hR
    obtain ⟨S, hSm, hall⟩ := panelM2_sound hc hR' hm2
    set ε := sgn pos with hεdef
    have hε : ε = 1 ∨ ε = -1 := sgn_cases pos
    have hε0 : ε ≠ 0 := by rcases hε with h | h <;> rw [h] <;> norm_num
    have hlh' : (p.lo : ℝ) < p.hi := by exact_mod_cast hlh
    have hρ' : (1 : ℝ) < pl.rho := by exact_mod_cast hρ
    -- every point of the closed ellipse lies in an accepted disk
    have hdisk : ∀ w : ℂ, (pl.rho : ℝ)⁻¹ ≤ ‖w‖ → ‖w‖ ≤ pl.rho →
        ∃ j, j < pl.m ∧ ‖ellipsePt p.lo p.hi w - (diskCentre p.lo p.hi pl j : ℝ)‖ ≤ pl.R :=
      fun _ h1 h2 => planGeomOK_disk_cover hgeo h1 h2
    set Mv := Real.sqrt (bval m2) with hMv
    have hMm : mem Mv (sqrtI P (absUpper m2)) := mem_sqrtI P (bval_nonneg _) (mem_absUpper _)
    obtain ⟨hEm, hden⟩ := mem_dv (mem_mulI P (mem_qI (4 * (p.hi - p.lo)))
      (mem_mulI P hMm (mem_powB (mem_qI pl.rho⁻¹) (2 * p.order))))
      (mem_subI P (mem_one P) (mem_qI pl.rho⁻¹)) h
    refine ⟨_, hEm, ε, hε, fun s hs => ?_, ?_⟩
    · -- the sign on the real panel
      obtain ⟨hw1, hpt, -⟩ := ellipsePt_arccos hlh' hs
      obtain ⟨j, hj, hjz⟩ := hdisk _ (by rw [hw1]; exact inv_le_one_of_one_le₀ hρ'.le)
        (by rw [hw1]; exact hρ'.le)
      rw [hpt, ← Complex.ofReal_sub, Complex.norm_real, Real.norm_eq_abs] at hjz
      exact sign_of_disk hR' (hall j hj).1 hε hjz
    · intro node weight hn hnode hweight hexact
      have hfd : ∀ w : ℂ, (pl.rho : ℝ)⁻¹ ≤ ‖w‖ → ‖w‖ ≤ pl.rho →
          DifferentiableAt ℂ (FextV ε) (ellipsePt p.lo p.hi w) := by
        intro w h1 h2
        obtain ⟨j, hj, hjz⟩ := hdisk w h1 h2
        exact differentiableAt_FextV hε0 (vC_ne_zero_of_disk hR' (hall j hj).1 hε hjz)
      have hfM : ∀ w : ℂ, ‖w‖ = pl.rho → ‖FextV ε (ellipsePt p.lo p.hi w)‖ ≤ Mv := by
        intro w hw
        obtain ⟨j, hj, hjz⟩ := hdisk w
          (by rw [hw]; exact (inv_le_one_of_one_le₀ hρ'.le).trans hρ'.le) (le_of_eq hw)
        have hb := (hall j hj).2 _ hjz
        rw [hMv, ← Real.sqrt_sq (norm_nonneg (FextV ε (ellipsePt p.lo p.hi w)))]
        exact Real.sqrt_le_sqrt (hb.trans ((le_abs_self S).trans (abs_le_bval hSm)))
      have hgr := gauss_remainder_ellipse hn p.lo p.hi hlh' node weight hnode hweight hexact
        (FextV ε) hρ' hfd hfM
      refine hgr.trans (le_of_eq ?_)
      push_cast
      ring

end Grothe.UpperQuad.EllCheck
