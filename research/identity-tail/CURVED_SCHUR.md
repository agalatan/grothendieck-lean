# Quantitative interpolation of two completed Gaussian gates

Write the quadratic form of a row at normalized first coordinate as
$F_\theta(u)=a_\theta+2b_\theta^Tu+u^TD_\theta u$, where $\theta$ mixes two
rows and $a,b,D$ depend affinely on $\theta$. The symmetric $2\times2$
trailing blocks are positive definite at both endpoints, so $D_\theta>0$
on $[0,1]$. The weighted gate surplus $g(\theta)$ equals $\min_u F_\theta(u)$
minus an affine function.

Set $u_\theta=-D_\theta^{-1}b_\theta$ and $v_\theta=b'+D'u_\theta$.
Differentiating the stationarity equation gives $u'_\theta=-D_\theta^{-1}v_\theta$.
Differentiating the minimum once gives $g'=a'+2b'^Tu_\theta+u_\theta^TD'u_\theta$
up to the derivative of the affine baseline. Differentiating again gives
$$-\tfrac12 g''(\theta)=v_\theta^TD_\theta^{-1}v_\theta.$$
Invertibility holds in a neighbourhood of the interval by compactness. Write
$D_\theta=\bigl(\begin{smallmatrix}A&B\\B&C\end{smallmatrix}\bigr)$,
$\Delta=AC-B^2$, and $(p,q)^T=\Delta v_\theta$. A curvature floor $k$ holds
when $Cp^2-2Bpq+Aq^2-k\Delta^3\ge0$. This polynomial has degree at most six.
The exact replay checks nonnegativity of all seven degree-six Bernstein
coefficients. For rows 08/09 it gives $k=2019911/10^{10}$. At $\theta=1$ the
curvature is below $2019912/10^{10}$. Thus $\theta\mapsto g(\theta)+k\theta^2$
is concave on $[0,1]$, and
$$g((1-x)w+xz)\ge(1-x)g(w)+xg(z)+k x(1-x)(w-z)^2.$$

For endpoint prices $d_w,d_z$, restrict the same 945 physical chord overlaps to
$0\le\sigma\le s_0$ and re-evaluate the two discounts $d_w^0,d_z^0$.
Let $\delta$ be the scale factor common to the rows. At every actual scale
the interpolation improves the affine lower bound by at least
$$x(1-x)\min\{4(d_w^0-d_w),\,4(d_z^0-d_z),\,k(w-z)^2(s_0/\delta)^2\}.$$
For $\sigma\le s_0$, each endpoint gives its checked additional discount and
$x(1-x)\le1/4$. For $\sigma\ge s_0$, the curvature improvement is multiplied
by $\tau^2=(\sigma/\delta)^2$. Both rows use the same physical law throughout.

The prior amplitude schedule used row 13 alone throughout cell 34, from $567/640$
to $909/1024$, although row 14 overtakes it in this interval. Use the existing
clipped affine mixture of these two scalar rows on this cell. Its maximum is
below $0.70634864$. This uses the original scalar row deductions.

At the original nine weight locations use the 945-piece discounts rounded
downward at $10^{-13}$. The same fourteen transported ordinates then give,
for $s_0=21/100$, a hat cap $8829435313/12500000000$ and a lower candidate
$25000000000000/17831387166289=1.40202216276608\ldots$. Removing the
quadratic interpolation term but keeping identical inputs gives
$20000000000000/14265112386377=1.40202190198653\ldots$. The preceding sparse-dilation proof gave $200000000000000/142651138122623$.

With these outer segments fixed, the largest value outside the central
08/09 cells is attained in cell 14, using rows 06/07. The cap there exceeds
$0.70635442397$. Even a perfect 08/09 deduction therefore cannot give a
reciprocal above $1.40202293261$ on this schedule. Outward rounding the hat
cap to a multiple of $10^{-11}$ gives an outer ceiling of
$100000000000000/71325509501647$.

There is a tighter obstruction inside the central region for these fourteen
transported ordinates and the current affine weight schedule. In cell 23
take local segment parameter $497/1000$, hence amplitude
$t=17149473/20480000$. At that physical amplitude the replay directly maximizes
the scale quadratic on each of the 945 common pieces using the full mixed Schur
gain. Even using that exact pointwise discount everywhere on this fixed weight
path cannot yield an endpoint above $1.402022188814$. A larger improvement
requires changing the weight path, the potential bounds, or the shared-law
constraints. This is an obstruction for the stated envelope method.

## Lean and replay

The [curvature proof](../../Grothe/LowerAnalytic/StrongSchur.lean) verifies the
quotient $g=N/D$ against the two original headers, differentiates it twice,
and certifies the sign of the numerator of $(g+k\theta^2)''$ throughout the
closed unit interval. Its two-scale lemma transfers the curvature to the
common physical scale. The [price checker](../../Grothe/LowerAnalytic/SparseSteinPrices.lean)
certifies both sets of nine prices. Rounding both sets down to multiples of
$10^{-13}$ preserves the displayed cap and its maximizing cell. The
[curvature-adjusted rows](../../Grothe/LowerAnalytic/SparseSteinRows.lean)
and these numerical checks use only `propext`, `Classical.choice`, and
`Quot.sound`.

From the repository root, run
`python3 -IBO research/identity-tail/code/curved_stein_profile.py`.
The script checks the signed curvature, both rounded price tables, the
affine control, the curved maximum and the ceilings for the fixed outer segments and central weight path.

Agent-ID: codex-a7c4.
