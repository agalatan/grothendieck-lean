# A grid-free Hilbert–Schmidt bound for the order-one Gaussian Hankel kernel

Agent-ID: codex-a7c4. Write $dm(r)=r e^{-r^2/2}dr$, $b(r)=\int J_1(rs)\,dm(s)$ and $H(r)=r e^{-r^2/2}/b(r)$. The squared Hilbert–Schmidt norm is $I(H,H)$ for the symmetric bilinear form
$$I(A,B)=\int_0^\infty\int_0^\infty J_1(rs)^2 A(r)B(s)\,dr\,ds.$$
We prove $I(H,H)<1.82$. All numerical comparisons below use rational arithmetic in the accompanying checker.

**A one-dimensional majorant.** The angular representation of $J_1$ and the derivative of the Gaussian cosine transform give
$$b(r)=\sqrt{2/\pi}\,r\int_0^1 \frac{u^2 e^{-r^2u^2/2}}{\sqrt{1-u^2}}\,du>0\quad(r>0).$$
Indeed $J_1(x)=(2/\pi)\int_0^1u\sin(xu)(1-u^2)^{-1/2}du$, and $\int_0^\infty s e^{-s^2/2}\sin(ts)ds=t\sqrt{\pi/2}\,e^{-t^2/2}$. The integral of $u^2/\sqrt{1-u^2}$ is $\pi/4$ and its normalized mean of $u^2$ is $3/4$. Jensen's inequality gives
$$H(r)\le\sqrt{8/\pi}\,e^{-r^2/8} < (8/5)e^{-r^2/8}.$$

Set $U(r)=r^3e^{-r^2/2}+4r e^{-3r^2/2}$, $\delta=(H-U)_+$, and $E=\int r^2\delta(r)dr$. Then
$$E\le 159561/6250000 <0.026.$$

1. To prove $U\ge H$ on $[3/5,9/4]$, it suffices by Jensen to show $r^3 e^{-3r^2/8}+4re^{-11r^2/8}\ge8/5$. Split this range at $4/5,11/10,11/8,5/3$, and choose $j=1,3,5,7,8$ on the five consecutive intervals. Weighted AM–GM, with $\lambda=j/8$, bounds the left side below by
   $$f_j(r)=\left(\frac{8r^3}{j}\right)^{j/8}\left(\frac{32r}{8-j}\right)^{(8-j)/8}e^{-(11-j)r^2/8},$$
   with the middle factor interpreted as $1$ for $j=8$. The derivative of $\log f_j=(1+j/4)\log r -(11-j)r^2/8+\mathrm{const}$ has precisely one zero, a maximum. Its minimum on each interval is therefore at an endpoint. At all ten endpoints $f_j(r)^8>(108/100)(8/5)^8$, already using the positive rational lower bound $\sum_{k=0}^9[-(11-j)r^2/8]^k/k!$ in place of the exponential in $f_j$. The checker replays these ten rational inequalities directly.
2. For $r\ge9/4$, the substitution $v=ru$ and $(1-x)^{-1/2}\ge1+x/2$ show that $b(r)\ge 1/r^2$ as soon as $\int_0^r v^4e^{-v^2/2}dv\ge2r^2\int_r^\infty v^2e^{-v^2/2}dv$. Here $\sqrt{2/\pi}\int_0^\infty v^2 e^{-v^2/2}dv=1$. Integrating the left side only up to $9/4$, with $\sum_{k=0}^9(-v^2/2)^k/k!$ in place of its exponential, gives more than $2.21$. Integration by parts and $v/r\ge1$ on the tail bound the right side by $2(r^3+r)e^{-r^2/2}$, which decreases for $r\ge 9/4$ and is below $2.18$ at the endpoint. Hence $H\le r^3 e^{-r^2/2}$ there.
3. On $[0,3/5]$, $e^{-x}\ge1-x$ and the Jensen bound imply $H-U\le q(r)=8/5-4r+5r^3+r^5/2$. The cubic $8/5-4r+5r^3$ is positive at its minimum $r=\sqrt{4/15}$, so $\delta\le q$. Integrating $r^2q$ over this last interval gives the stated fraction.

**The Gaussian integral.** Put $F(a,b)=I(r e^{-ar^2/2},r e^{-br^2/2})$. For $a,b>0$,
$$F(a,b)=\tfrac12\left(\frac{ab+2}{\sqrt{ab(ab+4)}}-1\right).$$
To verify it directly, let $X,Y$ be independent centered Gaussian vectors in $\mathbb R^2$ with covariance matrices $a^{-1}I_2,b^{-1}I_2$, and $R_\theta$ be rotation by $\theta$. The characteristic function of their bilinear form gives $\mathbb E e^{iX\cdot(I-R_\theta)Y}=ab/(ab+2-2\cos\theta)$ by conditioning first on $X$. On conditioning on both radii instead, the first Fourier coefficient in $\theta$ is $\mathbb E[J_1(|X||Y|)^2]$ because the angular coefficient of $e^{it\cos\theta}$ at index one is $iJ_1(t)$, and the angular difference of $X,Y$ is uniform. The radial laws then identify this coefficient as $abF(a,b)$. Finally the first coefficient of $1/(ab+2-2\cos\theta)$ follows from $\cos\theta/(ab+2-2\cos\theta)=((ab+2)/(ab+2-2\cos\theta)-1)/2$ and the elementary circle average of $(c-2\cos\theta)^{-1}$, equal to $(c^2-4)^{-1/2}$ for $c>2$ (half-angle substitution).

Differentiation under the Gaussian integral therefore gives
$$I(U,U)=4F_{ab}(1,1)-16F_a(1,3)+16F(3,3)
=\frac{32}{25\sqrt5}+\frac{96}{21\sqrt{21}}+8\left(\frac{11}{\sqrt{117}}-1\right)<1.70561.$$
The integral representation of $J_1$ and $|\sin x|\le|x|$ give $|J_1(x)|\le x/2$. With $\int r^2U(r)dr=8+8/9$ and $H\le U+\delta$, positivity of the integrand proves
$$I(H,H)\le I(U,U)+\tfrac12 E(8+8/9)+E^2/4 <1.82.$$

Run `python3 -IB research/upper-channels/code/one-coordinate-ceiling-codex-a7c4/verify_algebra.py` from the repository root.
