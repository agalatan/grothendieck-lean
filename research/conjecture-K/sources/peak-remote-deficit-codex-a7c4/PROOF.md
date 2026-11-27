# Strict same-variance domination on the peak remote energy band

Agent-ID: codex-a7c4. Take independent standard complex Gaussians $Z,W$ and the peak visible variable
$$
 L=Z\left(\frac{699}{1250}+\frac{179}{1250}|Z|^2\right).
$$
For a remote cubic $q\in H_{2,1}(\mathbb C^n)$ independent of $Z$, let $u=\mathbb E|q|^2$. Define the same-variance Gaussian benchmark $B(u)=2\mathbb E|L+\sqrt{u}W|$. In every finite dimension,
$$
 0<u\le \frac{463}{10000}
 \quad\Longrightarrow\quad
 D(q):=B(u)-2\mathbb E|L+q|>0.
$$
At $u=0$ the deficit is zero. The theorem concerns the remote cubic and this specific peak profile.

For $u>0$ let $\chi=\mathbb E|q|^4/u^2-2$. The new part is the uniform estimate
$$
 D(q)>\frac{138395408}{10^{15}}
 \quad\text{when}\quad
 \frac{3}{4000}\le u\le\frac{463}{10000},\qquad
 \frac{49}{100}\le\chi\le42 .
$$
The [smoothed two-step OU and Stein cover](../sliver-closure-2026-11-24-gemini-21d5/PROOF.md), Theorems 1–2 and [ledger row 3.29](../../STATUS.md), already gives strict positivity for $\chi\le49/100$ throughout the energy band and for all $\chi\le42$ when $0<u\le3/4000$. These regions meet the new closed rectangle along both boundary segments. For a normalized nonzero finite cubic, $\chi>0$ by the third-chaos product formula applied to its real projection, whose kernel has nonzero positive contraction $f\otimes_2 f$. The moment bound of [ledger row 3.4](../../STATUS.md) gives $\chi\le42$.

## Global radial majorants

Write $V(z)=2\mathbb E_Z|L+\sqrt z|$ for $z\ge0$. Since $L$ is circular and independent of $q$, conditioning on $q$ gives $2\mathbb E|L+q|=\mathbb E V(|q|^2)$. Rows 3.2–3.3 certify 68 polynomial upper bounds for $V$ on adjacent closed intervals covering $[0,2]$, and an affine upper bound on $[2,\infty)$. We use the original [profile certificate](../../code/audit-2026-11-15-codex-a7c4/remote_stein_original/profile-caps.json) as replayed in the [independent audit](../reaudit-2026-11-15-codex-a7c4/REMOTE.md). The [KRAW benchmark](../raw-content-2026-11-17-gemini-5331/PROOF.md), §5.2, gives a degree-eight polynomial $B_{\mathrm{lo}}(u)\le B(u)$ on $u\ge0$. Its rational coefficients are recomputed from the peak parameters using the upstream 220-bit directed moment and Radau–Hermite calculation.

The [certificate](../../code/peak-remote-deficit-codex-a7c4/peak_cover.json) supplies ten rational cubic polynomials $P(z)=p_0+p_1z+p_2z^2+p_3z^3$, all with $p_3>0$. For each $P$, the [verifier](../../code/peak-remote-deficit-codex-a7c4/verify_peak.py) checks $P-H\ge0$ on each original interval, where $H$ denotes that interval's certified cap. On the interval mapped to $0\le t\le1$, nonnegative Bernstein coefficients suffice since the Bernstein basis is nonnegative and sums to one. The verifier bisects a cell if necessary. For the affine tail cap $H_\infty$ it checks $P-H_\infty\ge0$ on $[2,32]$ by the same argument and checks all four power coefficients of $(P-H_\infty)(32+t)$ are nonnegative for $t\ge0$. Therefore each $P$ majorizes $V$ on the entire half-line. Numerical linear programming was used to propose the coefficients. Only these rational inequalities are used to establish the majorants.

## From three moments to a continuum of parameters

The complex cubic sixth-moment estimate in row 3.4 gives, with $C_6=4045313/100000$,
$$
 \mathbb E|q|^2=u,\qquad \mathbb E|q|^4=(2+\chi)u^2,\qquad
 \mathbb E|q|^6\le(6+9\chi+C_6\chi^{3/2})u^3.
$$
The fourth moment is an equality, so the negative quadratic coefficient of a majorant poses no sign problem. Since $p_3>0$,
$$
 2\mathbb E|L+q|\le
 M_P(u,\chi):=p_0+p_1u+p_2(2+\chi)u^2+
 p_3(6+9\chi+C_6\chi^{3/2})u^3 .
$$
For every fixed nonnegative $u$, $\chi\mapsto M_P(u,\chi)$ is convex. On a shape interval $[c,d]$ its maximum is bounded by $\max\{M_P(u,c),M_P(u,d)\}$. At each of its two endpoints $m$, we round $\sqrt m$ upwards to a rational with denominator $10^{12}$. This increases the price. Subtracting that upper price from $B_{\mathrm{lo}}$ leaves an explicit univariate polynomial of degree eight. On the assigned energy interval $[v,w]$ the verifier computes its nine Bernstein coefficients, all strictly greater than $138395408/10^{15}$. This yields the asserted uniform deficit for every cubic whose parameters lie in the rectangle.

The thirteen rectangles have a recorded index into the list of ten global majorants. The verifier checks containment in the exact target rectangle, inserts both outer energy endpoints in the list of strip boundaries, and checks shape coverage from $49/100$ to $42$ with exact endpoint matches on every energy strip. All inequalities include the finite endpoints.

## Reproduction

Run `python3 -IB research/conjecture-K/code/peak-remote-deficit-codex-a7c4/verify_peak.py` from the repository. The Python standard library suffices. The verifier imports the upstream KRAW benchmark, which requires ordinary Python with assertions enabled. Four corruption controls reject a broken radial majorant, a wrong cubic-coefficient sign, an omitted rectangle and an incorrect assignment of a majorant to a rectangle.

| Public input | SHA-256 |
|---|---|
| Archived 68 profile caps and affine ray | `01c2e2a7b4af452ce8729ec47cb0cd2c3aa7e1368c6b58336270c2a19b349514` |
| KRAW source computing the degree-eight lower benchmark | `ab237e8081dce81cecc82240690f6b5d41f46ebebf725acf75615645d76c20c0` |

This is a paper result with a rational arithmetic certificate.

The [all-energy priced theorem and odd-sector corollary](PRICE.md) use this result on the peak response band.
