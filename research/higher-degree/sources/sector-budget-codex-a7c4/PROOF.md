# An obstruction to the unrestricted degree-five sector budgets

Agent-ID: codex-a7c4

The sector inequality $K_5$ in P4 compares each pair's response with the best scalar response at **that pair's own remote cubic** $q$. At every visible mass $1/4\le t\le5/12$, a unimodular pair in 130 complex dimensions has $q=0$ and forces a loss $\delta_r$ in this comparison such that $t^2-2\ell_rt+C_r+\delta_r>500/701+12/100000$ on every published row $r$. This holds even for signed losses chosen separately for each pair. For this same family, the unrelaxed row inequality of Claim 1 on row 0.25 stays more than $0.172$ below $500/701$. Section “Comparison with the published law cap” gives the room on each law row. A joint bound on the pair's response relative to $C_r$ remains open for general unimodular pairs.

For the degree-five game in [P4](../degree5-attack-2026-11-25/problems/P4-replay-conditional-certificate.md), take the smaller published cap $C_r$ on each of the 29 rows. Write $\delta_r$ for any loss for which that row's **unrestricted** sector inequality holds. On the entire interval $1/4\le t\le2/5$ we obtain
$$
  \min_r\{t^2-2\ell_rt+C_r+\delta_r\}>500/701+83/100000.
$$
The test uses 49 complex coordinates. A 19-dimensional version gives the same conclusion with $3/100000$ in place of $83/100000$. This is a lower bound on the **right-hand side of the proposed row estimate**. The actual payoff of unimodular pairs on this interval remains open above the direct small-mass range. The construction below also tests the fields produced by unimodular pairs. The independent law and sector bounds enter additively in this comparison.

This also gives an independent Level A replay for #625. Claims 1 and 3 follow below on paper, with Claim 3 deduced from established cubic estimates. Claim 4 follows by exact arithmetic on the supplied intercepts. The independent verification of the law upper bounds in Claim 2, including their node integrals and majorants, remains open. The necessary sector losses below hold irrespective of the validity of Claim 2.

## A transverse cubic with zero remote part

Let $e=39/50$, $\eta=779/10000$, and $z,Y_1,\ldots,Y_m$ be independent standard complex Gaussians, with $m$ a positive even integer. Write $T=|z|^2$, $\mu=\mathbb E\sqrt T=\sqrt\pi/2$ and
$$
 Q=m^{-1/2}\bigg(\sum_{j\le m/2}(|Y_j|^2-1)-\sum_{m/2<j\le m}(|Y_j|^2-1)\bigg).
$$
This real remote quadratic has mean zero, $\mathbb EQ^2=1$ and $D=\mathbb EQ^4=3+6/m$, since a centered unit exponential has variance one and fourth moment nine. For real $\nu$ put
$$
  g_\nu(T)=\ell+\beta(T-2)+\nu (T^2-6T+6)/\sqrt{12}.
$$
Choose a maximizer $\nu_*$ of $2\mathbb E[\sqrt T\,|g_\nu(T)|]-\nu^2/\eta$. It exists by continuity and the quadratic penalty, and satisfies $|\nu_*|\le\eta$ by the Lipschitz estimate below. In the sector inequality of P4 take
$$
 G_3=ia z Q,\qquad G_5=\nu_* e_{32}(z),\qquad a\ge0.
$$
They have the requisite bidegrees and $\|G_3\|^2=a^2$. Conditioning on the remote coordinates gives $q=0$, hence the multiplier $C$ in P4 vanishes. The scalar optimum on the right is exactly the value at $\nu_*$. Since $g_{\nu_*}$ and $Q$ are real, the two moduli on the left agree. Subtracting the scalar optimum implies
$$
 \delta_r\ \ge\
 2\mathbb E\!\left[\sqrt T\{\sqrt{g_{\nu_*}(T)^2+a^2Q^2}-|g_{\nu_*}(T)|\}\right]-a^2/e.
 \tag{1}
$$
In particular every such loss is nonnegative by setting $a=0$. The row parameters $b_A,b_B$ have dropped out.

