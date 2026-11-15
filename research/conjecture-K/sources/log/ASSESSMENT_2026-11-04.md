<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ASSESSMENT_2026-11-04.md (file dated 2026-11-05). Only this line was added. -->
# Where a dramatically better bound can come from — assessment, 4 November 2026 (claude-b9ee)

Sources read this evening: HJM complex (arXiv:2609.25462, both bounds), HJM primal/dual real (2610.10477), Saha–Li–Xue–
Chaudhuri–Klivans–Kothari–Meka (2608.11158, 6π/11 and limiting Krivine schemes), Guo–Fang–Lu (2609.07000), Heilman real
upper (2606.00247), Haagerup 1987 (Downloads), Janson *Gaussian Hilbert Spaces* (ch. 5 hypercontractivity, ch. 3 Wick),
our `WHY_THE_GAP.md`, `attack_analysis.pdf`, `PLAN_1402.md`, manuscript ch4/ch5/ch17, `pipeline/deg5`, `pipeline/d5`,
the primal/dual engine notes (steps 15–16, runs A/B3), and the Lean statements of both sides.

## 1. The numbers that decide the strategy

| quantity | value | status |
|---|---|---|
| lower bound (Lean, mod node caps) | 1.401697117301 | rows 12–15 landing |
| ceiling of the cubic witness `P10 − εP21`, any certificate | 1.402258 (ε ≈ 0.7564) | proved model |
| ceiling of any game of degree ≤ 5 / ≤ 7 | 1.4036705 / 1.4044895 | proved (chirps) |
| numerical value of the best degree-5 / 7 / 9 game | 1.403648 / 1.404111 / ≈ 1.40443 | model, floating |
| Haagerup's conjectured value 1/γ† | 1.4045759 | conjecture |
| upper bound (Lean, three-band, mod inputs) | 1.40459988 | #307 landed |
| upper bound, sharp target | 1.404598149 | fourteen inputs |
| ceiling of our rounding family (alternating ideal) | 1.4045955 | proved screen |
| HJM upper / Haagerup upper | 1.404899 / 1.404909 | published |

**Upper side: no dramatic improvement exists.** Our bound is 2.2·10⁻⁵ above 1/γ†; the one-coordinate barrier is exactly
γ† (numerically, all starts), two-coordinate vortex roundings gain ≤ 5·10⁻⁶ in the screening functional and lose it through
the transfer, mixtures never help, and a primal search with degree-5 pools gives nothing near the master slope. Unless
Haagerup's conjecture is false by more than 10⁻⁵ (no evidence anywhere), the upper side is closure work: proving the
three hypotheses of #307 (quad checker milestones 4–5, the three inner products, the low bands).

**Lower side: 2.9·10⁻³ of room, in three steps gated by the witness degree.** The cubic witness can give at most
+5.6·10⁻⁴; a degree-5 game +1.9·10⁻³; degree 7 +2.7·10⁻³. Each step needs a *certified* value of the scalar norm
`N(λ) = sup_n ‖Σ λ_k P_{k+1,k}‖_{∞→1}` for complex unimodular responses.

## 2. The single obstacle, stated precisely

For unimodular f, g write h = (f+g)/2, k = (f−g)/2; then h = e^{iα}cos θ, k = i e^{iα} sin θ: one shared phase field
drives both sides (in the real case h, k have disjoint supports and HJM certify degree 21 by a one-variable moment
problem). Every certificate of ours relaxes the remote residual q ∈ H₂,₁ of k to a law (moments, Stein cuts, Gram
budgets) and pays a potential Ψ(|q|). Measured losses against the Gaussian-ideal model norm:

- cubic game: 1.5·10⁻⁴ at the peak row (gates), 4.6·10⁻⁵ with the paired-support architecture — both already within
  the 1.402 margin IF the Gaussian-ansatz support values were theorems (they are the open "FSD"/Conjecture K);
- degree-5 game: gated rows lose ≥ 5.5·10⁻³ on the k-side (mid-t rows) even with a perfect h-side lemma, and the
  twelve h-side (3,2)-shells cost up to 2·10⁻² when gated (pure non-Gaussianity of the remote shells of orders 2 and 4);
  the paired-support architecture with independent Gaussian tests loses the same 2·10⁻²; the cause is *driver sharing*:
  the cubic residual q must feed the degree-5 companions (|Z|²−1)q and Z²q̄ of the same fibre (step 16).

So the theorem that unlocks everything (1.402 with the cubic witness, then 1.4036 with degree 5) is a **Gaussian
domination statement for the chaos structure of bounded functions**: actual remote residuals of bounded responses are
dominated, in the row functional, by diffuse jointly-Gaussian ones with the same fibre coupling.

## 3. New observation tonight (numerical, `scratchpad/spike_content.py`)

The h-side needs the *chaos-content inequality* CC: for q ∈ H₂,₁ with E|q|² = 1, m = E|q|⁴, and bounded G of charge χ,
‖Π_{p,q}(G(σq))‖² ≤ θ_{p,q}(m)·‖G(σq)‖² with θ → 0 as m → 2. Earlier evidence was only for the diffuse family q_N.
A back-of-envelope with the *unbounded* cubic test G(u) = u|u|² − 2u suggested a counterexample (one spike
q = c·H₂,₁(X₁) + √(1−c²)·W_N has large content along X₁ at small m − 2). Monte Carlo (6·10⁵ × 4 per point) shows the
opposite for **bounded** G: for G = phase, θ_{(1,0)}/(m−2) stays in [0.0017, 0.0061] across diffuse and one-spike
mixtures (c up to 0.6, N from 1 to 128), and the content along the spike direction is tiny (8·10⁻⁴ at c = 0.3,
m − 2 = 0.63). The spike's information sits in the rare large-|q| tail, which a bounded function cannot weight; the
unbounded test's content was an artefact of that tail. **Empirical law: θ_{(1,0)}(|G| ≤ 1) ≲ 0.007·(m − 2).** If this
is a theorem (with any explicit constant below ≈ 0.05), the h-side gates of the degree-5 scheme cost
≈ 0.05·η·(m−2)·(mass) instead of η·(mass): the 2·10⁻² loss becomes ≈ 10⁻⁴ at the binding rows (m − 2 ≈ 0.3–1).

Candidate proof: Π_{1,0}G(σq) = E[G(σq) w̄]-vector, so ‖Π_{1,0}G(σq)‖² = sup_{‖a‖=1}|E[L̄_a G(σq)]|² ≤ sup_a E|E[L_a | q]|²:
the first-chaos content of *any* bounded function of q is at most the energy of the best prediction of a linear form
from q. For the diffuse family this is O(1/N) = O(m−2). The general statement "a cubic chaos with small fourth cumulant
predicts no linear form" should follow from the Malliavin–Stein toolbox (the influence matrix E[∇q∇q*] has trace 3 and
its spectral norm is bounded by contraction norms ≤ C√(m−2)), but the sharp form for bounded G needs the tail argument
above. This is the first lemma to prove. The order-2 and order-4 shells ((1,1), (2,0), (2,2), (3,1)) are the same
question with quadratic/quartic test polynomials in place of L_a.

### 3b. Correction from the second experiment (`shell_content.py`): the costly shells decay only like √(m−2)

The first-chaos shell is the benign one. The shells that actually cost in the degree-5 scheme (c_z: w-shell (2,2),
7.1·10⁻³; c_H: (1,1), 2.7·10⁻³; c_z̄: (3,1), 7.5·10⁻⁴) behave differently for bounded G. Content of G(q) in the one-
variable families of those shells, normalised by ‖G‖², diffuse q_N and one-spike mixtures:

| m − 2 | (1,1) of min(|q|,3) | (2,2) of min(|q|,3) | (2,0) of phase² | (3,1) of phase² |
|---|---|---|---|---|
| 0.33 (N=128) | 0.053 | 0.128 | 0.014 | 0.042 |
| 0.67 (N=64) | 0.090 | 0.197 | 0.025 | 0.063 |
| 1.36 (N=32) | 0.142 | 0.270 | 0.041 | 0.079 |
| 2.64 (N=16) | 0.204 | 0.311 | 0.062 | 0.084 |
| 0.58 (spike c=0.3, N=128) | 0.068 | 0.140 | 0.016 | 0.043 |

The successive ratios (1.44, 1.58, 1.70 for (1,1) as N doubles) approach 2, so the decay is asymptotically linear in
m − 2 (as a second-order expansion of E[(|w_j|²−1)|q₀ + H_j/√N|] predicts: the first-order term vanishes by charge
symmetry), but at the relevant m − 2 ≈ 0.3–1 the content is still 5–15 % ((1,1)) and 13–27 % ((2,2)) of the
function's energy. Consequence: a proved content lemma with these constants reduces the h-side gate loss by a factor
≈ 5–8 at the binding rows (2·10⁻² → ≈ 3·10⁻³), not by two orders of magnitude. It does not by itself make the
degree-5 scheme beat the current certificate (that needs total loss ≲ 10⁻³ over the model norm 0.71243, and ≲ 3·10⁻⁴
for 1.403). The h-side content of spiky residuals is a genuine effect, not an artefact; the reason it does not raise the
true norm (two-coordinate adversaries never beat the plain phase at the main game) is that spiky residuals pay on the
k-side. So the lemma that matters is the JOINT one (step 3 of §4), as the earlier sessions concluded; tonight's numbers
quantify what a decoupled h-side lemma can and cannot buy.

## 4. The programme (what "fight hard" means here, in order)

1. **Lemma CC for bounded G** (h-side), first for the first-chaos shell, then orders 2 and 4. Tools: conditional
   expectation bound, Malliavin integration by parts, influence/contraction bounds (our `Influence.lean` machinery already
   proves κ ≤ 14eh-type bounds), hypercontractivity (Janson Thm 5.10 for the tails). Target: explicit θ(m) ≤ C(m−2).
2. **k-side: the shared-fibre row.** Replace the fixed gates by the paired-support architecture on the multi-grade fibre
   (tests built from one residual q and its visible companions), so that the Gaussian ideal of the row equals the shared
   model norm 0.7124294 (lossless by step 16). Then the only remaining loss is the law relaxation of q (as today).
