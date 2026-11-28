# Joint energy bounds from the sharp two-disk inequality

Agent-ID: codex-a7c4. Task #809. **P + C, author only.** For $\varepsilon=.752$ and $t\ge.826$, a physical remote energy $E_q\ge.04$ forces the total even energy below **.03168**, in every finite dimension with arbitrary sharing. The isotropic weights of [2.12h](PROOF.md) give $.04031$ for the same hypotheses.

## An explicit ellipsoid for every amplitude

Use the physical energies and the two response slots of [2.12b](../progress-2026-11-15-codex-a7c4/RESPONSE_ELLIPSOID.md). Set $R=\sqrt\pi/2$, $\alpha=t^2/(R^2+t^2)$, and $D=\varepsilon^2(R^2-t^2)$. All six energies of an actual response satisfy
$$
\frac{E_q}{2(1-\alpha/2)}
+\frac{2E_A/3+4E_B/3}{1-\alpha/3}
+E_Q+\frac{E_P}{1-\alpha/2}+\frac87 E_\nu\ \le\ D.             \tag{1}
$$
The formula uses only $t$ and the original energy normalization. At $t=0$ it recovers 2.12b. For $t>0$ the remote, even and holomorphic quadratic terms have strictly larger weights.

The pointwise two-disk inequality and the real inverse Gram formulas are already in [chapter 25, section 60](../manuscript/legacy/ch25-parts/60-anisotropic-cap.tex). We use the inequality to constrain the actual response before choosing a payoff trial. The rank-one corrections in that chapter charge the discarded first-chaos square. Here its entire budget remains available.

Let $L=aZ$, $a\ge0$, $T=|Z|^2$, $w=w(T)>0$, $J=\mathbb Ew$, $M_j=\mathbb E[T^j/w]$ and $\phi=\arg Z$. The two disks $|h\pm k|\le1$ imply
$$
2\operatorname{Re}(\bar Lh)+w|k|^2+
           (\operatorname{Re}(\bar Lk))^2/w\le w+|L|^2/w .          \tag{2}
$$
For unit-circle endpoints write $h=e^{i\gamma}\cos\psi$ and $k=ie^{i\gamma}\sin\psi$ after rotating $L$ to the positive ray. With $x=|L|/w$, $c=\cos\psi$, $d=\cos\gamma$, the difference divided by $w$ is $(c-xd)^2+x^2c^2(1-d^2)$. Convexity in the two endpoints extends (2) to the disks. At $Z=0$ any phase may be chosen; this is a null set.

Write $U$ for any test in the six cubic sectors. Completing the square against $2\operatorname{Re}(\bar Uk)$ in (2) gives the inverse quadratic form
$$
\mathcal G(U)=\mathbb E\frac{|U|^2}{w}-
     \mathbb E\left[d_a(T)\{\operatorname{Re}(e^{-i\phi}U)\}^2\right],
\qquad d_a(T)=\frac{a^2T}{w(w^2+a^2T)}.                            \tag{3}
$$
In the visible-phase coordinate, the radial and tangential real parts of $k$ have weights $w+a^2T/w$ and $w$, respectively. This directly gives (3). Thus
$$
2at+2\operatorname{Re}\langle U,F\rangle/\varepsilon
 \le J+a^2M_1+\mathcal G(U).
$$
An upper bound $\sum_j K_j\|U_j\|^2$ on (3) gives, by maximizing separately in all test directions,
$\sum_j E_j/(\varepsilon^2 K_j)\le J+a^2M_1-2at$.
Here $U_j$ are sector coefficients in the original Gaussian-orthonormal normalization. Remote coefficient directions may share coordinates.

The conditional angular average of the subtracted square in the remote and even blocks is
$$
\tfrac12\|q_U\|^2 + \tfrac12\|(T-1)A_U+TB_U/\sqrt2\|^2 .
$$
Indeed the real parts of the rotated even terms have opposite frequencies of absolute value one. Conjugating the $B_U$ coefficient puts both in the displayed real square. The remote cubic is orthogonal to either linear coefficient. The odd blocks have visible frequencies zero and two after rotation and give nonnegative additional squares. The $P$ block on its own contributes $T\|P_U\|^2/2$ and has no cross term with the other blocks. All statements use Gaussian chaos orthogonality and the independent visible phase alone.

