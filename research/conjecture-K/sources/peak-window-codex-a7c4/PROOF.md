# The intermediate fourth-excess window for retained peak Conjecture K

Agent-ID: codex-a7c4.
Fix the peak $a=699/1250$, $b=179/1250$, $p=2500/1891$. For independent standard complex Gaussians $Z,W$, put $L=Z(a+b|Z|^2)$, $h(s)=2E|L+\sqrt{s}|$, $B(v)=2E|L+\sqrt vW|$, $\Phi(v)=B(v)-pv$ and $S=\sup_{v\ge0}\Phi(v)$. Write the six-sector field of 7.5.13 as $G=q+A+B_{\rm shell}+O$, with $q$ a remote $(2,1)$ Wick cubic independent of $Z$ and $O$ comprising all three odd sectors. Its remote energy is $u=E|q|^2$, its normalized fourth excess is $\chi=E|q|^4/u^2-2$ for $u>0$, and the joint energy of the even-shell drivers is $V=\|r_A\|_2^2+\|r_B\|_2^2$. In all statements assume $u+V\le0.080051$. The odd energy, the number of remote coordinates, and sharing among the sectors are unrestricted.

**Window theorem.** If $0.0354\le u\le0.0456$ and $0.0784\le\chi\le3$, then $\widehat\Lambda(G)<S-10^{-8}$.

The [sharp retained peak value](PEAK.md) follows by combining this strip with the complementary energy and shape results.

## One radial dual at each energy endpoint, common to every shape in its tile

Normalize $Q=q/\sqrt u$ and put $Y=|Q|^2$. Then $EY=1$, $EY^2=2+\chi$, and $EY^3\le 6+9\chi+(4045313/100000)\chi^{3/2}$. For fixed normalized $Q$ let $F_Q(v)=Eh(vY)$ and $D_Q(v)=B(v)-F_Q(v)$. Varying $v$ scales the given cubic and leaves its normalized shape fixed.

The 24 stored spectral duals are a subset of the 119 proposals described in the archived tilted-content proof. Each is independently checked as follows. Its coefficients determine nonnegative multipliers $\lambda,\mu>0,\nu\ge0$, a signed test function, and the compensated Stein term $G_0$. The normalized complex-cubic Stein identities give $E G_0(Y)\ge0$ for every such $Q$ by the explicit sum of nonnegative squares and variance slacks in equation (4) of that proof. At its own energy node $v$ the verifier checks the polynomial $P(y)\ge h(vy)+G_0(y)$ for the entire ray $y\ge0$, following KRAW. It partitions at both the test knots and the scaled profile knots, checks rational polynomial positivity including cancellation of the removable factor $y^2$ at zero, and checks the polynomial on the final ray. It uses the original 68 profile caps on $[0,2]$, the ten published additional caps through 64, and the tangent beyond 64. Candidate data contain enough coefficients to repeat every check. Hence $F_Q(v)\le EP(Y)$. Since $P_3\ge0$, its upper price is

$$
P_0+P_1+(2+\chi)P_2+
(6+9\chi+(4045313/100000)\chi^{3/2})P_3.
$$

This bound is valid for every admissible $\chi$ at that one $v$. The design value of $\chi$ never occurs in its proof. Subtracting this upper price from the global degree-eight KRAW Rice lower polynomial $b(v)\le B(v)$ gives the lower bound $d_P(v,\chi)$ for the actual same-variance deficit. [Original Stein proof, equations (4)–(5), and profile cap construction](../received-2026-11-15-tilted-sector/deficit_dual_proof.md) · [Rice lower polynomial and interpolation curvature](../raw-content-2026-11-17-gemini-5331/PROOF.md)

Each tile $[l,h]\times[x_0,x_1]$ in energy and excess names a single left model $i$ at $a$ and a single right model $j$ at $b$, with $a\le l<h\le b$. The endpoint lower bound $d_i$ is the minimum of $d_{P_i}(a,x_0)$ and $d_{P_i}(a,x_1)$, and likewise for $d_j$ with the same two shapes. The price is convex in $\chi$ and the benchmark is fixed, so these lower bounds hold throughout the shape interval. The verifier rounds the positive square root in each upper price upward before subtraction.

For fixed $Q$, complete monotonicity and a directed calculation give $-1673/1000<h''(s)\le0$ for all $s\ge0$. Thus $F_Q''(v)\ge-(1673/1000)(2+\chi)$, while $B$ is concave. Adding $(1673/2000)(2+\chi)v^2$ makes $F_Q(v)$ convex. Its chord upper bound and the chord lower bound for $B$ yield

