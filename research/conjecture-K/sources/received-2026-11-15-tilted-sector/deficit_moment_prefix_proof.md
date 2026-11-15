<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/deficit_moment_prefix_proof.md (file dated 2026-11-15 05:56). Only this line was added. -->
# Certified moment prefix from energy .009 to .016

Agent-ID: **codex-6e2b**. Status **P+C**, with the same explicitly inherited moment, Bernstein-profile, and certified-content inputs as `deficit_moment_verify_proof.md`.

For every genuine finite-dimensional remote complex Wick cubic of bidegree `(2,1)`, with `u=E|q|²`, `D=B(u)−F(q)`, and `C=||c_(3/5)(q)||`, the completed certificate proves

\[
 \boxed{\frac9{1000}\le u\le\frac2{125}
 \quad\Longrightarrow\quad C^2\le\frac3{10}\max(D,0)+6\cdot10^{-6}.}
\]

The proof is the global cubic-Hermite moment argument already detailed in `deficit_moment_verify_proof.md`. The present prefix uses the following additional content coefficients, freshly certified by `deficit_structure_refine_verify.py` and explained in `deficit_structure_refine_proof.md`:

| Entire interval starts at | Valid upper coefficient in `C²≤γδ` |
|---|---|
| `9/1000` | `251/5000` |
| `3/250` | `121/2500` |
| `3/200` | `467/10000` |

Every row remains valid through `u=463/10000`. The prefix checker splits its energy slabs at the listed endpoints and uses the coefficient valid at each slab's lower endpoint throughout that slab. The four previously proved content branches remain available too.

`deficit_moment_prefix.py` freshly integrates both profile interpolation values and derivatives for every proposed Hermite cap, and freshly integrates the Gaussian benchmarks. Its exact rational acceptance polynomial is

\[
 .3(B_{\rm lower}(u)-F_{\rm cubic\ upper}(u,x))
 +6\cdot10^{-6}-H(u,x),\qquad x=\sqrt\chi.
\]

Here the benchmark lower bound is the chord of two outward lower endpoints, valid by concavity. The moment upper polynomial is the expectation of a global cubic Hermite cap with coefficientwise outward rounding and a positive leading coefficient. `H` is one globally valid content branch on the whole parameter box. Nonnegative exact bivariate Bernstein coefficients prove the inequality throughout the box. As before, this establishes the stronger inequality with `D` on every nonexempt box, which implies the stated inequality with `D₊`.

The completed default run has:

- **33 fresh global Hermite caps**;
- **40 accepted boxes**, **zero uncovered boxes**, and **66 visited boxes**;
- maximum subdivision depth **2**;
- an independent exact partition check of **14 energy strips**, covering all of `[9/1000,2/125]×[0,13/2]`;
- observed runtime **32.20 seconds**.

It explicitly asserts that there is no uncovered box. Since `sqrt(42)<13/2`, this proves the entire physical kurtosis range `0≤χ≤42`. Closed boxes include all boundaries.

Reproduce with python-flint available:

```text
python -I -B deficit_moment_prefix.py --certify
```

The log is `deficit_moment_prefix_results.txt`; the exact caps, boxes, benchmark endpoints, and source hashes are in `deficit_moment_prefix_witness.json`. Default execution recomputes the numerical inputs. The checker imports frozen arithmetic/profile helpers from `deficit_moment_verify.py`, so that source and its explicitly named dependencies are part of the replay chain.

The earlier exploratory `deficit_moment_mid.py` run toward `.03` was intentionally stopped after the separate Stein cover closed the larger-energy region. Its partial log is not used as a certificate. The unexecuted `deficit_moment_refine.py` is likewise not part of the active proof. Only the completed prefix source and witness described here are used.

Combining the completed low-energy moment cover `[0,.009]`, this prefix `[.009,.016]`, and the independently checked Stein cover `[.016,.0463]` yields the full content–deficit domain. An independent exact union check counted **178 accepted rectangles** and **45 energy strips**, with zero gaps in `[0,.0463]×[0,42]`. The three mathematical certificate chains must be replayed before relying on this geometric union check.
