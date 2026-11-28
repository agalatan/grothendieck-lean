# Sharp one-coordinate values and unrestricted high arms for positive fifth witnesses

Write $S=\nu I+\alpha P-\beta Q+sF$ with $\alpha=1-\nu$, $\beta=e+\nu$, $s>0$; the fifth eigenvalue is $\nu+s$. For each of the three witnesses below, the exact supremum of the absolute physical payoff over **one arbitrary linear-coordinate response and an unrestricted partner in any finite dimension** equals
\[
 B=\nu+\frac\pi4\left(\alpha-\frac\beta8+\frac{3s}{64}\right).
\]
The visible phase paired with itself attains this value. The same $B$ is the exact **absolute diagonal supremum in every dimension**, with arbitrary multivariate disk-valued responses. For two unrestricted unimodular responses, phase-align the payoff and put $t=\|P((f+g)/2)\|$. The last two columns give sufficient amplitudes for the $1.4023$ test, first from a radial estimate, then from its angular improvement. Every preceding $10^{-8}$ decimal fails the corresponding scalar estimate.

| $e$ | $\nu$ | $s$ | $1/B$ exceeds | Radial high cutoff | Angular high cutoff |
|---:|---:|---:|---:|---:|---:|
| .78 | 0 | .0779 | 1.40510660404579 | .88434007 | .88379261 |
| .784 | .0235 | .04 | 1.40323737893542 | .88563226 | .88547304 |
| .804 | .0235 | .08 | 1.40420461267805 | .88505990 | .88481150 |

The first row is the original positive pure fifth witness. The other two are the [coupled cubic and fifth witnesses](COUPLED_CUBIC_FIFTH.md). The reciprocals in the fourth column concern only the stated response class. Both high cutoffs cover every fresh bidegree. The global payoff can be larger for a pair with two genuinely multivariate responses at intermediate amplitude.

## A two-row positive form with a unit tangent row

Use the normalized $z,q,v$ of the [one-coordinate calculation](ONE_COORDINATE.md). For $u_0=\operatorname{ph}Z$ their moments are $\mu=\sqrt\pi/2$, $a=-\mu/(2\sqrt2)$, $b=\sqrt3\mu/8$. Put $T=|Z|^2$,
\[
 L=\alpha\mu z-\beta a q+s b v=\mu Zp(T),\quad
 p(T)=c_0+c_1T+sT^2/16,
\quad c_0=\alpha-\beta/2+3s/8,\quad c_1=\beta/4-3s/8.
\]
Each listed witness has $c_0\ge9/16$ and $c_1>0$. Hence the phase of $L$ is exactly $u_0$ almost everywhere. With $A=|L|$, $\Lambda=\nu+A$, $M=B-\nu$, we have $\mathbb E A=M$ exactly.

Let $G=\alpha\mu^2+s b^2$. Rotate the two positive tests $\sqrt\alpha z,\sqrt s v$ by the orthonormal basis parallel and perpendicular to $(\sqrt\alpha\mu,\sqrt s b)$. Against the lifted input $(\sqrt A u,\sqrt\beta\langle q,u\rangle)$ the parallel row is represented by $(L/\sqrt{GA},\sqrt\beta a/\sqrt{G})$. Its squared norm is $(M+\beta a^2)/G=1$. The perpendicular row is represented by $(\sqrt{\alpha s/G}(b z-\mu v)/\sqrt A,0)$. The two rows are orthogonal because $L/A=u_0$ and $\langle u_0,bz-\mu v\rangle=0$. The perpendicular row has squared norm at most $3s/(4c_0)<1$. Indeed, with $X$ of law $\operatorname{Gamma}(3/2,1)$,
\[
 \frac1{12}\mathbb E (X^2-6X+21/4)^2=3/4,
\]
and $A\ge\mu\sqrt T c_0$, $G\ge\alpha\mu^2$. These two rows constitute a contraction, proving $S\le\Lambda$ in one coordinate. The negative sign follows from the $(0,0)$ cubic price below. Polarization, then conditional expectation onto $Z$ of the unrestricted partner, gives the claimed absolute bound. The conditional expectation commutes with $P,Q,F$ by the product Hermite expansion.

## All fresh sectors and the single residual

Take $Z$ along the visible first projection of $h=(f+g)/2$ as in the [signed remote reduction](REMOTE_CUBIC_MULTIPLIER.md). For $Y$ the fresh coordinates, let $\tau$ be the norm of the cubic projection of $k=(f-g)/2$ in $Y$ alone, constant in $Z$. In the positive half, the $(0,0)$ block was just settled. In every other block $Ph$ vanishes and $sF$ is paid by $A$ with coefficient $2s/c_0<1$. This uses the [pure-chaos inverse-radius theorem](PURE_CHAOS_RADIAL.md): for every unit fifth test $u$, $\mathbb E[|u|^2/A]\le\sqrt\pi/(\mu c_0)=2/c_0$. Weighted Cauchy–Schwarz proves the claim without bounding the number of fresh modes.

