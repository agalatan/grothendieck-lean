<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/analytic/DISCRIMINANT_FEASIBILITY.md, 2026-11-15 13:27; Agent-ID: codex-91d4. -->
# Discriminant anti-concentration: a viable rank-zero cut, with limits

Agent-ID: **codex-91d4**. Refs #436. 15 November 2026.
**P, author only.** This follows up review comment 6893452582. The
algebra and Gaussian-law argument below are new analytic reductions,
not a review upgrade or a proof of the averaged Psi premise. No cover
or integral computation was run for this note. The companion
`verify_discriminant.py` checks its specified algebra/cap examples.

**Conclusion:** a useful dimension-free anti-concentration statement
does hold for a specific rank-zero defect, with a linear strip bound
stronger than generic Carbery-Wright. It survives arbitrary genuine
sharing. A second critical-value defect can vanish identically, so its
small-ball factor cannot be multiplied in. Rank-one zero curves also
survive outside the rank-zero strip: the argument does not justify a
uniform conditional inverse-norm bound there.

## 1. The relevant two defects

Condition on the remote fields, writing A=r_A, B=r_B and

```
X(z)=az+bz²conjugate(z)+q+(|z|²-.4)A
                     +s rho B+z²conjugate(B)/sqrt(2),
a=699/1250, b=179/1250, s=3/5, rho=5053/10000.
```

The Wirtinger derivatives are

```
X_z=a+2b|z|²+conjugate(z)A+sqrt(2)z conjugate(B),
X_barz=z(bz+A).
```

A zero of the **full differential** requires z nonzero, z=-A/b, and

```
D1=conjugate(A)(sqrt(2)B-A)-ab=0.                   (1)
```

Requiring X itself to vanish adds the critical-value condition

```
D0=2b²(q-.4A+s rho B)-abA+|A|²A=0,
2b²X(-A/b)=D0+A conjugate(D1).                      (2)
```

For A=0 the simultaneous derivative equations are impossible because
X_z(0)=a. Thus (1)-(2), with z=-A/b, describe rank-zero visible roots
without including the harmless z=0 factor of X_barz. They are not a
discriminant for every Jacobian-zero root: rank-one folds are different.

## 2. D1 cannot degenerate identically under genuine linear drivers

Put C=sqrt(2)B-A and c0=ab=0.08007744. A,C are centered holomorphic
linear forms, regardless of their sharing with q,Q,P. D1 has constant
monomial coefficient -c0, so it is never identically zero. More
quantitatively, with t=E[conjugate(A)C], Wick's identity gives

```
E|D1|²=|t-c0|²+||A||²||C||²
       >=|t-c0|²+|t|² >=c0²/2.                     (3)
```

There is also a cap-specific mean bound. Set
`h=(sqrt(3)-1)/2`, `V=||A||²+||B||²`. The two-by-two quadratic form
`sqrt(2)Re(conjugate(A)B)-|A|²` is at most h(|A|²+|B|²).
Hence `Re E D1<=hV-c0`. Since V<=.080051, this is less than -.05077.
The estimate remains valid on the domain left by the regional theorem;
no restriction on q or the odd sharing has been used.

## 3. Exact Gaussian strip law, stronger than a generic polynomial bound

The real quadratic form `Re(conjugate(A)C)` has Hermitian rank at most
two and at most one positive and one negative eigenvalue. Indeed,
it vanishes on the codimension-one subspace A=0, so its restriction
cannot have two strictly positive or two strictly negative directions.
After a unitary change of the remote Gaussian coordinates, its law is

```
lambda_plus E1-lambda_minus E2,
lambda_plus,lambda_minus>=0, E1,E2 independent Exp(1).
```

If lambda_plus=0, its value cannot lie near the positive number c0.
Otherwise its density for t>0 is exactly

```
exp(-t/lambda_plus)/(lambda_plus+lambda_minus).
```

For 0<delta<c0, therefore,

```
Pr(|D1|<=delta)
 <=Pr(|Re D1|<=delta)
 <= 2delta/[e(c0-delta)].                           (4)
```

The last step uses `lambda^(-1)exp(-t/lambda)<=1/(et)`.
Degenerate zero eigenvalues are covered by the same limit or directly.
This is a dimension-free bound for the actual remote polynomial D1;
it is not an assumption that repeated visible roots are independent
of the remote fields.

The energy cap sharpens it. Quadratic-form domination gives
`lambda_plus<=hV`. With L=hV, if `0<L<c0-delta`, monotonicity of
`exp(-t/lambda)/lambda` on `lambda<t` yields

```
Pr(|D1|<=delta) <= (2delta/L)exp(-(c0-delta)/L).      (5)
```

If V=0 the probability is zero. Near u-star, the total cap further
implies `V<=.080051-u-W`; this value may be used in L. Replacing V by
an upper bound is safe while L<c0-delta. No conditional independence
between the odd tensors and this event is asserted.

## 4. Quantitative connection to small visible derivatives

Let `Gamma(z)=|X_z|²+|X_barz|²`, `K0=891/500`, and suppose the remote
driver values obey `S_r=|A|²+|B|²<=K0`. Write r=|z| and E1=A+bz.
An exact elimination identity is

```
D1=-b conjugate(X_z)
   +conjugate(E1)(sqrt(2)B-A+bz)+b conjugate(z)E1.
```

