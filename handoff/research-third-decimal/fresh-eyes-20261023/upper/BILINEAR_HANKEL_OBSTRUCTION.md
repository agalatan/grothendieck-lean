# A rigorous one-coordinate bilinear alternating obstruction

23 October 2026. Status: **paper proof with one replayed Arb interval inequality**.
No new Grothendieck upper endpoint is claimed. No Lean theorem was added.

## Result

Let Γ multiply the charge-one complex Gaussian chaos of bidegree (k+1,k)
by (-1)^k. For any measurable charge-one disk-valued responses F,G on C,

    |⟨F,ΓG⟩| ≤ γ† = 0.71195865977826… .

Equality holds exactly for F(z)=a phase(z), G(z)=b phase(z), where |a|=|b|=1,
up to Gaussian null sets. The absolute-value equality permits arbitrary a,b;
equality in the real-part version additionally requires a=b.

This is a global statement about **two different responses**, not a local
Hessian test or same-map numerical optimization. Scalar covariance contractions
and probability mixtures preserve the same ceiling. In particular every
residual certificate in this one-coordinate scalar-preprocessing class has
D≤γ†. This does not establish that D can attain γ†, or control two-coordinate
responses, matrix preprocessing, arbitrary non-charge-one responses, or the
entire class of complex Grothendieck rounding schemes.

## Proof reduction

Write F(re^{iθ})=e^{iθ}f(r), G(re^{iθ})=e^{iθ}g(r), with |f|,|g|≤1.
The radial Gaussian measure is dμ(r)=2r e^{-r²}dr. The order-one Hankel
transform gives the exact realization

    (Γg)(r)=e^{r²/2} ∫₀∞ s e^{-s²/2} J₁(rs)g(s)ds.

Indeed the weighted Laguerre basis rL_k^1(r²)e^{-r²/2} has Hankel eigenvalue
(-1)^k. One can check the normalization directly: its generating function is
r(1−t)^{-2}exp[−r²(1+t)/(2(1−t))]. Apply the elementary identity
H₁[s e^{-as²}](r)=r(4a²)^{-1}exp[−r²/(4a)] to that generating function;
the result is the same generating function with t replaced by −t.
Thus the bilinear form has symmetric real kernel, against dr ds,

    K(r,s)=2rs e^{-(r²+s²)/2}J₁(rs).

Put

    I(r)=∫₀∞ s e^{-s²/2}J₁(rs)ds = r C(r),
    C(r)=√(π/8)e^{-r²/4}[I₀(r²/4)−I₁(r²/4)],
    V(r)=∫K(r,s)ds=2r² e^{-r²/2}C(r)>0.

Here I₀,I₁ are modified Bessel functions; I(r) is a separately defined
integral, not modified Bessel I₀. Differentiating the Gaussian–J₀ integral
proves the displayed closed form. Its positive representation is

    C(r)=√(2/π)∫₀¹ v²e^{-r²v²/2}/√(1−v²)dv.

Alternatively, termwise integration of the absolutely integrable Bessel
series gives C(r)=√(π/8) ₁F₁(3/2;2;−r²/2); the beta-integral for this
hypergeometric function gives the positive representation directly.

In particular C is positive and decreasing. Also

    ∫V(r)dr = ⟨phase,Γphase⟩ = γ†.

For completeness this last identity follows directly by inserting the
positive representation of C and integrating r²e^{-(1+v²)r²/2}. The result is
2∫₀^{π/2} sin²(t)/(1+sin²(t))^{3/2}dt. Integration by parts identifies it
with ∫₀^{π/2} cos²(t)/√(1+sin²(t))dt, the stated γ†.

Define the normalized integral operator Q on L²(dr) by kernel

    q(r,s)=K(r,s)/√(V(r)V(s)).

It is real symmetric and Q√V=√V. Its squared Hilbert–Schmidt norm is

    H=∫₀∞∫₀∞ e^{-(r²+s²)/2} J₁(rs)²/[C(r)C(s)] dr ds.

The attached rigorous computation establishes

    H < 1.660888190174 < 2.

Hence Q is compact selfadjoint, has the exact eigenvalue 1, and every other
eigenvalue λ obeys |λ|²≤H−1<1. Therefore ||Q||=1 and the eigenvalue 1 is simple.
Putting u=√V f and v=√V g gives

    |⟨F,ΓG⟩|=|⟨u,Qv⟩|≤||u||||v||≤∫V=γ†.

Equality forces u,v into the span of √V, with full disk norm, proving the
stated equality classification.

