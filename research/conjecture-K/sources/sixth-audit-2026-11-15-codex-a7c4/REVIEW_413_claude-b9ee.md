<!-- Agent-ID: codex-a7c4. Refs #415. -->
# Independent Claude review of merged PR #413

Source: https://github.com/agalatan/grothendieck-lean/pull/413#issuecomment-6889795351
Reviewed head: `b5d93043e4de610bcb581a6984d9bf36997957da`.
Author: claude-b9ee (signed comment through the shared account).
Created: 2026-11-15T05:32:14Z; last edited: 2026-11-15T05:32:14Z.
The comment body below is verbatim. Disposition is in AUDIT §4.

<!-- Begin verbatim comment. -->
[claude-b9ee] Post-merge review of `b5d93043e4de610bcb581a6984d9bf36997957da`. The tree merged as adb96a5a2 is identical to this head.

**Verdict: approve.** Nothing blocks.

**Findings**

| | checked |
|---|---|
| **F1** | Re-derived: Z-parity, the supporting plane with the j₀-Lipschitz gradient ‖μ‖²/(1+j₀) ≤ Λ − Λ̂ ≤ ‖μ‖², μ_X < 0 for q = cX(\|Y\|²−1) since j is strictly decreasing, and the one-Gaussian closed form. Numerically j′(0) ≈ −1.673 and μ_X(0.01) ≈ −6.69·10⁻⁶. **Scope:** the strictness is pointwise only. Along the diffuse sequence ‖μ‖² = O(n⁻²), so sup Λ̂ ≥ S as well and the benchmark is common to both. The old sentence ("the remote part is the same statement for both") was right in its context, so Low rather than Medium (AUDIT.md:26), and item 82 is not a refutation |
| **F2** | Re-derived: R ≤ \|h\|²/\|V\|, the densities and Jacobian, the P_M reduction, the potential lemma, 2/a ≤ 179/50, 2√M ≤ 53/50, 39/20, (5)–(7); all six reserve rows match. Nit: the original checker of `improvement_joint_tail.md` was already exact Fraction arithmetic; only #409's check was numerical (JOINT.md:76–77) |
| **F3** | Valid as stated: any leaf containing (u, x) = (1/25, 2) inherits 2.0104·10⁻⁴ > 2·10⁻⁴. It limits only the October bank |

**Results**
- **R1** (Λ̂ < S − 2.76·10⁻⁶ for u ≤ 0.021). The trial −(3/5)r and 11.39–11.40 reduce it to Λ(q) + C²/k, uniformly in amplitude and joint law. At u ≤ 0.021 the benchmark is already S − 4.47·10⁻⁴; the tightest corner is u = 0.021, χ ≈ 11.23. Proved as stated.
- **R2** is a special case of 11.51 (#416).
- **R3** holds. The true potential at x = 2.9 is ≈ 0.782 against the certified 0.930.
- **R4** to 40 digits: 0.29836465163411746994 (peak), 0.32315284787417817 (flank), 0.32771589718532516 (upper).

"P by author + C" is accurate throughout.

**Replayed.** All three checkers exit 0 and reproduce their JSON. An exact re-check of the 33 leaves by critical points (not Bernstein) accepts all of them. All 17 reused polynomials are ≥ h on [0, 120] (numerically).

**Ledger.**
- Both restorations I asked for on #409 are done (7.4.5, 11.12).
- Numbering is consistent with #409 and #416.
- Preservation holds.
- `REVIEW_409_claude-b9ee.md` is byte-identical to my comment.

**Wording now stale after 11.51.** The current-state rewrite of the book and the ledger (#414) will fix these:
- the folder README still advises Stein cuts for a "remaining domain" and calls the content comparison open;
- STATUS §1 item 2 should point to 11.51; 11.47 should read "sharper than 11.51 on u ≤ 0.021" and 11.48 "special case of 11.51";
- errata H's "next step" is obsolete;
- 7.4.5 should keep "with exact rational checks";
- 11.12's independent re-derivation is FOUNDATIONS §1 (the #409 reviewer wrote 11.12);
- the PR body's 17 polynomials and 33 leaves are totals for both covers; R2 alone uses 10 and 19.

**Not checked:** the Arb and python-flint internals and the October `profile.py`; the inherited inputs beyond how they are used; AUDIT §3's coverage table.
<!-- End verbatim comment. -->
