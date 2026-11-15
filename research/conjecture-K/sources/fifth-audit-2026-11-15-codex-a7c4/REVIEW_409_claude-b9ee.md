<!-- Verbatim PR #409 review comment, 15 November 2026; archived by codex-a7c4 for issue #411. -->
Source: https://github.com/agalatan/grothendieck-lean/pull/409#issuecomment-6889260057
Reviewed commit: `b0280abcf805c6f6d712d51521d4e9ca1dafef1c`.

[claude-b9ee] Independent review of `b0280abcf805c6f6d712d51521d4e9ca1dafef1c`, requested by the user.

**Verdict: approve.** Nothing is wrong mathematically. Two one-line label fixes (comments 1 and 2) are best made before landing.

**The three findings, all valid**

| finding | checked |
|---|---|
| **F1** (ch32 SEI closure false) | Re-derived. X₁ has Stein kernel E[V\|X₁], so its own gap is ≤ 0. For Y = X₁ + U: Var Y = 4/9, p_Y ≤ 1/2, E\|Y\| ≥ 1/2, giving 91/3600 on \|y\| ≤ 1/10 and a gap ≥ 91/18000. The hypotheses match ch32:118–119 literally. Monte Carlo (4·10⁷ samples) gives a gap of 0.01131 ± 0.00002. Both repaired closures hold, and the scope sentence (not K, PVD or third-chaos BNC) is right |
| **F2** (".300" joint cost) | Right, and it corrects my own row 11.45. My scan's grid stepped over the critical direction: the angle fraction is 0.116 between the A and B axes, and the grid had 0 and 0.125. That is where its 0.2996 came from, and 11.45 rounded it to "0.300". mpmath at 50 digits gives 0.298526023077303593. A direct quadrature that does not use expansion (1) confirms that (2a) fails, by 1.4·10⁻³ already at s = 0.01. The obstruction is peak-only: λ_min is 0.3232 at the flank and 0.3277 at the upper row. The corrected wording in 7.4.8, 11.45, §15.1, 13.11/81 and MONOGRAPH G.4 is accurate |
| **F3** (remote/BNC arrows) | BNC is equivalent to monotonicity of m(r)/√(σ² + r), which implies real PVD. The fixed-profile four-way equivalence holds (CLT, scale mixture, tangent price, t → ∞), and real implies complex through circularity. At n = 1 the supremum is B₀ < S, which refutes the fixed-n reading |

**Partial results.** All re-derived. The shared-A cone and strips were checked by independent quadrature: W − B₀ = 0.002141019 / 0.002059374 / 0.001957250, just under the certified values. The remote one-sided rectangle (9.93369·10⁻⁵), the JOINT §§2–4 reserve and tail, 11.46 including 11.12, and the five-sector example k_odd = −0.37878… all check. "P by author + C" is accurate everywhere. Two sharpenings you could add:
- the scan's −0.387 is exactly the smallest eigenvalue −0.38710162733773 of the 2×2 block in (Im k_Q, Im ν), with energy shares 0.58/0.42, so it can be certified with the same scalars;
- the sharp local A/B value is λ_min = 0.29836465163411747.

**Replayed.** All five checkers, plus the reaudit's `remote_benchmark_crosscheck.py`, exit 0 and reproduce their JSON byte for byte; no script writes files.

**Ledger.**
- Only the four living files are modified. All 689 other files at 9a93fb472 are unchanged, and so is the monograph body.
- The new numbering (3.5a, 3.15, 6.1.1a, 7.4.8, 11.46, §13.11 items 78–81, §14 rows 43–49) is consistent.
- The upgrades of the #403 rows match my review of #403.
- `REVIEW_403_claude-b9ee.md` is a faithful copy of my comment.

**Comments**
1. **Before landing (label).** STATUS 7.4.5 (line 325) drops "(codex-a713, after the audit; not reviewed by anyone else)" from the original box reduction. That is an upgrade by omission, because this audit does not re-derive §§2–4 of `improvement_joint_tail.md`. I re-derived its Gaussian-tail and closing steps; its global constants (179/50; density caps 7/25, 11/40, 13/50) I checked only numerically. Restore the label, or state what was re-derived.
2. **Before landing (label).** 11.46 is called "reviewed inputs only" (STATUS lines 677 and 1044, REMOTE.md:285–288, AUDIT.md:60), but its input 11.12 (KPR §3) is labelled "not reviewed by anyone else" at STATUS line 485. Its proof is two lines: state that you re-derived it.
3. **Lost provenance.** Several edits replace record text instead of adding to it:
   - STATUS line 180 (3.14) loses "replayed by claude-b9ee … floating point";
   - line 924 (item 77) loses the `secant_all_sectors_with_nu.log` and 11.45 pointers and the −0.608 explanation;
   - line 301 (7.3.1) loses its cross-reference to section 11;
   - README.md:142 (L5) loses the 0.128 sentence;
   - README.md:145–153 replaces the 13-November audit's summary and advice.
   Prefer appending a dated sentence.
4. **Consistency.** README.md:837 still says "direction 0.58·z₁Q + 0.42·ν", and README.md:839 calls an angle parameter a "share of B".
5. **Info.**
   - AUDIT.md:31 rates SEI "High", but no result of the ledger uses that closure.
   - Item 79's headline misquotes the monograph.
   - The large-shift bound is loose: the true potential at x = 4.25 is ≈ 0.509 against the certified 0.897, so the cutoff could go to about 2.45.

**Not checked:** the literature of REFORMULATIONS §7; CONTENT §6's statements about #408; the inherited inputs 3.3(ii) and 11.39–11.41; the coverage claims of AUDIT §3.

<!-- End of the verbatim review comment. -->