In the negative half there is only one costly projection, $\beta Q$. Write $W=2\nu+A$ and choose $c=c_0+\delta$, where $\delta$ equals $0,.047,.054$ in table order. We have $W\ge\mu\sqrt T(c+c_1T)$ on the entire half-line. To check this it suffices that $2\nu/\mu+(s/16)r^5-\delta r\ge0$ for all $r\ge0$; minimization gives $5^5(2\nu/\mu)^4(s/16)\ge4^4\delta^5$. The [rational verifier](code/positive_remote_multiplier.py) checks this using an upper bound on $\mu$.

Let $U(N;c)$ be the rational upper bound on $\mathbb E[N(T)/(\mu\sqrt T(c+c_1T))]$ described below. The negative prices for the fresh blocks are as follows. Their common multiplicity in a dimension plays no role; sum over orthogonal normalized fresh Hermite indices.

| Fresh bidegree | Cubic price |
|---|---|
| $(0,0)$ | $\beta U(T(T-2)^2/2;c)$ |
| $(0,1)$ | $\beta U(T^2/2;c)$ |
| $(1,0)$ | $\beta[U((T-1-a_0-b_0(T^2-4T+2)/2)^2;c)+a_0^2/\alpha+b_0^2/s]$, with $a_0=-2/5,b_0=-1/25$ |
| $(1,1),(2,0)$ | $\beta U(T;c)$ |
| $(2,1)$ | pay $1/U(1;c)$ of the squared cubic coefficient |

Every displayed nonresidual price is below one. In $(1,0)$ the test is split against the constant first mode and the indicated fifth Hermite; the two extra scalar costs use precisely their positive credits in $S$. No other fresh block has a cubic mode. With $M_1=U(1;c)$, the radial result for every finite physical pair is
\[
 \operatorname{Re}\langle f,Sg\rangle\le B+C\tau^2,\qquad C=\beta-1/M_1.
\]

The absolute diagonal claim now follows without any restriction on the dimension or on the responses' coordinate dependence. For $f=g$, the radial positive bound gives $\langle f,Sf\rangle\le B$ since $k=0$. The lower side satisfies $-\langle f,Sf\rangle\le e\|Qf\|^2$, using the favorable eigenvalues on the other three spaces. The established $\|Qf\|\le.93$ for every disk-valued physical response yields $e(.93)^2<B$ in all three cases. Thus $\operatorname{ph}Z$ attains the global absolute diagonal value. With the [two-vector spectral inequality](SPECTRAL_PAIR.md), every arbitrary unimodular pair also passes the $1.4023$ target when its overlap $|\langle f,g\rangle|$ is at least $.99869821$, $.99956676$ or $.99914232$, in table order. These are sufficient cutoffs obtained using only the absolute diagonal and the spectrum $[-e,1]$.

For the angular improvement expand the quadratic form for $h$ at $u_0$. With $l=h-u_0$, dropping $-\beta\|Ql\|^2$ and bounding $s\|Fl\|^2$ by $(2s/c_0)\mathbb E A|l|^2$ leaves $\kappa=1-2s/c_0$ of the weighted phase defect. Its cost is $\alpha(\mu-t)^2$. The pointwise orthogonality of $h,k$ pays $\kappa A[\operatorname{Re}(\overline{u_0}k)]^2$. Use it on the conjugate pair $(2,1),(1,2)$, exactly as in the signed proof. Here only the first block has a costly mode, the constant cubic, since $sF$ has favorable sign in the negative half. Its inverse diagonal is $\tfrac12(W^{-1}+(W+\kappa A)^{-1})$. As $W+\kappa A\ge(1+\kappa)\mu\sqrt T(c_0+c_1T)$, its average is bounded by $M_2=(M_1+U(1;c_0)/(1+\kappa))/2$. Therefore
\[
 \operatorname{Re}\langle f,Sg\rangle\le B+\alpha(\mu-t)^2+C_2\tau^2,\qquad C_2=\beta-1/M_2.
\]
The high-arm conclusions insert $\tau^2\le2\mu(\mu-t)$. Across the three rows, the computed pairs $(C,C_2)$ are approximately $(.42590737,.32875153)$, $(.45195404,.35608592)$ and $(.46760573,.38476103)$.

## Polynomial proof of each price

Put $x=-c/c_1$. For a nonnegative polynomial numerator $N$, let $J(T)=T H(T)^2$ if $N(x)\ge0$, and $J(T)=H(T)^2$ otherwise. The script uses the monic degree-four Laguerre polynomial with Gamma shape $3/2$ in the first case and $1/2$ in the second. The exact coefficients and the square identity suffice. Set $\gamma=-N(x)/J(x)\ge0$. Then $(N+\gamma J)/(c+c_1T)$ is a polynomial majorizing the integrand's rational factor on $T\ge0$. The moments of $T^j/(\mu\sqrt T)$ are $2(1/2)_j$. Integrate the polynomial term by term to obtain $U(N;c)$. All comparisons, including the adjacent amplitude cutoffs, use rational arithmetic and a Machin enclosure for $\pi$.

~~~sh
python3 -IB -O experiments/quintic-signed/code/positive_remote_multiplier.py
~~~

Agent-ID: codex-a7c4
