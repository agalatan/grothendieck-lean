import Grothe.LowerAnalytic.WeightedSchurRows
import Grothe.Lower.Poly
import Mathlib.Analysis.Convex.Deriv
import Mathlib.Analysis.Calculus.Deriv.Polynomial
import Mathlib.Analysis.Calculus.Deriv.Inv

/-! # Quantitative concavity for the common Schur gate

The real-weight price is a ratio of two low-degree polynomials. The curvature
check proves nonnegativity on the whole unit interval by exact polynomial
arithmetic. Each coefficient identity is checked against the original row
headers. The small-scale lemma transfers the curvature to an actual shared
scale using restricted endpoint prices.

Agent-ID: codex-a7c4
-/

set_option warningAsError true
set_option maxHeartbeats 1000000

namespace Grothe.Lower.SharedGate.WeightedSchur.Strong
open Set Polynomial
open scoped Polynomial

noncomputable def firstNum (N D : ℝ[X]) : ℝ[X] := N.derivative*D-N*D.derivative
noncomputable def secondNum (N D : ℝ[X]) (k : ℝ) : ℝ[X] :=
  (firstNum N D).derivative*D-2*firstNum N D*D.derivative+C (2*k)*D^3

theorem concave_ratio (N D : ℝ[X]) (k : ℝ)
    (hD : ∀ x ∈ Icc (0:ℝ) 1, 0 < D.eval x)
    (hR : ∀ x ∈ Icc (0:ℝ) 1, (secondNum N D k).eval x ≤ 0) :
    ConcaveOn ℝ (Icc 0 1) (fun x : ℝ => N.eval x / D.eval x + k*x^2) := by
  let P := firstNum N D
  let R := secondNum N D k
  let f' := fun x : ℝ => P.eval x / (D.eval x)^2 + (2*k)*x
  let f'' := fun x : ℝ => R.eval x / (D.eval x)^3
  have d1 (x : ℝ) (hx : x ∈ Icc (0:ℝ) 1) :
      HasDerivAt (fun x : ℝ => N.eval x / D.eval x + k*x^2) (f' x) x := by
    have he := ((N.hasDerivAt x).div (D.hasDerivAt x) (hD x hx).ne').add (((hasDerivAt_id x).pow 2).const_mul k)
    convert he using 1
    · rfl
    · simp [f',P,firstNum]; ring
  have d2 (x : ℝ) (hx : x ∈ Icc (0:ℝ) 1) : HasDerivAt f' (f'' x) x := by
    have hd := (hD x hx).ne'
    have he := ((P.hasDerivAt x).div ((D.hasDerivAt x).pow 2) (pow_ne_zero 2 hd)).add
      ((hasDerivAt_id x).const_mul (2*k))
    convert he using 1
    · rfl
    · simp [f'',R,secondNum,← show P = firstNum N D from rfl]
      field_simp [hd]
  apply concaveOn_of_hasDerivWithinAt2_nonpos (convex_Icc 0 1)
    (f' := f') (f'' := f'') (fun x hx => (d1 x hx).continuousAt.continuousWithinAt)
    (fun x hx => (d1 x (interior_subset hx)).hasDerivWithinAt)
    (fun x hx => (d2 x (interior_subset hx)).hasDerivWithinAt)
  intro x hx
  exact div_nonpos_of_nonpos_of_nonneg (hR x (interior_subset hx)) (pow_nonneg (hD x (interior_subset hx)).le 3)

/- GENERATED: exact coefficients, all identities and signs checked below. -/
private noncomputable def NumP : ℝ[X] := C (25486093478391566438726339175567054437142341265085861987286249514766127593408401/57432876261708832930091208564309202295221912394157719763570961667924912301408256000000000) + C (82061040301854550107622087503599997617416534142999118125253613489159240034070993761709/459463010093670663440729668514473618361775299153261758108567693343399298411266048000000000)*X + C (-33044707005634289327286990306743415589527785533370435826399118015079096900326166468407/183785204037468265376291867405789447344710119661304703243427077337359719364506419200000000)*X^2 + C (1786486436564588956166578063103145851036606689681758158324477589576553908875827579/1482138742237647301421708608111205220521855803720199219705057075301288059391180800000000)*X^3
private noncomputable def DenP : ℝ[X] := C (1134556506623556701660002066578719/1298074214633706907132624082305024) + C (-4278467755460210543212456837265/5192296858534827628530496329220096)*X + C (-3813022393981357156145287865665/83076749736557242056487941267521536)*X^2
private def curvature : ℚ := (2019911/10000000000)
private def lowerDet : List ℚ := [(485519399306703248093690025426207/1298074214633706907132624082305024), (-4278467755460210543212456837265/5192296858534827628530496329220096), (-3813022393981357156145287865665/83076749736557242056487941267521536)]
private def negResidual : List ℚ := [(2354974663194080239506635428816519855652913906234033028943477955896709026307381684764873031826261230313248136191218861442553068497523908652196813847393/499479768050558757021055556766906608919775702826395384137465113540059478211162499219248976490158715385572308979425059663271676108686125649006428160000000000), (-3839902020428277278618538615767146304125578400621359383632029149008157151136909891316814396785545728192914668396811123946263411718351033126919353888321/799167628880894011233688890827050574271641124522232614619944181664095165137859998750798362384253944616915694367080095461234681773897801038410285056000000000), (577065628130516151437142411942126540848628814794532366417363245648833917715439545028582089341888817144068641824010714608842115390844475817936595490167/6393341031047152089869511126616404594173128996177860916959553453312761321102879990006386899074031556935325554936640763689877454191182408307282280448000000000), (-1970104969975892272421011463596205987712232898809298803762595097741876897910745447748221099778564532162577510228196161355471007668692720467095944991/10229345649675443343791217802586247350677006393884577467135285525300418113764607984010219038518450491096520887898625221903803926705891853291651648716800000000), (-3930653510630659066415848588807607756483457995696246506174626312451411002810991624713738757591277583/1791795793742243368445953824454755422497316397787719627919991280771033496944128756304701994617285692620800000000), (3015577200101070710934669526286334638766317226668619158695314357469782191493697493698934756578761/1433436634993794694756763059563804337997853118230175702335993024616826797555303005043761595693828554096640000000), (895839667529772635407934034815100903450690613452662823221441029958286628761344107879193669556307/22934986159900715116108208953020869407965649891682811237375888393869228760884848080700185531101256865546240000000)]

private theorem den_pos (t : ℝ) (ht : t ∈ Icc (0:ℝ) 1) : 0 < DenP.eval t := by
  have h := posOn_sound lowerDet 0 0 1 (by norm_num) (by decide +kernel) t
    (by simpa using ht.1) (by simpa using ht.2)
  have hId : evalL (lowerDet.map ((↑) : ℚ → ℝ)) t = DenP.eval t - 1/2 := by
    norm_num [lowerDet, DenP, evalL]
    ring
  rw [hId] at h
  linarith

private theorem residual_nonpos (t : ℝ) (ht : t ∈ Icc (0:ℝ) 1) :
    (secondNum NumP DenP curvature).eval t ≤ 0 := by
  have h := posOn_sound negResidual 0 0 1 (by norm_num) (by decide +kernel) t
    (by simpa using ht.1) (by simpa using ht.2)
  have hId : evalL (negResidual.map ((↑) : ℚ → ℝ)) t =
      -(secondNum NumP DenP curvature).eval t := by
    norm_num [negResidual, DenP, NumP, firstNum, secondNum, curvature, evalL,
      Polynomial.derivative_add, Polynomial.derivative_sub, Polynomial.derivative_mul,
      Polynomial.derivative_pow]
    ring
  rw [hId] at h
  exact neg_nonneg.mp h

private theorem gate8 : ofRow row08 = ⟨(151738765621418683998235043205727/628754697713201783142364789866496), (175728346950379031514358936967735/324518553658426726783156020576256), (32362747448483946609288681313501/162259276829213363391578010288128), (4869106107899183/4503599627370496), (-970093910642191/36028797018963968), (455477592604575/562949953421312)⟩ := by
  unfold ofRow
  congr 1 <;> norm_num [Row.N, Row.g1, Row.g2, Row.g3, Sym3.subDiag, ε, row08]

private theorem base8 : baseline row08 = ((-871847985293459885678348317930767121453/10141204801825835211973625643008000000000) : ℚ) := by decide +kernel

private theorem gate9 : ofRow row09 = ⟨(41603667923734369324847644630757/157188674428300445785591197466624), (361194396780051741962519312458169/649037107316853453566312041152512), (33794340759143737776000043488289/162259276829213363391578010288128), (2434737074416473/2251799813685248), (-5810073385308119/288230376151711744), (454824346522099/562949953421312)⟩ := by
  unfold ofRow
  congr 1 <;> norm_num [Row.N, Row.g1, Row.g2, Row.g3, Sym3.subDiag, ε, row09]

private theorem base9 : baseline row09 = ((-3284049124598914025207248855933902188493/40564819207303340847894502572032000000000) : ℚ) := by decide +kernel

private theorem pair_gain_repr (t : ℝ) (ht : t ∈ Icc (0:ℝ) 1) :
    pairGain t = NumP.eval t / DenP.eval t := by
  have hd := (den_pos t ht).ne'
  have hdId : det (mix (twoWeights t) (fun i ↦ ofRow (twoRows i))) = DenP.eval t := by
    simp [det, mix, Fin.sum_univ_two, twoWeights, twoRows, gate8, gate9, DenP]
    ring
  unfold pairGain gain price
  rw [hdId]
  field_simp [hd]
  simp [mix, Fin.sum_univ_two, twoWeights, twoRows, gate8, gate9, base8, base9, NumP, DenP]
  ring

theorem pairGain_strongChord {w z x : ℝ} (hw : w ∈ Icc (0:ℝ) 1)
    (hz : z ∈ Icc (0:ℝ) 1) (hx : x ∈ Icc (0:ℝ) 1) :
    (1-x)*pairGain w + x*pairGain z + (2019911/10^10)*x*(1-x)*(w-z)^2 ≤
      pairGain ((1-x)*w+x*z) := by
  have h := concave_ratio NumP DenP curvature den_pos residual_nonpos
  have he : 1-x+x=1 := by ring
  have hn := sub_nonneg.mpr hx.2
  have hm : (1-x)*w+x*z ∈ Icc (0:ℝ) 1 := (convex_Icc 0 1) hw hz hn hx.1 he
  have H := h.2 hw hz hn hx.1 he
  simp only [smul_eq_mul] at H
  rw [← pair_gain_repr w hw, ← pair_gain_repr z hz, ← pair_gain_repr _ hm] at H
  norm_num [curvature] at H ⊢
  linarith only [H]


/-- At small scales the restricted endpoint discounts finance the interpolation bonus.
At large scales it follows from the strict curvature of the shared physical gate. -/
theorem twoScale_chord {w z x τ σ cut bonus dW dZ A B : ℝ}
    (hw : w ∈ Icc (0:ℝ) 1) (hz : z ∈ Icc (0:ℝ) 1) (hx : x ∈ Icc (0:ℝ) 1)
    (hbonus : 0 ≤ bonus)
    (ordinaryW : dW ≤ (1-w)*A+w*B+pairGain w*τ^2)
    (ordinaryZ : dZ ≤ (1-z)*A+z*B+pairGain z*τ^2)
    (smallW : σ ≤ cut → dW+bonus/4 ≤ (1-w)*A+w*B+pairGain w*τ^2)
    (smallZ : σ ≤ cut → dZ+bonus/4 ≤ (1-z)*A+z*B+pairGain z*τ^2)
    (large : cut ≤ σ → bonus ≤ (2019911/10^10)*(w-z)^2*τ^2) :
    (1-x)*dW+x*dZ+bonus*x*(1-x) ≤
      (1-((1-x)*w+x*z))*A+((1-x)*w+x*z)*B+pairGain ((1-x)*w+x*z)*τ^2 := by
  let θ := (1-x)*w+x*z
  let pay := fun v : ℝ ↦ (1-v)*A+v*B+pairGain v*τ^2
  have hx0 := hx.1
  have hx1 := sub_nonneg.mpr hx.2
  have hxx := mul_nonneg hx0 hx1
  have curve := mul_le_mul_of_nonneg_right (pairGain_strongChord hw hz hx) (sq_nonneg τ)
  have hp : (1-x)*pay w+x*pay z+(2019911/10^10)*(w-z)^2*τ^2*(x*(1-x)) ≤ pay θ := by
    dsimp only [pay,θ]
    linarith only [curve]
  change (1-x)*dW+x*dZ+bonus*x*(1-x) ≤ pay θ
  apply le_trans _ hp
  by_cases hs : σ ≤ cut
  · have sw := mul_le_mul_of_nonneg_left (smallW hs) hx1
    have sz := mul_le_mul_of_nonneg_left (smallZ hs) hx0
    have small : (1-x)*dW+x*dZ+bonus/4 ≤ (1-x)*pay w+x*pay z := by
      dsimp only [pay]
      linarith only [sw, sz]
    have am : bonus*(x*(1-x)) ≤ bonus/4 := by
      have hu : x*(1-x) ≤ 1/4 := by nlinarith [sq_nonneg (x-1/2)]
      linarith only [mul_le_mul_of_nonneg_left hu hbonus]
    have rem : 0 ≤ (2019911/10^10:ℝ)*(w-z)^2*τ^2*(x*(1-x)) := by positivity
    linarith only [small,am,rem]
  · have s := mul_le_mul_of_nonneg_right (large (le_of_not_ge hs)) hxx
    have ow := mul_le_mul_of_nonneg_left ordinaryW hx1
    have oz := mul_le_mul_of_nonneg_left ordinaryZ hx0
    dsimp only [pay]
    linarith only [ow, oz, s]


end Grothe.Lower.SharedGate.WeightedSchur.Strong
