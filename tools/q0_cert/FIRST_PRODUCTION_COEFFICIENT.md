# A concrete first-band Gaussian coefficient target

Agent-ID: codex-cf82, 27 October 2026. Mathematical reduction and a tail
budget; neither a numerical coefficient enclosure nor a Lean theorem.

## The target and how it relates to the band

The first power-1 captured band contains the charge-one Hermite grades
q=0,...,25, i.e.

    sum_{q=0}^{25} (q+2)(q+1) = 6552

normalized complex coefficients. Its current norm cap is 4.000001e-11.
If every actual coefficient is proved within 4.9e-13 in complex modulus
of its stored exact dyadic center, Parseval gives an aggregate error at
most sqrt(6552)*4.9e-13 < 81*4.9e-13 = 3.969e-11. This leaves only
3.1001e-13 of band margin; all numerical error sources must be included.
This sufficient criterion is not a claim that the true residuals satisfy
it. No individual coefficient has been certified by this note.

The next band, q=26,...,50, contains 40,300 modes with cap 4.0021e-11;
its sufficient uniform modulus tolerance is below 1.9936e-13 per mode.
Even a method achieving 4.9e-13 in the first band would need to improve
or use a sharper nonuniform aggregate budget for this next band.

The smallest first test has q=c=d=0, Hermite function z, and stored center

    -2082728447489861/2^64 = -0.00011290493537329346... .

One useful test is to prove that the following actual coefficient I lies in
a complex disc of radius at most 4.9e-13 about this rational number. Succeeding
on that one coefficient is an integration pilot, not a band certificate.

## Two-real-variable formula

Let z,w be independent standard complex Gaussians and set

    s=|z|²,  F0=phase(z+κ(s)w),  κ(s)=sqrt(1+a²) vprof(s),
    φ=Im(conj(z)w) exp(-ε(s+|w|²)) P(s,|w|²,Re(conj(z)w)),
    α=1+ε,    β(s,u)=α+κ(s)²u².

Here P is the actual real phase polynomial, with its rational coefficient
list; κ is the actual degree-11 radial profile. The coefficient is

    I = E[conj(z) i φ F0].

By simultaneous rotation, take z=sqrt(s). Insert the phase Laplace
identity and set its positive parameter t=u². Complete the square in w.
For fixed s,u, introduce independent real Gaussians

    X ~ N(-κ(s)u² sqrt(s)/β, 1/(2β)),
    Y ~ N(0, 1/(2β)).

Their Y-odd contribution vanishes, leaving exactly

    I = -(2/sqrt(pi)) ∫_{s>0}∫_{u>0}
          exp(-αs-αsu²/β) [κ(s)s/β]
          E[Y² P(s,X²+Y²,sqrt(s) X)] du ds.                 (1)

The factor 1/β is the conditional Gaussian mass; there is no extra π
factor from the complex Gaussian density. The sign is from
`i Im(conj(z)w) (z+κw)` and the even-Y term. The exact conditional Wick
evaluation already present in the Lean repository is the starting point
for formalizing (1); the radial reduction and all real integrability
obligations must be proved rather than assumed.

Every moment in (1) is finite algebra. For one monomial
`d_abc s^a (X²+Y²)^b (sqrt(s) X)^c`, its contribution to the expectation
is

    d_abc sum_{h=0}^b binom(b,h)
      (2(b-h)+1)!! / (2β)^(b-h+1)
      * sum_{l=0}^{floor((2h+c)/2)}
          binom(2h+c,2l) (2l-1)!! / (2β)^l
          * (-κ u²/β)^(2h+c-2l) s^(a+h+c-l).

The double factorial (-1)!! is 1. Thus the apparent powers of sqrt(s)
cancel, and the integrand is a finite expression in s,u,κ(s),β and real
exponentials. β>=α>0 on the real integration domain.

## A compact domain and unbounded tails

The existing global phase certificate gives |φ|<=1. The radial-profile
norm bound in `SOFT_GAUSSIAN_MIXTURE.md` gives ||Z||₂<2 for Z=z+κ(s)w.
The phase Laplace representation in u is

    phase(Z) = (2/sqrt(pi)) Z ∫_0^∞ exp(-u²|Z|²) du.

Take the compact domain 0<=s<=80 and 2^-50<=u<=2^54. The full coefficient
loss outside it is <2.1e-14, as follows.

1. On s>80, |conj(z)iφF0|<=|z|, so Cauchy--Schwarz and the unit-rate
   exponential law of s give an error at most
   sqrt(∫_80^∞ s exp(-s) ds)=9 exp(-40)<1e-16.
2. For u<2^-50, discard the exponential and use Cauchy--Schwarz:
   E[|z||Z|] <= ||z||₂||Z||₂<2 and sqrt(pi)>1. The absolute error is
   below 4*2^-50<3.6e-15.
3. The phase-Laplace tail above U=2^54 has pointwise modulus
   erfc(U|Z|). Split at r=10^-15. On |Z|<=r, the previously proved
   universal small-ball estimate P(|Z|<=r)<=8r²(1+log(1/r)) and
   log(10^15)<35 give E[|z|1_{|Z|<=r}]<17e-15. On the complement,
   Ur>10 and erfc(Ur)<=exp(-100)<1e-40. We again use |φ|<=1 and
   E|z|²=1.

Adding the three costs gives <2.1e-14. These are written analytic bounds;
the actual mathematical inequalities and profile bound are not yet fully
proved in Lean for this application.

## Next certificate, and why the scalar pilot is not enough

The 2^104 dynamic scale can be handled by the 104 dyadic u intervals
`[2^k,2^(k+1)]` for k=-50,...,53, combined with an adaptive partition of
s in [0,80]. After u=2^k x, x lies in [1,2], while β remains positive.
Each real/imaginary integrand can in principle use certified interval or
Taylor-model evaluation. This is a concrete candidate for LeanCert, but
the required interval count, cancellation error and runtime are not known.
The actual profile coefficients include square roots and π through `nrmHalf`,
so a rational interval implementation must certify those inputs too, as
well as the prefactor 2/sqrt(π). Exact rational checks of the numerical
budget constants and both band counts are in `check_first_coefficient_budget.py`;
they do not establish the analytic inequalities or a coefficient enclosure.

The unit-parameter LeanCert pilot bounds an elementary slice of the base
conditional kernel; it does not enclose the two-variable integral (1),
its actual κ/P inputs, or even one stored production coefficient.
One must also verify the exact dyadic target and account for complex
normalization and final rounding. An actual enclosure of I within 4.9e-13
would be a test of the proposed numerical method, not yet a proof of the
6552-coefficient norm bound.
