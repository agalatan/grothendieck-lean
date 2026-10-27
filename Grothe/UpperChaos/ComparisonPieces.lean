import Grothe.UpperChaos.Smoothing
import Grothe.UpperChaos.BandProj
import Grothe.UpperChaos.LocalizedComparison
import Grothe.UpperChaos.PhiBound

/-!
# The concrete error decomposition behind `ComparisonInputs` (Comparison step 1)

Write `T = F₀·P₃(φ) = F₀ + h₁ + h₂/2 + h₃/6` with `hⱼ = (iφ)ʲF₀` (`Tround_eq`). For charge-one `L²` functions
`v, c₁, c₂, c₃` (the frozen correction and the Hermite approximants of the certificate), let `X = S(F₀ + v)` and

    G_T − X = S(T − F₀ − v) = S(c₁ + c₂/2 + c₃/6 − v) + S(h₁ − c₁) + S(h₂ − c₂)/2 + S(h₃ − c₃)/6.

Each of the four smoothed sources is split by the comparison bands of its Taylor power (`pw`): the bands of one
power partition the total degrees `≥ 1`, and the sources have no degree-0 mode (they are charge one, hence of mean
zero, and `S` preserves the mean). This gives the 18 pieces `bandProj b_k (S src_{pw k})` (`piece`). They sum to
`G_T − X` (`difference_pieces`) and each is supported in its band (`energy_bandProj_eq_zero`).
So `ComparisonInputs (G_T) (X)` holds as soon as the 18 explicit norm bounds `‖piece k‖ ≤ error_k` hold
(`comparisonInputs_of_norms`).
-/

open MeasureTheory Complex
open scoped InnerProductSpace

namespace Grothe.UpperChaos

noncomputable section

/-- Charge-one functions in `L²(mu2)`. -/
structure ChargeFn (f : ℂ × ℂ → ℂ) : Prop where
  meas : Measurable f
  memLp : MemLp f 2 mu2
  rot : ∀ c u, ‖c‖ = 1 → f (rot2 c u) = c * f u

namespace ChargeFn

variable {f g : ℂ × ℂ → ℂ}

lemma add (hf : ChargeFn f) (hg : ChargeFn g) : ChargeFn fun u => f u + g u :=
  ⟨hf.meas.add hg.meas, hf.memLp.add hg.memLp, fun c u hc => by rw [hf.rot c u hc, hg.rot c u hc]; ring⟩

lemma sub (hf : ChargeFn f) (hg : ChargeFn g) : ChargeFn fun u => f u - g u :=
  ⟨hf.meas.sub hg.meas, hf.memLp.sub hg.memLp, fun c u hc => by rw [hf.rot c u hc, hg.rot c u hc]; ring⟩

lemma div_const (hf : ChargeFn f) (a : ℂ) : ChargeFn fun u => f u / a :=
  ⟨hf.meas.div_const a, by simpa [div_eq_mul_inv, mul_comm] using hf.memLp.const_mul a⁻¹,
    fun c u hc => by rw [hf.rot c u hc]; ring⟩

/-- **Charge-one functions have mean zero** (rotate by `−1`). -/
lemma integral_eq_zero (hf : ChargeFn f) : ∫ u, f u ∂mu2 = 0 := by
  have hc : ‖(-1 : ℂ)‖ = 1 := by simp
  have hm : AEStronglyMeasurable f (mu2.map (rot2 (-1))) := hf.meas.aestronglyMeasurable
  have h := integral_map (by unfold rot2; fun_prop : AEMeasurable (rot2 (-1)) mu2) hm
  rw [map_rot2 hc] at h
  simp only [hf.rot _ _ hc, neg_one_mul, integral_neg] at h
  linear_combination h / 2

end ChargeFn

/-! ### The Taylor split of the rounding -/

/-- `hⱼ = (iφ)ʲ F₀`. -/
def hpow (j : ℕ) (u : ℂ × ℂ) : ℂ := (I * (phiT u : ℂ)) ^ j * F0 u

lemma Tround_eq (u : ℂ × ℂ) : Tround u = F0 u + hpow 1 u + hpow 2 u / 2 + hpow 3 u / 6 := by
  have h2 : I ^ 2 = -1 := I_sq
  have h3 : I ^ 3 = -I := by rw [pow_succ, h2]; ring
  simp only [Tround, P3, hpow, mul_pow, h2, h3, pow_one]
  ring

