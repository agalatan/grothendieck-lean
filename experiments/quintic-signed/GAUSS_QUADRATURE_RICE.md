# Matching the first three radial moments of the cubic shift

For a unit remote circular cubic, the preceding [sixth-order Rice support](SIXTH_RICE_SUPPORT.md) can be sharpened at selected shifts. At $t\ge .83835$, the supremum of the physical remote cubic norm is strictly between **.2873455 and .28734818**. The lower endpoint is realized strictly by the finite-dimensional Gaussian cubic-sum construction. The upper endpoint uses a cubic polynomial majorant of the scalar Rice function on the whole positive ray.

Let $W=|q|^2$, $s=\mathbb E W^2-2$ and $M_3=6+9s+C_6s^{3/2}$ as in the sixth-order bound. For a chosen $u=\lambda^2$ put $f(v)=\mathbb E|Z+\sqrt{uv}|/\mu$, $v\ge0$. The integral representation of the [shifted phase](FULL_FIFTH_PLANES.md) implies
$$
 f'(v)=\frac{u}{2}\mathbb E e^{-uvB},\qquad B\sim\mathrm{Beta}(1/2,3/2).
$$
Indeed the radial derivative of the expected norm is the radial component of the expected phase. In particular $f'''\ge0$ and $f^{(4)}\le0$.

Choose any two nonnegative rational nodes $a<b$. The Hermite interpolant $P$ of degree at most three matches $f,f'$ at both. Its remainder at $v$ is $f^{(4)}(\xi)(v-a)^2(v-b)^2/24$, so $f(v)\le P(v)$ for every $v\ge0$, including outside the interpolation interval. The repeated-node divided difference $d_3=f[a,a,b,b]\ge0$ is its cubic coefficient. Both facts also follow directly from repeated Rolle's theorem. Thus one may use the available *upper* third moment rather than needing equality. Writing
$$
 P(v)= f(a)+f'(a)(v-a)+d_2(v-a)^2+d_3(v-a)^2(v-b),
$$
a full mean upper price is
$$
 f(a)+f'(a)(1-a)+d_2(2+s-2a+a^2)
 +d_3\big[M_3-(2a+b)(2+s)+a^2+2ab-a^2b\big].
$$
For fixed nodes this is convex in $s$: it has the form constant plus a linear term and $C_6d_3 s^{3/2}$. It is enough to verify both ends of each fourth-excess interval.

To propose nodes, match the first three raw moments of a two-point distribution using $m_2=2+s$, $m_3=M_3$ at the middle of the interval. The two roots of $x^2-Sx+T$ have $S=(m_3-m_2)/(m_2-1)$ and $T=(m_3-m_2^2)/(m_2-1)$. Round the nodes to thousandths. The proof checks the final polynomial at the endpoints, so the quality of the proposal only affects the number of intervals. Finite alternating exponential upper and lower polynomials in the beta integral enclose all four values $f,f'$ at the nodes. The integer and rational calculations round outward. Bisection covers all $s\in[0,42]$.

| $\lambda$ | Upper bound on $\mathbb E|Z+\lambda q|$ | Fourth-excess intervals |
|---:|---:|---:|
| .24 | .911393002 | 11 |
| .3425 | .936766750 | 12 |
| .345 | .937487036 | 12 |
| .44 | .968226456 | 14 |

For example $.3425\tau\le .936766750-t$ proves the stated upper endpoint. This tests the actual cubic law through its moments, regardless of its other chaos components. The four checks are analytic certificates with rational replays. Their use at new physical cutoffs in the root Lean proof remains separate work.

Run `python3 -IB -O experiments/quintic-signed/code/gaussian_quadrature_rice.py` from the repository root.

Agent-ID: codex-a7c4