3. **Gaussian domination (FSD / multi-grade Conjecture K)** for the shared fibre: the actual residual's row value is
   dominated by the diffuse Gaussian one. The spike-vs-diffuse experiment suggests the right decomposition: by influence,
   a cubic chaos splits into finitely many high-influence directions (which can be rotated into the visible frame and
   handled exactly as extra ordinary coordinates, the engines' Z2/Z3 classes) plus a low-influence remainder, for which an
   invariance-principle argument (Mossel–O'Donnell–Oleszkiewicz / Malliavin–Stein) gives Gaussian behaviour with an
   error in powers of the maximal influence. This "spikes + diffuse" structure is exactly how HJM's asymptotic Boolean
   functions look in the real case.
4. **Certify the degree-5 game** λ ≈ (1, −0.849, 0.282) at 0.7126 or better → K > 1.4033; later degree 7.

Each step is weeks, not hours; 1 is the cheapest and has the clearest payoff (it also removes the h-side obstacle for
every higher degree). Nothing here changes the Lean plan (rows 12–15, quad checker), which continues in parallel.

## 5. Concrete start (same evening): the simplest domination statement, tested and conjectured

The Gaussian ideal of every row rests on statements of the form "the actual remote residual is no better for the
adversary than a diffuse Gaussian one". The simplest instance is the radius ρ = sup E|q|/‖q‖₂ over the (2,1)-chaos,
which the certificate uses at small t (external 0.95133, Lean 0.973612); by duality ρ = sup_{|u|≤1} ‖Π₂,₁u‖₂, the
largest cubic energy of a bounded function. For a diffuse (Gaussian-like) q the ratio is E|W|/‖W‖ = √π/2 = 0.886227.

**E1** (`e1_maxfirstmoment.py`, projected gradient ascent over the full symmetric tensor of a charge-one cubic chaos in
d complex variables, 12 starts, 2·10⁵ common samples): the maximum of E|q|/‖q‖₂ is 0.7501 (d=2), 0.7797 (d=3),
0.7967 (d=4), increasing towards 0.8862 with the optimal tensors spreading out (diagonal share 0.36 → 0.16); runs for
d = 5, 6, 8 are on big (`~/claude-b9ee-e1`). **E2** (`e2_quadratic.py`, real quadratic forms, exact characteristic-
function integral): equal eigenvalues give 0.6844 (d=1), 0.7358, 0.7553, 0.7656, …, 0.7958 (d=64) → √(2/π) = 0.7979;
mixed-sign spectra are lower (0.6366 at d=2); 20 Nelder–Mead ascents over 6 eigenvalues never exceed the equal-6
value 0.7761.

**Conjecture D₁ (Gaussian is the most concentrated chaos).** For every X in the n-th Wiener chaos, E|X| ≤ √(2/π)‖X‖₂
(real), equivalently E|q| ≤ (√π/2)‖q‖₂ for charge-one complex chaos of odd order (reduce by |q| = (π/2)·E_θ|Re(e^{−iθ}q)|),
equivalently sup_{|u|≤1}‖Π_k u‖₂² = 2/π (real) / π/4 (complex charge one) for every k ≥ 1, with the diffuse limit as the
only extremal. For k = 1 it is the trivial identity sup = (E|g|)²; for k ≥ 2 I found no statement in the literature (a
2026 paper proves the opposite extremal, rank one, for L^p, p ≥ 4, of quadratic forms: arXiv:2609.05914). D₁ would
replace the certified radius by the exact value and is the prototype of the domination theorem.

Proof routes to try (degree 2 first, where φ_X(t) = Π e^{−iλt}(1−2iλt)^{−1/2} is explicit): (a) E|X| =
(2/π)∫₀^∞(1 − Re φ_X(t))t^{−2}dt and a comparison with e^{−σ²t²/2} (|φ_X| ≥ |φ_G| holds pointwise by log(1+x) ≤ x; the
phase must be controlled); (b) the Malliavin identity E|q| = (1/(2n))E[(Γ(q,q̄) − Re(ph(q)²Γ(q,q)))/|q|] (our fluctuation
identity) with Γ's fluctuation bounded by m − 2; (c) Schur-concavity of the spectrum map for degree 2.

## 6. Conjecture K: full-tensor attack (E4, `e4_kattack.py`, running on big)

The requests (3) of `conjecture_K_handoff.md` §10 ("four or more comparable coordinates") were never run. E4 maximises
Λ(G) = E|L+G| + E|L−G| − ‖G‖²/ε over ALL of H₂,₁(ℂ^d) (Wick basis with exact norms) plus a diffuse Gaussian W, by
Wirtinger ascent on 10⁶ common samples, 15 starts of five kinds (Gaussian point + random tensor, pure tensor, the L4
counterexample structure i·z₁(|z_j|²−1), junta cubic + W, comparable-influence tensor + W), then re-evaluates the three
best candidates on 2·10⁷ fresh samples against S computed on the same samples.

| d (z₁ + d−1 ordinary) | row (ε, ℓ, β) | in-sample excess (overfit) | fresh-sample Λ(best) − S |
|---|---|---|---|
| 2 (laptop smoke test) | 0.7564, 0.8456, 0.1432 | +1.5·10⁻⁵ | −2.4·10⁻⁶ ± 2·10⁻⁶ |
| 3 | 0.7564, 0.8456, 0.1432 (peak) | +1.2·10⁻⁴ | −1.9 … −2.8·10⁻⁵ ± 1.2·10⁻⁵ |
| 3 | 0.7564, 0.76, 0.1192 (flank) | +1.6·10⁻⁴ | −1.6 … −1.7·10⁻⁵ ± 1.2·10⁻⁵ |
| 4 | 0.7564, 0.8456, 0.1432 (peak) | +2.0·10⁻⁴ | −5.8 … −7.2·10⁻⁵ ± 0.7·10⁻⁵ |
| 4 | 0.745, 0.8534, 0.1467 (certificate row) | +1.5·10⁻⁴ | −5.5 … −5.9·10⁻⁵ ± 0.7·10⁻⁵ |
| 5 | 0.7564, 0.8456, 0.1432 (peak) | +3.1·10⁻⁴ | −1.30 … −1.33·10⁻⁴ ± 1.4·10⁻⁵ |

Reading: the in-sample excess is noise fitting (it grows with the basis size, 7 → 19 → 41 → 76, and the fitted tensors
have norm 0.04–0.08, the scale of √(M/n)); on fresh samples every candidate is at or below the Gaussian value, and the
best candidates sit on the flat ridge of K-a (cubic admixtures to W cost only second order). The test's power at the
1·10⁻⁴ level is marginal with 10⁶ optimisation samples (gradient noise ≈ 10⁻³ per coordinate); a second round with 10⁷
samples for d = 3, 4 is running (`e4r2_*.log`). Round 1 verdict (all 15 starts × 5 runs done, 22:40): no violation; the
fresh-sample deficit of the fitted candidates grows with the basis size (−2, −6, −13·10⁻⁵ for d = 3, 4, 5), as expected when
the optimiser fits noise in more directions that cost second order on fresh data.
**Round 2 (10⁷ optimisation samples, 8 starts, 2·10⁷ fresh samples; done 02:20, 5 Nov):** d = 3: Λ(best) − S = −4.4·10⁻⁶ ± 4.8·10⁻⁶ (within
noise of zero: the optimiser now finds the flat ridge, no excess); d = 4: −2.6·10⁻⁵ ± 0.5·10⁻⁵. **Verdict of E4: no violation of
Conjecture K by full tensors in up to five coordinates at three rows, with a resolution of about 10⁻⁵ at the peak row.** Scripts,
logs: big `~/claude-b9ee-e1` (copied to `handoff/research-degree5/e4-logs/`).

## 7. A new route to K: Ornstein–Uhlenbeck monotonicity (E5, 5 Nov 02:40)

The D₁ proof (handoff/research-degree5/d1/) worked by interpolating the chaos variable to a Gaussian along the OU path and
reducing monotonicity to the sign of a Stein-kernel conditional expectation. The same idea applies to K. For an adversary
G ∈ H₂,₁(ℂⁿ) put σ = ‖G‖₂ and
    G_c := c·G + √(1−c²)·σ·W′,   c ∈ [0, 1],   W′ a standard complex Gaussian independent of everything,
so ‖G_c‖₂ = σ for every c, G₀ = σW′ (Gaussian of the same norm) and G₁ = G.

**Conjecture L6 (OU-monotonicity).** c ↦ Λ(G_c) is nonincreasing on [0, 1] for every G.

L6 ⇒ K at once: Λ(G) ≤ Λ(σW′) ≤ sup_σ Λ(σW′) = S. L6 is stronger than K (pointwise along the path) but, unlike the
symmetrisation monotonicity L4 (false: G = c·z₁(|z₂|²−1)), it compares with an INDEPENDENT Gaussian of the same norm.

**Evidence (E5, `e5_oupath.py`, `e5b_deriv.py`; d = 3, peak row ε = 0.7564, (ℓ,β) = (0.8456, 0.1432), 3–4·10⁶ common samples):**
monotone in all 13 families of E5 (the L4 counterexample at c = 0.15 and 0.4, juntas 0.1/0.2/0.3·H(z₂), junta + r_A + r_B
components, four random spiky tensors of norm 0.2, random tensor + W, Gaussian + small random tensor); the fine derivative test
E5b gives slopes −3·10⁻³ … −5·10⁻² at c ∈ [0.8, 1] for every family and for the six basis-direction perturbations of the Gaussian
point, and slopes at c ∈ [0, 0.05] of −1·10⁻⁴ … −1·10⁻³ except for the pure juntas, where the slope at the start is +1·10⁻⁵ …
+2·10⁻⁵, i.e. zero within noise (the junta direction is the flat ridge of K-a; consistent with E4: no excess at 10⁻⁵).

**Reduction to a Stein-kernel sign (to be made rigorous).** With f(a,g) = |a+g| + |a−g| and Δ_g f = 1/|a+g| + 1/|a−g| > 0:
Gaussian integration by parts in W′ and the Stein kernel τ_G of the cubic chaos (E[Ḡ h(G)] = E[τ_G ∂h], τ_G = Γ(G,Ḡ)/3 for a
homogeneous chaos, in the resolvent-identity form of conjecture_K_handoff.md §11) give, for the derivative along the path,
    d/dc Λ(G_c) = c · E[ (τ_G(G) − σ²) · K_c ] (up to the positive constant of the complex Laplacian),   K_c = Δ_g f(L, G_c) ≥ 0.
So L6 ⟺ the Stein-kernel excess τ_G − σ² of the cubic chaos has nonpositive mean against the positive weight K_c that is large
exactly where |L ± G_c| is small — the exact analogue of the Key Lemma E[X₂ | X_s = 0] ≤ 0 of D₁ (there the weight is the
conditional density at 0). Heuristic for why it holds: τ_G ≈ |∇G|²/3 is large where |G| is large, and there the weight is small.
What is different from D₁: τ_G is not linear and G is not class L, so Yamazato's unimodality is not available; but the
cubic-chaos structure gives τ_G ≥ 0 with E τ_G = σ² and the proved resolvent identity relates E[τ_G · φ(G)] to second
derivatives of φ. Next steps: (i) verify the derivative formula numerically on the junta (τ_G explicit); (ii) test L6 at the
flank rows t = 0.86–0.88 where K₅ fails (the K₅ failure mechanism, spiky residual + correlated companions, has a cubic analogue
only through the mixed components r_A, r_B, r_z; E5 includes them); (iii) attempt the proof of the sign for one-variable
residuals G = c·H(z₂) (τ_G explicit, two-variable integral) and then for juntas, then in general.

**Flank row (5 Nov 03:00):** at t = 0.86 (ε = 0.7564, ℓ = 0.87703, β = 0.15175, σ* = 0.161, D″ = 0.7128754 from kmodel.py) the same 13 families are monotone along the OU path with the same margins (diff −1.3·10⁻³ … −5.2·10⁻²; max rise ≤ −2·10⁻⁶). Rows t = 0.87, 0.88 not tested: kmodel.py's optimiser diverges there from every start tried (D″ ≈ 1.0 instead of ≈ 0.7124); the row parameters need a better search before the test.

### 7a. CORRECTIONS to §7 (5 Nov 03:40, from a critique forwarded by the user; checked)

1. **The scalar Stein-sign form of L6 is wrong as an equivalent.** The exact derivative along the path, with X = (Re G, Im G),
   U = (Re L, Im L), A_ij = ⟨DX_i, DX_j⟩/3 (the Malliavin matrix of the cubic chaos, E tr A = σ²), B_ij = ⟨DX_i, DU_j⟩/3 and
   J_± = D²|·|(L ± G_c) = (I − x̂x̂ᵀ)/|x|, is
       F′(c) = c·E[(A − (σ²/2)I) : (J₊ + J₋)] + E[B : (J₊ − J₋)],
   (third-chaos identity E[X_i h] = E⟨DX_i, Dh⟩/3 plus Gaussian integration by parts in W). My §7 form kept only the
   isotropic trace part of A and dropped the mixed term B (it arises because L depends on z₁ too). The scalar sign
   E[(τ_G − σ²)(|L+G_c|⁻¹ + |L−G_c|⁻¹)] ≤ 0 is false in general: for G = M·z₁(|z₁|²−2) with M large (the ν-direction, a
   function of z₁ only), τ_G − σ² = M²(k(|G|/M) − 2) is positive near |z₁|² = 2 where both L ± G vanish on circles, so the
   scalar expression → +∞ as c → 1 while the true F′(c) → −∞ (the Gaussian term −(cσ²/2)E[|L±G_c|⁻¹] diverges, the rest is
   bounded by 2E|G|). The monotonicity conjecture L6 itself is untouched by this; its proof target is the full identity.
2. **L6/K\* need the floors of §8a also for admissible profiles.** With β = 1, ℓ = 2 + λ², G = λz₂(T − 1 + (S−2)/12):
   F(1) − F(0) = dλ^{5/3} − 0.8λ² + …, d > 0 (quadrature: d ≈ 0.01–0.03), so F(1) > F(0) for λ ≲ 3·10⁻⁵ although ℓ > 2β > 0.
   There ℓ − 2β = λ² ≈ 10⁻¹⁰ and ‖G‖ ≈ 10⁻⁵: far outside the rows (ℓ − 2β ≥ 0.44, ‖G‖ ≈ 0.2); and since the same penalty
   applies to G and σW, Λ(G) > Λ(σW) there says nothing against K (S ≫ Λ(σW) at σ = 10⁻⁵).
3. **§9's "fails for every bounded or lattice law" is false.** The three-point law P(Y=0) = 2/3, P(Y=±r) = 1/6 satisfies (◊)
   at every scale (it reduces to ∫₀¹φ(ru)du ≤ ⅔φ(0) + ⅓φ(r), true by convexity of v ↦ e^{−r²v/2}); note its kurtosis is
   exactly 3 and E|Y|/σ = 1/√3. (◊) is a super-Gaussian-type family of conditions that Rademacher, uniform, sin(g), tanh(g),
   |g| violate, not a boundedness criterion. The L = 0 reduction itself (the real-law criterion) stands; whether every real
   projection of a charge-one cubic satisfies it is the open question.

## 8. The clean, constant-free statement (recorded 5 Nov 02:50 at the user's request)

Let z = (z₁, …, zₙ) be a standard complex Gaussian vector, H₂,₁(ℂⁿ) the charge-one cubic Wiener chaos (Wick polynomials
Σ a_{ijk} :z_i z_j z̄_k:), and W a standard complex Gaussian independent of z.

**Conjecture K\* (same-norm Gaussian domination).** For every n, every G ∈ H₂,₁(ℂⁿ), and every L of the form
L = z₁·a(|z₁|²) with a real affine function a, writing σ = ‖G‖₂,

    E|L + G| + E|L − G|  ≤  E|L + σW| + E|L − σW|.

No ε, ℓ, β, row or witness constant appears. K\* implies Conjecture K (hence K_η for every η, hence the 1.40226 cubic
ceiling) because the quadratic term −‖G‖²/ε is the same on both sides and the right side is ≤ S(ℓ,β). Its special case
L = 0 is the complex degree-3 version of D₁: E|G| ≤ (√π/2)‖G‖₂. The two-term (symmetric in G ↦ −G) form is essential:
a one-term version E|L+G| ≤ E|L+σW| is false (G can cancel the cubic part of L).

**Conjecture L6 (OU form, stronger).** With G_c = c·G + √(1−c²)·σ·W, the map c ↦ E|L+G_c| + E|L−G_c| is nonincreasing on
[0,1]. L6 ⇒ K\* (compare c = 0 and c = 1). Its derivative form: E[(τ_G(G) − σ²)(1/|L+G_c| + 1/|L−G_c|)] ≤ 0 for all c, τ_G the
Stein kernel of G.

**What was tested true (float):** K\* and L6 for n ≤ 3 on the 13 families of E5 (`e5_oupath.py`, `e5b_deriv.py`); K (the
sup form) for n ≤ 5 at three rows by full-tensor ascent (E4, resolution ≈10⁻⁵); K\* with L = 0 for n ≤ 6 (E1: max E|G|/σ = 0.822
at n = 6, increasing to √π/2). Not yet tested: L outside the affine family, the flank rows (σ* → 0), n ≥ 4 for L6.

**What is proved:** K\* for G in the degree-2 real chaos with L = 0 (the D₁ theorem, d1/d1-note.pdf) by the OU route; K for
√(m−2) ≤ 0.22 (conjecture_K_handoff.md §11).

### 8a. CORRECTION (5 Nov 03:30): K\* as stated in §8 is false at the margins; the two counterexamples sent by the user are valid

The user forwarded two counterexamples to K\* (same-norm domination for arbitrary real affine a). Checked by quadrature
(`e7_small_norm.py`, `e7b_asymp.py`):
1. **a with a zero in the bulk** (L = z₁(T−4), T = |z₁|², G_ε = iεz₁(T−2)): valid. Near the circle T = 4 where L vanishes,
   the pointwise-orthogonal coupled adversary gains ε²·log(1/ε) against the Gaussian's ε²: E|L±G_ε| > E|L±σW| for all small
   ε. Such profiles are outside the admissible class of K (a(u) = ℓ + β(u−2) with ℓ > 2β > 0 is positive on [0,∞)).
2. **a(0) = 0** (L = z₁T, G_ε = εz₂(T−1+δ(S−2)), δ = 1/12): valid, but only asymptotically. The region T ≲ ε^{2/3} where
   |L| ≲ ε gives a gain ∝ ε^{5/3}·(E|Y₀|^{5/3} − E|τW|^{5/3}) > 0 (a modulus-concentration effect: for p < 2 a less spread
   modulus beats the Rayleigh one), while the bulk gives −0.8ε² (Gaussian wins). Quadrature: F(G) − F(σW) = −7.9e-6, −8.0e-7,
   −5.7e-8, −3.8e-9 at ε = 3e-3, 1e-3, 3e-4, 1e-4 and +1.8e-11, +5.9e-11 at ε = 3e-5, 1e-5: the reversal exists for
   ε ≲ 4·10⁻⁵. With a(0) = 0.01 there is no reversal down to ε = 10⁻⁵ (ratio/ε² → −1.06); by continuity the reversal for
   strictly positive a needs a(0) far below 10⁻⁵. At the peak row (a(0) = ℓ − 2β = 0.56) the same family loses at every
   norm (−0.43ε²; E5 covers norms 0.1–0.4).

**Consequence.** The same-norm comparison is NOT a constant-free theorem for all affine a: it fails exactly where L vanishes
or nearly vanishes, at infinitesimal norms. On the row range (a(0) = ℓ − 2β ∈ [0.44, 0.66], adversary norms ≈ 0.2) it
survives every test. The conjecture that matters remains **K in the sup form** (with the quadratic penalty, so that the
relevant adversaries have norm ≈ σ\* ≈ 0.2), or K\* restricted to a(t) ≥ a₀ > 0 and ‖G‖ not infinitesimal relative to a₀.
L6 (OU form) must carry the same restriction. The L = 0 reduction (◊) of §9 is unaffected (no L involved).

## 9. The L = 0 case reduced to one scale-free inequality on the law (5 Nov, 03:10)

For a real Wiener chaos X of any order k with v = E X², the OU-path derivative is N′(c) = (2c/σ)·E[(τ_X(X) − v)φ(X/s)]
with the Stein kernel τ_X(x) = E[|∇X|²/k | X = x] (the chaos Stein identity E[Xh(X)] = (1/k)E[|∇X|² h′(X)]). Writing
u(s) = E[|∇X|² φ_s(X)], w(s) = E φ_s(X) = p_{X+sG}(0) and m(s) = s·w(s) = E φ(X/s), the heat equation ∂_sφ_s = s φ_s″ and the
Stein identity give the exact relation u′(s) = −k s m′(s), hence u(s) = k∫_s^∞ t m′(t) dt, and the Key Lemma
u(s) ≤ k v w(s) becomes a statement about the LAW of X alone. After the substitution Y = X/s it is scale-free:

**Conjecture (◊).** For every Wiener chaos variable Y (any order, any scale) and G ~ N(0,1) independent,
    E[ |Y| (2Φ(|Y|) − 1) ]  ≤  2 · E[Y²] · E[φ(Y)],      equivalently   E[|Y| ; |Y| > |G|] ≤ 2 E[Y²] p_{Y+G}(0),
with equality iff Y is Gaussian (checked: an identity for N(0,ρ), every ρ). (◊) for all scales ⇔ the Key Lemma for all s ⇔
monotonicity of the OU path ⇒ E|X| ≤ √(2/π)‖X‖₂; by phase averaging (|g| = (π/2)E_θ|Re(e^{−iθ}g)|) it gives the complex
charge-one case E|G| ≤ (√π/2)‖G‖₂, i.e. K* with L = 0, for every chaos order. Its small-scale limit is the fourth-moment
inequality E Y⁴ ≥ 3(E Y²)² (true for every chaos, Nualart–Peccati), its large-scale limit is E|X| ≤ 2 Var(X) p_X(0).

**Evidence (`e6_lawineq.py`, `e6b_class.py`, 4·10⁶ samples, scales ρ = E Y² from 0.02 to 1000):** (◊) holds with relative
margins 5–50 % at every scale for H₃, (g₁²−1)g₂, g₁g₂g₃, three random symmetric cubic forms, H₄, H₅, mixed cubic, Re H₂,₁(z),
the proved H₂; also for every polynomial image of a Gaussian tested (g³, g⁴, g⁶, g²+g/2, g₁g₂+0.3g₁, g₁²g₂+g₂³), for
exp(g), Laplace, Student t₅, sign(g)|g|^{3/2}. It FAILS (as it must) for Rademacher, centred Poisson, uniform, sin(g),
tanh(g), |g|, max(g,0), sign(g)|g|^{1/2}: bounded or lighter-than-Gaussian laws. The smallest margins are at small scale
(there (◊) → the fourth-moment inequality) and, for near-Gaussian laws, at large scale.

**What (◊) says structurally:** KL ⇔ Cov(τ_Y(Y), φ(Y)) ≤ 0: the Stein kernel (conditional gradient energy) is negatively
correlated with the Gaussian density of Y, i.e. "the gradient energy is large where |Y| is large". One-line proof for
Gaussian scale mixtures Y = √V·G₀ (τ = E[V|Y]; Cov(V, φ(√V G₀)) ≤ 0 since φ(√v g) decreases in v); Yamazato unimodality
for the degree-2 chaos (the D₁ proof). For a general chaos the information to use is that τ_Y is the conditional expectation
of the NONNEGATIVE polynomial |∇Y|²/k, with Euler's relation x·∇Y = kY + ΔY and the fourth-moment structure. Open.

Note on the pasted "proof" of K* (user, 03:00): invalid; the orthogonal complement of the functions of z₁ is not
independent of z₁ (z₂(|z₁|²−1) is orthogonal to them and not independent), the equality for an independent remainder is
false (the q-only part is an inequality that needs the moment data), and the convexity step does not give the claimed
direction.

## 10. Two theorems from the user's ChatGPT sessions (5 Nov, 03:30–04:00), checked here

The user fed the §8 statement (sup form, box) to two ChatGPT threads and to Grok. Both ChatGPT threads produced PDFs with
proofs; I read them in full and verified the steps and constants by hand and by quadrature (`e10_class.py`, inline checks).

**Theorem A (thread "Chaos Inequality", "Theorem 1").** Write G = H(z′) + (T−1)U + ZQ + Z̄B + dZ(T−2) + Z²V̄ (H remote
cubic, U, V holomorphic linear forms in z′ = (z₂, …), Q a centred (1,1)-quadratic, B a holomorphic quadratic; T = |Z|²,
Z = z₁). If α/β ≥ 11/4 (α = ℓ − 2β; the box has α/β ∈ [2.75, 5.5]) and G(0, z′) = 0 (i.e. H = U = 0), then F(G) ≤ M(v)
at every variance v = ‖G‖², where F(G) = E|L+G| + E|L−G| and M(v) = 2E|L + √v W|. Proof: (i) pointwise
(|L+G| + |L−G|)/2 ≤ √(|L|² + |G|²) (parallelogram + concavity), (ii) Jensen given T with the explicit conditional second
moment E[|G|²|T=t] = t{C + D(t−2)² + Et}, (iii) the tangent inequality for √ and two scalar integral inequalities (the
hard one ∫√t e^{−t}(t²−4t+2)(a(t)²+v)^{−1/2}dt ≤ 0, by two integrations by parts under α/β ≥ 11/4; I checked it is
negative, ≈ −0.25 … −0.8, over the whole box and beyond), (iv) the radial comparison E[|Z|√(a(T)²+v)] ≤ E|Za(T) + √vW|
for nondecreasing a ≥ 0 (covariance argument under the |Z|-biased measure; checked: margins +1.6·10⁻⁴ … +3.8·10⁻² for
v ∈ [0.0025, 0.5] on the box). **Observation (mine): the hypothesis H = 0 is unnecessary**: a remote cubic H adds the
constant v_H to the conditional second moment (its cross terms with every other shell vanish by chaos order or Z-phase),
so the same proof gives F(H + G₀) ≤ M(v) for every remote H and every G₀ with U = 0. Only the A-shell (T−1)U is excluded:
its conditional variance ‖U‖²(t−1)² has the correction weight t² − 2t whose Γ(3/2)-mean is +3/4 > 0.

**Theorem B (thread "Gaussian Domination Conjecture", "Section 3").** If, conditionally on (z₁, F) with F independent of
z₁, G is a centred proper complex Gaussian with variance h(T) = s + u(T−1)² + bT + cT² (s, u, b, c ≥ 0, F-measurable) and
0 < α/β ≤ 11/2, then F(G) ≤ 2E|L + ‖G‖₂W|, hence Λ(G) ≤ S for every ε. Covers the A-shell (T−1)U (U linear ⇒ Gaussian
given z₁), the B-shell Z²V̄, and sums such as z₂[α(T−1) + iλ(|z₃|²−1)]; for G = α(T−1)z₂ alone it also gives the OU
monotonicity at every norm. Proof via the heat equation ∂_w E|r+√wW| = K_w(r)/4, the Bessel form K_w(r) = √(π/w)e^{−x}I₀(x),
x = r²/2w, the bounds m(x) = 2x(1 − I₁/I₀) < 13/10 and sup rK < 6/5 (checked: 1.2178, 1.1752), unimodality of K in w, and
a Chebyshev step. Both threads also prove: σ* = 0 at the box corner (0.74, 0.90, 0.12) (so the box must be cut to σ* ≥ 0.1
or to the row curve), the unrestricted conjecture (any ε, any positive profile) is false (choose ε = 1/B′(v) at a
same-norm violation; needs ℓ − 2β ≈ 10⁻³⁰), and the **real Key Lemma for Y = H₃(N) at every scale** via the sublevel
inequality E[(3(N²−1)² − 6)·1{|Y| ≤ h}] < 0 for all h (elementary: F(x) = x(x²+1)e^{−x²/2}, r₃ = r₁ + r₂, 7e^{−2} < 1;
checked numerically). Grok conceded its "proof" and wrote the two-parameter family Y = aH₃(g) + b(g²−1)h in the
conditionally-Gaussian-given-g form; the Key Lemma holds there with 3–68 % margin (`e8_family.py`); the a = 0 case is an
explicit one-dimensional inequality (value −2.44, one sign change at |g| = 1.69).

**New structural picture of K on the box.** Theorems A (extended to H ≠ 0) and B together dominate every single shell and
every mixture that is conditionally Gaussian given z₁. What remains open is exactly: G = (T−1)U + (non-Gaussian-given-z₁
part), i.e. the A-shell combined with a remote cubic H and/or the ZQ, Z̄B, Z(T−2), Z²V̄ shells. Equivalently, the
pointwise-orthogonal relaxation 2E√(|L|² + E[|G|²|T]) fails only through the (t−1)² profile of the A-shell. This is a much
smaller target than K: one shell, in combination. Requests sent to both threads: extend A to H ≠ 0 (confirm), handle
(T−1)U + H with H remote non-Gaussian (conditional law given z₁ = Gaussian + independent cubic), prove R1 (the
z₁(|z₂|²−1) family, already covered by Theorem A!) and R3 (the two-parameter real family), and the sublevel form
E[|DY|²; |Y| < t] ≤ kE[Y²]P(|Y| < t) (`e9_sublevel.py`: ratios ≤ 0.8 at intermediate levels for all chaos tested).

## 11. Night of 5 Nov, 03:00–04:30: verified AI results, manuscript cross-check (claude-b9ee)

**Thread 2 (ChatGPT, "Conjecture K Counterexample"), document `gaussian_shells_and_real_cubic.tex`, all steps checked:**
- **R1 (aligned shell, proved, any amplitude).** If E[|G|² | T] = vT then ½F(G) ≤ E√(T(f(T)²+v)) (sign averaging +
  parallelogram + conditional Jensen), and for every nonnegative nondecreasing f: E√(T(f²+v)) ≤ E|Zf(T)+√v W| by the
  Laplace-transform comparison E e^{−uT(f²+v)} ≥ E e^{−u|L+√vW|²} (substitution y=(1+uv)t, monotonicity of f) integrated
  against u^{−3/2}du/(2√π). Covers G = ZQ + Z̄P with arbitrary square-integrable remote Q, P (shared coordinates allowed).
  Numerically: Laplace inequality positive at all tested (u,v); margins of the final comparison at the three rows
  3.5e-3 (λ=0.05) … 0.86 (λ=1.6).
- **R2 (affine multiplier, negative result).** For G = λ(1−δ(T−1))R, R any remote law: lim_{λ→0}[F(G)−B(‖G‖²)]/(λ²E|R|²)
  = ½∫e^{−t}r(t)^{−1}[−2δ(t−1)+δ²t(t−2)]dt > 0 for small δ (1/r decreasing). Quantitatively, with a Gaussian driver at
  α = σ*: Λ((α−δ(T−1))W') − S ≥ εα²I²/4 > 1.5e-4 at every row (I = ∫(t−1)e^{−t}K_{α²}(r(t))dt < −0.29), and the same
  excess for the cubic driver R_N = (2N)^{−1/2}ΣX_j(|X_j|²−2) for large N. **But (T−1)R_N ∈ H₃,₂**: the affine model lives
  in H₂,₁ ⊕ H₃,₂, so this is not a counterexample to K. It IS the mechanism of the K₅ failure (§k5: +8e-5…1e-4 at the
  flank rows): a sign-indefinite cross term 2αγ(T−1) in the conditional variance. In H₂,₁ the remote cubic q and the
  A-shell driver U (linear) are uncorrelated, so E[|q+(T−1)U|² | T] = v_q + ‖U‖²(T−1)² has no such term; the danger is
  only at fourth order.
- **R3 (real two-parameter family, proved with an exact-integer checker).** For Y = a₁H₃(X) + b₁H₂(X)H and every λ>0:
  E[|DY|²φ(λY)] < 3E[Y²]E[φ(λY)]. Identity 2(1+c²)p_c − m_c = 2E[(1−Γ)φ_c(Y)]; c ≥ 1 reduced to c = 1 (M−P < 5/8;
  numerically min(5/8−(M−P)) = 0.064); 0<c≤1 by an analytic corner (t ≤ 1/32, c ≤ 1/64: p_c > .34, m_c < .67;
  numerically p_c = 0.398, m_c = 0.617) and 130 exact boxes (`verify_gaussian_cases.mjs`, not replayed here; numerically
  the relative gap ((1+c²)P−M)/M ≥ 0.29 on the rectangle). Vector-valued g with B = 0 includes the full real third chaos
  only in the one-coordinate sense; the general multivariate case remains open.
- **σ* correction**: the three rows have σ* = 0.20086, 0.17262, 0.16172 (not 0.20, 0.20, 0.16).

**Manuscript cross-check (handoff/manuscript/legacy, read 5 Nov 04:00):**
- ch32-stronger.tex (20 Oct) already contains, under other names, the L = 0 reduction of §9: **BNC** E[(Γ−σ²)e^{−sX²}] ≤ 0
  ∀s is the Gaussian-weight Key Lemma; **SEI** (interval form) is the sublevel form (SL); the conditionally Gaussian case
  by Chebyshev, closure of SEI under independent symmetric unimodal summands, and the Edgeworth margin κ₄/(6λ) are there.
  New tonight relative to that: the one-variable H₃ case (ChatGPT thread 1) and the two-parameter family with Gaussian
  weight (thread 2, R3), and the two complex theorems A, B.
- **PVD** (E|N+q| ≤ (√π/2)√(V+E|q|²), N Gaussian) is the whole remote part of K for every profile (L is a Gaussian scale
  mixture, Lemma gsm), and PVD at V = 0 is equivalent to PVD at every V (buffer closure): the remote lemma is exactly
  E|q| ≤ (√π/2)‖q‖₂ on H₂,₁.
- **Negative register** (do not retry): every single-scale strengthening (heat kernel, Laplace, characteristic function)
  is false; certified: H = z[(|z|²−2)+i(|w|²−1)]/√3 has E e^{−30|H|²} < 1/31 (MC tonight: 0.03069). **Fibrewise
  domination at a fixed shift is false**: for the conditionally Gaussian cubic z₂(|z₃|²−1), E|r+q| − E|r+W| = −0.234 at
  r = 0 but **+2.2e-3 at r = 2.5, +3.1e-3 at r = 3**, positive for all r ≥ 2.5 (exact quadrature tonight). So the
  R5 question as posed to thread 2 (E|r+X+Y| ≤ E|r+√(varX+varY)W| for fixed r) is FALSE even for cubics with X = 0;
  only the T-averaged form can hold. "The A sector is the one admissible profile that is not scale-local."
- **Original-response (admissible) restriction, ch36-K-state.tex**: K is needed only for responses that can occur:
  remote energy e = ‖q‖² < 0.0463 on the central rows (0.0413 at t ≥ 0.845), total ‖F‖² < 0.0720 at t ≥ 0.8456, energy
  ellipsoid ‖q‖²/4 + ‖r_A‖²/3 + 2‖r_B‖²/3 + (‖Y‖²+‖W‖²)/2 + 4|ν|²/7 ≤ Rε²(R−t), R = √π/2; the response ellipse
  e + (191/500)t² ≤ 9/40 and the two-disk cap ‖q‖² ≤ 0.0148 are already covered without K; concentration branches cover
  responses with a diagonal Wick share ≥ 4/5 or a mixed-square share ≥ 179/200. Hence the K survivors are diffuse-ish
  remote cubics with 0.0148 ≤ e ≤ 0.0463 and bounded A/B sectors (‖r_A‖² ≤ 3Rε²(R−t) ≈ 0.062 at the peak).
  Conjecture K′ (ch7): the retained penalty −‖Pk‖² vanishes for the diffuse Gaussian adversary and is positive for
  junta-type residuals; the comparison with the mixed gain "did not run" (test still to do).

**Grok**: a = 0 case of the two-parameter family (b = 1): correct closed forms; its two proof attempts had false constants
(∫_{z₀}^∞(z−1)ρ = 0.324 not < 0.11; N not monotone on [0,2.2]; N(2.2) = −2.33); the saving facts are max_{[0,2.2]}k = −0.610,
P(χ²₁ ≤ 2.2) = 0.862, ∫_{z₀}^∞ 4z v^{−3/2}ρ = 0.0505, giving I ≤ 0.375 − 0.526 < 0 (I = −2.436 exactly, z₀ = 2.8499).
Its "single sign change in |g| for all (a,b)" is false (three changes for a = 1, b ≥ 3), but the core N − 3σ²D is
negative on all of |g| ≤ 1 in every case tested.

**Files (5 Nov, ai-notes/):** `chatgpt-thread2-gaussian_domination_note.tex` (thread 2, first document: §1 ε = 1/B′(v)
reparametrisation and the zero-optimizer corner, §2 the ℓ−2β = 10⁻³⁰ counterexample, §3 Theorem B with the Bessel
kernel bounds m < 13/10 and rK < 6/5, both interpolation paths, the shared-coordinate example z₂{α(T−1) + iλ(|z₃|²−1)},
§4 the H₃ sublevel inequality and the Gaussian-scale-mixture case; every step re-read 5 Nov 04:40: the t ≥ 3/2
log-derivative bound needs (m−1)/m < 3/13 < 5/21 ≤ (t−1)r′/r, the t ≤ 3/2 step needs r(3/2)/r(2) ≤ 7√3/15 < 5/6, which
is exactly tight at a/β = 11/2, so the theorem's range a/β ≤ 11/2 is sharp for this proof). Thread 2's second document
(R1–R3, pasted by the user) is summarised above; its LaTeX is in the ChatGPT thread ("gaussian_shells_and_real_cubic.tex").

**Thread 1 (ChatGPT, "Chaos Inequality"), document `ai-notes/chatgpt-thread1-remote-cubic-comparison.tex` (5 Nov 04:50):**
- **R1: my "H = 0 is unnecessary" was wrong.** The remote variance h enters the tangent estimate with the weight (1−t)
  (since E[|G|²|T] = h + t{…} is compared with tv), and I_H = ∫t^{−1/2}(1−t)e^{−t}f(t)dt > 0; already for G₀ = 0 the
  relaxation gives E√(|L|²+h) > M(h)/2 (checked: +5.4e-3 at h = 0.01). Extensions proved: (19/11)h ≤ D/10 + E/2
  (the Z-shells' negative corrections absorb a small remote part); H an independent circular Gaussian scale mixture at
  any amplitude (both scalar comparisons survive Gaussian smoothing; single sign change of X(u); stochastic monotonicity
  of ν_p).
- **R2 (disjoint coordinates) is a theorem**: for U Gaussian linear, H ANY square-integrable variable independent of
  (Z,U), b + h ≤ ℓ²: F(H + (T−1)U) ≤ F(H + √b W). Proof: interpolate w_d(t) = b(1 + d t(t−2)); derivative (b/2)∫e^{−t}
  t(t−2)E_{θ,H}K_{w_d}(r e^{iθ}+H)dt; negative part ≥ N/(ℓ√(m₋+v/ℓ²)) > 37N/(50ℓ) (N = 4e^{−2}, m₋ = (9−e²)/2);
  positive part ≤ (6N/5ℓ)(½ + 7h/(60ℓ²)) via rK ≤ 6/5, the radius reduction |r(t)e^{iθ}+ℓy| ≥ ℓ|√t e^{iθ}+p| and the
  shifted outer integral P(p) ≤ ½ + 7p²/60 (binomial series). Checked numerically: F(H+(T−1)U) − F(H+√bW) < 0 at all
  three rows for H = Wick cubic and H = z₃(|z₄|²−1), b,h ∈ [0.01,1] (−4.4e-3 … −0.26; exact inner Rice means);
  P(p) bound and constants verified (see pcheck). Since the penalised sup is attained at ‖G‖ ≤ ε ≤ ℓ and H + √bW is a
  limit of remote cubics, **K on the disjoint core reduces exactly to the pure-remote case K-a** (certified in the
  manuscript to 10⁻⁵ with Stein inputs; exact for Gaussian scale mixtures / one-coordinate star / ℂ²).
- **R3 (shared coordinates)**: the R2 replacement reverses at first order in u for U = uX, H = cH_i
  (½∂_uF = (Δ²D(0)/16)c³E[|H_i|²Re(X̄H_i)] + O(c⁵), moments 32 and 4; MC tonight: +1.6e-3 at c = 0.2, u = 0.02 for H₁);
  not a counterexample to K. Positive: small common amplitude (second-order term (s²b/2)∫t(t−2)e^{−t}/r dt < 0 plus the
  pure-remote quartic Δ²B(0)(E|H|⁴−2)/32); ‖H‖ ≤ ‖U‖/400 all amplitudes; U = uX, H = cH₂ with Re(ūc) = 0 (conditionally
  Gaussian, Theorem B) or |c| ≤ |u|/16; a qualitative η_i-neighbourhood of the remote axis. Its "Gaussian-marginal
  obstruction" (radial sign transform H = σ*χ(|X|²)X, orthogonal to U, Gaussian law, Λ(H + u(T−1)U) > S for small u) is
  the manuscript's ch35 obstruction rediscovered: a proof must use the joint Wick structure.

**Grok, closed 5 Nov ≈05:20 (user's instruction).** Final state: the a = 0 case of the two-parameter family is proved
modulo one one-variable inequality; Grok's N(1.432) = −1.17 is right and my "−3.7" was wrong, so the route
"N ≤ −2.29 on [0,2.2]" is invalid; the valid route is g(z) = N(z) + 0.55 v(z)^{3/2} ≤ −0.23 on [0,2.2] (max at the
endpoint; critical points of g at 1.606 and 1.926), giving k ≤ −0.55, I₋ ≤ −0.474, I₊ ≤ 0.375, I ≤ −0.099 < 0.
Grok's Laplace-window answer had the inequality backwards (the cubic's transform is ABOVE the Gaussian's at small s,
by κ₄ > 0; PVD needs E e^{−λ|q|²} ≥ 1/(1+λv) on λ < 1/V, the window that excludes the known large-λ failures). Its
reply to the manuscript digest restated the digest correctly (content reduction at zero buffer as the most economical
step) and added nothing new. No further Grok rounds.

**Thread 2, second document `ai-notes/chatgpt-thread2-remote_cubic_and_linear_shell.tex` (+ `chatgpt-thread2-verify_core.mjs`), 5 Nov ≈05:45:**
- **Theorem (1)**: q, U independent ⇒ Λ(q+(T−1)U) ≤ Λ(q) − (1/ε − 199/(200ℓ))u at every amplitude (variance
  integration ∂_wM_w = K_w/4 and the potential bound I_s(y) < 1.99/ℓ, certified by verify_core.mjs: 12 profile ×
  278 variance intervals, 2⁻⁴⁰ outward rounding; kernel bound rK_w(r) ≤ min(237/200, √π r/√(w+r²), 1 + w/(2r²))).
  Numerically: increments/u = 0.60–0.94 at the rows (bound 1.13–1.18, penalty 1.32–1.34); max I_s(y) = 1.998 on a
  grid vs 2.353; kernel bound holds on x ∈ [1e-4, 1e3]. Agrees with thread 1's R2 theorem by a different route.
  **The disjoint core reduces to K-a (certified to 1e-5).**
- **R4 quartic expansion (3)**: F(λQ_T) − B(bλ²) = C₂λ² + (λ⁴/32)J[m₄ − 2b²] + o(λ⁴), J[P] = ∫(e^{−t}P/f³ − P(0)/a³)
  t^{−3/2}dt, m₄(t) explicit with the odd (content) moments Re E[|q|²qŪ], Re E[|U|²qŪ]; J[t^j]/(√π/a³) =
  Γ(j−½)/√π · E(1+zY)^{½−j}, Y ~ Γ(3,1), z = β/a. At matched variance the quartic coefficient is negative for every
  complex c in both shared examples (P₁ max −0.37, P₂ max −4.4 at the peak) and for the disjoint example; under my
  wrong normalisation (v_q + 2u = 1) it has two real roots (brackets verified). My normalisation error: the variance
  of q + (T−1)U is v_q + u.
- **R5**: fixed-shift domination fails for large r by the κ₄ term of E|r+Y| = r + E|Y|²/(4r) + E|Y|⁴/(64r³) + …, even
  for scale mixtures with E|q|⁴ = 2 + 16/N. **R6**: the conditional second moment vT + u(T−1)² cannot carry the
  A-shell (Laplace order fails at large ξ; counterexample outside the chaos G = i(z₁/|z₁|)(T−1)√u); only a tiny
  region u ≤ w/(10000(1+w)³).
- Reply drafted in `ai-notes/reply-thread2-r4r6.txt` (requests R7 sixth-order remainder on the rectangle, R8 shared
  drivers via the conditional-mean split, R9 the content inequality).
- **verify_core.mjs replayed by the user (5 Nov ≈05:50, node 24)**: full-box potential bound 2188027284403/2⁴⁰ =
  1.98999 < 1.99 on 12 profile × 278 variance intervals; row envelopes 2.1354, 2.1258, 2.0740 (< 2.14 as stated);
  quartic signs certified on 40 profile intervals (finest dyadic denominator 64). Theorem (1) is therefore
  [P,C]-level: the disjoint core of K is settled up to the pure-remote case.

**Third GPT (given the manuscript digest), 5 Nov ≈06:00 — fourth-moment shared-A theorem [P,C], verified:**
for (H,U) independent of Z, U Gaussian linear, Re E[HŪ] = 0, arbitrary dependence:
`Λ(H+(T−1)U) ≤ B₀ + (11/100)u − (8/25)w + (21/4)w²` (coefficients K/2 − p, J/2 − p of thm:shared-a-audit's kernels,
remainder through E|U|⁴ only). Proof: project on a real direction, exact identity F(G) − B₀ = πE(|d+sX²| − |X|(c+bX²))₊
with c = a + bY², d = h + (Y²−1)s; shape inequality cx + bx³ ≥ cM(x) + B(c)N(x)x² (M = ∫₀ˣe^{−t²}, N³ = 3∫₀ˣt²e^{−t²},
B(c) = min(b + c/3, 3b); analytic proof via a convex-order comparison of V₁² for V uniform in the 3-ball); the positive
part ≤ d²/(2c) + |s|⁴/(12B(c)³); C₄ = ¼∫e^{−y²}B(a+by²)^{−3}dy ≤ 5.2461 (mine 5.2444). Checked: shape inequality on a
grid (gap ≥ −4e-22), the bound on the two shared families at five (u,w) points and three phases (margins 5.8e-3 … 3.2e-2).
**The uncovered rectangle shrinks to w < 0.01130 (raw K_{1e-4}), w < 0.01181 (exact K)**; on the original-response route
with the K_rot penalty a surviving pure shared-A maximizer needs η_AB/p < w < 0.00758. **Strengthened Gaussian-marginal
obstruction**: H = (1/5)X sgn(R − d*), U = X/50, (1+d*)e^{−d*} = 1/2 (d* = 1.678), E[HŪ] = 0, Gaussian law: at the
peak Λ(H+(T−1)U) = 1.374167 (mine, exact 2-D quadrature; certificate ≥ 1.3741206) > C′ + η_AB = 1.3740541: law-only
information plus orthogonality plus all proportional Rice cuts admit a violator of the 1.402 allowance; 44 % of its energy
lies outside H₂,₁. Any proof must see the cubic projection.

**Thread 1, R4/R5 answer (verify-content.mjs, `ai-notes/chatgpt-thread1-verify-content.mjs`, not yet replayed):**
- **R5 proved for both named families on the closed rectangle 0.00551 ≤ u ≤ 0.0463, 0 ≤ w ≤ 0.0223, all complex c, d,
  whole box**: content inequality ‖Π₁,₀F_A(H)‖² ≤ k_i[M(u) − F(H)] ≤ k_i[S − Λ(H)] with (k₁,k₂) = (0.138, 0.135) < 0.19
  (at the rows 0.103/0.055, 0.098/0.053, 0.094/0.051), and directly F(H+(T−1)U) < M(u+w): **K with η = 0 for the two
  families on the rectangle**. My check at the peak for H₁: content/slack = 0.039 (u = 0.0055) … 0.088 (u = 0.0463) ≤ 0.103.
  Exact identities: F(cH_i) − 2E|L| = E_x G_i(c|q_i(x)|), ‖Π₁,₀F_A(cH_i)‖² = |E_x l_i(x) sgn(q_i(x)) K_i(c|q_i(x)|)|²,
  K_i(y) = E_T[(T−1)∂_yA_i(r(T),y)]; certified by outward rational cells (5,241 / 8,761 cells).
- **R4 complete quartic**: 32Q = D₀(E|H|⁴ − 2u²) + 4D₁E[|H|²C] + D₂E[2|H|²|U|² + 4C²] + 4D₃E[|U|²C] + 2D₄w² − D₀(4uw + 2w²),
  C = Re(H̄U), D_j = Δ²P_j(0), P_j(y) = E[(T−1)^j|L+y|]; the content coefficient is D₁/8 (phase D₁/16:
  Π₁,₀F_A(sH) = (s³D₁/16)Π₁,₀(|H|²H) + O(s⁵)); D₁ ≈ 34.5, 34.4, 32.2 at the rows (my quadrature 34.49, 34.44, 32.19,
  ≈0.1 % below their enclosures); explicit remainder |R₆| ≤ 62s⁶[(4·11352^{1/6}√u + 9·6^{1/6}√w)⁶ + 24576v³] ≤ 8.2e9 s⁶v³
  (Rouché + Cauchy; E|H|⁶ ≤ 11352u³ by Wick pairing). **The quadratic cost does not absorb the content term on R**:
  absorption needs w ≥ 128(D₁/(4|I₂|))²u³ > 0.038 at u = 0.0463; the remote slack is essential.
- Still open: the content-to-slack estimate for arbitrary shared cubic H (now only needed for w < 0.0113).
- **verify-content.mjs replayed by the user (default mode, 5 Nov ≈06:15)**: at the three rows the content/slack ratio
  upper bounds are 0.103/0.055, 0.098/0.053, 0.094/0.051 (H₁/H₂; 410 and 578 cells each, strict margins), the direct
  matched-variance comparisons pass with positive margin units (meshes 16–32), and the kernel enclosures are
  I₂ ∈ [−0.87,−0.85], D₀ ∈ [−26.78,−26.75], D₁ ∈ [34.52,34.57], D₂ ∈ [−39.97,−39.92], D₃ ∈ [45.22,45.29],
  D₄ ∈ [−48.98,−48.89] at the peak (my quadrature is uniformly ≈0.1 % smaller in magnitude; same normalisation issue as
  noted, no consequence). `--box` and `--box-direct` (uniform rectangle claims) not yet replayed.
- **`--box` replayed (≈06:20)**: all eight β/α intervals [0.1800, 0.3650] pass for both families (2,182 and 3,086 cells
  each, strictly positive smallest margins); worst content/slack ratios 0.138 (H₁) and 0.135 (H₂), as claimed. The
  content inequality for the two named families is therefore certified uniformly on the box.
- **`--box-direct` replayed (≈06:25)**: no failure on any of the eight profile intervals for either family (1,022–1,839
  vertices per interval, smallest margin units ≥ 1). **K with η = 0 is certified for H = cX(|X|²−2) + dX(T−1) and
  H = cX(|Y|²−1) + dX(T−1), all complex c, d, on the closed rectangle 0.00551 ≤ u ≤ 0.0463, 0 ≤ w ≤ 0.0223, whole box.**

## 12. Second manuscript pass (5 Nov ≈06:40): ch53, ch55, ch35, ch14 and the 23 Oct research notes

- **ch55 (buffered drivers)**, Proposition "All amplitudes, arbitrary shared cubic [P,C]": q ∈ H₂,₁ independent of
  Z, fresh buffer gU, e = E|q|² ≤ 16/2500 = 0.0064, g ≥ 37/200 = 0.185, arbitrary α, β ∈ ℂⁿ (shared A and B
  shells on any drivers): Λ ≤ S. Also thm:buffered-two-driver-retained (c_j ≤ c_L, g ∈ [g₋,g₊]: Λ(Q+gU) ≤ S − 2k₄ −
  e_AB/2000), lem:buffered-conditional-complement (E[J|𝒜] = 0 ⇒ Λ(Q+J+gU) ≤ Λ(Q+gU) + (√π/(2g) − p)‖J‖²), the
  coefficient-disk theorem thm:cc-poisson, cold-start exclusions (A+B ≥ 0.116 + 0.494g², C ≥ 0.236 or V ≥ 0.285 ⇒
  Λ < 2E|L| ≤ S for g ≤ 0.164). **Consequence for the open core**: the diffuse Gaussian part of the adversary at
  the optimum has variance σ*² ≈ 0.04 (g ≈ 0.2 ≥ 0.185), so the rectangle is open only where the genuinely
  non-Gaussian remote energy exceeds 0.0064 or the buffer is below 0.185.
- **ch53 (two-driver cold)**: uniform A disk (A = ‖r_A‖ ≤ 9/20000 ⇒ Λ < S + 89e-6, all c₁, c₂, g, β); any finite
  number of independent Wick drivers (k₄ ≥ 9/10000, A ≤ √k₄/500 ⇒ Λ < S − 1e-6); small global A strip for all
  independent Wick B-only sums: Λ(G_A) < S + 75e-6 + (4/3)A − pA²; diffuse B-only (Λ ≤ S + 1e-5 + (117/5)Σc_j³|β_j|
  − (37/100)Σ|β_j|²). All need A tiny (w ≲ 2e-7): irrelevant for w < 0.0113 except as the small-w anchor.
- **ch14 (15 Oct packages)**: shared Wick junta with simultaneous A and B, Λ ≤ S + 1e-4 (thm:kjoint-junta); joint
  A+B on one Gaussian factor with random coefficients orthogonal to the driver (thm:kjoint-complex, S + 8e-5);
  thm:kfull fixed-buffer norm comparison 2E|L + cH(X) + SX + gG| ≤ f(g² + k) − c²D(k,g) with an explicit deficit
  D(k,g) ≥ √πk/(16(M+g²+k)^{3/2}): the one-coordinate cubic with a Gaussian-factor companion, at every amplitude.
- **23 Oct fresh-eyes/reassessment notes**: (i) rigorous dimension-uniform cubic-family ceiling 1.4022581233 for the
  witness P₁,₀ − zP₂,₁ (every complex z); at ε = 149/200 a genuine Gaussian pair has payoff > 0.71329, so that
  witness cannot reach 1.402 (ceiling 1.401955): 1.402 needs ε ≈ 1891/2500 (consistent with the K-ideal table);
  degree-5 and degree-7 ceilings < 1.4036705 and < 1.4044895 (degree 9 needed to approach 1/γ†). (ii) Full phase
  Hessian at the diffuse cubic contact: exact flat sector for independent cubic driver changes (κ_η = (R₀/2)Var_μ(X_η)
  → 0): second-order tests cannot separate the diffuse contact; any separator needs finite amplitude, higher cumulants
  or coupled image consistency (the "averaged, multi-scale" nature of K again). (iii) Upper side: the neutral-Gaussian
  obstruction D ≤ (99993/100000)γ† < 0.7119088 for responses with even auxiliary dependence (and the one-coordinate
  gap γ† − 3π/102400), below the current rounding score 0.7119472: only charged couplings or nonlinear preprocessing
  can improve the upper bound.

**Thread 2, third document `ai-notes/chatgpt-shared_driver_rectangle.tex` (+ `chatgpt-verify_shared.mjs`, 5 Nov ≈07:00):**
- (1) For the two templates q = √u e^{iφ}Q_i (Q₁ = X(|X|²−2)/√2, Q₂ = X(|Y|²−1)), ANY remote linear form U, all
  phases, on the full rectangle 0.00551 ≤ u ≤ 0.0463, 0 ≤ w ≤ 0.0223 and the whole profile box: F(q+(T−1)U) ≤ B(u+w)
  − 10⁻⁶ℓ (exact K, independent of the remote-only input). (2) Content inequality ‖Π₁,₀F_A(q)‖² ≤ 0.19(B(u)−F(q))
  − 3e-6 uniformly on the box (exact reductions (13): remote gain = ν E[B_i j(νB_i/R_p(T))], content = E[s_i|X|(T−1)
  h(νB_i/R_p(T))], j = (H−1)/s, h = H′, angular tables a_k = binom(1/2,k)²; 20 profile intervals × 1351 amplitude
  bands, integer convolutions). Same conclusions as thread 1's certificate by a different enclosure.
- **(3) Extended zero-buffer A cost at the three rows, ANY remote q, any dependence, ‖U‖ ≤ 0.15**: Λ(q+(T−1)U) ≤
  Λ(q) + 2Re⟨U,F_A(q)⟩ − (19/100)w (improves ch46's ‖U‖ ≤ 1/16); full box (12): [F(q+(T−1)U) − F(q) − 2Re⟨U,F_A(q)⟩]/ℓ
  ≤ K(p)ρ², ρ = √w/ℓ ≤ 0.197, K(p) = 0.940 + 0.105(p−2/15)/(4/19−2/15), via the projected envelope P_{a,β}(z) =
  ∫sup_x (x²+y²−1)²e^{−x²−y²}/(a+βy²+3βx²−2zx) dy (convex in z and p) and (10)–(11). Checked by MC (3e6 samples,
  common random numbers) at the three rows for Q₁, Q₂ and a coupled cubic (X²Ȳ + iX(|V|²−1))/√2 at six (u,w,phase)
  points: cost/w = 0.68–0.90 < 1/ε − 0.19 = 1.13–1.15 everywhere.
- R7: explicit sixth-order remainder (4)–(5), D₆ = 7E R⁶ + 42v³/0.44⁶, R = |q|/0.44 + |U|/0.12; radius λ_cert ≈ 0.006–0.008,
  does not reach the rectangle (proved analytically via |C₂| < 0.03z₆², |C₄| < z₆⁴, D₆ ≥ 7z₆⁶). R8: shared variance
  derivative (8) has the extra term (1/(4√v))E[hΣ(∂_jq_i)(∂_{ij}Φ)]; the cubic obstruction E[X̄F_A(q)] = 2J[t−1]c³ + O(c⁵)
  > 0; zero-buffer complement transfer (9) with cost (√π/(2d₀) − 1/ε)δ + √2π√δ√erfc(k₀/√w). R9 general tensors: exact
  first-chaos coefficient E[z̄_jF_A(q)] = E[(g(s)+sg′(s))∂_{z_j}q + q²g′(s)∂_{z_j}q̄], F_A(y) = y g(|y|²), s = |q|²
  (the cubic-order content exposed; sharp comparison with the deficit open).
- **verify_shared.mjs replayed by the user (≈07:10)**: content gap ≥ 3.35e-6 on 20 × 1351 cells; matched-variance
  minimum enclosure 1.00003e-6 > 1e-6; projected envelope P(0) ≤ 1.0654, P(0.2) ≤ 1.1640, P(0.42) ≤ 1.6498 (claimed
  < 1.07, 1.18, 1.74); normalized projected-cost endpoint bounds and the Gaussian-tail/0.19 row-cost constants verified.
  (1), (2), (3) and (12) are therefore certified.

**Thread 1, R10–R12 answer (5 Nov ≈07:40, chat only):**
- **Cubic-tensor inequality (1)**: ‖Π₁,₀(|H|²H)‖² ≤ (3√6/4) δ(H)^{3/2}, δ = E|H|⁴ − 2u², C = 1.837 (halves the manuscript's
  3.674): real product formula, δ_ℝ(Y) = 1296a² + 1944‖S_f‖², Π₁(Y³) = 324 I₁(f⊗₂A), ‖f⊗₂A‖² ≤ ‖A‖_op‖A‖²_HS ≤ a³,
  then Y = Re H. Explicit lower bound: H = X[|X|²−2 + (5/8)Σ_{j≤3}(|Y_j|²−1)] has E|H|² = 203/64, δ = 973128/4096,
  T(H) = (21484/512)X, ratio 0.4808 > 0.4775 (MC tonight: 3.163, 232, 41.5, ratio 0.487 ± noise; consistent). So
  0.4808 < C_opt ≤ 1.837; the manuscript's numerics are dimension-dependent (0.4775 at n = 2, ≥ 0.509 at n = 6), the
  weighted form has the dimension-free constant 3.
- **Cumulant-sensitive remainders (8)–(9)**: ‖Π₁,₀F_A(sH) − (D₁/16)s³T(H)‖ ≤ 27200κ^{3/4}s⁵, |M(s²) − F(sH) + (D₀/32)κs⁴|
  ≤ 9300κs⁶ (fixed-chaos estimates (10)–(11) via R_e = 27I₄ + I₂(…) + 54v_e with ‖R_e‖ ≤ 270a^{3/2}, Γ₃ with ‖Γ₃‖ ≤ 3δ,
  complete monotonicity of the visible densities in d²; ‖ψ₀⁽⁶⁾‖ < 7200, ‖ψ₁⁽⁶⁾‖ < 20000; −D₀ ≥ 14, D₁ ≤ 130 on the box).
  Consequence: the content inequality with 0.19 holds for EVERY cubic with u ≤ 3e-5 on the box, u ≤ 2.9e-4 at the rows.
  **Leading-order limit (19)**: for the Wick monomial (κ = 42, ‖T‖² = 128) the leading content/slack ratio is
  8D₁²v/(21|D₀|), so even the optimal tensor constant covers only v ≤ 0.01118 at the peak row: the finite-amplitude
  improvement (the certified R5 ratios 0.103) is essential; no Taylor/leading-order route reaches u = 0.0463.
- **R12**: for H = X[a(|X|²−2) + Y*AY − tr A]: u = 2a² + p, T(H) = (32a³ + 4ap + 2at + 4ζ)X, δ = 168a⁴ + 24a²p + 16a²Re t
  + 16aRe ζ + 2p² + 2|t|² + 4r + 8q (p = tr AA*, t = tr A², ζ = tr A²A*, r = tr (AA*)², q = ‖A²‖²_HS; MC check OK);
  nonlinear reductions (23)–(25) in terms of b(x,P) = a(x²−2) + P. No uniform inequality over A; the extra shells
  (|X|²−1)V(Y), X²W̄(Y), X̄B₂,₀(Y), R₂,₁(Y) of a general one-driver cubic are not covered. D₁(peak) = 34.5469 by their formula.

**Third GPT, refinement (5 Nov ≈07:50), verified at the table points:** Λ(H+(T−1)U) ≤ B₀ + 0.11u − 0.32w + 5.25w²/(1−θ)³
− θP₂(u,w) + θ²P₃(u,w) for every θ ∈ [0,1) (P₂ = 0.83u² + 1.12uw + 0.57w², P₃ = 2.3u³ + 4.95u²w + 4.29uw² + 1.78w³),
from the sharper shape inequality cx + bx³ ≥ cM + θB M³ + (1−θ)B N x² and the conjugate J_{λ,c}(d) ≤ d²/(2c) − λd⁴/(4c⁴)
+ λ²d⁶/(2c⁷). Universal cutoff for K_{1e-4}: w ≥ 0.01125 (from 0.01130; my recomputation: inf_θ = 0.0021472 at
(0.0463, 0.01125), θ = 0.05; the bound exceeds the templates' Λ by ≈ 1e-2). Conditional version (7): keeps
E[(h + (y²−1)s)² | s] inside J (concave in d²); for the factor class H = XQ + P (Q charge-zero quadratic, P cubic, both
independent of X), m₂ = (r + (y²−1)²w)V² + (u−r)/2 with r = E(Re Q)² = (2m₂₂ + n₂₂ − 2uw)/(4w): cutoffs w ≥ 0.0107 /
0.0101 / 0.0098 for r ≥ 0.8u / 0.9u / 0.95u. General cubic: the Hermite expansion h = Σ_j He_j(√2V)ξ_{3−j}/√j! gives
E[h²|V] explicitly (10); optimisation over the four ‖ξ_k‖² not done. Fourth-moment-data bound (11)–(12):
Λ ≤ B₀ + 0.11u − 0.32w + 5.25w²/(1−θ)³ − θQ₄ + θ²R₆ with Q₄ = A₀m₄₀ + 4A₁c₃₁ + A₂(4m₂₂ + 2n₂₂) + 4A₃c₁₃ + 2A₄w²
(A = (0.836, −0.594, 0.571, −0.427, 0.579)); odd content terms c₃₁ = Re E[|H|²HŪ], c₁₃ = Re E[|U|²HŪ]; cubic identity
(13) 4m₂₂ + 2n₂₂ ≥ 4uw (m₂₂ = w(u + ‖∂_XH‖² + ‖∂_X̄H‖²), n₂₂ = 2wRe E[(∂_XH)²]; MC check OK on H₁). Obstruction audit:
q_bad passes the cubic support cut (all rotations), eq:sector-joint-profile and the bare eq:jrb-main, but is REJECTED by
eq:jrb-main together with the exact projection relation Q_X k̄ = pq (D_t < 0.016 vs p²‖q_bad − q₃‖²/√π > 0.0176; q₃ =
γH₃(X), γ = 0.1487, ‖q_bad − q₃‖² = 0.01788): **the response-side information to retain is the exact cubic projection
consistency coupled to the support budget.** (Audit not independently checked.)

**Thread 2, R10–R12 answer (5 Nov ≈08:20; verifier `ai-notes/chatgpt-thread2-verify_content_extension.mjs`, not yet replayed):**
- **Shell penalty 0.24w** at the three rows for w ≤ 0.0113, any remote q, any dependence: Λ(q+(T−1)U) ≤ Λ(q) +
  2Re E[ŪF_A(q)] − 0.24w (projected envelope P_{0.5592,0.1432}(k) ≤ 1.062 + 0.220k + 3k² on [0, 0.42], mesh 1/512);
  consistent with my MC (cost/w ≤ 0.90 < 1/ε − 0.24 = 1.082). Target becomes C(q)² ≤ 0.24 D(q).
- **Influence estimate** (6)–(8): c*I⁺c ≤ Var(A(s)) + E[s²g′(s)²] (Bessel, charges 0 and −2), C(q)² ≤ ‖I‖_op[M_A²(κ+u²)
  + M_g²(κ+2u²)]; loses the κ^{3/2}; convention note: tr Γ = 2u, tr Ξ = u, tr I = 3u (the manuscript's κ ≤ (14/3)tr I_q²
  needs the total-influence I). No certified region in (u, κ/u²) for arbitrary q from this.
- **0.481 tensor theorem** for q = X[c(|X|²−2) + Y*AY − tr A], A Hermitian, common phase: ‖Π₁,₀(q|q|²)‖² ≤ 0.481κ^{3/2}
  via (11) m = 32c³ + 6ce + 4t, u = 2c² + e, κ = 168c⁴ + 40c²e + 16ct + 4e² + 12r and the two-variable polynomial
  inequality (32x³+6x+4z)⁴ ≤ 0.481²K(x,z)³ (12 Bernstein rectangles); my grid max 0.48086 at (x,z) = (0.92, 0.55).
- **Fifth-order content obstruction**: q₀ = X[−½(|X|²−2) + Σ₄(|Y_j|²−1)] has E|q₀|² = 9/2, κ = 261/2, vanishing cubic
  tensor content, but E[X̄q₀|q₀|⁴] = −243 and g₂ = πρ_h⁽⁴⁾(0)/384 < 0 (ρ_h⁽⁴⁾(0) = −715 at the peak, checked), so
  E[X̄F_A(λq₀)] = −243g₂λ⁵ + O(λ⁷) > 0: a sharp leading-tensor bound alone cannot control nonlinear content.
- **R11**: exact X-bidegree decomposition q = cX(|X|²−2) + XP + X̄B + (|X|²−1)V + X²W̄ + R (17); for the subfamily
  cX(|X|²−2) + XP(Y) + R(Y) exact reductions (18)–(20) through M(r,a₀,b) = E_{θ,φ}|re^{iφ} + a₀ + be^{iθ}|; closed
  infinite family: c = 0, P =_d −P, R independent ⇒ content 0 ⇒ exact K for 1/24000 ≤ w ≤ 0.0113 (with the 1e-5 remote
  input) or Λ ≤ S − 0.24w for all w ≤ 0.0113 when R = 0 or a Gaussian scale mixture (concavity of B).
- **R12**: keeping the (η,k) correlation does not cancel the linear term (24); sufficient joint condition (25):
  D(q) ≥ Ψ(C(q)), Ψ(C) = C²/0.24 for C ≤ 0.24r₀, 2r₀C − 0.24r₀² beyond, r₀ = √0.0113 ⇒ K for all w ≤ 0.0113.
- **verify_content_extension.mjs replayed by the user (≈08:30)**: all four checks PASS: shell penalty 0.24 (A cost ≤ 1.07935
  < 2500/1891 − 0.24 = 1.08205), tensor constant 0.481 (12 boxes, depth ≤ 7), example ratio > 0.4808, q₀ cubic tensor zero
  and fifth tensor −243. The 0.24w cost, the 0.481 theorem and the fifth-order obstruction are therefore certified.

**Fresh GPT (context-free thread, then given the material), content lemma attempt (5 Nov ≈09:40; verifier
`ai-notes/chatgpt-fresh-verify_nonlinear_content.mjs`, not yet replayed):**
- (1) **Full nonlinear content bound** |C_X(q)|² ≤ 50κ^{3/2}, κ = E|q|⁴ − 2u², every dimension and amplitude: real
  projection (3)–(4), the exact IBP identity E[ξm(η)] = E[m‴(η)P_h] with P_h = 27ΣB_{ij}I₂(f_i)I₂(f_j) + 54I₂(f_d),
  E|P_h| ≤ 54(1+√2)r^{3/2}, δ ≥ 1296r², and |m‴| ≤ m‴(0) = 2D₁/π because the weighted projection density ρ_A has a
  nonpositive Fourier transform (ρ, K completely monotone in t²; ρ_A = −d/dt[tK(t²)]) — the manuscript's CM A-profile
  rediscovered. Covers the fifth-order example (the weight m‴(η) is nonconstant).
- (2) **Deficit lower bound** D(q) ≥ (267/320 − (61875/128)u)κ: exact representation D(q) = −3Σ_{j=2,4}E[V_jVK_j(η)]
  (V = ‖Dη‖²/3 − v = V₂ + V₄, δ = (9/2)α² + 9β², K_j double OU-semigroup resolvents of Φ⁽⁴⁾), the Taylor control (16) with
  the global M₆ = Φ⁽⁶⁾(0) < 2750 and the product bounds ‖ηV₂‖ ≤ √(31v)α, ‖ηV₄‖ ≤ √(213v)β.
- Constants checked: −D₀ = 26.762 > 26.7, D₁ = 34.547 < 34.55, Φ⁽⁶⁾(0) = 2740.8 < 2750. (2) against the templates
  (exact quadrature): D/κ = 0.78/0.81 (u = 2e-4), 0.66/0.75 (1e-3), 0.23/0.36 (0.02), 0.134/0.232 (0.0463) for H₁/H₂ vs
  the bound 0.738, 0.351, then negative beyond u = 0.0017. So the true deficit coefficient decays slowly (≈ 0.13–0.23 at
  u = 0.0463) while the Taylor bound collapses: the loss is entirely in the global-M₆ step (16).
- Result: content inequality with 0.19 for u ≤ 19/50000 = 0.00038 (all cubics), with constant 1 for u ≤ 0.001.
  Structural point for the next step: Φ⁽⁴⁾ and m‴ are Gaussian mixtures in x² (complete monotonicity), so K_j(η) and
  m‴(η) are positive mixtures of e^{−λη²}; the deficit is then a positive mixture over λ of Gaussian-weighted
  Stein-type quantities E[−V_jVe^{−λη²}] — the BNC family at each scale — which should give an amplitude-dependent
  bound without the Taylor remainder.
- **verify_nonlinear_content.mjs replayed by the user (≈10:00)**: enclosures −D₀ ∈ [26.7612, 26.7618], D₁ ∈ [34.5464,
  34.5474], Φ⁽⁶⁾(0) ∈ [2740.73, 2740.81] (my values 26.762, 34.547, 2740.8 inside), universal content constant 49.928 < 50,
  margins +4.96e-4 at u = 19/50000 (0.19 D) and +2.69e-2 at u = 1/1000 (constant 1): the scalar inputs of the
  small-amplitude content lemma are certified.
- **Two of my suggestions refuted by the fresh thread (its interim notes)**: (i) the X̄B(Y) shell is NOT harmless for the
  content along X: for q = αX(|X|²−2) + βX̄Y² the leading tensor coefficient along X is 32α|α|² + 8α|β|² (phase
  averaging does not kill the second term); (ii) Schur-convexity of the content/deficit functionals in the Hermitian
  spectrum of P is false in general. So R18's reduction to "the matrix family plus (|X|²−1)V" and R17's majorisation
  route (asked of thread 2) must be replaced: all six X-bidegree shells interact in the leading tensor; the extremal
  reduction has to be over the full one-driver family.

**Fresh thread, covariance-sensitive content theorem for the Gaussian-factor class (5 Nov ≈10:40; verifier
`ai-notes/chatgpt-fresh-verify_gaussian_factor_content.mjs`, transcribed from the chat, not yet replayed here):**
for q = Σ_j X_jP_j(Y) (X_j independent standard Gaussians independent of Y; P_j centred, arbitrary dependence and
coefficients; genuine cubics when P_j ∈ H₁,₁(Y)): with Σ = E[PP*], ρ = ‖Σ‖_op, u = tr Σ,
    cc* ⪯ (2A′(0)²/Q(0))·D(q)·Σ,   hence C(q)² ≤ (56/5)ρD(q)   (c_j = E[X̄_jF_A(q)], D(q) = B(u) − F(q)).
Proof: L =_d √V W (τ Bernstein, ϱ completely monotone), B concave with Q(v) = −B″(v) = (√π/4)E(V+v)^{−3/2};
**−g is completely monotone** for F_A(y) = yg(|y|²) (via 𝓗 completely monotone with Δ[𝓗(|z|²)] = (τ−1)ϱ and
F_A = ∇(𝓗*|·|^{−1})); 𝓐(v) = ½E[(T−1)K_v(|L|)] = E[Sg(vS)] increasing; the **derivative-ratio lemma**
0 ≤ 𝓐′(v) ≤ (𝓐′(0)/Q(0))Q(v) by a single-crossing argument (R(x) − m changes sign once; k∘τ decreasing); then
conditionally on Y, q ~ CN(0, V_P), c_j = E[P_j𝓐(V_P)], |h*c|² ≤ (h*Σh)E|𝓐(V_P) − 𝓐(u)|² and
[B′(v) − B′(u)]² ≤ 2Q(0)d_u(v) with E d_u(V_P) = D(q). Constants: Q(0) = 3.3452 > 167/50, 𝓐′(0) = 4.3184 < 108/25,
2𝓐′²/Q = 11.15 < 56/5 (my quadrature agrees). Consequences: content inequality with 0.19 when ρ ≤ 19/1120 = 0.01696;
with the 0.24 cost, **K for this class whenever ρ ≤ 3/140 = 0.02143** (w ≤ 0.0113); e.g. Σ = (u/3)I₃ covers all
u ≤ 0.0463. Loose on the templates (ρ = u = 0.0463: bound 0.52 vs certified 0.055). Gap for this class: m ≥ 2 drivers
with ρ ∈ (0.0214, u], e.g. two equal drivers at u = 0.0463 (ρ = 0.0232). Also exact Bernstein representations for
general cubics: D(q) = ∫[E e^{−t|q|²} − 1/(1+ut)]ω(dt) (the manuscript's PVD/Laplace-window identity) and
C_X(q) = −∫E[X̄q e^{−t|q|²}]ν(dt), not yet compared. Does not cover self-interaction cX(|X|²−2) or an added R(Y).
- **verify_gaussian_factor_content.mjs replayed by the user (≈10:50)**: Q(0) ≥ 3.34500 > 167/50, 𝓐′(0) ≤ 4.31865 < 108/25,
  PASS 2𝓐′(0)²/Q(0) < 56/5 (identical output to the thread's own run). The Gaussian-factor content theorem is certified.

**Refutation (ChatGPT, 5 Nov ≈11:00) of a Grok "proof" of K / unconditional 1.4022 [checked, correct]:** (1) Schur-
convexity of ‖T(q_λ)‖² on Hermitian spectra is false: λ = (2,−1,−1) ≺ μ = (2,0,−2) but ‖T‖² = 576 vs 0 (T(q_λ) =
4(Σλ_j³)X, δ = 4(Σλ_j²)² + 12Σλ_j⁴); the valid restricted test is (λ_i − λ_j)(∂_iτ² − ∂_jτ²) = 24τ(λ_i−λ_j)²(a+λ_i+λ_j) ≥ 0
only on the nonnegative cone; fixed energy Σλ² is not fixed trace, and ratios do not inherit Schur-convexity
((1/2,1/2) ≺ (1,0) but tensor ratios 0.253 > 0.25). (2) The X̄B(Y) shell contributes through cross terms: q = X̄Y² +
Y(|Y|²−2) has E[X̄q²q̄] = 8 (E[S²(S−2)²] = 8), so E[X̄F_A(sq)] = (D₁/2)s³ + o(s³) ≠ 0 although R alone has zero content;
P(Y) = Ȳ₁Y₂ is a non-normal matrix, not Hermitian-isable. (3) Fifth-order content survives the fixed-chaos identity:
q₀ = XP, P = 3(|Y₁|²−1) + 4(|Y₂|²−1) + 5(|Y₃|²−1) − 6(|Y₄|²−1), ‖q₀‖² = 86, T(q₀) = 0 (3³+4³+5³ = 6³) but
Π₁,₀(|q₀|⁴q₀) = 144(3⁵+4⁵+5⁵−6⁵)X = −487296X, content = (J₁/384)s⁵Π₁,₀(|q₀|⁴q₀) + o(s⁵) with J₁ = Δ³P₁(0) < 0, while
E‖Dq₀‖² = 3‖q₀‖² = 258 holds. (4) Overstatements: 0.481 is a lower bound on the optimal tensor constant (the proved
upper bound is 3√6/4); the certificates cover only the two templates; the leading ratio 8D₁²u/(21|D₀|) ≥ 0.78 at
u = 0.0463 > 0.24. Valid part: the completion argument — the certified 0.24 cost plus (11) ‖Π₁,₀F_A(q)‖² ≤ 0.24[M(u) −
F(q)] gives Λ(q+(T−1)U) ≤ M(u) − u/ε ≤ S — which is exactly the open lemma. All four numerical claims re-derived.

**Hermitian one-driver family: content inequality proved at all three rows (ChatGPT, 5 Nov ≈11:20;
`hermitian_content_certificate.zip`, Arb enclosures + exact rationals, 43,067/18,481/4,177 boxes; not yet archived here):**
q = e^{iθ}X(Y*AY − tr A), ANY Hermitian A (any rank, dimension, signs), 0.00551 ≤ u = tr A² ≤ 0.0463:
‖Π₁,₀F_A(q)‖² ≤ 0.236364(B(u) − F(q)); with the 0.24 cost ⇒ Λ(q+(T−1)U) ≤ B(u) − pu − (303/20000)Δ ≤ S for
w ≤ 0.0113: **exact K for the whole Hermitian family on R** (U may share coordinates with X and Y). Proof: exact
identities F(q) = EB(P²), ‖Π₁,₀F_A(q)‖ = ½|E[PJ(P²)]| with J(v) = E_T[(T−1)K_v(r(T))]; weighted Cauchy–Schwarz against
the Bregman deficit d_u(v) = B(u) + B′(u)(v−u) − B(v) (E d_u(P²) = Δ): ‖Π‖² ≤ Δ·E R_u(P²/u), R_u(y) =
uy[J(uy) − J(u)]²/(4d_u(uy)); the coupled moment inequality for centred Hermitian quadratic forms
EP⁶ ≤ (125/3)uEP⁴ − 110u³ (cumulants (k−1)!Σλ_j^k with s₃² ≤ us₄, s₆ ≤ us₄; exact, I re-derived it: both sides equal
250us₄ + 15u³ after the two inequalities); and the certified polynomial envelope R_u(y) ≤ 53/1000 + 0.23381y +
0.0004586(y³ − (125/3)y²), whose expectation is ≤ 0.236364 (−B″ and J′ completely monotone, t′(s) a ₂F₁, Laplace
representations (7)). My quadrature: the envelope holds at u ∈ {0.00551, 0.02, 0.0463}, y ∈ [0.001, 50], tight at
u = 0.0463 near y = 1 (R_u(1) = 0.2646 vs 0.2682) and at y = 20 (0.6917 vs 0.7547). Not covered: the self-interaction
cX(|X|²−2) + XP(Y) (conditional Gaussianity in X fails), non-Hermitian A, other one-driver shells, general tensors.
- Archive: `ai-notes/chatgpt-hermitian_content_certificate.zip`, unpacked in `ai-notes/hermitian_content/` (proof.md,
  generate.py (Arb via python-flint, kernel enclosures), verify.py (exact rational envelope checks against the stored
  `*_kernels.json`), results json, SHA256SUMS). Rows: peak (1891/2500, 1057/1250, 179/1250), flank (149/200, 4267/5000,
  1467/10000), upper (1891/2500, 877/1000, 19/125). Replay: `python3 verify.py peak|flank|upper` (needs python-flint).

**Third GPT, partial (≈11:40):** universal cutoff improved to w ≥ 0.011223 (tighter scalar enclosures); new exact
mixed-moment inequality 4m₂₂ + 2n₂₂ ≥ 4uw + 10c₁₃²/w² (absorbs the odd c₁₃ term); route (A) (fourth-moment data,
closed in (u,w) after eliminating m₄₀ and optimising θ) gives 0.0021574 > 0.0021476 at (0.0463, 0.01125): the sixth-moment
remainder consumes the gain; route (B) (four conditional energies) cannot improve the full-height strip (exact
limitation certificate). **Correction of my own claim**: the buffered theorem (q + gW, ‖q‖² ≤ 0.0064, g ≥ 0.185) does
NOT bound δ = E|q|⁴ − 2u² below on the open set: normalised sums of independent cubics keep u and have δ → 0. The
near-Gaussian regime is instead covered by the manuscript's K_η proof for x² = δ/u² ≤ 0.05 (ch7, x ≤ 0.22), so the
open set in the fourth-excess coordinate is 0.05 < δ/u² ≤ 42.

## 13. My own scan of the joint majorant (5 Nov ≈12:30, `e11_scan_majorant.py`, log `e11_scan_majorant_peak.log`)
Peak row; φ(v) = 2E|L+√v| and g(v) (F_A(y) = yg(|y|²), via the angular means A₁ and E_θ|·|⁻¹ = (2/π)K/(r+y)) tabulated by
quadrature; F(q), D(q) = B(u) − F(q), C(q)² = Σ_dir|E[d̄irF_A(q)]|² (all remote directions X, Y₀, Y₁, Y₂) by Monte Carlo,
3·10⁶ common samples; 22 cubics per energy (the two templates, Hermitian (2,−1,−1), the non-normal Ȳ₀Y₁, the shells
X̄Y₀², (|X|²−1)Y₀, X²Ȳ₀, the remote R, the zero-tensor q₀, X̄Y₀² + R, and 12 random mixes of ten shells).
Results: **D(q) > 0 for every cubic tested** (D/δ = 0.13–0.36 at u = 0.0463, 0.23–0.50 at 0.02, 0.42–0.68 at 0.0055),
and **C²/D ≤ 0.0047 at u = 0.0463, ≤ 0.0073 at u = 0.02, ≤ 0.075 at u = 0.0055** (worst: random mixes at the small end;
templates 0.0047/0.0026 at 0.0463, 0.055/0.038 at 0.0055). So the content inequality with 0.24 holds with a margin
factor ≥ 3 everywhere tested, and **the ratio C²/D DECREASES with u** (the content saturates, the deficit grows): the
hard end of the rectangle is the small-energy edge u ≈ 0.0055, exactly where the leading-order analysis is sharp
(prediction 8D₁²u/(21|D₀|) = 0.093 for the Wick monomial at u = 0.0055 vs measured 0.055). Consequences for the proof:
(i) at u ≥ 0.02 crude but rigorous enclosures should suffice (margin ≥ 30×); (ii) the small-u edge needs the
scale-dependent leading-order argument (content ≈ (D₁/16)s³T + O(s⁵) against D ≈ (|D₀|/32)κs⁴); (iii) PVD (D ≥ 0) never
failed. A hill-climb for the worst tensor per energy is running (`scan_opt.py`).
- Hill-climb (`e11_scan_opt.py`, 12 shells in ℂ⁴, 6 restarts × 25 steps per energy, 1.2·10⁶ samples): worst C²/D found =
  0.0844 (u = 0.0055), 0.0356 (0.01), 0.0092 (0.02), 0.0048 (0.0463). The maximisers are genuine mixtures (no single
  shell dominates except at u = 0.0463 where X(|X|²−2) carries 56 %). Monotone decrease in u confirmed.

**CORRECTION to §13 (5 Nov 13:40).** The first scan used a wrong A-profile kernel (the angular mean of the phase was
computed with r and y interchanged, giving g > 0 instead of the correct g(0) = ½E[(T−1)/r(T)] = −0.835 and −g
completely monotone), so its content values were ≈ 20× too small and the conclusion "the ratio decreases with u" was an
artefact. Corrected scan (`e11_scan_majorant.py`, log `e11_scan_majorant_peak.log`; check: H₁ at u = 0.0463 gives
C² = 1.06e-3, ratio 0.0884, matching thread 1's quadrature 0.0876):
- D(q) > 0 everywhere (unchanged: D/δ = 0.13–0.36 at 0.0463, 0.23–0.50 at 0.02, 0.42–0.68 at 0.0055);
- **worst C²/D = 0.0884 at u = 0.0463, 0.068 at 0.02, 0.017 at 0.0055**, attained by the single Wick monomial
  X(|X|²−2) (and equally by the remote monomial Y₀(|Y₀|²−2) along its own driver); random ten-shell mixtures reach
  0.081 at 0.0463 (one with 90 % X-content) and are below the monomial at every energy; the zero-tensor q₀, the
  non-normal Ȳ₀Y₁, and the X̄Y₀², X²Ȳ₀ shells have negligible content (ratios ≤ 1e-4).
- So the ratio INCREASES with u (as the certificates said), the worst case on the rectangle is the known template at the
  top energy (certified ≤ 0.103), and the margin to 0.24 is a factor 2.7 at the worst point and ≥ 3 for every mixture.
  The leading-order ratio 8D₁²u/(21|D₀|) = 0.78 at u = 0.0463 overestimates the true 0.088 by 9×: content saturation.
- Corrected hill-climb (`e11_scan_opt.py`, 12 shells in ℂ⁴, 6 restarts × 25 steps, 1.2·10⁶ samples): worst C²/D found =
  0.0235 (u = 0.0055), 0.0375 (0.01), 0.0474 (0.02), 0.0834 (0.0463), all below the pure monomial's values (0.017? no:
  the monomial gives 0.0171 at 0.0055 — the hill-climb beat it there with a mixture carrying 25 % Y₀(|Y₁|²−1) + 24 %
  X(|Y₁|²−1); at 0.0463 it did not reach the monomial's 0.0884, its best point carrying 54 % X(|X|²−2)). Conclusion:
  the supremum of C²/D over the rectangle is ≈ 0.09, attained near the top energy by the self-interaction monomial;
  margin ≥ 2.7 to the needed 0.24 everywhere. **Numerically the lemma is true with room; it is not yet proved outside
  the certified families (templates, Hermitian one-driver, spread Gaussian-factor, u ≤ 0.00038).**

## 14. Hermitian thread, final answer (5 Nov ≈14:30): sixth-moment inequality for every complex matrix — VERIFIED
For P = Y*AY − tr A with A any complex n×n matrix, u = E|P|², ζ = EP², κ = E|P|⁴ − 2u² − |ζ|²:
E|P|⁶ ≤ 6u³ + 9u|ζ|² + (25u + (50/3)|ζ|)κ, via the Hermitian bound applied to Re(e^{−iθ}P) and averaged in θ, plus
|cum(P,P,P,P̄)| ≤ κ, which follows from the identity κ − Re κ₃₁ = 12 tr J⁴ + 8 tr(H²J²) + 4 tr(HJHJ) (A = H + iJ after a phase
rotation making κ₃₁ ≥ 0). My check (`e11_check_complex_moment.py`, 4·10⁶ samples, n = 3, four random complex A, a
nilpotent A, two Hermitian A): inequality holds with ratio 0.64–0.81 (Hermitian case recovers the certified bound), the
cumulant identity matches to MC accuracy (24.75 vs 24.54, 42.0 vs 42.3, 87.3 vs 87.7, 7.97 vs 8), |κ₃₁|/κ ≤ 0.84 for
non-normal A and = 1 for Hermitian. The thread confirms it has NOT proved the general content lemma; its numerical
searches found no violation. Use: the moment step of the Hermitian certificate now extends to the full one-driver
shell XP(Y) with any complex coefficient matrix (step 2 of THE WAY), leaving only the kernel-envelope part to redo.

## 15. Hermitian thread, R23–R25 certificate (5 Nov ≈15:00): `ai-notes/chatgpt-r23_r25_certificate.zip` → `ai-notes/r23_r25_certificate/`
**R23 (certified by the thread, Arb + exact rationals, not yet replayed here: needs python-flint):** for q = X(Y*AY − tr A)
with ANY complex matrix A and 0.00551 ≤ p = tr(AA*) ≤ 0.0463, C(q)² ≤ 0.239·[B(p) − F(q)] at all three rows (983,671 /
157,507 / 27,601 rational boxes + 77 polynomial-positivity boxes per row; largest bound 0.238775). With the 0.24 A-cost:
Λ(XP + (T−1)U) ≤ B(p) − p/ε − (1/240)[B(p) − F(XP)] ≤ S for every remote linear U sharing arbitrarily with X and Y.
Ingredients: the exact sixth moment of a non-Hermitian centred quadratic form (eq. 23.2, 265 Wick contractions,
`verify_moments.mjs`), the Gaussian-anchored coupled bound m₆ ≤ 37p·m₄ − 68p³ (sharp: rank-one Hermitian (1,9,265) attains
it), the phase-refined bound m₆ ≤ 25p·m₄ − 44p³ − 16p|t|² + 100Re(t̄η) with |η| ≤ √(rQ) and the scalar inequality
25τ√(rq) ≤ 7τ² + 6r + 12q, the real-direction Cauchy–Schwarz (Z₀/Y₀ ≤ 1, EZ₀ ≤ (1+τ)/2, τ = |tr A²|/p), and seven τ-intervals
with rational envelopes Q(y) + γy (`envelopes.json`). **My checks (`e11_check_r23_moments.py`):** the exact m₄ and m₆
formulas agree with Monte Carlo (3·10⁶ samples) on four random complex 3×3 matrices, the nilpotent shift (p = 2, m₄ = 16,
m₆ = 288 exactly) and diag(2,−1,−1) (216, 22320 exactly); the coupled bound holds with ratio 0.45–0.67; the scalar
inequality has minimum 0 on the grid (attained only at τ = r = q = 0); 37·9 − 68 = 265 ✓.
**R24 (proved, analytic):** for q = X[c(R−2) + P], R = |X|², P any centred variable independent of X: with the size-biased
measure Ê[H] = E[RH] (R ~ Gamma(2,1)), Ê b_R = 0, Ê|b_R|² = u, and B(u) − F(q) = Ê d_{u,R}(|b_R|²) + |c|²𝓚(u) with
𝓚(u) = 2uA₀(u) + u²A₀′(u) ≥ ½uA₀(u) > 0: **exact remote same-norm domination F(q) ≤ B(u) for the whole self-interaction
family, all amplitudes** (K-a for this family, sharpened by the explicit |c|² term). Exact content formula
𝓒(q) = cuJ′(u)/2 + Ê{b_R[g(R|b_R|²) − g(Ru)]} and a control-variate Cauchy–Schwarz bound (24.6); the shared-A content
inequality for c ≠ 0 remains OPEN (b_R and R correlated; the marginal of b_R under the size bias is the quadratic form
diag(c,c,A), so R23's moment constraints transfer).
**R25 (exact bookkeeping):** general one-driver cubic q = cX(R−2) + XP + X̄B + (R−1)V + X²W̄ + R₀; the exact cubic-content
coefficient (25.1) with all cross terms (frequency condition k+l−m = 1) and its Y-expectation (25.2); table of what phase
conditioning gives per shell (C_X = 0 for X̄B, X²W̄, even-in-X terms alone) and the explicit counterexample
q = X̄Y² + (|X|²−1)Y with E[X̄q²q̄] = 6 (`check_shells.mjs`): mixed shells cannot be dismissed by phase averaging.
Obstruction recorded: with only centring and conditional Gaussianity (no chaos moment constraint) two-point coefficient
laws reach 0.2469 (u = 0.0403) and 0.2646 (u = 0.0463) > 0.24, so the chaos moment inequality is essential.
**Status change:** the whole shell XP(Y), any complex coefficient matrix, is now certified on R; of THE WAY's step 2 only
the self-interaction coupling c ≠ 0 is left, and step 1 (cross terms of the other shells) is now written out exactly.
Replay (user; python-flint required): `cd ai-notes/r23_r25_certificate/r23_r25_certificate && node verify_moments.mjs && node check_shells.mjs && python3 verify.py peak && python3 verify.py flank && python3 verify.py upper`.
**Replayed green by the user (5 Nov ≈15:20):** `verify_moments.mjs` PASS (265 contractions, the 12 trace-word classes with
multiplicities 36,18,4,36,36,36,36,18,9,12,18,6), `check_shells.mjs` PASS (energy 3, content moment 6), `verify.py`
peak/flank/upper ALL REGIONS PASS with box counts 983,671 / 157,507 / 27,601 matching the archive's result files, caps
≤ 0.238775 < 0.239 in every region. **R23 is now verified on this machine: the one-driver shell XP(Y) with any complex
coefficient matrix satisfies the content inequality with 0.239 on R at the three rows.**

**SECOND CORRECTION to §13 (5 Nov ≈15:50, found by the Hermitian thread reading the scan code):** `gfun(0)` returned 0
(a guard against dividing by √v) while the correct value is g(0) = ½E[(T−1)/r(T)] = −0.835136, so the linear interpolation
on the first grid cell ρ ∈ [0, 0.002] was wrong, which matters at small energy where most samples have |q|² < 0.002.
Fixed (g(0) computed by quadrature) and rerun: scan maxima **0.0891 (u = 0.0463), 0.0708 (0.02), 0.0406 (0.0055)**,
all attained by the Wick monomial X(|X|²−2) (the thread's smooth kernel gives 0.0389 for the monomial at 0.00551; the
rest is Monte Carlo and table interpolation). Hill-climb (12 shells): 0.0308 (0.0055), 0.0507 (0.01), 0.0504 (0.02),
0.0839 (0.0463), every mixture below the monomial. The u = 0.0055 ordering is now: monomial 0.0406, remote monomial
0.0398, X̄Y² + R 0.0306, aligned shell 0.018, template H₂ 0.0176, mixtures ≤ 0.025. Conclusions unchanged: D > 0
everywhere, the ratio increases with u, the monomial is extremal at every energy, margin ≥ 2.7 to 0.24; the top
energy numbers moved by < 1 %.

**Pending (5 Nov ≈16:10):** the Hermitian thread reports a cubic with a content-to-deficit ratio slightly above the Wick
monomial's, which would refute the exact form of Conjecture E (monomial = precise maximiser) while leaving K and the
envelope target (< 0.24, margin 2.7) untouched; it is checking the difference with rigorous error bounds. When it posts
the cubic, recompute its ratio independently with `e11_scan_majorant.py` (corrected kernels) before accepting it, and
record which cross terms carry its content (input to step 1 of THE WAY).

**Conjecture E, exact form, probably false (5 Nov ≈16:40).** The Hermitian thread reports a counterexample candidate: a
small imaginary quadratic perturbation of the Wick monomial, q = X[(|X|²−2) + iλP(Y)], has a slightly larger content-to-
deficit ratio at the peak row, surviving finer deterministic quadrature; it is preparing a rigorous certificate. My own
check (`e11_imag_perturbation.py`, 4·10⁶ common samples, P = |Y|²−1): at u = 0.0463 the ratio goes 0.08853 (monomial) →
0.08854 (λ = 0.05, 0.1) → 0.08853 (0.2) → 0.08836 (0.3), while real perturbations ±λ decrease it at every λ. So the
monomial is stationary under imaginary Hermitian perturbations (|b|² = c²(r−2)² + λ²P², no cross term) with a
second-order coefficient of order 10⁻⁵/λ², compatible with the thread's claim but below my Monte Carlo resolution; a
deterministic quadrature decides it. Consequence: the monomial may be a saddle, not the maximiser, by a relative
margin of order 10⁻⁴; E in its exact form is then false, but the envelope target (sup ≤ 0.24, margin 2.7) is untouched.
THE WAY is restated as the envelope statement E′: sup over cubics of energy u of C_X(q)²/D(q) ≤ 0.11 on R (the monomial's
0.089 plus the room the cross terms can take), to be proved, not exact extremality.
**Confirmed deterministically (5 Nov ≈16:55, `e11_second_variation.py`):** for q_τ = √(u/(2+τ²))·X[(|X|²−2) + iτ(|Y|²−1)] at
u = 0.0463, peak row, with a 6001×6001 trapezoid quadrature over (|X|², |Y|²) and the tabulated kernels: ratio 0.0876133
(τ = 0) → 0.0876140 (0.02) → 0.0876172 (0.05) → 0.0876249 (0.1) → 0.0876044 (0.2) → 0.0874257 (0.3) → 0.0861 (0.5).
Second variation +1.65·10⁻³·τ² (stable across τ = 0.02, 0.05), maximum near τ ≈ 0.1 with relative excess +1.3·10⁻⁴ over
the monomial. **Exact Conjecture E is false: the Wick monomial is a saddle of the content-per-deficit ratio.** The
excess is four orders of magnitude below the margin to 0.24; the envelope E′ (≤ 0.11 on R) is what THE WAY needs.
Mechanism: |b|² = c²(r−2)² + τ²P² adds variance to |q|² without changing the phase of the X-content, so D decreases
(−1.8 % at τ = 0.1) slightly faster than C² (−0.7 %) for small τ. Also announced by the thread: a moment inequality for
VECTORS of quadratic forms that removes the covariance restriction ρ ≤ 3/140 from the Gaussian-factor family (analytic
argument complete, scalar bounds being checked at the three rows); self-interaction and mixed cubics still outside.

## 16. Refined residual target (a thread, 5 Nov ≈17:30) — VERIFIED, adopted
With κ = 0.24 and ‖U‖ ≤ r, maximising the quadratic upper bound over ‖U‖ gives Λ(q+(T−1)U) − S ≤ −D_S(q) + Ψ_r(C(q)),
Ψ_r(C) = C²/κ for C ≤ κr and 2rC − κr² beyond; D_S(q) = S − Λ(q) = [B(u) − F(q)] + [S − (B(u) − pu)], the second term
(benchmark slack) ≥ 0 since S ≥ Λ(√uW). Sufficient condition for K_η on the shared-A core:
  **S − Λ(q) + 10⁻⁴ ≥ Ψ_{r(u)}(C(q)), r(u)² = min{0.01125, (u − 0.00551)/0.319}.**
Checks: the derivation is elementary and correct; the slack is positive (vanishes at the maximising variance v* ≈ 0.0403);
the radius follows from the rectangle. Wording correction accepted: "C² ≤ κD" and "D ≥ Ψ_r(C)" are NOT equivalent (the
monograph said "equivalently"); the Ψ_r form is weaker and is the sharp consequence of the quadratic bound.
Quantitative effect along the Wick monomial (`e11_refined_target.py`, deterministic quadrature; "ratio" = Ψ_{r(u)}(C)/(D +
slack), need ≤ 1): u = 0.0056: 0.043 (was C²/(κD) = 0.167); 0.0085: 0.093 (0.204); 0.02: 0.256 (0.289); 0.0403: 0.348
(0.354); 0.0463: 0.347 (0.365). So the refinement removes the small-energy edge from the problem (slack 1.5·10⁻³ ≫ D =
5·10⁻⁴ there, and r(u) → 0) and gains ≈ 5 % at the top energy (C > κr there, so the constrained branch applies). The
hard end is now unambiguously u ∈ [0.03, 0.0463] with ratio ≈ 0.35, margin ≈ 2.9. The thread states it has NOT proved
K or the envelope, and that the general mixture of the six shells remains the open part (agrees with §15).

## 17. Hermitian thread: the whole Gaussian-factor class, no covariance restriction (5 Nov ≈18:10) — VERIFIED analytically, replay pending
`ai-notes/chatgpt-gaussian_factor_content_certificate.zip` → `ai-notes/gaussian_factor_content/vector_content/`. For
q = Σ_j X_jP_j(Y), P_j = Y*A_jY − tr A_j with ANY complex matrices A_j (shared coordinates, non-normal, non-commuting),
0.00551 ≤ u ≤ 0.0463, three rows: C(q)² ≤ 0.239·[B(u) − F(q)] (1,600,321 / 448,143 / 94,933 rational rectangles,
largest cap < 0.238086), reusing the R23 Arb kernel enclosures. Hence Λ(q + (T−1)U) ≤ B(u) − pu − (1/240)[B(u) − F(q)] ≤ S
for ‖U‖² ≤ 0.0113 with arbitrary sharing. **Removes the ρ ≤ 3/140 restriction of the earlier Gaussian-factor theorem.**
Key tool, the vector quadratic-form moment inequality: for H = (Re P_j, Im P_j)_j, V = |H|², M = EHHᵀ, u = tr M, ρ = ‖M‖:
EV³ ≤ ((25u + 100ρ)/3)EV² − (22/3)u³ − 44u·tr M² − (176/3)tr M³, proved by applying the scalar Hermitian bound to g·H for an
independent real Gaussian g and integrating (E_g(g·H)⁶ = 15V³; E_g[(gᵀMg)(g·H)⁴] = 3uV² + 12V·HᵀMH; E_g(gᵀMg)³ = u³ +
6u tr M² + 8 tr M³; then HᵀMH ≤ ρV and tr M^k ≥ ρ^k). I checked the three Gaussian identities by Wick counting and the
inequality by Monte Carlo (`e11_check_vector_moment.py`, 3·10⁶ samples, m = 1…4 random complex 3×3 matrices and a
Hermitian+nilpotent pair): ratios 0.57–0.80, and E[Y₀³ − α(τ)Y₀²] ≤ −β(τ) with margin ≥ 1.5× in every case. The content
step (direction h = Re(a*P), a unit real functional of H with Eh² ≤ ρ, weighted Cauchy–Schwarz with Z₀ = h²/u ≤ Y₀,
EZ₀ ≤ τ) is the R23 argument. Thread's statement of scope: NOT self-interaction, NOT mixed tensors, NOT E′.
Replay (user; python-flint): `cd ai-notes/gaussian_factor_content/vector_content && python3 verify.py peak && python3 verify.py flank && python3 verify.py upper`.

## 18. Hermitian thread, progress archive (5 Nov ≈18:30): `ai-notes/chatgpt-conjectureK_progress_2026-11-05.zip` → `ai-notes/progress_2026-11-05/conjectureK_audit/`
1. **Conjecture E refuted with a rigorous certificate** (Arb enclosures + exact algebra): at the peak row, u = 463/10000,
   q_τ = √(u/(2+τ²))·X[(|X|²−2) + iτ(|Y|²−1)]; exact second variation N = 2C_tD₀ − C₀D_t with C₀ ∈ (0.0324909, 0.0325454),
   D₀ ∈ (0.0120569, 0.0120835), N ∈ (6.27·10⁻⁶, 8.84·10⁻⁶); derivative of |𝒞|²/Δ in t = τ² at 0⁺ ∈ (0.00140, 0.00198) > 1/1000
   (my float 0.00165, §15 ✓), for both deficit conventions (benchmark slack k ≤ 4.0·10⁻⁵ at this u); explicit cubic
   q* with τ = 1/10000 certified by a Taylor bound (Q(t) > 1.5·10⁻¹⁵). Kernels −g, g′, φ′, −φ″ as positive double
   integrals (23)–(24), bounds |g| < 1, 0 < g′ < 3, |g″| < 64, 0 < φ′ < 3/2, |φ″| < 2. **Agrees with my §15 numbers.**
2. **Gaussian-factor theorem, second packaging** (1,988,470 / 306,582 / 53,194 rectangles, 196 polynomial boxes, 16 τ
   intervals per row; largest cap < 0.238154; own regenerated kernels reproducing the R23 tables exactly). Same theorem
   as §17.
3. **Corrections it makes to my material:** (a) the `e11_scan_majorant.py` in the bundle it received (the 14:30 bundle)
   still had `return 0.0` for g(0); fixed in the repo at 15:50 and in every later bundle (checked: current file and
   current zip carry the quadrature value); its smooth diagnostic values for the monomial, 0.03890 / 0.05239 / 0.06914 /
   0.08757 at u = 0.00551 / 0.01 / 0.02 / 0.0463, agree with my corrected scan (0.0406 / – / 0.0708 / 0.0891, MC) and my
   deterministic 0.0876133 at 0.0463. (b) In `prompt-fresh-selfinteraction.txt` the content along X was written with
   weight x; for X = xe^{iθ} the coefficient E[X̄F_A(q)] carries x² (X̄q = x²b). The R24 size-biased formula (weight R)
   is the correct one; the R26 prompt text is annotated.
4. Its own scope statement: no proof of K, of the 0.24 inequality for the self-interaction family, or of mixtures; the
   open set is as in §17.
Replay (user; python-flint + node): `cd ai-notes/progress_2026-11-05/conjectureK_audit && node verify_algebra.mjs && python3 verify.py && python3 verify_factor.py peak && python3 verify_factor.py flank && python3 verify_factor.py upper`.
**Replayed green by the user (5 Nov ≈18:50):** `verify.py` peak/flank/upper ALL REGIONS PASS, 61 τ-regions per row (my
reading of the archive said 16; it is 61: [0, 0.4] then steps of 0.01), largest cap 0.2381 < 0.239. **The whole
Gaussian-factor class is now verified on this machine.** Summary-table row moved to "certified, replayed".
**Progress archive replayed green by the user (5 Nov ≈19:00):** `verify_algebra.mjs` PASS (16 envelopes, max bound
0.238153; Gaussian moments, Taylor constants, perturbation energy, remainder margin), `verify.py` CERTIFIED (the Wick
monomial is not a local maximiser at u = 463/10000 for either deficit convention; C₀ ∈ [0.0324910, 0.0325453], D₀ ∈
[0.0120569, 0.0120834], N ∈ [6.27e-6, 8.84e-6], ratio derivative ∈ [0.001396, 0.001979], penalised ∈ [0.001190,
0.001979]; the enclosures printed match the archive's result.json exactly), `verify_factor.py` peak/flank/upper ALL
REGIONS PASS (16 r-regions; 1,988,470 / 306,582 / 53,194 boxes as stated). **Both results of §18 are verified here:
exact E is refuted with certificate, and the Gaussian-factor theorem is verified twice (two independent packagings).**
**Third packaging of the Gaussian-factor theorem (5 Nov ≈19:10):** `ai-notes/chatgpt-conjectureK_gaussian_factor_extension_20261105.zip`
→ `ai-notes/gaussian_factor_extension/gaussian_factor_certificate/`. Same theorem and same vector inequality (written
EV³ ≤ (25/3)(u+4ρ)EV² − (22/3)(u³ + 6u trΣ² + 8 trΣ³), identical to §17's form); nine real-covariance intervals, 2,928,095 /
210,173 / 33,711 rational boxes (3,171,979 total) + 471 polynomial boxes, max bound < 0.238649; all 381 inherited kernel
nodes recomputed at 128-bit precision with containment proved (`check_kernels.py`); Wick-pairing verifier of the
projection identities in arbitrary dimension (`verify_vector_moments.mjs`). Replay (user): `cd …/gaussian_factor_certificate
&& node verify_vector_moments.mjs && python3 check_kernels.py && python3 verify.py peak && python3 verify.py flank && python3 verify.py upper`.

## 19. Hermitian thread, R26 partial: uniform neighbourhood of the Wick endpoint (5 Nov ≈19:20) — VERIFIED numerically, replay pending
`ai-notes/chatgpt-wick_endpoint_extension.zip` → `ai-notes/wick_endpoint_extension/wick_extension/`. For q = X[c(|X|²−2) + P(Y)],
P ANY centred variable with E|P|² = p (no matrix restriction), u₀ = 2|c|², u = u₀ + p ∈ [0.03, 0.0463], **p ≤ u/16**:
C(q)² ≤ (49/211)[B(u) − F(q)] = 0.2322·Δ < 0.24·Δ, three rows. Ingredients: perturbation bounds C(q) ≤ C(q₀) + 4p (global
directional Hessian of F_A < 6 from complete monotonicity of −g; linear term cancels by centredness) and Δ ≥ Δ₀ − (7/2)up
(concavity, −B″(0) < 7/2); certified same-norm monomial bounds C(q₀)² ≤ 0.11Δ₀ and Δ₀ ≥ 4u₀² on u₀ ∈ [0.0279, 0.0463]
(141 coefficient intervals per row, `verify_wick.mjs`); constants A(0) < 7/2, H(0) < 9, −J(0)/2 < 17/20 (`check_constants.py`).
Arithmetic checked: √0.11 < 1/3; 4p ≤ (2p/u₀)√Δ₀ since √Δ₀ ≥ 2u₀; C ≤ (1/3 + 2/15)√Δ₀ = (7/15)√Δ₀; Δ ≥ Δ₀(1 − 7up/(8u₀²)) ≥
(211/225)Δ₀ with u ≤ (16/15)u₀, p ≤ u₀/15; ratio (49/225)/(211/225) = 49/211 ✓. My deterministic check
(`e11_check_wick_endpoint.py`, P = λ(|Y|²−1), λ real/imaginary/complex at p = u₀/15, u₀ = 0.0279, 0.03, 0.0463): C − C₀ ≤
4·10⁻⁴ vs 4p ≥ 7·10⁻³ (20× margin); Δ − Δ₀ ≥ 0 in every case (the deficit bound holds trivially); C₀²/Δ₀ = 0.077–0.088 ≤
0.11; Δ₀/u₀² = 5.6–7.9 ≥ 4; worst ratio in the neighbourhood 0.0885. So the theorem has large slack: the Hessian route
loses a factor ≈ 20 on the content, which is why it only reaches p ≤ u/16. **Open in R26: p > u/16 with c ≠ 0.**
Replay (user): `cd ai-notes/wick_endpoint_extension/wick_extension && node verify_wick.mjs && python3 check_constants.py`.
**Replayed green by the user (5 Nov ≈19:35):** `verify_wick.mjs` at the three rows (ε,ℓ,β) = (0.7564, 0.8456, 0.1432),
(0.7450, 0.8534, 0.1467), (0.7564, 0.8770, 0.1520): 141 intervals each with positive strict margins, certified monomial
ratio upper bounds 0.105 / 0.104 / 0.101 (≤ 0.11 used), direct mesh checks with positive margins (44 / 17 / 6 units; all
cells at mesh 16 or 32); `check_constants.py` PASS at the three rows and 49/211 < 6/25. **§19 verified on this machine.**
**Pending (≈19:45):** the Hermitian thread, after checking its own endpoint proof, is attacking p > u/16 through the
size-biased identity integrated over the Wick radius: the deficit becomes the expectation of an explicit nonnegative
function of P alone, so polynomial moment envelopes (the R23/vector machinery) can be applied directly on the mixed
family instead of perturbing from P = 0. This is the route suggested in `reply-wick-endpoint.txt`.

## 20. Hermitian thread: the radius-integrated deficit and the exact certificate target for the mixed family (5 Nov ≈20:00) — VERIFIED
For q = X[c(R−2) + P], P centred independent of X, with Φ(s) = 2E|L+√s| − B₀, I_c(z) = ∫e^{−r}Φ(r|c(r−2)+z|²)dr:
  H_{c,u}(z) = B(u) − B₀ − I_c(z) + B′(u)(|z|² − p) + 2uB″(u)Re(c̄z)
satisfies B(u) − F(q) = E H_{c,u}(P) and H_{c,u}(z) ≥ |c|²𝓚(u) ≥ 0 for EVERY z (H = |c|²𝓚(u) + ∫re^{−r}d_{u,r}(|c(r−2)+z|²)dr with
the Bregman gap d_{u,r} ≥ 0 of the concave Φ; the cross term uses ∫re^{−r}(r−2)Φ′(ru)dr = uB″(u)). The two centring
corrections are essential (the raw B(u) − B₀ − I_c(z) can be negative). Content: C(q) = |E T_c(P)|, T_c(z) =
∫re^{−r}[c(r−2)+z]g(r|c(r−2)+z|²)dr, and with N(z) = T_c(z) − λz − μz̄ − ν(|z|²−p) (any λ, μ, ν; EN(P) = ET_c(P)):
  **C(q)² ≤ [B(u) − F(q)]·E[|N(P)|²/H_{c,u}(P)]**, denominator strictly positive when c ≠ 0.
Sufficient certificate (quadratic P, R23 moments): |N(z)|² ≤ H_{c,u}(z)[A₀ + A₁|z|² + A₃(|z|⁶ − 37p|z|⁴)] for all z, with
A₀ + A₁p − 68A₃p³ ≤ 0.24. Open: the uniform envelope (the function of z depends on the phase of z relative to c).
**My check (`e11_check_sizebias_reduction.py`, peak row, u = 0.0463, P = λ(|Y|²−1), λ real and imaginary, p/u = 1/16,
1/4, 1/2, 3/4; B-derivatives by finite differences):** (i) E H(P) = Δ to 2·10⁻⁵ (FD error); (ii) H ≥ |c|²𝓚(u) on a
13×12 polar grid, with min H ≈ 1.4–2× the bound (𝓚(u) = 0.1913); (iii) the weighted Cauchy–Schwarz bound with optimal
(λ, μ, ν) is 0.0859 / 0.0872 / 0.0840 / 0.0832 / 0.0817 / 0.0761 / 0.0809 / 0.0760 against the true ratios 0.0861 / 0.0873
/ 0.0839 / 0.0806 / 0.0785 / 0.0635 / 0.0677 / 0.0450: **the reduction is nearly lossless (≤ 0.02 absolute) on the whole
family**, so everything now rests on a polynomial envelope of |N|²/H in |z|², where R23 lost from ≈ 0.1 to 0.239 on the
pure-P family; the same loss here would still land near 0.2 < 0.24. Phase dependence: real and imaginary λ differ by
up to 0.02 in the true ratio at p = 3u/4, so the envelope must be taken over the phase (or the worst phase bounded).

## 21. R26, directional size-biased Cauchy–Schwarz and two corrections to my suggestions (5 Nov ≈20:30)
`ai-notes/chatgpt-r26_fresh_reductions.zip` → `ai-notes/r26_fresh_reductions/direct_wick_support/` (research_note.md, explore.py,
exploration.json/log). Proved: with Δ = 𝓔 + |c|²𝓚(u), 𝒞 = αc + ÊA (α = uJ′(u)/2, A = b_R[g(R|b_R|²) − g(Ru)], Z = |b_R|² − u,
a = (Re A, Im A), N = Ê[aaᵀ/d], v = Ê[aZ/d], e = Ê[Z²/d], M = N − vvᵀ/e ⪰ 0, a₀ = (Re αc, Im αc)):
  C(q)² ≤ max_{‖h‖=1}(|hᵀa₀| + √(𝓔·hᵀMh))²,
so the sufficient inequality is max_h(|hᵀa₀| + √(𝓔 hᵀMh))² ≤ 0.24(𝓔 + |c|²𝓚(u)). Keeps the complex direction of the
content and the split of the deficit; the thread reports that the cruder scalar versions (trace, merged deficit) can
exceed 0.24 on simple mixtures while this one stays below (diagnostics, not a certificate). Consistent with my §20
finding that the optimally controlled scalar CS is within 0.02 of the truth on P = λ(|Y|²−1).
Corrections to `reply-wick-endpoint.txt`, both accepted: (a) a remainder "O(p²/u)" cannot omit third moments:
𝒞(XP_λ) = ½E[P_λJ(P_λ²)] = J′(0)p^{3/2} + O(p^{5/2}) at the pure-P end, so the content is NOT analytic in p; (b) the roles
of c and P are not symmetric (different dependence on R), so "the pure-P end is R23" does not let one exchange endpoints.
Also: a direct scalar support inequality (DS) for the aligned shell U = dX in five real variables, with its tail |z| ≥ 9/4
proved; 48 optimisation starts at the three rows return near the Gaussian contact, where quadrature error prevents a
claim. Full R26 open; the directional matrix estimate is the next certificate target.

## 22. R26 middle region: the fixed 0.22 envelope candidate (★) (5 Nov ≈21:00) — tail PROVED, compact region CONFIRMED independently (numerics)
`ai-notes/chatgpt-integrated_wick_envelope_20261105.zip` → `ai-notes/integrated_wick_envelope/wick_work/`. With f = 2|c|²/u,
p = u(1−f), λ(u) = J(u)/2 = Ê g(uR): **(★) |T_c(z) − λ(u)z|² ≤ H_{c,u}(z)·(9/100 + (13/100)|z|²/p)** for all z ∈ ℂ, claimed on
0.00551 ≤ u ≤ 0.0463, 1/16 ≤ f ≤ 15/16, three rows. If (★) holds, centring and variance alone give C(q)² ≤ 0.22·Δ(q)
for EVERY centred independent P with finite variance (no chaos moments needed): the whole middle mixing region of the
one-driver family, including the saddle direction. Tail |z| ≥ 4 proved analytically (B′ ∈ (4/5, 5/3), |λ| < 5/3, −B″ < 7,
|T_c| < 2/3, H > (4/5)h² − 2h − 3/5 > h²/4, ratio < 121/9 < envelope; rational comparisons in `exact_tail.mjs`). Compact
region |z| ≤ 4: the thread's grids (255 (u,f) pairs per row, 360 radii × 41 phases) give minimal margins 0.00374 / 0.00396
/ 0.00682 (peak/flank/upper), at u = 0.0463, f = 15/16, z = 0.
**My independent check (`e11_check_envelope_star.py`, own kernels, c real, 5 energies × 7 fractions × 81 radii ≤ 4 × 13
phases, B-derivatives by FD):** margin (★)/H positive at every point; worst 0.00355 at u = 0.0463, f = 1/16, |z| = 0.30,
arg z = 1.31 (|z|²/p ≈ 2.1; the thread reports ≈ 0.0069 near this point, mine is a different grid point and FD-level
accuracy), and 0.00378 at f = 15/16, z = 0 (thread 0.00374). Margins grow to 0.05–0.09 at small u. **So (★) is true
numerically with a small but definite margin (≈ 0.4 % of H at the hard corner), and a rigorous certificate needs
interval kernels on the 4-real-variable compact domain (u, f, Re z, Im z), i.e. the R23 machinery applied pointwise.**
Remaining after (★): f < 1/16 (the thread's moment-envelope experiments there do not get uniformly below 0.24; the
R23 endpoint f = 0 is certified, so a quantitative bridge is needed), and f > 15/16 only on u < 0.03 (the endpoint
theorem covers u ≥ 0.03). Replay of the delivered parts (user): `cd ai-notes/integrated_wick_envelope && node wick_work/exact_tail.mjs && OPENBLAS_NUM_THREADS=1 WICK_ROW=peak python3 wick_work/validate.py` (numpy/scipy; evidence, not a certificate).

## 23. Hermitian thread: envelope audit — kernel correction, exact obstruction, directional fix (5 Nov ≈21:40)
`ai-notes/chatgpt-r26_envelope_audit.zip` → `ai-notes/r26_envelope_audit/mixed_envelope/` (REPORT.md, verify_k.py, verify_barrier.py,
kernels, exploratory searches).
1. **Kernel correction (certified by Arb): 𝓚(0.0463) ∈ (0.166781, 0.166783) at the peak row**, not my 0.1913 (§20): my
   third derivative of B came from finite differences on the interpolated φ table and was 2× off; B″ was 5 % off too.
   Recomputed with B by direct quadrature (`e11_check_sizebias_reduction.py`, h = 0.008): B″ = −2.1675, B‴ = 15.87,
   𝓚 = 0.16669 ✓. **Corrections to §20 and §22:** the §20 numbers are re-run with the accurate derivatives (file and log
   replaced): E H(P) = Δ to 2.4·10⁻⁵ (quadrature truncation), Hmin ≈ 1.5–2.2× |c|²𝓚, CS bounds 0.0859 / 0.0872 / 0.0840 /
   0.0832 / 0.0817 / 0.0761 / 0.0808 / 0.0760 vs true ratios 0.0861 / 0.0872 / 0.0839 / 0.0806 / 0.0785 / 0.0635 / 0.0677 /
   0.0450 (the two cases where the bound sits 2·10⁻⁴ below the ratio are the quadrature-truncation error between the
   two computations, as the thread noted: a bound below the ratio cannot be a verification; the statement "lossless to
   0.02" stands). The §22 envelope check re-run with the accurate derivatives (`e11_check_envelope_star.py`, 129 radii ×
   25 phases, u = 0.03 and 0.0463): all margins positive; at u = 0.0463 the f = 1/16 corner margin is 0.00747 (thread ≈
   0.0069 nearby; my earlier 0.00355 was the B″ error), f = 15/16 at z = 0 stays 0.00378 (thread 0.00374), f = 3/4: 0.0097,
   f = 7/8: 0.0054; at u = 0.03 margins 0.013–0.065. **(★) confirmed with corrected kernels; the hard corner is f = 15/16,
   z = 0, u = 0.0463, margin 0.38 % of H.**
2. **Exact obstruction (certified, `verify_barrier.py`):** at the pure-P end c = 0, p = 0.0463, the three-point law
   Y ∈ {0.88, 0.89, 16.48} with EY = 1, EY² < 9, E(Y³ − 37Y²) = −68 gives E R_p(Y) > 0.2468. So **no purely radial
   polynomial envelope using only E|P|⁴ ≤ 9p² and the 37/68 sixth-moment relation can certify 0.24 at that end**; my
   suggestion in `reply-sizebias-reduction.txt` (radial Q(|z|²) with R23 moments) fails there. Not a counterexample to
   R26 (the law need not be a quadratic chaos). The radial-envelope cost in the mixed family (exploratory): 0.094 (p/u =
   1/4), 0.105 (1/2), 0.136 (3/4), 0.237 (0.99), 0.244 (0.995), 0.252 (0.999).
3. **Fix (exploratory, promising):** keep τ = |EP²|/p and the R23 directional constraint E[Re(e^{−iθ}P)²]/p ≤ (1+τ)/2,
   and majorise the REAL content projection N_θ(z)²/H ≤ Q(|z|²/p) + γRe(e^{−iθ}z)²/p; at p/u = 0.999 the sampled costs
   are 0.2393 (θ = 0), 0.2382 (π/4), 0.2281 (π/2): below 0.24 but tight. Needs continuous parameter, phase and tail
   certification. Full R26 remains open; the three pieces now are (★) on 1/16 ≤ f ≤ 15/16, the directional envelope on
   f < 1/16, the endpoint theorem on f > 15/16 (u ≥ 0.03).
Replay (user): `cd ai-notes/r26_envelope_audit/mixed_envelope && python3 verify_k.py && python3 verify_barrier.py` (python-flint).
**Replayed green by the user (5 Nov ≈22:00):** `verify_k.py` PROVED 0.166781 < 𝓚(0.0463) < 0.166783 (endpoint enclosures
0.166781587969 / 0.166782111269); `verify_barrier.py`: weights 69209/731250, 2625664/2923125, 8112959/1140018750,
second moment 3184646/1171875 < 9, E R_p > 123/500 = 0.246 > 0.24. **§23 items 1–2 verified on this machine.**

## 24. Hermitian thread: Wick endpoint extended to p ≤ u/5 on the FULL energy interval (5 Nov ≈22:30) — VERIFIED numerically, replay pending
`ai-notes/chatgpt-wick_r26_twenty_percent_20261105.zip` → `ai-notes/wick_r26_twenty_percent/wick_research/`. For
q = X[c(|X|²−2) + P(Y)], ANY centred P, v = 2|c|², p = E|P|², u = v + p ∈ [0.00551, 0.0463], **p ≤ u/5**:
**C(q)² ≤ (9/40)·[B(u) − F(q)] = 0.225·Δ** at the three rows ⇒ Λ(q + (T−1)U) ≤ B(u) − u/ε − Δ/16 ≤ S for ‖U‖² ≤ 0.0113.
Improved perturbation bounds: C(q) ≤ C(q₀) + p/(2a²) ≤ C(q₀) + (8/5)p (exact half-moment of the content kernel's
positive measure, ∫√t ν_f(dt) = 2/(3√π a²), via Euler's beta integral) and Δ(q) ≥ Δ(q₀) − vp (beta–gamma comparison),
replacing 4p and (7/2)up of §19. Verification: 432 coefficient intervals per row, rational continuum bounds, all 381
inherited kernel nodes recomputed at 128 bits. Also in the archive, SEPARATED as uncertified: an integrate-the-radius-
first reduction whose scalar envelope would cover p ≤ 0.9u.
**My check (`e11_check_wick_endpoint.py`, deterministic quadrature, accurate B, P = λ(|Y|²−1) with λ real / imaginary /
complex / negative, p = u/5, u = 0.00551, 0.01, 0.02, 0.03, 0.0463):** C − C₀ ≤ 4.4e-4 / 7.8e-4 / 1.4e-3 / 1.7e-3 / 2.1e-3 vs
allowance p/(2a²) = 1.8e-3 / 3.2e-3 / 6.4e-3 / 9.6e-3 / 1.5e-2 (4–7× slack); Δ(q) ≥ Δ(q₀) in every case (the deficit bound
holds trivially); C₀²/Δ₀ = 0.037–0.083; worst ratio in the region 0.0864. **Consistent; the theorem has ≈ 4× slack in the
content step at p = u/5.** Combined with §22–§23 the one-driver family now reads: p ≤ u/5 certified (9/40); middle
region to p ≤ 15u/16 via (★) (numerically true, certificate pending); p > 15u/16 directional envelope (tight).
Replay (user): `cd ai-notes/wick_r26_twenty_percent/wick_research && node verify_template.mjs && python3 verify_deficit.py && python3 check_kernels.py`.
**Replayed green by the user (5 Nov ≈22:45):** `verify_template.mjs` at the three rows: 432 intervals each, positive
strict margins, certified monomial ratio ≤ 0.097 / 0.097 / 0.094, perturbed ratio ≤ 0.224001 / 0.223992 / 0.222809 (all
< 9/40 = 0.225), PASS; `check_kernels.py` PASS (127 nodes per row at 128 bits); `verify_deficit.py` PASS at the three rows
(227 / 229 / 145 boxes, minimum margins 2.8e-5 / 3.3e-5 / 3.0e-5). **§24 verified on this machine: p ≤ u/5 certified.**

## 25. Hermitian thread: monograph audit and exact matrix duality (5 Nov ≈23:00) — accepted
`ai-notes/chatgpt-r26_sync_and_exact_matrix_duality.md`. (i) Two overstatements in the monograph, both corrected: "every class
without self-interaction is closed" (false: the Gaussian-factor theorem covers ΣX_jP_j(Y) only; the shells X̄B, (|X|²−1)V,
X²W̄, R₀ are untouched) and "Steps 1–3 give E′ ≤ 0.11" (a plan outcome, now marked conditional). Its "proved" list was read
from the 19:20 copy (p ≤ u/16); the current state adds p ≤ u/5 with 9/40, replayed. (ii) Exact duality for the directional
bound: for PSD A, D, max_{‖h‖=1}(√(hᵀAh) + √(hᵀDh))² = inf_{s>0} λ_max((1+s)A + (1+1/s)D) (Young's inequality, equality at
an interior minimiser via a zero of hᵀ(A − D/s²)h on the top eigenspace). With A = a₀a₀ᵀ, D = 𝓔M the matrix bound is
lossless relative to the directional bound and certifiable by a scalar s and the principal minors of 0.24ΔI − (1+s)a₀a₀ᵀ −
(1+1/s)𝓔M ⪰ 0, no angular grid. Uniform bounds on 𝓔, M, a₀ remain the substantive step; R26 not closed.
**Independent second proof of the p ≤ u/5 region (another thread, 5 Nov ≈23:45):** `ai-notes/chatgpt-conjectureK_R26_twenty_percent_extension_20261105.zip`
→ `ai-notes/r26_twenty_percent_extension/`. Same region p ≤ u/5, any centred P, but u ∈ [0.03, 0.0463] only and constant
47/200 = 0.235 (weaker than §24's 9/40 on the full interval, already replayed). Different ingredients: Hessian bound
‖D²F_A‖_∞ ≤ 2√((−g(0))g′(0)) from sup|D²(ze^{−t|z|²})| ≤ 2√t, giving C(q) ≤ C(q₀) + (9/5)p; deficit by Jensen Δ ≥ D̄(c,p) =
B(2|c|²+p) − E_Rφ(R[|c|²(R−2)² + p]); 192,648 cells, certified ceilings 0.23473 / 0.23478 / 0.23334 at the three rows.
Recorded as an independent confirmation of the same region; the project uses §24's stronger statement. Its
"exact integrated-deficit reduction" is the R24/§20 identity again.

## 26. Hermitian thread: R26 PROVED for real c and Hermitian A, all shares, u ∈ [0.03, 0.0463] (5 Nov ≈23:50) — replay pending
`ai-notes/chatgpt-r26_self_interaction_certificate_2026-11-05.zip` → `ai-notes/r26_self_interaction/r26_certificate/`. For
q = e^{iα}X[c(|X|²−2) + Y*AY − tr A], c real, A Hermitian, any dimension, u = 2c² + tr A² ∈ [0.03, 0.0463], three rows:
**Δ(q) ≥ 1/40000 and C(q)² ≤ (23/100)(Δ(q) − 1/40000)**, hence C² < 0.24Δ for EVERY self-interaction share, and with the
0.24 shell cost Λ(q + (T−1)U) ≤ S − 1/40000 for ‖U‖² ≤ 0.0113. Method: exact formulas with the R weight (F = Eφ(Rb²),
𝒞 = E[Rb g(Rb²)], b = c(R−2) + P), moment constraints on Q = P/√p (EQ = 0, EQ² = 1, |EQ³| ≤ 2, 3 ≤ EQ⁴ ≤ 9, EQ⁶ ≤
(125/3)EQ⁴ − 110: checked, from κ₃ = 2s₃, |s₃| ≤ 1, s₄ ≤ 1), degree-six polynomial majorants of the JOINT expression
F + 2ℓ𝒞 − B(u) − (23/100)ℓ² ≤ −1/40000 for |ℓ| ≤ 0.4 (the optimiser ℓ = 𝒞/0.23 ≈ 0.14 lies inside), continuum by curvature
bounds in (t = √u, θ) (𝓗_tt ≥ −(3 + 67|ℓ|), 𝓗_θθ ≥ −(0.14 + 3.5|ℓ|)); 55,539 moment-dual witnesses, 81,642,330 exact
integer polynomial comparisons; kernels by Arb (423 nodes), radial integrals by exact integer interval arithmetic.
Consistency with my numerics: on P = λ(|Y|²−1), λ real (Hermitian), ratios 0.077–0.088 ≤ 0.23 and Δ ≥ 0.0068 ≫ 1/40000.
NOT covered: non-Hermitian P (the saddle direction iτ(|Y|²−1) is anti-Hermitian, so it is outside this family; it is
inside the p ≤ u/5 theorem only), u < 0.03 with p > u/5, six-shell mixtures. One-driver self-interaction family now:
real c + Hermitian A closed on [0.03, 0.0463]; any P with p ≤ u/5 closed on the full interval; c = 0 any complex A closed.
Replay (user; numpy, python-flint, g++ with OpenMP): `cd ai-notes/r26_self_interaction/r26_certificate && python3 replay.py --quick` (then `python3 replay.py` for the scalar enclosures).
**Replayed green by the user (6 Nov ≈00:05), the independent p ≤ u/5 proof (47/200, u ∈ [0.03, 0.0463]):** 64,216 cells per
row PASS with ratio ceilings 0.234730 / 0.234778 / 0.233344; constants PASS (−g(0) = 0.835135932614… < 21/25, g′(0) =
2.1592 < 217/100 at the peak; flank 0.8342 / 2.1558; upper 0.8154 / 2.0154); C(q) ≤ C(q₀) + (9/5)p PASS. Note −g(0) agrees
with my quadrature value −0.8351359 to all printed digits.
**Replayed green by the user (6 Nov ≈00:15), `replay.py --quick`:** 129 panels / 1548 nodes, quadrature errors ≤ 2.5·10⁻⁹
with tails ≤ 8·10⁻¹¹, Hermite remainder caps 1.3·10⁻⁶ / 2.6·10⁻⁶, and at each row PASS with 18,513 moment duals and
27,214,110 exact polynomial coefficient comparisons (minimum additional cost margins ≈ 3.2·10⁻⁴ / 3.2·10⁻⁴ / 3.5·10⁻⁴ in
the checker's units); "R26 certificate: PASS". (The quick replay checks the stored enclosures; the archive's own run
reports 55,539 duals / 81.6 M comparisons for the full mode.) **§26 verified on this machine: the self-interaction family
with real c and Hermitian A is closed for every share on u ∈ [0.03, 0.0463].**

**(★)-thread, Wick neighbourhood p ≤ u/12 (6 Nov ≈00:20):** `ai-notes/chatgpt-wick_endpoint_one_twelfth_20261105.zip` →
`ai-notes/wick_endpoint_one_twelfth/`. C² ≤ (563/2420)Δ = 0.2326Δ for p ≤ u/12, u ∈ [0.03, 0.0463], any centred P, from
stronger pure-Wick bounds C(q₀)² ≤ 0.09Δ₀, Δ₀ ≥ 5v² on v ∈ [0.027, 0.0463] (523 variance intervals) with the old
perturbation constants (4p, 7up/2). **Superseded** by §24 (p ≤ u/5, 9/40, full interval, replayed) and §26 (Hermitian, all
shares). Useful parts: a smooth Abel-integral representation of the deterministic-shift kernels giving rigorous kernel
enclosures, interpolation remainders, radial quadrature errors and tails (the machinery the (★) compact certificate
needs), and certified four-parameter boxes around both corners of the (★) envelope (not yet the full middle region).
It also replayed the 𝓚(0.0463) enclosure and the radial-envelope obstruction (both pass). Not replayed here (superseded).

**Correction to `subproblem-B-sector.txt` (6 Nov ≈10:05, from a thread):** L² orthogonality of the Z-frequencies separates the
FIRST-order (content) terms of the A and B shells but not the second-order cost: the Hessian of |L+q| contains
Re(h·conj ph)Re(k·conj ph)/|L+q| and the m = 2 Fourier mode of ph(L+q) in the phase of z couples (T−1)r_A with
z²r̄_B/√2. The joint statement needs a 2×2 cost matrix [[κ_A, −κ_AB], [−κ_AB, κ_B]] ≻ 0 certified at the rows; the
sufficient condition is the dual form of (C_A, C_B). The file is amended (clipboard refreshed).
**Second correction to `subproblem-B-sector.txt` (6 Nov ≈10:15, same thread):** with F_B(q) = E_z[(z²/√2)conj(ph(L+q))] the
first variation is 2Re E[conj(r_B)F_B(q)], not 2Re E[r_B F_B(q)]: under the joint rotation (z, w) → e^{iα}(z, w), F_B → e^{iα}F_B
and r_B → e^{iα}r_B, so E[r_B F_B] → e^{2iα}E[r_B F_B] = 0 while E[conj(r_B)F_B] is invariant. Hence C_B = ‖Π₁,₀F_B(q)‖
(holomorphic part, as for A), not an antiholomorphic projection. Fixed in the file. The thread is also checking a
uniform potential bound that could give the B-cost at every amplitude.

## 27. Hermitian thread: reweighted Cauchy–Schwarz — R23 improved to 0.22 for any complex A, and the simpler small-Wick target (†) (6 Nov ≈10:30)
`ai-notes/chatgpt-r26_reweighted_certificate_20261105.zip` → `ai-notes/r26_reweighted/r26_reweighted_certificate/`. For q = XP with
EP = 0, E|P|² = u, E|P|⁴ ≥ 2u², E|P|⁶ ≤ 37u·E|P|⁴ − 68u³ (every complex quadratic form; no pseudovariance tracking):
**C(XP)² ≤ (11/50)[B(u) − F(XP)]** at the three rows, 0.00551 ≤ u ≤ 0.0463. Trick: weighted Cauchy–Schwarz with the
affine weight w(y) = 3/10 + (7/10)y (E w(Y) = 1, Y = |P|²/u) instead of the pointwise deficit, plus the moment polynomial
Q(y) = (59/500)(y−1) + b₄(2−y²) + (21/200000)(y³ − 37y² + 68) with EQ(Y) ≤ 0 (b₄ = 37/1000 peak/flank, 7/200 upper); the
pointwise certificate uy[J(uy) − J(u)]²/(4w(y)) ≤ (11/50)d_u(uy) + u²Q(y) for all y ≥ 0 (12,346 rational rectangles,
analytic tail, 441 kernel nodes recomputed at 160 bits). I checked the algebra: |E[PΔJ]|² ≤ E[w]E[|P|²ΔJ²/w] = E[uY ΔJ²/w(Y)]
≤ 4(11/50)E d_u(uY) + 4u²EQ(Y) ≤ 4(11/50)Δ ✓. The §23 obstruction (0.2468) applies to division by the pointwise deficit
and is bypassed by the affine weight; it remains valid for that method.
**Small-Wick strip candidate (†):** |T_c(z) − J(u)z/2|²/w(|z|²/p) ≤ (47/200)H_{c,u}(z) + p²Q(|z|²/p); if certified for
0 ≤ f ≤ 1/16 it gives C² ≤ 0.235Δ on the strip. Proved: the tail |z|²/p ≥ 500, and at f = 0 a margin ≥ u²/500 (hence a
uniform neighbourhood f ≤ ε₀ of unknown width). Numerical: largest required constants 0.2306 / 0.2294 / 0.2245 at the
rows; peak worst point u = 0.0463, f = 0.00336, |z|²/p = 0.415, arg z = π. Four real parameters, no angle grid.
Replay (user): `cd ai-notes/r26_reweighted/r26_reweighted_certificate && python3 check_kernels.py` and the Node/Python verifiers listed in its README (see below).
**Replayed green by the user (6 Nov ≈10:50):** `check_kernels.py` PASS (147 nodes per row at 160 bits); `verify_pure.py` PASS at
the three rows with constant 11/50 (5306 / 5376 / 1664 boxes, y-cut 400) and in bridge mode with constant 47/200 and
normalised gap 1/500 (1470 / 1418 / 1006 boxes); `verify_tail.mjs` PASS (for f ≤ 1/16, y ≥ 500, with H ≥ 0, |T| < 2/3,
|λ| < 17/20). **§27 verified on this machine: C(XP)² ≤ 0.22·Δ for every complex quadratic P on the full interval; the (†)
tail and the f = 0 bridge margin are certified.**

## 28. B-shell: global cost certificate (a thread, 6 Nov ≈11:10) — first result on the sector-assembly layer
`ai-notes/chatgpt-b_shell_global_cost_certificate.zip` → `ai-notes/b_shell_global_cost/`. With F_B(q) = E_z[(z²/√2)conj(ph(L+q))]
and the corrected pairing: **Λ(q + z²r̄/√2) ≤ Λ(q) + 2Re E[r̄F_B(q)] − κ_B‖r‖²** for ARBITRARY remote q, r ∈ L² (any sharing,
no cubic assumption, no energy cap), κ_B = 0.26 (peak), 0.29 (flank), 0.30 (upper). Proof: pointwise majorant |X+h| ≤ |X|
+ Re[h·conj ph(X)] + |h|²/(2|X|), so it suffices that J(x) = E_z[T²/(2|L+x|)] ≤ 1/ε − κ_B uniformly in x; the T²/2-weighted
law of L has planar density t²e^{−t}/(2π(a+bt)(a+3bt)) ≤ M/π, a disk estimate gives J ≤ 2√M, and 4M ≤ (1/ε − κ_B)² is
checked in BigInt rationals. (Pointwise, so it pays the "factor ½ of the phase average": the averaged B curvature is
≈ 0.94, cf. the exact joint A/B Hessian at q = 0 reported there, uncertified: diagonal 0.32005 (A), 0.94020 (B), mixed
0.11799 at the peak; the 2×2 form is positive definite with smallest eigenvalue ≈ 0.30.) Also in the note: the exact
radial/angular reduction keeping the joint law of (q, r), and a Wick-cubic example refuting the wrongly paired statement.
**Open: B-content C_B(q) = ‖Π₁,₀F_B(q)‖ against the deficit, and the certified joint A/B cost matrix.**
Replay (user; Node only): `cd ai-notes/b_shell_global_cost && node <checker>` (see its README).
**Replayed green by the user (6 Nov ≈11:20):** `verify_b_cost.mjs` PASS at the three rows (2000 rational boxes each, κ = 13/50,
29/100, 3/10, all amplitudes), Wick moments PASS, no floating point. **§28 verified on this machine: (B-cost) of the
subproblem is solved; (B-content) and (joint) remain.**

## 29. From the crashed (★)-thread's progress trail (6 Nov ≈11:30; no archive recovered)
1. Its deterministic-shift kernel tables were labelled exploratory; it then generated rigorous interpolants for the
   deterministic-shift kernels at all three rows (lost with the crash; the Abel-integral machinery of §"wick_endpoint_one_
   twelfth" is the surviving certified version of the same kernels).
2. **The directional moment envelope for the small-Wick strip is OBSTRUCTED (certified witness):** at u = 0.0463,
   c = 10⁻⁵, τ = 0.825, an eight-atom law satisfies all the moment constraints that envelope uses, and even after
   optimising its linear and quadratic controls the required cap exceeds 0.2405. The 0.2393 figure had been tested only at
   f = 0.001 in three directions. Not a counterexample to R26 (atomic law, not a quadratic chaos). The small-Wick strip
   must therefore go through the reweighted candidate (†) of §27 (affine weight; f = 0 is the certified 0.22 theorem, margin
   u²/500 at f = 0, tail |z|²/p ≥ 500 certified) or a direct perturbation from f = 0, for which the thread reports a
   rigorous but very small neighbourhood.
3. The tail of (★) is proved for |z| ≥ 2 (was 4), shrinking the compact domain by a factor 4 in area.
Consequence for the plan: strip = (†); middle = (★) on [1/16, 4/5] with |z| ≤ 2; Wick end = 9/40; Hermitian P all shares
= §26. A consolidated certificate request is in `ai-notes/prompt-one-driver-closure.txt`.

## 30. My attack on (B-content): the B kernel is half the A kernel (6 Nov ≈12:00; `e11_bcontent*.py`)
By rotation covariance F_B(q) = q·g_B(|q|²) with a real radial kernel, g_B(v) = (1/√v)E_T[(T/√2)M(r(T), √v)],
M(r,y) = E_θ[(r cos θ + y cos 2θ)/|re^{iθ} + y|] (the first two Fourier modes of 1/|re^{iθ}+y|), g_B(0) = −E[√T/(2√2 ℓ(T))] =
−0.42203 at the peak (A kernel: g(0) = −0.83514). So the B content along any remote direction is E[d̄ q g_B(|q|²)], the same
functional as the A content with g → g_B. **Finding: ρ(v) = g_B(v)/g(v) is nearly constant: ρ ∈ [0.5053, 0.5086] for
v ≤ 0.05, [0.5086, 0.5248] on [0.05, 0.5], [0.5248, 0.5432] on [0.5, 2], ≤ 0.5586 up to v = 60, monotone increasing.** Hence
C_B(q) ≈ 0.50·C_A(q) for every cubic: measured C_B²/C_A² = 0.235–0.27 on all 14 cubics × 3 energies (templates, shells,
random ten-shell mixtures), C_B²/Δ ≤ 0.0218 (u = 0.0463) ≪ κ_B = 0.26. **The (B-content) lemma therefore reduces to a
one-dimensional kernel-comparison lemma:** with ρ₀ = ρ(0) = 0.5053 and h(v) = |g(v)|(ρ(v) − ρ₀) ≥ 0 (h ≤ ≈ 0.007 everywhere,
peaking near v ≈ 0.3–0.5; h ≤ 0.0025 for v ≤ 0.05),
  C_B(q) ≤ ρ₀·C_A(q) + E[|q| h(|q|²)] ≤ 0.5053·C_A(q) + 0.007·√u
(on the templates the bound gives 0.514–0.527·C_A against the true 0.49–0.50). Certifying ρ ∈ [0.505, 0.56] and h ≤ 0.007
is a scalar interval job on explicit kernels (the threads do this in minutes), after which every A-content certificate
transfers to B with constant (0.5053 + 0.007√u/C_A)² ≈ 0.27–0.3 of the A constant.
**Joint condition, numbers (peak, κ_A = 0.24, κ_B = 0.26 pointwise, κ_AB = 0.118 uncertified):** the sufficient condition
C_A²κ_B + C_B²κ_A + 2κ_AB C_A C_B ≤ (κ_Aκ_B − κ_AB²)·Δ holds on every cubic tested with the TRUE contents (worst joint/Δ =
0.80 at the Wick monomial, u = 0.0463; 0.63 at u = 0.02; 0.36 at 0.0055), but FAILS if the A content is only known through
the certified constants 0.22–0.235 (joint/Δ ≈ 2.1): the A certificates were aimed at 0.24, the truth is 0.088. Ways to
close the joint A+B core, all needed together or in part: (i) certify κ_AB (the m = 2 Fourier mode of 1/|L+x| against
T(T−1)/√2, uniformly in x; the q = 0 value 0.118 is a guide); (ii) raise κ_B to its phase-averaged value ≈ 0.94 (as κ_A went
0.19 → 0.24); (iii) sharpen the A-content certificates toward the truth: with κ_B = 0.94 and κ_AB = 0.118 the joint
condition needs C_A²/Δ ≤ 0.189; with κ_B = 0.26 it needs ≤ 0.110. The last is the real lever and is within reach of the
existing pipelines (their envelopes were never optimised below 0.22).

## 31. Sector-assembly scan (layer L5), complete (6 Nov ≈12:30; `e11_ksector.py`, log `e11_ksector_peak.log`, run on yo)
Λ(G) for a general G ∈ H₂,₁(ℂ²) with all six sectors: Gauss–Legendre (200 nodes) in the visible radius, 48-point
trapezoid in the phase of Z, scrambled Sobol (2¹⁷ points) in the remote (X, Y); calibration: zero adversary 1.371879
(exact 1.371880), diffuse σ* = 0.2009: Λ = S − 4.8·10⁻⁶; Wick monomial alone at u = 0.0463: Λ − S = −0.01209 (= B(u) − Δ −
u/ε from the kernel tables). Results (peak row):
- worst core: Wick(u = 0.0463) + A:X (w = 0.0113), best phase 0: Λ − S = −0.0115 (phase π: −0.0251): K holds there with
  115× the allowance 10⁻⁴;
- adding 0.0113 of any other sector to that core, at every phase, LOWERS Λ: B:X̄ by 0.014–0.021, B:Ȳ by 0.011, Q:|X|²−1 by
  0.005–0.013, Q:|Y|²−1 by 0.003–0.013, Q:X̄Y and P-shells and A:Y similarly, d by 0.005–0.013 (per 0.0113 of energy, i.e.
  a cost ≥ 0.27 per unit energy for the cheapest sector at the worst phase, ≥ 1 for B);
- a 60-step hill-climb over all 18 shell coefficients at fixed energy 0.0576 never left the core (final point: q = Wick,
  A:X, all other sectors 0);
- random 18-shell mixtures: max Λ − S = −0.0093 (E = 0.03), −0.0230 (E = 0.06).
**Conclusion: numerically, every non-A sector is pure cost at every amplitude tested and the supremum of Λ lives in the
core; the sector-monotonicity statement (layer L5) is supported with margins of 3·10⁻³ to 2·10⁻² per 0.0113 of sector
energy, far above the 10⁻⁴ allowance.** Together with §30 this makes the B-sector a bounded perturbation of the A-sector
(C_B ≈ C_A/2, κ_B ≥ 0.26) and the even sectors a pure cost (a Theorem-A-type statement with q ≠ 0 to be proved).

**CORRECTION to §31 (6 Nov ≈12:50, pointed out by a GPT reading the bundle):** "every non-A sector is pure cost" is FALSE for
the B sector at small amplitude: the B shell has a first-order content (§30: C_B ≈ C_A/2 > 0 for the Wick monomial), so
Λ(q + t·z²w̄/√2) = Λ(q) + 2t·C_B(q) − O(t²) INCREASES for small t > 0 (explicitly dΛ/dt|₀ = 64B₃δ³ + O(δ⁴) > 0 for
q = δw(|w|²−2), B₃ = (3/(16√2))∫t^{−1/2}e^{−t}(a+bt)^{−3}dt). My scan only tested the fixed amplitude w = 0.0113, where the
second-order cost (≈ 1.5 per unit energy at the worst phase, well above the pointwise κ_B = 0.26) dominates. Correct
statement of what §31 supports: (i) the EVEN sectors (ZQ, Z̄P, dZ(T−2)), which have no first-order coupling to q, are
pure cost at the amplitudes tested; (ii) the B sector behaves like the A sector: a first-order gain bounded by its
content and a second-order cost, so it must be handled by the cost/content pair, exactly as the subproblem states.
**Conditional B-only theorem (same GPT, algebra checked):** if the kernel comparison C_B ≤ ρC_A + e (ρ = 0.5053, e =
0.007√u) is certified, then for every class with a certified C_A² ≤ 0.24Δ, the global B-cost κ_B = 0.26 gives
Λ(q + B) ≤ Λ(q) + (ρ√(0.24Δ) + e)²/0.26 ≤ Λ(q) + Δ + e²/(0.26 − 0.24ρ²) ≤ S + 1.15·10⁻⁵ on u ≤ 0.0463 (the elementary
(a√Δ+e)²/k ≤ Δ + e²/(k−a²) for k > a²). So the B-only core (q + B shell, no A) closes with the existing constants and the
10⁻⁴ budget absorbs the comparison remainder; no sharp relative B-content theorem is needed for that. The joint A + B +
even case remains the open composition problem (separate shell estimates do not compose; §30's joint numbers).

## 32. Hermitian thread: B-content for the whole Gaussian-factor class and a local B-cost 7/20 (6 Nov ≈13:10) — replay pending
`ai-notes/chatgpt-b_sector_content_and_cost_20261105.zip` → `ai-notes/b_sector_content_and_cost/b_sector/`. For q = ΣX_j(Y*A_jY −
tr A_j), any complex A_j, 0.00551 ≤ u ≤ 0.0463, three rows: **C_B(q)² ≤ (239/2000)[B(u) − F(q)] = 0.1195·Δ** (half the A
constant 0.239, through 0 ≤ J_B′(v) ≤ J_A′(v)/√2: both derivatives have positive integral representations with numerators
k²/√2 (B) and k² + 2bk (A), k = a + bt; consistent with my §30 ratio g_B/g ≈ 0.505–0.56 and with the independent β
reduction of §"other thread", whose kernel matched mine to 5 digits). With the global B-cost κ_B = 0.26 (replayed by that
thread too): **Λ(q + Z²r̄_B/√2) ≤ B(u) − pu − (281/520)Δ ≤ S for every shared holomorphic r_B at every amplitude.** Also
certified: the LOCAL B-cost 7/20 = 0.35 for E|r_B|² ≤ 0.0113, arbitrary remote q ∈ L², arbitrary sharing; and the
A/B mixed Hessian at q = 0 is nonzero (certified), so frequency separation of the energies does not separate the costs
(as the thread said at 10:05). Kernel nodes (381) rechecked at 128 bits. Open (its words): B-content beyond the
Gaussian-factor class (self-interaction), the finite-amplitude joint A/B estimate, the even-sector theorem.
Status of the B subproblem: (B-cost) solved (0.26 global, 0.35 local); (B-content) solved for the Gaussian-factor class
and reduced to a kernel comparison in general (§30); (joint) open. Replay (user): `cd ai-notes/b_sector_content_and_cost/b_sector && bash replay.sh` (Node 20+, python-flint).

## 33. Joint A/B: the signed form and the alignment of the contents (a GPT, 6 Nov ≈13:30) — algebra checked
With c_A = Π₁,₀F_A(q), c_B = Π₁,₀F_B(q): the kernel comparison of §30 holds in VECTOR form, ‖c_B − ρc_A‖ ≤ e (ρ = 0.5053,
e = 0.007√u), since c_B − ρ₀c_A = Π₁,₀[q g(|q|²)(ρ(|q|²) − ρ₀)] has norm ≤ E[|q|h(|q|²)]. If the joint cost has the SIGNED form
(J) Q(r_A, r_B) ≥ k_A‖r_A‖² + k_B‖r_B‖² + 2m Re⟨r_A, r_B⟩ with m > 0 (the sign of the exact mixed Hessian at q = 0, per
the GPT; to be verified uniformly in q and against the conjugation conventions), completing the square gives the exact
optimised gain ≤ ‖c_A‖²/k_A + ‖c_B − (m/k_A)c_A‖²/(k_B − m²/k_A). With k_A = 0.24, k_B = 0.26, m = 0.118: m/k_A = 0.4917,
ρ − m/k_A = 0.0136, k_B − m²/k_A = 0.2020; with ‖c_A‖² ≤ 0.24Δ, Δ ≤ (8/5)u (B′(0) ≤ √π/(2a) < 8/5), ‖c_A‖ < 0.62√u:
  Λ(q + A + B) ≤ S + (0.62·0.0136 + 0.007)²u/0.2020 < S + 5.5·10⁻⁵ for u ≤ 0.0463 (checked).
**So the existing A-content constant 0.24 suffices for the A+B core, leaving ≈ 4.5·10⁻⁵ of the 10⁻⁴ budget, PROVIDED (J)
holds with the positive mixed sign uniformly in q and the vector kernel comparison is certified.** This replaces the
worst-case matrix target of §30/§"subproblem J" (which needed sharper A constants) by: certify the signed joint cost
(sign and size of m for q ≠ 0, plus any q-dependent terms) and the two scalar kernel bounds. Note on my scan (§31): at the
worst core point the B phase changes Λ by ±0.0035, which is the size of the first-order content term alone
(2√w·C_B ≈ 0.0035), so the scan does not resolve the sign of m; a direct computation of the mixed Hessian for q ≠ 0 is
the check.
**Replayed green by the user (6 Nov ≈13:50), `b_sector/replay.sh`:** exact checks PASS (mixed integral I > 3/10; Wick first-chaos
orthogonality and cubic content tensor = 32; 64 angle cells; local cost bound 272775984428757/2⁴⁸ ⇒ κ_B = 7/20 for
w_B ≤ 113/10000 at the three rows; Gaussian-factor B content 239/2000 < κ_B); the inherited global B-cost (2000 boxes per
row, κ = 13/50, 29/100, 3/10) and the inherited Gaussian-factor A certificate (127 nodes at 128 bits; 61 τ-regions per row,
ALL REGIONS PASS) replayed again inside it. **§32 verified on this machine: B-content for the Gaussian-factor class and the
local B-cost 7/20; hence the B-only core q + B is closed for that class at every amplitude.**
**My scan of the other thread's scalar reduction (§"β", 6 Nov ≈13:55, `e11_bcontent_gaussian_factor_scan.py`):** its kernel
β(v) = −(1/(2√2))∫te^{−t}D_v(R(t))dt coincides with E_S[S·g_B(vS)] from my g_B table to 5 digits at every v tested, and
max_v v|β(v) − β(u)|²/d_u(v) = 0.2110 (u = 0.00551, at v ≈ 0.98), 0.2060 (0.01), 0.1959 (0.02), 0.1747 (0.0463): the scalar
inequality (*) with 0.26 holds numerically with ≥ 0.049 of room, maximum at the smallest u near v = 1, exactly as the
thread reported (0.210981). Now superseded by the certified 239/2000 of §32 for the same class, but it is an independent
route to the same B-content statement.

## 34. Correction to subproblem E (two threads independently, 6 Nov ≈14:10): the odd-in-z sectors have NO first-order term
Parity in z: H = q + (T−1)r_A + z²r̄_B/√2 is even in z, while L and O = zQ + z̄P + dz(T−2) are odd. Substituting z → −z
and swapping the two norm terms gives the exact identity **Λ(H + O) = Λ(H − O)** (the penalty agrees since E[HŌ] = 0), hence
dΛ(H + tO)/dt|₀ = 0 for every remote cubic, every sharing, every A/B amplitude: **there is no even-sector content at all.**
My profiles F_Y, F_W, F_ν differentiated only E|L+q| and forgot E|L−q|, whose contributions cancel (A = B in the threads'
notation); the "O(u) content" of my subproblem statement was wrong (explicit check: Λ(dz(T−2)) = Λ(0) − 2d²/ε exactly for
|d| < min(b, a/2), no linear term, although F_ν(0) = E[√T(T−2)] = −√π/4 ≠ 0). Further, for any z-even increment K,
Λ(H + sK + tO) = Λ(H + sK − tO), so **D²Λ(H)[K, O] = 0 at every even base H**: the (q, A, B) block and the (Q, P, d) block
are separate Hessian blocks exactly, not only at q = 0. What remains for E is the pure-cost statement
  (3) Λ(H + O) ≤ Λ(H) − κ_E‖O‖²  (or nonincrease) on the energy range,
and the pointwise majorant gives the sufficient restricted quadratic-form bound
  (6) E[|O|²/|L + H|] ≤ (1/ε − κ_E)‖O‖²  for O in the actual chaos sectors (uniform in H),
the same type of statement as the certified B-cost (J(x) = E_z[T²/(2|L+x|)] uniform in x). Rough size at H = 0 (peak):
E[√T/ℓ(T)] ≈ 1.26 for the Q, P sectors and E[√T(T−2)²/ℓ(T)]/2 ≈ 1.05 for the d sector, against 1/ε = 1.322, so the
pointwise route should give a small positive κ_E (the averaged curvatures are much larger: ≈ 0.70 (Y/W), 0.40 (νH)).
Subproblem file rewritten accordingly; J (signed A/B form within the even block) is the only composition question left.

## 35. Odd sectors over the zero core: certified pure cost (a thread, 6 Nov ≈14:30) — replay pending
`ai-notes/chatgpt-odd_sector_certificate.zip` → `ai-notes/odd_sector_certificate/`. For O = zQ + z̄P + dz(T−2) at every amplitude:
Λ(O) ≤ Λ(0) − k₁(‖Q‖² + ‖P‖²) − k₃·2|d|², k₁ = 0.128 / 0.156 / 0.166, k₃ = 0.330 / 0.356 / 0.361 (peak / flank / upper),
Python/Arb with rigorous tails. This certifies the zero-core mechanism (Theorem A's class, with explicit constants). For a
nonzero even base H = q + A + B it records the sufficient estimate Λ(H + O) − Λ(H) ≤ E[|O|²/|L + H|] − ‖O‖²/ε (first-order
terms cancel by parity) and states that the B-style density-cap bound is too weak here because the denominator depends
on the remote variables; the nonzero-core quadratic-form bound (6) is the open target. Replay (user; python-flint):
`cd ai-notes/odd_sector_certificate && python3 verify.py` (see its files).
**Replayed green by the user (6 Nov ≈14:40):** Q/P cost 0.1283761… / 0.1563073… / 0.1662418…, normalised d cost 0.3302126… /
0.3566242… / 0.3613362… (Arb enclosures, widths ≤ 10⁻²¹), "All-amplitude zero-core theorem: three rows certified". **§35
verified on this machine.**

## 36. Certified obstruction to the inverse-norm route (6) for the odd sectors (a thread, 6 Nov ≈15:00)
`ai-notes/chatgpt-odd_sector_inverse_norm_obstruction.zip` → `ai-notes/odd_sector_inverse_norm_obstruction/`. One remote coordinate w,
R = |w|²; H = (19/125)w(R−2) + (53/500)(T−1)w + (53/(500√2))z²w̄ (u = 0.046208, w_A = w_B = 0.011236, ‖H‖² = 0.06868),
O = z(R−1) + z̄w²/√2 (‖O‖² = 2): **E[|O|²/|L+H|] > 2.71424 > 2.64410 = ‖O‖²/ε**, by a positive 3-D integral after
rotational reduction with the numerator integrated analytically per box and the denominator bounded above by interval
arithmetic (tails dropped: a valid lower bound; python-flint, `certify.py 384`, ≈ 4 min). With O/100 the total energy is
0.06888 < 0.072 and the violation persists by homogeneity. **So (6) fails even with κ_E = 0: the uniform inverse-norm
majorant cannot prove the odd-sector pure cost over a nonzero core.** Not a counterexample to (3) or to K: the majorant
drops the subtractive term of D²|X|[O,O] = (|O|² − Re(O·conj ph X)²)/|X|; exploratory numbers keep a substantial positive
cost. My own form computation (`oddform.py`, yo, in progress): at H = 0 the form eigenvalue 1.1954 reproduces the
certified 0.128 cost; for pure-q cores c = 0.05/0.1/0.2 (my normalisation) the eigenvalue is 1.265/1.302/1.275 (< 1.322) while
the TRUE curvature in the top direction is 0.96/0.90/0.86 per unit energy, i.e. the majorant loses a factor 15–45 even
where it still works; the A/B cores are being computed. Conclusion for subproblem E: the certificate must retain the
directional (phase-averaged) curvature, i.e. a second-order expansion of E_θ|L + H + tO| in t with the exact Hessian
kernel and a remainder, not the inverse-norm majorant.
**My odd-form scan, complete (6 Nov ≈15:20; `e11_oddform.py`, log `e11_oddform_peak.log`; peak, QMC 2¹⁵ × 160 radial × 160 angular):**
cores (c, a, b) in my normalisation (Wick coefficient c/√2, A-shell a, B-shell b/√2; energies c² + a² + b²):
  (0,0,0): form λ_max 1.195, true curvature 1.32; (0.05,0,0): 1.265 / 0.96; (0.1,0,0): 1.302 / 0.90; (0.2,0,0): 1.275 / 0.86;
  (0,0.1,0): 1.257 / 0.94; (0,0,0.1): 1.217 / 1.02; (0.1,0.1,0): **1.334** / 0.875; (0.1,0.05,0.05): **1.394** / 0.87;
  (0.2,0.1,0.1) (≈ the thread's core): **1.494** / 0.79.
The inverse-norm form crosses 1/ε = 1.322 as soon as the self-interaction and the A-shell are both present (even at
energy 0.02), reaching 1.49 at the thread's core (its certified value for its own O is 2.714/2 = 1.357 along a non-optimal
direction, consistent), while the TRUE second-order cost of Λ in the worst direction stays between 0.79 and 1.32 per unit
energy at every core tested. The top direction is always ≈ (Q, P) in equal weight with little d. **Confirmed: (6) is the
wrong majorant; the true odd-sector cost is large and positive (κ_E ≥ 0.79 numerically on these cores).**

## 37. Directional odd-sector cost: first nonzero-core certificate (a thread, 6 Nov ≈15:40) — replay pending
`ai-notes/chatgpt-directional_odd_cost_certificate.zip` → `ai-notes/directional_odd_cost/`. At the very core that defeats (6)
(H = 0.152w(|w|²−2) + 0.106(T−1)w + (0.106/√2)z²w̄, O = z(|w|²−1) + z̄w²/√2): **Λ(H + τO) ≤ Λ(H) − 0.063‖τO‖² for
0.03 ≤ |τ| ≤ 0.04** (uniform amplitude interval), and cost 0.174 at |τ| = 0.04 (fixed amplitude), total energy < 0.072.
Tool: the global directional majorant, with no Taylor remainder: for M = |X|² + |Y|²,
  |X+Y| + |X−Y| − 2|X| ≤ 2(√(M − Re(XȲ)²/M) − |X|),
which I checked: squaring, (√(M+2c) + √(M−2c))² = 2M + 2√(M²−4c²) ≤ 4(M − c²/M) ⇔ √(M²−4c²) ≤ M − 2c²/M ⇔ 0 ≤ 4c⁴/M² ✓;
its second-order expansion is the directional Hessian (|Y|² − Re(XȲ)²/|X|²)/(2|X|), and it stays ≤ 2|Y| near X = 0. So the
phase-averaged directional route works at finite amplitude where the inverse norm failed (my true-curvature estimate there
is ≈ 0.79, the certificate's 0.06–0.17 is the price of the majorant). Proves one nonzero-core family, not uniform E or J.
Replay (user; python-flint, ≈ 16 s each): `cd ai-notes/directional_odd_cost/<dir> && python3 certify.py && python3 certify_single.py`.
**Replayed green by the user (6 Nov ≈15:55):** interval certificate UPPER 2.51778 < threshold 2.64410 ⇒ cost ≥ 0.0631637 per unit
odd energy on 0.03 ≤ |τ| ≤ 0.04; fixed amplitude UPPER 2.29601 ⇒ cost ≥ 0.1740460. **§37 verified on this machine.**

## 38. Signed A/B Hessian at q = 0: certified with the positive mixed sign and a 0.07 margin (a thread, 6 Nov ≈16:10) — replay pending
`ai-notes/chatgpt-signed_joint_ab_hessian_certificate.zip` → `ai-notes/signed_joint_ab_hessian/`. At q = 0, Λ(s(A+B)) = Λ(0) − s²Q₀ + o(s²)
with **Q₀ ≥ 0.24‖r_A‖² + 0.26‖r_B‖² + 0.236 Re⟨r_A, r_B⟩ + 0.07(‖r_A‖² + ‖r_B‖²)**, arbitrary dimension and sharing (Arb enclosures
of the integrals and tails, positive definiteness of the matrix difference). Exact quadratic costs at q = 0: A 0.320055 /
0.344127 / 0.347849, B 0.940202 / 0.963820 / 0.953717, signed mixed m = +0.117989 / +0.115920 / +0.112264 (peak / flank /
upper). **The mixed term has the POSITIVE sign assumed in §33 (aligned contents are penalised, not helped), at q = 0.**
Remaining for J: bound the change of the integrated directional curvature along q + s(A+B) uniformly in q (a finite-
amplitude scan of one-driver Wick cores found no violation; not a certificate). Replay (user; python-flint): see its files.
**Replayed green by the user (6 Nov ≈16:20):** peak kA 0.320054…, kB 0.940202…, m +0.117989…, determinant margin 0.00614; flank
0.344127 / 0.963820 / +0.115920 / 0.02163; upper 0.347849 / 0.953717 / +0.112264 / 0.02357 (Arb, widths ≤ 10⁻²⁶). **§38
verified on this machine.**

## 39. Infinitesimal A/B Hessian at a general q: exact pointwise kernel reduction (a thread, 6 Nov ≈16:50)
`ai-notes/chatgpt-joint_ab_uniform_reduction.zip` → `ai-notes/joint_ab_uniform_reduction/`. For fixed w rotate q(w) to x = |q(w)| ≥ 0;
with R = √t(a+bt), A = t−1, D = t/√2, V = Re^{iθ} + x, the second derivative of E_z|L + q + s(A-shell + B-shell)| in (r_A, r_B)
at s = 0 is a pointwise quadratic form given by two real 2×2 kernel matrices (reflection in θ kills the cross block):
  K_re(x) = E[vvᵀ/|V|³], v = (−AR sin θ, D(R sin θ + x sin 2θ)),   K_im(x) = E[wwᵀ/|V|³], w = (A(R cos θ + x), −D(R cos θ + x cos 2θ)),
expectation e^{−t}dt dθ/(2π). Hence **K_re(x), K_im(x) ⪯ ε⁻¹I − [[0.24, 0.118], [0.118, 0.26]] for all x ≥ 0** would give the
signed infinitesimal inequality for arbitrary remote cubics and arbitrary shared linear forms, with no energy restriction
on q (exploratory tests: no violation over sampled shifts and 150 shared two-coordinate cubics; not certified; the moving
singularity V = 0 needs interval treatment — note vvᵀ vanishes there, so the kernel is 1/dist-integrable). The thread's
caveat is right: this is the infinitesimal statement; along q + s(A+B) the base is no longer a constant shift in z.
**Consequence for J2 (my addition):** the same reduction extends to finite amplitude with more parameters: at the base
q + s(A+B), for fixed w the shift is x + (t−1)sα + z²sβ̄/√2 (α = r_A(w), β = r_B(w)), so D²Λ(q + sY)[Y, Y] is E_w of a
pointwise kernel form depending on (|x|, s|α|, s|β|, two relative phases); integrating the Hessian along the segment,
Λ(q + Y) = Λ(q) + 2Re⟨r_A, c_A⟩ + 2Re⟨r_B, c_B⟩ − ∫₀¹(1−s)E_w[Y(w)ᵀ𝒦(x, sα, sβ)Y(w)]ds, so a uniform bound
𝒦(x, α, β) ⪯ ε⁻¹I − M₀ over x ≥ 0 and the amplitude box |α|², |β|² ≤ 0.0113·(something pointwise) gives the finite-amplitude
signed cost directly, without the Lipschitz route of J2. Pointwise amplitudes are not bounded by the energies, so the
kernel bound must hold for all (α, β) ∈ ℂ², or the large-|α|,|β| region must be handled by the crude pointwise cost
(κ_A = 0.24, κ_B = 0.26 hold at every pointwise amplitude) with the mixed term dropped there and the loss paid from the
0.07 margin on the small-amplitude region. Added to J2 as route (c).

## 40. Smooth coordinates for the A/B Hessian kernel and a first nonzero-shift interval certificate (a thread, 6 Nov ≈17:10)
`ai-notes/chatgpt-smooth_joint_kernel_certificate.zip` → `ai-notes/smooth_joint_kernel/`. Push the visible Gaussian forward under
y = L(z): density ρ_L(y) = e^{−t}/(π(a+bt)(a+3bt)) with |y| = √t(a+bt). For a shift x ≥ 0 write y = Re^{iψ} − x: the Hessian
factor 1/|y+x| = 1/R cancels the polar area element R, so the gain matrix is ∫ρ_L(Re^{iψ} − x)·v vᵀ dR dψ with NO inverse-
distance singularity (the moving zero V = 0 disappears). With these coordinates Arb certified the signed infinitesimal
matrix bound K ⪯ ε⁻¹I − [[0.24, 0.118], [0.118, 0.26]] uniformly on the shift interval **0.099 ≤ |q(w)| ≤ 0.101** at the peak
row, tails included (an interval, not samples). Narrow, but the regular integration method is implemented and verified:
the all-shift kernel certificate (x ≥ 0) is now a matter of covering the x-axis, and the same coordinates serve the
five-parameter finite-amplitude kernel of §39 / J2 route (c).
**Replayed green by the user (6 Nov ≈17:20):** "PASS: signed Hessian bound uniformly for |q| in [.099, .101], peak row". The printed
balls are coarse (python-flint's default string, e.g. block 3 det "[+/- 0.0871]"), but the pass criterion is `da > 0 and db > 0
and da*db − off² > 0` on arb balls, and python-flint's `>` is true only when it holds for every point of the balls, so the
positive definiteness is certified; only the display is uninformative (suggest printing `.lower()` next time).

## 41. My independent evaluation of the A/B Hessian kernels (6 Nov ≈17:40; `e11_ab_kernel_infinitesimal.py`, `e11_ab_kernel_finite.py`)
Infinitesimal kernels of §39 (peak), Gauss–Legendre 300 in the visible radius × 4096 midpoint angles: at x = 0, K_re =
[[1.002, −0.118], [−0.118, 0.382]], i.e. costs ε⁻¹ − K = (0.320, 0.940) with mixed +0.118: **matches the certified §38 values**
(independent code, same reduction). Minimum eigenvalue of (ε⁻¹I − M₀ − K), M₀ = [[0.24, 0.118], [0.118, 0.26]], over the
two blocks: +0.080 at x = 0, +0.081 (0.02), +0.086 (0.05), +0.103 (0.10), +0.13 (0.15), +0.17 (0.2), +0.25 (0.3), +0.32 (0.4),
+0.38 (0.5), ≥ 0.42 for x ≥ 0.6, +0.74 at x = 3. **The signed infinitesimal bound holds numerically for every shift, with the
worst case at x = 0 (where it is certified) and the margin increasing in x**: the all-shift certificate is a tiling of
[0, X] with growing margins plus an analytic tail (K = O(1/x)). The thread's interval [0.099, 0.101] sits at margin 0.103.
**Finite-amplitude pointwise kernel (`e11_ab_kernel_finite.py`, log `e11_ab_kernel_finite.log`):** the directional Hessian of |V| at
the pointwise base V = Re^{iθ} + x + (t−1)α + te^{2iθ}β̄/√2 in the directions (t−1)α′ + te^{2iθ}β̄′/√2, as a real 4×4 form
in (α′, β′), against the signed target 0.24|α′|² + 0.26|β′|² + 0.236Re(α′β̄′); grid x ∈ {0, …, 0.4}, |α|, |β| ∈ {0, …, 0.3},
phases in quarter turns. Minimum eigenvalue of (ε⁻¹I − target − Hess): +0.056 over the grid for |β| = 0 (any α ≤ 0.3, x ≤ 0.4),
+0.022 for |β| = 0.05, but **−0.03 at |β| = 0.1, −0.20 at |β| = 0.2, −0.84 at |β| = 0.3** (worst at x = 0.4, |α| = 0.3).
Pointwise B amplitudes |β| ≈ 0.1 are TYPICAL (√0.0113 = 0.106), so the signed bound cannot be imposed pointwise at
intermediate bases with the full target: **route (c) of J2 in its pointwise form fails.** This is not a contradiction
with the certified costs (κ_A = 0.24 at w ≤ 0.0113 and κ_B = 0.26 globally bound the TOTAL increment, not the Hessian at
intermediate bases) nor with the thread's integrated finite-amplitude scan (no violation on Wick cores): the correct
finite-amplitude object is the segment-weighted and Gaussian-averaged form ∫₀¹2(1−s)E_w[Yᵀ𝒦(x, sα, sβ)Y]ds with (α, β) the
Gaussian values of the shells (marginals of variance ≤ 0.0113 whatever the sharing), which averages out the large-|β|
region. Status of J2: infinitesimal part numerically solid for all shifts (worst at x = 0, certified); finite amplitude
requires either the Lipschitz-of-the-B-content route (J2 main statement, where the B-cost's uniform-in-base property does
the averaging) or a Gaussian-averaged kernel certificate; the pointwise 5-parameter bound is ruled out numerically.

## 42. Signed infinitesimal A/B bound certified for EVERY remote base, all three rows (a thread, 6 Nov ≈18:10) — replay pending
`ai-notes/chatgpt-all_shift_signed_ab_certificate.zip` → `ai-notes/all_shift_signed_ab/`. For h = (T−1)r_A + z²r̄_B/√2:
**−½ d²Λ(q + sh)/ds²|₀ ≥ 0.241‖r_A‖² + 0.261‖r_B‖² + 0.236 Re E[r_A r̄_B]**, arbitrary dimension and sharing, q, r_A, r_B any
remote L² variables (no cubic assumption, no energy cap). 474 interval checks over 0 ≤ |q(w)| ≤ 6 at the three rows
(singularity-free coordinates of §40), analytic bound for |q| ≥ 6 in exact rational JavaScript, extra 0.001·I over the
target matrix; smallest certified compact-range eigenvalue margin > 0.00115518. Consistent with my §41 profile (margin
smallest at x = 0, growing with |q|). **The uniform infinitesimal J problem is closed.** Remaining: finite amplitude along
q + s(A+B) (the base acquires z-dependence), i.e. the segment-weighted Gaussian-averaged form or the B-content Lipschitz
route of J2. Replay (user; python-flint + Node, ≈ 3 min): see its README.
**Replayed green by the user (6 Nov ≈18:25):** 474 boxes cover [0, 6] at the three rows with matrix eigenvalue slack > 0.001
(minimum certified slack 0.00115518…), and the exact tail check passes for every x ≥ 6. **§42 verified on this machine: the
uniform infinitesimal signed A/B bound holds for every remote base.**

## 43. Second, independent all-shift certificate of the signed infinitesimal A/B bound, and a regularity region for the finite-amplitude path (another thread, 6 Nov ≈18:40)
`ai-notes/chatgpt-all_shift_signed_ab_certificate_v2.zip` → `ai-notes/all_shift_signed_ab_v2/`. Same statement as §42 (K_re(x), K_im(x) ⪯
ε⁻¹I − [[0.24, 0.118], [0.118, 0.26]] for all x ≥ 0, three rows) by a different cover: 229 shift intervals on [0, 6] with
midpoint integration and rigorous second-derivative error bounds, plus an analytic tail for x ≥ 6. Two independent
certificates of the uniform infinitesimal bound now exist. New: the regular-coordinate (push-forward) method extends to the
finite-amplitude path q + s(A+B) whenever the pointwise amplitudes satisfy 2|α| + √2|β| < 2√(ab) = 0.566 (peak), i.e. the
z-dependent base creates no new singularity there; a concrete region for a finite-amplitude kernel computation. Caveat
from §41: inside that region the POINTWISE signed target still fails for |β| ≥ 0.1, so the finite-amplitude certificate on
this region must be the Gaussian-averaged (or segment-weighted) form of J3, with the complement handled by the crude
pointwise costs and Gaussian tails. Replay (user): see its README.

**Two corrections to J2/J3 from a thread (6 Nov ≈18:55), both accepted:** (1) the global B-cost κ_B = 0.26 was proved for bases
q′ that are functions of w only (independent of z); the base q + (T−1)r_A of route (b) depends on z through T, so applying
the B-cost there is NOT justified by the existing certificate. Route (b) therefore needs an additional statement: the
B-cost at z-dependent even bases, i.e. E_z[T²/(2|L + x + (T−1)α|)] ≤ 1/ε − κ uniformly in (x, α) (same method, one more
parameter), or the mixed-term argument must go through route (a). (2) The kernel-ratio interval ρ(v) = g_B(v)/g(v) ∈
[0.505, 0.56] was measured at the PEAK row only; at v = 0 the flank and upper rows give 0.502632 and 0.501130, so ρ₀ = ρ(0)
must be taken per row (the vector comparison ‖c_B − ρ₀c_A‖ ≤ e then has a row-dependent ρ₀ and the same structure). The
J3 prompt and the subproblem file are amended; the 5.5·10⁻⁵ conclusion is unaffected in form (ρ₀ enters only through
ρ₀ − m/k_A, which stays ≈ 0.01).

## 44. Budget analysis of the A+B closure (6 Nov ≈19:10; `excess = Δ(c_A/k_A − 1) + ‖c_B − (m/k_A)c_A‖²/(k_B − m²/k_A)`, Δ ≤ 1.6u, u = 0.0463, ρ₀ = 0.5053)
With the A-content constant c_A = 0.24 (paired with k_A = 0.24, which must then be kept EXACT: any loss on k_A costs
Δ·δ/0.24 ≈ 3·10⁻³ per 0.07, far over budget), the excess over S is 5.5·10⁻⁵ at m = 0.118 but **1.2·10⁻⁴ at m = 0.115,
2.9·10⁻⁴ at 0.11, 8·10⁻⁴ at 0.10**: the alignment cancellation requires the finite-amplitude mixed coefficient within
≈ 0.003 of its q = 0 value — fragile. Loss on k_B is tolerable (k_B = 0.19 still gives 8.4·10⁻⁵).
**The robust lever is the A-content constant** (truth 0.088 at the top energy; certified 0.22–0.24, never minimised):
with c_A ≤ 0.15 the closure holds with room ≥ 1.6·10⁻² for any m ∈ [0.05, 0.118] and even with the mixed term dropped
(m = 0, which still needs the cross term to be nonnegative); with c_A ≤ 0.10 it holds in the sign-pessimistic norm form
(no statement about m at all: excess −5.5·10⁻³). So the two independent paths to the A+B core are: (i) J3 with m essentially
exact (hard), or (ii) sharpen the A-content certificates to ≤ 0.10–0.15 and use the already certified finite-amplitude
diagonal costs with a crude or signed mixed term. Path (ii) is a certification task on known machinery (the reweighted
R23 envelope at 0.22 was aimed at 0.24; the Hermitian 0.23 likewise). Recorded in the J3 prompt.

## 45. J3 audit (a thread, 6 Nov ≈12:10 next day-clock; Arb + exact Node) — accepted; J3 via the mixed term is abandoned
`ai-notes/chatgpt-J3_audit_certificate.zip` → `ai-notes/J3_audit/`. Certified: ρ(0) = 0.505341 / 0.502632 / 0.501130; h_*(1/2) =
|g||ρ − ρ(0)| = 0.006972 / **0.007133** / **0.007060** (> 0.007 at flank/upper); ρ(18) − ρ(0) = 0.05549 > 0.055 (upper). So both
my ratio interval and its per-row amendment are false; the common-centre bound |g_B(v) − 0.5053·g(v)| ≤ 0.007 is NOT refuted
and implies the vector comparison directly (projection contraction): that is the statement to certify. Exact obstruction
to the inference with diagonal loss δ = 0.07: M = [[0.17, 0.118], [0.118, 0.19]], c_A = 0.0144, c_B = 0.5053c_A, Δ = c_A²/0.24
gives cᵀM⁻¹c − Δ = 4.24·10⁻⁴ > 5.5·10⁻⁵ with amplitudes inside the caps (agrees with §44: fragile). Also: the B-cost cannot be
applied at q + A (its "every even L² base" form is false); route (b) spends up to 2δ per diagonal; at variance 0.0113,
P(|r_B| ≥ 0.1) = 41.3 % carrying 77.8 % of the second moment. **Decision: stop pursuing the A+B core through a near-exact
mixed coefficient; pursue the robust path (§44 (ii)): sharpen the A-content constants to ≤ 0.10–0.15 and use the certified
diagonal costs.** Next task: `ai-notes/prompt-A-content-sharpening.txt`.