lemma chargeFn_hpow (hφ : PhiBound) (j : ℕ) : ChargeFn (hpow j) := by
  have hb : ∀ u, ‖hpow j u‖ ≤ 1 := by
    intro u
    have hφu : |phiT u| ≤ 1 := by
      have := hφ u; rw [← sq_le_one_iff_abs_le_one]; linarith
    rw [hpow, norm_mul, norm_pow, norm_mul, norm_I, one_mul, Complex.norm_real, Real.norm_eq_abs]
    calc |phiT u| ^ j * ‖F0 u‖ ≤ 1 * 1 :=
          mul_le_mul (pow_le_one₀ (abs_nonneg _) hφu) (Haag.norm_ph_le _) (norm_nonneg _) zero_le_one
      _ = 1 := one_mul 1
  have hm : Measurable (hpow j) := by
    unfold hpow
    exact ((measurable_const.mul (Complex.measurable_ofReal.comp continuous_phiT.measurable)).pow_const j).mul
      measurable_F0
  refine ⟨hm, MemLp.of_bound hm.aestronglyMeasurable 1 (Filter.Eventually.of_forall hb), fun c u hc => ?_⟩
  simp only [hpow, phiT_rot2 hc, F0_rot2 hc]
  ring

lemma chargeFn_F0 (hφ : PhiBound) : ChargeFn F0 := by
  have e : hpow 0 = F0 := by ext u; simp [hpow]
  rw [← e]; exact chargeFn_hpow hφ 0

/-! ### The four sources and the 18 pieces -/

variable {v c₁ c₂ c₃ : ℂ × ℂ → ℂ}

/-- The four sources: the rounding remainder and the three Taylor errors. -/
def srcP (v c₁ c₂ c₃ : ℂ × ℂ → ℂ) : Fin 4 → ℂ × ℂ → ℂ
  | 0 => fun u => c₁ u + c₂ u / 2 + c₃ u / 6 - v u
  | 1 => fun u => hpow 1 u - c₁ u
  | 2 => fun u => (hpow 2 u - c₂ u) / 2
  | 3 => fun u => (hpow 3 u - c₃ u) / 6

lemma sum_srcP (u : ℂ × ℂ) : ∑ p, srcP v c₁ c₂ c₃ p u = Tround u - (F0 u + v u) := by
  simp only [Fin.sum_univ_four, srcP, Tround_eq]
  ring

lemma chargeFn_srcP (hφ : PhiBound) (hv : ChargeFn v) (h₁ : ChargeFn c₁) (h₂ : ChargeFn c₂)
    (h₃ : ChargeFn c₃) : ∀ p, ChargeFn (srcP v c₁ c₂ c₃ p)
  | 0 => ((h₁.add (h₂.div_const 2)).add (h₃.div_const 6)).sub hv
  | 1 => (chargeFn_hpow hφ 1).sub h₁
  | 2 => ((chargeFn_hpow hφ 2).sub h₂).div_const 2
  | 3 => ((chargeFn_hpow hφ 3).sub h₃).div_const 6

/-- The Taylor source refined by each comparison band (the order of `comparisonBands`). -/
def pw (k : ComparisonIndex) : Fin 4 :=
  if k.val = 0 then 0 else if k.val ≤ 7 then 1 else if k.val ≤ 12 then 2 else 3

/-! ### The bands of one source partition the degrees `≥ 1` -/

lemma contains_iff (b : GrotheKernel.ComparisonBand) (n m : ℕ) :
    b.contains n m = true ↔ b.lo < n + m ∧ (b.hi = 0 ∨ n + m ≤ b.hi) := by
  simp [GrotheKernel.ComparisonBand.contains]

lemma bands_disjoint : ∀ k l : ComparisonIndex, pw k = pw l → k ≠ l →
    ((comparisonBand k).hi ≠ 0 ∧ (comparisonBand k).hi ≤ (comparisonBand l).lo) ∨
      ((comparisonBand l).hi ≠ 0 ∧ (comparisonBand l).hi ≤ (comparisonBand k).lo) := by
  decide

lemma band_unique {k l : ComparisonIndex} (hkl : pw k = pw l) {n m : ℕ}
    (hk : (comparisonBand k).contains n m = true) (hl : (comparisonBand l).contains n m = true) : k = l := by
  by_contra hne
  rw [contains_iff] at hk hl
  rcases bands_disjoint k l hkl hne with h | h <;> omega

