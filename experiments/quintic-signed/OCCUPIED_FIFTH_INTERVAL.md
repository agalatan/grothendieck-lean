# Lower bounds on the full fifth difference near a remote cubic

Let $h=(f+g)/2$, $k=(f-g)/2$ for arbitrary disk-valued physical responses. Align a standard Gaussian $Z$ with the visible first projection of $h$. Write $t$ for its correlation, $\tau$ for the remote cubic projection norm of $k$, $F=P_{3,2}$ and $\Delta=\|Fh\|^2-\|Fk\|^2$. At $t\ge.83835$,

| Lower threshold on $\tau$ | Strict lower bound on $\Delta$ |
|---:|---:|
| .2873455 | −.009726 |
| .287345 | −.009806 |
| .28732 | −.012693 |
| .287 | −.022374 |

Finite-dimensional examples enter each slice by the [Gaussian cubic-sum construction](OCCUPIED_FIFTH_SIGN.md). The independent upper estimate there gives $\Delta\le-.00082312$ at $\tau\ge.287345$. Both endpoints of the resulting interval apply to every physical pair in the indicated slice, including all its visible and remote fifth components. Each row also holds on the full half-plane where $t+.3425\tau$ is at least the value at its displayed thresholds and $\tau>0$. At the [binding cell-23 amplitude](JOINT_STEIN_SHOULDER.md) $t=27441/32768$, the two estimates combine to $-.012307<\Delta\le-.00136788$ whenever $\tau\ge.290007$. The Gaussian limit gives finite examples in the corresponding rectangle because $(27441/32768)^2+.290007^2<\pi/4$.

## A template in the opposite direction

Let $q$ be the normalized remote cubic along the projection of $k$, and put $y=|q|$, $\lambda=.3425$. Write $h_*,k_*$ for the half-sum and half-difference of the phases of $Z\pm\lambda q$. As in the [conditional Hermite expansion](FULL_FIFTH_PLANES.md), $c_{ij}(\lambda y)$ denotes the coefficient of $\mathrm{ph}(Z+\lambda y)$ on the normalized visible Hermite $H_{ij}$. A complex shift multiplies this coefficient by $\exp(i(1+j-i)\arg q)$.

Only even visible total degrees occur in $k_*$. For visible indices $(0,0),(2,2),(3,1)$ the complementary remote bidegrees of a fifth test are respectively $(3,2),(1,0),(0,1)$. They are orthogonal to $q,q,\bar q$ of bidegrees $(2,1),(2,1),(1,2)$. Thus subtracting multiples of these *same physical cubics* leaves the corresponding projections untouched. Removing the common phase, set
$$
 U(y)=\sum_{ij\,\in\,\{02,11,20\}} |c_{ij}|^2
 +|c_{00}-.29154y|^2+|c_{22}-.09513y|^2+|c_{31}-.07767y|^2 .
$$
Remote projection contraction and orthogonal visible modes give $\|Fk_*\|^2\le\mathbb E U$. The visible fifth $H_{32}$ has constant remote complement and shift charge zero. With $H=.14231$, its coefficient gives
$$
 \|Fh_*\|^2\ge(\mathbb E c_{32})^2\ge\mathbb E V,
 \qquad V(y)=2Hc_{32}(\lambda y)-H^2.
$$

The shifted support slack $D=\mathbb E|Z+\lambda q|-t-\lambda\tau$ is nonnegative. By the [shifted inverse-radius estimate](SHIFTED_FIFTH_STABILITY.md), the sum of the squared fifth projection differences between $(h,k)$ and $(h_*,k_*)$ is at most $4\sqrt3D$. Apply Young's inequality to each cross term. For any $0<\eta<1$,
$$
 -\Delta\le\mathbb E[(1+\eta)U-(1-\eta)V]+4\sqrt3(1+1/\eta)D .
$$

## Exact quartics and fourth-excess cuts

The [exact scalar replay](code/reverse_fifth_planes.py) certifies the following majorants of $(1+\eta)U-(1-\eta)V$ for every $y\ge0$:
$$
 A+B y+C y^2+E y^4.
