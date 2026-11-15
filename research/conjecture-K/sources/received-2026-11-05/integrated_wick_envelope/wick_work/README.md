<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/integrated_wick_envelope/wick_work/README.md (file dated 2026-11-05). Only this line was added. -->
# Integrated Wick envelope: exact reduction, rigorous tail, numerical compact-region evidence

2026-11-05. **Status: partial research result, not a proof of the mixed-family content inequality or Conjecture K.**

The new candidate is a fixed affine envelope giving constant 0.22. Its unbounded tail is proved below. Its compact region has been checked numerically on grids at three rows; a continuum interval certificate is still missing.

## Setup and exact identities

All complex Gaussians have E|X|²=1. The visible L=Z(a+b|Z|²) is independent of the remote variables. Set B(v)=2E|L+sqrt(v)W| and B0=2E|L|, Phi(s)=2E|L+sqrt(s)|-B0. Write F_A(z)=z g(|z|²). In the scripts, `g(h)` means the mathematical g(h²), and `phi(h)` means Phi(h²).

Let q=X[c(R-2)+P], R=|X|², EP=0, p=E|P|², u=2|c|²+p. P is independent of X and need not be a quadratic form. Set

I_c(z)=integral_0^infinity exp(-r) Phi(r|c(r-2)+z|²) dr,

T_c(z)=integral_0^infinity r exp(-r)[c(r-2)+z] g(r|c(r-2)+z|²) dr,

H_c,u(z)=B(u)-B0-I_c(z)+B'(u)(|z|²-p)+2u B''(u) Re(conj(c)z).

Then Delta=B(u)-F(q)=E H_c,u(P), and C(q)=|E T_c(P)|. All other remote first-chaos coefficients vanish on averaging the X phase.

With h_r(v)=Phi(rv)/r and d_u,r(v)=h_r(u)+Phi'(ru)(v-u)-h_r(v), the R24 identity becomes

H_c,u(z)=|c|² K(u)+integral_0^infinity r exp(-r)d_u,r(|c(r-2)+z|²) dr,