/-- The band of source `p` containing total degree `d ≥ 1`. -/
def bandOf (p : Fin 4) (d : ℕ) : ComparisonIndex :=
  match p with
  | 0 => ⟨0, by decide⟩
  | 1 => if d ≤ 51 then ⟨1, by decide⟩ else if d ≤ 101 then ⟨2, by decide⟩ else if d ≤ 151 then ⟨3, by decide⟩ else if d ≤ 161 then ⟨4, by decide⟩
      else if d ≤ 171 then ⟨5, by decide⟩ else if d ≤ 181 then ⟨6, by decide⟩ else ⟨7, by decide⟩
  | 2 => if d ≤ 51 then ⟨8, by decide⟩ else if d ≤ 71 then ⟨9, by decide⟩ else if d ≤ 81 then ⟨10, by decide⟩ else if d ≤ 91 then ⟨11, by decide⟩ else ⟨12, by decide⟩
  | 3 => if d ≤ 11 then ⟨13, by decide⟩ else if d ≤ 21 then ⟨14, by decide⟩ else if d ≤ 31 then ⟨15, by decide⟩ else if d ≤ 51 then ⟨16, by decide⟩ else ⟨17, by decide⟩

/-- The lower ends of the comparison bands. -/
def loT : ℕ → ℕ
  | 0 => 0
  | 1 => 0
  | 2 => 51
  | 3 => 101
  | 4 => 151
  | 5 => 161
  | 6 => 171
  | 7 => 181
  | 8 => 0
  | 9 => 51
  | 10 => 71
  | 11 => 81
  | 12 => 91
  | 13 => 0
  | 14 => 11
  | 15 => 21
  | 16 => 31
  | _ => 51

/-- The upper ends (`0` = no upper end). -/
def hiT : ℕ → ℕ
  | 0 => 0
  | 1 => 51
  | 2 => 101
  | 3 => 151
  | 4 => 161
  | 5 => 171
  | 6 => 181
  | 7 => 0
  | 8 => 51
  | 9 => 71
  | 10 => 81
  | 11 => 91
  | 12 => 0
  | 13 => 11
  | 14 => 21
  | 15 => 31
  | 16 => 51
  | _ => 0

lemma band_lo : ∀ k : ComparisonIndex, (comparisonBand k).lo = loT k.val := by decide

lemma band_hi : ∀ k : ComparisonIndex, (comparisonBand k).hi = hiT k.val := by decide

lemma bandOf_spec (p : Fin 4) {n m : ℕ} (h : 1 ≤ n + m) :
    pw (bandOf p (n + m)) = p ∧ (comparisonBand (bandOf p (n + m))).contains n m = true := by
  rw [contains_iff, band_lo, band_hi]
  fin_cases p <;> simp only [bandOf] <;> (try split_ifs) <;> simp [pw, loT, hiT] <;> omega

/-! ### The pieces and the decomposition -/

lemma memLp_Tround (hφ : PhiBound) : MemLp Tround 2 mu2 :=
  MemLp.of_bound measurable_Tround.aestronglyMeasurable 1 (Filter.Eventually.of_forall (norm_Tround_le hφ))

lemma bideg_eq_idx0 {i : Idx2} (h : (bideg i).1 + (bideg i).2 = 0) : i = idx0 := by
  obtain ⟨⟨a, b⟩, ⟨c, d⟩⟩ := i
  simp only [bideg] at h
  have ha : a = 0 := by omega
  have hb : b = 0 := by omega
  have hc : c = 0 := by omega
  have hd : d = 0 := by omega
  subst ha hb hc hd; rfl

section Pieces

variable (hφ : PhiBound) (hv : ChargeFn v) (h₁ : ChargeFn c₁) (h₂ : ChargeFn c₂) (h₃ : ChargeFn c₃)

/-- The four smoothed sources in `L²`. -/
def srcL (p : Fin 4) : Lp ℂ 2 mu2 :=
  smoothOp ((chargeFn_srcP hφ hv h₁ h₂ h₃ p).memLp.toLp (srcP v c₁ c₂ c₃ p))

/-- **The 18 pieces**: the band of comparison index `k` cut out of the smoothed source it refines. -/
def piece (k : ComparisonIndex) : Lp ℂ 2 mu2 := bandProj (comparisonBand k) (srcL hφ hv h₁ h₂ h₃ (pw k))