$$

| $\eta$ | $A$ | $B$ | $C$ | $E$ |
|---:|---:|---:|---:|---:|
| .015 | −.03362 | .01615 | .02737 | .000263 |
| .06 | −.03207 | .01660 | .02756 | .000289 |
| .15 | −.02898 | .01749 | .02793 | .000343 |
| .30 | −.02382 | .01900 | .02852 | .000437 |

On $[0,2],[2,12],[12,32]$ the mesh widths are respectively $1/512,1/128,1/8$. The shifted-Hermite beta integral is enclosed with directed rational Taylor bounds. On each subinterval, the mesh values pay the maximum possible loss below the linear interpolant, using the upper bound on the second derivative of the quartic minus the template times the squared mesh width divided by eight. The bounds $|c_{ij}|\le1$, $|\partial_y c_{ij}|\le4\lambda$, $|\partial_y^2c_{ij}|\le16\lambda^2$ follow from the visible raising formulas of the [conditional expansion](FULL_FIFTH_PLANES.md). For $y\ge32$, Bessel and the Euclidean norm of the three subtractions give $U\le(1+.32y)^2$, and $-V\le2H+H^2$. Every coefficient of the translated remaining quartic in $y-32$ is nonnegative.

Put $s=\mathbb E|q|^4-2$. Since $\mathbb E y\le.93$ and $\mathbb E y^2=1$, the integrated quartic is at most $A+.93B+C+E(2+s)$. The [quadrature Rice bound](GAUSS_QUADRATURE_RICE.md) gives $D\le.936766750-t-.3425\tau$. Applying its same cubic interpolant on a smaller shape interval also excludes $s\ge.002$ at the first two thresholds, $s\ge.02$ at the third, and $s\ge.4$ at the fourth. Minimize the four resulting rational prices on $-\Delta$ to obtain the table.

From the repository root run `python3 -IB -O experiments/quintic-signed/code/reverse_fifth_planes.py`.

Agent-ID: codex-a7c4

## The favorable sign at the second central contact

At $t\ge.862$, the same three cubic subtractions with shift $\lambda=.24$ give a **strictly positive** full fifth difference on finite occupied slices. A witness subtracting a positive multiple of $F$ gains that multiple times the displayed floor.

| $t$ at least | $\tau$ at least | Full $\Delta$ strictly above |
|---:|---:|---:|
| .86183138 | .206505 | .011010 |
| .862 | .2058 | .010738 |
| .862 | .2057 | .006193 |
| .862 | .2055 | .001448 |
| .862 | .2054 | .000173 |

Each row also holds on $t+.24\tau$ above its displayed value for $\tau>0$. The [same finite Gaussian cubic construction](OCCUPIED_FIFTH_SIGN.md) enters all five rectangles since the squared thresholds sum to less than $\pi/4$.

For the [exact favorable replay](code/favorable_fifth.py), replace the coefficients subtracted from $c_{00},c_{22},c_{31}$ by $.20860,.07308,.05967$ and the visible $H$ by $.16591$. The three quartic majorants $A+B y+C y^2+E y^4$ of $(1+\eta)U-(1-\eta)V$ are:

| $\eta$ | $A$ | $B$ | $C$ | $E$ |
|---:|---:|---:|---:|---:|
| .015 | −.03537 | .00444 | .01994 | .000046 |
| .06 | −.03374 | .00455 | .02014 | .000052 |
| .15 | −.03048 | .00478 | .02052 | .000063 |

Use the earlier directed Hermite enclosure and interpolation proof on $[0,2],[2,12],[12,32],[32,64]$ at respective mesh widths $1/512,1/128,1/16,1/2$. Beyond 64 the sum of squares of the three subtractions is below $.23^2$, giving the polynomial tail comparison. The [quadrature Rice estimate](GAUSS_QUADRATURE_RICE.md) bounds $D$ by $.911393002-t-.24\tau$. Its moment intervals give $s<.02,.02,.2,1,1$ in the five rows. This gives the stated strict claims without restricting any fifth component.
