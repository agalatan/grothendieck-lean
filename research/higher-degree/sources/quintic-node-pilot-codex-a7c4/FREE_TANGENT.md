# Physical amplitude and remote energy on the capped degree-five game

For $S=P_{1,0}-(39/50)P_{2,1}+(779/10000)P_{3,2}$, let $V=\Re\langle f,Sg\rangle$, $t=\|P_{1,0}(f+g)/2\|_2$ and $u=\|\mathbb E[G_3\mid y]\|_2^2$, with $G_3=(39/50)P_{2,1}((f-g)/2)$ and the visible direction aligned with $P_{1,0}((f+g)/2)$. For every dimension and every unimodular pair, $V$ is strictly below the column target throughout each indicated closed interval. Write $m=\sqrt\pi/2$.

| Remote energy | $V<10000/14023$ | $V<10000/14025$ |
|---|---|---|
| $u\le .001$ | $[.686,m]$ | $[.6863,m]$ |
| $u\le .004$ | $[.707,.861]$ | $[.707,.8605]$ |
| $u\le .006$ | $[.726,.840]$ | $[.728,.8395]$ |
| $u\le .008$ | $[.756,.796]$ | $[.758,.794]$ |
| any $u$ | $[.884257,m]$ | $[.884397,m]$ |

These are actual-pair bounds with arbitrary cubic and quintic sectors. A full lower-bound theorem requires the complementary amplitudes and energies as well.

## Free tangent rows

Use the simultaneous tangent (1) of `research/higher-degree/sources/quintic-tangent-codex-a7c4/COUPLED.md` and the Wick and Schur formulas of its companion `PROOF.md`. Put $e=39/50$, $\eta=779/10000$, $T=|z|^2$, $c=\eta m/16$, $g(T)=\ell-2\beta+6c+(\beta-6c)T+cT^2$, $w=1/(\sqrt{T}g(T))$ and $J_j=\mathbb E[wT^j]$. At $X=zg(T)$, choose any $A\ge1$, $a=A/(2A-1)$ and $h=(1-a)/2$. The quintic linear term cancels at the phase projection $G_*$. Since $\beta\ge 6c$, the radial floor is $g_0=\ell-2\beta+6c$. The visible-constant quintic diagonal is $J_0$. Every other entry of the Wick moment table for $|e_{ij}|^2/\sqrt{T}$ is at most $3\sqrt\pi/4$. Thus $A\max(J_0,3\sqrt\pi/(4g_0))<1/\eta$ absorbs the entire quintic square, including for arbitrary dependencies within the quintic field. Take the same minimizing linear correction $\xi$ as for the isotropic cubic square, then retain the additional negative real-direction square from (1).

Write $G_3=\sum e_{ij}r_{ij}$ in visible Wick modes and $q=r_{00}$. Different total remote degrees are orthogonal under the radial weight also after taking real parts, since conjugation preserves total degree. In remote degree one the real square after angle averaging is exactly half the squared norm of $(T-s)r_{11}+T\overline{r_{20}}/\sqrt2$, where $s=(1+J_1)/(1+J_0)$. Indeed, rotation by $\overline{\mathrm{ph}(z)}$ gives frequencies $-1,+1$ for these two terms. Conjugate the second inside the real part. Relative to the complex-linear identification $r_{11},\overline{r_{20}}$, the diagonal residuals and off-diagonal entry are

$$x=R_{11}-h(J_2-2sJ_1+s^2J_0),\quad y=(1-h)J_2/2-1/e,\quad z=-h(J_2-sJ_1)/\sqrt2,$$

where $R_{11}=J_2-2J_1+J_0-(J_1-J_0)^2/(1+J_0)-1/e$. The replay verifies $x,y<0$ and $xy>|z|^2$, so these modes are absorbed for arbitrary sharing. The remote-degree-two modes are absorbed by $J_1<1/e$, and the visible cubic by the isotropic Schur coefficient in `PROOF.md`.

The tilted remote field has rotated real component $[1+b_A+(-b_A-b_B/\sqrt2)T]\Re(e^{-i\theta}q)$. All rows have $-1<b_A\le0$ and $b_B\le0$. Thus its isotropic weighted price decreases by at least $h\mathbb E[w(1+b_A+(-b_A-7b_B/10)T)^2]$. Including $-u/e+(b_A^2+b_B^2)u/\eta$ gives an upper coefficient $C$ on $u$. The constant $B=2m(\ell-\beta/2)+3\eta m^2/64+2\beta^2/e$ then gives $V\le t^2-2\ell t+B+Cu$.

| $(\ell,\beta,A,b_A,b_B)$ | $B$ upper | $C$ upper |
|---|---:|---:|
| $(.762,.110,3.7,-.090,-.015)$ | 1.287019 | .902707 |
| $(.776,.126,3.7,-.093,-.015)$ | 1.307336 | .940656 |
| $(.798,.150,3.5,-.098,-.014)$ | 1.342045 | 1.005445 |
| $(.815,.165,3.3,-.100,-.014)$ | 1.370999 | 1.039968 |
| $(1.096,.172,6.1,-.0663,-.0112)$ | 1.868903 | .278747 |

The exact replay `free_tangent.py` uses the existing directed radial integrals in `research/higher-degree/code/quintic-tangent-codex-a7c4/verify_schur.py`. It proves each row sign, checks both ends of each covered interval by convexity and checks that adjacent pieces meet. For the final row apply the physical energy bound $u\le e^2(m^2-t^2)$ for $t^2\ge3\pi/14$, proved in `research/conjecture-K/STATUS.md` row 3.5a. This only uses the cubic projection of the actual pair and its visible mass, so it holds for the present game. Setting $k=.278747e^2<1$ yields the convex parabola $(1-k)t^2-2(1.096)t+1.868903+km^2$. At the two unrestricted left endpoints its certified clearances exceed $5.67\times10^{-7}$ and $1.36\times10^{-7}$, respectively. The same first-target certificate rejects $t=.88425$. Increasing the energy to $.01$ at $t=.776$ is rejected by the second row's certified majorant. Run `python3 -IB research/higher-degree/code/quintic-node-pilot-codex-a7c4/free_tangent.py` from the repository root.

Agent-ID: codex-a7c4.
