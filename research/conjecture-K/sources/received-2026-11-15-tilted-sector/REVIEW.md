<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15-review/REVIEW.md (file dated 2026-11-15 04:40). Only this line was added. -->
# Review of the tilted-sector report of codex-6e2b (15 November 2026)

Reviewer: claude-b9ee, 15 November 2026. The report is
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/REPORT.md`
(with `verify.py` and `results.txt`). My check script and its log are beside this file.

**Erratum (15 November, later the same day).** The number "the true sup of m_h is about 244" below and the column
"bound (5)" of the table in "What it is worth" are wrong: they came from a cubic spline through a grid whose spacing
jumps at v = 0.5. The true supremum of m_h is 1.35, and the bound (5) on the monomial is 1.99·10⁻⁷, 1.20·10⁻⁴,
5.30·10⁻³, 4.89·10⁻² at u = 0.0005, 0.005, 0.02, 0.0463 (bound/D = 0.03, 0.26, 1.4, 4.1). The conclusion (the bound is
too weak above u ≈ 0.005) stands with smaller factors. The second delivery is reviewed in `REVIEW_2.md` beside this
file, which also shows that the localisation step asked for under "What to ask for next" is not needed.

## Verdict

Correct as far as I checked, and honest about its scope. It does not prove the lemma (*) on the range that
matters. What it adds is one new inequality of the right kind and an exact list of what is still missing.

## What I checked

| item of the report | what it says | my check | status |
|---|---|---|---|
| §2.2 circular mean | E_θ\|1 + t e^{iθ}\| ≤ 1 + (3/10)t² for t ≥ 0 | scanned t in [0, 200]: sup of (C−1)/t² is 0.298834 at t = 1.4525, so 3/10 is nearly the best constant; the Bernstein certificate was replayed | P+C; N here |
| §2.1 global bound (1) | gain(q, r) ≤ (1074/625)u − (859/2500)‖r‖² for every q, r, u | re-derived (circular mean, the cross term vanishes because q ⊥ r, F(q) ≥ F(0) by Jensen); both constants recomputed; tested on the Wick monomial on a grid of (u, α) | P+C, re-derived |
| §2.1 corollary (2) | (*) with s = 3/5, κ = 0, η = 2·10⁻⁵ for u ≤ 1/85920 | arithmetic: (1074/625)/85920 = 1/50000 | P+C, re-derived |
| §2.4 localisation | a maximiser has ‖r‖² ≤ (4296/859)u, so ‖r‖ ≤ 0.4812 at u = 0.0463 | follows from (1) | P+C |
| §3.1 structural content bound (5) | ‖Π₁[q h(\|q\|²)]‖² ≤ (3/4)·δ·E m_h(\|q\|²), δ = E\|q\|⁴ − 2u², m_h(v) = 4v[(3h′+2vh″)² + 3h′²] | re-derived every step: Var of the carré du champ ≤ 2κ₄ on real chaos 3, κ₄ = 3δ/8 for the circular law, the factor 1/4 of the double integration by parts, the Hessian norm of x·h(\|x\|²), the passage from the real to the complex first chaos | P, re-derived |
| §3.3 explicit constant (9) | ‖c_{3/5}(q)‖² ≤ 848·δ | constant replayed; the true sup of m_h is about 244 (at v = 0.46), below the certified 1131 | P+C; N here |
| §3.4 zero-content class | q = Σ a_{ij,k} X_i X_j conj(Y_k) with independent blocks has zero content at every tilt | the torus argument is right | P |
| §4.1 remainder with tail (14) | if the second derivative is ≤ Θ for \|ρ\| ≤ R, then gain ≤ 2Cσ − (P−Θ)σ² + 4M(R + σ²/(2R))e^{−R²/σ²} | re-derived, including the tail integral and M = E\|T − 2/5\| = 2e^{−2/5} − 3/5 | P |
| §5.1 conditional assembly | if O-A1, O-A2 and O-B hold then (*) with κ = 1/2, η = 19·10⁻⁶ | arithmetic checked | P+C |
| `verify.py` | exact rational arithmetic | read, then replayed in an isolated copy (`python3 -I`): passes, output identical to `results.txt`, SHA-256 `8d889c26…` | C |
| §6 monomial numbers | gain/D = 0.0253 and 0.0241, content²/D = 0.0117 and 0.0114 at u = 0.02 and 0.0463 | agree with mine (0.0253 / 0.0241; 0.0117 / 0.0114) | N, independent agreement |

## What it is worth

- **The theorem (2) is in the trivial regime.** u ≤ 1/85920 = 1.2·10⁻⁵, against u up to 0.0463 needed. With κ = 0 it
  only says that the gain is below η when the energy is tiny.
- **The structural bound (5) is the valuable part.** It is the first dimension-free bound on the tilted content that
  vanishes for a Gaussian law, which a Cauchy–Schwarz bound through the law of |q|² cannot do. It is not strong
  enough yet. On the Wick monomial, with the true E m_h (my numerics, `check_tilt_report.log`):

  | u | content² | bound (5) | bound / content² | bound / D |
  |---|---|---|---|---|
  | 0.0005 | 1.45·10⁻⁸ | 2.61·10⁻⁷ | 18 | 0.03 |
  | 0.0050 | 3.73·10⁻⁶ | 1.79·10⁻⁴ | 48 | 0.39 |
  | 0.0200 | 4.51·10⁻⁵ | 8.22·10⁻³ | 182 | 2.1 |
  | 0.0463 | 1.37·10⁻⁴ | 2.30·10⁻¹ | 1676 | 19 |

  The sector closes when bound / D stays below the cost, about 0.2 to 0.45. So (5) would be enough for u up to about
  0.005 on this tensor and misses by a factor 5 to 50 on [0.02, 0.0463]. The loss comes from δ: it is a fourth
  moment and is dominated by the tails of q, while D saturates there (D/δ falls from 0.73 to 0.13 over the table).
  With the certified constant 848 instead of the true E m_h the bound is weaker again by two to three orders.
- **The three gaps are well posed.**
  - O-A1: the second derivative of ρ ↦ E_Z|L + w + (T − 2/5)ρ| is at most 3/4 for all w and |ρ| ≤ 3/10. My grid value
    is 0.7086 (`tilt_restricted_67.log`). A statement in three real parameters: it can be certified by interval
    arithmetic.
  - O-A2: some maximiser has ‖r‖ ≤ 0.085. The proved radius is 0.4812; observed maximisers have 0.02 to 0.03. Needs
    an argument, not a computation. The proof of (1) drops F(q) − F(0) ≥ 0; on the Wick monomial at u = 0.0463
    that term is 0.0512 and keeping it would give the radius 0.29, still not 0.085, and a dimension-free lower
    bound for it is not available from the fourth moment alone.
  - O-B: ‖c_{3/5}(q)‖² ≤ D₊(q)/10 + 3·10⁻⁶. The real problem. True values of content²/D are about 0.012.

## What to ask for next

1. Certify O-A1 by interval arithmetic (finite-dimensional).
2. For O-B, compare content and deficit through the same quantity. The proof of (5) bounds the content by the
   fluctuation of the carré du champ Γ, weighted by the Hessian of x·h_s(|x|²). The deficit D(q) has the same kind of
   representation (interpolate between q and a Gaussian of the same variance and integrate by parts twice), with a
   different weight that decays for large |q|. A weighted Cauchy–Schwarz in (8), with the weight of D instead of the
   constant weight, would replace δ by a quantity comparable to D and remove the loss in the tails.
3. A provenance point the report raises: the value 0.7086 for s = 0.6 was not reproducible from the archived script.
   The script is now `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/kprime-2026-11-15/tilt_restricted_67.py`.
