<!-- Verbatim from handoff/gemini-plan-audit-codex-a7c4/REVIEW_claude-b9ee.md, 17 November 2026; review https://github.com/agalatan/grothendieck-lean/pull/514#issuecomment-6945048815; only this line added. -->
[claude-b9ee] Review of e4d92ce839dbde9846be4c47f96a8a0fe1a28013: **approve**. Every P/C claim was re-derived and both certificate scripts replay. Each repair of the Gemini draft is correct. Nothing is overclaimed, and the content inequality is stated as open throughout. The remarks below do not block.

**Replay**
- `constants_exact.py` (0.3 s): output byte-identical to `constants_exact.json`.
- `benchmark_exact.py` (python-flint 0.9.0, 19 s): every assert passes; the JSON is byte-identical.
- `diagnostics.py` (NumPy 2.5.4 / SciPy 1.18.1, against the author's 2.3.5 / 1.17.1): all 167 numbers agree.
  - Values agree within 4.5e-16 absolute, and the optimiser locations within 1.3e-7.
  - The only large relative differences are on values that are zero up to roundoff.

**Independent mpmath check** (written from scratch: Φ and g by the angular hypergeometric formulas, B by Rice)
- The Taylor residuals with the certified derivatives scale correctly, which pins all nine enclosures:
  - Φ: R/r⁵ = 6.0557, 6.2142, 6.2310 at r = 1e-2, 1e-3, 1e-4;
  - g: R/r⁴ = −59.905, −60.101, −60.121 at r = 1e-3, 1e-4, 1e-5.
- g(0) = −0.835135932614129662551, inside the enclosure.
- u_* = 0.04034480941134325744 and S = 1.3739535256614829339.
- S − Λ_G and both budget losses match the Arb table at the six band points.
- B_G − (27/25)(u − u_*)² ≥ 0 at all six points.
- The margins of the μ = 129/100 and λ = 107/50 bounds are positive on 17 points of r in [1e-3, 1e4].
- My separate computations give the same values: g″(0) = −11.69206167951 and g‴(0) = 107.00877984154 by exact integral formulas, μ_max = 2.47640551439 at r = 1.9551852, and envelope losses 2.23665e-5 at u_* and 3.5573e-5 at u = 0.0463.

**Re-derived by hand**
- The Gaussian scale-mixture formula (1) and its recurrences.
- (6) and (10): Bernstein measures, Jensen in both directions, the brackets μ_safe ≤ μ_max ≤ 2μ_safe and λ₀ ≤ λ_min ≤ λ_safe.
- The corrected (5).
- (2): B = √π E√(V+u), B‴ > 0, min |B″| = 1.0831 > 27/25 at the top of the band, uniqueness of u_*, and the four tail bounds covering all of [0, ∞).
- The repairs:
  - Wick moments 2, 176, 90816, 32, giving 44u², 11352u³ and 64/21;
  - zero content of the Gaussian product;
  - the factor 2 in (15);
  - the + sign in (18);
  - (19) with covariance (u/2)I₂.
- The cross-references to STATUS 2.7, 2.7a, 3.14, 3.19, 6.3.11–12 and 6.3.20–26 are quoted correctly.
- GEMINI_DRAFT.md is verbatim and contains no local paths, private URLs or personal data.

**Remarks (non-blocking)**
1. STATUS.md:203 (2.7b): "positive Laplace measures of 2.7a" should read "of 2.7 (Φ′) and 2.7a (−g)". The Φ bound uses complete monotonicity of Φ′.
2. STATUS.md:203–204 and MONOGRAPH.md:227–228 write "P/C, author only". The ledger's form is "**P + C**, author only".
3. MONOGRAPH.md:225–235: u_* is not defined in the book. Define u_* = σ*², the maximiser of B(u) − pu (§1.4), and drop the code spans. §2.5 or open item 6 in §3 may fit these bounds better than the Setting chapter.
4. NOTE.md:379: "still stronger δ^{3/2} bounds" holds only for χ < 50/3. On the Wick cubic the (15/2)uδ bound is the stronger one.
5. NOTE.md uses k for −g (around line 200) and for ∫e^{−s}g(v+us)ds (line 386). Rename the second.
6. NOTE.md:473: `--output numerical.json` writes into the repository root. Suggest writing to a temporary file and comparing.
7. README.md:15: "in this chat" means nothing to a reader of the repository. Say "in the user's session with codex-a7c4, 17 November 2026".

If you fix these, a new push needs a new approval. They can also wait for a later pass.
