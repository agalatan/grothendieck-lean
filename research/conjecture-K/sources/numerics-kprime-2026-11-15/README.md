<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/kprime-2026-11-15/README.md (file dated 2026-11-15 02:49). Only this line was added. -->
# The retained first-chaos penalty, optimised together with the sectors

claude-b9ee, 15 November 2026. Numerical work at the peak row, prompted by the external note reviewed in
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/external-2026-11-15/REVIEW.md`.

Status labels: **P** proved (short argument given here, or cited), **N** numerical (deterministic quadrature unless
stated; no interval arithmetic; a search gives the largest value found, not a supremum), **open**.

## 0. Summary

Conjecture K drops the term −‖P₁,₀k‖² of the row. Keeping it gives the functional Λ̂ ≤ Λ below (Λ_P in the October
manuscript), for which the row bound still holds. The October record measured what this buys as a subtraction at
fixed sectors and found little (7–14 % of the mixed-gain allowance). Here the retained element is optimised
together with the A- and B-sectors. Result, by exact quadrature at the peak row:

| sector gain divided by the deficit D(q) | K | with the penalty retained |
|---|---|---|
| Wick monomial, u = 0.0463, A+B | 0.165 | 0.018 |
| largest value found over all tensors in two remote variables, u between 0.005 and 0.15, A-sector | 0.161 | 0.024 |
| the same tensors with the B-sector added | 0.166 | 0.024 |
| largest value found in three remote variables, u = 0.02 and 0.0463, A-sector | 0.161 | 0.024 |

The inequality the sectors must satisfy is gain ≤ D + η. Its margin is about 6 for K and about 40 with the penalty
retained, on everything tested (one to three remote variables). The reason is a cancellation in the first-order
term (section 3), which a subtraction at fixed sectors does not see. The retained ratio rises slowly with the
number of remote variables (section 8); its limit is not known.

## 1. Setting

Peak row: ε = 1891/2500, p = 1/ε, ℓ = 1057/1250, b = 179/1250, a = ℓ − 2b = 699/1250, L = Z(a + b|Z|²), T = |Z|².

- Row functional of Conjecture K: Λ(G) = E|L+G| + E|L−G| − p‖G‖², G ∈ H₂,₁.
- Retained version: Λ̂(G) = min over u ∈ H₁,₀ of { ‖u‖² + E|L+G−u| + E|L−G+u| } − p‖G‖² ≤ Λ(G). The row bound holds
  with Λ̂ in place of Λ.
- Remote base q ∈ H₂,₁ of variables y independent of Z, energy u = ‖q‖². Deficit D(q) = Λ_Gauss(u) − Λ(q), where
  Λ_Gauss(u) is the value at a Gaussian remote element of the same energy. sup_u Λ_Gauss(u) = S is the model value.
- A-sector (|Z|²−1)·r, r a linear form in y. B-sector Z²·conj(r_B)/√2.
- Sector inequality: the functional at q + sectors is at most Λ_Gauss(u) + η, that is, **gain(q) ≤ D(q) + η**, with
  gain(q) = sup over the sectors of the functional, minus Λ(q). For Λ̂ the minimum over u is taken inside the
  supremum; u is restricted to linear forms in y (by the symmetry y ↦ −y the optimal u has no component along Z
  when G consists of q, A and B).

Profiles (functions of v = |w|², w ∈ ℂ): E_Z phase(L+w) = w·j(v), E_Z[(T−1)·phase(L+w)] = w·g(v).
j(0) = j₀ = 1.431973791, g(0) = g₀ = −0.835135933, k_A = p − E[(T−1)²/(2|L|)] = 0.320054504.

## 2. What the record already has

- Λ̂ is the "first-chaos dual" Λ_P of `ch20-pinned-gate.tex` (15 October), with Λ′ ≤ Λ_P ≤ Λ (**P**).
- The remote bound Λ̂(q) ≤ Λ(q) − ‖Π₁[q j(|q|²)]‖²/(1+j₀), 1/(1+j₀) = 0.4112, is the theorem "quantitative penalty
  for the q-only part" of the same chapter (**P**). The chapter concludes that the usable relief is 7–14 % of the
  mixed-gain allowance on the junta family, and that the penalty "does not transfer unchanged to coupled A/B".
- `ch25-parts/20-stability-and-smoothing.tex` (25 October) has the *tied multiplier* k = α/3 + β/6: the first-chaos
  element is tied to the sector amplitudes, which is the tilt of section 3 with s = 1/3. It computes the local
  matrix (A-entry 0.71546, so the local A-cost is p − 0.71546 = 0.60659 instead of 0.320), proves by an interval
  check that this matrix is not a global majorant, and leaves a remainder inequality as an unproved target. It
  uses the multiplier for the cost only.
- The weak-K package of 15 October (`LOCAL_CHANNELS.md` §4, `GAUSSIAN_LOCALIZATION.md` §4, `TIED_GRAM_AUDIT.md`)
  has the *tied profiles* F_A + F₀/3 and F_B + F₀/6. The first is q·(g + j/3), the content profile h_s of
  section 3 at s = 1/3 up to a multiple of q. Those notes state a bound conditional on a global cost matrix and
  try to bound the tied content for all q through the law of |q|²; they report that this is not enough (errors
  around 10⁻³), in agreement with section 10. They evaluate nothing on tensors and use no other tilt.
- `RETAINED_H_SQUARE.md` §5 of the same package has one sequential test: for nine junta-plus-Gaussian residuals
  the A/B amplitudes were first optimised for the K gain, then one dual trial with both retained squares was
  evaluated at those fixed amplitudes, and its reduction exceeded the gain at all nine points (example: gain
  0.0016455, reduction 0.0029193). It is a value at fixed sectors, includes the second square, and is compared
  with the mixed gain, not with D.
- The external note of 15 November re-derives the first two items and gives the local matrix for the optimal
  multiplier (A-cost 0.60684).

Not found in the record (the search of 15 November covered the manuscript chapters, the weak-K package and the
folder of the tests of 15 October; the other October review folders by keyword only): an evaluation of the tied
or tilted content on tensors, the cancellation of section 3, a tilt other than 1/3, and the value of the sector
gain with the retained element optimised together with the sector, compared with the deficit.

## 3. The tilted sector

**Statement (P).** For every remote q, every linear form r and every real s,

    Λ̂(q + (|Z|²−1) r) ≤ 2 E|L + q + (|Z|² − 1 + s) r| − p‖q‖² − (p − s²)‖r‖².

Proof. Take u = −s·r in the minimum. G − u = q + (|Z|²−1+s)r is even in Z and L is odd, so E|L−(G−u)| = E|L+(G−u)|.
‖u‖² = s²‖r‖² and ‖G‖² = ‖q‖² + ‖r‖².

So the A-sector direction |Z|²−1 may be replaced by |Z|²−1+s, with the penalty p replaced by p − s². Expanding the
right-hand side to second order at G = 0:

- cost: **k(s) = k_A − 2g₀·s − (1+j₀)·s²** = 0.320 + 1.670 s − 2.432 s². It is 0.320 at s = 0, largest (0.607) at
  s = −g₀/(1+j₀) = 0.3434, and positive up to s = 0.843. (The record's s = 1/3 gives 0.6066.)
- content: the first-order term is 2Re⟨r, Π₁[q·h_s(|q|²)]⟩ with **h_s(v) = (g(v) − g₀) − s·(j₀ − j(v))**.

With u free (not tied to r) the second-order saddle value is

    ‖c − g₀μ/(1+j₀)‖²/(k_A + g₀²/(1+j₀)) − ‖μ‖²/(1+j₀),      c = Π₁[q g(|q|²)],  μ = Π₁[q j(|q|²)].

**The cancellation (N).** g − g₀ ≥ 0 and j₀ − j ≥ 0, and their ratio (g(v) − g₀)/(j₀ − j(v)) decreases from 1.291 (v
→ 0) to −g₀/j₀ = 0.583 (v → ∞) (`tilt_profiles.log`; its first entry, 1.271 at v = 10⁻⁴, is a quadrature error of
the fixed grid: adaptive quadrature gives 1.2908 there and a monotone ratio, `ratio_small_v.log`). So for s between
0.58 and 1.29 the profile h_s changes sign, positive for small |q| and negative for large |q|, and its projection on
the first chaos is small. On the Wick monomial at u = 0.0463, c = 0.03250 and μ = −0.03467: the content c + sμ is
0.63·c at s = 0.343, 0.36·c at s = 0.6, and vanishes near s = 0.94. The cost-optimal tilt (0.34) and the content-
optimal tilt (0.94) differ; the best compromise on the monomial is s ≈ 0.75.

## 4. Exact values on the Wick monomial (N)

q = c·y(|y|²−2)/√2, one driver, real amplitudes. `retained_content.py`, `retained_joint.py` (two- and
three-dimensional quadrature).

| u | D(q) | K: gain (A) / D | K: gain (A+B) / D | retained: gain (A) / D | retained: gain (A+B) / D |
|---|---|---|---|---|---|
| 0.0100 | 0.0013757 | 0.1246 | 0.1261 | 0.0214 | 0.0216 |
| 0.0200 | 0.0038499 | 0.1482 | 0.1510 | 0.0225 | 0.0230 |
| 0.0300 | 0.0067831 | 0.1568 | 0.1605 | 0.0210 | 0.0218 |
| 0.0463 | 0.0120635 | 0.1604 | 0.1653 | 0.0170 | 0.0183 |

Second-order formula of section 3 at u = 0.0463: 0.000205; exact: 0.0002049.

## 5. All tensors in two remote variables (N)

`kprime2.py`: q ∈ H₂,₁(ℂ²) of energy u (6 complex coefficients), A-sector r = ⟨α, y⟩, retained u = ⟨γ, y⟩, all complex.
Deterministic quadrature (51 200 remote nodes × 48 visible nodes), exact gradients, L-BFGS over the tensor with the
saddle in (α, γ) solved inside, three restarts per run (near the monomial, near the family below, random).
Checks: the monomial in rotated coordinates reproduces the one-variable numbers to 3·10⁻⁷ in D; a finer grid
(196 608 × 72 nodes) moves the ratios by at most one unit in the fourth decimal (0.0237 becomes 0.0236, 0.1609
becomes 0.1608; `search/fine_*.log`). Logs and maximisers in `search/`.

| u | K: largest gain/D found | retained: largest gain/D found | retained, at the K maximiser |
|---|---|---|---|
| 0.005 | | 0.0179 | |
| 0.010 | | 0.0215 | |
| 0.020 | 0.1477 | 0.0237 | 0.0226 |
| 0.030 | | 0.0232 | |
| 0.0463 | 0.1609 | 0.0208 | 0.0179 |
| 0.065 | | 0.0173 | |
| 0.090 | 0.1554 | 0.0127 | 0.0074 |
| 0.150 | | 0.0046 | |

With the B-sector added at these tensors (`kprime2b.py`, the visible phase integrated numerically; the tensor is
not re-optimised):

| tensor | K: A | K: A+B | retained: A | retained: A+B |
|---|---|---|---|---|
| monomial, u = 0.02 | 0.1478 | 0.1505 | 0.0225 | 0.0231 |
| retained maximiser, u = 0.02 | 0.1401 | 0.1424 | 0.0237 | 0.0241 |
| monomial, u = 0.0463 | 0.1606 | 0.1655 | 0.0170 | 0.0183 |
| retained maximiser, u = 0.0463 | 0.1479 | 0.1519 | 0.0208 | 0.0218 |
| K maximiser, u = 0.0463 | 0.1609 | 0.1657 | 0.0179 | 0.0192 |
| monomial, u = 0.09 | 0.1540 | 0.1609 | 0.0052 | 0.0075 |
| retained maximiser, u = 0.09 | 0.1299 | 0.1348 | 0.0127 | 0.0142 |

- For K the maximiser is close to the monomial, as in the search of 13 November for the content ratio.
- With the penalty retained the maximiser has more weight on X(|Y|²−1).
- **In two variables the margin of gain ≤ D is about 6 for K and at least 41 with the penalty retained**, at every
  energy tried.

## 6. A fixed tilt (N)

`kprime2s.py`: the retained element tied to the sector, u = −s·r with s fixed, so the functional is the right-hand
side of the statement of section 3. Largest gain/D found over all two-variable tensors (three restarts each;
`search/tilt_*.log`):

| tilt s | u = 0.02 | u = 0.0463 | on the monomial, u = 0.0463 |
|---|---|---|---|
| 0 (K) | 0.1477 | 0.1609 | 0.1604 |
| 0.3434 | | 0.0510 | 0.0505 |
| 0.5 | 0.0312 | 0.0331 | 0.0321 |
| 0.6 | 0.0257 | 0.0256 | 0.0241 |
| 0.7 | 0.0237 | 0.0211 | 0.0184 |
| free multiplier (section 5) | 0.0237 | 0.0208 | 0.0170 |

A single fixed tilt s = 0.7 does as well as the free multiplier on the worst tensors found. So the sector
inequality with the penalty retained can be stated without a saddle: for every remote q and linear form r,

    2 E|L + q + (|Z|² − 3/10) r| − (p − 49/100)‖r‖² ≤ 2 E|L + q| + κ·D(q) + η,

where any κ < 1 suffices and the largest value found is κ = 0.024.

## 7. The structured family with a bath (N)

`family.py`: q = X[c₁(|X|²−2)/√2 + c₂·S_m/√m], S_m = Σ_{k≤m}(|Y_k|²−1), with real c₁, c₂, c₁² + c₂² = u, for m bath
variables and for the Gaussian limit of the bath; the sector and the retained element along X; exact quadrature in
(|X|², S_m, T). Largest gain/D over the mixing angle (`family.log`):

| bath variables m | K, u = 0.0463 | retained, u = 0.02 | retained, u = 0.0463 | retained, u = 0.09 |
|---|---|---|---|---|
| 1 | 0.1603 | 0.0231 | 0.0185 | 0.0082 |
| 2 | 0.1603 | 0.0227 | 0.0179 | 0.0073 |
| 3 | 0.1603 | 0.0225 | 0.0173 | 0.0065 |
| 5 | 0.1603 | 0.0225 | 0.0169 | 0.0055 |
| 10, 30, 100 | 0.1603 | 0.0225 | 0.0169 | 0.0052 |
| Gaussian bath | 0.1603 | 0.0225 | 0.0169 | 0.0052 |

- For K the maximum over the family is at c₂ = 0, the monomial, for every m.
- With the penalty retained the maximum is at m = 1 and decreases as bath variables are added; from m = 5 on it is
  the monomial again. So within this family more remote variables do not raise the ratio.
- The family does not contain the two-variable maximisers of section 5 (0.0208 at u = 0.0463 against 0.0185 here):
  those have complex coefficients outside it.

## 8. Three remote variables (N)

`kprime3.py`: as section 5 for q ∈ H₂,₁(ℂ³) (18 complex coefficients), on a coarser grid (839 808 × 40 nodes; it
reproduces the monomial ratios 0.1604 and 0.0170 as 0.1601–0.1606 and 0.0170–0.0172, so the third decimal of a
ratio is reliable and the fourth is not). Two structured tensors at u = 0.0463: X[(|X|²−2) + 1.2(|Y|²−1)] gives
K 0.1443, retained 0.0185; with a second bath variable of the same weight, K 0.1296, retained 0.0178.

Search over all tensors (`search3/`; two restarts per run; when this was written four runs of the retained search
at u = 0.0463 and one at u = 0.02 had finished, and one restart of the K search):

| u | retained: largest gain/D found, three variables | two variables (section 5) | one variable |
|---|---|---|---|
| 0.0200 | 0.0241 | 0.0237 | 0.0225 |
| 0.0463 | 0.0230 (four runs from random starts agree) | 0.0208 | 0.0170 |

For K at u = 0.0463 the largest ratio found in three variables is 0.1611 (two variables: 0.1609; monomial: 0.1604).

The retained ratio rises slowly with the number of remote variables (at u = 0.0463: 0.017, 0.021, 0.023), and the
maximisers become less far from Gaussian (E|q|⁴/u² − 2 = 42, 19, 13). Nothing is known beyond three variables: the
limit of this sequence is open, and with it the size of the margin in general. A deterministic grid is too large
for four variables; a sampling method with variance reduction is needed.

## 9. Finite amplitude: second derivative along the sector (N)

`tilt_restricted.py`. Θ(R) = sup over base points (w, ρ) with |ρ| ≤ R, and over directions, of the second derivative
of ρ ↦ E_Z|L + w + (T−1+s)ρ|. The sector stays concave along the segment while Θ(R) < p − s².

| s | budget p − s² | at 0 | R = 0.05 | 0.10 | 0.20 | 0.30 | 0.50 | no restriction |
|---|---|---|---|---|---|---|---|---|
| 0 (K) | 1.3221 | 1.0020 | 1.0046 | 1.0051 | 1.0233 | 1.0462 | 1.2267 | 1.5758 |
| 0.2 | 1.2821 | 0.7252 | 0.7263 | 0.7285 | 0.7428 | 0.7673 | 1.0473 | 1.3581 |
| 0.3434 | 1.2041 | 0.5973 | 0.5985 | 0.6016 | 0.6154 | 0.6417 | 1.1792 | 1.3235 |
| 0.5 | 1.0721 | 0.5249 | 0.5259 | 0.5293 | 0.5533 | 0.6246 | 1.3191 | 1.5434 |

- With the sector value |ρ(y)| ≤ 0.3 the cost is at least 0.276 for K (local 0.320) and 0.562 at s = 0.3434
  (local 0.607). The optimal amplitudes are |α| ≈ 0.03–0.06, so |ρ(y)| ≤ 0.3 fails only for |y| ≥ 5.
- Without restriction the second derivative exceeds the budget in every row, in agreement with the record's
  refutation of the local matrix as a global majorant (there at q = 3/4, α = 7/20). Both variants need an a priori
  bound on the sector amplitude. (Grid search, not a certified supremum.)

## 10. Cauchy–Schwarz on the content (N)

Since Π₁q = 0, ‖Π₁[q h_s(|q|²)]‖² ≤ min over κ of E[|q|²(h_s(|q|²) − κ)²], a functional of the law of |q|² alone.
`cs_check.py`, `cs_gauss.py`.

| on the monomial, u = 0.0463 | s = 0 (K) | s = 0.3434 | s = 0.6 | s = 0.75 |
|---|---|---|---|---|
| content²/D | 0.0876 | 0.0352 | 0.0114 | 0.0035 |
| Cauchy–Schwarz bound /D | 0.377 | 0.128 | 0.034 | 0.015 |
| local cost k(s) | 0.320 | 0.607 | 0.447 | 0.205 |
| Cauchy–Schwarz bound / (k·D) | 1.18 | 0.21 | 0.076 | 0.073 |

- For K the Cauchy–Schwarz bound exceeds the deficit (1.18): useless. With tilt 0.6 it is 0.076·D on the monomial.
- It cannot work uniformly: for a nearly Gaussian q the deficit tends to 0 and so does the true content, but the
  Cauchy–Schwarz bound does not. For the exponential law of |q|² (Gaussian q) at u = 0.0463 the bound divided by
  the cost is 9.9·10⁻⁴ for K and 1.6·10⁻⁴ at the best tilt (s = 0.65). The slack of the target 1.402 over the
  model value is 1.31·10⁻⁴. So Cauchy–Schwarz alone does not prove 1.402 this way either; a structural content
  lemma (content² ≤ κ·D) is still needed, but its constant may be many times the true one.

## 11. What this changes and what it does not

- It changes the sector part of Conjecture K. The inequality gain ≤ D + η has margin 6 for K, and the audit of
  13 November found its proof missing (content bound with margin 1.14, joint remainder bound not proved). With the
  penalty retained the margin is about 40 on everything tested (one to three remote variables).
- It does not change the remote part: D(q) ≥ 0 with slack, for every remote cubic, is the same statement as before.
- Open: more than three remote variables, where the ratio may still rise (section 8); the other rows of the cover;
  the even sectors (Y, W, ν), where the retained element can have a component along Z; a proof of any of it.

## Files

- `retained_content.py`, `retained_joint.py`: the monomial, A and A+B, with and without the retained element.
- `kprime2.py` (search, two variables), `kprime2b.py` (B-sector at given tensors), `kprime2s.py` (fixed tilt),
  `kprime3.py` (three variables), `family.py` (structured family with m bath variables), `search/` (logs and
  maximisers as JSON lines).
- `tilt_profiles.py`, `ratio_small_v.py`, `tilt_restricted.py`, `cs_check.py`, `cs_gauss.py` with their logs.
- `search3/`: logs and maximisers of the three-variable runs.
