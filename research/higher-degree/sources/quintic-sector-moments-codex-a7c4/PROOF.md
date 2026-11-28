# Degree-five payoff bounds from the visible coordinate of a cubic

Agent-ID: codex-a7c4. Paper proofs and standard-library rational verification, author only. This addresses [task #843](https://github.com/agalatan/grothendieck-lean/issues/843) in the [degree-five witness problem](https://github.com/agalatan/grothendieck-lean/issues/628).

In every finite complex Gaussian dimension, let $f,g$ be unimodular, $h=(f+g)/2$, $k=(f-g)/2$, and align the whole linear projection $P_{1,0}h=tZ$ with a standard proper Gaussian $Z$. At $t=0$ any choice of $Z$ works. The payoff under study is
$$
V=\operatorname{Re}\langle f,(P_{1,0}-.78P_{2,1}+.0779P_{3,2})g\rangle .
$$
Write $U=P_{2,1}k$, $R=\mathbb E_Z U$ and $H=U-R$. All energies here are squared norms before multiplication by the game coefficients.

| Hypothesis on the actual pair | All amplitudes through | Payoff |
|---|---:|---:|
| All six cubic sectors unrestricted | $.408$ | $V<1/1.4023-10^{-5}$ |
| All six cubic sectors unrestricted | $.407$ | $V<1/1.4025-10^{-5}$ |
| All six cubic sectors unrestricted | $.405$ | $V<1/1.403-10^{-5}$ |
| Full normalized cubic fourth excess $\chi\le.00060$ | $.649$ | $V<1/1.4025-10^{-5}$ |
| $\chi\le.000120$ | $.68$ | $V<1/1.4025-10^{-5}$ |
| $\chi\le.0000015$ | $.694$ | $V<1/1.4025-10^{-5}$ |
| $\|H\|_2^2\le.002$ | $.677$ | $V<1/1.4025$ |
| $\|H\|_2^2\le.0001$ | $.691$ | $V<1/1.4025$ |

**Unrestricted sectors.** The mass $\|k\|_2^2$ restricts the sector energies of any pair that violates the target. Test the same projected cubic on a second rational support direction. Six new Stein profiles exploit both the resulting weighted sector constraint and the total energy of the five nonremote sectors. The sector vector also bounds the mixed term of the elliptic fourth moment. The all-sector proof covers every intermediate amplitude, direction and fourth excess. [Mass inequality](MASS_GRAM.md) · [Stein support and exact cover](SPIKED.md) · [Mixed fourth moment](MOMENTS.md)

**A sharp restriction inequality.** When $U\ne0$ put $Q=U/\|U\|_2$, $x=\|R\|_2^2/\|U\|_2^2$ and $\chi=\mathbb E|Q|^4-2$. For $R\ne 0$, let $\chi_R$ be the normalized fourth excess of $R$. Then
$$
             x^2\chi_R+2(1-x)^2\le\chi.
$$
At $x=0$ read the first term as zero. The proof uses the two real axes of the visible complex coordinate. A family of finite-dimensional cubic polynomials attains the coefficient two in the limit at every $x<1$, for any fixed remote cubic on independent coordinates. More generally, averaging out a complex subspace of dimension $d$ decreases unnormalized fourth excess by at least $2/d$ times the square of the lost variance, also sharp. Applied to the diffuse cubic lift, the inequality bounds $t+l\|R\|_2$ for every positive slope $l$ using only the fourth excess of the original $Q$. [Restriction theorem and sharpness](RESTRICTION.md) · [Payoff at small full fourth excess](MOMENTS.md) · [Extended amplitude intervals](SHAPE_DEFORMED.md)

**Small nonremote energy.** The angular average of $|1+r e^{i\phi}|$ is at most $1+.299r^2$ for all $r$. A second comparison simultaneously charges the cubic overlap in $h$ and the quintic overlap in $k$. It accounts for the possible interior maximum over the remote energy. Each energy ceiling in the table allows any norm and direction for the remote component compatible with the actual pair. [Angular bound](ANGULAR.md) · [Deformed support test](DEFORMED.md)

**What remains for NodeCaps.** At target 1.4023, a violating H2 pair must have $.408<t<.649$ and $\chi>.00060$, as well as positive lower bounds on both its remote and nonremote energies from the [earlier comparison](../quintic-mixed-sectors-codex-a7c4/GRAM.md). Removing the new Stein direction or the new mixed-moment bound causes explicit failures of the scalar comparison. Even with both present the frozen comparison still fails at $t=.4085$, $\sqrt\chi=2.305$. This locates a loss in the relaxation. It does not exhibit a physical counterexample. The other design hypotheses and the global scalar payoff remain open. [NodeCaps roadmap](../quintic-node-pilot-codex-a7c4/ROADMAP.md)

Run the [full replay](../../code/quintic-sector-moments-codex-a7c4/replay.py) from the repository root. It checks the predecessor's prefix and Rice inequalities, all new comparisons, and the corruption and tensor controls. Only Python's standard library is needed.

```sh
python3 -IB -O research/higher-degree/code/quintic-sector-moments-codex-a7c4/replay.py
```
