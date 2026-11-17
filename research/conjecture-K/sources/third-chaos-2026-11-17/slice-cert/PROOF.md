<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-third-chaos/slice-cert-2026-11-17/PROOF.md (17 November 2026); a worker of claude-b9ee. Its scripts and logs ("this folder") are in code/third-chaos-2026-11-17/slice-cert/; its ../gemini-weak2-2026-11-17/ and ../hjm-note-2026-11-17/ are ../gemini-weak2/ and ../hjm-note/ here. Only this line was added. -->
# Certified great-circle slicing and restricted rotation bounds on the real third chaos

claude-b9ee, 17 Nov 2026 (Bucharest). Certifies item G4 and the "Extension" (restricted rotation LP) of
`../gemini-weak2-2026-11-17/REVIEW2.md`. Background: Proposition 4.4 of `../hjm-note-2026-11-17/HJM_Example3.1_d2_d3.md`.

Labels, as in the K ledger:

- **P**: proved by hand in this note.
- **C**: checked by computer in rigorous arithmetic (exact integers or rationals, or Arb ball arithmetic through
  python-flint). The computation is fully specified here and in the script.
- **N**: floating point or Monte Carlo evidence only.

Notation: $X\sim\gamma_n$; $V_3(n)$ is the third Wiener chaos on $\mathbb R^n$; $H_3(n)\subset V_3(n)$ are the harmonic
cubic forms; $\|F\|_2^2=\mathbb EF^2$. The two targets are:

- sharp $(C_3)$: $\mathbb E|F|\le\sqrt{2/\pi}\,\|F\|_2$, where $\sqrt{2/\pi}=0.7978845608$;
- weak (T): $\mathbb E|F|\le\sqrt{17/25}\,\|F\|_2$, where $\sqrt{17/25}=0.8246211251$.

## 0. Certified statements

| | statement | label | certified constant | margin to target |
|---|---|---|---|---|
| A1 | $\tau_3(n)=\frac{n+2}{4(n-1)}$; weighted circle lemma for $\gamma\ge 8/9$ (8/9 is sharp); vanishing cross terms; per-radius bound; $\mathbb E\lvert F\rvert\le J_n(p)\lVert F\rVert_2$ with $J_n$ concave | P | | |
| A2 | harmonic cubics, $n\le 12$: $(C_3)$ | P + C (exact) | $b_{12}=0.7978796683$; $b_{12}^2\pi=\frac{67108041}{2^{25}}<2$ | $4.9\cdot10^{-6}$ |
| A2' | harmonic cubics, $n\le 15$: (T) | P + C (exact) | $b_{15}=0.8218762070$ | $2.7\cdot10^{-3}$ |
| A3 | all of $V_3(n)$, $n\le 8$: $(C_3)$ | P + C (Arb) | $B_8=0.797092724$ | $7.9\cdot10^{-4}$ |
| A3' | all of $V_3(n)$, $n\le 11$: (T) | P + C (Arb) | $B_{11}=0.823669828$ | $9.5\cdot10^{-4}$ |
| B | every $n$, every $F\in V_3(n)$: $(\mathbb E\lvert F\rvert)^2\le c_{61}\lVert F\rVert_2^2$ | P + C (exact + Arb) | $c_{61}=0.78786346445$, so $\mathbb E\lvert F\rvert\le 0.8876168\,\lVert F\rVert_2$ | (T) not reached |
| B' | same with $N=121$ | P + C | $c_{121}=0.78708145745$, so $\mathbb E\lvert F\rvert\le 0.8871762\,\lVert F\rVert_2$ | (T) not reached |

Where each method stops (these are failures of the bound, not counterexamples):

- harmonic cubics: $(C_3)$ fails at $n=13$ ($b_{13}=0.80689$); (T) fails at $n=16$ ($b_{16}=0.82818$);
- full chaos: $(C_3)$ fails at $n=9$ ($\max_pJ_9\ge0.80724$); (T) fails at $n=12$ ($\max_pJ_{12}\ge0.830417653$, a rigorous lower bound).

The bound is new at $n=8$: Proposition 4.4 of the HJM note, with the plain constant $4\sqrt5/(3\pi)$, gave
$0.7927$ at $n=7$ and $0.8042$ at $n=8$; the weighted lemma gives $0.785167$ and $0.797093$.

## 1. Setting

**Decomposition.** $V_3(n)=\{\langle b,x\rangle(|x|^2-n-2):b\in\mathbb R^n\}\oplus H_3(n)$.