Set C1=|A|+sqrt(2)|B|, so C1²<=3K0. If
`g=sqrt(Gamma)<=a/2`, then
`Re X_z>=a-rC1` implies `r>=a/(2C1)`; C1=0 cannot occur here.
Since `|E1|=|X_barz|/r`, the identity gives

```
|D1|<=b|X_z|+(C1/r+2b)|X_barz|
 <=sqrt[b²+(6K0/a+2b)²]g <=20g.                    (6)
```

The final coefficient is an exact rational check:
`6K0/a+2b=2826082/145625` and its square plus b² is below 400.
No visible-radius truncation is needed. Thus, for `20g<c0`,

```
Pr_remote(S_r<=K0 and some visible z has Gamma(z)<=g²)
 <=Pr_remote(|D1|<=20g),                            (7)
```

which is bounded by (4) or (5). Equivalently, outside the strip and
within this driver compact set the full differential norm is uniformly
bounded below (the coefficient inequality is strict when g>0).
This is not a lower bound for its smallest singular
value or for the Jacobian determinant.

Because Psi<=2|O|, a strip probability bound beta also gives

```
E[Psi(X,O) 1_(|D1|<=delta)]
 <=min(2sqrt(W beta),2 M4^(1/4) beta^(3/4)),          (8)
```

using the proved sharp fourth-moment envelope. This remains valid for
arbitrary sharing. For the illustrative energies W_Q=W_P=.005,
W_nu=0, a 50e-6 charge via (8) needs beta<=about5.66379e-6.
Formula (4) achieves this at delta=6.16e-7. This number is an example,
not a uniform strip width for all allowed odd energies. Formula (5)
can give materially larger widths when V is small.
The exact checker uses the conservative rational delta=6e-7 and
e>2.7, giving beta<=100/18017289; its cube is below the required
`1/5504000000000000`. The corresponding derivative threshold is
g=3e-8. This 50e-6 payoff assumes M4<=43/20000, not the whole cap.

## 5. Genuine degeneracies that must not be ignored

**D0 can vanish identically.** Let e=1/2000,
`A=sqrt(e)Y`, `B=kA`,

```
k=[a/(2b)+.4-e/b²]/(s rho),
q=-A(|A|²-2e)/(2b²).
```

This q is genuine H_(2,1), and substitution gives D0 identically zero.
Its energies are u=e³/(2b⁴), E_A=e, E_B=k²e. With Q energy .001,
the total is about .030984 and weighted energy about .0406452; it
lies outside the already closed regional half-space. Therefore there
is no uniform nondegeneracy bound for D0 and no justification for
multiplying separate D0 and D1 small-ball probabilities.

**Unsaturated resultants can be identically zero at simple roots.**
Take q=0 and `B=[.4/(s rho)]A`. Then X has a factor z, as does X_barz,
so their unsaturated resultant vanishes identically. Yet X_z(0)=a.
A relevant critical system must include X_z and exclude this artifact.
Likewise an angular quadratic discriminant carries a trivial r² factor
and cannot have a uniform raw normalization as r tends to zero.

**D1 away from zero does not remove rank-one zero curves.** At fixed
`A=.3`, `B=sqrt(2)A`, and `q-.4A+s rho B=0`,

```
X(z)=z[a+b|z|²+2Re(conjugate(A)z)].
```

Since |A|²=.09>ab, the real bracket has a zero circle, not passing
through z=0. Along that circle the differential has rank one and
`D1=.00992256`, well away from zero. The conditional integral of
1/|X| diverges logarithmically across the circle. This conditional
configuration embeds in genuine admissible data at Y=3 by taking
`A=Y/10`, `B=sqrt(2)Y/10`,
`q=[(.4-s rho sqrt(2))/70]Y(|Y|²-2)`. Here V=.03 and
u is about3.38e-7; adding Q energy .001 respects both caps and lies
outside the closed regional half-space. The conditioned sample Y=3
has Gaussian probability zero. Thus this refutes a **uniform conditional**
inverse-potential bound on the strip complement, not an averaged bound.
The finite Psi kernel remains well defined, and no counterexample to
the task's averaged statement is asserted.

## 6. Feasibility judgment and remaining obligation

The review suggestion is viable for cutting out the remote parameters
that can support nearly rank-zero visible maps. Equations (4)-(8)
provide an explicit law and quantitative conversion, without a new
compact (P) cover. They do not settle the remaining weighted average:
rank-one singularities, the ordinary directional integral, and the
odd exterior still need their own estimates with signed costs retained.

For context, [Carbery-Wright, Theorem 8, pp.244-245](https://intlpress.com/api/bgcloud-front/resource/pdf/volume/1806606513772851201-1806606513772851201-93160043ccb88dd0d3553c00979c15ce.pdf)
gives dimension-free polynomial anti-concentration for log-concave
measures, including its Banach-valued form. Its absolute constant is
unspecified and cannot be replaced by the separate Remez constant.
The explicit rank-two law above avoids that constant for D1. A general
resultant still requires its own nonzero norm and saturation analysis;
the existence of a formal discriminant does not supply those premises.

The all-sector averaged Psi statement remains open. This note changes
neither the reviewed regional theorem nor the ownership of (P).