The finer recorded replay gives H<1.551. Hence every nonconstant eigenvalue
has |λ|<√0.551<0.743. This also yields quantitative rigidity. With probability
measure dν=V(r)dr/γ† and m_f=∫f dν, m_g=∫g dν,

    |⟨F,ΓG⟩|/γ†
       ≤ |m_f||m_g|+0.743√((1−|m_f|²)(1−|m_g|²))
       ≤ 1−(0.257/2)[(1−|m_f|²)+(1−|m_g|²)].

Thus a near-optimal bilinear alternating pair must be close to constant
radial phases in this explicit weighted L² geometry. This estimate may help
control perturbative proposals; it is still only an alternating-score result.

## The sole certified numerical inequality

`fresh_upper_hankel_certificate.py` uses python-flint 0.9.0 / Arb at 96 bits. On
[0,6]² use rectangles with side 1/40. For each rectangle [a,b]×[c,d], the
integrand is bounded above using:

* C(r)≥C(b), C(s)≥C(d), from the positive representation;
* e^{-r²/2}≤e^{-a²/2}, likewise for s;
* rs∈[ac,bd]; at midpoint m and radius h,
  |J₁(rs)|≤|J₁(m)|+h because |J₁'|≤1;
* optionally the independent global bounds |J₁(x)|≤1 and |J₁(x)|≤x/2.

The derivative bound follows from the integer-order angular integral for J₁;
the x/2 bound follows from its Poisson integral. All Bessel values and
arithmetic in this finite sum are enclosed by Arb. The 57,600-rectangle bound is

    H_[0,6]² ≤ 1.660188842218043.

There is no omitted quadrature error: these are upper rectangles, not sampled
quadrature estimates.

For the full infinite tail, retain v∈[0,1/(1+r)] in the positive C integral:

    C(r)≥c/(1+r)³,  c=√(2/π)e^{-1/2}/3.

Using |J₁|≤1 and the union of r>R and s>R gives

    H_tail ≤ (2/c²) T(0)T(R),
    T(0)=4√(π/2)+5,
    T(R)≤e^{-R²/2}(R²+3R+5+4/R), R>0.

The latter follows from the elementary Gaussian moments and
∫_R∞e^{-r²/2}dr≤e^{-R²/2}/R. At R=6 the tail is at most
0.000699347955183. The JSON records the actual Arb enclosures and inputs.

## Scalar preprocessing and mixtures

For 0≤b≤1, the endpoint-contracted alternating operator is ΓT_b, with T_b
the real Gaussian Ornstein–Uhlenbeck contraction. T_b preserves the disk and
charge-one equivariance. Applying the proved inequality to F and T_bG
establishes |⟨F,ΓT_bG⟩|≤γ†. Negative or complex scalar contractions contribute
only an absorbable phase and |b|. A probability mixture remains bounded by γ†
by the triangle inequality. Combining with

    c₀−∑_{k≥1}|c_k| ≤ |∑_{k≥0}(-1)^k c_k|

shows the claimed obstruction for absolutely summable coefficient kernels.

## Numerical diagnostics, distinct from the proof

Gauss–Legendre discretizations with 100,200,400,800 nodes on [0,10] give
H≈1.3441043911614. The extremal nonconstant normalized eigenvalues are
approximately −0.51231543 and +0.25219687. These diagnostics suggested the
proof but are not used in it. In particular the 96-bit upper-rectangle bound
is deliberately much coarser and still has a large margin below 2.

## Replay

From the repository root:

    uv run --with python-flint python tools/fresh_upper_hankel_certificate.py \
      --output handoff/research-third-decimal/fresh-eyes-20261023/upper/hankel-certificate.json

The default mesh and radius are the recorded passing inputs. A finer replay
with `--mesh 60 --bits 128` is also supplied as an independent-precision and
subdivision check. Failing coarse meshes correctly raise an assertion.

## Primary-source check

HJM, *Sharper Bounds for the Complex Grothendieck Constant*, 21 September
2026, states the published-preprint baseline 1.4<K_G^C<1.404898554746 and
leaves its γ† conjecture open:
https://arxiv.org/html/2609.25462v1 . Its mixed schemes already allow two
different phase perturbations; the present claim is restricted to the radial
charge-one one-coordinate alternating functional.

HJM, *Primal/Dual Method for the Grothendieck Constant*, 7 October 2026,
is explicitly about the real constant and its real bounds:
https://arxiv.org/html/2610.10477v1 .

Naor–Regev, *Krivine schemes are optimal*, is likewise a real theorem:
https://arxiv.org/abs/1205.6415 . None supplies a complex all-dimensional
upper bound at 1/γ†. This proof does not claim such an upper bound.
