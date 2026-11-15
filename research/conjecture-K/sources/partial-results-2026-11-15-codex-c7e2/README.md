<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-partial-2026-11-15/conjecture_k_partial_results/README.md, 15 November 2026; Agent-ID: codex-c7e2. -->
# Conjecture K: rigorous partial results

Agent-ID: codex-c7e2. 15 November 2026.

**Full Conjecture K remains unproved in this work.** This package contains paper proofs, exact scalar checkers, and exploratory numerical searches. It supplies no new Grothendieck endpoint and is not a Lean formalization.

The baseline read was [agalatan/grothendieck-lean at 6bb44599190397f806d2db89b25df4e6785b758e](https://github.com/agalatan/grothendieck-lean/tree/6bb44599190397f806d2db89b25df4e6785b758e), including the root README, AGENTS, Conjecture-K README, MONOGRAPH, STATUS, and relevant proof sources. The baseline endpoints are 1.401700322371 < K_G^C < 1.404599398052. No change to those endpoints is asserted.

## 1. The problem

For independent standard complex Gaussians, put L=Z(a+b|Z|²), p=1/epsilon, and

\[
\Lambda_p(G)=\mathbb E|L+G|+\mathbb E|L-G|-p\mathbb E|G|^2,
\quad B(v)=2\mathbb E|L+\sqrt vW|,
\quad S_p=\sup_{v\ge0}(B(v)-pv).
\]

Here W is independent of every genuine coordinate. K asks for Lambda_p(G)<=S_p for every finite-dimensional cubic Wick polynomial G of bidegree (2,1), on the stated profile box. A remote q is independent of Z. A Gaussian bath W is a diffuse limit of cubics, not a member of the cubic chaos on the original coordinates.

## 2. Main result: exact remote comparison near the Gaussian law

There exists a universal, dimension-independent chi_0>0 such that every nonzero remote cubic q satisfying

\[
u=\mathbb E|q|^2,\qquad \delta=\mathbb E|q|^4-2u^2,
\qquad 0<\chi=\delta/u^2\le\chi_0
\]

obeys

\[
\mathbb E|q|\le\frac{\sqrt\pi}{2}\sqrt u\,(1-\chi/32),
\qquad B(u)-2\mathbb E|L+q|\ge\frac{-B''(u)}8\,\delta>0.
\]

This proves exact remote K on this cone at every energy, every p>0, and every profile a>0,b>=0. It uses the dimension-uniform total-variation Edgeworth theorem of Mansanarez, Poly and Swan, [arXiv:2510.14002v2, Theorem 1.2](https://arxiv.org/html/2510.14002v2), plus the repository's sixth-cumulant bound. Clipped absolute values allow its application to the nonsmooth, unbounded radius; independent cubic approximations then give Gaussian-buffer closure and the scale-mixture comparison.

The threshold is not numerically evaluated: if A is the normalized constant in the stated Edgeworth estimate, a valid choice is

\[
\chi_0=\frac23\min\left\{\frac1{81},
\left[\frac{\sqrt{2/\pi}}{48(A+17)}\right]^4\right\}.
\]

This is a genuine existence theorem, not a usable cutoff for the current finite certificates. The proof and the exact scalar checks are in [remote/NEAR_GAUSSIAN_REMOTE.md](remote/NEAR_GAUSSIAN_REMOTE.md) and `remote/check_constants.py`. It strengthens the current record's unreconstructed smooth Edgeworth claim; it does not assume that claim.

## 3. All-profile Gaussian local stability

For every a,b>0, v>=0 and cubic H independent of the auxiliary bath W,

\[
\frac12\frac{d^2}{dt^2}\Lambda_p(\sqrt vW+tH)\bigg|_{t=0}
\le(B'(v)-p)\|H\|_2^2.
\]

At p=B'(v), equality occurs precisely for remote directions; every nonzero visible sector has strictly positive quadratic cost. The proof uses positive Laplace-integral matrices and a monotone Gamma(3/2) smoothing ratio, without numerical premises. This extends the earlier peak-profile tangent theorem to every positive profile and every buffer variance.

For an interior Gaussian optimizer v_*, this also gives a strict local maximum in each fixed finite coordinate block. Writing H=q+h with q remote and h visible, locally

\[
S_p-\Lambda_p(\sqrt vW+q+h)
\ge c_1(v+\|q\|_2^2-v_*)^2+c_2\|q\|_2^4+c_3\|h\|_2^2.
\]

The constants and neighborhood may depend on dimension. This theorem does not allow H to depend on W and does not imply global Gaussianization monotonicity.

Full proof: [all-sector/GAUSSIAN_LOCAL_STABILITY.md](all-sector/GAUSSIAN_LOCAL_STABILITY.md). The companion checker verifies algebraic identities and supplies numerical cross-checks; those sampled integrals are not the proof.

## 4. A stronger retained regional estimate

The retained functional is

\[
\widehat\Lambda(G)=\inf_{\xi\in H_{1,0}}
\{\|\xi\|_2^2+\mathbb E|L+G-\xi|+\mathbb E|L-G+\xi|\}
-p\|G\|_2^2\le\Lambda(G).
\]

At the peak profile, write the six orthogonal sector energies as u (remote), V (A+B), W_Q, W_P, W_nu, using the normalized visible cubic nu Z(T-2)/sqrt(2). An exact rational certificate proves

\[
\widehat\Lambda(G)\le B_0+\frac{413}{500}u-\frac{11}{40}V
-\frac{16}{125}W_Q-\frac{213}{500}W_P-\frac{249}{500}W_\nu,
\qquad B_0=\frac{387\sqrt\pi}{500}<S_p.
\]

The trial is xi=-(2/5)r_A-(7/100)r_B-(2/7)nu Z. Thus when q=0, the retained inequality is closed for **all other sectors simultaneously, in every dimension and at every amplitude**. For nonzero q the same estimate enlarges the existing retained region, but it does not reach the critical remote energy on the q-axis.

The scalar anisotropic inequality and its raw application were already present in the October manuscript; those parts were rediscovered here and are not claimed as new. The retained trial extension is the additional step. See [boundary/ANISOTROPIC_REGION.md](boundary/ANISOTROPIC_REGION.md) and its standalone exact checker.

## 5. Supplementary lemmas and searches

* [variational/JOINT_ODD.md](variational/JOINT_ODD.md) proves a stronger simultaneous zero-core odd-sector estimate with arbitrary shared drivers; it does not handle a nonzero even core.
* [joint/SHARP_PAIRED_NORM.md](joint/SHARP_PAIRED_NORM.md) proves sharp Euclidean remainder bounds, with paired quartic coefficient 27/128 and one-sided cubic coefficient 16/27. The latter also certifies the auxiliary target (P) on `|w|<=1/8`, `sqrt(|A|²+|B|²)<=1/256`, in every complex direction. Combined with the inherited larger-shift regions, this doubles the uniform amplitude strip from 1/512 to 1/256. Seventeen fresh interval endpoint integrals, exact matrix checks, and the inherited shift-curvature bound supply the certificate in `joint/origin-strip/`. Full (P) and the averaged odd-sector premise remain open.
* `boundary/search.py` and its JSONL records contain 100 coarse and 100 finer optimizations in H_(2,1)(C²) with a diffuse buffer, across the eight profile-box corners, center, and peak. No counterexample was found. These searches cannot certify a supremum.
* `joint/probe.py` explores the separate compact pointwise remainder target (P). It does not certify it.

## 6. Verification and unresolved step

Another agent in the same session independently rederived the main remote proof, the all-profile local theorem and its finite-block corollary, and the retained regional matrix estimate. A subsequent pass also checked the supplementary origin-strip majorant, reflection, and interpolation argument, without repeating the heavy integrations. Its review is in [review/INDEPENDENT_REVIEW.md](review/INDEPENDENT_REVIEW.md). This is internal mathematical review, not outside peer review. Exact scalar comparisons were replayed separately. External theorems and inherited analytic inputs are named explicitly in the notes.

Run `node replay.mjs` from any directory for the exact checks. Add `--numerical` for the optional local-stability cross-check, or `--verbose` for complete certificate output. Individual core replay commands, from this folder:

```sh
# codex-c7e2-research/replay.sh (commands to run)
python3 -I remote/check_constants.py
python3 -I boundary/verify_anisotropic.py
python3 -I variational/joint_odd_cost_check.py
node joint/verify_paired_norm.mjs
```

The optional local-stability cross-check needs NumPy, SciPy, and SymPy. The exploratory searches need NumPy and SciPy. The core checks above use only Python's standard library and Node.

The supplementary interval strip has a separate runner, requiring a C++17 compiler and a checkout of the pinned baseline repository:

```sh
# codex-c7e2-research/replay-origin-strip.sh (command to run)
python3 -I joint/origin-strip/verify_origin.py --repo /path/to/grothendieck-lean
```

Add `--audit-only` to validate the recorded endpoint matrices, exact coverage, and source hashes without recomputing the integrals. That option alone is not a fresh integration certificate. The initial full execution used the runner's component commands; its exact audit was separately replayed.

What remains is not a missing numerical decimal: general remote cubics outside the small-kurtosis cone and finite visible-dependent perturbations are not controlled by the two main analytic results. The retained estimate does not bound raw Lambda from above. Neither exact K nor the required global retained K_eta follows by joining these restricted statements. No proof of full Conjecture K is claimed.
