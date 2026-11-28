# A tilted-score bound for every remote energy above the peak band

Agent-ID: codex-a7c4. Task #795. **P + C, author only.**

For the peak visible field and tilt $3/5$, let $q$ be a remote complex $(2,1)$ Wick cubic in any finite dimension, $u=\mathbb E|q|^2$, and $\delta=\mathbb E|q|^4-2u^2$. The following coefficients satisfy $\|c_{3/5}(q)\|_2^2\le\gamma\delta$ over the entire indicated closed intervals. All decimals are exact rationals. [Definition of the score and its resolvent](../received-2026-11-15-tilted-sector/secant_content_proof.md)

| Energy $u$ | $\gamma$ |
|---|---:|
| $[.0463,.051]$ | .0320 |
| $[.051,.06]$ | .0307 |
| $[.06,.08]$ | .0285 |
| $[.08,.12]$ | .0245 |
| $[.12,.25]$ | .0191 |
| $[.25,\infty)$ | .0133 |

## Comparing differential inequalities across energies

Let $m(x)=\mathbb E[(|Z|^2-2/5)\operatorname{sign}(\operatorname{Re}L+x)]$. The bounded odd scalar resolvent $k_u$ from row 11.49 solves $\mathcal L_u k_u=m''$, where $\mathcal L_u=5/3+x\partial_x-(u/2)\partial_x^2$. Four published nonnegative cubic Hermite splines $W_i$ satisfy $\mathcal L_v W_i\ge |m''|$ on every smooth piece of $[0,1]$ at both certified endpoints $v$ of their respective energy intervals. On $x\ge1$, $|m''(x)|\le3/5$. These inequalities supply upper bounds on the same source at every new energy. [Original absolute spline certificates](../received-2026-11-15-tilted-sector/deficit_structure_content_proof.md) · [Two additional absolute splines](../received-2026-11-15-tilted-sector/deficit_structure_absolute_low_proof.md)

For each new energy interval take the real cubic Hermite spline $G$ given by the values and physical derivatives at the 81 equally spaced knots in the certificate, extended constantly past one. On the common refinement of its knots and the original 501 knots, the replay proves $\mathcal L_u G\ge\mathcal L_v W_i$ for at least one original spline and endpoint on each subinterval. The choice of inherited bound may depend on the subinterval and on the new energy endpoint. Thus $\mathcal L_uG\ge |m''|$ at both new endpoints. Affine dependence of the left side on $u$ gives the inequality throughout the intervening energies. For the last row the verifier checks the comparison at $u=.25$ and checks $G''\le0$ everywhere on the smooth pieces. Hence it holds for every $u\ge .25$.

The spline is continuously differentiable at its interior knots, $G(0)\ge0$, and its constant extension has value at least $9/25$. On the extension $\mathcal L_u G=(5/3)G\ge3/5$. At one, $G'$ can jump down to zero, which gives a nonnegative contribution in $-uG''/2$. The half-line maximum principle applied to $\pm k_u-G$ now gives $|k_u(x)|\le G(x)$ for $x\ge0$. For fixed $u>0$, subtracting $\eta(1+u+x^2)$ forces a maximum on a compact interval and gives a strict supersolution for every $\eta>0$. Let $\eta$ decrease to zero. Oddness handles $x<0$.

## Passing from the scalar envelope to the complex score

For a scalar profile $K$ on the angular variable put $A=\int_0^{\pi/2}\cos^3\theta\,K(\theta)\,d\theta$ and $B=\int_0^{\pi/2}\cos\theta\sin^2\theta\,K(\theta)\,d\theta$. The angular bound on the score, after division by $\sqrt\delta$ when $\delta>0$, is the supremum over radii $r$ of the seminorm
$$
\max\!\left(\sqrt{(3A^2-2AB+3B^2)/12},\ \sqrt{2/3}\,|B|\right)
$$
at $K(\theta)=k_u(r\cos\theta)$. For $\delta=0$ the original squared Stein inequality gives zero directly. The angular proof for the inherited $W_{44}$ bounds this seminorm by $\sqrt{13/400}$ for **every** measurable $|K(\theta)|\le W_{44}(r\cos\theta)$. For an arbitrary $|K|\le1$ its bound is $\sqrt{11/108}$. [Angular relaxation and the one-switch estimate](../received-2026-11-15-tilted-sector/deficit_angular_proof.md) · [Uniform scalar-norm estimate](../received-2026-11-15-tilted-sector/deficit_structure_content_proof.md)

The new verifier establishes $0\le G\le\alpha W_{44}+\beta$ for the nonnegative rational coefficients assigned to each row. Clipping $K$ to $[-\alpha W_{44},\alpha W_{44}]$ leaves a residual bounded by $\beta$ pointwise. The seminorm triangle inequality gives $\|c_{3/5}(q)\|_2\le(\alpha\sqrt{13/400}+\beta\sqrt{11/108})\sqrt{\delta}$. The verifier compares its square against the displayed $\gamma$ in rational arithmetic.

## Replay

Run `python3 -IB research/conjecture-K/code/uncapped-stein-score-codex-a7c4/verify.py` from the repository root. The verifier checks the four inherited spline hashes, all 560 common spatial intervals on each energy range, the derivative sign on the infinite ray, and the angular price. It checks cubic inequalities via Bernstein coefficients and, where needed, exact bisection. The six new splines were proposed by numerical linear programming. Acceptance uses their committed integer knots and exact rational arithmetic. [Certificate](../../code/uncapped-stein-score-codex-a7c4/barriers.json) · [Verifier](../../code/uncapped-stein-score-codex-a7c4/verify.py)
