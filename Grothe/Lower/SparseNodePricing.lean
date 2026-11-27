import Grothe.Lower.CutDilation
import Grothe.Lower.Rows

namespace Grothe.Lower.SparseStein
open MeasureTheory

/-- Rational offset of a list of nonnegatively weighted plain cuts after scaling the radius by d. -/
def offsetQ (vs : List ℚ) (d : ℚ) (cs : List (ℚ × List ℚ)) : ℚ :=
  (cs.map fun c =>
    let β := c.2.getD vs.length 0
    let α := c.2.getD (vs.length + 1) 0
    c.1 * (β^2 - (β + (d^2-1)*α)^2 + 2*α^2*(d^4-1)/3)).sum

private theorem last_two (n : ℕ) (z : List ℚ) (h : z.length = n + 2) :
    z.take n ++ [z.getD n 0, z.getD (n+1) 0] = z := by
  induction n generalizing z with
  | zero =>
    rcases z with _ | ⟨b,z⟩ <;> simp at h
    rcases z with _ | ⟨a,z⟩ <;> simp at h
    simp [h]
  | succ n ih =>
    rcases z with _ | ⟨a,z⟩ <;> simp at h
    simpa using congrArg (List.cons a) (ih z h)

variable {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ] {U : Ω → ℝ}

theorem cutSum_dilated (cuts : SteinCut μ U) (vs : List ℚ) (hm : meshOK 0 vs = true)
    (d : ℚ) (hd : 0 < d) : ∀ (cs : List (ℚ × List ℚ)),
    (∀ c ∈ cs, 0 ≤ c.1 ∧ c.2.length = vs.length+2) →
    Integrable (fun ω => cutSum vs cs (d*√(U ω))) μ ∧
      (offsetQ vs d cs : ℝ) ≤ ∫ ω, cutSum vs cs (d*√(U ω)) ∂μ
  | [], _ => by simp [cutSum,offsetQ]
  | c :: cs, h => by
    obtain ⟨hc,hlen⟩ := h c (List.mem_cons_self ..)
    have hcv : (c.2.take vs.length).length = vs.length := by simp [hlen]
    have hx := cuts.integral_cutG_dilate vs (c.2.take vs.length) hcv hm d
      (c.2.getD vs.length 0) (c.2.getD (vs.length+1) 0) hd
    rw [last_two _ _ hlen] at hx
    obtain ⟨hi,hp⟩ := hx
    obtain ⟨hri,hrp⟩ := cutSum_dilated cuts vs hm d hd cs
      (fun z hz => h z (List.mem_cons_of_mem _ hz))
    have he : (fun ω => cutSum vs (c :: cs) (d*√(U ω))) =
      fun ω => (c.1:ℝ) * cutG vs c.2 (d*√(U ω)) + cutSum vs cs (d*√(U ω)) := rfl
    rw [he]
    refine ⟨(hi.const_mul _).add hri, ?_⟩
    rw [integral_add (hi.const_mul _) hri, integral_const_mul]
    have hcast : (offsetQ vs d (c::cs):ℝ) =
        c.1 * cutDilationOffset ((d:ℝ)^2) (c.2.getD vs.length 0) (c.2.getD (vs.length+1) 0)
          + (offsetQ vs d cs:ℝ) := by
      simp [offsetQ, cutDilationOffset, ← pow_mul]
    rw [hcast]
    exact add_le_add (mul_le_mul_of_nonneg_left hp (Rat.cast_nonneg.mpr hc)) hrp

/-- Cap for a transported polynomial at a specified fourth excess and upper square root. -/
def nodeCostQ (vs : List ℚ) (bank : List (List ℚ)) (n : SNode) (d s root : ℚ) : ℚ :=
  n.y.a0 + n.y.a1*(93/100)*d + n.y.a2*d^2 + n.y.a4*(2+s)*d^4
    + n.y.a6*(6+9*s+C6*s*root)*d^6 - offsetQ vs d (nodeCutList bank n)

