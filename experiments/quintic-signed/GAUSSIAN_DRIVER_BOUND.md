# The optimal signed witness on a family of Gaussian phase pairs

Agent-ID: codex-a7c4. For a complex Gaussian coordinate with an independent, conditionally Gaussian perturbation, a genuine fifth-degree change beats every first-chaos retuning in the family below. The comparison covers every visible amplitude, including the central examples with negative signed fifth energy. The best reciprocal scalar cap in the stated parameter range is between **1.40397477 and 1.40397478**. This is a restricted-witness calculation. Arbitrary unimodular responses remain to be controlled to obtain a Grothendieck lower bound.

## Family and result

Let $Z,A_1,\ldots,A_N$ be independent standard complex Gaussians, independent of the remote Gaussian coordinates. The latter include two disjoint groups $B,C$. Let $U$ be a measurable $\mathbb C^N$-valued function of the remote coordinates with $\|U\|=1$ almost surely. Assume $U$ transforms by $e^{i(\alpha-\beta)}$ when all $B$ coordinates rotate by $\alpha$ and all $C$ coordinates rotate by $\beta$. If there are additional remote coordinates, assume that $U$ is invariant under their common phase rotation. Set
\[
 G=\sum_i A_i U_i,\quad x\in[0,1],\quad p=1-x,\qquad
 f=\operatorname{ph}(\sqrt x Z+\sqrt p G),\quad
 g=\operatorname{ph}(\sqrt x Z-\sqrt p G).
\]
The phase at zero can be assigned arbitrarily. Both arguments are standard complex Gaussians. Independent constant phases multiplying the two responses are also allowed in the absolute payoff. The [normalized finite-block examples](FINITE_BLOCK_RESPONSE.md) belong to this family.

Write $P=P_{1,0},Q=P_{2,1},F=P_{3,2}$ for the complex Wiener-chaos projections, $e=191/250$, $\nu=47/2000$, $a_0=\pi/4$, $a_1=a_0/8$, and $a_2=3a_0/64$. For the operator
\[
 S_{w,d}=(1-w)[P-eQ+\nu(I-P-Q)]+wP-dF,\qquad
 0\le w\le1,\quad 0\le d\le(1-w)\nu ,
\]
**the exact maximum of the absolute scalar payoff over this family** is
\[
 B_{w,d}=(1-w)[\nu+(1-\nu)a_0-(e+\nu)a_1]+w a_0-d a_2.
\]
It is attained by $f=g=\operatorname{ph}Z$ at $x=1$. The minimum of this expression over the displayed parameters occurs at $w=0,d=\nu$. At this value the fifth eigenvalue of the original identity tail is reduced to zero. Choosing $w=0,d=1/50$ retains a strictly positive fifth eigenvalue of $7/2000$ and gives a reciprocal above **1.40372082**. The smaller $d=1/1000$ already gives a reciprocal above **1.40234387**. For every $d=0$ and every allowed $w$ the reciprocal is below **1.4023**.

## The payoff pays for the unfavorable fifth energy

Let $h=(f+g)/2$, $k=(f-g)/2$, and let $\Delta_j$ denote the real projection pairing of $f,g$ in degree $j$. Their common phase charge is one, so degree $j=1,3,5$ selects the single bidegree $((j+1)/2,(j-1)/2)$. Rotation of the $A$ block by $\pi$ interchanges the responses and commutes with each projection. Their unrotated pairings are therefore real. One has $Ph=\sqrt{a_0x}Z$ and $Pk=0$ by conditioning on the remote coordinates and using $\mathbb E U=0$.

Use a standard Ornstein–Uhlenbeck pair of correlation $r$ in every Gaussian coordinate, with $U'$ its second copy. Conditional on the remote pair, the cross-correlation of the two complex phase arguments is $r(x-pC_r)$ where $C_r=\sum_i U_i\overline{U'_i}$. The Gaussian phase series is $\sum_{j\ge0}a_j z^{j+1}\bar z^j$, with $a_j\ge0$, $\sum a_j=1$ and $a_{j+1}/a_j=(2j+1)^2/[4(j+1)(j+2)]$. Write $\Psi$ for this function on the real axis. See the [Laguerre derivation](PHASE_SERIES.md).