Let $\mathbb E_*$ denote expectation in $T$ biased by $\sqrt T/\mu$, so $T$ has the Gamma$(3/2,1)$ law. Let $H>0$ bound $(\mathbb E_*g_{\nu_*}^2)^{1/2}$. For fixed $u\ge0$ the function $h\mapsto\sqrt{h^2+u}-h$ is convex and decreasing on $h\ge0$. Independence, Jensen and Cauchy–Schwarz bound (1) below by $2\mu\,\mathbb E[\sqrt{H^2+a^2Q^2}-H]-a^2/e$.

A second Jensen estimate retains the fourth moment. The function
$$
 j(v)=\frac{1}{1+\sqrt{1+v}}=\tfrac12\int_0^1(1+sv)^{-1/2}\,ds
$$
is convex for $v\ge0$, including at zero. Under the probability measure with density $Q^2$, the mean of $Q^2$ equals $D$. Factoring the square-root difference and applying Jensen gives
$$
  \mathbb E[\sqrt{H^2+a^2Q^2}-H]
  =\frac{a^2}{H}\mathbb E[Q^2j(a^2Q^2/H^2)]
  \ge \frac H D\left(\sqrt{1+Da^2/H^2}-1\right).
$$
Replacing $\mu$ by any positive lower bound $\mu_0$ preserves the inequality. Choose $a^2=((e\mu_0)^2-H^2)_+/D$. Substitution gives the explicit necessary loss
$$
 \delta_r\ge d_r=\frac{(e\mu_0-H)_+^2}{eD}. \tag{2}
$$

For the computation, put $A=T-2$, $B=(T^2-6T+6)/\sqrt{12}$. Using $\mathbb E_*T^{k+1}=(k+3/2)\mathbb E_*T^k$ gives
$$
 H^2\ \ge\ \ell^2-\ell\beta+7\beta^2/4+
  2\eta\,|3\ell/4-15\beta/8|/\sqrt{12}+51\eta^2/64
  \ \ge\ \mathbb E_*g_{\nu_*}^2
$$
when $H$ is chosen as an upper enclosure of the square root of the middle expression. The verifier uses $0.288676$ as an upper bound on $1/\sqrt{12}$, rounds the square root upward to a multiple of $10^{-6}$, and uses $\mu_0=0.8862$. It verifies these directions with integer arithmetic and the classical $333/106<\pi<355/113$.

For each row minimize $t^2-2\ell_r t+C_r+d_r-500/701$ on $[1/4,2/5]$ by projecting $\ell_r$ onto the interval. The least of these 29 rational minima occurs on row 0.50 at $t=2/5$ for $m=48$. The script prints every row's necessary loss and excess. Discarding the loss makes the test fail, as does extrapolating these estimates to $t=0.41$. Thus the obstruction reaches well beyond the reviewed sector-free estimate through $0.25282$ (ledger 4.18c). Existing failures of *sufficient* sector estimates in the attack plan concern related fields. Here (1) tests the unrestricted sector inequality itself at the scalar optimizer.

### The sector loss on the response fields of actual unimodular pairs

Let $I=[1/4,5/12]$, $e=39/50$, $\eta=779/10000$, and $\mu=\sqrt\pi/2$. For each $t\in I$ we construct one unimodular pair of visible mass $t$. The row calculation uses this same pair on all 29 rows, including for a sector bound whose loss depends on the response fields and can have either sign.

**Realizing the two responses.** Use 130 independent standard complex Gaussian coordinates, one visible $z$, 128 remote coordinates $Y_j$, and one further remote coordinate $Z$. Define
$$
Q=\frac{1}{\sqrt{128}}\left(\sum_{j=1}^{64}(|Y_j|^2-1)-\sum_{j=65}^{128}(|Y_j|^2-1)\right),
\qquad b=\operatorname{sgn}Q .
$$
Each centered exponential has variance 1 and fourth moment 9. Independence gives $\mathbb E Q^2=1$ and $D:=\mathbb E Q^4=3+6/128=195/64$. The two blocks are interchangeable, so $\mathbb E b=0$. The law has no atom at zero. Hölder gives $1=\mathbb E Q^2\le (\mathbb E|Q|)^{2/3}D^{1/3}$.

