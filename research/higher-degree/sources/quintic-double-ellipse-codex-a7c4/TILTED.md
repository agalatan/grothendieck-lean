# Vary the carrier amplitude at a fourth-excess boundary

Agent-ID: codex-a7c4. Use the same auxiliary Gaussian ellipse and radial Gram profiles as the shape-conditioned KRS proof. At the buffered threshold $10000/14023-10^{-5}$, two test amplitudes extend the complete all-dimensional, all-sector interval from $t=.460$ through $.460505023$. The underlying Gaussian axis remains $179/200$.

The elliptic support argument works for every $\ell\ge0$. With $A$ the projected cubic energy it gives
$$ A+c\ell t\le\mathbb E|U+\ell ZM|\le r\sqrt{A+\ell^2}. $$
Here $r$ is the verified upper complex radius for the fourth-excess interval of this particular lift. Choosing $\ell=ct$ is optimal for a fixed *constant* radius. When $r$ is bounded by shape slabs, the choice of $\ell$ also changes which slabs apply.

Write $x=c^2t^2$, $\ell=\alpha ct$ and $u=r^2$. The old fourth-moment calculation and Gram bound on the mixed term apply with $w=\alpha^2 x/(A+\alpha^2 x)$. Once the resulting shape interval gives a common $u$, the quadratic support inequality implies
$$
 A\le f_\alpha(u,x)=\frac{u-2\alpha x+\sqrt{u[u+4\alpha(\alpha-1)x]}}{2}.
$$
A negative discriminant excludes the box. For $0<\alpha\le1$ this expression is decreasing in $x$ on its real domain, since both its linear and radical terms are nonincreasing. For $1\le\alpha\le2$, differentiating gives $\partial_x f_\alpha\le-\alpha+\alpha(\alpha-1)=\alpha(\alpha-2)\le0$. Thus evaluating the root with the lower endpoint of $x$ is conservative. At $\alpha=1$ the expression reduces to $u-x$. At fixed $u$ its loss near $\alpha=1$ is quadratic, while the lifted shape fraction can move to first order. Each choice is proved on the entire physical box before taking the smaller cap.

The replay uses only $\alpha=1,19/20$. For the slight improvement of $c$ to $0.862040$, it reruns the original elliptic polygon proof at the same axis with 256 polygon edges per quadrant, 400 shift cells per unit on $[0,3]$, and mesh $1/256$ for the Gaussian sign test. Every one of the 2400 endpoint inequalities is rational, and the predecessor's Taylor bound controls the entire tail $\lambda\ge3$. The resulting affine polygon certificate fails the next value $0.862041$.

Run `python3 -IB tilt_cover.py --repo /path/to/grothendieck-lean`. It rebuilds every upstream KRS and Gram input. The first three adjacent closed intervals $[.460,.46047],[.46047,.46049],[.46049,.46050]$ take 393, 54 and 72 leaves. Their smallest extra payoff clearances exceed $153630,55277,4419$ times $10^{-12}$, respectively. At $t=.4605$ the otherwise identical one-amplitude rule fails at $y=.690$ by more than $0.00001236$. The original coefficient $c=.862$ with both amplitudes reaches $.46047$. This result concerns the restricted amplitude interval of the game.

The exact continuation through $.460505$, $.46050502$ and $.460505023$ takes another 347, 129 and 183 closed cells. At the next $10^{-9}$ step, $t=.460505024$ and $y=\sqrt\chi=.7011355$, the upper enclosure exceeds the trigger by more than $289/10^{12}$. This gives a reproducible obstruction for these two amplitudes and these fixed profiles. It imposes no restriction on the amplitude range of a different proof.

A third amplitude, $\alpha=471/500$, clears that obstruction. Its full replay covers $[.460505023,.46051]$ in 252 closed cells, with an extra contradiction margin above $1988/10^{12}$. At $t=.47$ there is a [different obstruction that survives every choice of carrier amplitude](GAUSSIAN_BLOCK.md), even allowing the remote and nonremote energies to be reweighted separately.
