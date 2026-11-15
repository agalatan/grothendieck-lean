<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/gpt-reviews/weak-k-20261015/package/strategy/TIED_GRAM_AUDIT.md (file dated 2026-10-15). Only this line was added. -->
# Audit and an exact tail format for `tied_gram_probe.py`

This reviews the exploratory file at `../root_probes/tied_gram_probe.py`. The secant matrix remains hypothetical, profile samples are floating approximations, and no solver result in this directory is a certificate.

## Correct normalizations

Write v=E|q|², t=|q|²/v, and C=Pi(q|q|²). The two tied profiles are

    T_A(q)=F_A(q)+F_0(q)/3,
    T_B(q)=F_B(q)+F_0(q)/6.

The feature scaling by v, sqrt(m3), and the two empirical feature scales is consistent: the first two features represent a profile remainder divided by v^(3/2); the third represents C/(v^(3/2)sqrt(m3)). Multiplication of the objective by v³ restores the physical content norm. The bound `m3*X[2,2] <= cbudget(x)` is consequently dimensionless and correctly normalized.

The restriction to real symmetric X is safe for this objective. The unprojected radial Gram matrix is real. If a complex Hermitian projected Gram is feasible, its real part is feasible and has the same value against the real symmetric gain matrix.

The Laplace Stein block uses raw second moments, but its rate-zero test is the constant one. Its Schur complement therefore supplies the centering of phi automatically. It is weaker only because the test family is finite, not because the centering was omitted.

The fitted intercepts and slopes are merely a change of basis. They can be replaced by arbitrary exact rationals without any interpolation theorem; Pi(q)=0 gives the same target after recombination. In a final certificate only the true profile values and the dual coefficients need enclosures.

## A real error in the proposal tail

With a=.5592, b=.1432 and A=T−1,

    P_A(u) ~ −(a²+8ab+18b²)/(4u^(3/2)),
    P_B(u) ~ −(2a²+12ab+24b²)/(8sqrt(2)u^(3/2)).

The first coefficient in the original probe was `(2a²+24ab+72b²)/4`, which is incorrect. The second was correct. These are asymptotic expansions, not inequalities, and neither expression is a certified tail replacement.

For A, the angular expansion of phase(s+r exp(i theta)) has constant second-order term −r²/(4s²). Thus the coefficient is E[(T−1)T(a+bT)²]/4=(a²+8ab+18b²)/4. For B, its angular Fourier coefficient of exp(2i theta) is −r²/(8s²), yielding the displayed formula.

## Add the atom at infinity before trusting cutoff experiments

The probe uses weighted masses w=m/(1+t³). At t=infinity, a finite m-infinity contributes:

- zero to total probability, the first and second moments, and the payoff;
- m-infinity to the third moment;
- zero to every displayed Laplace Stein block entry;
- m-infinity z z^T to the feature Gram, where

    z = (−slope_A/scale_A, −slope_B/scale_B, 1/sqrt(m3), 0).

Therefore add a nonnegative scalar m-infinity, replace the third moment constraint by E t³+m-infinity<=m3, and add its Gram matrix. This is the exact recession direction in the compactified relaxation, not an approximation using a very large atom. The target recombination rows annihilate z, as they must because the tied profiles are bounded.

The dual constraint associated with m-infinity is precisely nonnegativity of the degree-six leading tail coefficient. It is necessary for an all-half-line certificate. It does not certify any finite interval or the actual asymptotic remainders.

An isolated floating rerun at v=.04, x=.5, hypothetical padding=.1, cutoff u=100 returned excess 8.6399808e−5 and m-infinity=.03438. The solver reported `optimal_inaccurate` and a maximum constraint violation of 6.39e−6. This is **not** a bound, and its apparent proximity to the target budget must not be used as evidence of certification.

## Uniform bounds on the tied profiles

Unlike separate triangle bounds, the A tying can be combined inside the phase expectation:

    |T_A(q)| <= E|T−2/3| = 2exp(−2/3)−1/3 < 347/500.

For B, Cauchy--Schwarz over the visible phase gives

    |T_B(q)| <= E sqrt(T²/2+1/36).

Apply weighted Cauchy--Schwarz with T+1/10. Polynomial division gives

    (E sqrt(T²/2+1/36))²
      <= (11/10)[9/20+(59/1800) exp(1/10) E1(1/10)]
      < (377/500)².

Here E1(c)=integral_c^infinity exp(−t)/t dt. The check `check_tied_profile_constants.py` encloses the quantities in Arb and verifies both rational upper constants. The enclosures are .69350090473185 and .75341824785130. These bounds hold for every q, with no tail or moment assumption.

## A whole-tail polynomial certificate

Use normalized unshifted features

    psi(t)=(T_A(sqrt(vt))/sqrt(v),
            T_B(sqrt(vt))/sqrt(v), t^(3/2), sqrt(t)).

For any fixed rational v>0, the first two components have bounds

    |psi_1|<=K_A=(347/500)/sqrt(v),
    |psi_2|<=K_B=(377/500)/sqrt(v).

Transform a PSD dual matrix from the fitted feature basis to this basis, obtaining Z>=0. Keep its signed (3,4) entry. With K=(K_A,K_B),

    psi* Z psi <= Z_33 t³ + 2 Re(Z_34)t² + Z_44 t
       +2 sum_i K_i |Z_i3| t^(3/2)
       +2 sum_i K_i |Z_i4| sqrt(t)
       + sum_ij K_i K_j |Z_ij|,                          (i,j<=2).

This is a valid upper bound with no profile evaluation in the tail. If v has no rational square root, replace each square-root coefficient by an outward rational enclosure.

The remote norm potential satisfies

    Phi_0(sqrt(vt)) <= 2sqrt(vt+L2),
    L2 = a²+4ab+6b².

For t>=R² and R>0 this is at most `2sqrt(v)sqrt(t)+L2/(sqrt(v)R)`. Thus a dual with moment polynomial y0+y1 t+y2 t²+y3 t³ has a lower tail certificate that is a polynomial of degree six in r=sqrt(t). Its coefficients before the bounded Stein remainder are:

    r^6: y3−Z_33
    r^4: y2−2 Re(Z_34)
    r^3: −2 sum_i K_i |Z_i3|
    r^2: y1−Z_44
    r^1: −2sqrt(v)−2 sum_i K_i |Z_i4|
    r^0: y0−sum_ij K_iK_j|Z_ij|−L2/(sqrt(v)R).

Include all objective constants and scalar prices in the constant coefficient with their actual signs. The exponential Stein terms can be bounded on t>=R² by maximizing t^k exp(−ct) at max(R²,k/c), with exact interval enclosures. Rate-zero terms are retained exactly. Finally translate r=R+x and check every polynomial coefficient is nonnegative, or use a stronger exact univariate positivity method.

This is a concrete way to convert a rationalized dual into an unbounded-tail proof. It still needs: a proved global secant matrix, accurate dual feasibility, interval enclosures of the actual profiles on [0,vR²], a full variance/kurtosis cover, simultaneous-sector handling, and a compatible epsilon flank cover. No finite grid or numerical residual is silently accepted.