private theorem moment_price (hM : Moments μ U x) (hr : ∫ ω, √(U ω) ∂μ ≤ 93/100)
    (a0 a1 a2 a4 a6 : ℝ) (h1 : 0 ≤ a1) (h6 : 0 ≤ a6) :
    Integrable (fun ω => a0 + a1*√(U ω) + a2*U ω + a4*U ω^2 + a6*U ω^3) μ ∧
    ∫ ω, (a0 + a1*√(U ω) + a2*U ω + a4*U ω^2 + a6*U ω^3) ∂μ ≤
      a0 + a1*(93/100) + a2 + a4*(2+x^2) + a6*(6+9*x^2+C6*x^3) := by
  have hA : Integrable (fun ω => a0 + a1 * √(U ω)) μ := (integrable_const (μ:=μ) a0).add (hM.ih.const_mul a1)
  have hB : Integrable (fun ω => a0 + a1 * √(U ω) + a2*U ω) μ := hA.add (hM.i1.const_mul a2)
  have hC : Integrable (fun ω => a0 + a1 * √(U ω) + a2*U ω + a4*U ω^2) μ := hB.add (hM.i2.const_mul a4)
  refine ⟨hC.add (hM.i3.const_mul a6), ?_⟩
  rw [integral_add hC (hM.i3.const_mul a6),integral_add hB (hM.i2.const_mul a4),
    integral_add hA (hM.i1.const_mul a2),integral_add (integrable_const a0) (hM.ih.const_mul a1),
    integral_const_mul,integral_const_mul,integral_const_mul,integral_const_mul,
    integral_const,hM.m1,hM.m2,probReal_univ,one_smul]
  nlinarith only [mul_le_mul_of_nonneg_left hr h1,mul_le_mul_of_nonneg_left hM.m3 h6]