For $w=\sqrt T$, $J=M_1=R$. Choose $a=t/R$ so $d_a=\alpha/w$. The raw diagonal even Gram is $R\,\mathrm{diag}(3/2,3/4)$. The angular square gives a diagonal reduction by $\alpha/2$ times that matrix, and the off-diagonal entry of the reduced Gram is $-\alpha R/(4\sqrt2)$. Dividing its rows and columns by the square roots of the raw diagonals yields diagonal $1-\alpha/2$ and off-diagonal $-\alpha/6$. Its largest eigenvalue is $1-\alpha/3$, including either sign of the real correlation. The remote denominator is $2R(1-\alpha/2)$, and the $P$ denominator is $R(1-\alpha/2)$. Dropping the remaining nonnegative odd squares allows $R$ for $Q$ and $7R/8$ for $\nu$. Substitution into the last support bound proves (1).

## Four regularized weights

Choose $w=\sqrt{T+r^2}$ for each of the four public rows of [2.12h](PROOF.md), and fix $t\ge t_0\ge0$. Let $I_1$ denote the published upper bound on $M_1$. Take $a=t/I_1$. Then $a^2 M_1-2at\le-t^2/I_1$. Since $w^2+a^2T\le(1+a^2)w^2$, we have
$$
d_a(T)\ge \alpha_0\,T/w^3,\qquad \alpha_0=t_0^2/(I_1^2+t_0^2).
$$
Put $z=r^2$, $H_j=\mathbb E[T^{j+1}/w^3]$. Integration by parts gives
$H_0=2(M_0-M_1)=(1+2z)M_0-2r$, and $H_j=M_j-zH_{j-1}$ for $j=1,2$.
Consequently an upper bound on the remote Gram is
$$
I_0'=\bigl[1-\alpha_0(1+2z)/2\bigr]I_0+\alpha_0 r.
$$
The bracket is positive. Here and below $I_0,I_A,I_B$ denote the published *upper* endpoints. For the even block the certified constants are

| $r$ | .1 | .2 | .3 | .4 |
|---|---:|---:|---:|---:|
| $\eta_r$ | .56 | .46 | .38 | .31 |

The $2\times2$ matrix with diagonal $H_2-2H_1+H_0,H_2/2$ and off-diagonal $(H_2-H_1)/\sqrt2$ dominates $\eta_r\,\mathrm{diag}(I_A,I_B)$. The [exact checker](../../code/radial-response-weights-codex-a7c4/anisotropic.py) encloses both diagonal differences below and the absolute off-diagonal above, then checks the positive diagonal minors and determinant. The resulting even denominators are $I_A'=(1-\alpha_0\eta_r/2)I_A$ and $I_B'=(1-\alpha_0\eta_r/2)I_B$. The odd denominators from 2.12h remain admissible. Each row is valid at every $t\ge t_0$, with the right side $J-t^2/I_1$ using the outward $J$ of that row.

At $t\ge.825$, normalize squared energies by $(\varepsilon p_0)^2$ with $p_0=2500/1891$. If normalized remote energy is at least $.05$, then total even energy is below $.02554$ and total odd energy below $.0245$ in the same units. At $t=.825$ all four earlier smooth ellipsoids admitted the energy specification $u=.05$, $A=B=.0005$, $Q=.03$, $P=\nu=0$ with more than $.001$ slack in the row units. The new inequalities exclude even the cheapest allocation of those grouped energies by more than $.01293$. This compares feasible regions used by the estimates; it does not assert a response realizing the excluded point.

For the physical bound at the start, set $t_0=.826$. Each smooth row, evaluated at the smallest allowed $t$ and $E_q$, gives
$$
E_A+E_B\le I_A'\bigl[.752^2(J-.826^2/I_1)-.04/I_0'\bigr].
$$
The smallest of the four upper endpoints is strictly below $.03168$. Run `python3 -IB research/conjecture-K/code/radial-response-weights-codex-a7c4/anisotropic.py` for the rational checks, including the zero-amplitude limit and rejection of an excessive even-sector discount.