/-- The smoothed truncation `X = S(F₀ + v)`. -/
def Xfun (v : ℂ × ℂ → ℂ) : ℂ × ℂ → ℂ := smoothFn fun u => F0 u + v u

lemma chargeFn_F0v (hφ : PhiBound) (hv : ChargeFn v) : ChargeFn fun u => F0 u + v u := (chargeFn_F0 hφ).add hv

lemma memLp_Xfun (hφ : PhiBound) (hv : ChargeFn v) : MemLp (Xfun v) 2 mu2 :=
  memLp_smoothFn (chargeFn_F0v hφ hv).meas (chargeFn_F0v hφ hv).memLp

lemma Xfun_rot2 (hφ : PhiBound) (hv : ChargeFn v) : ∀ c u, ‖c‖ = 1 → Xfun v (rot2 c u) = c * Xfun v u :=
  fun _ u hc => smoothFn_rot2 (chargeFn_F0v hφ hv).meas (chargeFn_F0v hφ hv).rot hc u

/-- The sources have no constant mode. -/
lemma inner_idx0_srcL (p : Fin 4) : ⟪hvec2 idx0, srcL hφ hv h₁ h₂ h₃ p⟫_ℂ = 0 := by
  rw [srcL, inner_idx0_smoothOp, inner_hvec2_idx0]
  rw [integral_congr_ae (chargeFn_srcP hφ hv h₁ h₂ h₃ p).memLp.coeFn_toLp]
  exact (chargeFn_srcP hφ hv h₁ h₂ h₃ p).integral_eq_zero

/-- **The bands of one source sum to it.** -/
lemma sum_pieces_fiber (p : Fin 4) :
    ∑ k ∈ Finset.univ.filter (fun k => pw k = p), piece hφ hv h₁ h₂ h₃ k = srcL hφ hv h₁ h₂ h₃ p := by
  classical
  rw [Finset.sum_congr rfl (g := fun k => projOn (bandModes (comparisonBand k)) (srcL hφ hv h₁ h₂ h₃ p))
    (fun k hk => by rw [piece, (Finset.mem_filter.1 hk).2]; rfl)]
  refine sum_projOn _ (fun k => bandModes (comparisonBand k)) _ (fun i hi => ?_) (fun i k hk l hl hik hil => ?_)
  · have hd : 1 ≤ (bideg i).1 + (bideg i).2 := by
      by_contra h0
      exact hi (by rw [bideg_eq_idx0 (i := i) (by omega)]; exact inner_idx0_srcL hφ hv h₁ h₂ h₃ p)
    obtain ⟨hpw, hc⟩ := bandOf_spec p hd
    refine ⟨bandOf p ((bideg i).1 + (bideg i).2), ⟨Finset.mem_filter.2 ⟨Finset.mem_univ _, hpw⟩, hc⟩,
      fun l ⟨hl, hil⟩ => band_unique ((Finset.mem_filter.1 hl).2.trans hpw.symm) hil hc⟩
  · exact band_unique ((Finset.mem_filter.1 hk).2.trans (Finset.mem_filter.1 hl).2.symm) hik hil