*Proof.* Write a cubic form as $C(x)=\sum c_{ijk}x_ix_jx_k$ with $c$ symmetric. Its chaos projection (Wick product) is
$C(x)-3\langle \operatorname{tr}c,x\rangle$, where $(\operatorname{tr}c)_k=\sum_ic_{iik}$. The harmonic decomposition is
$C=H+|x|^2\langle\beta,x\rangle$. Since $\Delta C=6\langle\operatorname{tr}c,x\rangle$ and
$\Delta(|x|^2x_k)=(2n+4)x_k$, we get $\beta=3\operatorname{tr}c/(n+2)$. So the projection is
$H+\langle\beta,x\rangle(|x|^2-n-2)$. $\square$

**Polar form.** Put $x=R\Theta$, with $R\sim\chi_n$ and $\Theta$ uniform on $S^{n-1}$, independent. Define

- $e_1(R)=R(R^2-n-2)/\sqrt{2n(n+2)}$ and $e_3(R)=R^3/\sqrt{n(n+2)(n+4)}$.

Then $\mathbb Ee_1^2=\mathbb Ee_3^2=1$: with $S=R^2$, $\mathbb E[S(S-n-2)^2]=2n(n+2)$ and $\mathbb ES^3=n(n+2)(n+4)$.

Every $F\in V_3(n)$ can be written $F(R\Theta)=e_1(R)L(\Theta)+e_3(R)Y(\Theta)$, where $L$ is a spherical harmonic of
degree 1 and $Y$ one of degree 3. Moreover $\|F\|_2^2=\mathbb E_\Theta L^2+\mathbb E_\Theta Y^2$, because
$\mathbb E_\Theta[LY]=0$. Define
$$p:=\mathbb E_\Theta L^2/\|F\|_2^2\in[0,1].$$
For $F=\langle b,x\rangle(|x|^2-n-2)+H$, this is $p=2(n+2)|b|^2/\|F\|_2^2$.

**Circles.** Let $(U,V)$ be a Haar-random orthonormal 2-frame and $x(\varphi)=U\cos\varphi+V\sin\varphi$. For each fixed
$\varphi$, $x(\varphi)$ is uniform on the sphere. Hence
$$(*)\qquad \mathbb E_{U,V}\tfrac1{2\pi}\textstyle\int_0^{2\pi}G(x(\varphi))\,d\varphi=\mathbb E_\Theta G(\Theta).$$

Let $T_3=\operatorname{span}\{\cos\varphi,\sin\varphi,\cos3\varphi,\sin3\varphi\}$. For $g\in T_3$, write $g=g_1+g_3$ for
its frequency parts. Write $\langle u,v\rangle$ and $\overline{u}$ for means over $[0,2\pi)$. Put
$e_1(g)=\overline{g_1^2}$ and $e_3(g)=\overline{g_3^2}$.

The restrictions behave as follows:

- $L\circ x\in\operatorname{span}\{\cos,\sin\}$;
- $Y\circ x$ is a homogeneous cubic in $(\cos\varphi,\sin\varphi)$, so it lies in $T_3$.

## 2. Part A1: hand proofs (P)

**Lemma 1 ($\tau_3$).** Let $Y\in H_3(n)$. Then
$$\mathbb E_{U,V}\,e_3(Y\circ x)=\tau_3(n)\,\mathbb E_\Theta Y^2,\qquad \mathbb E_{U,V}\,e_1(Y\circ x)=(1-\tau_3(n))\,\mathbb E_\Theta Y^2,\qquad \tau_3(n)=\frac{n+2}{4(n-1)} .$$

