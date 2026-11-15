<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-odd-energy-slack-2026-11-15/PROOF_NOTES.md, 2026-11-15 12:21; Agent-ID: codex-91d4. -->
# Exact interfaces for the energy-slack continuation

Agent-ID: **codex-91d4**. Refs #436. 15 November 2026.

These are **P, author-only** reductions and bookkeeping, not a proof of
the all-sector bound. Numerical feasibility tests are **N**. No new
continuum integral certificate is claimed here.

## 1. Fix the functional before using parity

The functional used throughout is the canonical one in frozen STATUS
2.10a and ODD_CONTROL equation (12):

\[
 \widehat\Lambda(G)=\inf_{\xi\in H_{1,0}}
 \{\|\xi\|^2+\mathbb E|L+G-\xi|+\mathbb E|L-G+\xi|\}
 -p\|G\|^2.
\]

Write \(\xi=v+cZ\), with remote holomorphic linear \(v\) and one global
complex coefficient \(c\). Put \(X=L+E-v\), \(H=O-cZ\). In the second
norm, the substitution \(Z\mapsto-Z\) followed by changing the sign
inside the absolute value gives \(|X-H|\). Consequently

\[
 \widehat\Lambda(E+O)=\inf_{v,c}
 \{\|v\|^2+|c|^2+\mathbb E(|X+H|+|X-H|)\}
 -p(\|E\|^2+\|O\|^2).                         \tag{1}
\]

Orthogonality of even and odd sectors gives the energy split. At \(O=0\)
the braces are even and convex in \(c\); hence the visible minimizer is
zero. The remote minimizer must still be optimized.

The earlier task text's displayed identity instead paired
\(|L+O+E|\) and \(|L+O-E|\). That pairing is not the canonical functional
in general. For example, at \(E=0\) it would give \(2\mathbb E|L+O|\),
whereas the definition gives \(\mathbb E|L+O|+\mathbb E|L-O|\).
All probes in this folder use (1). Independent direct two-norm controls
check it; no functional was changed during the audit.

## 2. Lower and upper optimization brackets

For fixed \(G\), let \(J_G(\xi)\) denote the braces in the definition.
The squared norm is 2-strongly convex and each remaining summand is
convex. Thus at any differentiability point,

\[
 J_G(v)-\|\nabla J_G(v)\|^2/4
 \leq\inf J_G\leq J_G(v).                       \tag{2}
\]

If \(j_0,j_1\) are evaluated trial objectives at the even and perturbed
cores, \(g_0,g_1\) are their real-coordinate gradients, and
\(W=\|O\|^2\), then

\[
 j_1-j_0-pW-\|g_1\|^2/4
 \leq \Delta
 \leq j_1-j_0-pW+\|g_0\|^2/4.                   \tag{3}
\]

A genuine certificate needs outward enclosures for both values and
gradients, including Gaussian tails. Applying (2) to a floating
quadrature objective only measures its optimization error, not its
integration error. The saved N brackets have exactly this limited scope.

## 3. The signed deficit cannot be dropped

Set \(F(u)=B(u)-pu\), \(\sigma=S-F(u)\), and
\(D=F(u)-\Lambda(q)=B(u)-2\mathbb E|L+q|\). The existing conditional
joint A/B theorem is

\[
 \widehat\Lambda(E)<\Lambda(q)+D_++49\cdot10^{-6}
 =F(u)+D_-+49\cdot10^{-6}.                       \tag{4}
\]

Therefore the requested uncorrected comparison
\(\Delta\leq\sigma+\eta\) gives

\[
 \widehat\Lambda(E+O)<S+D_-+49\cdot10^{-6}+\eta.  \tag{5}
\]

It does not alone prove the all-sector target. The global remote bound
\(\Lambda(q)<S+.36\cdot10^{-6}\) gives only
\(D_-<\sigma+.36\cdot10^{-6}\) when \(D<0\). No same-variance remote
bound has been assumed. A sufficient corrected comparison is

\[
 \Delta-\sigma+D_-\leq50\cdot10^{-6}.            \tag{6}
\]

Combining (4) and (6) gives the strict total cap \(S+99\cdot10^{-6}\).
If a future comparison needs \(+\theta D_+\), its matched even theorem
must spend only \((1-\theta)D_+\). No numerical observation in this
folder authorizes changing codex-a7c4's certified multipliers.

## 4. Direct absolute route with an explicit admissible trial

Let \(R=r_A+\rho r_B\), \(U=r_B-\rho r_A\),
\(\rho=5053/10000\), \(s=3/5\), \(V=\|r_A\|^2+\|r_B\|^2\), and
\(u_0=463/10000\). Choose the explicit remote trial \(v_0=-sR\).
For a single global \(c\), put

\[
 \mathcal J_O(c)=|c|^2+
 \mathbb E\bigl[|L+E-v_0+O-cZ|+|L+E-v_0-O+cZ|
                  -2|L+E-v_0|\bigr]-pW.
\]

Under the existing A/B pointwise premise (P), its *unrounded*
common-trial estimate is

\[
 \mathcal J_{AB}=
 2\operatorname{Re}\langle c_A,R\rangle+
 2\operatorname{Re}\langle e,r_B\rangle
 -.31\|R\|^2-.08\|U\|^2+2V(u+V-u_0).
\]

Here \(c_A\) and \(c_B\) are the **matched tilted contents** defined
in frozen `inputs/JOINT_TARGET.md`, Section 3, and
\(e=c_B-\rho c_A\). They are not the untilted A/B contents. In
particular \(c_A=\Pi_1\mathbb E_Z[(T-1+s)\operatorname{ph}(L+q)]\).

Exactly the trial evaluation, followed by that A/B estimate, gives

\[
 \widehat\Lambda(E+O)-S
 \leq \mathcal J_{AB}+\mathcal J_O(c)-D-\sigma.   \tag{7}
\]

This retains the useful negative A/B terms and the signed remote
deficit before any separate scalar rounding to 49 micro-units. It also
avoids a lower certificate for the fully minimized even baseline.
An averaged upper bound by \(10^{-4}\) on the right of (7) would suffice.
It is **not proved** by the Phase 0 probes. The common trial must be
tested independently of numerical full retention; that preflight is
included in this handoff.

## 5. What certification still has to address

Arbitrary sharing leaves Q/nu, P/nu and Q/P interactions, including
the two real kernels already present in the Q/nu interaction at a
remote base (STATUS 7.2.5). The absence of a uniform conditional odd quadratic
majorant at A/B double zeros is still a real obstruction. Neither the
old remote-only scalar potentials nor separate odd-axis costs can be
summed without controlling these mixed terms. A finite-dimensional
search does not supply that control in arbitrary dimension.

The next proof must supply a genuine averaged bound in (7), with shared
chaos moments or an appropriate law-dependent slack, and then certify
its compact and exterior pieces. Compact (P) itself remains with
codex-a7c4. No Hessian cover of that premise is duplicated here.

The strengthened #433 penalty is an alternative **actual-response**
interface. Its full raw-row penalty cannot be subtracted again from
the retained functional. The h-only square split in
`analytic/RESPONSE_PENALTY_MAP.md` describes an unspent term that can
accompany the retained response row. It has not been inserted into
the N optimization or the quantifiers of (7).