/-- **`G_T − X` is the sum of the 18 pieces.** -/
theorem difference_pieces :
    (memLp_GT hφ).toLp GT - (memLp_Xfun hφ hv).toLp (Xfun v) = ∑ k, piece hφ hv h₁ h₂ h₃ k := by
  classical
  rw [← Finset.sum_fiberwise Finset.univ pw (piece hφ hv h₁ h₂ h₃)]
  simp only [sum_pieces_fiber]
  have hG : (memLp_GT hφ).toLp GT = smoothOp ((memLp_Tround hφ).toLp Tround) :=
    (smoothOp_toLp' measurable_Tround (memLp_Tround hφ)).symm
  have hX : (memLp_Xfun hφ hv).toLp (Xfun v) =
      smoothOp ((chargeFn_F0v hφ hv).memLp.toLp fun u => F0 u + v u) :=
    (smoothOp_toLp' (chargeFn_F0v hφ hv).meas (chargeFn_F0v hφ hv).memLp).symm
  rw [hG, hX, ← map_sub]
  simp only [srcL, ← map_sum]
  congr 1
  refine Lp.ext ?_
  filter_upwards [(memLp_Tround hφ).coeFn_toLp, (chargeFn_F0v hφ hv).memLp.coeFn_toLp,
    Lp.coeFn_sub ((memLp_Tround hφ).toLp Tround) ((chargeFn_F0v hφ hv).memLp.toLp fun u => F0 u + v u),
    Lp.coeFn_add ((chargeFn_srcP hφ hv h₁ h₂ h₃ 0).memLp.toLp (srcP v c₁ c₂ c₃ 0))
      ((chargeFn_srcP hφ hv h₁ h₂ h₃ 1).memLp.toLp (srcP v c₁ c₂ c₃ 1)),
    Lp.coeFn_add ((chargeFn_srcP hφ hv h₁ h₂ h₃ 0).memLp.toLp (srcP v c₁ c₂ c₃ 0) +
      (chargeFn_srcP hφ hv h₁ h₂ h₃ 1).memLp.toLp (srcP v c₁ c₂ c₃ 1))
      ((chargeFn_srcP hφ hv h₁ h₂ h₃ 2).memLp.toLp (srcP v c₁ c₂ c₃ 2)),
    Lp.coeFn_add ((chargeFn_srcP hφ hv h₁ h₂ h₃ 0).memLp.toLp (srcP v c₁ c₂ c₃ 0) +
      (chargeFn_srcP hφ hv h₁ h₂ h₃ 1).memLp.toLp (srcP v c₁ c₂ c₃ 1) +
      (chargeFn_srcP hφ hv h₁ h₂ h₃ 2).memLp.toLp (srcP v c₁ c₂ c₃ 2))
      ((chargeFn_srcP hφ hv h₁ h₂ h₃ 3).memLp.toLp (srcP v c₁ c₂ c₃ 3)),
    (chargeFn_srcP hφ hv h₁ h₂ h₃ 0).memLp.coeFn_toLp, (chargeFn_srcP hφ hv h₁ h₂ h₃ 1).memLp.coeFn_toLp,
    (chargeFn_srcP hφ hv h₁ h₂ h₃ 2).memLp.coeFn_toLp, (chargeFn_srcP hφ hv h₁ h₂ h₃ 3).memLp.coeFn_toLp]
    with u hT hF hsub ha1 ha2 ha3 h0 h1 h2 h3
  rw [Fin.sum_univ_four, hsub, Pi.sub_apply, hT, hF, ha3, Pi.add_apply, ha2, Pi.add_apply, ha1, Pi.add_apply,
    h0, h1, h2, h3, ← sum_srcP (v := v) (c₁ := c₁) (c₂ := c₂) (c₃ := c₃) u, Fin.sum_univ_four]

/-- **`ComparisonInputs` from the 18 explicit norm bounds.** -/
theorem comparisonInputs_of_norms
    (hnorm : ∀ k, ‖piece hφ hv h₁ h₂ h₃ k‖ ≤ ((comparisonBand k).error : ℝ)) :
    ComparisonInputs ((memLp_GT hφ).toLp GT) ((memLp_Xfun hφ hv).toLp (Xfun v)) :=
  ⟨piece hφ hv h₁ h₂ h₃, difference_pieces hφ hv h₁ h₂ h₃, hnorm,
    fun k p hp => energy_bandProj_eq_zero _ _ p hp⟩

end Pieces

/-- **The sharp upper bound from the 18 norm bounds of an explicit decomposition**: for charge-one `L²` functions
`v, c₁, c₂, c₃` (the frozen correction and the Hermite approximants of the certificate), the remaining inputs are the
18 norm bounds of the explicit pieces and the table accuracy of `X = S(F₀ + v)`. -/
theorem fresh_upper_pieces (hv : ChargeFn v) (h₁ : ChargeFn c₁) (h₂ : ChargeFn c₂) (h₃ : ChargeFn c₃)
    (hnorm : ∀ k, ‖piece phiBound hv h₁ h₂ h₃ k‖ ≤ ((comparisonBand k).error : ℝ))
    (hclose : ∑ p ∈ Grothe.Upper.headIdx 501,
      |energy ((memLp_Xfun phiBound hv).toLp (Xfun v)) p - (Grothe.Upper.energyTable p : ℝ)|
      ≤ (Grothe.Upper.energyErrQ : ℝ)) :
    IsGrothendieckBound (500000000000000000 / 355973699864771491) :=
  fresh_upper_rounder (memLp_Xfun phiBound hv) (Xfun_rot2 phiBound hv)
    (comparisonInputs_of_norms phiBound hv h₁ h₂ h₃ hnorm) hclose

end

end Grothe.UpperChaos
