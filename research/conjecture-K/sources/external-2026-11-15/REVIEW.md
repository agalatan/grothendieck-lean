<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/external-2026-11-15/REVIEW.md (file dated 2026-11-15 02:49). Only this line was added. -->
# Review of the two reports received on 15 November 2026

Reviewer: claude-b9ee, 15 November 2026. Scripts and logs are in `review/`; the follow-up computations are in
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/kprime-2026-11-15/`. Peak row throughout:
ε = 1891/2500, p = 1/ε, ℓ = 1057/1250, b = 179/1250, a = ℓ − 2b = 699/1250, L = Z(a + b|Z|²). Status labels as in the
audit of 13 November: **P** re-derived here, **C** checker replayed, **N** numerical here, **R** read only.

## 1. "Retaining the first-chaos penalty" (`projection-attack-report.md`, `projection-attack-package/`)

| item | what it says | check | status | already in the record? |
|---|---|---|---|---|
| Theorem 1 | the row bound holds with Λ̂(G) = min_{u ∈ H₁,₀}{‖u‖² + E\|L+G−u\| + E\|L−G+u\|} − p‖G‖², and Λ̂ ≤ Λ | read and re-derived | P | yes: Λ̂ is Λ_P of `ch20-pinned-gate.tex` (15 October), proposition "first-chaos dual" |
| Lemma 2 | the gradient of M(w) = E\|L+w\| is j₀-Lipschitz, j₀ = ½E\|L\|⁻¹ | read; eigenvalue bounds checked | P | yes: proof of the theorem "quantitative penalty for the q-only part" in `ch20` (H₀/2 = 1.4319737913) |
| Theorem 3 | for remote q: Λ̂(q) ≤ Λ(q) − ‖P_rem m(q)‖²/(1+j₀), m(q) = E_Z phase(L+q) | read; tested on the Wick monomial at six amplitudes, margins 1.5e-8 … 2.7e-2 (`review/review_check.log`) | P, N | yes: the same theorem of `ch20`, same constant 0.4112 |
| Theorem 4 | local expansion Λ̂(sH) = 2E\|L\| − s²Q(r_A, r_B) + o(s²), H = (\|Z\|²−1)r_A + Z² conj(r_B)/√2, with the matrix (0.60684, 0.26291; 0.26291, 1.01344) | formulas re-derived for one shared driver; finite differences of the exact functional converge to them (`review/review_check.log`) | P (that case), N | partly: `ch25-parts/20-stability-and-smoothing.tex` has the same matrix for the *tied multiplier* k = α/3 + β/6 (there M = (0.71546, −0.26274; −0.26274, 0.30873), and p·I − M = (0.60659, 0.26274; 0.26274, 1.01332)); the note uses the optimal multiplier instead of the rational one |
| Proposition 5 | a weighted cubic contraction can be negative (not a counterexample to K) | verifier replayed only | C | not found |
| constants | j₀, 1/(1+j₀) = 0.411188641745, matrix entries, smallest eigenvalue 0.47779 | package verifier replayed with python-flint 0.9.0, output identical to `results.txt` (`review/verify_replay.log`); independent floating-point quadrature agrees to 12 digits | C, N | |

Verdict: correct as far as checked; it changes no bound and says so. Its theorems are those of the October
manuscript (chapters 20 and 25), found again with the exact multiplier.

**What the record concluded from them.** The October manuscript measured the relief of the retained penalty as a
subtraction at fixed sectors: the raw penalty is 16–31 % of the mixed-gain allowance on the junta family
(`kprime.py`), the part guaranteed by the theorem of `ch20` is 7–14 %, and the stationarity version K_rot pays
13–57 % of the measured mixed gain. `ch20` adds that the q-only penalty "does not transfer unchanged to coupled
A/B". `ch25` has the tied multiplier k = α/3 + β/6 with its cost matrix (coercivity 0.607 instead of 0.320) and
shows that the local matrix is not a global majorant. The weak-K package of 15 October behind that chapter also
has the tied content profiles F_A + F₀/3 and F_B + F₀/6, tries to bound the tied content for all q through the
law of |q|² and reports that this is not enough; and one test (`RETAINED_H_SQUARE.md` §5) in which, at the
K-optimal sectors of nine examples, a dual trial with both retained squares reduced the functional by more than
the mixed gain.

## 2. New: optimised together with the A-sector, the retained element pays most of the mixed gain

None of those measurements optimises the retained element u together with the sector and compares the result
with the deficit. Doing so (sup over the sector of the minimum over u) gives, by exact quadrature:

| | K: gain / D | K′: gain / D | part of the K gain that K′ removes |
|---|---|---|---|
| Wick monomial, u = 0.0100 (A+B) | 0.126 | 0.022 | 83 % |
| Wick monomial, u = 0.0200 (A+B) | 0.151 | 0.023 | 85 % |
| Wick monomial, u = 0.0463 (A+B) | 0.165 | 0.018 | 89 % |
| worst two-variable tensor for K′, u = 0.0200 (A) | 0.140 | 0.024 | 83 % |
| worst two-variable tensor for K′, u = 0.0463 (A) | 0.148 | 0.021 | 86 % |
| worst two-variable tensor for K, u = 0.0463 (A) | 0.161 | 0.018 | 89 % |

D(q) is the deficit of q against the Gaussian of the same energy; "gain" is the supremum over the sector amplitudes
of the functional, minus Λ(q); the statement to prove is gain ≤ D + η. So the margin of the sector inequality is
about 6 for K and about 40 for K′. In three remote variables the largest K′ ratio found is 0.024 (u = 0.02) and
0.023 (u = 0.0463): the ratio rises slowly with the number of variables, and its limit is not known.

Mechanism. The retained element changes three things at once, and the fixed-sector subtraction sees only the last:

    sup_r inf_u [ 2r·c − k_A r² − 2u·μ + (1+j₀)u² − 2g₀ r u ]
      = (c − g₀μ/(1+j₀))² / (k_A + g₀²/(1+j₀)) − μ²/(1+j₀),      c = Π₁[q g(|q|²)],  μ = Π₁[q j(|q|²)].

1. The cost k_A = 0.320 becomes 0.607 (known since `ch25`).
2. The content c becomes c − g₀μ/(1+j₀) (the tied profile of the weak-K package, with the optimal multiplier).
   c and μ have opposite signs, because the profiles g − g₀ and j − j₀ do, and g₀ < 0: on the monomial the
   content is multiplied by 0.63, and by less for a larger tilt. This cancellation, and its size on tensors, is
   the new point.
3. The term −μ²/(1+j₀) is subtracted (the theorem of `ch20`).

On the monomial at u = 0.0463 (c = 0.03250, μ = −0.03467) the formula gives 0.000205; the exact value is 0.0002049.

The details (tilted-sector formulation, the search over all two-variable tensors, the finite-amplitude second
derivative, what a Cauchy–Schwarz bound gives) are in the `kprime-2026-11-15` folder named above.

What this does and does not establish:
- Exact numerics at the peak row, for the A-sector (and A+B on the monomial), all tensors in two remote variables. **N.**
- Not a theorem. It leaves the remote part (D(q) ≥ 0 with slack) untouched.
- Not done: more than three remote variables, the other rows, the even sectors.

## 3. "Remote closure" (`remote-closure-report.md`; package not received)

Nothing could be checked: status **R** for every claim. Two remarks.

- The normalisation is consistent with ours: with λ = 0.75637, η = 0.31631 the visible profile is
  L = Z(0.66165 + 0.16917\|Z\|²), ratio 0.2557 (peak row 0.2561), and the supremum of Φ over Gaussian remote q is
  0.7131355 at E\|q\|² = 0.0572, the known model norm (`review/ratio_form.log`). So claim (1), Φ(q) ≤ 0.71325 for every
  remote cubic with E\|q\|² ≤ 1, would close the remote part with a loss of 1.15e-4, just below the threshold
  500/701 = 0.7132668 for 1.402. The October manuscript has remote statements of this kind at the peak profile; the
  audit could only label them R.
- The upper bound of the second message (1.404896400821) is weaker than the repository's proved 1.4046 and has no use
  here. Its device, writing the tail as H(1) minus the head, is the identity behind the identity-tail games of
  14 November.

## 4. What to do with this

1. Extend the K′ search beyond three remote variables (a sampling method is needed) and to the other rows.
2. State the sector lemma for K′ (gain ≤ κ·D with κ about 0.03 true and anything below 1 sufficient) and ask for a
   proof with crude constants; the remote part is then the only piece that needs sharp constants.
3. Ask for the `grothendieck_remote_closure.zip` package and replay it.