K(u)=-2uB''(u)-u²B'''(u)>0.

The positivity follows from concavity of Phi and the positive Gaussian-mixture representation of K. In particular H>0 for c!=0. The linear term is essential: integral r exp(-r)(r-2)Phi'(ru) dr=uB''(u).

Define lambda(u)=J(u)/2=integral r exp(-r)g(ru) dr. Since EP=0,

C(q)² <= Delta E[|T_c(P)-lambda(u)P|²/H_c,u(P)].

## Fixed envelope candidate

Let f=2|c|²/u. For the three rows, the candidate is

|T_c(z)-lambda(u)z|² <= H_c,u(z)[9/100+(13/100)|z|²/p],

for 0.00551<=u<=0.0463 and 1/16<=f<=15/16. The phase of c may be removed by rotating q and P, so the computations take c>=0 real and retain all phases of z. Conjugation symmetry reduces the phase grid to [0,pi].

**If the pointwise envelope is certified**, taking expectation proves C(q)²<=11/50 Delta for every centered independent P with finite variance. No fourth or sixth moment is required. The factor 11/50 is 0.22<0.24.

The pointwise envelope on |z|<=4 is NOT proved by this bundle.

## Rigorous analytic tail: |z|>=4

This part holds for all p>0, u<=0.0463 and 2|c|²+p=u at the three rows; it does not require the mixing-fraction restriction.

1. The Gaussian-scale-mixture representation yields B'(u)>=sqrt(pi)/(2sqrt(u+E|L|²))>4/5, because u+E|L|²<1 at all rows. Here E|L|²=a²+4ab+6b². Also B'(u)<=B'(0)<=sqrt(pi)/(2a)<5/3.

2. Complete monotonicity of -J gives |lambda(u)|<=|J(0)|/2. Since J(0)<0,
   -J(0)<=E[1/(sqrt(T)(a+bT))]<=sqrt(pi)/a, so |lambda(u)|<5/3.

3. Let A0=-B''. The existing positive zero-variance formula gives

   A0(u)<=A0(0)<=sqrt(pi)/4 [a^(-3)+4b a^(-4)+3b² a^(-5)]<7,

   using a>=11/20 and b<=4/25. All rows obey these bounds.

4. |F_A(w)|<=E|T-1|=2/e, hence |T_c(z)|<=E sqrt(R) (2/e)=sqrt(pi)/e<2/3.

5. Triangle inequality gives I_c(z)<=sqrt(pi)|z|+2sqrt(2)|c|. The latter term uses E[sqrt(R)|R-2|]<=sqrt(E[R(R-2)²])=sqrt(2).

Because |c|<.153 and B(u)-B0>=0, these estimates imply, with h=|z|,

H_c,u(z)> (4/5)h²-2h-3/5.

For h>=4 this is >h²/4. Therefore

|T_c(z)-lambda(u)z|²/H_c,u(z)
 <4(2/(3h)+5/3)² <=121/9.

But for h>=4 and p<=463/10000,

9/100+(13/100)h²/p >= (13/100)*16/(463/10000) >121/9.

This proves the entire tail. `node wick_work/exact_tail.mjs` checks the rational constant comparisons using BigInt arithmetic. It checks those comparisons, not the underlying analytic identities.

## Numerical evidence and limitations

Profiles (a,b): peak (.5592,.1432), flank (.56,.1467), upper (.573,.152).

`validate.py` uses 9 energies in [.03,.0463], 17 fractions in [1/16,15/16], 360 radial-grid construction points (duplicate endpoints removed), and 41 phases. The radial domain extends to |z|=4 for each p. `validate_low.py` adds 6 energies in [.00551,.027] at the same fractions. The grid leaves intervals between energies and fractions unchecked as a continuum.

For each profile, 320-node Gauss-Laguerre quadrature integrates the Wick radius. Phi and g are tabulated from adaptive quadrature of exact elliptic-integral angular averages, then interpolated on a logarithmic radius grid. Tables contain 1200 points. Some small-radius table integrals issue SciPy roundoff warnings. These are floating computations, without outward error bounds.

The high-energy minimum observed margins Q-|T-lambda z|²/H are:

- peak: 0.00373872717;
- flank: 0.00396270165;
- upper: 0.00682288792.

All three minima occur at u=.0463, f=15/16, z=0 on the grids. The peak lower-fraction boundary f=1/16 has a tested margin about .00688 near |z|²/p=2.14 and arg(z)=80 degrees.

The five worst parameter samples per run are independently reintegrated in the Wick radius with adaptive quadrature. They reuse the same Phi/g interpolation table, so this is a radius-integration cross-check, not an independent certification of the scalar kernels. Earlier 180-node versus 320-node runs agree closely. Consult the JSON results for actual discrepancies.

No coefficient-law simulations are used to test the fixed envelope: the pointwise z-domain is tested directly. Nevertheless a finite floating grid is not a continuum proof.

## What remains

- Certify the fixed envelope on the compact four-real-variable domain (u,f,Re z,Im z), using interval kernel bounds and a domain subdivision. The tail is already proved.
- The remaining small-Wick fraction f<1/16 requires a different estimate, likely the quadratic-form moment constraints and a quantitative bridge from the R23 c=0 theorem.
- The existing endpoint result applies when f>=15/16 on u in [.03,.0463]; this bundle does not reprove it.
- None of this handles the other four one-driver shells or arbitrary remote cubics.

The exploratory directional moment-envelope fits near f=0 are not uniformly below .24, even after refining tau bins. Those fits are recorded, not claimed as certificates or counterexamples. In particular continuity of the actual functional does not justify passing uniformly through the pointwise quotient at c=0, where H vanishes on |z|²=p.

## Replay

Requirements: Python 3 with NumPy/SciPy; Node.js for exact rational tail checks. Run from the parent of `wick_work`:

    node wick_work/exact_tail.mjs
    OPENBLAS_NUM_THREADS=1 WICK_ROW=peak python wick_work/validate.py
    OPENBLAS_NUM_THREADS=1 WICK_ROW=flank python wick_work/validate.py
    OPENBLAS_NUM_THREADS=1 WICK_ROW=upper python wick_work/validate.py

Repeat with validate_low.py for the low-energy scans. Existing scalar tables are reused; deleting the corresponding scalar_ROW.npz rebuilds them. The other scripts reproduce exploratory optimization fits, not proofs. Scripts using a default output filename are intended for the peak row.