*Proof.* Let $h=Y\circ x\in T_3$. By Parseval, $\overline{h^2}=e_1+e_3$ and $\overline{h'^2}=e_1+9e_3$, so
$e_3=(\overline{h'^2}-\overline{h^2})/8$.

Now $h'(\varphi)=\nabla Y(x)\cdot t$, where $t=x'(\varphi)=-U\sin\varphi+V\cos\varphi$. For each $\varphi$, $(x,t)$ is again
a Haar 2-frame. So $x$ is uniform on the sphere and, given $x$, $t$ is uniform on the unit sphere of $x^\perp$, which
has dimension $n-1$. Hence
$$\mathbb E[(\nabla Y(x)\cdot t)^2\mid x]=|\nabla_SY(x)|^2/(n-1).$$
Green's formula with $-\Delta_SY=3(n+1)Y$ gives $\mathbb E_\Theta|\nabla_SY|^2=3(n+1)\,\mathbb E_\Theta Y^2$. With $(*)$,
$$\mathbb E\,e_3=\Big(\frac{3(n+1)}{n-1}-1\Big)\frac{\mathbb EY^2}{8}=\frac{n+2}{4(n-1)}\,\mathbb EY^2.\qquad\square$$

REVIEW2's route gives the same value: Schur's lemma, the test function $x_1x_2x_3$, and
$\mathbb E\prod_{j\le3}(U_j^2+V_j^2)=8/((n-1)n(n+4))$. Lemma 1 implies that identity, since
$e_3(x_1x_2x_3\circ x)=|\prod_j(U_j-iV_j)|^2/32$ and $\mathbb E_\Theta(\Theta_1\Theta_2\Theta_3)^2=1/(n(n+2)(n+4))$.
Values: $\tau_3(2)=1$, $\tau_3(3)=5/8$, and $\tau_3\to1/4$. Monte Carlo agrees (N; `sanity_checks.log` §1).

**Lemma 2 (cross terms).** Let $L$ have degree 1 and $Y\in H_3(n)$. Then
$\mathbb E_{U,V}\langle L\circ x,(Y\circ x)_1\rangle=0$.

*Proof.* $L\circ x$ is pure frequency 1, so $\langle L\circ x,(Y\circ x)_1\rangle=\langle L\circ x,Y\circ x\rangle$. By
$(*)$ its mean is $\mathbb E_\Theta[LY]=0$, because harmonics of different degrees are orthogonal. $\square$

No Schur argument is needed. Consequently, at radius $R$, the circle function
$g_R=e_1(R)\,L\circ x+e_3(R)\,Y\circ x\in T_3$ satisfies, for $\|F\|_2=1$:
$$(2.1)\qquad A(R):=\mathbb E\,e_1(g_R)=p\,e_1(R)^2+(1-p)(1-\tau_3)\,e_3(R)^2,\qquad B(R):=\mathbb E\,e_3(g_R)=(1-p)\,\tau_3\,e_3(R)^2 .$$

**Lemma 3 (weighted circle lemma).** For $g\in T_3$ and $\gamma\ge8/9$,
$$\overline{|g|}^{\,2}\le\frac8{\pi^2}\Big(1+\frac1{9\gamma}\Big)\big(e_1(g)+\gamma\,e_3(g)\big).$$
Equality holds for $g=\sin\varphi+\sin3\varphi/(3\gamma)$. The threshold $8/9$ is sharp: for $\gamma<8/9$ the inequality
fails for $g=\sin3\varphi$.

*Proof.*

(i) *Sign patterns.* Let $g\not\equiv0$. Then $z^3g$ is a nonzero polynomial of degree $\le6$ in $z=e^{i\varphi}$, so
$g$ has at most 6 zeros in $[0,2\pi)$. They come in pairs $\varphi,\varphi+\pi$, so there are at most 3 in each
half-turn. Let $s=\operatorname{sign}g$. Then $s(\varphi+\pi)=-s(\varphi)$, so $s$ has an odd number of sign changes per
half-turn: 1 or 3.

(ii) *Cauchy–Schwarz.* Let $s_k$ be the frequency-$k$ part of $s$. Then
$$\overline{|g|}=\langle g,s\rangle=\langle g_1,s_1\rangle+\langle g_3,s_3\rangle\le\sqrt{e_1+\gamma e_3}\,\sqrt{\|s_1\|^2+\|s_3\|^2/\gamma}.$$

(iii) *Energies of patterns.* Suppose $s$ jumps at $\theta_1<\theta_2<\theta_3<\theta_1+\pi$ (and at the
$\theta_j+\pi$). Integrating by parts, for odd $k$,
$$\|s_k\|^2=\frac{8}{\pi^2k^2}\,|w_k|^2,\qquad w_k=e^{ik\theta_1}-e^{ik\theta_2}+e^{ik\theta_3}.$$
With one jump per half-turn, $\|s_k\|^2=8/(\pi^2k^2)$. This one-cut pattern gives exactly
$\frac8{\pi^2}(1+\frac1{9\gamma})$. So it remains to show, for every three-cut pattern,
$$9\gamma(1-|w_1|^2)+(1-|w_3|^2)\ge0 .$$

(iv) Let $a=\theta_2-\theta_1$, $b=\theta_3-\theta_2$ and $c=\pi-a-b$ be the three arcs, all positive. Rotate so that
$\theta_2=0$. Then
$$1-|w_1|^2=1-|e^{-ia}-1+e^{ib}|^2=8\sin\tfrac a2\sin\tfrac b2\sin\tfrac c2>0,$$
and in the same way $1-|w_3|^2=-8\sin\frac{3a}2\sin\frac{3b}2\sin\frac{3c}2$. Since $\sin3u/\sin u=1+2\cos2u$,
$$9\gamma(1-|w_1|^2)+(1-|w_3|^2)=8\sin\tfrac a2\sin\tfrac b2\sin\tfrac c2\,(9\gamma-P),\qquad P:=(1+2\cos a)(1+2\cos b)(1+2\cos c).$$

(v) *$\max P=8$ on $\{a,b,c\ge0,\ a+b+c=\pi\}$.* Put $X=\cos\frac{a+b}2\in[0,1]$ and $Y=\cos\frac{a-b}2\in[X,1]$. Then
$$(1+2\cos a)(1+2\cos b)=4(X^2+XY+Y^2)-3,\qquad 1+2\cos c=3-4X^2 .$$
This is REVIEW2's $Q_\gamma(x,y)=9\gamma-P$ with $(x,y)=(X,Y)$.

- If $X\ge\sqrt3/2$, then $P\le0$.
- Otherwise $P$ is increasing in $Y$, so $P\le h(X):=(3-4X^2)(2X+1)^2$.

Since $h'(X)=-4(2X+1)(4X+3)(2X-1)$, $\max h=h(\frac12)=8$. The maximum is attained only at $a=b=c=\pi/3$, the
pattern $\operatorname{sign}\sin3\varphi$. Hence $9\gamma-P\ge0$ for $\gamma\ge8/9$. $\square$

A second proof of $P\le8$: when $a+b+c=\pi$, the identity $\sum\cos^2a_j+2\prod\cos a_j=1$ gives
$P=5+2\sigma+2\sigma^2-6q$, where $\sigma=\sum\cos a_j$ and $q=\sum\cos^2a_j\ge\sigma^2/3$. So $P\le5+2\sigma\le8$,
because $\sigma\le3/2$.

*Sharpness.* For $g=\sin3\varphi$, $\overline{|g|}^2=4/\pi^2$, while the right side is $\frac4{\pi^2}(\gamma+\frac19)$.
For the equality case: $g=\sin\varphi+\sin3\varphi/(3\gamma)$ has the one-cut sign pattern when $\gamma\ge1/3$, and
$g_1\propto s_1$, $\gamma g_3\propto s_3$. Monte Carlo agrees (N; `sanity_checks.log` §3–4).

**Proposition 4 (per radius).** Let $F\in V_3(n)$ with $\|F\|_2=1$, and $R>0$. Then
$$\mathbb E_\Theta|F(R\Theta)|\le\Psi(A(R),B(R)),\qquad \Psi(A,B)=\begin{cases}\frac{2\sqrt2}\pi\big(\sqrt A+\frac13\sqrt B\big),& 9A\ge64B,\\ \frac3\pi\sqrt{A+\frac89B},&\text{otherwise.}\end{cases}$$

*Proof.* Fix $\gamma\ge8/9$, depending on $R$ only, and put $\kappa_\gamma=\frac8{\pi^2}(1+\frac1{9\gamma})$. By $(*)$,
Lemma 3 and Jensen,
$$\mathbb E_\Theta|F(R\Theta)|=\mathbb E\,\overline{|g_R|}\le\mathbb E\sqrt{\kappa_\gamma(e_1+\gamma e_3)}\le\sqrt{\kappa_\gamma(A+\gamma B)} .$$
Now $(1+\frac1{9\gamma})(A+\gamma B)=A+\frac B9+\gamma B+\frac A{9\gamma}$. Over $\gamma>0$ it is minimal at
$\gamma^*=\frac13\sqrt{A/B}$, with value $(\sqrt A+\sqrt B/3)^2$, and $\gamma^*\ge\frac89$ iff $9A\ge64B$. Otherwise the
constrained minimum is at $\gamma=\frac89$, with value $\frac98(A+\frac89B)$. $\square$

Two remarks:

- $\Psi\le\frac{4\sqrt5}{3\pi}\sqrt{A+B}$, the plain constant of the HJM note, with equality iff $A=9B$. So the
  `min(val, Ct*sqrt(A+B))` in `g134.py` is redundant.
- $\Psi$ is the minimum over $\gamma\ge8/9$ of $\sqrt{\kappa_\gamma(A+\gamma B)}$, hence concave in $(A,B)$.

The regimes have closed forms. $9A\ge64B$ holds iff $(R^2-n-2)^2\ge\kappa R^4$, with
$\kappa=\frac{2(1-p)(73\tau_3/9-1)}{p(n+4)}$. That is, iff $R^2\le\frac{n+2}{1+\sqrt\kappa}$, or
$R^2\ge\frac{n+2}{1-\sqrt\kappa}$ (the second case only if $\kappa<1$).

**Theorem 5.** Let $F\in V_3(n)$ and $p$ as above. Then $\mathbb E|F|\le J_n(p)\,\|F\|_2$, where
$$J_n(p)=\int_0^\infty\Psi(A(R),B(R))\,\chi_n(R)\,dR,\qquad \chi_n(R)=\frac{2^{1-n/2}}{\Gamma(n/2)}R^{n-1}e^{-R^2/2},$$
with $A$ and $B$ from (2.1). $J_n$ is concave on $[0,1]$: $\Psi$ is concave in $(A,B)$, and $A,B$ are affine in $p$.
Hence $\sup_{V_3(n)}\mathbb E|F|/\|F\|_2\le\max_{[0,1]}J_n$. (P)

**Remark 6 (monotonicity in $n$).** For $m\le n$, $V_3(m)\subset V_3(n)$ through functions of the first $m$
coordinates, with the same law. A harmonic cubic in $m$ variables is harmonic in $n$ variables. So a bound proved on
$V_3(n)$ or $H_3(n)$ holds for every $m\le n$. The checks of smaller $n$ below are redundant; they are done anyway.

## 3. Part A2: harmonic cubics (P + C, exact; `harmonic_exact.py`)

For $F\in H_3(n)$ we have $p=0$, $A=(1-\tau_3)e_3^2$ and $B=\tau_3e_3^2$. Always $9A<64B$, since
$A/B=(3n-6)/(n+2)<3$. So $\mathbb E|F|\le b_n\|F\|_2$, where
$$b_n=\frac3\pi\sqrt{1-\tau_3/9}\;\mathbb Ee_3(R)=a_n\,C_{\rm Stief}(n),\qquad a_n=\frac{2^{3/2}\Gamma(\frac{n+3}2)}{\Gamma(\frac n2)\sqrt{n(n+2)(n+4)}},\qquad C_{\rm Stief}(n)=\frac{\sqrt{(35n-38)/(n-1)}}{2\pi}.$$

The ratio $\Gamma(\frac{n+3}2)/\Gamma(\frac n2)$ equals $r_n\pi^{\pm1/2}$ with $r_n$ rational. Hence
$b_n^2=Q_n/\pi$ for even $n$ and $b_n^2=Q_n/\pi^3$ for odd $n$, where
$Q_n=2r_n^2(35n-38)/(n(n+2)(n+4)(n-1))\in\mathbb Q$. The script uses only the exact Machin bounds
$3.14159265358979323846\ldots\le\pi$, with exact rationals.

- **$n=12$, $(C_3)$:** $Q_{12}=67108041/33554432=(2^{26}-823)/2^{25}$. Then
  $$b_{12}^2<2/\pi\iff Q_{12}<2\iff 67108041<67108864 .$$
  $\pi$ cancels, and the relative margin is $1.23\cdot10^{-5}$: $b_{12}=0.7978796683$ against $0.7978845608$.
  Equivalent forms: $135135^2\cdot382/231=30198618450<2\cdot122880^2=30198988800$; and REVIEW2's
  $55{,}807{,}046{,}895{,}600<55{,}807{,}731{,}302{,}400$, which is $831600\cdot67108041<831600\cdot2^{26}$.
- **$n=11$, $(C_3)$:** $Q_{11}=90963968/4729725$, and $Q_{11}<2\pi^2$.
- **$n=15$, (T):** $Q_{15}=130728067072/6241750515$, and $\pi^3>25Q_{15}/17$.
- **$n=14$, (T):** $Q_{14}=279954675/134217728$, and $\pi>25Q_{14}/17$.
- **$n=13$, (T):** also proved.
- **Parity monotonicity (P):**
  - $a_{n+2}^2/a_n^2=(n+3)^2/(n(n+6))>1$, by $\Gamma(x+1)=x\Gamma(x)$;
  - $(35n-38)/(n-1)=35-3/(n-1)$ is increasing.

  So $b_{n+2}>b_n$. Checking $n=11,12$ covers every $n\le12$, and checking $n=14,15$ covers every $n\le15$. Remark 6
  gives the same from $n=12$ and $n=15$ alone. The script lists every $n$ from 2 to 16:

| $n$ | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 | 16 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| $b_n$ | .48860 | .57382 | .62955 | .66997 | .70087 | .72534 | .74524 | .76174 | .77567 | .78758 | **.797880** | .80689 | .81482 | **.821876** | .82818 |
| $(C_3)$ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | – | – | – | – |
| (T) | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | – |

## 4. Part A3: full third chaos (P + C, Arb; `radial_cert.py`)

**Computation (C).**

1. *Integrals.* For $p\in(0,1)$, split $[0,16]$ at rationals within $3\cdot2^{-40}$ of the closed-form regime
   boundaries. Integrate $f_1=\frac{2\sqrt2}\pi(\sqrt A+\frac13\sqrt B)\chi_n$ on regime-1 pieces and
   $f_2=\frac3\pi\sqrt{A+\frac89B}\,\chi_n$ on regime-2 pieces. The integrator is Arb's rigorous adaptive
   Gauss–Legendre (`acb.integral`, square roots with the `analytic` flag, so branch cuts are detected).
   - $f_1\le f_2$ everywhere, because $f_1$ is the unconstrained minimum over $\gamma>0$. So enlarging the regime-2 set
     gives an upper bound, and shrinking it gives a lower bound.
   - At $p=0$ there is a single piece, where $\sqrt{A+\frac89B}$ is a constant times $R^3$ exactly.
   - Balls of 64 bits; the radius of every integral is below $10^{-14}$ (asserted).
2. *Tail $R\ge16$.* There $\Psi\le\frac3\pi\sqrt{k_1}R^3$, with $k_1=\frac1{2n(n+2)}$. Moreover
   $\int_T^\infty R^{n+2}e^{-R^2/2}dR=2^{(n+1)/2}\Gamma(\frac{n+3}2,\frac{T^2}2)$, and
   $\Gamma(s,x)\le x^{s-1}e^{-x}\frac{x}{x-s+1}$ for $x>s-1$. The tail is below $2\cdot10^{-45}$ for $n\le12$.
3. *Grid and concavity.* Evaluate at $p_j=j/1000$, $j=0,\dots,999$. For $p\in[p_i,p_{i+1}]$, concavity gives
   - $J(p)\le J(p_i)+\frac{J(p_i)-J(p_{i-1})}{h}(p-p_i)$;
   - $J(p)\le J(p_{i+1})+\frac{J(p_{i+1})-J(p_{i+2})}{h}(p_{i+1}-p)$.

   With the enclosures $[L_j,U_j]$, both right sides are bounded by exact rational affine functions. The maximum over
   the interval of their minimum is computed exactly. The first interval uses only the right line, and the last two
   intervals (up to $p=1$, which is not evaluated) only the left one. $B_n$ is the maximum over the intervals.
4. *Cross-check (N).* mpmath at 30 digits, at three points $(n,p)$, falls inside the Arb enclosures.

**Results.** In every row, $B_n\ge\max_{[0,1]}J_n$ is certified.

| $n$ | 2 | 3 | 4 | 5 | 6 | 7 | **8** | 9 | 10 | **11** | 12 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| $B_n$ | .657695667 | .701829659 | .731387647 | .753470065 | .770912210 | .785166566 | **.797092724** | .807247592 | .816014695 | **.823669828** | ($\max_pJ_{12}\ge$ .830417653) |
| argmax $p$ | .811 | .707 | .629 | .567 | .517 | .476 | .442 | .413 | .388 | .366 | .347 |

So $(C_3)$ holds on all of $V_3(n)$ for $n\le8$. The margin is
$\sqrt{2/\pi}-B_8=7.92\cdot10^{-4}$, with $B_8=0.797092724$.

(T) holds for $n\le11$. The margin is $\sqrt{17/25}-B_{11}=9.51\cdot10^{-4}$, with $B_{11}=0.823669828$.

At $n=12$, $\max_pJ_{12}\ge0.830417653>\sqrt{17/25}$, so the method stops there.

## 5. Part B: restricted rotation LP (P + C; `lp_cert.py`)

**Lemma 7 (restriction; P).** Let $F\in V_3(n)$ and $U,V\in\mathbb R^n$. Put $x_r=\cos\frac{\pi r}NU+\sin\frac{\pi r}NV$, and
assume $F(x_r)\ne0$ for $r=0,\dots,N-1$. Then $\sigma_r=\operatorname{sign}F(x_r)$, $r=0,\dots,N$, satisfies
$\sigma_N=-\sigma_0$ and has exactly 1 or 3 sign changes.

*Proof.* $F$ has terms of degree 3 and 1 only, so it is odd. Hence $g(\varphi)=F(U\cos\varphi+V\sin\varphi)\in T_3$ is
antiperiodic, and $g\not\equiv0$ because $g(0)\ne0$. Also $\sigma_N=\operatorname{sign}F(-x_0)=-\sigma_0$.

A change between $r$ and $r+1$ forces a zero of $g$ in the arc $(\frac{\pi r}N,\frac{\pi(r+1)}N)$. These arcs are
disjoint in $(0,\pi)$, and $g$ has at most 3 zeros in $[0,\pi)$ by Lemma 3(i). The count is odd because
$\sigma_N=-\sigma_0$. $\square$

For $U,V$ i.i.d. $\gamma_n$, almost surely $F(x_r)\ne0$ for all $r$: each $x_r\sim\gamma_n$, and $\{F=0\}$ is null.
So, up to a global sign (which does not change $A_\sigma$), $(\sigma_0,\dots,\sigma_{N-1})$ is almost surely one of the
$N+\binom N3$ restricted patterns. The script enumerates them and asserts the count and the change counts. Monte
Carlo agrees (N; `sanity_checks.log` §6).

**Proposition 8 (rotation inequality; P).** Let $f=\operatorname{sign}F$ and $W_m=\|\Pi_mf\|_2^2$. Only odd $m$ occur,
and $\sum W_m=1$. Take weights $w_k$ ($1\le k<N/2$) such that
$$\delta_m:=\sum_kw_k\cos^m(k\pi/N)\ge0\ \text{ for all odd } m\ne3,\qquad \delta_3>0 .$$
Let $t:=\max_\sigma\sum_kw_kA_\sigma(k)$ over restricted patterns, where $A_\sigma(k)=\frac1N\sum_{r<N}\sigma_r\sigma_{r+k}$
and $\sigma_{r+N}=-\sigma_r$. Then
$$W_3(f)\le t/\delta_3\quad\text{and}\quad(\mathbb E|F|)^2\le(t/\delta_3)\,\|F\|_2^2 .$$

*Proof.* $(x_r,x_{r+k})$ are standard Gaussian vectors with coordinatewise correlation $c_k=\cos\frac{k\pi}N$. By
Mehler, $\mathbb E\sigma_r\sigma_{r+k}=\sum_mc_k^mW_m$. This also holds for $r+k\ge N$, because $f$ is odd. Averaging
over $r$,
$$\mathbb E\sum_kw_kA_\sigma(k)=\sum_m\delta_mW_m\ge\delta_3W_3 .$$
The left side is at most $t$ by Lemma 7. Finally $\mathbb E|F|=\langle f,F\rangle\le\sqrt{W_3}\,\|F\|_2$. $\square$

In the LP form of the brief: $(w_k/\delta_3,\ \mu=0)$ satisfies
$\mu_m:=\sum_k(w_k/\delta_3)c_k^m+\mu\ge[m=3]$ for every odd $m\ge1$.

**Lemma 9 ($\delta_m\ge0$ for all $m$; P).** Suppose $w=a\,e_j-(a-1)\,e_{j+1}-e_l$ with $a\ge1$ and
$j<j+1\le l<N/2$, so that $1>c_j>c_{j+1}\ge c_l>0$. Then for every $m\ge1$,
$$\delta_m=a c_j^m-(a-1)c_{j+1}^m-c_l^m\ge a(c_j^m-c_{j+1}^m)>0.\qquad\square$$
The script checks the general form of this condition and also sweeps all odd $m\le20001$ in Arb. So no finite check
plus tail argument is needed.

**Certificate, $N=61$ (C).**

- The HiGHS LP optimum (odd $m\le6001$) is $1.2014917\cdot(5,-4,-1)$ at lags $(11,12,27)$. The certificate uses the
  integer weights $w_{11}=5$, $w_{12}=-4$, $w_{27}=-1$.
- *Exact maximum* over all 36,051 restricted patterns, in integer arithmetic: $61\,t=40$, so $t=40/61$. It is
  attained by the 61 one-cut patterns and by 8,845 three-cut patterns. For a one-cut pattern $A(k)=1-2k/N$, so
  $t=-\frac2N\sum_kkw_k=\frac{40}{61}$.
- $\delta_3=5c_{11}^3-4c_{12}^3-c_{27}^3=0.832298658974338833073\ldots$ (Arb, 256 bits).

$$c_{61}=\frac{40/61}{5\cos^3\frac{11\pi}{61}-4\cos^3\frac{12\pi}{61}-\cos^3\frac{27\pi}{61}}=0.787863464451707452\ldots$$

So for every $n$ and every $F\in V_3(n)$:
$$(\mathbb E|F|)^2\le0.7878635\,\|F\|_2^2,\qquad \mathbb E|F|\le0.8876168\,\|F\|_2 .$$

**Other $N$ (C), same structure.**

| $N$ | weights at lags | $t$ | $c_N$ | $\sqrt{c_N}$ |
|---|---|---|---|---|
| 21 | $(2,-1,-1)$ at $(4,5,9)$ | 4/7 | 0.790179501 | 0.888920 |
| 31 | $(2,-1,-1)$ at $(6,7,13)$ | 16/31 | 0.790101890 | 0.888877 |
| 45 | $(4,-3,-1)$ at $(8,9,20)$ | 2/3 | 0.788157896 | 0.887783 |
| 61 | $(5,-4,-1)$ at $(11,12,27)$ | 40/61 | 0.787863464 | 0.887617 |
| 121 | $(9,-8,-1)$ at $(23,24,53)$ | 76/121 | 0.787081457 | 0.887176 |

All of REVIEW2's LP values (21, 31, 45, 61) are confirmed. The floating LP keeps decreasing slowly, and not
monotonically (N; `lp_scan.log`): 0.787255 at $N=75$, 0.787312 at 81, 0.787246 at 91, 0.787114 at 101, 0.787081 at 121.
At every $N$ scanned, the optimal weights are a multiple of the three-term form $(a,-(a-1),-1)$ at lags $(j,j+1,l)$ of
Lemma 9 (at $N=101$ there is also a weight below $10^{-5}$). The LP stays far from
(T), whose value in these units is 0.68.

The restriction is essential. At $N=21$, the same weights maximised over all $2^{20}$ sign patterns give
$4/\delta_3=5.53$.

## 6. Check of REVIEW2

**Correct.** Every statement of G4 is correct as stated:

- $\tau_3$;
- the weighted lemma and its $Q_\gamma$ condition;
- the max of $(3-4x^2)(2x+1)^2$;
- the cross terms;
- the per-radius formula;
- all printed numbers: 0.797879668, 0.821876, 0.828182, 0.797093, 0.823670, 0.830418;
- the Extension's 0.790180, 0.790102, 0.788158 and 0.787863.

**Remarks (no errors).**

- Lemma 1 has a two-line proof through the spherical Laplacian, and Lemma 2 is plain orthogonality on the sphere.
  Schur is not needed.
- In the $Q_\gamma(x,y)$ condition, the variables are $x=\cos\frac{a+b}2$ and $y=\cos\frac{a-b}2$, over two of the
  three arcs, on the domain $0\le x\le y\le1$. The case $x>\sqrt3/2$ needs one line ($P\le0$). The lemma is sharp
  for every $\gamma\ge8/9$, and false for every $\gamma<8/9$.
- The `min(..., Ct*sqrt(A+B))` in `g134.py` never binds.
- The $n=12$ integer check reduces to $67108041<2^{26}$.
- Smaller $n$ follow from Remark 6.
- "Levelling off near 0.787": the LP is still slowly decreasing at $N=121$ (0.787081).

## 7. Files, reproduction, environment

All files are in `/Users/alingalatan/workspaces/grothe/handoff/research-third-chaos/slice-cert-2026-11-17/`:

- `harmonic_exact.py`, `harmonic_exact.log` (Part A2);
- `radial_cert.py`, `radial_cert.log` (Part A3; run with argument 1000);
- `lp_cert.py`, `lp_cert.log` (Part B);
- `lp_scan.py`, `lp_scan.log` (N-level LP values for 11 values of $N$);
- `sanity_checks.py`, `sanity_checks.log` (N checks of Parts A1 and B);
- `SHA256SUMS`.

Run each script with `python3 -I <script>` from this folder. Environment: Python 3.14.8, python-flint 0.9.0 (Arb),
numpy 2.5.5, scipy 1.18.1 (HiGHS, used only to find the weights), mpmath 1.4.1 (cross-check only).
`harmonic_exact.py` needs only the standard library; python-flint is used only for its float column.

Run times on the laptop: `harmonic_exact.py` under 1 s, `radial_cert.py` about 35 s, `lp_cert.py` about 10 s,
`lp_scan.py` about 30 s, `sanity_checks.py` a few minutes.

`harmonic_exact.py`, `radial_cert.py` and `lp_cert.py` were re-run in a second environment (mpmath 1.3.0, otherwise
the same). Their logs were identical apart from timings.
