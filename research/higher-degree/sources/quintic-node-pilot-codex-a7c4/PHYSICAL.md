# All sectors on piece 11 of the capped degree-five game

Agent-ID: codex-a7c4. Task #829. **P + C, author only.**

Let $T=P_{1,0}-(39/50)P_{2,1}+(779/10000)P_{3,2}$. For a unimodular pair in any finite Gaussian dimension use the [design's definitions](../degree5-design-2026-11-25/DESIGN.md) of $h,k,t,G_3,G_5,q$. Write $u=\|q\|_2^2$ for the energy of the remote component of $G_3=(39/50)P_{2,1}k$. The exact endpoints of piece 11, approximately $[.82482728,.83485550]$, come from the committed design. Throughout this piece the following upper bounds hold for **every** choice of the cubic and quintic sectors and their shared coordinates.

| Bound on the physical payoff $V=\operatorname{Re}\langle f,Tg\rangle$ | Maximum $u$ |
|---|---:|
| $V<1/1.4023$ | .0034 |
| $V<1/1.4025$ | .0033 |
| $V<1/1.4027$ | .0032 |

The scalar law program and H5–H8 are unnecessary on these cells. For scale, the previous 1.4023 replay gave $u\le.000500$ on the broader interval $[.81,.86]$. The result here also gives an estimate of H8 itself at smaller energies. This answers a separate budget question in the assembly.

## A real-direction estimate on the complex fields

Use the row's exact $(\ell,\beta,b_A,b_B)=(.816538,.139578,-.049674,-.026924)$ and put $e=.78,\eta=.0779,\mu=\sqrt\pi/2,\gamma=\sqrt3/8,v_*=\eta\mu\gamma$. For $v=v_*$ or the design's $v_0=.010338438615358537$, the polynomial multiplying $z$ in $L+ve_{32}$ has positive coefficients. Write
$$
 F(v)=2\mu(\ell-\beta/2+\gamma v)-v^2/\eta .
$$
Use $L+v_*e_{32}=z g_*(s)$, $s=|z|^2$, $w=1/(|z|g_*(s))$, $J_i=\mathbb E[ws^i]$. The [simultaneous tangent inequality](../quintic-tangent-codex-a7c4/COUPLED.md) charges $A=15/4$ for the quintic square and $a=A/(2A-1)$ for the real part of the cubic square after rotation by the visible phase. Set $b=1-a=11/26$. The additional quintic cost is absorbed because $A\sqrt\pi/(\ell-2\beta)<1/\eta$, using the normalized Wick moment table in the [isotropic proof](../quintic-tangent-codex-a7c4/PROOF.md). The linear term cancels exactly at $v_*$. For the remaining cubic choose the same first-chaos correction as in the isotropic Schur bound. We may use this trial in the infimum even after changing the quadratic form.

The isotropic calculation gives a baseline coefficient $R_{ab}$ for each squared norm of $r_{ab}$ in $G_3=\sum e_{ab}(z)r_{ab}$, after the cubic norm price and tilt. Its $R_{11}>0$ obstructs dropping that sector. The available improvement is $b\mathbb E[w(\operatorname{Re}(\overline{\operatorname{ph}z}(G_3-C-\xi)))^2]$. The real projections of different **total remote degrees** are orthogonal conditional on $z$. Only degrees one and three are needed.

* Degree one contains both $r_{11}$ and $r_{20}$, with opposite remote charges. Its squared real projection, averaged over the angle of $z$, is one half of
$$
  \left\|(s-1-d)r_{11}+(s/\sqrt2)\overline{r_{20}}\right\|_2^2,
  \qquad d=(J_1-J_0)/(1+J_0).
$$
  Conjugating the second summand inside the real part makes the two visible phases identical. For vectors $x,y$, $\|x+y\|^2\ge\|x\|^2/2-\|y\|^2$. Thus the new upper coefficients are $R_{11}-(b/4)\mathbb E[w(s-1-d)^2]$ and $R_{20}+bJ_2/4$. The expectation exceeds 1.12. Both coefficients are negative. This accounts for arbitrary alignment between the two remote linear forms.
* Degree three contains $q=r_{00}$ and its prescribed tilt. In the rotated coordinates the multiplier on $\operatorname{Re}(e^{-i\theta}q)$ is $1+b_A+(-b_A-b_B/\sqrt2)s$. Averaging its square over the uniform visible angle gives half the squared multiplier times $u$. Consequently the remote coefficient is at most
$$
  R_{00}-\tfrac b2\mathbb E\big[w(1+b_A+(-b_A-b_B/\sqrt2)s)^2\big]<9/10 .
$$
  The isotropic remote coefficient alone exceeds 1.48. The isotropic upper coefficients of $r_{21},r_{10},r_{01}$ are already negative.

This proves the uniform bound $\widehat\Lambda_5^+(G_3,G_5)\le F(v_*)+(9/10)u$. The row inequality H3 adds $t^2-2\ell t+2\beta^2/e$. Its maximum over the piece is at an endpoint by convexity. Exact substitution gives the three caps above. Increasing $u$ to .0035 fails the displayed affine test at target 1.4023. The failure concerns this estimate.

## Paying H8 at positive energy

Let $\Lambda=\Lambda_5(q)$, $X=S_5-\Lambda$ and $k_q=1/e-(b_A^2+b_B^2)/\eta$. The [Gaussian benchmark calculation](BENCHMARK.md) proves $S_5-F(v_0)>.00302$ by one feasible trial. Taking zero A/B drivers in their supremum gives
$$
 \Lambda+G_{AB}(q)\ge F(v_0)-k_q u .
$$
Indeed the two norms at that trial sum to at least $2|L+v_0e_{32}|$ for every first-chaos correction, and its squared cost is nonnegative. The [quadratic bound at the origin](ROADMAP.md), now on row .830 at $v_0$, gives $\Lambda\le F(v_0)+(B-k_q)u$ with $B<3.041$. The scalar identity $F(v_*)-F(v_0)=(v_*-v_0)^2/\eta$ therefore yields
$$
 \widehat\Lambda_5^+-\Lambda-G_{AB}-\kappa X
 \le (v_*-v_0)^2/\eta+(9/10+k_q)u
       -\kappa\big[.00302-(B-k_q)u\big].
$$
The bracket is strictly positive on the ranges below. No content, sign, or cubic-shape assumption enters this estimate.

| Share $\kappa$ | Energy $0<u\le$ | Sufficient H8 funding | Target at which this leaves positive A/B room |
|---|---:|---:|---:|
| $[.0149,1]$ | .000010 | .000250 | 1.4023 |
| $[.0293,1]$ | .000005 | .000200 | 1.4025 |

The minimum published piece-11 share at the tabulated shape knots is .0149. At $\chi=10$ the share is .0293. The second line covers the design's explicit near-zero-energy obstruction and arbitrary other sectors satisfying the same share and energy conditions. Paying .000200 leaves more than .000019 on this piece at 1.4025. The original full funding $.0002630…$ exceeds the piece's room at that target. These local savings leave the high-energy case open.

## Replay

From the repository root run `python3 -IB research/higher-degree/code/quintic-node-pilot-codex-a7c4/physical_piece11.py`. The Schur moments, signs, endpoints and budgets use exact rational enclosures. Only the H8 slack calculation calls the shared outward C++17/MPFR integrator. Its derivation and arithmetic assumptions are in the [quadrature proof](SPIKE.md).