$$
D_Q(u)\ge\frac{(b-u)d_i+(u-a)d_j}{b-a}
 -\frac{1673}{2000}(2+x_1)(u-a)(b-u).
$$

The chord minimum on $[l,h]$ is at an endpoint and the subtracted quadratic is largest at $(a+b)/2$ clipped to $[l,h]$. The tile's positive rational $D_0$ is smaller than this lower bound by more than $10^{-10}$. Therefore $D=D_Q(u)>D_0>0$ everywhere in the tile.

## Paying the shell gains

Write $\rho=.5053,\ d=1+\rho^2,\ R=r_A+\rho r_B,\ U=r_B-\rho r_A,\ C=c_{3/5}(q)$ and $e=c_B(q)-\rho c_A(q)$. The centered six-sector trial of 7.5.13, using the shared estimates $E[|q|^2S_r]\le4uV$ and $E[S_r^2]\le2V^2$ from 7.4.10, gives

$$
\widehat\Lambda(G)-S\le-\sigma-D+
2\operatorname{Re}\langle C+\rho e/d,R\rangle
+2\operatorname{Re}\langle e/d,U\rangle-.31\|R\|^2-.08\|U\|^2+
2(u+V-.0463)V,\qquad \sigma=S-\Phi(u).
$$

Put $t=\|C\|_2^2$. On this tile 11.30 and 11.49 give $t\le T=\min(1/2500,.0355h^2x_1)$, since $u\ge.0354\ge.035$ and $\delta=u^2\chi$. Row 11.61 gives $t\le(7/25)D_++6\cdot10^{-6}$; the tile's positive $D_0$ justifies replacing $D_+$ by $D$. The alignment inequality 7.1.6 gives $\|e\|_2^2\le E_0=(.0035)^2h$. [Trial and square completion, §2.2](../all-sector-transfer-gemini-c1de/PROOF.md) · [Original tilted cost and its independent review, §4](../ab-sector-2026-11-15-codex-91d4/REVIEW_claude-b9ee.md)

Partition $[0,.080051-l]$ in $V$. For a cell $[v_0,v_1]$ let $k=2(\min(h+v_1,.080051)-.0463)$. Add $\mu(dV-\|R\|^2-\|U\|^2)=0$ for that cell's real $\mu$. Put $A_0=.31-k/d+\mu,\ B_0=.08-k/d+\mu$, both checked positive. Complete the two squares in $R,U$ and use $(\sqrt t+\rho\sqrt{E_0}/d)^2\le(1+\eta)t+(1+1/\eta)\rho^2E_0/d^2$ with the recorded $\eta>0$. Write $m=(1+\eta)/A_0$, $\beta=7/25$, $\alpha=6\cdot10^{-6}$, and $v_*=v_1$ for $\mu\ge0$ or $v_0$ otherwise. By 2.7c the Gaussian buffer is at least $\sigma_0=(27/25)\max(.0403448-h,l-.0403449,0)^2$. The trial is at most $S$ plus

$$
mt-\max(D_0,(t-\alpha)/\beta)+
\frac{(1+1/\eta)\rho^2 E_0}{d^2 A_0}+
\frac{E_0}{d^2 B_0}+\mu d v_*-\sigma_0.
$$

As a function of $t$ the expression increases up to $t_*=\min(T,\beta D_0+\alpha)$ and is affine on $[t_*,T]$. Testing $t_*,T$ therefore suffices. Every shell cell has upper bound strictly below $-10^{-8}$.

The standard-library checker recomputes every radial dual and both continuum partitions using rational and directed dyadic arithmetic. It verifies 24 duals, 71 energy/excess tiles, and 230 shell cells; altered profile files are rejected by their SHA-256 digests. Ten corruption controls test the shape and shell partitions, the interpolating energy pair, nonpositive and out-of-band node energies, deficit thresholds (including a positive but inadequate clearance), the quadratic signs and a false global dual polynomial. From the repository root run `python3 -IB research/conjecture-K/code/peak-window-codex-a7c4/verify.py`. The replay uses the previously certified radial caps. Its acceptance of a proposed Stein test depends on checking the full polynomial inequality. The [complete dual data](../../code/peak-window-codex-a7c4/duals.json) give the test knots, affine test values, multipliers and cubic coefficients. Each entry in the [cover](../../code/peak-window-codex-a7c4/cover.json) contains the closed rectangle and its deficit price, the two dual indices, and the shell intervals with their square-completion parameters.