Set $a=27/100$, $u=a/(e\mu\mathbb E|Q|)$, and choose a real sign $S$ depending only on $\arg Z$ with mean $t/(\mu\sqrt{1-u^2})$. Indeed $u\le a\sqrt D/(e\mu)<4/5$ and $t\le5/12<(22/25)(3/5)$. Choose the same positive arc of the required relative length in each of six equal angular sectors. Then $S$ has period $\pi/3$, so every nonconstant Fourier mode has absolute frequency at least six. Define
$$
h=\operatorname{ph}(z)\sqrt{1-u^2}\,S,\qquad
k=i\operatorname{ph}(z)u b,\qquad f=h+k,\quad g=h-k.
$$
Both $f$ and $g$ are unimodular since $\operatorname{Re}(h\bar k)=0$ and $|h|^2+|k|^2=1$.

On chaos projections through total degree five, $S$ can be replaced by its mean. Its centered part pairs to zero with every polynomial of degree at most five in $Z,\bar Z$, by angular orthogonality for nonzero frequencies and its zero mean for frequency zero. In particular $P_{1,0}h=tz$. Writing $T=|z|^2$, $A(T)=T-2$, $B(T)=(T^2-6T+6)/\sqrt{12}$, the measure $d\mathbb P_*=(\sqrt T/\mu)d\mathbb P$ gives $T$ the Gamma$(3/2,1)$ law. Hence $\gamma:=\mathbb E_*B=\sqrt3/8$ and $G_5=\eta P_{3,2}h=\nu' e_{3,2}(z)$ with $\nu'=\eta t\gamma$.

The remote $(1,1)$ projection of $b$ equals $(\mathbb E|Q|)Q$. Indeed invariance under unitary transformations within each block makes each diagonal block of the coefficient matrix scalar and both off-diagonal blocks zero. Block interchange makes the two scalars opposite. This invariant, antisymmetric line is spanned by the unit vector $Q$, and $\langle Q,b\rangle=\mathbb E|Q|$. In the $(2,1)$ projection of $k$ the visible frequency must be one. The entirely visible cubic has coefficient zero because $\mathbb E b=0$. The other possible term is the visible linear projection times the remote $(1,1)$ projection. Since $P_{1,0}\operatorname{ph}(z)=\mu z$, this yields exactly $G_3=e P_{2,1}k=i a zQ$ and remote core $q=0$.

**The scalar supremum at zero remote core.** Write $g_\nu(T)=\ell+\beta A(T)+\nu B(T)$ and
$$
N(\nu)=\mathbb E[\sqrt T\,|g_\nu(T)|],\qquad F(\nu)=2N(\nu)-\nu^2/\eta .
$$
Because $\|e_{3,2}\|_2=1$, $N$ is globally 1-Lipschitz, so its penalized supremum is attained on $[-\eta,\eta]$. On the 28 rows other than 0.125, the maximizing coefficient is exactly
$$
\nu_*=\eta\mu\gamma,\qquad \gamma=\sqrt3/8.
$$
To see this, use $-2\le A\le4$, $|B|\le\sqrt3$ on $0\le T\le6$. The row data give $\ell-\max(2\beta,-4\beta)-\eta\sqrt3>0$, hence $g_{-\eta}>0$ on that interval. On $T>6$, $B>0$. Direct integration using $\sqrt T\le T/\sqrt6$ there yields
$$
\mathbb E_*[B\mathbf1_{T>6}]
\le \frac{1}{\mu\sqrt{72}}\int_6^\infty(T^3-6T^2+6T)e^{-T}\,dT
=\frac{108e^{-6}}{\mu\sqrt{72}}<\frac1{25}.
$$
The last comparison uses $\mu>22/25$, $\sqrt{72}>8$, and $\exp(6)>400$ from the exponential series through degree eighteen. The polynomial $g_{-\eta}$ has at most two real zeros, and $B$ is integrable. Differentiating under the integral gives $N'(-\eta)=\mu\mathbb E_*[B\operatorname{sgn}(g_{-\eta})]$, so $N'(-\eta)\ge\mu(\gamma-2/25)>1/16$. Convexity of $N$ gives this lower bound for its slopes on $[-\eta,\eta]$. Consequently $F$ is strictly increasing up to $\eta/16$.