Write $c_j$ for the degree-$j$ energy of $U$, $D_2$ for the degree-two energy of $U\otimes\bar U$ and $E_2$ for that of $U\otimes U\otimes\bar U$. Set $m_2=\mathbb E|C_0|^2$, $m_4=\mathbb E|C_0|^4$. Extracting the degree-three and degree-five coefficients gives
\[
\begin{aligned}
 \Delta_3&=a_1x^3-a_0p c_2+2a_1xp^2m_2,\\
 \Delta_5&=-a_0p c_4+a_1(-3x^2p c_2+2xp^2D_2-p^3E_2)
       +a_2(x^5+6x^3p^2m_2+3xp^4m_4).
\end{aligned}
\]
Indeed $\mathbb EC_r$ has coefficients $c_j$, and $\mathbb E|C_r|^2$ and $\mathbb E(C_r|C_r|^2)$ have coefficients given by the two tensor self-energies. The coefficients through degree two of $\mathbb EC_r^2$ vanish because $U\otimes U$ has separate charges $(2,-2)$ and thus ambient degree at least four. At $r=0$, $C_0$ is circular by independent rotation of the copies. This deletes all monomials of unequal holomorphic and antiholomorphic degrees from the constant coefficient. These facts justify the expansion even for merely measurable $U$ by the $L^2$ chaos decomposition. The phase series converges absolutely for $r<1$.

Define the reference pairings $\Delta_{3,*}=a_1x^3-a_0p$ and $\Delta_{5,*}=a_2x^5-3a_1x^2p$. If $V$ is the real payoff of $P-eQ+\nu(I-P-Q)$, put
\[
 V_*=(1-\nu)a_0x-(e+\nu)\Delta_{3,*}+\nu\Psi(2x-1).
\]
The unperturbed inner product $\langle f,g\rangle=\Psi(2x-1)$ follows from the exact one-time Gaussian law of $G$. Thus the payoff difference satisfies
\[
 L:=\frac{V_*-V}{e+\nu}=a_0p(1-c_2)+2a_1xp^2m_2\ \ge 0.
\]
Bessel gives $c_4\le1-c_2$ and $E_2\le1$ since the underlying vector and its tensor product both have unit norm. From the displayed fifth formula, retaining the two potentially unfavorable terms gives
\[
 \Delta_5\ge\Delta_{5,*}-L-a_1p^3.
\]
In particular this allowance holds well outside near equality in the remote cubic energy. Multiplying by $-d$ compensates its $L$ charge through $(1-w)(V_*-V)$ because $d\le(1-w)\nu$. The real signed payoff is bounded above by
\[
 (1-w)V_*+wa_0x-d(\Delta_{5,*}-a_1p^3).
\]
For the negative sign, $\Delta_3\le a_1(x^3+2xp^2)\le a_1$, $\Delta_5\le1$ and $\Psi\ge-1$. Thus the real payoff is at least $-(1-w)[\nu+(e+\nu)a_1]-d>-.13$. This also handles independent phase rotations when taking the absolute value.

## Maximizing the scalar envelope

Write $F_d(x)=V_*(x)-d(\Delta_{5,*}-a_1p^3)$. The claimed all-amplitude bound reduces to $F_d(x)\le F_d(1)$ for $d=0,\nu$. It is affine in $d$, and mixing with $P$ adds $wa_0x\le wa_0$. At $x=1$ all the inequalities are equalities for the original responses.

For $0\le x\le .99$ the [exact replay](code/gaussian_driver_compensation.py) expands the polynomial part, encloses each signed monomial on a closed interval and bounds $\Psi(2x-1)$ at its right endpoint by monotonicity. For negative arguments the first series term is an upper bound. For nonnegative arguments the positive tail after the first 32 coefficients is bounded by its total mass times the first omitted power. The two endpoints in $d$ need 66 and 597 intervals respectively. On $.99\le x<1$ the derivative divided by $a_0$ is
\[
 1-e-2\nu-3(e+\nu)x^2/8
 +2\nu\Psi'(2x-1)/a_0-d[15x^4/64+3(2x-1)^2/8].
\]
The first 64 nonnegative derivative terms at $2(.99)-1$ give a uniform lower bound for $F_d'$ strictly above $.001$. Continuity extends the comparison to $x=1$. The replay also checks both signs of the Machin enclosure for $\pi$, the pure obstruction and the stated strict reciprocals.

This proves the sharp maximum for the displayed conditional Gaussian phase family. An arbitrary physical response pair need not have this representation. Extending the compensation inequality, or its payoff consequence, to those pairs is the remaining mathematical step.

~~~sh
python3 -IB -O experiments/quintic-signed/code/gaussian_driver_compensation.py
~~~