/-- Integrate a checked ordinary node at a new physical scale against its actual law. -/
theorem eval_node_at (hM : Moments μ U x) (cuts : SteinCut μ U)
    (hr : ∫ ω, √(U ω) ∂μ ≤ 93/100)
    (hcap : CapsHold Ψ caps smax) (vs : List ℚ) (bank : List (List ℚ)) (n : SNode)
    (hm : meshOK 0 vs = true) (hn : checkNode caps smax vs (bank.map (cutPolys vs)) n = true)
    (hz : ∀ c ∈ nodeCutList bank n, c.2.length = vs.length+2) (d : ℚ) (hd : 0<d)
    (hi : Integrable (fun ω => Ψ (n.sigma*(d*√(U ω)))) μ) :
    ∫ ω, Ψ (n.sigma*(d*√(U ω))) ∂μ ≤
      n.y.a0+n.y.a1*(93/100:ℝ)*d+n.y.a2*(d:ℝ)^2+n.y.a4*(2+x^2)*(d:ℝ)^4+
       n.y.a6*(6+9*x^2+C6*x^3)*(d:ℝ)^6 - (offsetQ vs d (nodeCutList bank n):ℝ) := by
  obtain ⟨hP,h1,h6,hw,-⟩ := node_sound hcap vs bank n hn
  obtain ⟨hCi,hCb⟩ := cutSum_dilated cuts vs hm d hd _ (fun c hc => ⟨hw c hc,hz c hc⟩)
  have hd' : (0:ℝ) ≤ d := (Rat.cast_pos.mpr hd).le
  obtain ⟨hYi,hYb⟩ := moment_price hM hr n.y.a0 (n.y.a1*d) (n.y.a2*(d:ℝ)^2)
    (n.y.a4*(d:ℝ)^4) (n.y.a6*(d:ℝ)^6) (mul_nonneg (Rat.cast_nonneg.mpr h1) hd')
    (mul_nonneg (Rat.cast_nonneg.mpr h6) (by positivity))
  have hle := integral_mono (hi.add hCi) hYi fun ω => by
    have hh := hP (d*√(U ω)) (mul_nonneg hd' (Real.sqrt_nonneg _))
    rwa [mpoly_at n.y d (√(U ω)) (U ω) (Real.sq_sqrt (hM.nonneg ω))] at hh
  simp only [Pi.add_apply] at hle
  rw [integral_add hi hCi] at hle
  linarith only [hle,hCb,hYb]


/-- Finite rational comparison at both shape endpoints. -/
def priceOK (vs : List ℚ) (bank : List (List ℚ)) (n : SNode)
    (d lo hi rl rh cap : ℚ) : Bool :=
  decide (0≤lo ∧ 0≤rl ∧ 0≤rh ∧ lo≤rl^2 ∧ hi≤rh^2 ∧
    nodeCostQ vs bank n d lo rl ≤ cap ∧ nodeCostQ vs bank n d hi rh ≤ cap)

theorem shape_node_le (hM : Moments μ U x) (cuts : SteinCut μ U) (hr : ∫ ω, √(U ω) ∂μ ≤ 93/100)
    (hcap : CapsHold Ψ caps smax) (vs : List ℚ) (bank : List (List ℚ)) (n : SNode)
    (hm : meshOK 0 vs = true) (hn : checkNode caps smax vs (bank.map (cutPolys vs)) n = true)
    (hz : ∀ c ∈ nodeCutList bank n, c.2.length = vs.length+2) (d lo hi rl rh cap : ℚ) (hd : 0<d)
    (hcheck : priceOK vs bank n d lo hi rl rh cap = true) (hlo : (lo:ℝ)≤x^2) (hhi : x^2≤(hi:ℝ))
    (hint : Integrable (fun ω => Ψ (n.sigma*(d*√(U ω)))) μ) :
    ∫ ω, Ψ (n.sigma*(d*√(U ω))) ∂μ ≤ cap := by
  simp only [priceOK, decide_eq_true_eq] at hcheck
  obtain ⟨hl,hrl,hrh,hls,hhs,hpl,hph⟩ := hcheck
  have h := eval_node_at hM cuts hr hcap vs bank n hm hn hz d hd hint
  obtain ⟨-, -, h6, -⟩ := node_sound hcap vs bank n hn
  let A : ℝ := n.y.a4*(d:ℝ)^4 + 9*n.y.a6*(d:ℝ)^6
  let B : ℝ := n.y.a6*(C6:ℝ)*(d:ℝ)^6
  let C : ℝ := n.y.a0 + n.y.a1*(93/100:ℝ)*d + n.y.a2*(d:ℝ)^2 + 2*n.y.a4*(d:ℝ)^4
    + 6*n.y.a6*(d:ℝ)^6 - (offsetQ vs d (nodeCutList bank n):ℝ)
  have h6' : (0:ℝ)≤n.y.a6 := Rat.cast_nonneg.mpr h6
  have hC6 : (0:ℝ)≤C6 := by norm_num [C6]
  have hb : 0≤B := by dsimp [B]; positivity
  have lower : (0:ℝ)≤lo := Rat.cast_nonneg.mpr hl
  have upper : (0:ℝ)≤hi := (sq_nonneg x).trans hhi
  have hspl := Real.sq_sqrt lower
  have hsph := Real.sq_sqrt upper
  have hxl : √(lo:ℝ)≤x := by nlinarith only [hlo,hspl,hM.x0,Real.sqrt_nonneg (lo:ℝ)]
  have hxh : x≤√(hi:ℝ) := by nlinarith only [hhi,hsph,hM.x0,Real.sqrt_nonneg (hi:ℝ)]
  have hmain : ∫ ω, Ψ (n.sigma*(d*√(U ω))) ∂μ ≤ C+A*x^2+B*x^3 := by
    dsimp [A,B,C]; linarith only [h]
  have ep (v r : ℚ) (hv : (0:ℝ)≤v) (hp : 0≤r) (hvr : v≤r^2)
      (hc : nodeCostQ vs bank n d v r ≤ cap) : C+A*(√(v:ℝ))^2+B*(√(v:ℝ))^3 ≤ cap := by
    have hs := Real.sq_sqrt hv
    have hsqr : √(v:ℝ)≤r := Real.sqrt_le_iff.mpr ⟨Rat.cast_nonneg.mpr hp,by exact_mod_cast hvr⟩
    have h1 : B*(v:ℝ)*√(v:ℝ)≤ B*v*r := mul_le_mul_of_nonneg_left hsqr (mul_nonneg hb hv)
    have hn : C+A*(v:ℝ)+B*v*r ≤ cap := by
      have ht := (Rat.cast_le.mpr hc : (nodeCostQ vs bank n d v r : ℝ) ≤ cap)
      simp only [nodeCostQ] at ht
      push_cast at ht
      dsimp [C,A,B]
      linarith only [ht]
    rw [pow_succ _ 2,hs]
    linarith only [hn,h1]
  have hh := cubic_endpoint_le A B x (√(lo:ℝ)) (√(hi:ℝ)) hb (Real.sqrt_nonneg _) hxl hxh
  rcases le_max_iff.mp hh with hleft | hright
  · linarith only [hmain,hleft,ep lo rl lower hrl hls hpl]
  · linarith only [hmain,hright,ep hi rh upper hrh hhs hph]


end Grothe.Lower.SparseStein