For $\eta/16\le\nu\le\eta$, $g_\nu(T)>0$ on the entire half-line. For $\beta\ge0$ use $g_\nu\ge\ell-2\beta-3\eta/\sqrt{12}$, since $B(T)=((T-3)^2-3)/\sqrt{12}$. For $\beta<0$, complete the square to get
$$
g_\nu\ge\ell+\beta-3\nu/\sqrt{12}-\beta^2\sqrt{12}/(4\nu)
\ge\ell+\beta-3\eta/\sqrt{12}-4\beta^2\sqrt{12}/\eta .
$$
The corresponding lower bound is positive on each row concerned. There $N(\nu)=\mu(\ell-\beta/2+\nu\gamma)$ is affine, so $F$ attains its maximum at $\nu_*$, which lies in $[\eta/16,\eta]$. Also $N(\nu')\ge\mu(\ell-\beta/2+\nu'\gamma)$ by $|g_{\nu'}|\ge g_{\nu'}$. Thus the maximal scalar improvement on the 28 rows satisfies
$$
\sup_\nu F(\nu)-F(\nu')\le (\nu'-\nu_*)^2/\eta=\eta\gamma^2(\mu-t)^2 .
$$

On row 0.125 use $v=\sqrt{\ell^2+2\beta^2}>\eta$. Orthogonality of $z$, $e_{2,1}$ and $e_{3,2}$ gives
$$
F(\nu)\le 2\sqrt{v^2+\nu^2}-\nu^2/\eta\le 2v+(1/v-1/\eta)\nu^2\le2v .
$$
Together with the same affine lower bound on $N(\nu')$ this gives a scalar improvement of at most $2v-2\mu(\ell-\beta/2+\nu'\gamma)+(\nu')^2/\eta$.

**The 29 row inequalities for this pair.** In (1) replace $g_{\nu_*}$ by $g_{\nu'}$. The same two applications of Jensen give a necessary sector loss of at least
$$
 \frac{2\mu}{D}\big(\sqrt{H^2+Da^2}-H\big)-a^2/e-\big(\sup F-F(\nu')\big),
$$
where $H^2\ge\mathbb E_* g_{\nu'}^2$. On each of $[1/4,3/8]$ and $[3/8,5/12]$, the script bounds $H$ uniformly by the same Gamma moments, using $\nu'/\sqrt{12}=\eta t/16$. It bounds the scalar difference above using the lower endpoint of the interval in $(\mu-t)^2$; row 0.125 uses its separate bound above. Minimizing each row quadratic on the interval gives strict excess over $500/701$ of at least $0.00788$ on the first interval (row 0.40 is limiting) and $0.00012$ on the second (row 0.50 is limiting). Those minima include all 29 rows, even when the necessary sector loss for a particular row is negative.

The actual pair has $\|P_{2,1}h\|^2=t^2/8$, by $\mathbb E_*(T-2)=-1/2$, and $\|P_{3,2}h\|^2=3t^2/64$. Dropping the two negative terms involving $k$ from the payoff identity below gives
$$
 V\le (1-e/8+3\eta/64)t^2+a^2/e < 0.252 .
$$
### Comparison with the published law cap

For the constructed pairs let $S_r(0)=\sup_\nu F(\nu)$. The sector inequality of P4 asks for $\Lambda_5\le S_r(0)+\delta_r$. The estimate above bounds the amount $\delta_r$ this comparison needs. Replacing the scalar response by the global law cap in the next step also adds the difference $C_r-2\beta^2/e-S_r(0)$. That difference can exceed the necessary sector loss.

For example, on the four rows below the scalar maximization already proved gives
$$
S_r(0)=2\mu(\ell-\beta/2)+\eta\mu^2\gamma^2 .
$$
For the actual response, the two moduli coincide. Cauchy–Schwarz in the joint law of the biased $T$ and the independent $Q$, followed by $\mathbb E Q^2=1$, gives
$$
\Lambda_5
=2\mu\,\mathbb E_{*,Q}\sqrt{g_{\nu'}(T)^2+a^2Q^2}-a^2/e-(\nu')^2/\eta
\le 2\mu\sqrt{\mathbb E_*g_{\nu'}^2+a^2}-a^2/e .
$$
The second-moment enclosures above and $0.8862<\mu<0.8863$ yield the following bounds throughout $[1/4,5/12]$. The table uses the smaller published $C_r$ when a row has two caps.

| Row | $C_r-2\beta^2/e-S_r(0)$ | $C_r-2\beta^2/e-\Lambda_5$ |
|---|---|---|
| 0.25 | $(0.2620,0.2621)$ | $>0.167$ |
| 0.30 | $(0.1890,0.1892)$ | $>0.119$ |
| 0.40 | $(0.1142,0.1144)$ | $>0.069$ |
| 0.50 | $(0.0617,0.0619)$ | $>0.033$ |

In fact $C_r-2\beta^2/e-\Lambda_5>0.019$ for this family on **all nine law-aware rows**. On row 0.25, maximizing the convex term $t^2-2\ell t$ at the endpoints in each interval above proves
$$
t^2-2\ell t+2\beta^2/e+\Lambda_5 < 500/701-0.172.
$$
The verifier checks these inequalities by rational arithmetic. The independent [numerical review](https://github.com/agalatan/grothendieck-lean/pull/640#issuecomment-7150978486) also evaluated the unrelaxed row at individual masses.

For general $q$, Claim 1 would suffice with a direct bound
$$
\Lambda_5+(b_A^2+b_B^2)\|q\|^2/\eta\le C_r-2\beta^2/e+\operatorname{room}(r)
$$
on each row's active cell. The examples above satisfy this comparison with zero allowance on the law-aware rows. Whether it holds for all relevant pairs, or follows from a joint sector and law estimate, remains open.


## The row inequality and the law reduction (P4, Claim 1)

Write $P=P_{1,0}$, $Q=P_{2,1}$, $R=P_{3,2}$, $e=39/50$, and $\eta=779/10000$. For unimodular $f,g$, let $h=(f+g)/2$, $k=(f-g)/2$, and $t=\|Ph\|_2$. Choose a Gaussian unitary frame with $Ph=t z_1$. At $t=0$ any frame works. Write $w$ for the remaining coordinates. The inner product is conjugate-linear in its first argument. Self-adjointness of $T=P-eQ+\eta R$ cancels the mixed terms in the real part, giving
$$
V=\operatorname{Re}\langle f,Tg\rangle
=t^2-e\|Qh\|^2+\eta\|Rh\|^2-\|Pk\|^2+e\|Qk\|^2-\eta\|Rk\|^2.
$$

Fix a row $(\ell,\beta,b_A,b_B)$. Let $B=\beta\sqrt 2\,e_{21}(z_1)$, $L=\ell z_1+B$, $G_3=eQk$, $G_5=\eta Rh$, and $q=\mathbb E[G_3\mid w]$. Set $C=b_Aq e_{11}(z_1)+b_B\bar q e_{20}(z_1)$. The independent-coordinate Wick tensor decomposition puts $q$ in the remote $H_{2,1}$ and both summands of $C$ in $H_{3,2}$. The visible factors $e_{11}, e_{20}$ are orthonormal. Independence therefore gives $\|C\|^2=(b_A^2+b_B^2)\|q\|^2$.

1. Completing the square $e\|Qh+B/e\|^2\ge0$ gives $-e\|Qh\|^2\le2\operatorname{Re}\langle B,h\rangle+2\beta^2/e$.
2. Discard $-\|Pk\|^2\le0$.
3. Substitute the identities $e\|Qk\|^2=2\operatorname{Re}\langle G_3,k\rangle-\|G_3\|^2/e$ and $\eta\|Rh\|^2=2\operatorname{Re}\langle G_5,h\rangle-\|G_5\|^2/\eta$.
4. Completing $\eta\|Rk-C/\eta\|^2\ge0$ gives $-\eta\|Rk\|^2\le-2\operatorname{Re}\langle C,k\rangle+\|C\|^2/\eta$.
5. Since $\langle z_1,h\rangle=t$, add and subtract $2\ell t$. The resulting linear terms are the real pairings of $L+G_5+G_3-C$ with $f$ and of $L+G_5-G_3+C$ with $g$. Each pairing is bounded by the expected modulus of its first argument.

With $\Lambda_5$ as defined in P4, this proves
$$
 V\le t^2-2\ell t+2\beta^2/e+(b_A^2+b_B^2)\|q\|^2/\eta+\Lambda_5(G_3,G_5).
$$
Under the row's sector hypothesis $K_5(\eta_5)$, the two terms in $\|q\|^2$ combine into $-\kappa\sigma^2$, where $\kappa=1/e-(b_A^2+b_B^2)/\eta$ and $\sigma=\|q\|$. For $\sigma>0$, use the law of $U=|q|^2/\sigma^2$. At $\sigma=0$, $\sigma\sqrt U=0$ for any admissible auxiliary law. One may take $U=|G|^2$ for a standard complex Gaussian $G$. Its first three moments are $1,2,6$, and $\mathbb E\sqrt U=\sqrt\pi/2<95133/100000$. To check (L5), take $X=\operatorname{Re}G$ of variance $1/2$. Gaussian integration by parts gives $\mathbb E[XW(X)]=\mathbb E[w(X)]/2$, leaving $-\mathbb E[w(X)^2]/(2\mu)\le0$. This argument includes an empty remote block.

### Convexity and the two compact parameter intervals

Put $D=1-b_Ae_{11}(z_1)-b_Be_{20}(z_1)$, and write $\Psi(s;\nu)=\mathbb E|L+\nu e_{32}+sD|+\mathbb E|L+\nu e_{32}-sD|$. Each summand is the expected norm of a real-affine function of $(s,\nu)$, so $\Psi$ is jointly convex and the sum is even in $s$. Changing $z_1$ to $-z_1$ interchanges the two summands, so either one is $\Psi/2$. The reverse triangle inequality gives coordinate Lipschitz constants $2\mathbb E|D|\le2\sqrt{1+b_A^2+b_B^2}$ and $2\mathbb E|e_{32}|\le2$. These bounds hold at zeros of the integrand as well.

For fixed admissible $U$, write $F(\sigma,\nu)=\mathbb E\Psi(\sigma\sqrt U;\nu)-\kappa\sigma^2-\nu^2/\eta$ and $\rho=95133/100000$. Then
$$
 F(\sigma,\nu)-F(0,\nu)
 \le 2\rho\sqrt{1+b_A^2+b_B^2}\,\sigma-\kappa\sigma^2.
$$
For a row with $\kappa>0$, every $\sigma\ge2\rho\sqrt{1+b_A^2+b_B^2}/\kappa$ is dominated by $\sigma=0$. For $|\nu|\ge\eta$, set $\nu_0=\operatorname{sgn}(\nu)\eta$. At the same $\sigma$,
$$
 F(\sigma,\nu)-F(\sigma,\nu_0)
 \le 2(|\nu|-\eta)-(\nu^2-\eta^2)/\eta
 =-(|\nu|-\eta)^2/\eta\le0.
$$
Both reductions are uniform over the admissible laws.

## An independent proof of the small-$t$ bound (P4, Claim 3)

For every unimodular pair and every dimension,
$$
 V\le \tfrac25 t^2+\tfrac{7058083}{10^7}.
$$
The argument uses two established estimates for the cubic witness with an identity tail.

Write $x=t^2$, $K=\|k\|^2$, $A=\|Qk\|^2$, $E=25/31$, $r=e/E=1209/1250$, $u=47/1953$, and $c=2u+1/2$. Pointwise $|h|^2+|k|^2=1$. Orthogonality gives $K\le1-x$ and $\|Rh\|^2\le1-K-x$.

The required inputs are the following. The Lean names without a namespace in this paragraph belong to `Grothe.LowerAnalytic`.

- The two bounds `twice_normSq_QkOf_le` and `integral_phiMass_QkOf_le` compare $2EA-cK$ and $EA+S$ with the same integral, giving $EA-cK\le S$. Here $S=$ `Grothe.Lower.massS` $<166/1000$.
- The cubic witness with parameters $(191/250,\nu)$, $\nu=47/2000$, has hat value
  $$
   \widehat V=x-\|Pk\|^2+E(A-\|Qh\|^2)-2uK.
  $$
  Its scalar cap is `witnessCap_cert` applied to `tailNodeCaps_cert`. Taking the real part and using `VOf_eq_hat` gives $(1-\nu)\widehat V+\nu\le (1-\nu)\,\mathrm{envB}+\nu$. Hence $\widehat V\le\mathrm{envB}=7064131/10^7<71/100$ for every pair. The cap is stated for complex dimension $n\ge2$. A one-dimensional pair embeds by adjoining an unused independent Gaussian coordinate. Tensoring with the constant $1$ preserves every displayed chaos projection and norm. In dimension zero the three projections vanish.

For $x\le4/25$, the identity for $V$ and the mass bound give
$$
\begin{aligned}
 V&\le (1-\eta)x+\eta+eA-\eta K\\
  &\le (1-\eta)x+\eta+rS+(rc-\eta)K\\
  &\le (1-rc)x+r(c+166/1000).
\end{aligned}
$$
In the last step $rc=27833/52500>\eta$. The last line has slope greater than $2/5$, so its smallest margin below the claimed bound on this interval occurs at $4/25$ and equals $39251/10^7$.

For $x\ge4/25$, subtract $r\widehat V$ from the identity for $V$. The cubic terms cancel exactly. Use $\|Rh\|^2\le1-K-x$ and discard $-\eta\|Rk\|^2$ to obtain
$$
 V\le r\widehat V+\eta+(1-r-\eta)x+(2ru-\eta)K-(1-r)\|Pk\|^2
 \le r(71/100)+\eta+(1-r-\eta)x .
$$
Indeed $2ru=611/13125<\eta$ and $r<1$. The slope is $-451/10000$, so the smallest margin below the claimed bound on this interval is $124123/10^7$, again at $4/25$. This proves the assertion over the full range of $t$.

## The exact envelope and the number of row hypotheses (P4, Claim 4)

All row quadratics have the same leading term. Subtracting two gives an affine function, so their crossing is rational. For each consecutive pair of active rows the verifier computes the crossing, checks dominance over every competing row at both ends of each cell, and takes the larger endpoint value of the convex quadratic there. It also checks the original small-mass bound up to $7967/125000$. The maximum is $B=0.71289401261675\ldots$ at $t=0.84759576884449\ldots$, at the crossing of rows 0.845 and 0.85.

The original table gives approximate rooms. Using its printed rooms literally at $t=0.847596$ gives a minimum over all 29 adjusted quadratics strictly greater than $500/701$. For use as an allowance, round the exact difference from the target downward. The replay prints all 29 such allowances with `--rooms`.

To count the remaining row premises, use the independently reviewed bound of ledger 4.18(a) up to $t=1/4$. Its value there is at most $2851433/4000000<B$, using $\rho_0=2287/2500$. On $[1/4,886227/10^6]$ the following are exact properties of the *plain* intercepts, before any sector losses are charged.

| Number of rows | Row labels | Maximum of the selected envelope |
|---|---|---|
| 6 | 0.30, 0.60, 0.78, 0.83, 0.845, 0.86 | $0.71298084390042\ldots < 500/701$ |
| 8 | 0.30, 0.60, 0.78, 0.83, 0.845, 0.85, 0.855, 0.865 | the original $B$ |

The counts are minimal among the 29 plain rows at their respective target heights. Given a height, find the rows lying below or at it at each test mass. Pairwise disjoint eligible sets force a different row at every such mass. For the six-row target the verifier uses masses $0.26,0.50,0.70,0.8116,0.845,0.882$. For $B$ it uses $1/3,4/7,3/4,5/6,11/13,17/20,6/7,23/26$. For the optimal six-row maximum itself, seven test masses have disjoint **strict** sublevel sets. The exhibited six rows attain that maximum, with equality for row 0.86 at the upper end. The published rational data suffice for all comparisons.

These smaller sets identify sufficient plain law caps if a sector estimate with the corresponding allowances can be proved on pairs whose payoff could exceed the target. Formula (2) explains why the unused room in these envelopes cannot simply pay for an unrestricted sector bound. The conditional implication of P4 still follows by using the exact row rooms in Claim 4 together with Claims 1–3 and the degree-five witness transfer.

## Replay

From the repository root run:

```sh
python3 -I -O research/higher-degree/code/sector-budget-codex-a7c4/verify.py --rooms
```

The script uses standard-library rational arithmetic and integer square roots. Its only data input is the existing `degree5-attack/rows2b.json`. The negative controls check what happens when the displayed rooms are used literally, when the transverse sector cost is dropped, and when the obstruction is extrapolated to $t=0.41$.
